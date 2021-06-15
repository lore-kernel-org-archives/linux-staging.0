Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35A02FB2
	for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 09:32:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 825E761444
	for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 09:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1623749527;
	bh=WbofU3FbbPnSFXGeih/K3AMtLhSjIQgK3sc/aG4zmXU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qX/2gxMvKmjEEelxOB0d3buCBcdgjJ3LuV3zdSKhspD6phd/ocQduCf2DWfEuk2ze
	 EQkYq0fUHWhH5t/LvP57FzSkz0SMJUg2nPOxzp4+Le58orVZdwG/Hz30do9NHk85TJ
	 ELOZE2UrIFsnpXBKVkLt9RdEoUBIvZkFjMBb6IOMtiXPVGjA4QkJPXOFuoKrPXb02m
	 YGndUlA+P7sqcIieDzJoEh7AisaFTttGuPcMzig0v356w0OD8Y19xRqpUrbt/kOZ12
	 QqjPWFHGKVzVULtDgaUFOcvsu96UuiGo8aYVmgmKpOQc2MSRVfe6ECypmxSq8zvo1P
	 HJ6AGyQb2mj0Q==
Received: by mail-wr1-f46.google.com with SMTP id c9so17526024wrt.5
        for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 02:32:07 -0700 (PDT)
X-Gm-Message-State: AOAM533x+NLYYdRtMnJLXpzhHKrUKtPtGNZXJoT5cpIoNXDkS44mNiz0
	0GB0IxQOVEIx55o7Wh51cenNEpeeszQr+4vtFIA=
X-Google-Smtp-Source: ABdhPJwmwrAj+HbY8cKh+bdy51yfiLozrgmgXfPdk51ugRDwwTBIvfGQgxCF9oB0Bw7h6/zv9AbvDhW54LJT3coIgok=
X-Received: by 2002:a5d:530c:: with SMTP id e12mr24054560wrv.165.1623749526074;
 Tue, 15 Jun 2021 02:32:06 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210614103409.3154127-1-arnd@kernel.org> <20210614103409.3154127-5-arnd@kernel.org>
 <YMeLlvALJ5nJbQGg@pendragon.ideasonboard.com> <CAK8P3a1+cWFn8=xyGwZ0c7fWr6+tdEF_sXtMpPCZypDBA_UryA@mail.gmail.com>
 <e3162d4c-d40d-442d-39a0-c99c4328932e@xs4all.nl>
In-Reply-To: <e3162d4c-d40d-442d-39a0-c99c4328932e@xs4all.nl>
From: Arnd Bergmann <arnd@kernel.org>
Date: Tue, 15 Jun 2021 11:30:01 +0200
X-Gmail-Original-Message-ID: <CAK8P3a34n1ZXZn2cT1nBoDXMYLw6oLuU3jGiCW=X+7ZHDio9Mg@mail.gmail.com>
Message-ID: <CAK8P3a34n1ZXZn2cT1nBoDXMYLw6oLuU3jGiCW=X+7ZHDio9Mg@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] media: subdev: remove VIDIOC_DQEVENT_TIME32 handling
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, 
	Eduardo Valentin <edubezval@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Vaibhav Gupta <vaibhavgupta40@gmail.com>, 
	Liu Shixin <liushixin2@huawei.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 15, 2021 at 10:48 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> On 15/06/2021 10:43, Arnd Bergmann wrote:
> > On Mon, Jun 14, 2021 at 7:02 PM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> >>
> >> On Mon, Jun 14, 2021 at 12:34:05PM +0200, Arnd Bergmann wrote:
> >>> From: Arnd Bergmann <arnd@arndb.de>
> >>>
> >>> Converting the VIDIOC_DQEVENT_TIME32/VIDIOC_DQEVENT32/
> >>> VIDIOC_DQEVENT32_TIME32 arguments to the canonical form is done in common
> >>> code, but for some reason I ended up adding another conversion helper to
> >>> subdev_do_ioctl() as well. I must have concluded that this does not go
> >>> through the common conversion, but it has done that since the ioctl
> >>> handler was first added.
> >>>
> >>> I assume this one is harmless as there should be no way to arrive here
> >>> from user space, but since it is dead code, it should just get removed.
>
> I changed this to:
>
> "I assume this one is harmless as there should be no way to arrive here
> from user space if CONFIG_COMPAT_32BIT_TIME is set,"
>
> If it is not set, then this will just fall into the default case and is
> handled as if it is a potential custom ioctl, as you would expect.
>
> Let me know if you have a better text, I can still update it.

Looks good. One more sentence I would add:

"On a 64-bit architecture, as well as a 32-bit architecture without
CONFIG_COMPAT_32BIT_TIME, handling this command is a mistake,
and the kernel should return an error".

         Arnd
