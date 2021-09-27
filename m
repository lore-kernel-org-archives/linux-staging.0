Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CBA3FE7
	for <linux-staging@lists.linux.dev>; Mon, 27 Sep 2021 20:37:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A08E1611ED
	for <linux-staging@lists.linux.dev>; Mon, 27 Sep 2021 20:37:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632775057;
	bh=NeUUzwH/N8Mxr/MptmnO1QpXNuxBYMSvWijcnRAB0rs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dM7a5n6bKskDFm+rcd423iRtrg5HlMw5RYVivLUvqi2jbLSmcL+mOVQXMdd/Qd0C8
	 tlgYFY6w0DR9YZVjij4dWFj258tIDdI8NN0eZIJqLpDs35C4+TygQGLcUkOFYvxv4g
	 u8yCP/FG/vMBxWCbSv05voHX52ygh8V2EJJZ8rYXV56/YGnCXQUp6J4uTiqJd+NFYJ
	 IjU8p2KZ/0ebKvc0M7PptMKv89TOpIuBhfTfBnOfy0XdcXzYeCtiEMheMDRG1yN2vk
	 cSJhlzSz7WgN6eQxB/WzgOhO48d/m7ufBt88PYvtDOlplgxL3sSESwBAXOPWRT67Ce
	 iO4qUs9sTVBbA==
Received: by mail-wr1-f43.google.com with SMTP id g16so54115968wrb.3
        for <linux-staging@lists.linux.dev>; Mon, 27 Sep 2021 13:37:37 -0700 (PDT)
X-Gm-Message-State: AOAM531rCb9PyezEay2A+y+0jcixbZJb1BXFWmEAT4BCIMuLLXf0zSJu
	sJ5ZK3yC26irqw/qGieZOejCOtzJ9TDnUyLeURI=
X-Google-Smtp-Source: ABdhPJyUjAenq8joWGQ+N3TX7sXIr6eIaAVJ4XnFudXXN00YfpEG4fWYLlCkpjLBJK0bxVz4FkbyqI3WSSR4KdJleDM=
X-Received: by 2002:adf:f481:: with SMTP id l1mr2122067wro.411.1632775056188;
 Mon, 27 Sep 2021 13:37:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210927113702.3866843-1-arnd@kernel.org> <20210927122658.GF2048@kadam>
 <011c53e6-d628-02b7-fc18-ca3165a45f98@raspberrypi.com>
In-Reply-To: <011c53e6-d628-02b7-fc18-ca3165a45f98@raspberrypi.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 27 Sep 2021 22:37:20 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0_RBc6dCzzGcxzC=g5ODDia-9nQcKROWSPm4jVAJgEnA@mail.gmail.com>
Message-ID: <CAK8P3a0_RBc6dCzzGcxzC=g5ODDia-9nQcKROWSPm4jVAJgEnA@mail.gmail.com>
Subject: Re: [PATCH] staging: vc04_services: shut up out-of-range warning
To: Phil Elwell <phil@raspberrypi.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Stefan Wahren <stefan.wahren@i2se.com>, Ojaswin Mujoo <ojaswin98@gmail.com>, 
	Amarjargal Gundjalam <amarjargal16@gmail.com>, 
	bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, 
	"moderated list:BROADCOM BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 27, 2021 at 3:22 PM Phil Elwell <phil@raspberrypi.com> wrote:
> On 27/09/2021 13:26, Dan Carpenter wrote:
> > On Mon, Sep 27, 2021 at 01:36:56PM +0200, Arnd Bergmann wrote:
> >> From: Arnd Bergmann <arnd@arndb.de>
> >>
> >> -    if (num_pages > (SIZE_MAX - sizeof(struct pagelist) -
> >> +    if ((size_t)num_pages > (SIZE_MAX - sizeof(struct pagelist) -
> >>                       sizeof(struct vchiq_pagelist_info)) /
> >>                      (sizeof(u32) + sizeof(pages[0]) +
> >>                       sizeof(struct scatterlist)))
> >
> > The temptation would be to declare "num_pages" as size_t instead of
> > adding this cost.  But then something will complain about the
> > "pagelistinfo->num_pages = num_pages;" assignment because
> > "pagelistinfo->num_pages" is a u32.
> >
> > The next temptation is to change the SIZE_MAX to UINT_MAX.  I didn't
> > do that originally because I can't test this and I was trying not to
> > break things...  We probably still don't want to break things, but maybe
> > there is someone who is more familiar with this who knows if UINT_MAX is
> > okay?
>
> The VPU can't address more than 1GB directly, so UINT_MAX is more than sufficient.

Is there a macro that already defines that 1GB size, or maybe an even smaller
value that makes sense as an upper bound?

         Arnd
