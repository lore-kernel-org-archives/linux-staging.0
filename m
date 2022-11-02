Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5058F76;
	Wed,  2 Nov 2022 22:56:28 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id l11so581955edb.4;
        Wed, 02 Nov 2022 15:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GvHltcSmK4KB84UjgoRavJNl81LE4r8A3c+x/iev4MA=;
        b=GGAex3CI7HG5F0f46SDhbIa74JgV50de0+Qc8WZMJHFXAt//qMhC7JCLq9iHR2Hg9T
         fno+KA0jY6Jft4HLv53ZdqOyImOjFBRal2NEFMuXXF9JsNzfmWSJSLb+b6iZa2uBEelf
         NyE7K66vR5r7QGFagRa99NXTK/1yxR+OTK+MgdFNe0p8bWU0xxVlDqg7MA31GdAOfPe/
         lN9AfRIz1ESKJ8pWmdXdbJ/S0xMkri7MC6UxKcGPw7ITo+uOG/UaDYrqb9okfSAn8w46
         42U6UgzltIqKu+Xtig1R1BzNiHo+pCErmAh3QYM9c3bh4XMeHIZTIOs3mE43+04JNaWY
         6P4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GvHltcSmK4KB84UjgoRavJNl81LE4r8A3c+x/iev4MA=;
        b=DD46cyRRXXhGzlYr8VU/QjB+DXlfLUU8PYMxsHcce1YWfP8T338YStmVS+vByRxYpq
         04TcYGYoK7DNNrX+R2K3cO1Uc8lEI0JJEbLKBxlkBsBr4as2RbzkUXiqVa4aKunjfj+Y
         3+4VBsiIYXYGrNBy5SRrkRVRMrqaLEr5Y/LVmeSV19k0Ztqd3WbzGgOht+ENjrBc4PBe
         DJ54CEJwVU96MrKan4MptItO4qRTCpPh7soMUV7vVSQMiYfgb1nVmX+6I6Vc9mL1+SI2
         ZW5ncF+hi1toT3d1VuCVi7sVH4S8P3yK2QwPJggmXDh6cE37+zJj4p/zIaUJ0m2gmnPQ
         0yxQ==
X-Gm-Message-State: ACrzQf1EEBifDA0Ocdt1wTMKGQG4LsRHbgt8PQAusiodWj+fOJmL4Lnz
	3S5rbWplktrbuiiwnyHlJmI=
X-Google-Smtp-Source: AMsMyM7AsyW0ijpFauuTaWekHGQ3xgTxJ1jYaN1OW6eR4n2or7ItpJKxllFbvFndEIAa6d3qAHX0AQ==
X-Received: by 2002:a50:d0c4:0:b0:464:14ed:834 with SMTP id g4-20020a50d0c4000000b0046414ed0834mr3871229edf.174.1667429787244;
        Wed, 02 Nov 2022 15:56:27 -0700 (PDT)
Received: from [192.168.1.100] (p57935738.dip0.t-ipconnect.de. [87.147.87.56])
        by smtp.gmail.com with ESMTPSA id ee13-20020a056402290d00b0046267f8150csm6284073edb.19.2022.11.02.15.56.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 15:56:26 -0700 (PDT)
Message-ID: <4c2497a4-cf86-af1a-5a0b-0d980f02f152@gmail.com>
Date: Wed, 2 Nov 2022 23:56:25 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] staging: rtl8192e: Use min_t/max_t macros for variable
 comparison
Content-Language: en-US
To: Deepak R Varma <drv@mailo.com>, outreachy@lists.linux.dev,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <Y2LxC2kziM1TznhO@qemulion>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <Y2LxC2kziM1TznhO@qemulion>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/22 23:36, Deepak R Varma wrote:
> Simplify code by using min_t and max_t helper macros in place of lengthy
> if/else block oriented logical evaluation and value assignment. This
> issue is identified by coccicheck using the minmax.cocci file.
> 
> Use the *_t variants of min/max macros to avoid compiler warnings about
> data typecast.
> Also, use u32 as type for min_t macro to avoid any truncation of data
> associated with enum constant HT_AGG_SIZE_32K.
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>   drivers/staging/rtl8192e/rtl819x_HTProc.c | 13 ++++---------
>   1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> index 62aa8e893c34..ccb86660ab48 100644
> --- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
> +++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
> @@ -587,17 +587,12 @@ void HTOnAssocRsp(struct rtllib_device *ieee)
>   			else
>   				pHTInfo->CurrentAMPDUFactor = HT_AGG_SIZE_64K;
>   		} else {
> -			if (pPeerHTCap->MaxRxAMPDUFactor < HT_AGG_SIZE_32K)
> -				pHTInfo->CurrentAMPDUFactor =
> -						 pPeerHTCap->MaxRxAMPDUFactor;
> -			else
> -				pHTInfo->CurrentAMPDUFactor = HT_AGG_SIZE_32K;
> +			pHTInfo->CurrentAMPDUFactor = min_t(u32, pPeerHTCap->MaxRxAMPDUFactor,
> +							    HT_AGG_SIZE_32K);
>   		}
>   	}
> -	if (pHTInfo->MPDU_Density > pPeerHTCap->MPDUDensity)
> -		pHTInfo->current_mpdu_density = pHTInfo->MPDU_Density;
> -	else
> -		pHTInfo->current_mpdu_density = pPeerHTCap->MPDUDensity;
> +	pHTInfo->current_mpdu_density = max_t(u8, pHTInfo->MPDU_Density,
> +					      pPeerHTCap->MPDUDensity);
>   	if (pHTInfo->iot_action & HT_IOT_ACT_TX_USE_AMSDU_8K) {
>   		pHTInfo->bCurrentAMPDUEnable = false;
>   		pHTInfo->ForcedAMSDUMode = HT_AGG_FORCE_ENABLE;
> --
> 2.34.1
> 
> 
> 
> 

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
