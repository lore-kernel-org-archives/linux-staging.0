Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893CC208B2
	for <linux-staging@lists.linux.dev>; Mon, 19 Feb 2024 06:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708324783; cv=none; b=tNkurmnYer5F1FFudRKcyuEL4rfkt9m7ZHL8UoYqtIRSx/aUtQRTva//S9C2YwtMINJWFOi5aan0tPHAwoBkVNfKZnGgSZKOgazEeTMA+OXg3wCmdBSU6YI/Jm6rtz/FzfXsK0BCPNdFc9mTewJX6GDEyLnJDwkRdtaPXvJg6Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708324783; c=relaxed/simple;
	bh=sjRZqFJmGiF9TRp752LBLHHMjWNbBVWBekq9/44Ejzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SeDfctyx27kdJk77JNmSUE4PxBU83PgDycqXAupG2iO9p3b8MfAgKVLUa7RnJPpXwoP3+OslAAmL3bIiMf5tIxWUSfuht0aR8UP8xmN4HS1owvSrdPSwo1YrSN1K5pnUJMcntycTQ8JMmI9xqqZp8lORjSm7rx4TG1cA6o44U8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jsiYgbVD; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jsiYgbVD"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-55a8fd60af0so5817787a12.1
        for <linux-staging@lists.linux.dev>; Sun, 18 Feb 2024 22:39:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708324780; x=1708929580; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AmJlj9IwjLF3l7fXdAXhun2W1nnG7kbqGQDiD2NuR8k=;
        b=jsiYgbVD5VJKJCL8oRiN3y20vz0KsYlJmMAp3tR8pCTIXEUyV3iFeZT9tx5fBlq/bp
         yWV2XoQJGZEgRQrF396y8kcjLjYWF9VQb0X7xJYVGLqS4891JBm7L1Hq1yQA5qTy3gFQ
         onWhg1zUOzLUVMPwEhBWjnUfl2oo96HAxUkkoc3ts+DUAAnM/7zlJMgXnL+Zg4c2Ek71
         kfwEX3C6M54IKs+hhLoNgRfBcZymyJcuxYBD/cGdIuKl93nxrmm43BNphHoh/u3cmj/F
         J4uFneAvO09z2jXNBEmGba9oq/5fWr3BNL2JsKRmfxWeYOcVq9psY++CRJBCUDDDYej5
         BHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708324780; x=1708929580;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AmJlj9IwjLF3l7fXdAXhun2W1nnG7kbqGQDiD2NuR8k=;
        b=FqM5P0eGWBpiG9Alqg98OQc3+lRstqsDzQqy+cAtYyL14XIUaaBHtwKz9ix8LNbY+a
         o5zBj/vYAAmtkdaN4Q2cNlafQfKnBmzIgA1SHcIpH88I7Vdo46Ca66iVRBQpz26e0mYi
         pMB7kPo3qIp+HP+kIWghoCUpSll9WJ00srsziXvxegJUlqgA9cBcZ566mbZP7HgBL3xU
         6Jw8ehVIdH/T1vV63lvccxEkgnXpkEc0Zc/kuvhZBuHJ5C5z7mkHONlHlg7VTsDpJe0T
         YnvofLktqMVscJ2YyQLz3rhenS08oS1tZPfg92JgDmLLWaP7J5c8WX2pczOaXNLb8Ir2
         z68g==
X-Forwarded-Encrypted: i=1; AJvYcCVnGILOAnkuSE4YtXruND0ZAALawX7diwvEPWhT74z3qOk4QIlsuw+oi4yDOjpdtnsfcEpE/MCLxIi/IxZWwDGuXVNEF/CNdmXzIxNW5A==
X-Gm-Message-State: AOJu0YxfHrmyoiqtb7ugVJc18y+lcQpT64eYSlraYshLrzezHrdTrfI8
	EojkhpVsDWyH3vjIl+Fq8b5Mxqox1GJQc1/oDRfQIpRncbnl6Nm7zKbSAcnFecE=
X-Google-Smtp-Source: AGHT+IE0lRySbhCpT61lK2s4dp+A3WXUcUSWKSoMrTpO4ff5uUV/6rODCAr8djn3WbbOkL261QrRJg==
X-Received: by 2002:a05:6402:784:b0:564:7962:4553 with SMTP id d4-20020a056402078400b0056479624553mr865356edy.16.1708324779644;
        Sun, 18 Feb 2024 22:39:39 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id eg43-20020a05640228ab00b0056454c668f9sm1279229edb.53.2024.02.18.22.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 22:39:39 -0800 (PST)
Date: Mon, 19 Feb 2024 09:39:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Moritz C. Weber" <mo.c.weber@gmail.com>
Cc: florian.fainelli@broadcom.com, linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: vc04_services: bcm2835-camera: fixed several
 brace coding style checks
Message-ID: <8fe8c4bf-5fa3-4bfc-9535-b48df12f80ff@moroto.mountain>
References: <20240215220647.4096-1-mo.c.weber@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240215220647.4096-1-mo.c.weber@gmail.com>

On Thu, Feb 15, 2024 at 11:06:47PM +0100, Moritz C. Weber wrote:
> @@ -406,12 +405,11 @@ static void buffer_cb(struct vchiq_mmal_instance *instance,
>  	    is_capturing(dev)) {
>  		v4l2_dbg(1, bcm2835_v4l2_debug, &dev->v4l2_dev,
>  			 "Grab another frame as buffer has EOS");
> -		vchiq_mmal_port_parameter_set(
> -			instance,
> -			dev->capture.camera_port,
> -			MMAL_PARAMETER_CAPTURE,
> -			&dev->capture.frame_count,
> -			sizeof(dev->capture.frame_count));
> +		vchiq_mmal_port_parameter_set(instance,
> +					      dev->capture.camera_port,
> +					      MMAL_PARAMETER_CAPTURE,
> +					      #N(#O(#O(#O(#O(&dev->capture.frame_count,
                                              ^^^^^^^^^^^^^^^^

Wut?

> +					      sizeof(dev->capture.frame_count));
>  	}
>  }
>  
> @@ -420,11 +418,11 @@ static int enable_camera(struct bcm2835_mmal_dev *dev)
>  	int ret;
>  
>  	if (!dev->camera_use_count) {
> -		ret = vchiq_mmal_port_parameter_set(
> -			dev->instance,
> -			&dev->component[COMP_CAMERA]->control,
> -			MMAL_PARAMETER_CAMERA_NUM, &dev->camera_num,
> -			sizeof(dev->camera_num));
> +		ret = vchiq_mmal_port_parameter_set(dev->instance,
> +						    &dev->component[COMP_CAMERA]->control,
> +						    MMAL_PARAMETER_CAMERA_NUM,
> +						    &dev->camera_num,
> +						    **sizeof(dev->camera_num));

Also Wut???


regards,
dan carpenter

