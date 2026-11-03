Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793713829;
	b=Qda0AQcd0XglfLAxl6F2gLyBCK87w3/h2Z4GCy+S6iYe4DTKKomdFmon6Kt2JsCNTpMb
	 GqLE+lrl4GWQQciCv4L4mLvQ4YInf5mTCrvIWFuw28QuYfE4EHFWojDPDa8DMjaVJlUIY
	 MnMy21pNyk2jmM+CdQQwYSQTJ6nG+xfDFEdwkfUMMpTceFb6YYjwUOq8YMaixWhqh5fwG
	 mackUYgC8GgfrtYdRpMSiFrIDyfXe6T3veWceh3mbSTV1R/83XyVaQDQzkHRJj2bIo10D
	 fKP3iKgjQaOTknUomIvA3OVIDJOG+7VriIK3Jhq3jrBsyLBLiZHb85DlmbyfKlyKSvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793713829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=3dgjpC6pDuaS5y6mKKf0Dd9vvhNJOGz9Bm42FlKdXjk=;
	b=UsmrDQBynwqyilC0stFjgHVh8CaIhfuI9tqT6tUrOlF4wTMoWHSLazqs04HyVVaUtDOI
	 9+Yi/TquOKyBZ+LfNZCa79D1QvM/rEOyp3gFYL4FKz3k+GG0e3B55sN33w9EWxcgm/zaI
	 davfwCHFy2Fmgpmo/ML1hDSUT5+dQLLmqNZtVOC7ss0PxtdLDew7EHmJ70wz5zAUPzoVQ
	 nX8NucKhhnc4ystPdpn4Bfyo9TUkJsTtclkrDVKRbra2dU9EtozGvZCeWZIZJMgymesYD
	 ZOc/lKnSGLaHHKMMi5oD6lUgNl1E4Z2eUkeXuO9zZUAuFneNigGxWyid38Nn5neGRoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ieee.org;
	spf=pass smtp.mailfrom=ieee.org;
	dkim=pass header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=fFKBKrWk;
	arc=none smtp.remote-ip=209.85.210.44
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8FA606A324
	for <linux-staging@lists.linux.dev>; Tue,  3 Nov 2026 13:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C8FA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ieee.org header.i=@ieee.org header.a=rsa-sha256 header.s=google header.b=fFKBKrWk
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-8451a619da7so2967400a34.1
        for <linux-staging@lists.linux.dev>; Tue, 03 Nov 2026 05:50:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1793713826; x=1794318626; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3dgjpC6pDuaS5y6mKKf0Dd9vvhNJOGz9Bm42FlKdXjk=;
        b=fFKBKrWkyxOQYleyVbgFpTBXsBd7qI2M1v2iTv+w2+/pq1WV2iCyeGtE3jug4hlrhQ
         EwtDKzgMQ5HNfQDlSMZ2+lSlE+7MZGj8eEQkFxx2wfaWjFpU02iNER5Z36caRaJaidqH
         lvUweouUBafTsn+cXpbv4qB1eCSZexqHY4SNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793713826; x=1794318626;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3dgjpC6pDuaS5y6mKKf0Dd9vvhNJOGz9Bm42FlKdXjk=;
        b=XslKuCawxUhnQEWCOZ5HPrBjik5vDedbuWaZQY6VwyLPbZ7gvJ1IBfug8sso75F4xW
         1mB5Mdf0GB+OQcsRmhzk8dAcyf0csmOJUg+eZC6Sg7jhLdE/V4BAW22ZjeUs4s/KkSAL
         PwWS+k0PKp/u2MvcYzWZQvC9tLfQhbPKFZ0kjPu2LBMD3rrReMJ9eCLetDyERb469yY0
         OuDkNGTeFeevjrA2hepjJ/v77QXYapQcAM1qNLkKxIWiAN+allaIstXQU36jqa8DFWtS
         fOMhh29f7WqpIUF+P0B3jz+2WUZYOom3xJDY7tMjIzf9BnUI6t7IzWx+/sBQq9jBZGQF
         IBQQ==
X-Forwarded-Encrypted: i=1; AKwUvByRJMxa7ck9HhZXm7Y5O+llc6xEiCn711lXPFY1tpT36NLhY+7vpF1e+qw8In4sydo1kII7EYIcUTg43fRF@lists.linux.dev
X-Gm-Message-State: APuU4Z+sBIZ3PtsJ0gvb4eSkehFt3p9kPkO0zTTXhpC9MnuSV8GcVPbs
	FVcZX4+KyaX3B4g6reqoxhaoBqTqdTjKWolu/oJ1xdiLWMRUdw7UGv7tPPJwsaPnGQ==
