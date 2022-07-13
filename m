Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C744A0A
	for <linux-staging@lists.linux.dev>; Wed, 13 Jul 2022 19:44:40 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id f12so9339988qka.12
        for <linux-staging@lists.linux.dev>; Wed, 13 Jul 2022 12:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AgWnvJuWvMs9BNQibg9dJXMSIiw7AP7RCPNxvoP8zeA=;
        b=ksIFue9YbxkNLn7R1csI9a8pPRDVDDl+Hi3uOkbmIG83c57hIIoiOpuSGJ0YRJWI0B
         nT4LotaiUcav8II4zOoIfmBWEQWHJcZO5dz73ddeJSrf4o0+SXgj3SeA3/4Y4go1QWCp
         dEGL1bEPsofw/Fv9z9QBd4WPYihJ1lP5ze4ZhqsIX9XMFjt5Y3AZRiYZFgp1WRs42q+P
         s2VtJZM3uvih9ByXdt5ekF8oG5NzenQvIuK2npxY7eJw2aEz2yvVMZVgaX/ScUYrKK3d
         2pAGOqO3/bCeFF0pJVyYq9Incpvt2YMjF8jBIFSVwEeUVG17JY10wGovFKoR5GCtnVah
         QXKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AgWnvJuWvMs9BNQibg9dJXMSIiw7AP7RCPNxvoP8zeA=;
        b=m0EU/vKcVdTAFRh8msM3cgR2yL8g2w0DSVTFWvyAD9I4a2VEjwyCKB3u1H1u4KPoys
         WfQTiHX55JZNLYAUzKeO2oX5PBkkg2y3uDwh3JAechOD3/toieGcdgV0GFyRPo1vi0HI
         7ep/D8/123AN7cil5Ar6FO6X1NHUFOyz/uZGKFHzK3NDjgRy4bAfMPV5L0ARZbD2DJu+
         6kdldxAngL3w1Ec036b4NrXCmryg7kuf0I2pFz7Pbl+jeaP+9txUuLvhxJD5NZ9Xroc6
         Em7pV8D3S8WhglQXB5Bhx3mvWvWELWcx4EJjt7rgQJqVBltwuB/UqnIww4LOnhfyANU7
         SxPw==
X-Gm-Message-State: AJIora/hF5C64O41nbqeM8bzAvoEmF2imlNbrTiJ51QvJ5jcPsKqgWyV
	3x6Ufsg6Pe64evsPiGKfjfg=
X-Google-Smtp-Source: AGRyM1tSwpKky1uUYM+YAOJtp/PC8wosYfmP/SdoTQ7bhXPQ4JhS1BVR1eToNz1LiMU6pW7hkJ1V1g==
X-Received: by 2002:a05:620a:190f:b0:6b5:9bf7:60d with SMTP id bj15-20020a05620a190f00b006b59bf7060dmr3624315qkb.627.1657741479762;
        Wed, 13 Jul 2022 12:44:39 -0700 (PDT)
Received: from localhost ([2601:4c1:c100:1230:7360:5d5d:6684:e04b])
        by smtp.gmail.com with ESMTPSA id n6-20020a05620a294600b006b59d5ead72sm5812403qkp.46.2022.07.13.12.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 12:44:39 -0700 (PDT)
Date: Wed, 13 Jul 2022 12:44:38 -0700
From: Yury Norov <yury.norov@gmail.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>, knaerzche@gmail.com,
	Collabora Kernel ML <kernel@collabora.com>,
	bob.beckett@collabora.com,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
	linux-staging@lists.linux.dev, nicolas.dufresne@collabora.com,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH 3/6] bitops: bitmap helper to set variable length values
Message-ID: <Ys8gpl3m+vvEM7Sy@yury-laptop>
References: <20220713163201.136202-1-sebastian.fricke@collabora.com>
 <Ys8Txuq9/u/EL6sj@yury-laptop>
 <CAHp75VeOLfKw4-+Dpn54yy6j=tdiBNA_2Kvhj7mUUjTD-M_vYA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VeOLfKw4-+Dpn54yy6j=tdiBNA_2Kvhj7mUUjTD-M_vYA@mail.gmail.com>

On Wed, Jul 13, 2022 at 09:10:33PM +0200, Andy Shevchenko wrote:
> On Wed, Jul 13, 2022 at 8:56 PM Yury Norov <yury.norov@gmail.com> wrote:
> > On Wed, Jul 13, 2022 at 06:31:59PM +0200, Sebastian Fricke wrote:
> 
> ...
> 
> > I'd suggest you to try implementing
> >         bitmap_copy_from(dst, src, dst_off, len)
> > or even
> >         bitmap_copy_from(dst, dst_off, src, src_off, len)
> > if you expect that you'll need more flexibility in the future.
> 
> Do you think it would be useful?
> 
> We have bitmap_replace() & bitmap_remap(). Wouldn't that be enough?

bitmap_replace and bitmap_remap have no an 'offset' parameter.
