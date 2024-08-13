Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA98199EA7
	for <linux-staging@lists.linux.dev>; Tue, 13 Aug 2024 12:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723553691; cv=none; b=FQCv9lnJWdbAy09IxljRqb6Of9eQFTW+4KYsTrvMuVSPGhk5Cu3SYF+dhpcXIl3Jc7BPqmjBQUX4ydUOGjSw3pRKyOx11XUQzWaVXv1iPBCY5tb1tsjd8Spxg2Nuv8WNgae8OTHO7EgVq0NuwgsZDo3Rv7oj2Xa3U6DExPs7wQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723553691; c=relaxed/simple;
	bh=/vyVB/+nwmZ1GDlSWG7aG0xf8jhLGjT5JZbFrxI7vkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZoCt2FPQrnRA28XD/eWerE5uqGfXkYTkyF6cZQzfinX9bgZIp8JOVioSE8sIUu3KHJlp1DNfu6vNXgbQ0YD3wTwQeFkUmNOPDzX1VLNibtHpWnw42ur6bpcAMZAj0BRIBEH/L4BbYu1oWMuRn/7YX4McoeFZmRDcGloD0AEJieQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OW4Uy1QY; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OW4Uy1QY"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f136e23229so58020221fa.1
        for <linux-staging@lists.linux.dev>; Tue, 13 Aug 2024 05:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723553687; x=1724158487; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rFn/YBZy/HMj2dJ8dhDDDJeYokUl+M8JMlUEy7TbTsM=;
        b=OW4Uy1QYZ9myHgUBUlBZpPK1o1cJZXugmB00ny49GAAR1maMvSySwX1fWutXpKheRQ
         8OYhmOqxZdgb2kghEc1hMoGXbZMVIytwse88C3Yur9QAtbws3jaQu2PhbfLCrm0du00z
         DKO4X8gzTTqlas3jUuw/VD6Rd8y5boIghApC/HuPxg1v0DeCnTpGne7RUiPBmqm0X0+z
         ynOMADciO4XFsf6eMCBlDP7x24dvaJFeTrHs/AOuAZqUaopBMtxksdbXNjz1ILmX6cOk
         7AaILLrmpshG7yPhKpuLZQGl4e7GoBWbX0coe0LjPtR0VFFlTGQ11/FJ4WJm9rQcsGIB
         pNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723553687; x=1724158487;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rFn/YBZy/HMj2dJ8dhDDDJeYokUl+M8JMlUEy7TbTsM=;
        b=by7ReTAAa5i/BVUMeiOdM08CF/jbJtLT/J2Nc6KjRkKC7rtvyhkLAAn36esCMiqKVp
         TkF+Sqo7ymPvsULdBZSHbyHRrESkeu0Vepv4z5dT9dYUlAqrteb+5lmGC7nJp4KhYRKZ
         wQJR2Tn5b6Le2anW6KOXIooK8bVnKRRYZ3d4ADmhlgoTP/xcKM8flhR2y4hS9EQZMBdE
         pxuee61cnmigKpAeAB526Si3egEYt4ddbO1aQXksUGKZvlFB8d0JG7ncRq+WgI81ok71
         ef0UZom6m813/HaAYyD4PAHyed1QU9TSxeCbRjkJmlZ9tbxkZWrkiG/cI8t57QDOmDbS
         5L9Q==
X-Forwarded-Encrypted: i=1; AJvYcCX5rdveA9yi4idYc24kdwBeT/++PsiGJYZxRs0KXLtuFpEUsNEqw6iVa+2D9Xfq9NmkSBlo7Fzw+jmznsrEt1ESV0TE7OdnmlQD9EGfUA==
X-Gm-Message-State: AOJu0Yxmo2JBBIDnUJwlLL78ohTdYg6rc+FvqSL8f8AFtGea33aRtAwS
	lPjuu+iOxkKpJQe5HMHKMphbdUCMbZeL19wNoXjRn7sBG+P+q+BvzFvELp9dKew=
X-Google-Smtp-Source: AGHT+IEj1tS6vskS9s6AZSAVh7F+6G+pdl5MLE3yLVM4Q4OffllLaX+wtCu/Ob7rMwxPxtFvgC7Lcg==
X-Received: by 2002:a05:6512:acd:b0:52c:896f:930d with SMTP id 2adb3069b0e04-53213692a83mr2039446e87.57.1723553687085;
        Tue, 13 Aug 2024 05:54:47 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f411bb7bsm67969866b.133.2024.08.13.05.54.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 05:54:46 -0700 (PDT)
Date: Tue, 13 Aug 2024 15:54:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/6] media: ar0521: Refactor ar0521_power_off()
Message-ID: <ce0ed949-5e57-4193-8190-9e4aa9cb62be@stanley.mountain>
References: <20240813-smatch-clock-v1-0-664c84295b1c@chromium.org>
 <20240813-smatch-clock-v1-1-664c84295b1c@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813-smatch-clock-v1-1-664c84295b1c@chromium.org>

On Tue, Aug 13, 2024 at 12:13:48PM +0000, Ricardo Ribalda wrote:
> Factor out all the power off logic, except the clk_disable_unprepare(),
> to a new function __ar0521_power_off().
> 
> This allows ar0521_power_on() to explicitly clean-out the clock during
> the error-path.
> 
> The following smatch warning is fixed:
> drivers/media/i2c/ar0521.c:912 ar0521_power_on() warn: 'sensor->extclk' from clk_prepare_enable() not released on lines: 912.
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---

It's better to just ignore false positives...  The problem here is that
Smatch can't track that to_ar0521_dev(dev_get_drvdata(dev))->sensor is the same
as sensor.  What I could do is say that "this frees *something* unknown" so
let's silence the warning."

The problem is that check_unwind.c is not very granular.  It just marks things
as allocated and freed.  I could make it more granular so the free and the
alloc have to match.  Or we could match based on the type.  This frees a
"struct ar0521_dev" so mark all those as freed in the caller.

>  drivers/media/i2c/ar0521.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ar0521.c b/drivers/media/i2c/ar0521.c
> index 09331cf95c62..2c528db31ba6 100644
> --- a/drivers/media/i2c/ar0521.c
> +++ b/drivers/media/i2c/ar0521.c
> @@ -835,7 +835,7 @@ static const struct initial_reg {
>  	     be(0x0707)), /* 3F44: couple k factor 2 */
>  };
>  
> -static int ar0521_power_off(struct device *dev)
> +static void __ar0521_power_off(struct device *dev)
>  {
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>  	struct ar0521_dev *sensor = to_ar0521_dev(sd);
> @@ -850,6 +850,16 @@ static int ar0521_power_off(struct device *dev)
>  		if (sensor->supplies[i])
>  			regulator_disable(sensor->supplies[i]);
>  	}
> +}
> +
> +static int ar0521_power_off(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct ar0521_dev *sensor = to_ar0521_dev(sd);
> +
> +	clk_disable_unprepare(sensor->extclk);
> +	__ar0521_power_off(dev);

You had intended to remove the clk_disable_unprepare() from __ar0521_power_off()
but forgot so these are double unprepares.

regards,
dan carpenter

> +
>  	return 0;
>  }
>  
> @@ -908,7 +918,8 @@ static int ar0521_power_on(struct device *dev)
>  
>  	return 0;
>  off:
> -	ar0521_power_off(dev);
> +	clk_disable_unprepare(sensor->extclk);
> +	__ar0521_power_off(dev);
>  	return ret;
>  }
>  
> 
> -- 
> 2.46.0.76.ge559c4bf1a-goog
> 