X-Gm-Gg: AYBFou20il2eN4cTMUcnuuaM3+3gwwzRIMxtOdUgTPPXyllq2A4x+RNEBhVvpKwl6hV
	i/ZrWvZgstWJwHWKJ8AWYl1GhYvZDHrlk+5gLMsOd50OUDpXYSdGfmxLvWFXWoktCyxTB69uG9n
	ZmJmzxahTbgfqNoI73MhfLpxLk9vzUfOPMgnUjnTbl0l6jG/yGBBk5qPX/bwjqbjumZ+o1n93T6
	mZKXChAZSvnJ44wvkyjwE3FsH4YGFFIZXfYDIjm+w4gMsmW+Zcekp33/kTn/6XjuSW3+toSrLxc
	9v5FpK50EqvNy7YAx0XSYtWAPoMB5hCDSIKcQFhZAMy5AeJVxZEJSOsa5DFZAI4q+wc7Q8mtA+6
	WuOYxZGkF6B2MqIybpdq4R9VYw+BRMvqfDsjR2wSAXCHGQrgX6bjqqknkjjqeV8BQM2KIjVzQVJ
	e9GSdVeSXB4gRDVDgsenyoHfCaFLbg32UkO8c2JCYIksFUwhN7jTKRTJ/vG5MQx1rTD/MKXHryu
	zPFc2O/UYkIesnNRiYW+1sOiv80jE1bHOx+wFNALL6Esrl3bNRIRrhmvtD7BIcIvWiJl9R1JAUb
	UsUaMt1X0c3DrnAe5+6cmhQ=
X-Received: by 2002:a05:6830:3915:b0:814:8259:780c with SMTP id 46e09a7af769-85d364b61eemr8811788a34.19.1793713826096;
        Tue, 03 Nov 2026 05:50:26 -0800 (PST)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-85d3549a245sm12141851a34.12.2026.11.03.05.50.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:50:25 -0800 (PST)
Message-ID: <686eac0f-6ec0-474f-8a9b-9d52cf23aad1@ieee.org>
Date: Tue, 3 Nov 2026 07:50:24 -0600
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: light: use sysfs_emit() instead of
 sprintf()
To: Ken <ken3009le@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261031084648.213333-1-ken3009le@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20261031084648.213333-1-ken3009le@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/31/26 3:46 AM, Ken wrote:
> According to Documentation/filesystems/sysfs.rst, the show() callback
> should use sysfs_emit() instead of sprintf() or snprintf().
> Convert fade_*_show() and color_show() to use sysfs_emit() for safer
> buffer handling and consistency with other greybus drivers.
> 
> Signed-off-by: Ken <ken3009le@gmail.com>

I presume "Ken" is not like "Cher" or "Ronaldo" or "Drake".

Please use real, full names in your signoffs.

Also review the mailing list history for other instances of
patches like this.

					-Alex
> ---
>   drivers/staging/greybus/light.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
> index cab02b5da..2689f9a75 100644
> --- a/drivers/staging/greybus/light.c
> +++ b/drivers/staging/greybus/light.c
> @@ -173,7 +173,7 @@ static ssize_t fade_##__dir##_show(struct device *dev,			\
>   	struct led_classdev *cdev = dev_get_drvdata(dev);		\
>   	struct gb_channel *channel = get_channel_from_cdev(cdev);	\
>   									\
> -	return sprintf(buf, "%u\n", channel->fade_##__dir);		\
> +	return sysfs_emit(buf, "%u\n", channel->fade_##__dir);		\
>   }									\
>   									\
>   static ssize_t fade_##__dir##_store(struct device *dev,			\
> @@ -220,7 +220,7 @@ static ssize_t color_show(struct device *dev, struct device_attribute *attr,
>   	struct led_classdev *cdev = dev_get_drvdata(dev);
>   	struct gb_channel *channel = get_channel_from_cdev(cdev);
>   
> -	return sprintf(buf, "0x%08x\n", channel->color);
> +	return sysfs_emit(buf, "0x%08x\n", channel->color);
>   }
>   
>   static ssize_t color_store(struct device *dev, struct device_attribute *attr,

