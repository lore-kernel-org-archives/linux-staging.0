Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86609214802
	for <linux-staging@lists.linux.dev>; Thu,  9 Jan 2025 07:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736408623; cv=none; b=US4iSZGzP0QEBRHhhZ9fmBJS1PYb4PITV6Fw4dmfYPi08J+VAYeBGd8PqXKORIi395Hkumc421FcyQPVjZovVwoIpb3Dlca6XGLQHkA3SKoP57pXOZWTVrYJ9IA8NacixUYYdmny4D5gN62AdMjmtCCw3lL7OcnDC849p20euM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736408623; c=relaxed/simple;
	bh=o8I4CKv2t24jZedmnbTtU4Gs3sA5LsC+rd6Kogi6hbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Er2YQ7fx9bJWKSImTbWFhlZS8LBRWb1BnILCJlPAaIxzSv+fBfgOX7su+9azOAM8x4Ac6y3APEr9Bv5uztHGlxzuJhhh+YhyIALpJBM0BKNyjOZu8z2+FGquQ9c8zLhPlBEGybZzBrzRHdS3XBISza4OrjUKsTWYn4N3MNiffMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sRZzYt/A; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sRZzYt/A"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436a03197b2so4298235e9.2
        for <linux-staging@lists.linux.dev>; Wed, 08 Jan 2025 23:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736408620; x=1737013420; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jh+wwxjIWe7Gi85zIpTYnZ3FRcd2JxnVHEsCva5iTpU=;
        b=sRZzYt/Ax0EBYlZaNPRI4zgypitxhNwMGZ+MPQAWK48v8xblnesG6eRZkqrhA7T4A9
         8HBuDRr9UyRBqFJBzmybVpXBLcdWda+faV6A20iglOeFK14U2fEb6YvkZkitX5jEuCaQ
         NfDDvdxf4KZQWJ7ysyWhM/av9eufQBhuJMOJWTOD/ugqCermxIyj6weFSHQmkS83T+WI
         DJFBuXl0JZe40l381kwAWLOSrrbe5v5kV2ZCmzPww1dPo0pNZ5YfErnpUGeqvKoTKXIi
         Pnjladw6dV1awYQW0A+HyeVDgJmh2DvwhJEkb0ZfVjOcXw1y5qxccvvug6+PTqpDWnkd
         Wf8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736408620; x=1737013420;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jh+wwxjIWe7Gi85zIpTYnZ3FRcd2JxnVHEsCva5iTpU=;
        b=ZeEUf/ujcMg6j0YXrknqEDKWVlB+EJw1fox2BA9pyjzB8Vhs2iRj1NkIt8N7eVcbK+
         GXmeEFqcYMUolM3tT9pUPAKg4NDwLkNo34+gfO2aZ9vNI8CZhXvW+9mK40yBgWcqs1y7
         gfcIm9kLat7nTW/oSMOaCICbp2sy39n9PM1Nhu9jKB5SYkyMbqK6kkYVbb/XSLRg9DKw
         lklbPbbiqyx9JLC4KO+qG4rzDAvyhAMdmiE3M1UbWUa1vi1RossLV/6eNU/n+yOhXZ5y
         m/VONrQJy0MBG6bQwOzCKc85/N6MNkz3+OyeWpgLmxEnDhwlb/Tm4ciFyxH+kENcZAzx
         luBA==
X-Forwarded-Encrypted: i=1; AJvYcCVMZrRiJllBhEg7JeWQnasP/ZFqy8GwO3PI2ybMHs7Jxd6nX/Bxy/S++3CWFUr6h7jABIaqoy39PFTohM8+@lists.linux.dev
X-Gm-Message-State: AOJu0YzbsXowsUlkZ76IdYJT+yokqkMPUqaPUng7/FnYAMADQ9o0Ahq+
	7OYOYmr2K0gCCfnISyLOVgNHDBn8jdshQ0YbtVri8GxXcOj5pW26vzIJerRIEFSb53MEOd8uwXJ
	f
X-Gm-Gg: ASbGnctbAc0mgW3XCxsF6/83yATym6cpPja+Hh2T2rXjVGYEBBD0bP5HsiwJL4F55u8
	n4gim1+EWIpA6+U7gSgzmfOGMjyU5NgKTfr0rlgUsR1AZV8f6zxdUYmTFEliE1SXP2O+g5LSxGG
	GldT3h0JDCQ8+F4TfdIxVrQFYTrZWQiY0pMwemlN/AO+4sX8o8vMrPAaD2vOHadnLUvhfXVZead
	SuHRpLbSsbx+8rdFKHpjFv6iIZM6BoKJZA61eKERsZURpTMqrDTqSHYinIzww==
X-Google-Smtp-Source: AGHT+IG9Emr+GDLnC8gqqwHA+S34356wIMM4OfWPXphI8Xzji2jA9fchokaaaeT7GvxQmyRqyXJn3w==
X-Received: by 2002:adf:9b99:0:b0:38a:6929:ff9e with SMTP id ffacd0b85a97d-38a872d2bbemr3513005f8f.7.1736408619837;
        Wed, 08 Jan 2025 23:43:39 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38c7aesm1036006f8f.53.2025.01.08.23.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 23:43:38 -0800 (PST)
Date: Thu, 9 Jan 2025 10:43:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sandeep Salwan <salwansandeep5@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: gpib: Remove commented-out line entirely (v2)
Message-ID: <d17e78a2-ad49-42da-a0d4-56c2f28baee4@stanley.mountain>
References: <20250108211127.13963-1-salwansandeep5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250108211127.13963-1-salwansandeep5@gmail.com>

On Wed, Jan 08, 2025 at 04:11:27PM -0500, Sandeep Salwan wrote:
> Per Greg’s feedback, remove the line instead of leaving it as a comment.
> It's not needed for debugging, so let's delete it completely. Thanks.

This isn't how we typically write commit messages.  Instead say:
This code has some debug code which is commented out.  Delete it.

> 
> Signed-off-by: Sandeep Salwan <salwansandeep5@gmail.com>

There is a specific formula for v2 patches:
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

> ---
>  drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
> index 3cd01613d067..7ba968e24add 100644
> --- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
> +++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
> @@ -31,10 +31,6 @@ int agilent_82350b_accel_read(gpib_board_t *board, uint8_t *buffer, size_t lengt
>  	int i, num_fifo_bytes;
>  	//hardware doesn't support checking for end-of-string character when using fifo
>  	if (tms_priv->eos_flags & REOS) {
> -		/*
> -		 * pr_info("ag-rd: using tms9914 read for REOS %x EOS %x\n",tms_priv->eos_flags,
> -		 * tms_priv->eos);
> -		 */
>  		return tms9914_read(board, tms_priv, buffer, length, end, bytes_read);
>  	}

Now that you have deleted the commented out code, the curly braces need
to be deleted as well.  You don't need to mention this in the commit
message.  It is obvious and assumed.

Please send a v3 of this patch.

regards,
dan carpenter

