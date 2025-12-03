Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3FC429D26B
	for <linux-staging@lists.linux.dev>; Wed,  3 Dec 2025 09:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764753195; cv=none; b=oyLm2JO9YGJ8I5SbsLqeoWWsI4Yz0bK1a5N1PNMQhMQM2mTOyyBda373XYQrqzPfKt3CIcTqjYOpyxRr4LZANJ8Elj7zeeTd8eyLm67kOymXVoZmVq3EgnWdMs+51t0u25QPADavS74pjR6qIgDBBvReu5GlZYObviV34iYww1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764753195; c=relaxed/simple;
	bh=SiNFiW2v1jXP/bwvy/RWPopt2GmMLcv2p4jZbIoMrDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n5k9tCTHbs7DR/IyqVVFC8fsXDm6Wny8HYdV6NN3v1vaNp1I//gnyzHJcZckZsaWXQAwust776jZbQO82OGDZ4nC0vUMq9HeV2/tO11wM3IIabk0ETRuew3fjQHOizcQlWXn6MBTBdPzVdbC0Z3uJvxBpsZobdeJh/xzgt06Xfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EM0UNO6z; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EM0UNO6z"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-477ba2c1ca2so73822555e9.2
        for <linux-staging@lists.linux.dev>; Wed, 03 Dec 2025 01:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764753192; x=1765357992; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s1M9E8Fj2AnVlDJvuBANJENV4iXZAUBcbLia3tZSce4=;
        b=EM0UNO6zfn3dpbTTJhzLKL35zNpAqWUa0s11gsUCKyOT1D6ykqnvRofKDgK6nSo0v/
         52qEurePnOV+T+QwhNM4yJ/wtoFIVb6/KzJR9Y08rp2N6R0TGlTsrBGUEE2aRDPTHeiF
         cpn6sNZDx3IS9zuGtTXxOqF+oZcdLnl1notYb0zGiDxLbSlKRk5pylcvinxFJiBiyZnB
         fouw4EhFm1YTRqGwu2vL/CG+TmsYYhfKpzL5KjL0e9SO1J93l394XSgo84PmwJTmnQ4c
         7mdO0xu7/y43cKAxv46roLC1P91PeUOBE+bXYEIxWng+ED1KW8tMIHc0BDEtBmHafRcn
         mU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764753192; x=1765357992;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s1M9E8Fj2AnVlDJvuBANJENV4iXZAUBcbLia3tZSce4=;
        b=gpIBtoxgMk3RfScnA5E0inGh564Oq3lokb6UP6xkaf3zFCpT9VIMU8dg4g2Wp00ApI
         z6H40o1uycPhVXQw60vfvq7ZCn+fdh5CBq8TZqRoeifI6XlSrd47PmWURp2zxUYSH9V6
         nIZh1dO155mtr/hqZymgfv24lNNbQ6Eohp+eXdaBhBlbp1Ua2fiW7JlBEedWX6MU04iY
         EZcgrO5ZK+vi7cgxcgbuUWSvUqjPFIiWwQR9Q9te1eeZ+gE0K1YaZC2q2gsAywxcGEb/
         mMRj27IFHpLWBvZesFLVefIqKCRlmoPkwCRiaD8HYhOe6JkRZ4k1Hdr8CfWsBmrKWmzt
         37aQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6JvVL3SFImtHoNKOjFwsJoHwL/ri/dBQPPH6+6BCdkJyMPDEjNVCDj89z5wF9EfhiEtSZX2OJcvVBut83@lists.linux.dev
X-Gm-Message-State: AOJu0YyZ4S1ywW4eWN2iI1RBdWfKMF+eLU83saL6ChLUBCHGsSZW/ltu
	TexGG6gh1ILYka3Kc+Tigsm8jJflcLVchc6SMnfBSO4gVx1rZnBsGF2NsREo2syjqB0=
X-Gm-Gg: ASbGnctV3J8bgRNGa13EfTE7FHgYUQGlGYfHU3ak4Tl9HR630NMIW16tnnYxpl3eGPd
	yiTa9+7hsd0nHKXtXfmTZOgnc5039zOob+ou+etmROQn1aH+OgjEFIW5UBi35Nwa097NBVBC8x1
	GkXiEIR4Xoo2nVPN3GDKCZEHmzIK5fwvtd1BTsQjFtLWavG3P0LPzwc7lkQ3PJDzRMQydPrjAY4
	aJqrPrx141ToLgdtgIJVHo5Ar8PMOZsneK8SISxru4L+64pEtg8Cm2+TKxZ1a8GeGtQa5x9/87/
	YZatygN9afaG2KS2pWW+Ctxs5XnKybn5aWY8KAs9mZsBExQ2oCMuDZ4YZC+T8BfiL7mG9BdD9OV
	r0Y3bveDOHQ8YujrLZ3gawZ3uSV17y3+qgJVcqGqFFLlARTMeq7ujSiSDDvF61HrN962CjPU5bz
	IP0oIMM+8z11pNSA0m
X-Google-Smtp-Source: AGHT+IE85OeWdP5ivkN2P0Ni8Ax4Hx2IsJ9YAVj4fDjQwtGKBtijAK82rh20nw0nra8KvWjQFzctqQ==
X-Received: by 2002:a05:600c:46d2:b0:46e:3d41:6001 with SMTP id 5b1f17b1804b1-4792af49649mr13247645e9.34.1764753192099;
        Wed, 03 Dec 2025 01:13:12 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4792a79761bsm38261005e9.2.2025.12.03.01.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 01:13:11 -0800 (PST)
Date: Wed, 3 Dec 2025 12:13:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pavan Kumar Yalagada <pavankumaryalagada@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	gregkh@linuxfoundation.org,
	laurent.pinchart+renesas@ideasonboard.com,
	hverkuil+cisco@kernel.org, linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v5] staging: most: video: prevent probes during component
 exit
Message-ID: <aS__I0Mbt4CFbZs5@stanley.mountain>
References: <20251203083411.7072-1-pavankumaryalagada@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251203083411.7072-1-pavankumaryalagada@gmail.com>

On Wed, Dec 03, 2025 at 03:34:11AM -0500, Pavan Kumar Yalagada wrote:
> When comp_exit() runs, comp_probe_channel() could still add new devices
> to video_devices, creating a race and potentially leaving the list in
> an inconsistent state.
> 
> This patch prevents new devices from being added while exiting by:
> 
> - comp_probe_channel() checks comp_exiting before modifying video_devices.
> 
> 	if (comp_exiting) {
> 		spin_unlock_irq(&list_lock);
> 		ret = -BUSY;
> 		goto err_unreg;
> 	}
> 
> This ensures that all partially created resources are properly freed
> and no new channels are allowed while the driver is being unloaded.
> 
> Signed-off-by: Pavan Kumar Yalagada <pavankumaryalagada@gmail.com>

There we go.  Well done.  :)

Reviewed-by:  Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

