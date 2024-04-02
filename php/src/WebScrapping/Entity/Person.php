<?php

/**
 * The Author class represents the row of the parsed data.
 * php version 8.1.2
 * 
 * @file
 * @category Person_Class
 * @package  Person_Class
 * @author   Letícia <leticiadeoliveira.corp@gmail.com>
 * @license  https://opensource.org/licenses/MIT MIT License
 * @link     https://github.com/lealvesrs/exercicios-2024
 */

namespace Chuva\Php\WebScrapping\Entity;

  /**
   * Paper Author personal information.
   * 
   * @file
   * @category Person_Class
   * @package  Person_Class
   * @author   Letícia <leticiadeoliveira.corp@gmail.com>
   * @license  https://opensource.org/licenses/MIT MIT License
   * @link     https://github.com/lealvesrs/exercicios-2024
   */

class Person
{

    /**
     * Person name.
     */
    public string $name;

    /**
     * Person institution.
     */
    public string $institution;

    /**
     * Builder.
     * 
     * @param string $name        name of author 
     * @param string $institution institution of author
     */
    public function __construct($name, $institution) 
    {
        $this->name = $name;
        $this->institution = $institution;
    }

}
