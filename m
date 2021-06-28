Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5217E70
	for <linux-staging@lists.linux.dev>; Mon, 28 Jun 2021 15:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1624894530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yXwdIk3X8hXQxAHomN/zLsNCwHoCvetUnw2dOV3ipe8=;
	b=RKvLHe4/ThqnKTNqRBIhVIaUeT+lXCuuHs6focPnjNZ4fdGK8xBISB2s5Wi25xRT7N+qHt
	GHapbhx+W1gbLpVjqXE4ZnOAkc/8OgCj6umEuqkTM+I8pVWfEc0l7gwGwjrhQdvlBoM/FO
	crcbdQTEqJ3i9fYx7TUl6maVtsVlU3k=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-FI3572KdN9m1ntQD6fmXNg-1; Mon, 28 Jun 2021 11:35:28 -0400
X-MC-Unique: FI3572KdN9m1ntQD6fmXNg-1
Received: by mail-ed1-f70.google.com with SMTP id y17-20020a0564023591b02903951740fab5so6445427edc.23
        for <linux-staging@lists.linux.dev>; Mon, 28 Jun 2021 08:35:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yXwdIk3X8hXQxAHomN/zLsNCwHoCvetUnw2dOV3ipe8=;
        b=FiJf4S+2ZcOVOAx9PggQvS1cmCqteN25FtB1fYs52bTIz01ab5XWvw94Ec9Prks8CH
         uCYMHnZ55B5pKVAn7S99Bfyg7mpK8jDC4fIB2jtvOieHYqy8M2YsJG3QviVb75js5bsQ
         w4nLu+OJ++y6lBXfdL2e9mVG4YEBjg7l9F9JsKI6cEvWLjbSjNKpgbAsoDgHkQyy9krZ
         rSIsV+LN/XhpD5R9HzaQHt+SIxcDDO/Gil9SkTqBnqGEOOl9Ziiglvzd1UP1SU/zmBr8
         SrDgdH4TmfQnyZMiuXDd+xQ+p3zod+qd5Dsqp1TpmaFVoyoCbvuAFZTeMH/uL/I7G3Vo
         d/wQ==
X-Gm-Message-State: AOAM530/6yZbSPEjbexvdPYlxj7XTv61Vp5JrhHSTS2dzwmzVdA8s4Uw
	J3WdnxFx4sLIbZ3+Y02k2hZZsUauTep0nLTHVfUe4lgHu2NC78mLrKfOXRDLBtLavU/8iK0ITjd
	RE2ZtV32uBdYcSUHmcH6TQ/ftjQ==
X-Received: by 2002:aa7:c607:: with SMTP id h7mr89203edq.13.1624894527265;
        Mon, 28 Jun 2021 08:35:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKWcVzXXSjUNAeYogJWwHAKcI3fCfXMxf8iGT7Bp9zXKW8ASVkVRrfL85WYQ0LvKJPEAucQg==
X-Received: by 2002:aa7:c607:: with SMTP id h7mr89188edq.13.1624894527155;
        Mon, 28 Jun 2021 08:35:27 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id gz17sm7039974ejc.91.2021.06.28.08.35.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jun 2021 08:35:26 -0700 (PDT)
Subject: Re: [PATCH] staging: rtl8723bs: Fix a resource leak in sd_int_dpc
To: Xiangyang Zhang <xyz.sun.ok@gmail.com>, gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net, fabioaiuto83@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20210628152239.5475-1-xyz.sun.ok@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <1ed687fa-3831-8dcf-35a4-6e32f5c26e97@redhat.com>
Date: Mon, 28 Jun 2021 17:35:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20210628152239.5475-1-xyz.sun.ok@gmail.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,

On 6/28/21 5:22 PM, Xiangyang Zhang wrote:
> The "c2h_evt" variable is not freed when function call
> "c2h_evt_read_88xx" failed
> 
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Signed-off-by: Xiangyang Zhang <xyz.sun.ok@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/staging/rtl8723bs/hal/sdio_ops.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
> index 2dd251ce177e..a545832a468e 100644
> --- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
> +++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
> @@ -909,6 +909,8 @@ void sd_int_dpc(struct adapter *adapter)
>  				} else {
>  					rtw_c2h_wk_cmd(adapter, (u8 *)c2h_evt);
>  				}
> +			} else {
> +				kfree(c2h_evt);
>  			}
>  		} else {
>  			/* Error handling for malloc fail */
> 

