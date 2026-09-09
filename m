Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029A658494F
	for <linux-staging@lists.linux.dev>; Wed,  9 Sep 2026 14:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965921; cv=none; b=ork5ZLy03fvHSnLtcGhTnxOShtf2ldPzyc49alLkbQbMNrckcIqbthSpwRfWws+gKZFrDaMBeC35ABWLTg02gBEtjpcCHkT1V2th+3OJfLlNM7cw6jJfus3g4q3zfLjVM1SUDXP+XoICGIx36wcmvgafluDAijUSArVhxjNQ3bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965921; c=relaxed/simple;
	bh=OG8rM47+wQa5telCcXnv0ivoaCzuHrNel/g8JAXQwo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Upu1MT1gVI2Bu2lTbCZwnqAIQ8FtX+Rm51uNqjLUBi1WnQdScasiLr9XT7BvwQuASgbJ9aOqSxWxXOYKHNd6+wDXSRA7RPYo4Mtfh3CP67gA4AovpnPdmxVSYTqHjCKIMms8Iu1NSYoD/L/P3Y+g3Xka18rDSgf7u2tXAyZHuwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NmCSlE+i; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmCSlE+i"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso4168935e9.2
        for <linux-staging@lists.linux.dev>; Wed, 09 Sep 2026 07:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788965917; x=1789570717; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OG8rM47+wQa5telCcXnv0ivoaCzuHrNel/g8JAXQwo0=;
        b=NmCSlE+iUPuvM9P50kovd7I5asigg3YZwJZNGCAHGj1/1+Mxcw0JMVCo0VEkqlyv0z
         Z2PhRvXr43KaIH44vqZEzrU3QDz7PIvoG4jOJ/fNAGHjIoHMVUZJeVCMNQXRhEq7/STE
         XJ3ZI8E+BxkSogTqE1HjJS9AP6caTfqFI0Ox1nJzSUYbqILc/ngX7rPtNQVG1bCdhptO
         usyAM7wfhem7O8e4M1lgHDo3gt7GP983L623CuZhKAp6wa+vp/mAS/90RujftSfheSZ3
         gIrR+U5/TOfet8v0S6FgEKGcjTXJVQHINm6j3oSk6oGC7OwN9q+AAc5mupwULav45dTN
         EGwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965917; x=1789570717;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OG8rM47+wQa5telCcXnv0ivoaCzuHrNel/g8JAXQwo0=;
        b=r0vJnY4kFmyPQ5b+HAdjIG5T4xEmfniSZS6pCeOxdcEDTDUfFYrpzwaNNja16M3kv/
         N6wvvIEG71qbbnOt8b3r592FoCAdWfxz47NczOftaamkugsUaaTIcG/ZIttdhd1DMwWz
         Owd3paFZqbrieiPs8zOjapv3Vks1VY4KMHjUtQ8XAXmjA0KMuRxcAmKYl3vRmTZyhwvs
         L+0xwdhOCuN4aTutv7l4XsIMcAxXhh+GaI0BBTvcwW8WvXw9R7UA0jmljwvTtUII0Tkc
         RQUSjtCM+Y42arDFiPXtvVRsE3lx/FvK4cuBlyKOIxxNVRM8MXTF0xLyDyP2bnwpsQ1I
         T7GQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRX67/64yua7waKGW2lcG4f22/CSgxJ3sHbiuQ3cEncpWiXTk3HO+9vfINeZDB6oL5HKRDl+t+UytVcjfo@lists.linux.dev
X-Gm-Message-State: AFuF++mx/VwywYZLnMpXN9i484agrExtp8XLChtfRVCcIUkxIC9T26r+
	IClPWuhk2AkxJDZXztJvHLb7z9vxFXn9FffVZZjAmJ974AL9Nx7hJQ4y
X-Gm-Gg: AYBFou1xQHurGCQgB34979JbsiVqVMCn/QICbzZ1ZP6KScP8S5mkgNoItcxKXdTckR+
	q90SKTMBVdLjZFqLVi1GRezlsyM14f1XzrXd0Yk3qrJZpfvm+mYbZ2yjmEZOTZbRcH7GDJiXopv
	v6aXXRE6u+eLgP9t9vE8uOaT+zw/mHkBea7k/WenIIqE9luQnQo/LxuzbWLDxAeRnSdnfd84El9
	Nch2LB4WyV9PzNldWLKEb8BIwb6zELo5nnGl4yiCtwPOtn1SFRvQL6CPFovcqAZYuQdTivHMAsg
	rFsvRVETPfF03iCfeEiJ/uL2ALKTR2QWJEdI6ay/A+VU13RERZ3XYR5by2Fy8qmfklU4CXXK7I/
	BXcAaOEhMKBc2vZVBN89juyEF1IrEWQ6rDzM0w8i/EN6DfajZ+E5TSt3fD9NDi8RHPu4I3XIj4I
	VEZcXqliE4pq5JmrBgcsp5tS3Psqg1MmL5bmrfJOTRCuxwUUjgBxPIs3nivy4sYU0ONIOC+AENO
	/bQPQ==
X-Received: by 2002:a05:600c:8b88:b0:49c:f512:2361 with SMTP id 5b1f17b1804b1-49d2593842emr34218375e9.14.1788965916931;
        Wed, 09 Sep 2026 07:58:36 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d00a5b19dsm423987255e9.2.2026.09.09.07.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:58:36 -0700 (PDT)
Date: Wed, 9 Sep 2026 17:58:32 +0300
From: Dan Carpenter <error27@gmail.com>
To: Breno Rodrigues Alves <breno3011alves@gmail.com>
Cc: gregkh@linuxfoundation.org, torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org, arnd@arndb.de,
	linux-clk@vger.kernel.org, linux-input@vger.kernel.org,
	linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org
Subject: Re: [PATCH v9 1/3] interconnect: mediatek: fix Makefile typo for
 mt8196
Message-ID: <aqF0GLDB5a-P-uvq@stanley.mountain>
References: <20260905130925.7115-1-breno3011alves@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905130925.7115-1-breno3011alves@gmail.com>

What changed between versions?

staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

