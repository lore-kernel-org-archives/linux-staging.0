Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634409;
	b=sL4vMvaAj5BlEW8w6kkMQmoWsIgN2V0iHMVA1OeCdr8OzOJvxWDrvYFSgq1G0sv8Pct8
	 O4dWEkfudY5+a3hUesLpY8hpZUopt7yH2h7z/Us1XfcoRdG9l14mCV9SPWspoq6n00g2+
	 z9cqpMNnSoU2Qeu/Fx88p6AfEJ5HCbtGeuXrjvHU17TbBU3NHsDiJ8Jj35uF56GAFZIo+
	 c18mxBxYMswbhTzv07IymHWYJwlQ1IbEjKf9rWwXx6MYzXQEq5YbTFMI5VVfpDtjcrSbP
	 MkXnRkQsB2JcBKYUGNooa4RmWhm0HTcerx0WJ/5J+whp45cmwAsStNUjmMhI7K+EoBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634409;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=T18TAp5F6jRaMrl/nS/24uUBMXl4uu1RdHaAtztL58U=;
	b=HVNhaIGQmRRI4YCGAsii0MQqkxt+oaGH6N/16ec3JL39fRAzTSId5wfEb2VHdzXe9aMv
	 mNZiaB3M/Pt0pChjjFZ1DfzNUZkES1eV8GO4V75sJrZbniYiFoZ2eG9rfeenxMz+YzQee
	 LiUC5Yt3hrY8Gf2oMMzs6xrFHCPvrMvbyarZmqBKGpLRjviDjb+ldA/xpkwhKRCRbAexs
	 MaaBhgYgbNzQMudA35mSa+leQi5uz7TpjFkLLdx/b7L351kbFVx4oheAQYz9SNiM9qQn/
	 Lo8pkstSjMcpvmIMrG7qGsJFkElKjHGVs2Wjd853pfJaOW97ebQCd3t7PNkYnvCfahQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rf50v4C+;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4CD606A324
	for <linux-staging@lists.linux.dev>; Mon,  2 Nov 2026 15:46:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C4CD606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rf50v4C+
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e00eee27dso1575384f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Nov 2026 07:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793634407; x=1794239207; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T18TAp5F6jRaMrl/nS/24uUBMXl4uu1RdHaAtztL58U=;
        b=rf50v4C+DFVRdna0+WOVXYgNW5fr2KOqSTQi5mNfp2zMhoZLjGF1YxcAB/IT2OOokk
         c0i0alyFUzyWCFUIomBmCtfJ85TKoVCd/7kk096QnxQ2gyrFAs5N1xdyIj3RfpNRd8lG
         lffYaQjRek3SwKiuuB3Lakg+6YUo29HikJXIUuonpWc4pQXqfeulHchLvJdEzT2O+Q+7
         HcSbXFwGrb5ABTtZ01NYNge6m93LxL7BbUg99YA3L1f/6VFSP0v2w/UYWEA9hQFm5f/C
         jc54FErvlxEPlkiBtqDBfaMyiohE6CTTqrVpZSVD6rjw4Ja5MYFpp8BWQacEo4R2CzMo
         o/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793634407; x=1794239207;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T18TAp5F6jRaMrl/nS/24uUBMXl4uu1RdHaAtztL58U=;
        b=zQOi+A/E491em5xHgznL5J4u99UmGcgu3dYP0cqy10fWepfF3h56WQHjI0DkfB6WAw
         R6vAE0OPLOmOSvS+ZqJLC24A5eKxEBBXZqgSN2jonyYHV9iOzCNuVAbeWQeUNEhiM1Ph
         UYQIV6N4bhP8LeHBzK9PfgRZyvW5uEdrsjMj0/RPEgCtKi1gZNwwnthy5e7NvxgEHefD
         0Ok059FiyCTBz4XpsUxcNekF/MQtOrpg3G0GzRIbMBflLdAfE2YoSNaa82VRxnl6Ehud
         ixTj0jWBe9TwcXWCJwtdPw6QClHVFf0GM4454sh27HnR88I4J/TaCKKHEPV5RV7dEWI0
         MU6w==
