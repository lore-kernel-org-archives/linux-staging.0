Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5247A;
	Sun,  3 Apr 2022 15:59:31 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id e16so13031986lfc.13;
        Sun, 03 Apr 2022 08:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=KKlcn54PThq2FKahUYvLZsgWJiUdQCm2Y4kdU3bFhN4=;
        b=dpLPC2z/Esldqx70eDH/rzllBYsmWf6BYGOJq/cjhDbq7B8Hj23wMtHvTVaFHAAqBD
         q895Ga1Jm8cov5tIist9q+36g1Jjm/FS1feywqK7wDshsh0pHQ49pUmHXKBsbCVHftUB
         FZEkPUjeOecuxRIefH9/L1YaGfbjLBhTw6ZAbZNBuf0AXcMA4jUnbDwCs7NsXflUSYmp
         fFpVvg3/swKwNfXuQQXPAexy+UGLeobwtzsUjMrGWB7lElFOOmfdM6JWI26YyvyQJbSy
         k8Nvc3CqZR9bceECFFnGQEDd23rJOkipHLcTUNPTZErVIgRh/ozscBA4aDVydSsSSxq+
         d2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=KKlcn54PThq2FKahUYvLZsgWJiUdQCm2Y4kdU3bFhN4=;
        b=i/IJP+uw7nnpCN6K/Th4J4Nu9VnlOPfiNwjkIwWl5Q4F9jARRFcl/3o1ozz+hwDGiJ
         1QXFrfW8epJdOnYJjpK7S63bBVkW7XvzoKI4wVCXlyHw6m8w1Hf+Jot33y+AOvG6T3Mo
         k1SmdFj/xOAMYusD4HONdmPoMVJjbcaOEiJfCRq9yqNNoWxlhlf8cg1kN7bfBNrg7PcQ
         2HyIot4pA9qlveclwgoRtYms0LgQMapN82cqQfK+NHCUlUsT7+Kof3v/jLkLg9h1Lk9k
         ktO56JEHnA00bNsvgjZEJPDfW6KOL3z8WVLBKVQxhkZPjivrsEZDldqNk6TyRLJ8F5i2
         vk1w==
X-Gm-Message-State: AOAM531ZSc13qq3uNT8MlnlkVxJzy+RaAFu06Vatftd8yYdDhtXqw8kH
	k6iE/v7BD6XjAj7KWo1rHCR9r+V3A3g=
X-Google-Smtp-Source: ABdhPJzBYJwux5sXQl5VKAeCWo4U7G4PmLnSLsJM5yTssEvU2NHL4xzK8+jBz4LkfC90iPNKp2geWw==
X-Received: by 2002:a05:6512:3f86:b0:44a:f5bf:ec9a with SMTP id x6-20020a0565123f8600b0044af5bfec9amr3181456lfa.490.1649001569396;
        Sun, 03 Apr 2022 08:59:29 -0700 (PDT)
Received: from [192.168.1.11] ([46.235.67.247])
        by smtp.gmail.com with ESMTPSA id bp15-20020a056512158f00b0044a3271802asm859675lfb.17.2022.04.03.08.59.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Apr 2022 08:59:29 -0700 (PDT)
Message-ID: <ed0e9f7b-9ba9-b0c8-8261-397bf793b9b9@gmail.com>
Date: Sun, 3 Apr 2022 18:59:26 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] staging: r8188eu: simplify control flow
Content-Language: en-US
To: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy@lists.linux.dev
References: <20220403155111.GA333187@euclid>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220403155111.GA333187@euclid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Sevinj,

On 4/3/22 18:51, Sevinj Aghayeva wrote:
> The function iterates an index from 0 to NUM_PMKID_CACHE and returns
> the first index for which the condition is true. If no such index is
> found, the function returns -1. Current code has a complex control
> flow that obfuscates this simple task. Replace it with a loop.
> 
> Also, given the shortened function body, replace the long variable
> name psecuritypriv with a short variable name p.
> 
> Reported by checkpatch:
> 
> WARNING: else is not generally useful after a break or return
> 
> Signed-off-by: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
> ---

[code snip]

> +	for (i = 0; i < NUM_PMKID_CACHE; i++)
> +		if ((p->PMKIDList[i].bUsed) &&
> +				(!memcmp(p->PMKIDList[i].Bssid, bssid, ETH_ALEN)))
> +			return i;
> +	return -1;
>   }
>   
>   /*  */

Looks good, but let's not introduce new checkpatch issue:

CHECK: Alignment should match open parenthesis
#62: FILE: drivers/staging/r8188eu/core/rtw_mlme.c:1645:
+		if ((p->PMKIDList[i].bUsed) &&
+				(!memcmp(p->PMKIDList[i].Bssid, bssid, ETH_ALEN)))




With regards,
Pavel Skripkin
