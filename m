Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAE82EA749
	for <linux-staging@lists.linux.dev>; Mon, 24 Nov 2025 08:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763971722; cv=none; b=Zf+XvxiK0QVLL/qjhTJeMg/+z1tDnZoCbuU1BXy/MNaX/4g6lH/Y8h6vrFI1X1pxMZ6ITyiKB0fFQ5lzsQgqJcD7oLMuOMzrLgJVEfWSHszHnmuV6CL79Fu1dAM31QcumSeWKjH7mUE99jNalc2UMNppBIG+2PN/jT4pyp4spTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763971722; c=relaxed/simple;
	bh=Im77mryU7VUmttutMqwJrxYTuGiD46RxauoaARTENDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hejqD/R72cBrOw4/ckPPNSE3QOPw8dz8b4KlNVmSuh84vPds4vuz+X+ZxAEBpajC1YxCY4gVOyuGadmtGOYnI3tJ6wpXbwxtCvD5QF+XqbU0pDUqHWm+2O5EbTHfiys/5DwbUcCMlxvWXIQrXSy18iykO2RXXQaM+Yf6afKA4SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eSt3Dd0b; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eSt3Dd0b"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-42b2dc17965so3867336f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 24 Nov 2025 00:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763971719; x=1764576519; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1bYpGSEP1f0o4pmboA4QBRCWseRS1Ggtj4d/5mRHK9M=;
        b=eSt3Dd0b5bt29o9HzZ4sCAjj6Plx45Wdl/lg7K1RaGP8c3k+PXHmXyVpp3ahR25ota
         DJJYTJI3i3oMJjvlCcXiZ1xOMhZ4q8Ba6dzJJU3Jm6KZsK3o3zMIjpgIxtp+gOeWQRv+
         Y9fBeRD6D3JQ0F4vcdMhvaDRoLsXuDGbktvXkVym/jtvrylWKI8ekAoTA7eRvGZoffVT
         vaECcJFxT8Cukjgj9P3Kz4G9cPwwB8Ms4xr/Lo3ZytfD8Ij5BaUjC6zgy2UsWgIwYg3y
         elPWd1klQu53jqBgPGfeI1KLE0x053UG5yI7r8zAoZJ5IBJXptas8QL1+IvO4xjYhFau
         2AGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763971719; x=1764576519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1bYpGSEP1f0o4pmboA4QBRCWseRS1Ggtj4d/5mRHK9M=;
        b=LiIu0zaOARn+nHVuOYG/R7ZpQWViX5ewhsosVQVErMFMeUs9iQ87Ftiw5ngbZocVJ6
         K/FWwkGwWIqcIKQ8pykevyXrmQboSeTOrR3kLLJ3o2/9JbdhK1cxklwYIs9GaC78vVUV
         dSuSB3ihQryP8s1dgfuMVCtC24Zv61JbzsWlGrXF7wdW8Dsw2W8gieoHjt+SYV8D7nMa
         7fFqpMHJ8UTVI+BbrgxYsIUo7vvrEfa9OMHJLJxyyEHHE629q8BygfzCOBSBunNtQDVD
         h+rHlDf4Qj6+MmsZv1PRqn+Q8L2AE2sd+Xh7lpSmaEI3uMod0CiV+BBto6oQma/q2EDF
         bh4w==
X-Forwarded-Encrypted: i=1; AJvYcCXg0x6/6LvpZ6GZ5BC+Vu5mKvVaZz//Rar1ttCxiRl/K2ZByusxMdpZYAIzXivpmAbx4G5b1cErxGwiytCt@lists.linux.dev
X-Gm-Message-State: AOJu0YxCjwkA3T8IjzywpLYz9/Fm8NQLCcLdQ40jUiHjzfjRLITCqzDQ
	ODHo7v5B46o0YQVbOYntgzaj9ZO0C6CWDXVfnqs1pd9A4ZEjgt1h+zP7CXyGk5wI4aYNBhmnSaa
	e5h50
X-Gm-Gg: ASbGncsxg2KJsMDsafH/A00GD/jA1uiW0GPWvEcCW/nbCnfEn4A9YFHuFNjTWGeEqFq
	/cl4z6Pmmy3mnohd/EdaQM5TTcQTHeDYpY5WHOb2/7reGIqjQN+jrzIhZfeFKTso6jqGyIlAmk0
	P8qWHzoZDzJFvGUfjM9uWhEV63vhFTY+BdeEFs8S7QHvLiZ5gaVpDrXEI7/zEAWlJDsNGGuHk3O
	jX1qk3wCfxG9tXn6QLpw+WOjYWqBsfc/qJn0o2UjCR5skBLZ4nX4LTqo27uPW4XWjw5zvP61SXw
	qp6pSFVDhFTeZt1QJ7nYDg1jXbQYugolRN929KYtcte/InmFJi0VEQptpz8Ni4SK19GS/mKXU1f
	LRaXDHtLXrjBCno1t/4oPoz6jcX1J0MSxdSkNwgE/URObjkP6BgEAJGy7RvrhLrtkIJ873jW2TY
	wf4Hopwux9TANwHgKl
X-Google-Smtp-Source: AGHT+IHSFHz49v0WryO/nI4mAehBYzC0d20V6jCCnGCpQk78qJcnCmmXv7HckVQLKSyH39HGGXciNw==
X-Received: by 2002:a05:6000:2411:b0:42b:3a84:1ee1 with SMTP id ffacd0b85a97d-42cc1cbd1f6mr10744412f8f.18.1763971719156;
        Mon, 24 Nov 2025 00:08:39 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42cb7fb8ff3sm28319422f8f.29.2025.11.24.00.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 00:08:38 -0800 (PST)
Date: Mon, 24 Nov 2025 11:08:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Navaneeth K <knavaneeth786@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] staging: rtl8723bs: replace FIELD_OFFSET usage with
 offsetof
Message-ID: <aSQSg91zk2zCQ8xE@stanley.mountain>
References: <20251122174555.215109-1-knavaneeth786@gmail.com>
 <20251122174555.215109-3-knavaneeth786@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122174555.215109-3-knavaneeth786@gmail.com>

On Sat, Nov 22, 2025 at 05:45:52PM +0000, Navaneeth K wrote:
> Replace usage of the custom FIELD_OFFSET macro with the standard
> offsetof() macro in drv_types.h. This improves code readability and
> standardization.
> 
> Signed-off-by: Navaneeth K <knavaneeth786@gmail.com>
> ---
>  drivers/staging/rtl8723bs/include/drv_types.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
> index dd9018aa4ee5..47cabf8707f6 100644
> --- a/drivers/staging/rtl8723bs/include/drv_types.h
> +++ b/drivers/staging/rtl8723bs/include/drv_types.h
> @@ -173,9 +173,9 @@ struct registry_priv {
>  
>  
>  /* For registry parameters */
> -#define RGTRY_OFT(field) ((u32)FIELD_OFFSET(struct registry_priv, field))
> +#define RGTRY_OFT(field) ((u32)offsetof(struct registry_priv, field))

These casts to u32 are bogus garbage.  Delete them.

regards,
dan carpenter


