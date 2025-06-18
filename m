Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20118191F91
	for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 20:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750278729; cv=none; b=dQkH3aQHhC1HIALj7WuDcR0mwjyGrn4Hz966ETDgO7cXDXjggnnsuS/B48/5U+kiMeDpMKAb0a3h88tM4tXfQhpD9f45ssgMoxTe33AgcV50U5w44ms6usIBqxQSo+rX2txFaTPMDF5OYFZg+yuwtnX9ybos3Ecac+3JZmrVvFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750278729; c=relaxed/simple;
	bh=KKil6mB1inJvRsPNxuS73RDHrSQiovHayZ3B4QHqHJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fMDfTdecBwsLGynfNP1Y3I8Q0KKkjmNgpNVJs/S7OammJfZFJvYdPUTxq7eDT2gFY/SqWCYCL7CX9loEM00PTXeJY0M0osx3nbX/7jO0t1DWV0RvinQbfYbW8RLsLZtr765IYMDcydX0shi3V0FvehJquNi13XukssijoTF3xsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S3VUjwCx; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S3VUjwCx"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-40a4bf1ebb7so31839b6e.0
        for <linux-staging@lists.linux.dev>; Wed, 18 Jun 2025 13:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750278727; x=1750883527; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i7F5LbEOE2TliZOiivov6fQ8KwW3D9N8KkGHlHMLzOc=;
        b=S3VUjwCxiX2TMeLgo0L4dJZs8Bl2xLK96IMd2PrdJL675Fr1Kh6MG29AGKyK3DDVO2
         TFJ369K/LEbU0FX0TvOJ48unge//nkL4RKxpoZcM7qZJLOffftljqvLZs7G5VrPWecSM
         rZSxpygRdB2qvQ3ftUsyvJS9Qsjbc6HQIRzFGC3jAV48TcIMetBRIwxBGD6HOyrFnb5/
         mGmBC4/q8SGmeCXjvJlc5ATa4bBx+bToZep5055vSd2SO7kYhoj/qkErs6osfSK/8GPe
         oQ7U6nzx6/ix8HYhKJvb8wNnrkLtUkL4cNFi2hF63rPZMvchxvb1djKMpgi9eZhFF7nE
         2Y4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750278727; x=1750883527;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i7F5LbEOE2TliZOiivov6fQ8KwW3D9N8KkGHlHMLzOc=;
        b=ca2e4lViSxCJFk92TqlbCS//f6WNWpsa9w1HXp+dcR5+/HpRcPkUqqRZyTWTAHeGt7
         Ri3+s1JYzEyHG9ytELcdG0kan18URY0z5d/cx1jpfu/r0Km4VmUNGA9Zm04ylWx3nj8c
         IkkB+g6V2IbRAxs+NQ32qs6Va2MZY4pgIGHmB1HVCD7tuSanfJwQK6ZiRrcNzi2G7wSz
         7p4DYHBps+kcWse86n1dFIXE/ShkglJbyY4599Ln9RZ192L9Dnoe6yvPSd4ZGKzzqbDs
         50BeQYhyy2TcttKiAZGtwrtZgkNQtH70uWrZa5TEM/+ddTZpMdlvwq1tW9Ajgexk/2Am
         ocNw==
X-Forwarded-Encrypted: i=1; AJvYcCXtN+jpOfrpUkJYK5exw+lXDNcmviHVNZ++AcyMnCqtVhdb8KSgzzoyk+dnZDcDdQTZagBA3Wrzcexfnml9@lists.linux.dev
X-Gm-Message-State: AOJu0Yxu3jYVPTd+Il6OjgYDj+ptmmQiQWn87yUIzNSxMsBZGkyWQ+tc
	pBJXL8DEm+wv1bdRA9tmjka1Sbz8e/39WbGKDIrCh8GlxPENjd9A7d3iZwxTgi+R16s=
X-Gm-Gg: ASbGncveDlwC+MTUKpvR9d1nDE8/Mp5ko2Hl6hi1kBzuD2t1MjGri9yzlhDE3wXppSN
	lhJ17tcqxYAtl4BPNQwn0Eq9MN5+sDmcWxlGifMEQ6oE9KGwJsDESL6OdoBNCw9HvxF3RH8RLXV
	5vnVldH8H+5GCK/SbpP2l56iNl2GJmz9pMEUr25sPCQuUpykZjtpp9ylG7v41ih5/NV92JgNq9n
	td7nZqtNXkzLSBt4uHa9lGw7LJG42m0Ou77bYhM4XtxWPW3mkg+HfkNBuSoAgvLf+tmCWMVRK6b
	BMnutD/vqHyN7Rzbx/JndCLmixY/UU+8RklLhXBUZ2CgTbcxsNFuL0VNWs1UrYwMeFxiCA==
X-Google-Smtp-Source: AGHT+IFo8Z7V83YupZPSM3vubxz2Lq3pVlw4KiSrALtxHNSGiA1WTsEH9DXaaQA234FKxa9g/hTS0g==
X-Received: by 2002:a05:6808:f07:b0:404:d6a3:225b with SMTP id 5614622812f47-40a7c275c7amr13438618b6e.34.1750278727008;
        Wed, 18 Jun 2025 13:32:07 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1b3b:c162:aefa:da1b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a740b2e75sm2512409b6e.2.2025.06.18.13.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 13:32:06 -0700 (PDT)
Date: Wed, 18 Jun 2025 23:32:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Andreatta <thomasandreatta2000@gmail.com>
Cc: hansg@kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 1/5] Staging: media: atomisp: i2c: hardcoded function name
Message-ID: <23e0a3f5-cc4a-4791-ba9a-f578ce0ba11e@suswa.mountain>
References: <20250615231143.1558392-1-thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250615231143.1558392-1-thomas.andreatta2000@gmail.com>

On Mon, Jun 16, 2025 at 01:11:39AM +0200, Thomas Andreatta wrote:
> Checkpatch fix: use func instead of hardcoded function name
> 
> Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>
> ---
>  drivers/staging/media/atomisp/i2c/atomisp-gc0310.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> index d35394f1ddbb..f57f2b70909a 100644
> --- a/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> +++ b/drivers/staging/media/atomisp/i2c/atomisp-gc0310.c
> @@ -584,7 +584,7 @@ static void gc0310_remove(struct i2c_client *client)
>  	struct v4l2_subdev *sd = i2c_get_clientdata(client);
>  	struct gc0310_device *dev = to_gc0310_sensor(sd);
>  
> -	dev_dbg(&client->dev, "gc0310_remove...\n");
> +	dev_dbg(&client->dev, "%s...\n", __func__);

This printk just prints when a function is called.  You can get
the same information from ftrace already so the printk is useless.
Just delete it.

regards,
dan carpenter

