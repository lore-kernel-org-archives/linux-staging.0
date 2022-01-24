Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21747168
	for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 11:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98ECFC340E1;
	Mon, 24 Jan 2022 11:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643022847;
	bh=pWbAVqvlanavGzk9kZty9AqVehAAJjhyHUN84PC9GJE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=iwc7SwTARMJQvgY+M7L8auQftwQD30I3RZAbRDEp3qptprfyWZQozBY/gfFwtHI90
	 VOPbUirzTmeeHc0mxefWS+SYLY+vE1qjhK7qQEdjDD3ebtA+F4rLJRX513mr5Zrctn
	 wkF1NtoeLD7jgNHnqMK0BPQMqYdsGXqY0ds5pPyl5bLZdw9sQLiDaXzbbRkFgSLzUq
	 x01NiDHwyf2PBcIBsOTZ4EgTLZsVNcMH39/uu/CqGeegMBH3p5M2i5NGT0SGJ6Zhrt
	 omePcbxP214IIiND3XJdir7Oz9jZE/xVL+B8lXibRk7uFMiRC8a3rNEKfFsCdwELXX
	 bh92T3k3UPQ0w==
Date: Mon, 24 Jan 2022 12:14:01 +0100
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Tsuchiya Yuto
 <kitakar@gmail.com>, Andy Shevchenko <andy@kernel.org>, Yury Luneff
 <yury.lunev@gmail.com>, Nable <nable.maininbox@googlemail.com>,
 andrey.i.trufanov@gmail.com, Fabio Aiuto <fabioaiuto83@gmail.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: Bay Trail atomisp support update (was [PATCH 0/9] media:
 atomisp: ...)
Message-ID: <20220124121401.3ec603e1@coco.lan>
In-Reply-To: <b345aac6-70fb-c278-195c-1761e0af7821@redhat.com>
References: <20220116215204.307649-1-hdegoede@redhat.com>
	<b345aac6-70fb-c278-195c-1761e0af7821@redhat.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Hans,

Em Mon, 24 Jan 2022 11:37:58 +0100
Hans de Goede <hdegoede@redhat.com> escreveu:

> Hi All,
> 
> On 1/16/22 22:51, Hans de Goede wrote:
> > This series also contains some code to try and get things to work on
> > Bay Trail devices. This at least makes the driver load, but it does
> > not work yet and actually getting it to work may very well be quite
> > tricky.  
> 
> I've spend some more time on Bay Trail this weekend, I decided to
> start with a49d25364dfb9f8a64037488a39ab1f56c5fa419 which is the
> first commit adding atomisp to staging, since the commit msg
> there suggested that at least that commit was tested to work on
> Bay Trail.
> 
> And indeed with the current knowledge about clks + regulators
> and using the right magic nvt commandline on /dev/video2 I
> got both the back ov2680 and front gc0310 (300k sensor, ugh)
> to work on a Chuwi Hi8 tablet easily.
> 
> So now I've a mainline kernel with working atomisp on BYT,
> only problem is, it is kernel 4.11 :)
> 
> A full git log of drivers/staging/media/atomisp is 15k lines
> (I decided to go with a full log and not --oneline because
> the commit msgs contain useful info).
> 
> So my plan is to move forward in time / to newer kernel versions
> by around 1k lines of the log at a time.
> 
> The first 1000 lines took me to 4.12 and that did not work,
> but after a couple of hours of debugging I found the culprit 
> (which is actually fixed by a later commit already in mainline).
> 
> So after that another 1k lines in the changelog jump took me to
> 4.13 (lots of activity when the driver just got merged) and that
> worked in one go.
> 
> The next jump again does not work and annoyingly it hangs
> the entire system when I try to use the cams,
> so I need to bisect that one, so to be continued.
> 
> Hopefully this way I will be able to find fixes to make
> atomisp in the current mainline work on BYT. This is my main
> working item wrt atomisp atm because I believe it would be good
> to have both working (and be able to regression test both)
> before doing any further refactoring.
> 
> If anyone is interested my work on this can be found in
> various atomisp-byt-chuwi-hi8-4.xx-rcx branches in:
> https://github.com/jwrdegoede/linux-sunxi/
> 
> When every I've got a newer kernel version working I'll push
> a branch with the working code there. The idea is to be able
> to later retest other modes then the preview mode if we
> ever try to get other modes working; and then if the mode
> does work in the initial version and not in later version
> easily be able to find out when it broke.

While you're on it, I'd appreciate if you could test both MMAP and
USERPTR support. I'm assuming that sometime in the past, MMAP used 
to work, but some change - either at mm subsytem or at the driver
itself - broke it. It would be nice to be able to pinpoint the
culprit.

> 
> Regards,
> 
> Hans
> 
> 
> p.s.
> 
> Mauro I see that you have been merging various new patches
> into https://git.linuxtv.org/media_stage.git/ now that 5.17 is
> out. I assume you will eventually get around to this patch-set
> too ?
> 
> > Hans de Goede (9):
> >   media: atomisp: Don't use ifdef on IS_ISP2401
> >   media: atomisp: Don't use ifdef ISP2400
> >   media: atomisp: Use irci_stable_candrpv_0415_20150423_1753 fw for byt
> >   media: atomisp_gmin_platform: Fix axp_regulator_set() writing to the
> >     wrong register
> >   media: atomisp_gmin_platform: Add enable-count to
> >     gmin_[v1p8|v2p8]_ctrl()
> >   media: atomisp_gmin_platform: Set ELDO1 to 1.6V on devices with an
> >     AXP288 PMIC
> >   media: atomisp_gmin_platform: Do not turn ELDO2 off from axp_v1p8_on()
> >   media: atomisp_gmin_platform: Base CsiPort default on detected CLK
> >   media: atomisp_gmin_platform: Add DMI quirk to not turn AXP ELDO2
> >     regulator off on some boards
> > 
> >  .../media/atomisp/pci/atomisp_compat_css20.c  |   4 +-
> >  .../media/atomisp/pci/atomisp_gmin_platform.c | 148 +++++++++++++-----
> >  .../staging/media/atomisp/pci/atomisp_v4l2.c  |   2 +-
> >  .../media/atomisp/pci/sh_css_firmware.c       |   4 +
> >  4 files changed, 114 insertions(+), 44 deletions(-)

Yeah, I'm planning to pick those too, pending some tests here with
camorama on T101. Will try to do it along this week, if time allows.

Thanks,
Mauro
