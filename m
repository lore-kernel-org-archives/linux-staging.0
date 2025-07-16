Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DB429B22C
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 18:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752690109; cv=none; b=KtMGzXJR8akhuSqchmIwHSpwh4kOcyqFVmI7+QpT/EVCxmfO5E78PW8KuTQXe4Oz1GVGL1suUoVR3VHmY5hDjijGMlzG6gZNLVL6da5DjqNgj9Q4NYu9WN9mjeTfuaSss3LYrniQMtp+4QpJ+hDaQRA+x+tPlc6vu6Clh/XfMQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752690109; c=relaxed/simple;
	bh=bSE6/htDCjhVwR/NENeM4sfjDZISV5OmZWcaU5WSJWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lOVyDrjarVvg2jPvWQcSJcgPJvXJSzRrdyCUvusuf82MF8+wgqAq+FaT9J8C5vrmV6XxOcRNo8UnB9Hfxi5FHFF6Ff/oLKFt1shCBYwm8ytVhu3oqadhZsPD2vq8sHb1JJYPq6zyn7yyFZOiVsxU9evl43P3Y/37drDFvyWqJR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jo3mIxaI; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jo3mIxaI"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-73b5350980cso908906a34.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 11:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752690107; x=1753294907; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+I5gJUMV6DaD5nZCZUo7tbib3WO9WKglwCazUnA13Q8=;
        b=Jo3mIxaIM9H3C8Wyt0Gz3JMoXjn8bsp1eTVSyj63sms1hyidCDSuqjB3KiktZRMpur
         lzvRBfcQ9+kXNCBR4Y5Fyriz+2Kja3DkVxBSy/CvzQZSg/Gni+VYyI4pQyReaU+3sNT5
         qUVYgcr045L1ybpyDqyirLb4t1AbqM3nWcGDnuemlF14g9izoYRLAtFPptj6fBYNwu3Q
         CrhGABCLXR1pQJT70cUqsw0fMDlOb/AeaUB0YFEUOCMJ0qtC+Da/GtWDwSbGbr0EPC9b
         5iFOKGXyFjULN2CX+a/MFZOU+wNHRlt3bcqSVq30GG1Bp3umDN4zirX0Ycl33wjh+zq2
         neAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752690107; x=1753294907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+I5gJUMV6DaD5nZCZUo7tbib3WO9WKglwCazUnA13Q8=;
        b=b4uhhNV5pEBAXS8ELo4Eu5l/fjpdbW6y3Rql5oLteg4FppS6XgZNOMALwvSXJD16Vq
         lCnj1kQ1UsBaMVSN1S3sXiJvgzOm0tyh087u2lbb3o+ygx44gWU5Trj/P3amk56JMDcr
         fbOuxzPFAaPagAoG6lBEujG+OZsJHjIwiAH9GLTPEvVXkNyRtLbcWATFvbLgPC8KEO+t
         QozGD5XZac9X2ioaUzZxbXtyKGvgyU9DNH+BOvaCqS5u958bwqTa32v8LBWyz6Bo91d/
         bNOPGwGX0MhgcI6UT8FrwaGw7gf9AfhFq8A32OfYUpzNueOUtk1TyS7bQTtPHIo7qKtJ
         ZnQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDNm/G6WaLThPgLSqKsfxKbGmavCp1x5eW54u0AvJI5yKoYrVCDZhqDUulN4UFq+usugSNGrt3hnjn/C6J@lists.linux.dev
X-Gm-Message-State: AOJu0Yzu2Twz4J22A01J5eUHZI9jcTV5gqo9UqoNe1JQShw4liyyhWDC
	27HvfXbWu0jEXaeLMsJteBjSX3FdLMNGbsAdfl7QVRNFRgrFOCRJJ3QHDshmuwX0ohA=
X-Gm-Gg: ASbGnctrIjurNz9j3a3r1gNa7JJW5ZC1HxwZbkQiQhe4YIbupfYhht/tAcNxmif2KSW
	Fss0keU+mgT5SDGbqbfSoBIa+5ZGYC25K+YPUpoE3MqKkVNm3EyLafLjAFWTKXGwgiTxDh3d1My
	wNYuQ2PTQ4zuW680Lw4nbTv2a6+x0wZm5anyH6+onT2Tr3XMAeLej/cFaK30TP+fpasizcwKuTw
	d13234XUlFY+apMQvuF+/5WzflYUOMUORXOOaNiQy1saQ50qLFPNk8EYHxEWMmIQ5MRJLiXV1g7
	xbjzi/39w7rjiDQ3rZ2em7vwIgFx5CbdLUcd/sevCTS/EzPiRMyhWcR/JMwrAuJSC4Rpcg9xYnl
	Px0/iQzNN/WKXah6t3/E0h4xaZC5A
X-Google-Smtp-Source: AGHT+IEhlTR1gjdZzQg8e3cObaKUeHfTFTkWMXpRkjEp1uVPcyn+zwVpRrjFN9tYQgLGPfOIHTNFDA==
X-Received: by 2002:a05:6830:4511:b0:73a:d3f6:8b22 with SMTP id 46e09a7af769-73e73219eecmr304837a34.11.1752690107122;
        Wed, 16 Jul 2025 11:21:47 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:2564:68a3:7d6:cb7d])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73cf1064f39sm3187859a34.6.2025.07.16.11.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 11:21:46 -0700 (PDT)
Date: Wed, 16 Jul 2025 21:21:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
	andy@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org
Subject: Re: [PATCH 0/3] staging: media: atomisp: More Cleanup on driver
 AtomIsp
Message-ID: <eb7fd8f3-1d6e-421f-b5d9-f9e2d2992da5@suswa.mountain>
References: <20250712191325.132666-1-abdelrahmanfekry375@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250712191325.132666-1-abdelrahmanfekry375@gmail.com>

On Sat, Jul 12, 2025 at 10:13:22PM +0300, Abdelrahman Fekry wrote:
> Continuing the cleanup work that is being done on the AtomIsp driver,
> This series:
> 
> - Process the error inside hmm_init().
> - Unifies the HMM init tracking method.
> - move hmm related function to hmm.c.
> 
> Previously, These patches were sent individualy but they build on
> each other so i resent them as one patch series
> 
> Suggested-by: Hans de Goede <hansg@kernel.org>
> Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>

These seem reasonable enough to me.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

But it would be better if someone could test them as well.

regards,
dan carpenter

