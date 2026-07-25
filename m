Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D0F39CD01
	for <linux-staging@lists.linux.dev>; Sat, 25 Jul 2026 09:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784971341; cv=none; b=BiI/tVP1hOhUxGzbcntoDPsGvdQrE8uZlEHPdS46wLMKRGL+gqapcdziHXW9m394osFfFkc6HOdLLzyjWhzT4hF60rud7v6LaPbz0qBVIGiKWYnNMTo5bjDGG3+Zdtj+knVGMLPopFsucWb1+0w+zfMbfgF0o3oCuFiEwJRE+Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784971341; c=relaxed/simple;
	bh=vLtnKlLR558kkLw4Vnro/1D4DLDqf/ycb8bYPU3aI0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jvYoCuk+3guHI1ZEA4b/HEcL4rxjimknrT/1f5N6xlqMhRO+0G02jOxdKAcF6n9dxH5/mSCNfwZIEOuzZmXmEt5LMcma/5+5H1Hpm+5uoAWEtQY7GlZD71cVhlmLMKaUksgnkbpek3DGKx5hRaOvZPk2IlLGWTLqT8GowiYegHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IXBVEr8s; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IXBVEr8s"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38dc69c74b8so1106952a91.0
        for <linux-staging@lists.linux.dev>; Sat, 25 Jul 2026 02:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784971340; x=1785576140; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sTuqPKFq7mh1Y2qEAeGPo3pQ2Q0OiViZEunk17weov8=;
        b=IXBVEr8sSsCQK1/xs3IBr81IESBmZLCR6TqngYzQn4Bj4ky90THNFvDGO7v4V42YPi
         1WSIlwgrKtPiMannHbUnyWjUQov1SOfBnvRSWwXjbq7slBsdM0MeS1Jg39cK7QE6dSL+
         H1tWeR7iSYV0IB4jvX+cKuk0AAX9RnInT/DQhxrnnXnHaeM6z2KlddU/BoT8vbQ6Nrc3
         2Sn/FpqKsLc99wqlD995re1iXkvivv3MFO0HfnsQkmDKNwjoRyw6l0RMTmJGWvIwE8SM
         VNYVFsGBGjMJbRAzIIeB2TIVyK64Xo7Gtxj41FE3TuGAgzBh8z2jYk/2B6RN4FAYKNcg
         b5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784971340; x=1785576140;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sTuqPKFq7mh1Y2qEAeGPo3pQ2Q0OiViZEunk17weov8=;
        b=ISKzGvP/Zs+bJEZiefWLyEmT3gepu9PV386wFxYPCNYLNvFoXLFuTHpQUryjH6iUJr
         X21Nm5u6E9pgZtmCaHxQfRv+Dhdk5PmrRMWU1u5KWXLT3wGAT1iCowEzYyMNMqbYzdt5
         vANZL2sRoAd4Ti0conymYKL5diituypoadngFGZP+X+gdAZvL7hnaf/zCV02lkiOnnOr
         9joeCi0133NEr/Ec6hypfUgdXJYhrGydLywJqVCa2SGHe/uSED4tdtcTtV4yB0z66IHT
         dPvLydhd3KicTNFbfJmSVGMo9sSmRa0WQ/uloyfsB9DHFSkVrIWshjr2QnzIOzfedf7+
         vyYg==
X-Forwarded-Encrypted: i=1; AHgh+Roi2w8pHr20DwjWSAhEfIwFPKljltFmPz1ST14V036KjZ8D5y+mEDDi8cqwskIAekiB9duQsb6y5Y7Up/0q@lists.linux.dev
X-Gm-Message-State: AOJu0YwGb+TUKh3ZMcDX79IYkh38vVa9rM4hqN8RL1EQyWKIfzeujSw7
	EkOEC6oA6dcKqBvybuQ+hhQGCvqDLTsnM4g2gaJAGMWOurAdFHihLlEt
X-Gm-Gg: AR+sD10JLn2Q9kOs4eBzVW6j17PHLw4izUV3ivCet5b2ogW7BqgJD8/hFIQuO3VKe1q
	AfqCQSVHUIYO3io6HWyJHusgWInCWeYBapsxLBHHvsuh9yxvwUHcUqOC+JXeapkotKZkEyu7e/o
	mNsc/ngSKNfd/ScdalzDlMrs6iK3cv+0S3eIjUhA9vgHWL7FLX110HblUvDoxdrGl8OxhlWuDFq
	a303DvhlQu+OiM46AeErOGwx/93F4mq91qXF1r+wzcTmZ+c5YxkxfQTNMPpTvt4luyUDRJ2rD8s
	nLr5jJlQFKwq2OP5Hze1XvgDL8Tu8/PsGefWAPdkx81Z/ZMfSwYx5yfOd5KN9GIrSn/NrpkyzQ+
	jGm2mvS1Y2LFEX90/ONh1o6oziH9IdZjeaDugvHlXVj+p8wgrKmPJ6dqLzjCjZ6FVu+j3Ih6CHe
	p3vJPOei4=
X-Received: by 2002:a17:90b:398d:b0:38f:18f9:785 with SMTP id 98e67ed59e1d1-38f293a17b6mr1913634a91.8.1784971339675;
        Sat, 25 Jul 2026 02:22:19 -0700 (PDT)
Received: from localhost ([172.216.252.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f08df8a94sm1249949a91.2.2026.07.25.02.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 02:22:18 -0700 (PDT)
Date: Sat, 25 Jul 2026 12:22:12 +0300
From: Dan Carpenter <error27@gmail.com>
To: Mohit Mishra <mishraloopmohit@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] staging: sm750fb: Remove dead VALIDATION_CHIP
 preprocessor blocks
Message-ID: <amSARNiX3UpPVY-w@stanley.mountain>
References: <20260725090750.113598-1-mishraloopmohit@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260725090750.113598-1-mishraloopmohit@gmail.com>

On Sat, Jul 25, 2026 at 02:37:48PM +0530, Mohit Mishra wrote:
> The macro VALIDATION_CHIP is not defined anywhere in the kernel source
> tree. Hence, '#ifdef VALIDATION_CHIP' blocks are dead code, and '#ifndef
> VALIDATION_CHIP' blocks are always active.
> 
> Remove the dead conditional blocks, keeping only the active paths, and
> clean up the unused macro definitions.
> 
> This addresses the first task in the drivers/staging/sm750fb/TODO list:
> "- refine the code and remove unused code".
> 
> Signed-off-by: Mohit Mishra <mishraloopmohit@gmail.com>
> ---

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

