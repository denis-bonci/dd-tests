<?php

declare(strict_types=1);

namespace App\Controller;

use Symfony\Component\Routing\Annotation\Route;

class DefaultController
{
    #[Route('/')]
    public function index()
    {
        $a = null;
        $a->hello();
    }
}