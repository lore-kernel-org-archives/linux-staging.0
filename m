Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCA52101AD
	for <linux-staging@lists.linux.dev>; Wed, 22 Jan 2025 11:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737545698; cv=none; b=TlfmGvfIgCTPdvclCb+ueKi+ygpfZIy4/tqAZhDydSZZN4hNfkdToMxvW8c3s2jKdBigJsPy8HuEg7UOetHtzFRLU2eQxdQJhPwkJQKPS89nz+WQxtscVLq3TBtdYwbwtPWdYHm7JqkrGse+WDkpm0WUlsdYY7GHAyK5xlQqGtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737545698; c=relaxed/simple;
	bh=1U926oL0MDod9834V/+y8z2gIy7U+dCjf8CDW1Dhy+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tgKPqQwxhb+USsfRIpam2YqdXmzzv6CLQIld2VDCAlwX7AeV239Et8Sv32jmNVH94jHDdNHxqIL88SQhqC7nBoy4ERJc3LUPOWNBpL8V97HtysqYHumCahv+VFKZop89L+o/BxO9pucjXdcq5jEyomM5Ow4K/p+w16LQQ+KwNog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PzxvCmQQ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PzxvCmQQ"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-385e27c75f4so5610441f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 22 Jan 2025 03:34:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737545694; x=1738150494; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1U926oL0MDod9834V/+y8z2gIy7U+dCjf8CDW1Dhy+k=;
        b=PzxvCmQQoWbzNCh07YCmmBMxeUKkbstmPxDEL9lrz7H10y5sYPD6SfhSmsffak2cL8
         Y0ugDyWdViHoVCedbXTPRta+HQ19LDd0c3zZKFi+5iJTUpWpiMESLTIDblXFp7WGO2Bu
         zk9xhbkpmnLYh+Nwqui92iEYdV7l4yafFe9okpkQNtfFylvo7AeOTG1DChCfiB/f4Mai
         XNJj8exU4mb0V1vcL2XlutCZp3Sa3JzKHRZBNiX0JLz00y4er41DOeVPtlFFs6lodXC5
         h90Jlg7cdkjCWQw0odUKmbuAeCVy3slYmC1+4A+crLl8u5Q/qOP6VVsCeZ+j6Ta93yQm
         DSrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737545694; x=1738150494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1U926oL0MDod9834V/+y8z2gIy7U+dCjf8CDW1Dhy+k=;
        b=QcA/Q8eZa1b19EE6jsxffwaCtEk3j/Zzu0PBnYGKcIgpiMrpq/kwjtrwzEf0Z6tbvC
         NSQ92vFZISkdp3pgrhbeiHEHNyi17FzNkNTns1cczUAhbtQpT6mK5En0i+1UP1lipiyT
         tOeh+mx0s67nMz65kocrb9PffctbpJktCuy9McFbgr1+3Nc3c+3eXNHyVZuOzBYmOctx
         f8fTrqYdMgym4fqoB9HyucHYAA0Qe2TD8vn9pmA1IsLoEGxAukqbwsDq31ejXkHohr/j
         ffPS7SLqbcmxxfdudENqjgDrQoaYU0CPoor90CJ7hEZ2CfwTR9p7SemEJq6Stdraqqer
         3ztw==
X-Forwarded-Encrypted: i=1; AJvYcCWU8/EOdFqWDn3nhnNtRGAb8zjyq71wbh3JC2QL72GxF8k+sv0dOUmcNFdAXU9n7UoQL35GvdeGPEg3icEZ@lists.linux.dev
X-Gm-Message-State: AOJu0YwRbM+jPK9X7DTiPIxcdMBak0bVjHq/YPyEePK7S48ld5AGwHqC
	+C4i61GXfU3gfVIwcHoDOEcArq6kespR9fwF/ITj3+mf5u1YzcrzodEk2ilWFNQ=
X-Gm-Gg: ASbGnctvF12aTcK3RxeO8HvjZdCSxCzcCbkYT6lbs/GKO9SbTw/bnflmXWKrSjLuoPX
	0cDwW6rRn0m95XcXYbNcNqgkIxB3CgHpD2vh3tqbp1i0xG6cAWCOihj5RaIZyPnJsTgfQ2LqJe6
	mj2NJX/dCgVY7W8BG4dUe4dV05SIBE14d7sssEhiSj1vkVXI+JzQpJfY+mU5hPoNvnCb00/Eyd1
	tJwRTwFciGB2ZoS+2OCWGYR3lY2KDLrEOIeCCcZVqyBmI4HQRoGDWw40+2v+nDQoM7Stgoo15M=
X-Google-Smtp-Source: AGHT+IER+xQnfdjPi+X962W8XQb6d0L/Y8w0ufqKLAuUr0+et5Uktvlk3ylPQndhpe19xScdv6UQ0Q==
X-Received: by 2002:a5d:5f51:0:b0:38b:eb7b:316 with SMTP id ffacd0b85a97d-38bf59eccbamr20633639f8f.47.1737545694483;
        Wed, 22 Jan 2025 03:34:54 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf3282a63sm16164914f8f.96.2025.01.22.03.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 03:34:53 -0800 (PST)
Date: Wed, 22 Jan 2025 14:34:50 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Dave Penkler <dpenkler@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Driver entry point clean-up
Message-ID: <5463c0eb-2337-46d0-a981-4780846969ec@stanley.mountain>
References: <20250122103859.25499-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122103859.25499-1-dpenkler@gmail.com>

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

