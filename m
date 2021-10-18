Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8986629CA
	for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 14:46:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9002C60FC3;
	Mon, 18 Oct 2021 14:46:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1634568376;
	bh=aa6xLcTTgPTVCt0bnIwTvJIuYm9BtaYJ12b3i7boFEs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RWEzCZVRxDmZyGQVzEFMpiaT1/B6TC6/5haPsO/q5MomNrAAfnD5hYtErmuDu+YsW
	 1nVYkr0p/rC6dMS+r0Whir1jldcj0uoZvknv8VwoqKlIeO6MTGbn0wM93/Y9r3+T5G
	 VB8A6yHca90grU4KhHGTZi5exVlvoSpLyUq/UFMo=
Date: Mon, 18 Oct 2021 16:46:13 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Michael Straube <straube.linux@gmail.com>
Cc: Martin Kaiser <martin@kaiser.cx>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] staging: r8188eu: Makefile: don't overwrite global
 settings
Message-ID: <YW2ItagPdQTgWlg4@kroah.com>
References: <20211016173544.25376-1-martin@kaiser.cx>
 <20211016173544.25376-3-martin@kaiser.cx>
 <c66442a2-51fd-70bf-d9cf-5991c0d88a76@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c66442a2-51fd-70bf-d9cf-5991c0d88a76@gmail.com>

On Sun, Oct 17, 2021 at 02:18:30PM +0200, Michael Straube wrote:
> On 10/16/21 19:35, Martin Kaiser wrote:
> > Remove settings from the Makefile that are set by higher-level Makefiles.
> > 
> > Some of those settings might have been useful when the driver was
> > maintained out of tree.
> > 
> > Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> > ---
> >   drivers/staging/r8188eu/Makefile | 14 --------------
> >   1 file changed, 14 deletions(-)
> > 
> > diff --git a/drivers/staging/r8188eu/Makefile b/drivers/staging/r8188eu/Makefile
> > index fccf7e6d1520..8294fb69ecf9 100644
> > --- a/drivers/staging/r8188eu/Makefile
> > +++ b/drivers/staging/r8188eu/Makefile
> > @@ -1,8 +1,3 @@
> > -SHELL := /bin/bash
> > -EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)
> > -EXTRA_CFLAGS += -O1
> > -
> > -ccflags-y += -D__CHECK_ENDIAN__
> >   OUTSRC_FILES :=				\
> >   		hal/HalHWImg8188E_MAC.o	\
> > @@ -46,15 +41,6 @@ _OS_INTFS_FILES :=				\
> >   _HAL_INTFS_FILES += $(OUTSRC_FILES)
> > -SUBARCH := $(shell uname -m | sed -e "s/i.86/i386/; s/ppc.*/powerpc/; s/armv.l/arm/; s/aarch64/arm64/;")
> > -
> > -ARCH ?= $(SUBARCH)
> > -CROSS_COMPILE ?=
> > -KVER  ?= $(if $(KERNELRELEASE),$(KERNELRELEASE),$(shell uname -r))
> > -KSRC ?= $(if $(KERNEL_SRC),$(KERNEL_SRC),/lib/modules/$(KVER)/build)
> > -MODDESTDIR := /lib/modules/$(KVER)/kernel/drivers/net/wireless
> > -INSTALL_PREFIX :=
> > -
> >   rtk_core :=				\
> >   		core/rtw_ap.o		\
> >   		core/rtw_br_ext.o	\
> > 
> 
> Hi Martin, this patch introduces a GCC warning on my system.
> 
> drivers/staging/r8188eu/os_dep/ioctl_linux.c: In function
> 'rtw_wx_set_enc_ext':
> drivers/staging/r8188eu/os_dep/ioctl_linux.c:1929:9: warning: 'strncpy'
> specified bound 16 equals destination size [-Wstringop-truncation]
>  1929 |         strncpy((char *)param->u.crypt.alg, alg_name,
> IEEE_CRYPT_ALG_NAME_LEN);
>       |
> ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

As you all found out, that's due to the -O1 removal which was hiding
this mess :(

let me see if I can fix this up...

greg k-h
