Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC5B62C80
	for <linux-staging@lists.linux.dev>; Sat,  4 Dec 2021 08:27:50 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id 207so10700686ljf.10
        for <linux-staging@lists.linux.dev>; Sat, 04 Dec 2021 00:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=vaVQ9EF+zBy4WNuvJqK/FTH7aVljNykn6dqdxn1AsfI=;
        b=i+M9ZXngnViEH8TaXdUBL+LY1P7NAgLK/yKYJCdNM+XtQVQBfBi7RmsnqeKlBu5vz6
         V8l5Z5O3PJtycqfLNOQCz9bjaZaPy81VGd7GYBjMIrlBzPUdxyWzPkwNjh/9rbMz3pNq
         ImoewmxgL3NUosAGf51/xXuhn6ekS68iy+jG0dQ9uFO0/fLej2IjLT4WJBY3qdFdQuhX
         E70e2rjZ1koqkS8/rzXfglYzlM0QLwXExLzviCU1aHzSCyTr3mw9U68hBIHnltfGHiBA
         peIDAu4Wi85jYed3bQQEkh1RzB6ibnuSMjRzWrJlSPPVaMVIZwamahQNrmQvmzcAkK4u
         arvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vaVQ9EF+zBy4WNuvJqK/FTH7aVljNykn6dqdxn1AsfI=;
        b=qJGvP+/IGhdX4paBQUQHg7Hac7emZKqcy2gqyXdIVwJTh+OWQuBEd3ahrDv8idVMSb
         DImohNBh5yCYwUpUAfRZjLeBU4HKT/ATx/mVwAn2Fe9sIoHX+fE/dANIzVmKR6LEaKlz
         M2liObMvm0U2LlRg3YuQgAmf1C83YziAzAb2MFjUHr5E+AkUB5594uABdIyJltmCkBQj
         KwHJufi68pYNRUH5DzDrYjls7c1VhQ5z2CbFSPaQDedsqnuF/NBCdqhGk3UZnuSbNVQE
         40IiMoBiWFA1i/vNNeYDQsqusZn4PoJVxfetyHk5crIx9Z9y/brx9Gi6E6OCcLZbFSXD
         f+tQ==
X-Gm-Message-State: AOAM531x50YVKbDgPErP6TSbeZJIOKbb9iycWT2ld+NLIKIpl+Mlx04Z
	PvB2npw+9N57AQi2YkKNlJs=
X-Google-Smtp-Source: ABdhPJwmHL8+M7o93dIJozcXFDCb0rWtmIJL/HJAEBQgQgicG2bRtLRcuKpkvbYiwnJ+MpSDPffVhg==
X-Received: by 2002:a2e:b7d4:: with SMTP id p20mr22799012ljo.248.1638606468786;
        Sat, 04 Dec 2021 00:27:48 -0800 (PST)
Received: from [192.168.1.11] ([94.103.229.236])
        by smtp.gmail.com with ESMTPSA id j19sm741553lji.94.2021.12.04.00.27.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Dec 2021 00:27:48 -0800 (PST)
Message-ID: <e0fea904-1861-0003-1b04-6d2e966657da@gmail.com>
Date: Sat, 4 Dec 2021 11:27:43 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] staging: vt6655: refactor byMinChannel to min_channel
Content-Language: en-US
To: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 =?UTF-8?B?QWxkYXMgVGFyYcWha2V2acSNaXVz?= <aldas60@gmail.com>,
 Karolina Drobnik <karolinadrobnik@gmail.com>,
 Lucas Henneman <lucas.henneman@linaro.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20211204004041.3825744-1-alb3rt0.m3rciai@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20211204004041.3825744-1-alb3rt0.m3rciai@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/4/21 03:40, Alberto Merciai wrote:
> Replace camelcase hungarian notated variable "byMinChannel"
> into linux kernel coding style equivalent variable "min_channel".
> 
> Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
> ---
>   drivers/staging/vt6655/device.h      | 2 +-
>   drivers/staging/vt6655/device_main.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
> index 6ea4165e4929..109d20a010ab 100644
> --- a/drivers/staging/vt6655/device.h
> +++ b/drivers/staging/vt6655/device.h
> @@ -200,7 +200,7 @@ struct vnt_private {
>   	unsigned char byTopOFDMBasicRate;
>   	unsigned char byTopCCKBasicRate;
>   
> -	unsigned char byMinChannel;
> +	unsigned char min_channel;
>   	unsigned char max_channel;
>   
>   	unsigned char preamble_type;
> diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
> index 313f0241d989..4d92b5df5312 100644
> --- a/drivers/staging/vt6655/device_main.c
> +++ b/drivers/staging/vt6655/device_main.c
> @@ -228,7 +228,7 @@ static void device_init_registers(struct vnt_private *priv)
>   	spin_unlock_irqrestore(&priv->lock, flags);
>   
>   	/* Get Channel range */
> -	priv->byMinChannel = 1;
> +	priv->min_channel = 1;
>   	priv->max_channel = CB_MAX_CHANNEL;
>   
>   	/* Get Antena */
> 

Looks like this variable is set, but never used. Shouldn't it be just 
removed?

Same for max_channel (or byMaxChannel).




With regards,
Pavel Skripkin
