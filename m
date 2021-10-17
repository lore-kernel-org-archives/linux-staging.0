Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C382C83
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 12:15:37 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id g25so35619265wrb.2
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 05:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=4rGQu9A9hg6MKWxmyhdVi7SLuN8q4rVtdsjRdJ3svpQ=;
        b=A+3OurShtosqmVYq25zLOfVNdpG6MQ/pqQ+uIG+vGL4jkzWR/U0RVccHEdfm/s+vee
         /JP6fYXZk2McT/sacQxQZ9G52KtjNEaWQEDajzL0VIByftr7KLT/GrpxvLSjqDgyujlR
         5MnRw/WevlyGun715FsAeABXmpDcCiqlBZ7s4pehWSXLJq1BI2gwjV6duc/e2mFN3sWC
         9MZ5hJIbUbGR7UO8gB19ZCLTDYnrjkH9bAvbJHTuDM6qQYgoeDZ/ZpC4PHUkYcbOj1eI
         /4mJvpgrmdlksvr0U7jbOUt8AD9fVHJjwspuhpBEXMcUToTK5nQaI4K1Uc9RiTJ3ovss
         jUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4rGQu9A9hg6MKWxmyhdVi7SLuN8q4rVtdsjRdJ3svpQ=;
        b=N31k0/NrQ6iUMzTCRkVsegCZJF/FVNseqPGuvZ2qGqDcmRRFQUIzBq7UB6GbAdvn8d
         1bx1LDG3eAhBLBuM6a/VTVQit0msYVuJsRNQ9Gu39sHaClHiiyJzBtyNH0lvwr93aWcM
         R7AslKtnMlgowUgujHTrhATvwz6wBHH2081sPp/Ps4Zr9Gty5a8BogxCH+P4SKSvJBdG
         I5HmjSgEEi3fq/HD32YjXkzz63zJ9d/FoksCnrr2lw2qNcQv15/e1AKpJE5quxN1W234
         8TgLhru6MddesK5dO1QrKunouns7M7Q71TkPVpwn1gLpXHDlCKjyYPWAuTWNYjKH+p+o
         cTlQ==
X-Gm-Message-State: AOAM531p510DJ1Jdn54natKjGdoROaQDCi1Eq2AGVXMXMrPoWGUvmWfR
	EP/ShYLLleNe5wHK46ch5no=
X-Google-Smtp-Source: ABdhPJyIJsVeEecyaw19JmEdHpyfzEypReDKnv2jtc6S/6OR4WdwNGfTHZ7drSqYWhagxTENi24P1A==
X-Received: by 2002:adf:d1ee:: with SMTP id g14mr28422383wrd.165.1634472935679;
        Sun, 17 Oct 2021 05:15:35 -0700 (PDT)
Received: from ?IPV6:2a02:8108:96c0:3b88::d7f0? ([2a02:8108:96c0:3b88::d7f0])
        by smtp.gmail.com with ESMTPSA id n9sm3813170wro.68.2021.10.17.05.15.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Oct 2021 05:15:35 -0700 (PDT)
Message-ID: <1072576d-f580-413c-4566-df274a395c65@gmail.com>
Date: Sun, 17 Oct 2021 14:15:34 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/3] staging: r8188eu: Makefile: remove unused driver
 config
Content-Language: en-US
To: Martin Kaiser <martin@kaiser.cx>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20211016173544.25376-1-martin@kaiser.cx>
 <20211016173544.25376-2-martin@kaiser.cx>
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20211016173544.25376-2-martin@kaiser.cx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/21 19:35, Martin Kaiser wrote:
> Remove config settings from the Makefile that are related to
> unused or deleted features.
> 
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>   drivers/staging/r8188eu/Makefile | 10 ----------
>   1 file changed, 10 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/Makefile b/drivers/staging/r8188eu/Makefile
> index 1e0cb819f7f3..fccf7e6d1520 100644
> --- a/drivers/staging/r8188eu/Makefile
> +++ b/drivers/staging/r8188eu/Makefile
> @@ -4,8 +4,6 @@ EXTRA_CFLAGS += -O1
>   
>   ccflags-y += -D__CHECK_ENDIAN__
>   
> -CONFIG_WOWLAN = n
> -
>   OUTSRC_FILES :=				\
>   		hal/HalHWImg8188E_MAC.o	\
>   		hal/HalHWImg8188E_BB.o	\
> @@ -36,10 +34,6 @@ OUTSRC_FILES :=				\
>   		hal/usb_halinit.o	\
>   		hal/usb_ops_linux.o
>   
> -RTL871X = rtl8188e
> -
> -HCI_NAME = usb
> -
>   _OS_INTFS_FILES :=				\
>   			os_dep/ioctl_linux.o	\
>   			os_dep/mlme_linux.o	\
> @@ -52,10 +46,6 @@ _OS_INTFS_FILES :=				\
>   
>   _HAL_INTFS_FILES += $(OUTSRC_FILES)
>   
> -ifeq ($(CONFIG_WOWLAN), y)
> -EXTRA_CFLAGS += -DCONFIG_WOWLAN
> -endif
> -
>   SUBARCH := $(shell uname -m | sed -e "s/i.86/i386/; s/ppc.*/powerpc/; s/armv.l/arm/; s/aarch64/arm64/;")
>   
>   ARCH ?= $(SUBARCH)
> 

Acked-by: Michael Straube <straube.linux@gmail.com>
