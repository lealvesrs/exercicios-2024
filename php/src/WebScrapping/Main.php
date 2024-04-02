<?php

namespace Chuva\Php\WebScrapping;

error_reporting(E_ERROR | E_PARSE);

/**
 * Runner for the Webscrapping exercice.
 */
class Main {

  /**
   * Main runner, instantiates a Scrapper and runs.
   */
  public static function run(): void {
    $dom = new \DOMDocument('1.0', 'utf-8');
    $dom->loadHTMLFile(__DIR__ . '/../../assets/origin.html');

    $scrapper = new Scrapper();
    $data = ($scrapper->scrap($dom));

    $scrapper->writeToXlsx($data);
  }

}
