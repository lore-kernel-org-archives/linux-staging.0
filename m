Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3014A2C82
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 20:46:15 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id i12so37369583wrb.7
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 13:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=KOxllP0CsFaQwck1gqqXUocg+f4gw2Oht6zSSdjO3wo=;
        b=bWi1Q+qOAZXFK3R0FJiU9geX4X/86BIeWFlk7hKJXJNsQUuWo1cVotj/6OyHAtQfJ9
         T+UjAg4QP93bWFEPRSRL+UFMCB1gCO4OuwcY6DSfvA+cyNI0SpjfBw+0cXvrOy0RzV1H
         xnJWqwBt755xTpzj7qhj5Kwti+no/XQDCs37RcYVoaA2yZaYtSLTh5xH+xQ3O/ElmOfa
         yl4r9ms829/pc2mUqfqB+1g3a4eme0P7LbaPL3hvAQmbXJmZ3Y40dbHZW+o0lSjpu1Po
         y+lUf1eNpq2jXzj6G3VewF3BceTPzRi2JJ2icQ4GDtL3P7RYiGiSHYeXsNR45do8ApCx
         kyOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KOxllP0CsFaQwck1gqqXUocg+f4gw2Oht6zSSdjO3wo=;
        b=caWetEKkbbT09FwU4Fie8poW2NSBeNshG6iBYbKloUMckVbkcvAc7SAMYmHh4yvO4M
         kPx7WOwZ8bxEITtRqvg3/HWhs33duSjrmdPZAohJVy8ikTuvtzQrjxNeGlPOxDKV/Nlu
         LHFDsV53zKbYIg4bRhpKjtre1Dgovzvn9oDwLF4NJw0e7hewI0UXreDmRcgVn0UaZAGd
         QA7agZeACZr52n4Hs3a4NldXxaVDUd0TgjwALk8PM0Tjwr5sGZgrk3exAx1R2wL2Sg4V
         rAGeTxgYTtA+Ez6Ye7rC3tOWyq3Qv6G4Daw/FPwm4EILhUoRG01HgN/lfY/pAvjA2zz3
         654Q==
X-Gm-Message-State: AOAM531aRys28BllV9+VVHO4x0etkJO/2QDagDMddyUfvnbaeOC2XYJT
	5vDU0fD6C0d944b0OjTbimnAg4b2qI0=
X-Google-Smtp-Source: ABdhPJztmz3epuwbK1CEGP8O4ZXdMFGf4OiSTX8/QbpHnFdxjlTtPJAvCkMmjPjVDw4MfYuJ9/IH7Q==
X-Received: by 2002:a5d:47cd:: with SMTP id o13mr31313003wrc.85.1634503573540;
        Sun, 17 Oct 2021 13:46:13 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::3de4? ([2a02:8108:96c0:3b88::3de4])
        by smtp.gmail.com with ESMTPSA id d9sm10702737wrm.96.2021.10.17.13.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Oct 2021 13:46:13 -0700 (PDT)
Message-ID: <54987f44-cabf-c12c-ae3b-341ff6b1ed98@gmail.com>
Date: Sun, 17 Oct 2021 22:46:11 +0200
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
To: Martin Kaiser <martin@kaiser.cx>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20211016173544.25376-1-martin@kaiser.cx>
 <20211016173544.25376-3-martin@kaiser.cx>
 <c66442a2-51fd-70bf-d9cf-5991c0d88a76@gmail.com>
 <20211017174621.dkunl2xhjg4yn2at@viti.kaiser.cx>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20211017174621.dkunl2xhjg4yn2at@viti.kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/21 19:46, Martin Kaiser wrote:
> Thus wrote Michael Straube (straube.linux@gmail.com):
> 
>> On 10/16/21 19:35, Martin Kaiser wrote:
>>> Remove settings from the Makefile that are set by higher-level Makefiles.
> 
>>> Some of those settings might have been useful when the driver was
>>> maintained out of tree.
> 
>>> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
>>> ---
>>>    drivers/staging/r8188eu/Makefile | 14 --------------
>>>    1 file changed, 14 deletions(-)
> 
>>> diff --git a/drivers/staging/r8188eu/Makefile b/drivers/staging/r8188eu/Makefile
>>> index fccf7e6d1520..8294fb69ecf9 100644
>>> --- a/drivers/staging/r8188eu/Makefile
>>> +++ b/drivers/staging/r8188eu/Makefile
>>> @@ -1,8 +1,3 @@
>>> -SHELL := /bin/bash
>>> -EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)
>>> -EXTRA_CFLAGS += -O1
>>> -
>>> -ccflags-y += -D__CHECK_ENDIAN__
>>>    OUTSRC_FILES :=				\
>>>    		hal/HalHWImg8188E_MAC.o	\
>>> @@ -46,15 +41,6 @@ _OS_INTFS_FILES :=				\
>>>    _HAL_INTFS_FILES += $(OUTSRC_FILES)
>>> -SUBARCH := $(shell uname -m | sed -e "s/i.86/i386/; s/ppc.*/powerpc/; s/armv.l/arm/; s/aarch64/arm64/;")
>>> -
>>> -ARCH ?= $(SUBARCH)
>>> -CROSS_COMPILE ?=
>>> -KVER  ?= $(if $(KERNELRELEASE),$(KERNELRELEASE),$(shell uname -r))
>>> -KSRC ?= $(if $(KERNEL_SRC),$(KERNEL_SRC),/lib/modules/$(KVER)/build)
>>> -MODDESTDIR := /lib/modules/$(KVER)/kernel/drivers/net/wireless
>>> -INSTALL_PREFIX :=
>>> -
>>>    rtk_core :=				\
>>>    		core/rtw_ap.o		\
>>>    		core/rtw_br_ext.o	\
> 
> 
>> Hi Martin, this patch introduces a GCC warning on my system.
> 
>> drivers/staging/r8188eu/os_dep/ioctl_linux.c: In function
>> 'rtw_wx_set_enc_ext':
>> drivers/staging/r8188eu/os_dep/ioctl_linux.c:1929:9: warning: 'strncpy'
>> specified bound 16 equals destination size [-Wstringop-truncation]
>>   1929 |         strncpy((char *)param->u.crypt.alg, alg_name,
>> IEEE_CRYPT_ALG_NAME_LEN);
>>        |
> 
> 
> Hi Michael,
> 
> thanks for reporting this. So far, I can't reproduce the warning, even
> if I enable -Wstringop-truncation explicitly. I tried this with gcc
> 8.3.0 (Debian buster) on x86_64.