X-Forwarded-Encrypted: i=1; AKwUvBxJ+fyVONNv31YPJq6PAbnDuYV0npP5YMkVNJ/VKtkrnd7QT4CWT3thMraz2WyXT0/2zHR+/8w97z5NWM5I@lists.linux.dev
X-Gm-Message-State: APuU4Z9xGBGH/hxB9v8PQrXCJPZrGPh4lKUT1kgT/2I2d89oJX5P1QDq
	ywlqG31GRlRraYH/Vm+iAr3shCQIS7KMDnJec1UYtuzPleh8XRuQGAYN
X-Gm-Gg: AYBFou2ukT2yaR3sIAXgJdTvHamLNvULWqpQ7iBWDruDLYmcyQOtP/unqqf/r6lOGzL
	uzc/AjCHn/RlIZ3MHeqJ+Y658fDtitKzADxLW8DPVBGZNW90cb4f6SJwRx7Zxy6QLZRPzDF3XHf
	iWMHZQwmdKH4rj2qCklwk4s6rkb9x99rbyax98sgrfBYhB9UGIrWIXB5o4GH3pAFgaEdjXeHunR
	vMJvnSlSdo+z3ctCJYxx8qSYb7PiuhOLP//zAU1E4xpMRf2xgEkZI0Xjy4RKYhAC6hPRqZ9Z9dz
	KfK3rkAy1MOeTd0BB01vXYZKnvHvwU2InG2memt9b7eK4PlXlOxt31gBH8q3HSsn+6zQcw7N+b+
	ODCI/yRW+X7jEITI/xeCzkTSZMnQPvecfehL6090aJYpVJD318G42CMbfMJhFWBOsjasg5GyftT
	SKzpAKnsTvV4B8GQhf2wQUDWaNfGjJkIlN/aoU29zZOZciJWJSsfHyq3QAKKZLZOO3y6bSRR9Tz
	b1UfRb4oullxSH0KvRPs+L8VytgHByUWqbPh7BH1p3J9aIpEwomv+ey8xDP18oLpkVZPBN7v3Op
	8hXYSCPwwczdOpUA1+d51tqo9OLD/2e81sH7AO7L4ac0HNhR8YeklXnc2LvAxaFLfG3pSp8zeDR
	5hVjXkhJTy3cD3J1L2RuT5vqwV2i9iDbqhSD+r1Ccc4SbH0nqR+5OhkHhHFOGaInKIw==
X-Received: by 2002:a05:6000:2207:b0:48d:f0e4:27a4 with SMTP id ffacd0b85a97d-48e6e30406fmr21363979f8f.24.1793634407055;
        Mon, 02 Nov 2026 07:46:47 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e7a1d9d71sm14974051f8f.48.2026.11.02.07.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:46:46 -0800 (PST)
Date: Mon, 2 Nov 2026 18:46:43 +0300
From: Dan Carpenter <error27@gmail.com>
To: Kurmapu Sai Devansh Prasad <btech10487.26@bitmesra.ac.in>
Cc: johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: fix string termination in firmware
 sample
Message-ID: <auiwY5ReM-rqeG2I@stanley.mountain>
References: <CAPwSj7XvbTR3qtSev-xEtZeewwvSWFXPhK5F12VGzSiQoNudNg@mail.gmail.com>
 <auihq9nm86d6D3MW@stanley.mountain>
 <CAPwSj7W3HxLeMLHCdjEOQ2pr39tSKD1_VyHwMpq-MshTpaiP2g@mail.gmail.com>
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
In-Reply-To: <CAPwSj7W3HxLeMLHCdjEOQ2pr39tSKD1_VyHwMpq-MshTpaiP2g@mail.gmail.com>

On Mon, Nov 02, 2026 at 08:49:58PM +0530, Kurmapu Sai Devansh Prasad wrote:
> ---
> Hello  Dan, thanks for the advice. I've attached the patch this time to avoid the Gmail formatting issues.
>  I also removed the extra commentary from the commit message.

This is userspace code so the original is fine.

Also you can't send patches as attachments.  There is a whole process
to sending v2 patches.
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/


regards,
dan carpenter

