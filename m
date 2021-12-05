Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AF568
	for <linux-staging@lists.linux.dev>; Sun,  5 Dec 2021 14:42:08 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id n12so19044866lfe.1
        for <linux-staging@lists.linux.dev>; Sun, 05 Dec 2021 06:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=9hzEaIVqq335e23MvDqReSgGMhOzvqBQz76Z7rLY3NY=;
        b=hb9FuqdiY8JicBpnKpYQZbcVSgqrOvzetp/GSJMG3rMJzM6YPXshJ/f2Uha8s+ogT4
         FwKDdNJYXndaf5dTFigg3bMpAPyLvFIJE2wQIqpMNlU3tiu3a34KE1x3AMv12xrT65Iv
         aXLdGhbLUezuhdUgksWgbEIB2ASfo277iE920mmGGSOnQQXhF6SdFcZZX8iHKfncGYfD
         u+HSwWq8tz4RleuqtZkVolYppjUfnrqpB/Yl20qhbi1OVeIHvW+j4QB2o/h+4tJYlOx5
         SO6J1Nz2dRLXI4Ktxj3A7IxAn7ElXkTFvsuvsjcwdcPQR3BKlTL3rU10UbFco75jkyYc
         +rjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9hzEaIVqq335e23MvDqReSgGMhOzvqBQz76Z7rLY3NY=;
        b=myWZuZdLylBVhNz5MxNWCU6GxaPS34uXT8pZg6mJApj8DRzWNcIsPKZzWTQ6Uyer+Q
         ZcaWoz+wdBcS8A+YKzKe5HYelP7Ryg3MxfKyX3VZXlr8tTpFB2yaQsxKgXK8MWkmqZHE
         tDDLmJ4z/bd96265plCh9f2DrkCbyUYnbr3I6EbBMW/Tj37VuLEETRaUmDmzIDrb2xyQ
         yFN9OsULdyEUHkDq0gK4MZ4OmUxkoD7JMDuGYWdtIxrEeFMSKyaaRIV5y6ywqTwXDOip
         uQHNOPUlrRvCD4DvE/71TvDHvOVNEap5chPOBNc3JZ7HNpDXlFqvrEimGJnUX7GsHyHe
         tDUw==
X-Gm-Message-State: AOAM5310qc7RQlbAbQ3QQW0M5ewcXZG+ijCJbm4Fpel51L8H6bk7EFs8
	gbO/QsKJxmtbNKdS8Dn3AQ4=
X-Google-Smtp-Source: ABdhPJwI1vdWuzkkgMdTgoRkjG5Ou53mIQQKRujK2BpPjjotBFqOfe4bjTcmWNOVCYbam2sevedUBg==
X-Received: by 2002:ac2:5b92:: with SMTP id o18mr2091481lfn.473.1638715326652;
        Sun, 05 Dec 2021 06:42:06 -0800 (PST)
Received: from [192.168.1.11] ([94.103.229.236])
        by smtp.gmail.com with ESMTPSA id j15sm1094919lfe.157.2021.12.05.06.42.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Dec 2021 06:42:06 -0800 (PST)
Message-ID: <197e167b-2225-3593-dab3-4f1f61331de9@gmail.com>
Date: Sun, 5 Dec 2021 17:42:05 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 12/12] staging: r8188eu: hal_data_sz is set but never used
Content-Language: en-US
To: Michael Straube <straube.linux@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, phil@philpotter.co.uk,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20211205135919.30460-1-straube.linux@gmail.com>
 <20211205135919.30460-13-straube.linux@gmail.com>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20211205135919.30460-13-straube.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/5/21 16:59, Michael Straube wrote:
> hal_data_sz in struct adapter is set but never used. Remove it.
> 
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> ---
>   drivers/staging/r8188eu/hal/usb_halinit.c   | 1 -
>   drivers/staging/r8188eu/include/drv_types.h | 1 -
>   2 files changed, 2 deletions(-)
> 
> diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
> index 641aaf299109..da966538596f 100644
> --- a/drivers/staging/r8188eu/hal/usb_halinit.c
> +++ b/drivers/staging/r8188eu/hal/usb_halinit.c
> @@ -1969,5 +1969,4 @@ void rtl8188eu_alloc_haldata(struct adapter *adapt)
>   	adapt->HalData = kzalloc(sizeof(struct hal_data_8188e), GFP_KERNEL);
>   	if (!adapt->HalData)
>   		DBG_88E("cant not alloc memory for HAL DATA\n");
> -	adapt->hal_data_sz = sizeof(struct hal_data_8188e);
>   }

Not related to your patch, but not returning an error from this function 
  looks very dangerous to me.

adapt->HalData is used in GET_HAL_DATA() macro all across the driver 
code and nobody checks if it valid or not. If allocation fails here, 
than we will likely hit GPF while accessing hal_data fields.

Maybe we can embed struct hal_data_8188e instead of storing a pointer to 
it?



With regards,
Pavel Skripkin
