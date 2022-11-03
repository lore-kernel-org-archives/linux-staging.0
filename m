Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E732779C9
	for <linux-staging@lists.linux.dev>; Thu,  3 Nov 2022 22:02:21 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id t4so1983220wmj.5
        for <linux-staging@lists.linux.dev>; Thu, 03 Nov 2022 15:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=baYbNDVgL1/4As3xdLgF9MW4MrHr71vL82GF0ZTz74Y=;
        b=d3pI+FbfiZ6ZZxbbXjqC4fZZb541u7ezWW5QbfEC/S/XVTqO7Q/2qizWJhrxvZDjJx
         LB0j7/MYYslYRLrz4AW69Cfi/M/IEVKmI30ZX1DkleTCMm9WQcj+uRpKP4vD7AHwgNXT
         78PQbsaHzC1hVmYRr4h8GvUHYQjkNVTw+5bbZKUvu2Mmw0ciPl8Ll01ZBXkfBy7NSaS+
         +crdVPWf1pkiNrcJSFRW78nWtGS1eJZkWMRwwQxkA0iDbGksDSyZq6MGhPe9f97HEeoI
         LNHNZTkyuACvAvcGDCDq2eL5giPKEsmDnCPI2NVMnu8qB/hsAcBGWTDit0HpplTS0Yym
         U6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=baYbNDVgL1/4As3xdLgF9MW4MrHr71vL82GF0ZTz74Y=;
        b=X3sSWWLaxDXniKRJLimPASFlWVVESHscFaoIrRIaliTIjr2z7lp/eArFc+ThIkcpHj
         l+mp8mMUaA6matmZGv8sO9g4kVTG+LZiy7bYEE3V+wDBWj71pkiS1KJ5XDY7kSGf8Irs
         DwO/EdCJ7fwmOnn0+kdFbYXjCIpafnuYsKtx0687szzy7kgTnb0xDRWFLoOmWsJbaN/n
         3MG/nGCZscXnCg+sN2HgFNYpWt9BEBjTWRNgiO1ULO7eELQjq3NeC/NtpjK3ia/MA8Z6
         a3Srrt2yViQEt4UwcEeX6jPuIjaQZyZT8xZF4YWj111JM/tGcBruEWpJE08ZOPFPzvpS
         9HAQ==
X-Gm-Message-State: ACrzQf3KbKQHZnruInPckJvpV/y4RBud4KyFQL5eFnkE2rSRwykAxeXI
	sPUyVwwymK+gUIncT3rET3I=
X-Google-Smtp-Source: AMsMyM5uqc/izvH4hvGJUqx1Cm1f3/I59CQRLO6OVDyZTDg08OAK/Z61zynh0VcBmPWAGqJ79HljQw==
X-Received: by 2002:a05:600c:4588:b0:3c6:f645:dad0 with SMTP id r8-20020a05600c458800b003c6f645dad0mr22077696wmo.114.1667512940198;
        Thu, 03 Nov 2022 15:02:20 -0700 (PDT)
Received: from [192.168.1.102] (p54a07888.dip0.t-ipconnect.de. [84.160.120.136])
        by smtp.gmail.com with ESMTPSA id m7-20020a7bca47000000b003a83ca67f73sm1094209wml.3.2022.11.03.15.02.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 15:02:19 -0700 (PDT)
Message-ID: <a497e930-00d5-b830-b29c-531c18da800a@gmail.com>
Date: Thu, 3 Nov 2022 23:02:19 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH][next] staging: rtl8192e: rtl819x_HTProc: make arrays
 const and one static
Content-Language: en-US
To: Colin Ian King <colin.i.king@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Aaron Lawrence <t4rmin@zohomail.com>, Yogesh Hegde <yogi.kernel@gmail.com>,
 linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221103130619.78413-1-colin.i.king@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221103130619.78413-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/3/22 14:06, Colin Ian King wrote:
> Make two dead-only arrays const. Make array EWC11NHTCap static const
> so it is not populated on the stack, makes the code smaller too.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   drivers/staging/rtl8192e/rtl819x_HTProc.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> index 62aa8e893c34..84ec8df047d7 100644
> --- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
> +++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> @@ -282,7 +282,7 @@ void HTConstructCapabilityElement(struct rtllib_device *ieee, u8 *posHTCap,
>   	memset(posHTCap, 0, *len);
>   
>   	if ((bAssoc) && (pHT->ePeerHTSpecVer == HT_SPEC_VER_EWC)) {
> -		u8	EWC11NHTCap[] = {0x00, 0x90, 0x4c, 0x33};
> +		static const u8	EWC11NHTCap[] = { 0x00, 0x90, 0x4c, 0x33 };
>   
>   		memcpy(posHTCap, EWC11NHTCap, sizeof(EWC11NHTCap));
>   		pCapELE = (struct ht_capab_ele *)&posHTCap[4];
> @@ -515,8 +515,8 @@ void HTOnAssocRsp(struct rtllib_device *ieee)
>   	u16 nMaxAMSDUSize = 0;
>   	u8 *pMcsFilter = NULL;
>   
> -	static u8 EWC11NHTCap[] = {0x00, 0x90, 0x4c, 0x33};
> -	static u8 EWC11NHTInfo[] = {0x00, 0x90, 0x4c, 0x34};
> +	static const u8 EWC11NHTCap[] = { 0x00, 0x90, 0x4c, 0x33 };
> +	static const u8 EWC11NHTInfo[] = { 0x00, 0x90, 0x4c, 0x34 };
>   
>   	if (!pHTInfo->bCurrentHTSupport) {
>   		netdev_warn(ieee->dev, "%s(): HT_DISABLE\n", __func__);

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
