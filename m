Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD20F4A0A
	for <linux-staging@lists.linux.dev>; Wed, 13 Jul 2022 20:15:01 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-31c8bb90d09so124499247b3.8
        for <linux-staging@lists.linux.dev>; Wed, 13 Jul 2022 13:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JcckXV4vcsS2l/x+/u953cckoakHIp9f7/cP8rerxZE=;
        b=anlOJCiMrQgqUL3vsJNDj/PuCveRb4PSCTzrBgey28HdzAIh2iRanGaXPZj+BvoCIC
         aZiKguqPQq9NuLjBsPcHaEgTOrayU2x0jPiljTZMV8qiuxXdLzcgYZ2+NG7R8yU98Ffp
         e1QmJlYMpF7fIG/l8zGF9Z7myRnNDKme02Mr+6JpS3HdzeyjdgkLaDUfvUlkQbgOjOxs
         2x9/mZch870lKcWV45aNseqRHnH7bAKkWganEVdY8yPD9cqsd9Fy3MY23D6xtKSoNF+5
         ryTR5ZFM7JBBAWjRCv79rmJJ6GHP54I2QxFvPke4XNNd4QeV/QtlgnNg0dFRks9fMpDc
         QnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JcckXV4vcsS2l/x+/u953cckoakHIp9f7/cP8rerxZE=;
        b=0K7ZtjiUz586TT06FEUhkHD7k7A2Bzbzs6tCgeokwuAZL8OgwIAjAd7aKKhIKhNT8s
         0XkNb9EaOxxgu6eYyIH20B6S4zxOyQ5gXzuCGPFh8hZdCyVKJ0I+rS4aDJBC0fUcemow
         Smoc21+hGiRDFmtDFSvcZt/3i9WaPoW0pUlVj+S/poPlaQ/KZFxgbV5WtW6YzdkeWduB
         eXyDUBmuRQq3DidoqJOjiNFAspu5NsQt1FZk52bzK2PtHgMIUV4eNKDHAgI8GgviEil3
         GZLEU5ix+mJmQnlvQcAvq6KmDLaCSosjprOe1LW8/VVoZAjyaMJmgGQ0tlRZbkBPhMkq
         D58A==
X-Gm-Message-State: AJIora9hg0NhyIv3Bp36bGdwKG70u48B78B1GRJWaTmWVDmuhyF0TQXU
	2+yrMM9L2+xdWwFXw8DVBDYnJZFND50vpFDdV/s=
X-Google-Smtp-Source: AGRyM1sdgv3mvfCz2ZSOb164tqPgKAdiyD+LPHLwhHyC3p3u3G4R9aGXA/Q080Jl/AzHSEipJn65gDAlH35Cxg34xoI=
X-Received: by 2002:a81:3984:0:b0:31c:b59e:a899 with SMTP id
 g126-20020a813984000000b0031cb59ea899mr6196759ywa.195.1657743300495; Wed, 13
 Jul 2022 13:15:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220713163201.136202-1-sebastian.fricke@collabora.com>
 <Ys8Txuq9/u/EL6sj@yury-laptop> <CAHp75VeOLfKw4-+Dpn54yy6j=tdiBNA_2Kvhj7mUUjTD-M_vYA@mail.gmail.com>
 <Ys8gpl3m+vvEM7Sy@yury-laptop>
In-Reply-To: <Ys8gpl3m+vvEM7Sy@yury-laptop>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 13 Jul 2022 22:14:24 +0200
Message-ID: <CAHp75VeGSWoq-a10nA9NLKBEX7L_eiL0zPMJHUbX=c64wG8hkg@mail.gmail.com>
Subject: Re: [PATCH 3/6] bitops: bitmap helper to set variable length values
To: Yury Norov <yury.norov@gmail.com>
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	knaerzche@gmail.com, Collabora Kernel ML <kernel@collabora.com>, bob.beckett@collabora.com, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, linux-staging@lists.linux.dev, 
	nicolas.dufresne@collabora.com, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 13, 2022 at 9:44 PM Yury Norov <yury.norov@gmail.com> wrote:
> On Wed, Jul 13, 2022 at 09:10:33PM +0200, Andy Shevchenko wrote:
> > On Wed, Jul 13, 2022 at 8:56 PM Yury Norov <yury.norov@gmail.com> wrote:
> > > On Wed, Jul 13, 2022 at 06:31:59PM +0200, Sebastian Fricke wrote:
> >
> > ...
> >
> > > I'd suggest you to try implementing
> > >         bitmap_copy_from(dst, src, dst_off, len)
> > > or even
> > >         bitmap_copy_from(dst, dst_off, src, src_off, len)
> > > if you expect that you'll need more flexibility in the future.
> >
> > Do you think it would be useful?
> >
> > We have bitmap_replace() & bitmap_remap(). Wouldn't that be enough?
>
> bitmap_replace and bitmap_remap have no an 'offset' parameter.

True.

But then it's a bit too generic to have this src_off, no?

I would rather expect for asymmetrical bitmaps that the other side
will be either one of the fixed width types (it makes sense to have
for 32- or 64-bit arguments.

When you have a source bitmap of x bits and  you would like to copy it
into a y-bit one, I would think that either you have a small amount of
bits in x anyway, or x is a full-sized bitmap (same order as y). Also
keep in mind that granularity is long, so less than long it makes no
sense.

  bitmap_copy_from_T(unsigned long *map, start, len, T src),

where T is type, start is the offset in map, len is the amount of bits
from src starting from 0. That's what is required in most of the cases
I believe.

-- 
With Best Regards,
Andy Shevchenko
