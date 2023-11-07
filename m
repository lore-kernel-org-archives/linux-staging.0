Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91ED11FA6
	for <linux-staging@lists.linux.dev>; Tue,  7 Nov 2023 02:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4KT+lBH"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7781bc3783fso361244485a.1
        for <linux-staging@lists.linux.dev>; Mon, 06 Nov 2023 18:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699323323; x=1699928123; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fk4C8pGkEaO0aYtx+9DFxGow47hYHSHoEQjYuyisEbA=;
        b=Y4KT+lBHr5buv2HcS4qqdAe3vn9v2VGERK0OWzlptaIJPse1nwyhMSuHcmQWG2+5Qw
         SI8RYNH+XIjH4s7QeR9XLlR0IgUUhviIht7mLWIYdbefK/6mVmBWF9jhoZ8tbCZJeXaC
         BynMxjKIsuUv9t/SnS27q8oPfxWVYMr8T36MvxN3ZmCSlpIUBPxqYL/7HaydJsP5LXIA
         JzbVfv2iAXmtrXimSQv4Xa87H67lFfAtWuwom53ISSfbpwnkOh7GCC7jWTK4nkZyAnTG
         RRY916OdPWCbQwQ8oVosB4tU/ErCEy2txKNUwFq0uczu6FS1GT6k/o3AKTRqv55I/zth
         EXlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699323323; x=1699928123;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fk4C8pGkEaO0aYtx+9DFxGow47hYHSHoEQjYuyisEbA=;
        b=BaPcswCg5WGs8vmvvKsD0S+Br0e4uS53ZcoEQfoEfItYfLbzq6fKbprs8o6UDfHeqX
         k67MUJ383NjevX+fKAX7gX3yU9RKm7MXg9R4wTT3c1eS1VArpdzt5JCY/IjNc0Hj44NS
         cXnZXvaCGivWsN7j5yHwfdXwhcpyI6WalDWdwwlse3+L63n1zFpSqgIe3QXNowg4Zs9M
         oygUIi0LWLU8yFQy7ORWHz6atEetFascAWN7QcnhmAzmwdoXhd+feuerFniimOXF4BxS
         GPLNS3b6/4DRy3m3KD4gb1nNq7sl7W5ltoHhX3OA+oYGoIBzeYqJyFoiD4tsoiIgcisb
         PmKA==
X-Gm-Message-State: AOJu0Yz2NDMcNft1zbkc5ubyOMrrC/C1W8/UL99g7+jVmkfNLaPIvNRy
	Qzr8/KN4rO5c9VpG27iEo7s=
X-Google-Smtp-Source: AGHT+IEsbtgEtm1ThrU0RGNHI2w6rhkc5V3NUgJtzFwqjIS7wWzE7nSayyO4ZlyBcgrFPy4Qz6FqbA==
X-Received: by 2002:a05:620a:40ca:b0:779:f0a1:3128 with SMTP id g10-20020a05620a40ca00b00779f0a13128mr37320412qko.63.1699323323340;
        Mon, 06 Nov 2023 18:15:23 -0800 (PST)
Received: from localhost (modemcable065.128-200-24.mc.videotron.ca. [24.200.128.65])
        by smtp.gmail.com with ESMTPSA id bs10-20020a05620a470a00b00777611164c6sm3829790qkb.15.2023.11.06.18.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 18:15:23 -0800 (PST)
Date: Mon, 6 Nov 2023 21:15:21 -0500
From: Benjamin Poirier <benjamin.poirier@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kira <nyakov13@gmail.com>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Coiby Xu <coiby.xu@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Sven Joachim <svenjoac@gmx.de>,
	Ian Kent <raven@themaw.net>, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: Revert "staging: qlge: Retire the driver"
Message-ID: <ZUmduQ_xKMHF6IY9@d3>
References: <20231030150400.74178-1-benjamin.poirier@gmail.com>
 <2023110655-swarm-parka-177d@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023110655-swarm-parka-177d@gregkh>

On 2023-11-06 07:54 +0100, Greg Kroah-Hartman wrote:
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
> <snip>
> 
> > --- /dev/null
> > +++ b/drivers/staging/qlge/TODO
> > @@ -0,0 +1,28 @@
> > +* commit 7c734359d350 ("qlge: Size RX buffers based on MTU.", v2.6.33-rc1)
> > +  introduced dead code in the receive routines, which should be rewritten
> > +  anyways by the admission of the author himself, see the comment above
> > +  qlge_build_rx_skb(). That function is now used exclusively to handle packets
> > +  that underwent header splitting but it still contains code to handle non
> > +  split cases.
> > +* truesize accounting is incorrect (ex: a 9000B frame has skb->truesize 10280
> > +  while containing two frags of order-1 allocations, ie. >16K)
> > +* while in that area, using two 8k buffers to store one 9k frame is a poor
> > +  choice of buffer size.
> > +* in the "chain of large buffers" case, the driver uses an skb allocated with
> > +  head room but only puts data in the frags.
> > +* rename "rx" queues to "completion" queues. Calling tx completion queues "rx
> > +  queues" is confusing.
> > +* struct rx_ring is used for rx and tx completions, with some members relevant
> > +  to one case only
> > +* the flow control implementation in firmware is buggy (sends a flood of pause
> > +  frames, resets the link, device and driver buffer queues become
> > +  desynchronized), disable it by default
> > +* the driver has a habit of using runtime checks where compile time checks are
> > +  possible (ex. qlge_free_rx_buffers())
> > +* reorder struct members to avoid holes if it doesn't impact performance
> > +* use better-suited apis (ex. use pci_iomap() instead of ioremap())
> > +* remove duplicate and useless comments
> > +* fix weird line wrapping (all over, ex. the qlge_set_routing_reg() calls in
> > +  qlge_set_multicast_list()).
> > +* remove useless casts (ex. memset((void *)mac_iocb_ptr, ...))
> > +* fix checkpatch issues
> 
> In looking at this again, are you sure you all want this in the tree?
> I'm glad to take the revert but ONLY if you are willing to then take a
> "move this to drivers/net/" patch for the code as well, WITH an actual
> maintainer and developer who is willing to do the work for this code.
> 
> In all the years that this has been in the staging tree, the listed
> maintainers have not been active at all from what I can remember, and
> obviously the above list of "things to fix" have not really been worked
> on at all.
> 
> So why should it be added back?  I understand there is at least one
> reported user, but for drivers in the staging tree, that's not a good
> reason to keep them around if there is not an actual maintainer that is
> willing to do the work.
> 
> Which reminds me, we should probably sweep the drivers/staging/ tree
> again to see what we can remove given a lack of real development.
> Normally we do that every other year or so, and this driver would fall
> into the "no one is doing anything with it" category and should be
> dropped.

Thank you for revisiting this topic. I agree with you that it's better
not to add orphaned code back into the kernel. I didn't want users to be
left out in the cold by the removal of the driver, so I just created a
dkms package as a fallback:
https://github.com/gobenji/qlge-dkms

People who want to use qlge with the latest kernel can use that package.
Since the driver code is not mainline quality and there isn't much
willingness to invest in its improvement, I think it's fitting that the
code lives out of tree. Of course, if somebody takes ownership of the
code and substantially improves it, they can submit it back to netdev.
