Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AB73FC2
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 14:45:40 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id g66-20020a9d12c8000000b0051aeba607f1so13636425otg.11
        for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 07:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=seOiZCj4hVVjWxrbxl6hqZpUw4GOWVp72vSNdyBOoLQ=;
        b=i0TMWCd4aPkJFrJ/hQK1dtztJRvrcDKtXs64adu7ftX/RSQWKNo6jyWeVN28cLQoxR
         UjzLKXFricQ4rRMyRWWOCoZ9/fPUyz6+E6XPnzwKQdl5nTLB8nbNTz4VtQopf/XI8lq7
         38s7VJcaMuf88SacBaXC5WfcLg5h6L2FPOmIT00kGatLQmcog0EsRPVT4pW2TeEcm2Ig
         g69TWLU4Ew63QftZrrtVfSSA6GaH3DPQN0FOYO0IslsNpqItfkb6Y+yH1e7YI31bEGJu
         i99POLa4V84gllAxucSNAPcjM03BH8uJwABKBVb4a2CCMr2dAy34zMFsxGrbjCDTtKQx
         s1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=seOiZCj4hVVjWxrbxl6hqZpUw4GOWVp72vSNdyBOoLQ=;
        b=QHQEeCGxmTdp0P62P3kTDO7dX/yHbdPvn2UcisdAYzOsh0YmdM0laNlIItJPpHTb4/
         UTAKL6SqW/lcsEh5X0Iu36lSHshxDoEx1RAqLTF/Gz0aYDzb02PlpkjzuN4wCAz0BYA+
         bjMMF9goKNruVei9VjjwFWcyYR9DvTcP4q3vcLaCrYwXN6PCnWeqKaJCgGlW+qNVjInP
         6n5qv8Hjjsc/O1l5vwYk1JMPmFKqIrhHLHx+PjPO1a87gutYfM3hcUzl9EGWGTHfGfas
         ijaQ6hG63bMkjeFoeIpkfkPx9XXOYPYxQ9hKePst193+fTH7WEQXdqx+YRp1ToBDUFrD
         MhgQ==
X-Gm-Message-State: AOAM533saAPRa7Ym9mrit7+Y9X1SSKmz/KLkT5xUgVN3slDHZUICj8iA
	PZyO2nihGenjlZQNqCvnAUA=
X-Google-Smtp-Source: ABdhPJzbSYJyfMoiDDta8lSR4MWJveHmEwBOFW1zZr+vo3bqHaniyGSWUjJ1ikOgaDV/NmBLpjc62g==
X-Received: by 2002:a05:6830:1db3:: with SMTP id z19mr2008366oti.369.1629557139608;
        Sat, 21 Aug 2021 07:45:39 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-1023.res6.spectrum.com (2603-8090-2005-39b3-0000-0000-0000-1023.res6.spectrum.com. [2603:8090:2005:39b3::1023])
        by smtp.gmail.com with ESMTPSA id u14sm2389634oth.73.2021.08.21.07.45.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Aug 2021 07:45:39 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
Subject: Re: [PATCH] staging: r8188eu: remove forward declaration of
 Efuse_Read1ByteFromFakeContent
To: Phillip Potter <phil@philpotter.co.uk>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 martin@kaiser.cx, straube.linux@gmail.com
References: <20210821000508.79422-1-phil@philpotter.co.uk>
From: Larry Finger <Larry.Finger@lwfinger.net>
Message-ID: <ac672cfe-038d-2fe9-0ac6-904ad7761b54@lwfinger.net>
Date: Sat, 21 Aug 2021 09:45:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210821000508.79422-1-phil@philpotter.co.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/20/21 7:05 PM, Phillip Potter wrote:
> Remove forward declaration of Efuse_Read1ByteFromFakeContent function
> from core/rtw_efuse.c, as the function is defined in full directly
> after this and therefore this forward declaration is redundant.
> 
> Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> ---
>   drivers/staging/r8188eu/core/rtw_efuse.c | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/core/rtw_efuse.c b/drivers/staging/r8188eu/core/rtw_efuse.c
> index decccf7622f0..45b757ab64e1 100644
> --- a/drivers/staging/r8188eu/core/rtw_efuse.c
> +++ b/drivers/staging/r8188eu/core/rtw_efuse.c
> @@ -29,12 +29,6 @@ u8 fakeBTEfuseModifiedMap[EFUSE_BT_MAX_MAP_LEN] = {0};
>   #define REG_EFUSE_CTRL		0x0030
>   #define EFUSE_CTRL			REG_EFUSE_CTRL		/*  E-Fuse Control. */
>   /*  */
> -
> -bool
> -Efuse_Read1ByteFromFakeContent(
> -			struct adapter *pAdapter,
> -			u16 Offset,
> -		u8 *Value);
>   bool
>   Efuse_Read1ByteFromFakeContent(
>   			struct adapter *pAdapter,
> 

Phil,

There a number of such forward references immediately followed by the actual 
routine. I removed some of these when the driver was in the GitHub repo, but I 
missed a few.

Acked-by: Larry Finger <Larry.Finger@lwfinger.net>

Larry

