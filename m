Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F1501A2562
	for <linux-staging@lists.linux.dev>; Wed, 20 Nov 2024 11:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732101655; cv=none; b=UkCZ/pWXfv63iUIxJdd3Uu3SowCgqUy/Q2XVLZ3l0NYCMkHrmffh8hHi2pbmSXaqt5jGuPEwy/U9c1HEKW/ctydhaEApDNe71L9d0QV1bpC+8fE67pMtZyQT/AiebSkHzTUBYf7g6PG0metpjP3G0mFogOKDyrpeLaw7feQ5DG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732101655; c=relaxed/simple;
	bh=l7G39Ni/WM+NIaPXJqS6inv2T6BnJhhqnj0CHz9jRB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UGiYl1C4IJXCQ91K8UStNCPlsBgCgbn2JkWhPwN1hkzUKfgCH32rOY1zn4/YjPJwX4z5Erju00gRRPW93uGLDePKY9opqp+Vwz2qzCjAMFGI7q5f0DoqeSMegZXWb3twaHHHIRycIIa+e0rd6WnZ14KrRKdqpssriwXQOWqw2Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZhCl3TAK; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZhCl3TAK"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43163667f0eso37683055e9.0
        for <linux-staging@lists.linux.dev>; Wed, 20 Nov 2024 03:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732101653; x=1732706453; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DH68XPkDBDr2SFdw3UbWf74PCLjCq+oTGZBI03sAE6E=;
        b=ZhCl3TAKl8ndLGjmCz4kywcKFFV+csmXK26Ex2Vi+I2yro7yn6gEmtyA8Yjn6glMxN
         Nl6CtqLDzAY607hJyPZUNpm5ahW7Vnkm+nCmemHBMYQtWOvrmJCdqSNS6ScX93rXIq/n
         bH/FuQKbomggdFpfRJQ4h+5zqclU7KH93TbsQw9VP46PkyySJcp2NZ9XvKf3iB1vD2kW
         gTvqbj6cd0e7j9dZNt+C6qV8s96/Qmfp8CghXKYivNsMLBdQXqjTwSRwWgAY1HfrA9EQ
         bcfonEGdcLhHVG3YdlwIqTJ5xfd1Vwy2lRHPSixBV8tqd91c6TYecoyfB50AHtXs5YQJ
         8iZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732101653; x=1732706453;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DH68XPkDBDr2SFdw3UbWf74PCLjCq+oTGZBI03sAE6E=;
        b=fF7bbSL/ezfSKKo/EbqsY0EBBoGZu/mdhvi/LHrTLIhMFp2c3mJfgztHJ0bAmYMwCl
         uEaJnjGrBGgEkiabgrklG2w7aNFtRyM/vNeLRLyNDLpHKjmoNTCaAm2q+QCHcg8y2Mz6
         pqSNk2//MGB0uV1if7zAj5EbdbZzrxwn3/uB+Zndoa2avYm2tuKZj0slZ06KeJ9MnZ1l
         m8PmzG5HFSrY29SrmthRNJSdArO7RdFpwJbgGGfisT15V1tAK+RD82PFRFsxuhB3rNei
         8umgs8NTsUCAb861AY6W6VFiyVZan5+W3y0p+79J/01l+rB4j/upWVcvQ3C77W14yzve
         eIcg==
X-Forwarded-Encrypted: i=1; AJvYcCVpmhRWnRFuObR17OcRdKshZ12Llo6qEG7MxxNxzIaHSyjr2ZzGdoLOQqf21HXs/JcqSentFy20R9hknruf@lists.linux.dev
X-Gm-Message-State: AOJu0Yzo/GxduWcbWqcBy2S4NLOtW5Ia9ZRnpCAmYB+RCggdXpjplbEK
	HtanMV2GK82ju0nbTdzXcWuwp2AU27vAAwxiRuLQjLK0ymZgV+km9QmDejF5fYk=
X-Google-Smtp-Source: AGHT+IFoW0aGrY44f798dMADxQS0s2HP8FnMFtMgd/GYwO11/AYw3oJvuDLaWXWp9ideXtqi2/lvsQ==
X-Received: by 2002:a05:600c:5250:b0:431:4f29:9542 with SMTP id 5b1f17b1804b1-433489970efmr19437515e9.6.1732101652707;
        Wed, 20 Nov 2024 03:20:52 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825493ea20sm1778948f8f.93.2024.11.20.03.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 03:20:52 -0800 (PST)
Date: Wed, 20 Nov 2024 14:20:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Paolo Perego <pperego@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>,
	Jani Nikula <jani.nikula@intel.com>,
	Riyan Dhiman <riyandhiman14@gmail.com>
Subject: Re: [PATCH 1/1] Remove hard-coded strings by using the helper
 functions str_true_false()
Message-ID: <4c8f5e95-6d33-49bc-8af3-e6dec2dc7c62@stanley.mountain>
References: <20241120093020.6409-1-pperego@suse.de>
 <20241120093020.6409-2-pperego@suse.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120093020.6409-2-pperego@suse.de>

On Wed, Nov 20, 2024 at 10:30:20AM +0100, Paolo Perego wrote:
> Signed-off-by: Paolo Perego <pperego@suse.de>

You need to have a subsystem prefix in the subject.  The subject is probably too
long as well.  You need to have a commit message.

Otherwise, fine.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

