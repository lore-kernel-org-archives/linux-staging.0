Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180B514A88
	for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 20:04:44 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3110e74bf3cso827487f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 13:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687205083; x=1689797083;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=utfzAfD9uQaomS9zVilPr/sNC1+E5wKO0nFMJD3LaqM=;
        b=azY1rPn1no8Z//8qYjpF1bROxbf51Ks2JJ4GFxxjK+1Q0K+9t5sAyFPFOXbdcnsptu
         FrdEcCEK343U9K7xcce3t4CZL5t3kbh97q05yFwlKqCAWbb1a1YmnoVFqytfVrU3b6Yk
         zygAgpQtqYxQfsxdMUEttOERaCPwbH4xkxwXpy+mRgJEVBr44HVM5lDGD56IDF2PpURQ
         s/m0B7gVlEjL+cfeNeW3YNsS9U5rLiXb+A6NM2YKYlb/4uSUTS9k1dEjuclfGhiYfqM3
         XAKz3LrQrxSwN0lJIo+lqMwXn4aRgMG/qcHhLRKI58STNJsdINZ4CV5UbDfcGKv6CvjB
         TP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687205083; x=1689797083;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=utfzAfD9uQaomS9zVilPr/sNC1+E5wKO0nFMJD3LaqM=;
        b=ekrOGvZyb01sr5oTzH2Dg9U9m5qByBWM4krV5sX+8RaKOk3ruUepeTjeRcu72XtSnA
         KXukpQV+eS4SE8iTG6tzbYpDbFJ8cB5k20SGrDiuKyVUqqnxU+NFJgSYm+d8q9CtqF2T
         xw1IfSi/j6KHk+JFwUxrlm5+aCbeIIxBxdxEm7bH8tORu/kUdCgOWcMh7+Pq5jT9mZjY
         pGWZ+dmYFL5lDx2av4Top/MmMBH72NcpjsjmcrWrjHaCBtvFX6heBO/DrWC7MqwL/v+M
         RatbSSsAmkSKfv7jkWpowNNRdKa8Jqw3n7z99lgbXv+pSCmz+i+Q4KT7oXXFJsMY3EBw
         Op4A==
X-Gm-Message-State: AC+VfDySS4Eo7n6zmaIgF3nltVnW03BrPVtSLV/YPVnQaDLQfXY6+Y+s
	Ir19FZYf8u//GmaWhGJ/3Kg=
X-Google-Smtp-Source: ACHHUZ6oMBQbOjPAMKwzptasv40n9lbBqGcxTnz7BuepyB5gz8HVSSPxlGX04g1xzgGVU5FykZA1uw==
X-Received: by 2002:adf:e447:0:b0:307:cf5e:28a9 with SMTP id t7-20020adfe447000000b00307cf5e28a9mr8014373wrm.5.1687205082927;
        Mon, 19 Jun 2023 13:04:42 -0700 (PDT)
Received: from [192.168.0.104] (p57ba2e0b.dip0.t-ipconnect.de. [87.186.46.11])
        by smtp.gmail.com with ESMTPSA id i8-20020a05600011c800b00311339f5b06sm346783wrx.57.2023.06.19.13.04.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jun 2023 13:04:42 -0700 (PDT)
Message-ID: <6411c15d-9e22-5a58-0e1b-d18654acc127@gmail.com>
Date: Mon, 19 Jun 2023 22:04:41 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] staging: rtl8192e: remove 5G related code
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20230619155203.6039-1-straube.linux@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20230619155203.6039-1-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/19/23 17:52, Michael Straube wrote:
> In previous patches we removed 5G code since the hardware that uses this
> driver does not support 5G. There is still some 5G related code, remove it.
> All the removed defines are unused and we can safely remove "N-5G" from the
> rtllib_modes array.
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
> Compile-tested only, due to lack of hardware.
> 
>   drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h     | 1 -
>   drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h | 2 --
>   drivers/staging/rtl8192e/rtllib.h                 | 1 -
>   drivers/staging/rtl8192e/rtllib_wx.c              | 2 +-
>   4 files changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
> index f4d4b01630a2..09f8c76b7e65 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
> +++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h
> @@ -159,7 +159,6 @@ enum _RTL8192PCI_HW {
>   	WFCRC2		  = 0x2f8,
>   
>   	BW_OPMODE		= 0x300,
> -#define	BW_OPMODE_5G			BIT1
>   #define	BW_OPMODE_20MHZ			BIT2
>   	IC_VERRSION		= 0x301,
>   	MSR			= 0x303,
> diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h b/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h
> index 65365ebe4e85..24fb0ca539ea 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h
> +++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phyreg.h
> @@ -266,7 +266,6 @@
>   #define b3WireAddressLength		0x400
>   #define b3WireRFPowerDown		0x1
>   /*#define bHWSISelect			0x8 */
> -#define b5GPAPEPolarity			0x40000000
>   #define b2GPAPEPolarity			0x80000000
>   #define bRFSW_TxDefaultAnt		0x3
>   #define bRFSW_TxOptionAnt		0x30
> @@ -284,7 +283,6 @@
>   #define bRFSI_ANTSW			0x100
>   #define bRFSI_ANTSWB			0x200
>   #define bRFSI_PAPE			0x400
> -#define bRFSI_PAPE5G			0x800
>   #define bBandSelect			0x1
>   #define bHTSIG2_GI			0x80
>   #define bHTSIG2_Smoothing		0x01
> diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
> index dbf78b60dd78..e3ce4431d460 100644
> --- a/drivers/staging/rtl8192e/rtllib.h
> +++ b/drivers/staging/rtl8192e/rtllib.h
> @@ -427,7 +427,6 @@ enum wireless_mode {
>   	WIRELESS_MODE_G = 0x04,
>   	WIRELESS_MODE_AUTO = 0x08,
>   	WIRELESS_MODE_N_24G = 0x10,
> -	WIRELESS_MODE_N_5G = 0x20
>   };
>   
>   #ifndef ETH_P_PAE
> diff --git a/drivers/staging/rtl8192e/rtllib_wx.c b/drivers/staging/rtl8192e/rtllib_wx.c
> index 538cedb1dc02..e9469bfef3dd 100644
> --- a/drivers/staging/rtl8192e/rtllib_wx.c
> +++ b/drivers/staging/rtl8192e/rtllib_wx.c
> @@ -19,7 +19,7 @@
>   #include "rtllib.h"
>   
>   static const char * const rtllib_modes[] = {
> -	"a", "b", "g", "?", "N-24G", "N-5G"
> +	"a", "b", "g", "?", "N-24G"
>   };
>   
>   #define MAX_CUSTOM_LEN 64

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>

