<?php

/**
 * Main class to Webscrapping exercice.
 * php version 8.1.2
 * 
 * @file
 * @category Main_Class
 * @package  Main_Class
 * @author   Letícia <leticiadeoliveira.corp@gmail.com>
 * @license  https://opensource.org/licenses/MIT MIT License
 * @link     https://github.com/lealvesrs/exercicios-2024
 */

namespace Chuva\Php\WebScrapping;
error_reporting(E_ERROR | E_PARSE);

/**
 * Runner for the Webscrapping exercice.
 * 
 * @category Main_Class
 * @package  Main_Class
 * @author   Letícia <leticiadeoliveira.corp@gmail.com>
 * @license  https://opensource.org/licenses/MIT MIT License
 * @link     https://github.com/lealvesrs/exercicios-2024
 */

class Main
{

     /**
      * Main runner, instantiates a Scrapper and runs.

      * @return string
      */
    public static function run(): void
    {
        $dom = new \DOMDocument('1.0', 'utf-8');
        $dom->loadHTMLFile(__DIR__ . '/../../assets/origin.html');

        $scrapper = new Scrapper();
        $data = ($scrapper->scrap($dom));

        $scrapper->writeToXlsx($data);
    }
}
