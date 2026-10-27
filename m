Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793079633;
	b=WgTGCHffx4C6sdAyz73pr3iyTFsc0T6xLDNCcZdnWZ3nHd3iVM07Bu3PfAxXPBjS+JFc
	 p1mUdesReXEqc36fEuVpl0xQ4MnoQrcudG9or/KYql3h9caA5iq/l4Gz4a5I4drtGPP1V
	 XxHajB/rkomOh2oDECjED+6KMHTQsln6afs+7M8BLzl+WU5u8r7LYbBXnbTn7prNdd1WE
	 tNDnzN8sKdoz0CO1HGWM0s+bXeYF1Hqow5Bi6rwUWvdJxraiEVVmMq1Bza5YleI9qTTG8
	 ja+mGXP5olMJc7nPD+ic9Dgm9m40Ga4aUrmdELgBZTDkUgWlQUXJuUfj6cMimc18U4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793079633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=7MtvTda9c8jDrNpv0a5ikKu9DGEM1JaWO2UAKaYBnKY=;
	b=mbfZdYymM9rm+Gs5bqKc+4/zFD6B/tNCHnf+FBAwvqL9PLIAEx8MS8bRjxzzGIR5yCtf
	 Cf+sykpJR0U5TZjAaJmLMGwZAJqaVknN6vvx+Zv1qje7xFNHihuxUjUvTXswnw3KoCo3+
	 Q17H4bPSWokjBxg7Cc6z6jcjkRPXxDWIJZ7pMX0gRE1SVqfxrnLsdPhKf6TNFD/gvMMVY
	 TmG+KAsOB4mS5VGg8aFgQFJYMkQYbdTzSyQppOLwJoeHmOizT5wwPHYOcLIwi9VwfH7jD
	 TWKK8+NGFJSEsUxNBQtvbDxDEggtgYZtIumnYzh3U3siLYHrqR2CgRGCgNx+5FXbX1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Qo8j625K;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3531606A31D
	for <linux-staging@lists.linux.dev>; Tue, 27 Oct 2026 05:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3531606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Qo8j625K
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e09aa5264so2025430f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 22:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793079631; x=1793684431; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7MtvTda9c8jDrNpv0a5ikKu9DGEM1JaWO2UAKaYBnKY=;
        b=Qo8j625KI33VP6F6pSqL1gYv/GXFDFvaBy5P+OBuE8k+4rKeI5bJqlYxh5EaBtVauH
         OE6647B0cS+neCBBcamAp+9BWctq8XraYBvaU4pu1g/IJjzbwqpAoxoA4FxczQDSCulv
         GJxtbKCKSHU7pRwCrsaFNSsw0GVhYGQntQ/hbrWos/EX9jXff0UJtO77xHu/VNa7RwAj
         iqY9470f6IcVheZVZ+qFWOPhDADgACT5l6kZQXMl0RfELnx8S1qrLt2D/puD/1mKATUg
         lj7AfochRWM0M4US5Mu8jxnmMuWy3GjCyaiwCVnGkWxFI33QBsJQ/0Phx4IkX6kJ8V5f
         P4Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793079631; x=1793684431;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7MtvTda9c8jDrNpv0a5ikKu9DGEM1JaWO2UAKaYBnKY=;
        b=hWdXbCcuDFEIlrA948HJgm3QVMNmn+jMzYTDnQ3c7JD+KQ347q6YAE+zd3GItzBNin
         PJNuC+ou1FdBDMKW+aCBBn6lkdNOAcEWM4gf9++oalKs2O8NnbNjDPDRcJDSsqn1vSon
         yPuNLNi3HmnwD6GW3R7erzf7sC0Y2GP/fcN6K+Eq91EFv1i7I9TEtHQxX8AkGZdzau4t
         pgyglxcsTknUWUYaYXnqijn/NRVJ50LzH2y+qbotJDrs47O3H+5U0HbjFs6rphWfTNbG
         B6PsofrG0aVVdBeRJbI3rW+PG68VUYqD9RlVd9X1Guq9Qc0Q+vZeTsrOq6HWIsTP4Ug1
         2PSg==
X-Forwarded-Encrypted: i=1; AKwUvBz8X4iWJKAF7p/ljKOgNO+zzgyVLWGPYYJPhjXRGYDRTBEKYArN978fW2vImEh7tWHMkGD/jEXbJRQwk2d3@lists.linux.dev
X-Gm-Message-State: AFq9FYLOmMwYfD7PTVBopc+IfEAHKHwGOYOX7J/i8TNY5kT/N+f9Mdai
	bNdZp3x4JA5SHQj/rTskTddcWFPXGRRK1WNzfkxSr++KHPF0Z7URO9Bc
X-Gm-Gg: AYBFou3B9pcWiXU7Nw8v1UkTTBw3pF5fD5y/91MQE/CQqQaSPjQ5yljaNTjfqVMvQhG
	JO3CjGQADPLXQRUX5NmhqaBcWwYaz/MVA9Mn3ZXBRDsCneUEEgOyIH2QMG8ay2cDLl1v9hb595x
	VcReUT+8TCAK3CJDStinv3V20A5rK0Vpxq/JKq5a/amISC+qbMkeHwi88ocSDeAV/0bqaQGYWvA
	D/uxEN3gZXWu7L0KZqv74Q2S7i3pE/CyzbYuK9/BG3e4mUTmet06L6uwA3R6xh1PU91lkYYsV0h
	D9kkZ8scs+pQ1xWvHcf1Tp1eK/F8uhlaiYpalNb49DpU2tlzE4texNgqGrz9mztEoF/qG5SMy6P
	+J7WCNf1YjXAnhBl9bbHPxQZNl3ubo/BMb1Xz0kohOYBbSKPHm4Twn0j/J/7EkF+lxxSr2yX3Rq
	kuPoWWPeekZrQGBXq/tHE56vLPXwOHhpTsqcotphI6NaszEeXv2HYpcLiPQxqwg1FACF1apOYfo
	llVE4mZTZWcmDU0DkvCNuYT+HteYZcr5vJ3Sr3czIgDOktILXvw
X-Received: by 2002:a05:6000:2c05:b0:48a:f8fb:cd49 with SMTP id ffacd0b85a97d-48e3eb88590mr17346250f8f.22.1793079631109;
        Mon, 26 Oct 2026 22:40:31 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd3418sm18500026f8f.41.2026.10.26.22.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 22:40:30 -0700 (PDT)
Date: Tue, 27 Oct 2026 08:40:26 +0300
From: Dan Carpenter <error27@gmail.com>
To: Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>
Cc: dan.carpenter@linaro.org, hansg@kernel.org, mchehab@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: atomisp: Fix memory leak in
 atomisp_alloc_dis_coef_buf
Message-ID: <auA5SoRV1MDwHrw8@stanley.mountain>
References: <20261026175840.13979-1-sifat.yt.2.0c@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026175840.13979-1-sifat.yt.2.0c@gmail.com>

On Mon, Oct 26, 2026 at 05:58:39PM +0000, Abdullah Mohammd Sifat wrote:
> Free the allocated dvs2_coeff memory if ia_css_dvs2_statistics_allocate
> 
> fails to prevent a memory leak in the error path.

Extra blank line is strange.

> 
> Signed-off-by: Abdullah Mohammd Sifat <sifat.yt.2.0c@gmail.com>
> ---

See my comments to the other thread.  This is a false positive.

regards,
dan carpenter

