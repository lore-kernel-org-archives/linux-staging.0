Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD9C19450
	for <linux-staging@lists.linux.dev>; Mon, 30 Oct 2023 16:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HlisX013"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-41cd1fe4645so28883801cf.0
        for <linux-staging@lists.linux.dev>; Mon, 30 Oct 2023 09:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698683636; x=1699288436; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yy/fnPpa0jOeepcXyiGpY13xr5whPHNEPKr/8Db8mQU=;
        b=HlisX013zp4dI3c+/qjU5XP28LemqHaYu9F/eADi+4i2+hv5t66xO9K6R5simAnKtW
         lCJorNjvqOQiLq33kHVb4e6aSedoVrh+lyLMaQKWREi8tnOJP3jcsGVkOXueCq5FRtu7
         0iAP6bTl9pQBroq9Oyqa9pY5M2k2utPj0hl56IOxa3Ca5esnczZj4Pyi05aUrEXUV9G+
         xvsCYJECzqP8MhhVIR6FpLRDOe8BLaQdX9J76VoDO+ZWI2zBfYWSiirH++bNAuE374/N
         r1ljDN+xx4HTWxwqdGPOuDPpqnZjcgjHp/U9MewAudxuW5OtenqifAIm8/zX8gThfJ0d
         pq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698683636; x=1699288436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yy/fnPpa0jOeepcXyiGpY13xr5whPHNEPKr/8Db8mQU=;
        b=VPHprz9aS/0mT45WbKDdvyqU0c2gDCb6zMBYiWXh4779LLxF9GFCAmNPmHhFdQlPmU
         wIY7K5nAuAf02H2kmFL9iGw54grkNSMlcLDui5aI4G50eskK5lgtlhhbZw8Z2f5O5Yjc
         5lYvhy4Zat8q/pz/t+bNx3UyEdL9IG09ciyRibCLt0443d7uK+ag97OM3Tkwv2l1/KfJ
         0LHfMeJuW+npeqjaL9SsgvkBXfWwB61NvR6jtfDi+fbTOOjwqqCXNjELMK4pvwYhv01W
         cBYCD96hd2Wj68k3lKKT4syuCFkU/sod2jhMijB42XBhov1xUqn8B2biaFcPEc11vbPK
         4Hsw==
X-Gm-Message-State: AOJu0YxgHXvdhYvYIi5L5sJ8CiMiHm0NAhPcnBm72L5+hhI+Qx/Eh981
	Svhg+akRgVul+/mEkrV5bhg=
X-Google-Smtp-Source: AGHT+IGlxvV1bY69VvuuL9ouNfj0x55GucbT/3lD15m+LNdSkViLselRgTy1gqXJdNfOOXiwuwqENw==
X-Received: by 2002:ac8:7d4f:0:b0:41e:204b:e978 with SMTP id h15-20020ac87d4f000000b0041e204be978mr12479125qtb.66.1698683636525;
        Mon, 30 Oct 2023 09:33:56 -0700 (PDT)
Received: from localhost (modemcable065.128-200-24.mc.videotron.ca. [24.200.128.65])
        by smtp.gmail.com with ESMTPSA id x21-20020ac86b55000000b004166ab2e509sm3500719qts.92.2023.10.30.09.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 09:33:56 -0700 (PDT)
Date: Mon, 30 Oct 2023 12:33:55 -0400
From: Benjamin Poirier <benjamin.poirier@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jakub Kicinski <kuba@kernel.org>
Cc: Kira <nyakov13@gmail.com>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Coiby Xu <coiby.xu@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Sven Joachim <svenjoac@gmx.de>,
	Ian Kent <raven@themaw.net>, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: Revert "staging: qlge: Retire the driver"
Message-ID: <ZT_YntDOYEdlpx5x@d3>
References: <20231030150400.74178-1-benjamin.poirier@gmail.com>
 <2023103001-drew-parmesan-c61a@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023103001-drew-parmesan-c61a@gregkh>

On 2023-10-30 16:25 +0100, Greg Kroah-Hartman wrote:
> On Tue, Oct 31, 2023 at 02:04:00AM +1100, Benjamin Poirier wrote:
> > This reverts commit 875be090928d19ff4ae7cbaadb54707abb3befdf.
> > 
> > On All Hallows' Eve, fear and cower for it is the return of the undead
> > driver.
> > 
> > There was a report [1] from a user of a QLE8142 device. They would like for
> > the driver to remain in the kernel. Therefore, revert the removal of the
> > qlge driver.
> > 
> > [1] https://lore.kernel.org/netdev/566c0155-4f80-43ec-be2c-2d1ad631bf25@gmail.com/
> 
> Who's going to maintain this?

I was planning to update the MAINTAINERS entry to
S:	Orphan
when moving it back to drivers/net/. Would you prefer that I do that
change in a second patch right after the revert in staging? That would
certainly make things clearer.

> > Reported by: Kira <nyakov13@gmail.com>
> > Signed-off-by: Benjamin Poirier <benjamin.poirier@gmail.com>
> > ---
> > 
> > Notes:
> >     Once the removal and revert show up in the net-next tree, I plan to send a
> >     followup patch to move the driver to drivers/net/ as discussed earlier:
> >     https://lore.kernel.org/netdev/20231019074237.7ef255d7@kernel.org/
> 
> are you going to be willing to maintain this and keep it alive?

No.

> I'm all this, if you want to, but I would like it out of staging.  So

I'd like it out of staging as well. Since nobody wants to maintain it, I
think it should be deleted. However, my understanding is that Jakub is
willing to take it back into drivers/net/ as-is given that there is at
least one user. Jakub, did I understand that correctly?

> how about applying this, and a follow-on one that moves it there once
> -rc1 is out?  And it probably should be in the 'net' tree, as you don't
> want 6.7 to come out without the driver at all, right?

Right about making sure 6.7 includes the driver. The 'net' tree is
usually for fixes hence why I would send to net-next. So the driver
would still be in staging for 6.7 (if you include the revert in your
6.7-rc1 submission) and would be back in drivers/net/ for 6.8.

> > +QLOGIC QLGE 10Gb ETHERNET DRIVER
> > +M:	Manish Chopra <manishc@marvell.com>
> > +M:	GR-Linux-NIC-Dev@marvell.com
> > +M:	Coiby Xu <coiby.xu@gmail.com>
> > +L:	netdev@vger.kernel.org
> > +S:	Supported
> > +F:	Documentation/networking/device_drivers/qlogic/qlge.rst
> > +F:	drivers/staging/qlge/
> 
> It's obvious taht these people are not maintaining this code, so they
> should be dropped from the MAINTAINERS file as well.

I agree.
