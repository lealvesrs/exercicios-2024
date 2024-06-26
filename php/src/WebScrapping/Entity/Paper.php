<?php

namespace Chuva\Php\WebScrapping\Entity;

/**
 * The Paper class represents the row of the parsed data.
 *
 * @category Paper_Class
 * @package Paper_Class
 * @author Letícia <leticiadeoliveira.corp@gmail.com>
 * @license https://opensource.org/licenses/MIT MIT License
 * @link https://github.com/lealvesrs/exercicios-2024
 */
class Paper {

  /**
   * Paper Id.
   *
   * @var int
   */
  public $id;

  /**
   * Paper Title.
   *
   * @var string
   */
  public $title;

  /**
   * The paper type (e.g. Poster, Nobel Prize, etc).
   *
   * @var string
   */
  public $type;

  /**
   * Paper authors.
   *
   * @var \Chuva\Php\WebScrapping\Entity\Person[]
   */
  public $authors;

  /**
   * Builder.
   *
   * @param string $id
   *   Id paper.
   * @param string $title
   *   Title of paper.
   * @param string $type
   *   Type of paper.
   * @param array $authors
   *   Authors of paper.
   */
  public function __construct($id, $title, $type, $authors = []) {
    $this->id = $id;
    $this->title = $title;
    $this->type = $type;
    $this->authors = $authors;
  }

}