Hi Martin,

probably only newer gcc versions produce this warning. On my system
the gcc version is 11.2.1 (openSUSE Tumbleweed).

> Could you send me your complete compiler command line for this file
> (make V=1)?
> 

See end of this mail.

> Maybe it's not ok to delete the EXTRA_CFLAGS. I guessed that the
> optimisation level would be set by a higher-level Makefile...
> 

The warning is gone when I add back EXTRA_CFLAGS += -O1

Best regards,
Michael


   gcc -Wp,-MMD,drivers/staging/r8188eu/os_dep/.ioctl_linux.o.d 
-nostdinc -isystem /usr/lib64/gcc/x86_64-suse-linux/11/include 
-I./arch/x86/include -I./arch/x86/include/generated  -I./include 
-I./arch/x86/include/uapi -I./arch/x86/include/generated/uapi 
-I./include/uapi -I./include/generated/uapi -include 
./include/linux/compiler-version.h -include ./include/linux/kconfig.h 
-include ./include/linux/compiler_types.h -D__KERNEL__ 
-fmacro-prefix-map=./= -DKBUILD_EXTRA_WARN1 -Wall -Wundef 
-Werror=strict-prototypes -Wno-trigraphs -fno-strict-aliasing 
-fno-common -fshort-wchar -fno-PIE -Werror=implicit-function-declaration 
-Werror=implicit-int -Werror=return-type -Wno-format-security -std=gnu89 
-mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx -fcf-protection=none 
-m64 -falign-jumps=1 -falign-loops=1 -mno-80387 -mno-fp-ret-in-387 
-mpreferred-stack-boundary=3 -mskip-rax-setup -mtune=generic 
-mno-red-zone -mcmodel=kernel -Wno-sign-compare 
-fno-asynchronous-unwind-tables -mindirect-branch=thunk-extern 
-mindirect-branch-register -fno-jump-tables 
-fno-delete-null-pointer-checks -Wno-frame-address 
-Wno-format-truncation -Wno-format-overflow 
-Wno-address-of-packed-member -O2 -fno-allow-store-data-races 
-Wframe-larger-than=2048 -fstack-protector-strong -Werror 
-Wimplicit-fallthrough=5 -Wno-main -Wno-unused-but-set-variable 
-Wno-unused-const-variable -fno-stack-clash-protection -g -gdwarf-4 -pg 
-mrecord-mcount -mfentry -DCC_USING_FENTRY -Wdeclaration-after-statement 
-Wvla -Wno-pointer-sign -Wno-stringop-truncation -Wno-zero-length-bounds 
-Wno-array-bounds -Wno-stringop-overflow -Wno-restrict 
-Wno-maybe-uninitialized -fno-strict-overflow -fno-stack-check 
-fconserve-stack -Werror=date-time -Werror=incompatible-pointer-types 
-Werror=designated-init -Wno-packed-not-aligned -Wextra -Wunused 
-Wno-unused-parameter -Wmissing-declarations -Wmissing-format-attribute 
-Wmissing-prototypes -Wold-style-definition -Wmissing-include-dirs 
-Wunused-but-set-variable -Wunused-const-variable -Wpacked-not-aligned 
-Wstringop-truncation -Wno-missing-field-initializers -Wno-sign-compare 
-Wno-type-limits -Wno-error  -DMODULE  -DKBUILD_BASENAME='"ioctl_linux"' 
-DKBUILD_MODNAME='"r8188eu"' -D__KBUILD_MODNAME=kmod_r8188eu -c -o 
drivers/staging/r8188eu/os_dep/ioctl_linux.o 
drivers/staging/r8188eu/os_dep/ioctl_linux.c
drivers/staging/r8188eu/os_dep/ioctl_linux.c: In function 
'rtw_wx_set_enc_ext':
drivers/staging/r8188eu/os_dep/ioctl_linux.c:1929:9: warning: 'strncpy' 
specified bound 16 equals destination size [-Wstringop-truncation]
  1929 |         strncpy((char *)param->u.crypt.alg, alg_name, 
IEEE_CRYPT_ALG_NAME_LEN);
       | 
^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
