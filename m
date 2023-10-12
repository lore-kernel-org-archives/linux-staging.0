Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057F0809
	for <linux-staging@lists.linux.dev>; Thu, 12 Oct 2023 06:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PM0mOYch"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4075c58ac39so6532645e9.3
        for <linux-staging@lists.linux.dev>; Wed, 11 Oct 2023 23:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697091795; x=1697696595; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4HT79hrObqSxBSC97lY+L6cqBvifnDEa24RG2fZwpdY=;
        b=PM0mOYchLiQNw+BBD28QNLximTW3no9O7ly+6I4BtpUHvyDPl6y7b5wfNerANhkEg4
         h25xpdZYmapgvZIBTbXbFmh9dki/90SumJjL1TAGAvEgcR8NXRNZxoTNRXk545fmaCcK
         l/30TOzkI5It0jT7cvVWuGfbkw61Nef4mm81yIPbN+wcSrCCM0a1g3tTQ2kW7cdy5fMB
         mzT52am9bFsuJy6XmsYzb4dKHSoMZNv6MwM4ZE+I49UjaRa6gjt30KVsMitip5aHXLbR
         tsIN5GNM0EQeg7RedAMDqIc4qL7YYjIB8x/z48w206HudVut4ai55z+KgJaB8gD1nodN
         1Ftw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697091795; x=1697696595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HT79hrObqSxBSC97lY+L6cqBvifnDEa24RG2fZwpdY=;
        b=U5MbZ29gnF2ag6152P8zh+9gt1xfw9wcUXAuqbtItWseTjE6IQXqD+Nrj+nX/uQ9nl
         p3laX8XvSgKSGf5Q0V7/yPPXHNEylU9C7SlYWvjnpVIZ0/U67OIYDELKU6/KOlOIdbFb
         zGKAdXJyv7ZiTtcNBfMUvn6Ul4W9lMBSDj0v6c60c08hI8LjsJCjvQ77GS9ehVvFoj5X
         JNxvylD3xIr96bav7IH3PnGE2q6YmNvGkdXxETdPoYq8C2Zwm1ez/6p90+5bPmTQOcfW
         zMD6vTjeG6hFd2Wax1qF39DnnoEEA+tYWa596z4nKRISwlse9omSnuvMa6GuhqAfNhiw
         DSzg==
X-Gm-Message-State: AOJu0Yx7S+XxiboBDVUcl8AvjPzcktYNbc5tb8ffgSAOkvcC6JV2EDTN
	ApdLpt3zfXBgYB9QMn03NimZLUo4ZMysK+zH0WU=
X-Google-Smtp-Source: AGHT+IFKoP5B7w8Y42/s61+wzwot43ZZei6mSsx6r/nkWwL/vfiXecTRrJxnumkImRNM8DZcpqepCw==
X-Received: by 2002:a05:600c:3652:b0:3fe:d1b9:7ea9 with SMTP id y18-20020a05600c365200b003fed1b97ea9mr19652329wmq.36.1697091795060;
        Wed, 11 Oct 2023 23:23:15 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y4-20020a05600c364400b0040472ad9a3dsm18638405wmq.14.2023.10.11.23.23.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 23:23:14 -0700 (PDT)
Date: Thu, 12 Oct 2023 09:23:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	Arnd Bergmann <arnd@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Jakub Kicinski <kuba@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	"David S . Miller" <davem@davemloft.net>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] [RFC] wireless: move obsolete drivers to staging
Message-ID: <428ef899-a5c4-4d93-beea-afd7ab6f6634@kadam.mountain>
References: <20231010155444.858483-1-arnd@kernel.org>
 <da777a72-55d1-4ee3-91c8-30afe7659f54@gmail.com>
 <db98d9ac-7650-4a72-8eb9-4def1f17ea0d@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db98d9ac-7650-4a72-8eb9-4def1f17ea0d@app.fastmail.com>

On Wed, Oct 11, 2023 at 10:22:32PM +0200, Arnd Bergmann wrote:
> On Wed, Oct 11, 2023, at 20:13, Philipp Hortmann wrote:
> > On 10/10/23 17:27, Arnd Bergmann wrote:
> >> From: Arnd Bergmann <arnd@arndb.de> While looking at the old drivers 
> >> using the obsolete .ndo_do_ioctl() callback, I found a number of network 
> >> drivers that are especially obsolete, in particular for 802.11b 
> >> (11Mbit/s) or even older wireless networks, using non-busmaster 
> >> ISA/PCMCIA style bus interfaces, and using the legacy wireless extension 
> >> ioctls rather than the netlink interfaces that were meant to replace 
> >> them in 2007. All of these drivers are obsolete or orphaned. We had 
> >> previously discussed this topic, but nobody ever moved the files, so I 
> >> now went through the list to my best knowledge. These are the drivers 
> >> that I would classify as "probably unused" by now:
> >
> > I found a USB WLAN Stick with a rtl8192u. I got it last Saturday and 
> > found out that the firmware is missing in my ubuntu 20.04. I found it on 
> > the web and fixed it. When I started the driver my computer crashed. The 
> > missing part was: priv->priv_wq = alloc_workqueue("priv_wq", 0, 0); 
> > Fixing this the next error was a network = kzalloc(sizeof(*network), 
> > GFP_KERNEL); in wrong context with leads to a crash of my computer. 
> > Fixing this leads to another issue which lets my computer crash.
> >
> > For me the firmware of rtl8192u was intentionally missing because of the 
> > issues with the driver.
> >
> > What this has to do with your question?
> > Can we check for missing firmware in main distributions to know which 
> > drivers are considered to be old and unused?
> 
> Nice, thanks so much for testing.
> 
> I see the two bugs were introduced in 2016 by commit 1761a85c3bed3
> ("staging: rtl8192u: Remove create_workqueue()")

This one never made it to lore...  I think we wouldn't have merged it
without a lore review these days.  (There was a lot of moaning and
complaining at the time).

> and in 2021 by
> commit 061e390b7c87f ("staging: rtl8192u: ieee80211_softmac: Move a
> large data struct onto the heap"), so it's been broken for a while.

:/  No way would I have seen this in review.  Smatch is supposed to find
some of these "sleeping in invalid context" warnings but the sleeping in
IRQ stuff doesn't work and hasn't been released.

regards,
dan carpenter

