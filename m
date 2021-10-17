Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B942C83
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 12:18:33 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id u18so35876231wrg.5
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 05:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=7DhS3xtuHzWs9QFl24FwJLyWw4/xQqInsj4QCIIJh1M=;
        b=hfqh5imm8xBcObv8zzNvDJf0CPixtc+OiYm7Pmulk2GUF73IcUMg8bCyRAWwQfqVeC
         cBmyZs5v8w+Xo8UmL8nrCgIxNRBntW+MMthZ4lPq/Au0lg1SebjM6pBW7I9ydeEUoe7j
         PEeRaAl97ndUEshNHBejYMWAtpw21IdsqAxGg11AW07D5LCShV5nnx2Q1wtpJdCEmngN
         TLHpA1fvJbMdcW+Yghp/riRGRwLXqFAxESeNE5TcP2IBQSvpUf6MIYQR4vS8w1xawCBQ
         P77llcvI1y5cBdtL/SAOf6G9Xsf8wZVJ3LloHgSfAsRr+2xCMKYDIiwgj4EnvQOeOvV6
         YfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7DhS3xtuHzWs9QFl24FwJLyWw4/xQqInsj4QCIIJh1M=;
        b=fion5fs/sMUKA5C+0zkGa9/SWlv+AfzSmZGyClrMf7VYK4UH3ZIKJ82aBXbuGFig5P
         Cx9mFsc99S41mkpLT6Fzp/wNrjxLb45YIuN+JfvjthGT4bwmFmr6xiazgnPT4BaZTLwl
         ye1q4W2FOEyWUpMgmdBZ+SaIEbhNKEGmCyJzzmJEe6jrNGQNRWd6dIc3DdnXv5m7cw5h
         hF0D4KRBGrTTWFKdTk/bkenP3Cr7xubfJzFyN90E3b9KBVDNW/OBK+fNJVJzvtDrvfjd
         kCwfaNSZYfjuORTwmD6agVE/1uDd/aDJaEPcsI26bVwt3HuUzdIvSeFNPpZ61YXFSdOi
         wkxw==
X-Gm-Message-State: AOAM531fdeXxzLCtP+MEZVL8omMawhhC3ihGvbAcSaRcYiW4m89HlThw
	G5zsVJaF0hPkWNevoA8Q1ec=
X-Google-Smtp-Source: ABdhPJzvF+3lwjBeblRFndrqh1FPhC4J83Ycrrcf7GJLrnmvnfaXZiANaC7NSmEa2O01+MTfvQd63Q==
X-Received: by 2002:adf:bb08:: with SMTP id r8mr29415642wrg.247.1634473112164;
        Sun, 17 Oct 2021 05:18:32 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::d7f0? ([2a02:8108:96c0:3b88::d7f0])
        by smtp.gmail.com with ESMTPSA id i203sm12329666wma.48.2021.10.17.05.18.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Oct 2021 05:18:31 -0700 (PDT)
Message-ID: <c66442a2-51fd-70bf-d9cf-5991c0d88a76@gmail.com>
Date: Sun, 17 Oct 2021 14:18:30 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/3] staging: r8188eu: Makefile: don't overwrite global
 settings
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20211016173544.25376-1-martin@kaiser.cx>
 <20211016173544.25376-3-martin@kaiser.cx>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20211016173544.25376-3-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/21 19:35, Martin Kaiser wrote:
> Remove settings from the Makefile that are set by higher-level Makefiles.
> 
> Some of those settings might have been useful when the driver was
> maintained out of tree.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>   drivers/staging/r8188eu/Makefile | 14 --------------
>   1 file changed, 14 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/Makefile b/drivers/staging/r8188eu/Makefile
> index fccf7e6d1520..8294fb69ecf9 100644
> --- a/drivers/staging/r8188eu/Makefile
> +++ b/drivers/staging/r8188eu/Makefile
> @@ -1,8 +1,3 @@
> -SHELL := /bin/bash
> -EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)
> -EXTRA_CFLAGS += -O1
> -
> -ccflags-y += -D__CHECK_ENDIAN__
>   
>   OUTSRC_FILES :=				\
>   		hal/HalHWImg8188E_MAC.o	\
> @@ -46,15 +41,6 @@ _OS_INTFS_FILES :=				\
>   
>   _HAL_INTFS_FILES += $(OUTSRC_FILES)
>   
> -SUBARCH := $(shell uname -m | sed -e "s/i.86/i386/; s/ppc.*/powerpc/; s/armv.l/arm/; s/aarch64/arm64/;")
> -
> -ARCH ?= $(SUBARCH)
> -CROSS_COMPILE ?=
> -KVER  ?= $(if $(KERNELRELEASE),$(KERNELRELEASE),$(shell uname -r))
> -KSRC ?= $(if $(KERNEL_SRC),$(KERNEL_SRC),/lib/modules/$(KVER)/build)
> -MODDESTDIR := /lib/modules/$(KVER)/kernel/drivers/net/wireless
> -INSTALL_PREFIX :=
> -
>   rtk_core :=				\
>   		core/rtw_ap.o		\
>   		core/rtw_br_ext.o	\
> 

Hi Martin, this patch introduces a GCC warning on my system.

drivers/staging/r8188eu/os_dep/ioctl_linux.c: In function 
'rtw_wx_set_enc_ext':
drivers/staging/r8188eu/os_dep/ioctl_linux.c:1929:9: warning: 'strncpy' 
specified bound 16 equals destination size [-Wstringop-truncation]
  1929 |         strncpy((char *)param->u.crypt.alg, alg_name, 
IEEE_CRYPT_ALG_NAME_LEN);
       | 
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Regards,
Michael
