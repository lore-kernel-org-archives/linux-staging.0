Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF7A19BC2
	for <linux-staging@lists.linux.dev>; Thu,  2 Nov 2023 14:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MOe0EzcB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698934894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j+KMDmWsfkbK/uZawBiUpXpXzFBe4d7Moq6tBfbTgpA=;
	b=MOe0EzcBzymIV/45Fz+AN2SakEiZ/uiFJdR4hSKyLaz1Io3hkRZyGLqdWnWs0GQd0/ODae
	1Zl0mCPeflVeMeyq8TkAXyvRGnRD5Yk9YijmyVG8NDkXZlsHAFdzeXpJxhJ+u/cgOQJigw
	30pkPboSvj1WuGsW+WYuB3yNYTHg9J4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-Ml2aUuoQMseo6d9s8riH7w-1; Thu, 02 Nov 2023 10:21:13 -0400
X-MC-Unique: Ml2aUuoQMseo6d9s8riH7w-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-9c7558b89ccso68337266b.3
        for <linux-staging@lists.linux.dev>; Thu, 02 Nov 2023 07:21:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698934870; x=1699539670;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j+KMDmWsfkbK/uZawBiUpXpXzFBe4d7Moq6tBfbTgpA=;
        b=mOIitVnu81XrUaqcLpLmQNSAb2Z1lMRLrtEIFY9LjUQOoGyuwVSReYHyWfiQ65aFyR
         6RUnMLBhE10Bv3MHwf1ELxqukqRPnXQVPCysWKPmRj3/Kq7TpYNMt8JBL2IpAJlUAbaX
         GDkjuM5krqFZgNTrwID3pOGDgmwpkZYOTpSzOQw9/vNZUxAAMl5sfcErB2zI2MOeycfj
         GHLGU1oSgfXmHu3dKsnx0YJnWHZWzR9SmcXltcgMg0FFgyC4z8o+9vCLK/ILLvY5C5Em
         oPprH/w/tEzl0d2mZiRSfRRCkZgCo2lpfqPw8JTZH2B2u+DePIjWjAH+1IM2ha3I/NbC
         jtUg==
X-Gm-Message-State: AOJu0YwH3VKmFhZfoflD3ae63PNnRuTW5c/4Xr7TaBNQ+1Ej/Y8J4xM4
	nO0SfUaF4x3qG63sXz9TLaEyAmg07UMzORo9opoC2lalbbFarLqSaOgCZm/f7HFPvz6Z48ircg0
	7OF7vhhlkjMDGec64+1x+0zqZyqN5jVslxQ==
X-Received: by 2002:a17:907:1c9e:b0:9b2:b768:3cfc with SMTP id nb30-20020a1709071c9e00b009b2b7683cfcmr4557251ejc.1.1698934870243;
        Thu, 02 Nov 2023 07:21:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuL5GcHeae3w9tW2SVQM2AAgpf86TfGQJ9jKryff95GMK7q5xVXO8r/JwYXojIp4O+vTWY1g==
X-Received: by 2002:a17:907:1c9e:b0:9b2:b768:3cfc with SMTP id nb30-20020a1709071c9e00b009b2b7683cfcmr4557227ejc.1.1698934869797;
        Thu, 02 Nov 2023 07:21:09 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id bu6-20020a170906a14600b009829d2e892csm1225538ejb.15.2023.11.02.07.21.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Nov 2023 07:21:08 -0700 (PDT)
Message-ID: <b2aa6ccb-0a9a-449f-1341-fd71d5c545fd@redhat.com>
Date: Thu, 2 Nov 2023 15:21:04 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/4] Remove redundant return value check
To: Alexandra Diupina <adiupina@astralinux.ru>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andy@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
References: <20231102141135.369-1-adiupina@astralinux.ru>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231102141135.369-1-adiupina@astralinux.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Alexandra,

On 11/2/23 15:11, Alexandra Diupina wrote:
> media_entity_pads_init() will not return 0 only if the
> 2nd parameter >= MEDIA_ENTITY_MAX_PADS (512), but 1 is
> passed, so checking the return value is redundant

Generally speaking functions which can fail should always be
error-checked even if their invocation today happen to be
such that they will not fail.

Either the invocation or the function itself my change
causing it to fail in the future. Which is why we want
to keep the error checks.

But maybe media_entity_pads_init() is special and
does not need to be error checked.

Sakari, Laurent do you have any opinion on this ?

> Found by Linux Verification Center (linuxtesting.org) with SVACE.

This feels like a false positive of the tool to me,
but lets wait and see what Sakari or Laurent have
to say.

Regards,

Hans



> 
> Fixes: ad85094b293e ("Revert "media: staging: atomisp: Remove driver"")
> Signed-off-by: Alexandra Diupina <adiupina@astralinux.ru>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-gc2235.c        | 4 +---
>  drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c       | 6 +-----
>  drivers/staging/media/atomisp/i2c/atomisp-ov2722.c        | 2 --
>  drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c | 2 --
>  4 files changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> index 9fa390fbc5f3..f10931a03285 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc2235.c
> @@ -840,9 +840,7 @@ static int gc2235_probe(struct i2c_client *client)
>  	dev->ctrl_handler.lock = &dev->input_lock;
>  	dev->sd.ctrl_handler = &dev->ctrl_handler;
>  
> -	ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
> -	if (ret)
> -		gc2235_remove(client);
> +	media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
>  
>  	return atomisp_register_i2c_module(&dev->sd, gcpdev, RAW_CAMERA);
>  
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> index 1c6643c442ef..b7a940fdbd0a 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-mt9m114.c
> @@ -1581,11 +1581,7 @@ static int mt9m114_probe(struct i2c_client *client)
>  
>  	/* REVISIT: Do we need media controller? */
>  	ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
> -	if (ret) {
> -		mt9m114_remove(client);
> -		return ret;
> -	}
> -	return 0;
> +	return ret;
>  }
>  
>  static const struct acpi_device_id mt9m114_acpi_match[] = {
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> index 6a72691ed5b7..922774293bf4 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2722.c
> @@ -993,8 +993,6 @@ static int ov2722_probe(struct i2c_client *client)
>  	dev->sd.entity.function = MEDIA_ENT_F_CAM_SENSOR;
>  
>  	ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
> -	if (ret)
> -		ov2722_remove(client);
>  
>  	return atomisp_register_i2c_module(&dev->sd, ovpdev, RAW_CAMERA);
>  
> diff --git a/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c b/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
> index 460a4e34c55b..8d5b74fb5d9c 100644
> --- a/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
> +++ b/drivers/staging/media/atomisp/i2c/ov5693/atomisp-ov5693.c
> @@ -1733,8 +1733,6 @@ static int ov5693_probe(struct i2c_client *client)
>  	dev->sd.ctrl_handler = &dev->ctrl_handler;
>  
>  	ret = media_entity_pads_init(&dev->sd.entity, 1, &dev->pad);
> -	if (ret)
> -		ov5693_remove(client);
>  
>  	return ret;
>  out_free:

