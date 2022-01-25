Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E8C2C80
	for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 06:27:47 +0000 (UTC)
Received: by mail-ua1-f49.google.com with SMTP id u6so35610527uaq.0
        for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 22:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x7OWhLsmJS1+uUOEexpDwoIKITm+x9XBIi30vSgK1xg=;
        b=hkWuAz/YuA6uirgqIr8pVE292nRVrNT1FRntEAbq6BSmuV1RjGikjVpCJ91lvOiWTI
         wsSfkTZlPqf02zgXbqLu59iYosJKmRfHg9UN4n4eofqmvQSx24qipIN2arr5JrhMgs2o
         UbVYyHuG3MrfZG3BR/VubSt4JsNDJWK1I5Q3IIaK9xATYai+n5SM0iOngkYc89ZUEinE
         ZCW8ujZ79F1WoVYy5wmQzUPcE54FTEkgU98Ngt+xWYhUmXJTsD6h2aQo5YR5fGPI3i9K
         dFfww1Uqm4jRM60BxU3/W42mUddMTt8OoHrM3+yYOWgNkrld2w4uraPYqsW3pkYsj1a2
         4skA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x7OWhLsmJS1+uUOEexpDwoIKITm+x9XBIi30vSgK1xg=;
        b=foxjwvgzfKIoM7cHazkzgMIVHCYPgtMuwngQpeniXTNwdVCmP/2nUQkeJtUkVquBRw
         PrmfjN3OfubIAhpZswYJKxyT/VG+SrPAS52nbBTtdg57Pf6BLZ3toDocznY3OXXkKSTC
         +Jzd9+ylH1JeFJ9o2uIzL2BsKC6WuP2sGXHr5Lj2ZJs2Est+G2HTR/zdRWdnyl6Rl8Nu
         06puJ3edmViY6moLm2uQt4ZGpE7my73sdXMVFuNX91LgWxu62PcHcaclOTEqZ+xfcby7
         NZq7MQYUstp94qk6kWOieheqP7Z2N0UTSNxhpa9wOaVbzQ7X3T6wt3R+shJrKCyklx90
         i6qA==
X-Gm-Message-State: AOAM531uTh4vkhxio9VVDIT/BLtlbpB8PJD32ijYx+YrYujby3CPfWEp
	TQ1dwjFr8OivAGEJKY1Zrw/d1j1u3zDIAkscgEI=
X-Google-Smtp-Source: ABdhPJx+rYdRl8Z7+AGuvxfELBIQDGePT2oG2nEhInJMqyAa5hjsASHccpDLr9LNE0L1Vk3U7tCnise0rK2hMuuJdiI=
X-Received: by 2002:ab0:3caa:: with SMTP id a42mr296234uax.46.1643092066597;
 Mon, 24 Jan 2022 22:27:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220110114930.1406665-1-sergio.paracuellos@gmail.com>
 <20220110114930.1406665-4-sergio.paracuellos@gmail.com> <20220125011429.93D9FC340E4@smtp.kernel.org>
In-Reply-To: <20220125011429.93D9FC340E4@smtp.kernel.org>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Tue, 25 Jan 2022 07:27:35 +0100
Message-ID: <CAMhs-H9e4Ww2GNk4JqfkuRketb3ZR54UbrqaOx4qH+EJQiNakQ@mail.gmail.com>
Subject: Re: [PATCH v8 3/4] clk: ralink: make system controller node a reset provider
To: Stephen Boyd <sboyd@kernel.org>
Cc: "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, John Crispin <john@phrozen.org>, 
	linux-staging@lists.linux.dev, Greg KH <gregkh@linuxfoundation.org>, 
	NeilBrown <neil@brown.name>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 25, 2022 at 2:14 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Sergio Paracuellos (2022-01-10 03:49:29)
> > MT7621 system controller node is already providing the clocks for the whole
> > system but must also serve as a reset provider. Hence, add reset controller
> > related code to the clock driver itself. To get resets properly ready for
> > the rest of the world we need to move platform driver initialization process
> > to 'arch_initcall'.
> >
> > CC: Philipp Zabel <p.zabel@pengutronix.de>
> > Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> > ---
> >  drivers/clk/ralink/clk-mt7621.c | 92 ++++++++++++++++++++++++++++++++-
> >  1 file changed, 91 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/ralink/clk-mt7621.c b/drivers/clk/ralink/clk-mt7621.c
> > index a2c045390f00..99256659dd96 100644
> > --- a/drivers/clk/ralink/clk-mt7621.c
> > +++ b/drivers/clk/ralink/clk-mt7621.c
> > @@ -11,14 +11,17 @@
> >  #include <linux/mfd/syscon.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/regmap.h>
> > +#include <linux/reset-controller.h>
> >  #include <linux/slab.h>
> >  #include <dt-bindings/clock/mt7621-clk.h>
> > +#include <dt-bindings/reset/mt7621-reset.h>
>
> I can't take this patch without taking the first patch. I suppose if
> Greg is OK I can take the staging patch #4 through clk tree too? Let me
> know.

Greg, can you Ack patch 4 of the series to get all applied through CLK tree?

Thanks!

Best regards,
    Sergio Paracuellos
