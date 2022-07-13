Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015574A1C
	for <linux-staging@lists.linux.dev>; Wed, 13 Jul 2022 20:42:19 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id i2so7482732qkm.8
        for <linux-staging@lists.linux.dev>; Wed, 13 Jul 2022 13:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EgA3xZH3t9Zi9zRLOrZeaQRW5jyanhvvZI8yTDXgSs4=;
        b=e3pT9sVk4ebu5rxOkVvi3A5vzXF3/bx9rOT9OycSA2cJYBt0jTTnMtcmx66L1h8f3K
         HgERgnUfpUdtrTCrL5qNcQm2LccwN85lIvfgA0H8jmjV9qPJlelJn995PeGUUNhZLHbV
         yAZ5NMYOrjY73ZZwlPTBbuw/49518KwjQx1mwAVnBgVR5uZi6w8RRD3RKnXlSjSJoxbZ
         PdYzpYTrxHm3q7zwOiSFisCq4AIuWwktIaZFDkXHaZO/YvcLaBjFiqtcEBxanSMt4h9s
         UK9CvmS6OOZNcnJPNFpXhtKERK1US62God8WWgp294lvESo3sP+0hEpqkdnLot/0KZtp
         g8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EgA3xZH3t9Zi9zRLOrZeaQRW5jyanhvvZI8yTDXgSs4=;
        b=Mfm7/yLPv6rRIy+RXhr4r078fXHWaMjiwsk/xWk/9JL5B2Fs8dvlQK6nu/nPkY+7ri
         uUYH49xLgFsakXk6gbkJI95D2nEivdKatAKaIlFM8hk1wnVTQj7HiSvjiS+Z1VsbINSL
         8mYb9NaHUV0AsvjdSGNTNx+/D2mRMj6W9KzX/ymJCWFbrXYFjTV5LneRhE7fXwt3uHrz
         a1eESaD8lCrAFZ5f4cUbbHKLz+AoOSEW2XlLfbb7k0nOkCj4z2e06EIgYgsu+oL4+mKN
         g9DCVC9uT1FLvRwLbtj/nR5RvYnm0NN6jORhpHg9E4ZI6emnLGXfI/WIaOCVBQOJ94//
         yUnw==
X-Gm-Message-State: AJIora83xNkCoG/qqIuwNwpbrfB7oDErnVHjIrwCsfIiOTSxTHsRhExQ
	W9e3wc3E7fYQjA0H8+LYw5w=
X-Google-Smtp-Source: AGRyM1v52gaCFcbVPmIqwbN58q5YtVm3AqVJBDc6aU4aFpenuHjRPorXmWi30FmHMGI23odMN4w6eQ==
X-Received: by 2002:a37:806:0:b0:6b5:c19d:bbfc with SMTP id 6-20020a370806000000b006b5c19dbbfcmr90053qki.155.1657744938660;
        Wed, 13 Jul 2022 13:42:18 -0700 (PDT)
Received: from localhost ([2601:4c1:c100:1230:7360:5d5d:6684:e04b])
        by smtp.gmail.com with ESMTPSA id m6-20020ac807c6000000b00315a5fa4bf6sm10194336qth.7.2022.07.13.13.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 13:42:18 -0700 (PDT)
Date: Wed, 13 Jul 2022 13:42:17 -0700
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
Message-ID: <Ys8uKUKErpoWL873@yury-laptop>
References: <20220713163201.136202-1-sebastian.fricke@collabora.com>
 <Ys8Txuq9/u/EL6sj@yury-laptop>
 <CAHp75VeOLfKw4-+Dpn54yy6j=tdiBNA_2Kvhj7mUUjTD-M_vYA@mail.gmail.com>
 <Ys8gpl3m+vvEM7Sy@yury-laptop>
 <CAHp75VeGSWoq-a10nA9NLKBEX7L_eiL0zPMJHUbX=c64wG8hkg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VeGSWoq-a10nA9NLKBEX7L_eiL0zPMJHUbX=c64wG8hkg@mail.gmail.com>

On Wed, Jul 13, 2022 at 10:14:24PM +0200, Andy Shevchenko wrote:
> On Wed, Jul 13, 2022 at 9:44 PM Yury Norov <yury.norov@gmail.com> wrote:
> > On Wed, Jul 13, 2022 at 09:10:33PM +0200, Andy Shevchenko wrote:
> > > On Wed, Jul 13, 2022 at 8:56 PM Yury Norov <yury.norov@gmail.com> wrote:
> > > > On Wed, Jul 13, 2022 at 06:31:59PM +0200, Sebastian Fricke wrote:
> > >
> > > ...
> > >
> > > > I'd suggest you to try implementing
> > > >         bitmap_copy_from(dst, src, dst_off, len)
> > > > or even
> > > >         bitmap_copy_from(dst, dst_off, src, src_off, len)
> > > > if you expect that you'll need more flexibility in the future.
> > >
> > > Do you think it would be useful?
> > >
> > > We have bitmap_replace() & bitmap_remap(). Wouldn't that be enough?
> >
> > bitmap_replace and bitmap_remap have no an 'offset' parameter.
> 
> True.
> 
> But then it's a bit too generic to have this src_off, no?

That's why I said:

> > > > if you expect that you'll need more flexibility in the future.

My preferred option is bitmap_copy_from(dst, src, dst_off, len).

> I would rather expect for asymmetrical bitmaps that the other side
> will be either one of the fixed width types (it makes sense to have
> for 32- or 64-bit arguments.

Look at patch #6 - it copies 1,4,5,9,10,32,37... - pretty much a random
number number of bits.
 
> When you have a source bitmap of x bits and  you would like to copy it
> into a y-bit one, I would think that either you have a small amount of
> bits in x anyway, or x is a full-sized bitmap (same order as y).

It sounds like a speculation to me. Why shouldn't we let people to
copy with an offset any number of bits? 

> Also
> keep in mind that granularity is long, so less than long it makes no
> sense.
> 
>   bitmap_copy_from_T(unsigned long *map, start, len, T src),
> 
> where T is type, start is the offset in map, len is the amount of bits
> from src starting from 0. That's what is required in most of the cases
> I believe.

But not in Sebastian's case, according to patch #6.

Thanks,
Yury
