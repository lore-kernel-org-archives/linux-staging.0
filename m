Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05E7C2C80
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 17:46:25 +0000 (UTC)
Received: from martin by viti.kaiser.cx with local (Exim 4.89)
	(envelope-from <martin@viti.kaiser.cx>)
	id 1mcAEn-0001Dd-ER; Sun, 17 Oct 2021 19:46:21 +0200
Date: Sun, 17 Oct 2021 19:46:21 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Michael Straube <straube.linux@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] staging: r8188eu: Makefile: don't overwrite global
 settings
Message-ID: <20211017174621.dkunl2xhjg4yn2at@viti.kaiser.cx>
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
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: Martin Kaiser <martin@viti.kaiser.cx>

Thus wrote Michael Straube (straube.linux@gmail.com):

> On 10/16/21 19:35, Martin Kaiser wrote:
> > Remove settings from the Makefile that are set by higher-level Makefiles.

> > Some of those settings might have been useful when the driver was
> > maintained out of tree.

> > Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> > ---
> >   drivers/staging/r8188eu/Makefile | 14 --------------
> >   1 file changed, 14 deletions(-)

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


> Hi Martin, this patch introduces a GCC warning on my system.

> drivers/staging/r8188eu/os_dep/ioctl_linux.c: In function
> 'rtw_wx_set_enc_ext':
> drivers/staging/r8188eu/os_dep/ioctl_linux.c:1929:9: warning: 'strncpy'
> specified bound 16 equals destination size [-Wstringop-truncation]
>  1929 |         strncpy((char *)param->u.crypt.alg, alg_name,
> IEEE_CRYPT_ALG_NAME_LEN);
>       |


Hi Michael,

thanks for reporting this. So far, I can't reproduce the warning, even
if I enable -Wstringop-truncation explicitly. I tried this with gcc
8.3.0 (Debian buster) on x86_64.

Could you send me your complete compiler command line for this file
(make V=1)?

Maybe it's not ok to delete the EXTRA_CFLAGS. I guessed that the
optimisation level would be set by a higher-level Makefile...

Thanks,
Martin
