Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D3E68
	for <linux-staging@lists.linux.dev>; Sat,  4 Dec 2021 08:38:23 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id l22so12293077lfg.7
        for <linux-staging@lists.linux.dev>; Sat, 04 Dec 2021 00:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Iq91punDd7cKLt5NHGxJuQc18kZP0dgQtqZmR6jVBZM=;
        b=B8pVjFT5w2dL+65gFXHPa5Qu8kWqrX2ZEFd4TrDk8lPm4Lx6Q/PI6hHNZ1e+O0a0Xa
         u7s7GcySQEE1q2XApr3kPJyhz9cpg7JtmCbcWqU2HGYR5icFGLIkzICWChvIrRML8ktK
         qEX/INs2y5pC6g9BFJ9BLgEL3xNIjHQTYRrcZCmdf4Bk5FlrkkI88VRt3TPdY01SuTcp
         1PevbpDttW12Pkx+g+1HqzHQku8nQ+I8hDDpoW43a0BLIMTzjGocM6amOFtwHt72261f
         /G/S6Qk2el/piag++QoQULoqx0wq2OLZwhhQHxQWe/O3YuSHx8yJtNdASbY39CiUCMmO
         zr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Iq91punDd7cKLt5NHGxJuQc18kZP0dgQtqZmR6jVBZM=;
        b=fXFs8ekCBGGqH+7M5OfJCi8+fzpI4CE4ddR9ar1/pkuXG3K5lNwCQr+cPeNB4lBYPJ
         3WPNeG5pI7dnGQTkBiH3ebSyu8oLNFcwCMlziDX71Aq5ClwLKlaz9hS8QSoInNAAp9A5
         /Y2cbMzlh/9lI0rYTWIqo6323GO2J8xImxoYAdXndYVYgF6lhXW8iKMwoqWw3uGOiEh0
         yVwlP5acEpgniZKrdkU5b5897TzPtQQoykZ/JcwBMfrsUkucL9ijm3LHod/zQNQDQoFk
         2mG5pdpV4JgEMyEVLHGuH3/i2RN2Jw5oEcM1SOOMRCjq8EJxxv4o5fEuoEC8vSKK+7Ri
         m4EQ==
X-Gm-Message-State: AOAM532Ul7V8vzpHn/EB9gWjmvxPX0I6cw1AbkdADpyD5LmlrpDx9l+G
	Aznp2CIz5n/oOY66zp7kFrbzLxHbqldmEw==
X-Google-Smtp-Source: ABdhPJwyVgZ536/k6VjtKdFHBUUYhqOvFzG5ibN+LIc3/B3tmdsyDtGMtZBrYlNTHEMDnSD1LmwSQw==
X-Received: by 2002:a05:6512:519:: with SMTP id o25mr22179619lfb.422.1638607101886;
        Sat, 04 Dec 2021 00:38:21 -0800 (PST)
Received: from [192.168.1.11] ([94.103.229.236])
        by smtp.gmail.com with ESMTPSA id s4sm745615ljp.73.2021.12.04.00.38.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Dec 2021 00:38:21 -0800 (PST)
Message-ID: <19041795-e692-dd19-c14f-cd951bc7a3de@gmail.com>
Date: Sat, 4 Dec 2021 11:38:16 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v3] staging: vt6655: refactor byRadioCtl to radio_ctl
Content-Language: en-US
To: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
Cc: Forest Bond <forest@alittletooquiet.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 =?UTF-8?B?QWxkYXMgVGFyYcWha2V2acSNaXVz?= <aldas60@gmail.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Karolina Drobnik <karolinadrobnik@gmail.com>,
 Lucas Henneman <lucas.henneman@linaro.org>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20211203202410.3807147-1-alb3rt0.m3rciai@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20211203202410.3807147-1-alb3rt0.m3rciai@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/3/21 23:24, Alberto Merciai wrote:
> Replace camelcase hungarian notated variable "byRadioCtl"
> into linux kernel coding style equivalent variable "radio_ctl".
> 
> Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
> ---
> 
> v2 -> v3
> - replace typo inside mail message body
> v1 -> v2
> - Correct mail subject
> 
>   drivers/staging/vt6655/device.h      | 2 +-
>   drivers/staging/vt6655/device_main.c | 8 ++++----
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
> index c51eba94230d..245f992e5a23 100644
> --- a/drivers/staging/vt6655/device.h
> +++ b/drivers/staging/vt6655/device.h
> @@ -227,7 +227,7 @@ struct vnt_private {
>   	bool bPWBitOn;
>   
>   	/* GPIO Radio Control */
> -	unsigned char byRadioCtl;
> +	unsigned char radio_ctl;
>   	unsigned char byGPIO;
>   	bool hw_radio_off;
>   	bool bPrvActive4RadioOFF;
> diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
> index 897d70cf32b8..37a82550ca82 100644
> --- a/drivers/staging/vt6655/device_main.c
> +++ b/drivers/staging/vt6655/device_main.c
> @@ -371,18 +371,18 @@ static void device_init_registers(struct vnt_private *priv)
>   
>   	priv->radio_off = false;
>   
> -	priv->byRadioCtl = SROMbyReadEmbedded(priv->port_offset,
> +	priv->radio_ctl = SROMbyReadEmbedded(priv->port_offset,
>   					      EEP_OFS_RADIOCTL);
>   	priv->hw_radio_off = false;
>   
> -	if (priv->byRadioCtl & EEP_RADIOCTL_ENABLE) {
> +	if (priv->radio_ctl & EEP_RADIOCTL_ENABLE) {
>   		/* Get GPIO */
>   		MACvGPIOIn(priv->port_offset, &priv->byGPIO);
>   
>   		if (((priv->byGPIO & GPIO0_DATA) &&
> -		     !(priv->byRadioCtl & EEP_RADIOCTL_INV)) ||
> +		     !(priv->radio_ctl & EEP_RADIOCTL_INV)) ||
>   		     (!(priv->byGPIO & GPIO0_DATA) &&
> -		     (priv->byRadioCtl & EEP_RADIOCTL_INV)))
> +		     (priv->radio_ctl & EEP_RADIOCTL_INV)))
>   			priv->hw_radio_off = true;
>   	}
>   
> 

This one is odd. Code uses byRadioCtl as local storage to check register 
value within one function...

I might be missing something, but I think, it can be removed as well.




With regards,
Pavel Skripkin
