<?php

namespace Chuva\Php\WebScrapping;

use Box\Spout\Common\Entity\Style\Border;
use Box\Spout\Common\Entity\Style\Color;
use Box\Spout\Writer\Common\Creator\Style\BorderBuilder;
use Box\Spout\Writer\Common\Creator\Style\StyleBuilder;
use Box\Spout\Writer\Common\Creator\WriterEntityFactory;
use Chuva\Php\WebScrapping\Entity\Paper;
use Chuva\Php\WebScrapping\Entity\Person;

/**
 * Does the scrapping of a webpage.
 */

/**
 * Scrapper class to scrapping of a webpage.
 */
class Scrapper {

  /**
   * Loads paper information from the HTML and returns the array with the data.
   *
   * @param \DOMDocument $dom
   *   Dom of html.
   *
   * @return array
   *   Return the data scrapped.
   */
  public function scrap(\DOMDocument $dom): array {
    $array = [];
    $anchors = $dom->getElementsByTagName('a');

    foreach ($anchors as $anchor) {
      if ($anchor->childElementCount > 0) {
        // Finding the title.
        $title = $anchor->firstElementChild->textContent;

        // Finding the name of all authors and their institutions.
        $spans = $anchor->getElementsByTagName('span');

        $authors = [];
        foreach ($spans as $span) {
          $name = $span->textContent;
          $institution = $span->getAttribute('title');

          $authors[] = new Person(
                $name,
                $institution
            );
        }

        // Finding the type of the paper.
        $div_type = $anchor->lastElementChild;
        $type = $div_type->firstElementChild->textContent;

        // Finding id paper.
        $div_volume = $div_type->lastElementChild;
        $id_paper = $div_volume->textContent;

        // Creating the paper obj.
        $paper = new Paper(
              $id_paper,
              $title,
              $type,
              $authors
          );

        $array[] = $paper;
      }
    }
    return $array;
  }

  /**
   * Writes xlsx from captured data.
   *
   * @param array $data
   *   Data scrapped.
   *
   * @return void
   *   No return
   */
  public static function writeToXlsx(array $data): void {
    $writer = WriterEntityFactory::createXLSXWriter();
    $writer->openToFile('./assets/results.xlsx');

    // Creating the header content.
    $header = ["ID", "Title", "Type"];

    $maxAuthorsCount = max(
          array_map(
              function ($paper) {
                  return count($paper->authors);
              },
              $data
          )
      );

    $i = 0;
    while ($i <= $maxAuthorsCount) {
      $newHeaderCell[] = "Author $i";
      $newHeaderCell[] = "Author $i institution";

      $i++;
    }

    $header += $newHeaderCell;

    // Config header style.
    $border = (new BorderBuilder())
      ->setBorderBottom(Color::BLACK, Border::WIDTH_THIN, Border::STYLE_SOLID)
      ->build();

    $style = (new StyleBuilder())
      ->setFontBold()
      ->setBorder($border)
      ->build();

    // Writing header.
    $row = WriterEntityFactory::createRowFromArray($header, $style);
    $writer->addRow($row);

    // Adding the paper rows.
    foreach ($data as $paper) {
      $row = [
        $paper->id,
        $paper->title,
        $paper->type,
      ];

      foreach ($paper->authors as $author) {
        $row[] = $author->name;
        $row[] = $author->institution;
      }

      $rowFromValues = WriterEntityFactory::createRowFromArray($row);
      $writer->addRow($rowFromValues);
    }
    $writer->close();
  }

}
