Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DE2D41D12C
	for <linux-staging@lists.linux.dev>; Fri, 14 Aug 2026 07:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786693396; cv=none; b=FyxxutF4bG7CtwWDtJTbf3RewNge5vWfFdWYBE82tdY6mGBXm4L5E5bzuvg4niZWQeBVIZmdTIiw+Af6XN2oR1RZ617fndEK2lHkvpM8/p02PXQXR07bnAsVGmeTO/OWPMReq+YNlA6ZbjOpRrzhI0jt6vs78gEgWbfWAPENpGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786693396; c=relaxed/simple;
	bh=LY6wGybHY87wN/sEHx1ZWlnOgi42U2OkAX47+zw0baM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hbbJoRh0Z8azNX6a36roEbnPeyb8NiUGz7lbquo73MSRsHKjPgH604vWyCqhNCn8P8OMJ656a9nGJeTo14ZAUON0wEc5S8QsUmib6rjmI6rGIBOjLFR5iMw2W+cBNBIYl+oSKWlZp+3sMviXcUJB8+A21znAR0dw3A4/9I5eM54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pNFmOqmu; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pNFmOqmu"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4798bea72f9so414199f8f.1
        for <linux-staging@lists.linux.dev>; Fri, 14 Aug 2026 00:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786693384; x=1787298184; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y8vjAWe5WEpjLI973Es38xQAbA8Y/MTMFx2xNaDbwjw=;
        b=pNFmOqmunsZQ86IZ0dGPK/Q3F+CQItz3UxcjebF0kdwb8oRL2pe5UmQQDkxX2ChvLu
         qlRMRfOl6TBKPXHrh/EFR9EyGYRFnIqGNKmlwM/RMuQdKOSbKnITEhlNly0AoM5woIsz
         GXuTrb27I6jx+GRyE1HerF/7GKsR0lGLIhaVvDXCzqtsjaVuf++vl3y817Pb0BsFBkCc
         jpBhp37/5doiOKdYnUNufXHRWTY40JzsyWbDEsdJtMHVPbN+6dq4MVVpFL9ZuzRdRUjj
         Usii/kO3SzsMY2IEHfd6CqmnBgCdfHetBihdvGT5P+LAQ1pO4KZgvsnd0vjwhykb6kNk
         MVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786693384; x=1787298184;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y8vjAWe5WEpjLI973Es38xQAbA8Y/MTMFx2xNaDbwjw=;
        b=WXtyQ5NUsU6sRIKUmJOfxSC/nrkOKBaqx9Xu4G2a5G7x0ZnDy9HZISy9UI37m7sfvV
         bI4KBnpnB6DzmH3Y6zhts09s8GOql0jpq+AVG+MkK5J6SlpWVmFj4+9Dpze7AgRxxNRF
         0dLwuCj0UU9q4zXioiB5sdlUSnSe18p3wIHbyNq/0HdqqOLaWIr514dZYIZzhZZ/QY6Z
         2bx8/vH8AqD3qnub9MP2XU8jespYDcktJdlI5dF5dvVR/hCr+GE8biUXCP+E8Y6uB2Ci
         uCTrh+cnL2fKqca+wNyer+uuFDxqPGG3bqor6F4H76gzL68nWsPrQYzkaod1ligz6DKw
         SQtQ==
X-Forwarded-Encrypted: i=1; AHgh+RohYPaaPISap4K6giP2utV8YEUU6+7TdxtG2kgFMM+UDZW4s7/TUbvz2zzq1tImnE4o2pyf2ccrctleZ1dT@lists.linux.dev
X-Gm-Message-State: AOJu0Yz60CNC1EqOcGVgWtGdTnNONyKjtL4pJ27R9lwI1Kdjw6iXCqan
	5l1BWoeSwCaCEZDc2W7N6WXcu/Q6mkimhl4KFhX+/p+5109j6N3J13dv
X-Gm-Gg: AR+sD10Q4Za8ON5+fpdTJGQb/i+4PeMEdi5ukhpVfconm/6K3z6IpI+HvKsNS+CVr/Z
	Bw7W2oYWMhjvCgNSVgGa6yXuqD/nRsUXjrhChR4tHqXhV9IBm9ykUTXsH74e334LAPuRKGxWrJ6
	jCiNlGg/SKS0Pv+5YZvSM0bLbojHTZCkcC1snIVZUYmTEi2stS5bl0PP1yzg6wcjIE7PRWKg/ZU
	50+fGMD2kAPnTxhygN9+V4nlfJ23GPVGaGBV6joAnsNFa87aOzqTbKHf5+Ydb0+eDy10YB3HHnR
	PJczN9SM2+vyM4xrRhN576PN3TBnq4Ys8np5Q80fXnnm+TyGw3xtRniqAB7gm3PRgMioPoSvSoT
	4bqZGj6J8ywMzWktWFbS5WXhkwUy5EoH1wj2qmROZRMuzTA1Fxs1zQnzYUUV/Ebxh0zVbsG0XlH
	gYCF/bxe6/WhVPNXpLckGXQyxSm7Ds8ngRfCD4cF9NL8W5Anndd9Zi6aL9
X-Received: by 2002:a05:6000:40cc:b0:481:4697:a6b0 with SMTP id ffacd0b85a97d-481607a819bmr5106878f8f.20.1786693383650;
        Fri, 14 Aug 2026 00:43:03 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f219f7bsm5744061f8f.13.2026.08.14.00.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:43:03 -0700 (PDT)
Date: Fri, 14 Aug 2026 10:42:59 +0300
From: Dan Carpenter <error27@gmail.com>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: remove stale comment and dead
 code in os_intfs.c
Message-ID: <an7HA5fniAT6KKjt@stanley.mountain>
References: <20260814-v2-attempt-final-v2-1-cd3a27834b7f.ref@yahoo.pl>
 <20260814-v2-attempt-final-v2-1-cd3a27834b7f@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814-v2-attempt-final-v2-1-cd3a27834b7f@yahoo.pl>

On Fri, Aug 14, 2026 at 09:26:06AM +0200, Tomasz Unger wrote:
> Remove the comment referencing an unresolved 'XXX' placeholder
> and the commented-out memset() call it describes, rather than
> fixing the placeholder in place.
> 
> Suggested-by: Dan Carpenter <error27@gmail.com>

Normally, we wouldn't give a Suggested-by tag for review comments, but
I won't turn down credit just because it's undeserved.

> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
> Changes in v2:
> - Removed the stale comment and dead commented-out memset() call, per Dan Carpenter review suggestion.

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

