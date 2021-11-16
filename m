Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE1DC68
	for <linux-staging@lists.linux.dev>; Tue, 16 Nov 2021 04:56:12 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id t26so8749340lfk.9
        for <linux-staging@lists.linux.dev>; Mon, 15 Nov 2021 20:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=P95ELlRgMRZkG9bYMP1tznGDyj5awpaPH3jueNkr9vs=;
        b=fc60BO/LhMAvTzt1F7fb84/UivvOkjq1d3XJQoYvajCOGz8LFjBXGN/8tdKJKhpOSD
         tJclVXPw0M22drkWldIvCeGHEG5TjGuyi9JyjFSTjZT/qNs7k+Mgln4iLRaRr+/4w/4p
         IcwPKeH9Zwq3WUROVHUv5AZHOQ7bggOI8Pi6dZ4JG5ns2FPuByqKahev4NLghX9/+VmR
         D46+QjhiJ9Y709O4KaRL/V+16BBqJFOAguORbSvY0lB40CKdldHxBfPZSDIcho3Vw/Rz
         4W1A6r5g14KYf2dFJU5jh6pENFoW8ebek2rOMbWMvKZaPPSycRSbxVzB3NNya65zkUdq
         oM2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=P95ELlRgMRZkG9bYMP1tznGDyj5awpaPH3jueNkr9vs=;
        b=qfIJgoxx8E/SttjyMWJxDwW8yKWEF0y947PZiDmV7HI7D0u390lhvyokJy9CMuS4UA
         Kl1XT00YSmpMqYYx2WBItpcim09RFz57AKTXamtPFJz3kCiq+oT2dnvIncEHiQOXp6U9
         66hqGyqMTXtRy2s+t9j80qw5+YC4oFjG5/YQDGLR7rpJGyrrSRCk3jF0bd3awsCfyxop
         CmPY1Z1WyAIW9dJDaYM3tWK5ET1NobSVT+iiEkFqcARWIJeiNeRNSQX2McEaPgD0gpVO
         DUEpQx4HBeVda4txwyXi0E/pXDa3BMaB37R6kwvXidT5T7ouD/MnGoaEBWK8Ey9QPiU1
         /deA==
X-Gm-Message-State: AOAM533HuBUnZcrYCql3S88nA++mOADt/9BqwYfGPLTpHirfz8esqR6/
	W+7kgC/Gu3+xVLFP/m813es=
X-Google-Smtp-Source: ABdhPJzH+TYpnt3oy1FqocZ1A8ZSjdLchUbbv88G/CLiD/w1q4sft1RfgxacRYroytzVicTDMyRR1Q==
X-Received: by 2002:a05:6512:21c8:: with SMTP id d8mr4188821lft.7.1637038570719;
        Mon, 15 Nov 2021 20:56:10 -0800 (PST)
Received: from [172.28.2.233] ([46.61.204.60])
        by smtp.gmail.com with ESMTPSA id k15sm1646322ljh.102.2021.11.15.20.56.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Nov 2021 20:56:10 -0800 (PST)
Message-ID: <6d2d9c4a-3f05-1d51-42dc-b1ebbb4aefe1@gmail.com>
Date: Tue, 16 Nov 2021 07:56:09 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] staging: r8188eu: remove unused defines in wifi.h
Content-Language: en-US
To: Zameer Manji <zmanji@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
 Phillip Potter <phil@philpotter.co.uk>,
 Michael Straube <straube.linux@gmail.com>,
 "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20211116011451.896714-1-zmanji@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20211116011451.896714-1-zmanji@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/16/21 04:14, Zameer Manji wrote:
> None of these defines in wifi.h are used so they
> can be safely removed.
> 
> Signed-off-by: Zameer Manji <zmanji@gmail.com>
> ---
>   drivers/staging/r8188eu/include/wifi.h | 57 --------------------------
>   1 file changed, 57 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
> index 193a557f0f47..7cbc7015e90f 100644
> --- a/drivers/staging/r8188eu/include/wifi.h
> +++ b/drivers/staging/r8188eu/include/wifi.h
> @@ -13,32 +13,9 @@
>   #define BIT(x)	(1 << (x))

What about BIT() macro? It's already defined in include/vdso/bits.h and 
can be included via include/bits.h.

Most likely linux/ieee80211.h contains bits.h. Haven't checked yet, but 
anyway redefining kernel macros is not good approach and BIT() can be 
also removed.



With regards,
Pavel Skripkin
