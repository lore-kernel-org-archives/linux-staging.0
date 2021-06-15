Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A5F82FB2
	for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 08:45:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id F212061428
	for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 08:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623746748;
	bh=euu46a5HmIGMgUUgLt4AGXGV7qIelJ+jWdnF2TyhCgg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UWpgWZJ02pjk9Vkm4Tz5teRYpKnl3yniEyKydm/yS9Qw/R2mr9Mims8INp5VUvF7C
	 Lg9l0kgh+JIdYaxnlb6haVqBLT1vgLxY/ybIPnE1Tz9/U+BWAPsrLaU1fwNQ0I74os
	 WzJfQO4E4nojEBj91mrxgjDhdq0F3nzlX1E1P1wjVnSNv/I2ygEhVTv8NHUCl1yGFe
	 xxLJ4Io8eEJMWla2l0KFBdTPKICYAa5O8zZ65B9Ug2gafc32EW/ZuKtgSYBBT/thQW
	 yTbAX/1Y9GYTrxUwShvQszbFS+NMSZ2XR9y8Kci7ndoQeWxbDoo/AfOa6aFNyzKY36
	 WC31psJ57Kr/Q==
Received: by mail-wr1-f49.google.com with SMTP id a20so17421066wrc.0
        for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 01:45:47 -0700 (PDT)
X-Gm-Message-State: AOAM533yPJKYOVWfavr5+oVO19aFXCZ88HmrlFAdk/OOPnE5VJDbJ3zE
	cZ4jxdH9gviksGQBJhaDlohv02DA5QaEzWg47C4=
X-Google-Smtp-Source: ABdhPJw+QLMgXeE31DnC/gXDVzuLKSe8HXzA+bDPY1jQioViACBluaP0ozszto46RsU0ZGQccBLP7EnooEuRM6ToECk=
X-Received: by 2002:a5d:4050:: with SMTP id w16mr23823101wrp.99.1623746746586;
 Tue, 15 Jun 2021 01:45:46 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210614103409.3154127-1-arnd@kernel.org> <20210614103409.3154127-5-arnd@kernel.org>
 <YMeLlvALJ5nJbQGg@pendragon.ideasonboard.com>
In-Reply-To: <YMeLlvALJ5nJbQGg@pendragon.ideasonboard.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 15 Jun 2021 10:43:41 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1+cWFn8=xyGwZ0c7fWr6+tdEF_sXtMpPCZypDBA_UryA@mail.gmail.com>
Message-ID: <CAK8P3a1+cWFn8=xyGwZ0c7fWr6+tdEF_sXtMpPCZypDBA_UryA@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] media: subdev: remove VIDIOC_DQEVENT_TIME32 handling
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Eduardo Valentin <edubezval@gmail.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vaibhav Gupta <vaibhavgupta40@gmail.com>, 
	Liu Shixin <liushixin2@huawei.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 14, 2021 at 7:02 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Mon, Jun 14, 2021 at 12:34:05PM +0200, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > Converting the VIDIOC_DQEVENT_TIME32/VIDIOC_DQEVENT32/
> > VIDIOC_DQEVENT32_TIME32 arguments to the canonical form is done in common
> > code, but for some reason I ended up adding another conversion helper to
> > subdev_do_ioctl() as well. I must have concluded that this does not go
> > through the common conversion, but it has done that since the ioctl
> > handler was first added.
> >
> > I assume this one is harmless as there should be no way to arrive here
> > from user space, but since it is dead code, it should just get removed.
>
> If I'm not mistaken, this could be reached when
> !CONFIG_COMPAT_32BIT_TIME, can't it ? Still, there's no need for this
> code in that case, so it seems fine to me.

Yes, that is correct, I missed that condition. We definitely should not handle
the command in that case.

Hans, since you mentioned you would pick up this patch, I assume  you
are going to reword the patch as you see fit. If you prefer me to resend it,
let me know.

       Arnd
