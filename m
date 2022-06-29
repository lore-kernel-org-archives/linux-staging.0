Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE75C7EB
	for <linux-staging@lists.linux.dev>; Wed, 29 Jun 2022 07:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1656488233;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1h0smKgkaQYyMckjg1gEO+92UXCJgyf7f6YfzsCAFg4=;
	b=A9r6z16eLePDP7bGnj4DQvo7y3G6bSPDfVUon8h8UU1fWVxsHhqlS7X5ho2Kg8bsJ94eAB
	ZpiagtHmU1cR+Mbl+pQ9uTE8c3wDDfX5ZBou6CQVNZ5jJ68lAXx9uYydmYJ32oQ+BT7P8w
	R0bVtv950eOUgOiUhg0nh9TLSJUseeI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-126-t0LPQGv0NQ62Co7ZYaKcMw-1; Wed, 29 Jun 2022 03:37:12 -0400
X-MC-Unique: t0LPQGv0NQ62Co7ZYaKcMw-1
Received: by mail-wr1-f70.google.com with SMTP id a1-20020adfbc41000000b0021b90d6d69aso2127238wrh.1
        for <linux-staging@lists.linux.dev>; Wed, 29 Jun 2022 00:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1h0smKgkaQYyMckjg1gEO+92UXCJgyf7f6YfzsCAFg4=;
        b=6yU1i48sdWEi+wtbV/UTrmjaDetYb7zsblm/bDliHgEvUWOMzIS7i9O/pTKUlHvWDF
         IW2eKs7eU42/nHBYyvErXZ/xCCKfbM4WVRHu2OUUf4POK3EUuO8vHol/ygl5M/Kf/nUs
         SWwdiQZmTjobepuO1Ir/BAAZcdDDEMFw9G+i1oUbLKlyAW0seVNdiBTaxuwMaGDF6Fx1
         dU9mnOEAs7x2I1mEpBmQLFFR29848HVgfHNODPWPVUzlLT/uURdp4jJeWM3NEONtC6Dp
         CKSIDzM1r22HGv639sK2ToCpM4JSWXy2fNJ4lk1QofkSRxq8wL9VSzZQ8YLA1Il/faR/
         aBfw==
X-Gm-Message-State: AJIora97jjka3LVfheXD+gsnyQ42n1ie5+O2qDUw6s6uyr9x3vKmTkSQ
	IRaol/hQ0hZXg3Q6mKylxYGP7gnaO6+IP9jOZcXBauSGblIudTJGFSUVQNXYw2RoQwyL/5RNhX1
	vE9B7xyoGvH1tzOcZxZkAchRU6A==
X-Received: by 2002:a05:6000:1448:b0:21b:b7db:c40b with SMTP id v8-20020a056000144800b0021bb7dbc40bmr1650276wrx.279.1656488231013;
        Wed, 29 Jun 2022 00:37:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vfq7mqFRSJqFJPQOP6rs25Ch1nA7fBeueZwuaRaLaWENw0ay54yTOP4QHXmGLo1NEA4L9c5g==
X-Received: by 2002:a05:6000:1448:b0:21b:b7db:c40b with SMTP id v8-20020a056000144800b0021bb7dbc40bmr1650238wrx.279.1656488230741;
        Wed, 29 Jun 2022 00:37:10 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id j10-20020a5d448a000000b0021b8c99860asm15832366wrq.115.2022.06.29.00.37.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 00:37:10 -0700 (PDT)
Message-ID: <7654a74e-a410-a8a5-c228-d006dbbc200f@redhat.com>
Date: Wed, 29 Jun 2022 09:37:08 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Jeremy Kerr <jk@codeconstruct.com.au>
Cc: linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-iio@vger.kernel.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-rtc@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-staging@lists.linux.dev,
 kasan-dev@googlegroups.com,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org, acpi4asus-user@lists.sourceforge.net,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org,
 openipmi-developer@lists.sourceforge.net,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Support Opensource <support.opensource@diasemi.com>, netdev@vger.kernel.org,
 Wolfram Sang <wsa@kernel.org>, linux-crypto@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 patches@opensource.cirrus.com, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
 <60cc6796236f23c028a9ae76dbe00d1917df82a5.camel@codeconstruct.com.au>
 <20220629072304.qazmloqdi5h5kdre@pengutronix.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220629072304.qazmloqdi5h5kdre@pengutronix.de>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/29/22 09:23, Uwe Kleine-König wrote:
> Hello,
> 
> [I dropped nearly all individuals from the Cc: list because various
> bounces reported to be unhappy about the long (logical) line.]
>

Yes, it also bounced for me when I tried to reply earlier today.

> diff --git a/drivers/gpu/drm/solomon/ssd130x-i2c.c b/drivers/gpu/drm/solomon/ssd130x-i2c.c
> index 1e0fcec7be47..ddfa0bb5d9c9 100644
> --- a/drivers/gpu/drm/solomon/ssd130x-i2c.c
> +++ b/drivers/gpu/drm/solomon/ssd130x-i2c.c
> @@ -39,13 +39,11 @@ static int ssd130x_i2c_probe(struct i2c_client *client)
>  	return 0;
>  }
>  
> -static int ssd130x_i2c_remove(struct i2c_client *client)
> +static void ssd130x_i2c_remove(struct i2c_client *client)
>  {
>  	struct ssd130x_device *ssd130x = i2c_get_clientdata(client);
>  
>  	ssd130x_remove(ssd130x);
> -
> -	return 0;
>  }
>  
>  static void ssd130x_i2c_shutdown(struct i2c_client *client)

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com> 
-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

