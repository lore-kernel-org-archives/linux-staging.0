Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2EC7A
	for <linux-staging@lists.linux.dev>; Fri, 20 May 2022 12:46:35 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id m1so6780747qkn.10
        for <linux-staging@lists.linux.dev>; Fri, 20 May 2022 05:46:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UhZYflED6/DiNr1feOC9OhkU49iweDam4jS4WznrIsk=;
        b=VIWFvWCQGywz+e3L1FkMbuSmdmhlOhzuRAgavTsDqtqK58mB7xUTzslSTknU9aa1XA
         avH1ePInibZfwdir5oy9FJ3Dy5UPwcyRm8+8la5R1auAyLEs2G47ySpXpb/DdlvgWEow
         dWdOG06ze5RCe8EPYnfdl+g6bRK8nLrzdCK9+WN6gWpVx439djwwBRjTCc6uSyBhC+ux
         Y6a1+uMVknfZTSoXNJu4SAlOGU59V2/zd/pit8Lg37ZMZhDe/uPdRY8btOKhFG9WPRMQ
         1DpEwoUplp7Iwdc7efq7S4PzqBVbYmnVsFXWzpUCjXEg2H4ZqCHQXXdCrPv3K11pBkM4
         9k7Q==
X-Gm-Message-State: AOAM530QfJ8xFTpBGTKv1bD9Kaj9fnaE0tG90ffRHDaZHUBVzU6ElSAA
	p70Jns/T5IkEkestyfQIueJpARDVHaSHBQ==
X-Google-Smtp-Source: ABdhPJwhnGusjuJTvmBMW0egJs1UKZleLcrHnRA5WCp01ocYBGBK1HcsSytXz0wsC4P6XOStqru9pg==
X-Received: by 2002:a05:620a:d8d:b0:67b:e95:2975 with SMTP id q13-20020a05620a0d8d00b0067b0e952975mr6119427qkl.115.1653050793815;
        Fri, 20 May 2022 05:46:33 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id i13-20020a379f0d000000b0069fc13ce254sm2924104qke.133.2022.05.20.05.46.32
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 May 2022 05:46:33 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id d137so13944174ybc.13
        for <linux-staging@lists.linux.dev>; Fri, 20 May 2022 05:46:32 -0700 (PDT)
X-Received: by 2002:a05:6902:389:b0:633:31c1:d0f7 with SMTP id
 f9-20020a056902038900b0063331c1d0f7mr9068692ybs.543.1653050792549; Fri, 20
 May 2022 05:46:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <6285958d.+Z2aDZ4O1Y9eiazd%lkp@intel.com> <0530d502-1291-23f3-64ac-97bd38a26bd4@roeck-us.net>
 <CAMuHMdU3SYOwE5ftDwymQpVwWmpbC=1Ytyp0Y9GaeUS2i1cP+A@mail.gmail.com>
In-Reply-To: <CAMuHMdU3SYOwE5ftDwymQpVwWmpbC=1Ytyp0Y9GaeUS2i1cP+A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 May 2022 14:46:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVx7r-4TVV9uVJppT-7ZAriov01BUNk4ghU9Bs4uY28vQ@mail.gmail.com>
Message-ID: <CAMuHMdVx7r-4TVV9uVJppT-7ZAriov01BUNk4ghU9Bs4uY28vQ@mail.gmail.com>
Subject: Re: [linux-next:master] BUILD REGRESSION 736ee37e2e8eed7fe48d0a37ee5a709514d478b3
To: Guenter Roeck <linux@roeck-us.net>
Cc: kernel test robot <lkp@intel.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-staging@lists.linux.dev, 
	"open list:TI ETHERNET SWITCH DRIVER (CPSW)" <linux-omap@vger.kernel.org>, linux-nvme@lists.infradead.org, 
	linux-hwmon@vger.kernel.org, 
	Linux Fbdev development list <linux-fbdev@vger.kernel.org>, KVM list <kvm@vger.kernel.org>, 
	DRI Development <dri-devel@lists.freedesktop.org>, 
	amd-gfx list <amd-gfx@lists.freedesktop.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Luc Van Oostenryck <luc.vanoostenryck@gmail.com>, 
	linux-sparse@vger.kernel.org, linux-m68k <linux-m68k@lists.linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, May 20, 2022 at 2:40 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Thu, May 19, 2022 at 8:48 AM Guenter Roeck <linux@roeck-us.net> wrote:
> > On 5/18/22 17:55, kernel test robot wrote:
> > > tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> > > branch HEAD: 736ee37e2e8eed7fe48d0a37ee5a709514d478b3  Add linux-next specific files for 20220518
> > >
> > > Error/Warning reports:
> > >
> > > https://lore.kernel.org/linux-mm/202204291924.vTGZmerI-lkp@intel.com
> > > https://lore.kernel.org/linux-mm/202205041248.WgCwPcEV-lkp@intel.com
> > > https://lore.kernel.org/linux-mm/202205122113.uLKzd3SZ-lkp@intel.com
> > > https://lore.kernel.org/linux-mm/202205172344.3GFeaum1-lkp@intel.com
> > > https://lore.kernel.org/linux-mm/202205190527.o9wVEvHI-lkp@intel.com
> > >
> > > Error/Warning: (recently discovered and may have been fixed)
> > >
> > [ .. ]
> > > drivers/hwmon/nct6775-platform.c:199:9: sparse:    unsigned char
> > > drivers/hwmon/nct6775-platform.c:199:9: sparse:    void
> >
> > This is getting tiresome. Every driver using outb() on m68k will
> > experience that "problem". As far as I can see, it is caused by
> >
> > #define out_8(addr,b) (void)((*(__force volatile u8 *) (unsigned long)(addr)) = (b))
> >
> > in arch/m68k/include/asm/raw_io.h. I have no idea what the
> > "(void)" is for,
>
> The "(void)" makes sure there is no return value.
> Which matters if the result of a function returning void is propagated
> to another function returning void.

Which, FTR, sparse also doesn't like:

    error: return expression in void function

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
