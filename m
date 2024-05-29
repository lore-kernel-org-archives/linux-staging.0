Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8A215920F
	for <linux-staging@lists.linux.dev>; Wed, 29 May 2024 14:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716993286; cv=none; b=YNgcF/NdS9Ez1kxmTw58yBLd3Okg6fQ5K+RwGCAlgpJJ7LWWDCtWVDX4Gb98xfQB80C3kT15r4c/+uo7fz4xs6djdYhdo4VdQv3sF34ATZrPBh3WHqZ5R4VEIDQtp0bUo+Cu7xg6oHMcOKkFIrDWQLdyrgB2rs66xp5OKsTfKiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716993286; c=relaxed/simple;
	bh=kA7CXxgdm0m1foHK3IR+qoqDJrbO6cKUy0Fh4VXhYZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gcNkBF6cLgQWRnKv/pK4/i5iJj1gFbmIhadtIpVAYy8axehQk9UJLkyK5x7eLa3ojnFi94CfrbcWMTSIj+8TPw4YhnAP0UnfA4/S9wHJwxhZxHvQhekhdTB2s2wZAo6kIAC7ZJAr7y8QoOHVzz9IupWDRCHsJMJcP68OX3mN89w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F8Vv1d4o; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F8Vv1d4o"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a5a89787ea4so231257766b.2
        for <linux-staging@lists.linux.dev>; Wed, 29 May 2024 07:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716993282; x=1717598082; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cd5Jaltzw12rjCKy5wbs74zqw1sF+7oimZgG7BDaEa4=;
        b=F8Vv1d4oqQmbhk/ZMfaDcR1XoHr5DUCLCyw6ECkjDAZdcVNhjINkq1FBE7CcVGh4wP
         mi8hbgv5EUcKkXfNlzt2VRsrDgVb08lkR/eGJ2+fv+9/l3MVKiF+8tCZMHFdeaqeLgdL
         Q9iLc4zZ6ot1FHGzNHu9eG951Ppm7XkDYfKMM9rOK+i4wUXXZKvdN0upAUuJMFvZuzTN
         117iON4jEdPRcvfdt+JhWQOgmQleJCSeliz7pOaZqgXFBRynFrjtjd1m08bJEGeJ0l+Y
         b3ollIdczDTavbDC0seCWJ7uk5GNV7tBi9boSiN4Qn/xIqb0eh4rRCo99p5PgwBTSiGu
         G+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716993282; x=1717598082;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cd5Jaltzw12rjCKy5wbs74zqw1sF+7oimZgG7BDaEa4=;
        b=QFiN69LIkys5UMiOLxwNTS2Z0H/rQTFiP3JbKTqHeFj0T7Z3RMCwN7bmWhzniJRjx0
         PTbQQbvhCLmS7vRw58U0hRq7pVpB3eFl5jYPVoC0mz9B63IO4o4P+SEcLUkdV9+iYi8D
         +qz2r3dg5a/8Ef68OHIwow6pDb1H7uHmrH0pI3r6+n5WYKbCP0Gu+k08Cc6eoSEuqgDI
         tGkGHwfAF4bwoXLw3QPBlg0ktjF80Bk9Yeneb+lb6n60PI7CNQY2IQhxR5XmUPYdR9IO
         +K8RX1KU4CdAGsEj3iWxZHLhxjQEWDcdMCmITnVjufUQN/IywTSq6gLf6LQDvtKV9exx
         WWPg==
X-Forwarded-Encrypted: i=1; AJvYcCXRrpgG6tuJAMqGgVpIVzovqKr/dPqrWsqmodEYNgGOuPt4jeiG4P3OIyQHFMGF8o7n3uEASzxLOQ94zWbK4aWconkleLOGjOJRwtWwQw==
X-Gm-Message-State: AOJu0Yx9SlLRG0zRNNJUKiu7sm1DDoEweBtHilCZUYw5VxMwp65JrqDu
	euPNMV8WqwsIQMvYFQqujj8ZICXhVEWOCKKZOpp6WKVXfuqHlibtzkVHS8JIsf8=
X-Google-Smtp-Source: AGHT+IHzDIOEvIZTdtVtvHtAQQImy8QQq+8Ht/4nvi42XIhMSlQyREMA7uCbQ/iCpAaEW85rsjw9JA==
X-Received: by 2002:a17:906:abd0:b0:a5a:896f:9be0 with SMTP id a640c23a62f3a-a62642eb70bmr1169713166b.27.1716993281816;
        Wed, 29 May 2024 07:34:41 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a64255dc8cesm83208466b.186.2024.05.29.07.34.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 07:34:41 -0700 (PDT)
Date: Wed, 29 May 2024 17:34:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: linux@treblig.org
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: iio: adt7316: remove unused struct
 'adt7316_limit_regs'
Message-ID: <d9a3c974-8a13-43f8-a0d1-0e55f6e1f3ef@moroto.mountain>
References: <20240528233008.191403-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528233008.191403-1-linux@treblig.org>

On Wed, May 29, 2024 at 12:30:08AM +0100, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> 'adt7316_limit_regs' has never been used since the original
> commit 35f6b6b86ede ("staging: iio: new ADT7316/7/8 and ADT7516/7/9
> driver").
> 
> The comment above it is a copy-and-paste from a different struct.
> 
> Remove both the struct and the comment.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/staging/iio/addac/adt7316.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/staging/iio/addac/adt7316.c b/drivers/staging/iio/addac/adt7316.c
> index 79467f056a05..23d036d2802c 100644
> --- a/drivers/staging/iio/addac/adt7316.c
> +++ b/drivers/staging/iio/addac/adt7316.c
> @@ -209,14 +209,6 @@ struct adt7316_chip_info {
>  #define ADT7316_TEMP_AIN_INT_MASK	\
>  	(ADT7316_TEMP_INT_MASK)
>  
> -/*
> - * struct adt7316_chip_info - chip specific information
> - */
> -
> -struct adt7316_limit_regs {
> -	u16	data_high;
> -	u16	data_low;
> -};
>  

Could you delete the blank line as well?  Otherwise we have two blank
lines in a row and checkpatch will complain.

regards,
dan carpenter


