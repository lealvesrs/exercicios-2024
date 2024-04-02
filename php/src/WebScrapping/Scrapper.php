<?php

namespace Chuva\Php\WebScrapping;

use Chuva\Php\WebScrapping\Entity\Paper;
use Chuva\Php\WebScrapping\Entity\Person;

/**
 * Does the scrapping of a webpage.
 */
class Scrapper
{

  /**
   * Loads paper information from the HTML and returns the array with the data.
   */
  public function scrap(\DOMDocument $dom): array
  {
    $array = [];
    $anchors = $dom->getElementsByTagName('a');

    foreach ($anchors as $anchor) {

      //finding the title
      $title = $anchor->firstElementChild->textContent;

      //finding the name of all authors and their institutions
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

      //finding the type of the paper
      $div_type = $anchor->lastElementChild;
      $type = $div_type->firstElementChild->textContent;

      //finding id paper
      $div_volume = $div_type->lastElementChild;
      $id_paper = $div_volume->textContent;

      //creating the paper obj
      $paper = new Paper(
        $id_paper,
        $title,
        $type,
        $authors
      );

      $array[] = $paper;
    }

    return $array;
  }
}
