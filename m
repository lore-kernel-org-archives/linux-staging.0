Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD82127719
	for <linux-staging@lists.linux.dev>; Wed,  2 Nov 2022 22:00:20 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id y69so411499ede.5
        for <linux-staging@lists.linux.dev>; Wed, 02 Nov 2022 15:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uFa9ZhCMepZq24Vnn18j9j7JCVeUv8BABqc0vmgQSBA=;
        b=O567pRj2nj/frtcM+5YvZA8T0NCYHcrKp1+VVHNo7zrReLYbWbbK5nEbPZ8ffn/h9S
         yp2vVrBSNGkANUAzIU1cQlcSJA4kucix3t3nMPpmC0uQYE9WT0BlM0L2I1zEjWN4dDvE
         IWTcoJBMuwp4XbjzsXhdsIHitJC9KoNBa9V7j4M+Er2DsesgSAkl+CKca4cPtcSw+fNr
         SSaBHJXh3MDfmKq6+2VVS/B+jOGH0G2EsNpv27q4DxLTHX9Pp919rEIFjHdj7t9zkRH2
         Yb9+yTqHsCzLDJA67KC4Y0AhZHceGvfVkI7cHFezlpYYea8YkejH+Kny3mO1yXzVoG6m
         QPFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uFa9ZhCMepZq24Vnn18j9j7JCVeUv8BABqc0vmgQSBA=;
        b=bn0QkLrb9jcGa8kqlD5eUQiwK4rQY8qn/+woAeautdNxHxrcgAVje6iwuHmtVbdCcs
         mUZKP/7a9lszG8cJxSuDHe/o/Y08v/PFFmrZ6nA+lsZI6SzWMCaCxg99fGb6kWat2y0+
         rYwYQNYQMl250dDvf+i+B/jTMFdLad7eIei0Tjk+0REzn4fOjle0bQVJrSDEYUEpugI5
         pFxDTsN4RUGwPyGCmyK7NDCX+xildungMkfov4kuX7P3O3u9O7/lmtdiJ0EYejK5aO+P
         9HdlWLRBWHoBWReBfRPmTKJh1lo66COuoyw/1yxs6/+6OxBufX+cHmV+hqFwPo+vaN6a
         apMw==
X-Gm-Message-State: ACrzQf29GlJKOflzXdJ89St9biSZ9Z4Em/e0T4S+nAIPAJabNxo53Yp6
	hwnnhPR9StBi5uSebyATOrw=
X-Google-Smtp-Source: AMsMyM6+9FbULypkREv1lMx4Gsy5w2aJ7DhhKyi4VArUJlIvoL56XephMvx0Vp0E70gKWsieAIbO4w==
X-Received: by 2002:aa7:c78d:0:b0:454:fe1d:8eb1 with SMTP id n13-20020aa7c78d000000b00454fe1d8eb1mr26411467eds.59.1667426418859;
        Wed, 02 Nov 2022 15:00:18 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:b839:703d:34d9:ac18:ee1c? (p200300c78f2ab839703d34d9ac18ee1c.dip0.t-ipconnect.de. [2003:c7:8f2a:b839:703d:34d9:ac18:ee1c])
        by smtp.gmail.com with ESMTPSA id l17-20020a1709063d3100b00782fbb7f5f7sm5896446ejf.113.2022.11.02.15.00.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 15:00:18 -0700 (PDT)
Message-ID: <2fea9cb6-04a0-c709-9263-a35badad4d20@gmail.com>
Date: Wed, 2 Nov 2022 23:00:17 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4] staging: rtl8192e: space formatting fixes in rtl_cam.c
Content-Language: en-US
To: Jerom van der Sar <jerom.vandersar@gmail.com>, gregkh@linuxfoundation.org
Cc: error27@gmail.com, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <Y2IbI8ib5+k+bVRo@kroah.com>
 <20221102200057.397-1-jerom.vandersar@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221102200057.397-1-jerom.vandersar@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/22 21:00, Jerom van der Sar wrote:
> Fixed a few coding style issues in rtl_cam.c: two times lack of
> spaces around binary operators. Some other warnings still remain.
> These issues were found by scripts/checkpatch.pl.
> 
> This patch helps clean up the rtl8192e driver in staging, making it
> easier to read and maintain.
> 
> Signed-off-by: Jerom van der Sar <jerom.vandersar@gmail.com>
> ---
> Changes in v4:
>   - Reverted more double blank line formatting fixes to make the patch
>     even smaller.
> 
> Changes in v3:
>    - Fixed faulty dot at the end of the patch sign-off.
> 
> Changes in v2:
>    - Reverted some formatting fixes to make the diff easier to review.
> 
>   drivers/staging/rtl8192e/rtl8192e/rtl_cam.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
> index 41faeb4b9b9b..41bff46d1b3a 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_cam.c
> @@ -17,7 +17,7 @@ void rtl92e_cam_reset(struct net_device *dev)
>   {
>   	u32 ulcommand = 0;
>   
> -	ulcommand |= BIT31|BIT30;
> +	ulcommand |= BIT31 | BIT30;
>   	rtl92e_writel(dev, RWCAM, ulcommand);
>   }
>   
> @@ -107,7 +107,7 @@ void rtl92e_set_key(struct net_device *dev, u8 EntryNo, u8 KeyIndex,
>   
>   	for (i = 0; i < CAM_CONTENT_COUNT; i++) {
>   		TargetCommand  = i + CAM_CONTENT_COUNT * EntryNo;
> -		TargetCommand |= BIT31|BIT16;
> +		TargetCommand |= BIT31 | BIT16;
>   
>   		if (i == 0) {
>   			TargetContent = (u32)(*(MacAddr+0)) << 16 |

Please rebase. I cannot apply your patch.

Bye Philipp
