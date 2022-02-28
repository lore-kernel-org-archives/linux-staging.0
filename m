Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A264B48CD
	for <linux-staging@lists.linux.dev>; Mon, 28 Feb 2022 09:34:28 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id e5so12243894vsg.12
        for <linux-staging@lists.linux.dev>; Mon, 28 Feb 2022 01:34:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fsIvmUNCo/5VWlA0/Y4MVhiq1d6Mv6B/6S6hygEcBfA=;
        b=YAt0EgmI8iZw4cPhhsCqF+z91XeL24K4Dr2v/3xGGiXzjC0ph7x6UdEOUT72YkQlA2
         faPq0wWtadDCYi43pb3UNeAWlig2QS1TMqp91SvN4mmh94PLZrI2G09eCO6EIfqevZ6d
         ZRYf5QPIt1r1MeuP+zLnsz6r+l2E5u67rvl7B8hqrXXlFYr1rZPg12kFae5wcUJtZEB0
         r6l7zbHP/iLKSZ5R8NmNCj1tOSHyIypF2Ymh/uBXAoyCfssDwEOOUc+iKvhrECfXWqTz
         Mxw+vKxt8MEx47k1opxNjxRymPPt1FePseSAOS4bPUwblPtPaGaU5R6fkcDv22kzBKwG
         9frA==
X-Gm-Message-State: AOAM531Jyzu0VTD33OkM+/AVdwHq49ulbfasxHJ6gDP3MCOIUjAEhy5H
	LcAemjcWPvddnjvLS1djxhpPkF2NWQlxFQ==
X-Google-Smtp-Source: ABdhPJw3iDRRYvi9widngE+CWbJFv4fJHH9PkQCEt2rbGvSh2kqPqs37LqMlDiQsg/h7K28dBF5UYA==
X-Received: by 2002:a67:1dc1:0:b0:31e:650d:a7ad with SMTP id d184-20020a671dc1000000b0031e650da7admr5273207vsd.85.1646040867245;
        Mon, 28 Feb 2022 01:34:27 -0800 (PST)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id v123-20020a1fde81000000b0032d8170fd77sm1743541vkg.27.2022.02.28.01.34.26
        for <linux-staging@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Feb 2022 01:34:26 -0800 (PST)
Received: by mail-vs1-f46.google.com with SMTP id e26so12304918vso.3
        for <linux-staging@lists.linux.dev>; Mon, 28 Feb 2022 01:34:26 -0800 (PST)
X-Received: by 2002:a67:e113:0:b0:30e:303d:d1d6 with SMTP id
 d19-20020a67e113000000b0030e303dd1d6mr6829157vsl.38.1646040866438; Mon, 28
 Feb 2022 01:34:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <YhjYPIRvDnV7XAzV@kroah.com> <CAHk-=wjLvye-_qj-J=dVWhFf7S8noL6d-szRtFYq_hoOk6J1Eg@mail.gmail.com>
 <Yhndy5cTzhJh7abq@kroah.com>
In-Reply-To: <Yhndy5cTzhJh7abq@kroah.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Feb 2022 10:34:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX35YGpACUsk3iUhk3KF96PB3fxs1jfQ75g6_ddFS=rXQ@mail.gmail.com>
Message-ID: <CAMuHMdX35YGpACUsk3iUhk3KF96PB3fxs1jfQ75g6_ddFS=rXQ@mail.gmail.com>
Subject: Re: [GIT PULL] Staging driver fix for 5.17-rc6
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, Feb 26, 2022 at 9:08 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> On Fri, Feb 25, 2022 at 11:57:43AM -0800, Linus Torvalds wrote:
> > On Fri, Feb 25, 2022 at 5:23 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > It resolves a reported problem in the fbtft fb_st7789v.c driver that
> > > could cause the display to be flipped in cold weather.
> >
> > LOL. WTF?
> >
> > I just had to read the commit message for that odd thing.
>
> Here it is in the real world, I should have added this to the changelog,
> but I figured the url might not be permanent:
>         https://www.core77.com/posts/111994/Hyundais-Strange-Cold-Weather-UI-Bug-Digital-Dashboard-Rotates-Flips-Display

Don't keep your production drivers too long in staging?

(sorry, couldn't resist :-)

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
