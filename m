Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E43928F3;
	Sat, 22 Oct 2022 08:22:13 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id l28so3031364qtv.4;
        Sat, 22 Oct 2022 01:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iX6ZB1mXxDt5cJkxRAfDaCVuPNu25Wfl4HIXasXp/zE=;
        b=DtjYEobqYqn1PVq/AajYffhPc7LJyHOQ9CA3/KoXG+ez8a5IYQRrTz+GqqTGI1o2LM
         nXsGsbGuvQ5CzezAp0SOJqFHfqQu+AjM8MD4tEkoJpCdvNfg9siuagh4CSdN339c97YE
         D0/I08DG3kQKfLLoJe6AWEsMJVg1jhwx2c0VHwnCzieZw1kYf3gpAlD4h1JSirhQ9sGF
         YNA77kgqEjS5stjGliBuaoZBHXn6aTlst7TXHMRk0bIKbM7zzDmoLGrPYZnrCG7eBsFe
         ke0zzW13Gm+bkbSP0VDcVE/umejOgnSAcquIZ8ZcWv7uC+PpoC0z9cx0366JQOPOHmgy
         g8UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iX6ZB1mXxDt5cJkxRAfDaCVuPNu25Wfl4HIXasXp/zE=;
        b=3HzAY2jZMDdDWHaqrdv1frYUXKa/gTn79II/JsKu75xLnkGiBgugMWoWsNuFafBx/w
         Nkq1+pTWRtFQ+VY1P6Q/KXZE3UPmo3TWQla9wzS4pD9QMJXwDEwKWtYMyEmyMmlF0hQy
         fQgAOHCgqo/FlcCkYrUvDjmC/X3eBdxgApkwINo/nPFv8Qqri3e5FYH5pvbw4csrYrXC
         vw+bGwksnA00ZzBRLXINzWpEB+1yjIBcpX0/BN79EdYL3rjRLBKOZCFJMemSlaRuCdpZ
         QTunYNsG/i1ifMQ5gnCn9dt0pxtBBP7phEOEmzgh8Z0ghph2dCh+VIjub6YPTZK2dtmq
         t/wA==
X-Gm-Message-State: ACrzQf3YJ7Vcdtku2qOya3RsgktkNQ2j8ilUeE9x9I+/wcCU2ARLj3F0
	R0UVHq/VJ1j/aodowEysaY7tkIl7jpZ3UPowRRRXYnGYTKqKNv/quuc=
X-Google-Smtp-Source: AMsMyM5PyvIFnw7iJHcdHMBCUIsTVHymZdfP1Ub2JfJlRvOFhkTr/4Gk/oNAhxPPpG83UBJhFoETd7COaQYyxFvJUHQ=
X-Received: by 2002:ac8:5902:0:b0:39c:e440:6adb with SMTP id
 2-20020ac85902000000b0039ce4406adbmr19603840qty.18.1666426932343; Sat, 22 Oct
 2022 01:22:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221022070612.13009-1-tanjubrunostar0@gmail.com> <Y1OdSYH45MNbp03k@kroah.com>
In-Reply-To: <Y1OdSYH45MNbp03k@kroah.com>
From: Tanju Brunostar <tanjubrunostar0@gmail.com>
Date: Sat, 22 Oct 2022 09:22:00 +0100
Message-ID: <CAHJEyKXYtMiUusyq8427SjJo5VFO09O6HH0kkBYsmYzx8BMeAQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] a series of checkpatch fixes on the file: rxtx.c
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	outreachy@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 22, 2022 at 9:15 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Sat, Oct 22, 2022 at 07:06:06AM +0000, Tanjuate Brunostar wrote:
> > The fixes are similar, mostly long lines splitting. I had to make
> > serveral patches to ease the work of inspectors
> >
> > v2: fixed a compilation error found by the kernel test robot and
> > recompiled the code
> >
> > v3: tends out the error persisted in the second version. this version is
> > a correction of that
> >
> > Tanjuate Brunostar (6):
> >   staging: vt6655: fix lines ending in a '('
> >   staging: vt6655: refactor long lines of code in s_uGetRTSCTSDuration
> >   staging: vt6655: refactor long lines of code in s_uFillDataHead
> >   staging: vt6655: refactor long lines of code in s_vGenerateTxParameter
> >   staging: vt6655: refactor long lines of code in the rest of the file
> >   staging: vt6655: refactor code to avoid a line ending in '('
> >
> >  drivers/staging/vt6655/rxtx.c | 532 ++++++++++++++++++++--------------
> >  1 file changed, 321 insertions(+), 211 deletions(-)
> >
> > --
> > 2.34.1
> >
> >
>
> Any reason you do not have "staging: vt6655:" as the prefix for this 0/X
> email subject line?
>
> thanks,
>
> greg k-h

oh I forgot to include it
