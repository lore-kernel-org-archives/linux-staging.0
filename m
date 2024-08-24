Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF72154434
	for <linux-staging@lists.linux.dev>; Sat, 24 Aug 2024 11:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724498515; cv=none; b=e7Kc9ARJJVP0bkrDkXCPRyTikX/iBSF5iDZSw01zcr3DYJ2dR4K/XHGfcQp8IUtuF1zwcceHguU79DLoYDFmDtComLZqo5MIi7e4VsE4hB3MgQPrtsld08+UxkaK5R8aA6Kd8pG/2JTk0NlINaY7lTm6uq343jXbhnKwXW1KLAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724498515; c=relaxed/simple;
	bh=5zvM2KFJSLmf2j0o4lyODLjaUQNRb1ZGJX8epv/GGVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e96Oy1nSkQt8LVPSKhPbqLy+H2M664d06PNcUSwdGSgS7u/I3xxWKAOOC62MIMuz0FXA9ZTk+kxLk7ZK3vadYbqqsHFYC1sjcm4HGOPc9jNDFnnFLqo0ZjEbb32qpF5RSTJAfRyZHCc2b3SxH8zd13V1Uu7nxS6lnLurrmGD4Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g6gMfS2E; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g6gMfS2E"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5343eeb4973so978240e87.2
        for <linux-staging@lists.linux.dev>; Sat, 24 Aug 2024 04:21:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724498511; x=1725103311; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KWtz5uoijD/6sdwyrDoZiDmd8tFNxLEA+zxzqd/1RmE=;
        b=g6gMfS2EMz+HkI3vKHajzfNUcMzqrpy9w1UZI71AxK4BVe5Bs49JjnMulM+vMYLZhB
         5YOG5X8XH9qrmng6qB8HBzKLFoFpm7DR4yl4jOwq/0IVKyaqPhZEN1qUxC5Eoxz5Cedf
         0vB/O72DBsYNpZZLx5CbRBooDgaZ3IJUFH6cSi52LiV00hBQeMVL425VJNL9aIgfd4D7
         2J/PDoY6fj+1qFmEvFxoiw+FFznc2iQWnJeP86RbNwgRjGtHk1T/GtvvS0obb95Wm7oJ
         iF4rl5T9f3dTq1quZsV+iRQDzetATBbLahjh/bGBvH8qPYkN59S+fd5+Tn85zyfqJb7l
         iRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724498511; x=1725103311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWtz5uoijD/6sdwyrDoZiDmd8tFNxLEA+zxzqd/1RmE=;
        b=dvAYv0HNt1eUBd0+d4TPApPRLlZGTZnWiJUqd7zCiA15jnZVI4IAj0/NAIWtm5dTDF
         vswLjKbN2UrFVgh04gx8UrALlcVFVXBR6AgyqHXclyjcawgO1EA/FJ+Yk+yNLN7CC9U3
         +VprCjGQA8hoVLUD/munFOwFycWEU+/R2nbmWQDnYCnCPiX8SYxTaIyNxApzMA2yAOa2
         uK8bHVhD/qv1/Y+1THAx5nJ8IT48L3oi/srFdE6aDlaRIEDF5XaYOKE2wn3enEh5hAOi
         uiyZ/RLwyg02IOeUYw8hAcH5Gx5EEejMMesgRW0HQi+VnK5IcMm2JaheKhxOrGYTtuwa
         5fNg==
X-Forwarded-Encrypted: i=1; AJvYcCUK2XUHBgiA+hdIiy7DiTk/RuNZdDFtCH++9qC+eDGQpOLxZQA1AQ5/OT2+uCuiwpeumf+DkN4xk6mSYW4C@lists.linux.dev
X-Gm-Message-State: AOJu0YwNxR0g5un+PETwu7XpsfcIqZ6gpp/9+M1Yr3WBfwCqk41uRbLG
	TiUrPwwNSIBjIxANR+hu320rW36Di7KZfGXBJVBoeF0Pm32K1NKJnrUlHHKirSA=
X-Google-Smtp-Source: AGHT+IGtUfvB4kMQlCuoYKzAcwIUuuNFxDcBEeAyNnD4OTfW/GqzvO7likpmTQdheQWzjpKz07iUyw==
X-Received: by 2002:a05:6512:b86:b0:532:ec7d:9c67 with SMTP id 2adb3069b0e04-5343887e143mr4772670e87.47.1724498511343;
        Sat, 24 Aug 2024 04:21:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f48a9b6sm393560466b.179.2024.08.24.04.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 04:21:50 -0700 (PDT)
Date: Sat, 24 Aug 2024 14:21:47 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abhishek Tamboli <abhishektamboli9@gmail.com>
Cc: gregkh@linuxfoundation.org, tdavies@darkphysics.net,
	philipp.g.hortmann@gmail.com, garyrookard@fastmail.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org,
	rbmarliere@gmail.com, christophe.jaillet@wanadoo.fr,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8192e: Replace strcpy with strcat in
 rtl819x_translate_scan
Message-ID: <1c640c3d-c5db-4eb7-8a22-6d9886a1412a@stanley.mountain>
References: <20240823153411.74142-1-abhishektamboli9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240823153411.74142-1-abhishektamboli9@gmail.com>

On Fri, Aug 23, 2024 at 09:04:11PM +0530, Abhishek Tamboli wrote:
> diff --git a/drivers/staging/rtl8192e/rtllib_wx.c b/drivers/staging/rtl8192e/rtllib_wx.c
> index fbd4ec824084..ec0c4c5bade7 100644
> --- a/drivers/staging/rtl8192e/rtllib_wx.c
> +++ b/drivers/staging/rtl8192e/rtllib_wx.c
> @@ -23,14 +23,14 @@ static const char * const rtllib_modes[] = {
>  };
> 
>  #define MAX_CUSTOM_LEN 64
> +#define MAX_PROTO_NAME_LEN 10
>  static inline char *rtl819x_translate_scan(struct rtllib_device *ieee,
>  					   char *start, char *stop,
>  					   struct rtllib_network *network,
>  					   struct iw_request_info *info)
>  {
>  	char custom[MAX_CUSTOM_LEN];
> -	char proto_name[6];
> -	char *pname = proto_name;
> +	char proto_name[MAX_PROTO_NAME_LEN];

In the end I think we don't want to make this buffer larger.  But if we did
this define is really vague and slightly confusing.  I assumed it was something
else when I read it.  It hurts readability.  It would probably be better to just
leave it as 6 instead and add a comment.  /* Large enough to hold "N-24G" */

>  	char *p;
>  	struct iw_event iwe;
>  	int i, j;
> @@ -59,13 +59,12 @@ static inline char *rtl819x_translate_scan(struct rtllib_device *ieee,
>  	}
>  	/* Add the protocol name */
>  	iwe.cmd = SIOCGIWNAME;
> +	/* Initialise proto_name as an empty string*/

This comment doesn't add any information.  Every kernel developer knows what
memset() does.

> +	memset(proto_name, '\0', sizeof(proto_name));

Normally we would just say 0 instead of '\0'.  The other way to do this would
be to initialize it at the start:

	char proto_name[6] = "";

regards,
dan carpenter

