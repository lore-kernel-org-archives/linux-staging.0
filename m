Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D012C81
	for <linux-staging@lists.linux.dev>; Thu, 11 Nov 2021 20:40:20 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id b15so28735618edd.7
        for <linux-staging@lists.linux.dev>; Thu, 11 Nov 2021 12:40:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UHiOh5VflVJlewhwxndCJDln8UkcHoMZN9XPghDq7D4=;
        b=I4UbRBtt0cBjzwu4Bn/HDqvsbMNEHt1Pw/NNHD6myvj3v5WZRMKGb4dr+Z1DeV1H2D
         vklfvCJq3zph0TmHJCmiit64psuWEfdV1+m0vHzAGLBiD1mRyl6Z2/mHJJgqmQuH6YuC
         I+MVnh3NHDOszExYn8dVoDfpWjvFKIMcFIs4tJpNlPbZrQzBNlq7auqMvi+t3Yf3pZGC
         HFrI6YlwvT/Zu6peEP1a02rJImUizrdus7q/X8/6nCbzNcTb7u542ChvaExPSWGjFNdc
         YX6xeN4muzTD1oLl4aAi3rsstXF7teLH8RgUf71bxRHb8Avf5TXmYXPYAow2sQWILsWY
         LQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UHiOh5VflVJlewhwxndCJDln8UkcHoMZN9XPghDq7D4=;
        b=OUbpduoxAGSS3mqXW8S1ovKq2TyGAwvU9Gqqk1i8SC4n8F3Ky5C6ZrhaJWTEire+h1
         Sx9ATVcK5KGovPYeJZ7YFAQq5+eZp7nVzAf3vGCcXRqjoxR7+z8d6qjisYslxiOEjsBm
         q/wV31Hoq7Bkd33njXcoRadQolRL7jgu4q2gV3mYlUbXH/AGsG2PGITPEc+RzpjtsN5L
         nbexfJkAuBcYxXobaBrUKIdd6JRykFhLkINAaVyXvLzNjkw1ZFlrb0WHfdVMcW/f/6dA
         QUr+ekp9czqfGvXljHPlOadCgh0W8aXA+tIgyevdFPZWeF4qnCcEU6yFn/gQDLCw/IBD
         EOWQ==
X-Gm-Message-State: AOAM531wkcGAxc+ECCIvOaz6aqPRGDt0R3JoTYmdHri+4qCvc0jYDA0P
	hfGsKFtp/K9I2q86TFJXjQy8w9ggsZNVfjkohf0=
X-Google-Smtp-Source: ABdhPJzLVpIUZ/n4T+ZkvgG7T7voRmVdPypl7OvLEUnWiUC8iD7a8c95VhPA9yxkjeifTIsCkgFdsEhzozGDdDV3K38=
X-Received: by 2002:a05:6402:1801:: with SMTP id g1mr13510467edy.107.1636663218553;
 Thu, 11 Nov 2021 12:40:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20211017161958.44351-1-kitakar@gmail.com> <20211017161958.44351-5-kitakar@gmail.com>
 <20211026092637.196447aa@sal.lan> <1a295721fd1f1e512cd54a659a250aef162bfb6f.camel@gmail.com>
 <20211028123944.66c212c1@sal.lan> <af7cdf9de020171567c2e75b713deb2ed073e4e3.camel@gmail.com>
 <20211101141058.36ea2c8e@sal.lan> <ab48bd8c69273e8b18ff652f3615b2698a777092.camel@gmail.com>
 <YY1ATbqn2fAg8Oct@smile.fi.intel.com> <20211111193742.174f0b26@sal.lan>
In-Reply-To: <20211111193742.174f0b26@sal.lan>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 11 Nov 2021 22:39:34 +0200
Message-ID: <CAHp75VfLPcKimwMD6-QwL9aQ5EFJke1Bkzfq+-e=aZMk6JzH_A@mail.gmail.com>
Subject: Re: [PATCH 04/17] media: atomisp: pci: do not use err var when
 checking port validity for ISP2400
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Tsuchiya Yuto <kitakar@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nable <nable.maininbox@googlemail.com>, 
	Fabio Aiuto <fabioaiuto83@gmail.com>, "andrey.i.trufanov" <andrey.i.trufanov@gmail.com>, 
	Patrik Gfeller <patrik.gfeller@gmail.com>, Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 11, 2021 at 9:41 PM Mauro Carvalho Chehab
<mchehab@kernel.org> wrote:
> Em Thu, 11 Nov 2021 18:09:49 +0200
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> escreveu:
> > On Thu, Nov 11, 2021 at 11:34:23PM +0900, Tsuchiya Yuto wrote:

...

> > I just realize that we may do at some point
> >
> > cflags-y += -Werror
> >
> > to avoid changes that breaks build (with warnings).
>
> No need. Upstream already added Werror. It is just a matter of
> adding:
>
>         CONFIG_WERROR=y
>
> to .config.

Unfortunately this is not gonna work with `make W=1`.
https://lore.kernel.org/lkml/CAHp75Vef8QW3Y0yA702KUqPDHNRLN0kCv06=cgPpgPbUeAb-dw@mail.gmail.com/T/#u

> > And also I would suggest
> > to run build with `make W=1 C=1 CF=-D__CHECK_ENDIAN__ ...`
>
> Yeah, that's good. On media, we also require no (unjustified) sparse
> and smatch warnings.

-- 
With Best Regards,
Andy Shevchenko
