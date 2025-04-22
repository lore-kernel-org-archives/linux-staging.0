Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CE81E0DEB
	for <linux-staging@lists.linux.dev>; Tue, 22 Apr 2025 10:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745316156; cv=none; b=nXE30+rCifoehmjnkA/EW6sUv54ap61WRocmJTkQUQIVov8/lJtFgWzML2Mi8TH4bixLzDkAwEThJWU7UtTIt093j/wyhaWawq/Bs+xpDcNf03M2lhqfPsScc9hMuVLqPF9DjGYhuDWQCLn59vTdQZ+G2ezHlohf1GnVybJbkh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745316156; c=relaxed/simple;
	bh=r6si7KxlGkOoATAg7ilVznuwbtqgYzdFtBjWKcTszJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ATExfEQXOivOiaDohoxUIPisQtkemzZn3c4HBZuBNc/tdsZpuIHdkD98adkypEVdc1zVInRHtfIHtUivBLJB+HwKzVVy+mm8uwauah00PU8PN+96mv0EbXKkK+HCb54KwSzwE2dq5UCN+KVdbudP0DV4qCvxix5Tf2v4/WLwEjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GdAjKkPQ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GdAjKkPQ"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39129fc51f8so4227894f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 22 Apr 2025 03:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745316152; x=1745920952; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2lwX66HK8eTxAxJezuea/KRjoMND3umFRpU7IdR4G0w=;
        b=GdAjKkPQgqupQvxaTjW81HW0jwj3H7jcQ1kc0AVgNGVOMksLTFHENcxXK/dRGG7SBm
         K+phE6sTyDXCUfm7eOyskc0Me6oWoDT7MwiWXiSFIXX7KD07E+Cz5O7NRCXM+wc91zdL
         I5Mu/0NX1OB/Y5W8OwRxp8TVa9841K4sYtbFzVFPMus7Bp5aNPLb3hBLiTKEg2xeIFZo
         TX7LMQmhgauqPaCQEtU4Bw6kDD+Ys5gIqP5JSRUIdudTj8N8AghA9aNFs9bh7w18hJKT
         50494Jhqle2jdBb18b+F00NN+U4D43Wf37hSs1d094wOeLyl30DptqDCuJM5Za7n4oVP
         k+iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745316152; x=1745920952;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2lwX66HK8eTxAxJezuea/KRjoMND3umFRpU7IdR4G0w=;
        b=SjtE2yeXrUICEv+oPK2SHv/p0vsE13ZTACC5ztkw4NJl+oD+8EPUWYMoBFHg2g/x/P
         b/vedEOmtIubdmSravGhf1vB3ukKGYyDGvN5dWsBICakik6v0BupuGj4AIhN7yIimSzg
         CIVq40DDmSK8yG4k7YxqnuVFpA9a2BYhey7499nevW1yUiUVV/IO8b0y6bmXHZUnxevD
         VOanDz8QsvM3XnUj2T9XlbEJkm3RkUkftSjKj4zIZqBHqJnL9SGuNiS0VWDBWervjJxv
         uEA2cij9xVFswKtT7IFx6/rX23dcon/gPaP1HcijKQCX6wSIRoDd9iqTt7AGui0gZOBV
         eEgg==
X-Forwarded-Encrypted: i=1; AJvYcCWuYy/M8OYzugaK9dfLTNdmY6iqrtHxUxKGb5fbyyKxsNeOEHOVpBij5OPOi8BtCv5rB5S00OdFwy+qu+m5@lists.linux.dev
X-Gm-Message-State: AOJu0YxuXQD3aAuVImcpQNvHMYFLkg0k07DPv8sTBropmIPtsak2S7a1
	JAiujkDrn35wJp5Bzh7PwX9Bvl6TeMWHqyoTd1UGt7rVPHossryfL6MLToJ/JgQ=
X-Gm-Gg: ASbGncu11UG4a6OA03Q9NyylZWfh8/k9Q4HO4+hQsGduzmCxxTbLL8cjOaPHLeiLYON
	hXN+mopv9IGZXF/tANr85o2MLMmJbxVCXIAaicxss4BK8nq31jMJfIM4lBRNaPBpa9VVgvqWQgY
	Jej51hqMzeeD6yVjZvLjo9C8a1zpV3KzISWCnnAECSvcxKNWwwau606I9CO9/9IaiJT3q3zu/q8
	mbvTGj0TAlHefRVrkSR6zOeA8VglMnmSfGgoszdACzpTStMU4G30zexOFeO89Cal4AfDAef4qRT
	R9HycnRb+tQS3KWxthHD1EX0Hw9oxoXU3va/tC8qANayGA==
X-Google-Smtp-Source: AGHT+IF1ZkfPi2gJ652NKkarwIY/ypcd5ApofOa/AQ+PxbuhRTF4pbWiSN2ZlQ7ALpKKQfQcvtNEOA==
X-Received: by 2002:a5d:5f8a:0:b0:391:2bcc:11f2 with SMTP id ffacd0b85a97d-39efba2c924mr10978756f8f.1.1745316152148;
        Tue, 22 Apr 2025 03:02:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4406d5acec8sm165056665e9.16.2025.04.22.03.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 03:02:31 -0700 (PDT)
Date: Tue, 22 Apr 2025 13:02:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, Michael.Hennerich@analog.com,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] staging: iio: ad5933: Correct settling cycles
 encoding per datasheet
Message-ID: <ce0c0684-2f5e-4e23-824e-8bcad56e6b0c@stanley.mountain>
References: <20250420003000.842747-1-gshahrouzi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250420003000.842747-1-gshahrouzi@gmail.com>

On Sat, Apr 19, 2025 at 08:30:00PM -0400, Gabriel Shahrouzi wrote:
> Implement the settling cycles encoding as specified in the AD5933
> datasheet, Table 13 ("Number of Settling Times Cycles Register"). The
> previous logic did not correctly translate the user-requested effective
> cycle count into the required 9-bit base + 2-bit multiplier format
> (D10..D0) for values exceeding 511.
> 
> Clamp the user input for out_altvoltage0_settling_cycles to the
> maximum effective value of 2044 cycles (511 * 4x multiplier).
> 
> Fixes: f94aa354d676 ("iio: impedance-analyzer: New driver for AD5933/4 Impedance Converter, Network Analyzer")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gabriel Shahrouzi <gshahrouzi@gmail.com>
> ---
> Changes in v3:
> 	- Only include fix (remove refactoring which will be its own
> 	  separate patch).
> Changes in v2:
>         - Fix spacing in comment around '+'.
>         - Define mask and values for settling cycle multipliers.
> ---
>  drivers/staging/iio/impedance-analyzer/ad5933.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/staging/iio/impedance-analyzer/ad5933.c
> index d5544fc2fe989..f8fcc10ea8150 100644
> --- a/drivers/staging/iio/impedance-analyzer/ad5933.c
> +++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
> @@ -411,7 +411,7 @@ static ssize_t ad5933_store(struct device *dev,
>  		ret = ad5933_cmd(st, 0);
>  		break;
>  	case AD5933_OUT_SETTLING_CYCLES:
> -		val = clamp(val, (u16)0, (u16)0x7FF);
> +		val = clamp(val, (u16)0, (u16)0x7FC);

We have a fancy clamp() define now so the ugly casts are no longer
required.

regards,
dan carpenter

