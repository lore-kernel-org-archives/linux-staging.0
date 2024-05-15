Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C3E5A79B
	for <linux-staging@lists.linux.dev>; Wed, 15 May 2024 10:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715768868; cv=none; b=jZPmU6ywEox9MbmxVm0EGWinK86Yvm0aBez0VcaCPZ1swSZVNxuTE+gyCLtN3T6ZB10CPrE5DL3FmFkT8Yqxmp2Nox1O//3RdTWiRkZyOoPu6MNzTjUipWKRDSetIm9JTFvMCSwJiGityGXarr+4rBLYnq5uqaHZDnuWZKJHpeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715768868; c=relaxed/simple;
	bh=qWgM+RX/HiPQ3kWzHw+7XBTUnyzmv62HfLHw58tjQ9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cHVtWZ8jwo+31Hb5fpW+FjW7iEQDUfzrdQc14mx16gkyVMWbQuoG5YiPCwwhmZzTMbOYQB24YwmrZRyI5c26jyl/UeZuFYyYysNKemwSe7Q8IUMuaWB//ksZgsDKMoEOy5X8SnMOFX1HH7lvN3ksQiQO26gxXMRvwzaiTbXIk6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ecsKibzz; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ecsKibzz"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52232d0e5ceso5844696e87.0
        for <linux-staging@lists.linux.dev>; Wed, 15 May 2024 03:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715768864; x=1716373664; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9BTQ5oCj9CpU3fLEYwzFA19a0kicd36gmVExJVssytQ=;
        b=ecsKibzzp0GtQATh3AdWbDwwcRfzIHJcEGuY/oi/ENdTzemmJ3pjuSFJQWQeaMf1IK
         tGaoy1XhVyI0NsnDEIbZ98p7R5q7nrme1Yle9WY2tsjO3MXsxEPLysyySPT6GfU2aoXd
         VM7n8ES30G7ku1kXVz7BZTSPtl6Hm/Y5hpH6qtTfZjaO6xjoDHUHpA+Ey14udjDHDUl3
         veYGx7bk3fP8V3KJPPWCCIFWahwENuQcIAcAeozoQRuFOZREHCy9A5+t8PnCJIU9/9gW
         SZYr24tMY//g/Dey9JJmGqpZJ2fxXmRhrKkgtuubZDbqTEvxAYaRExg13+qO3Y8H5EqF
         20ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715768864; x=1716373664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9BTQ5oCj9CpU3fLEYwzFA19a0kicd36gmVExJVssytQ=;
        b=K5oQQDgYVWXTE/zeLtEyVGFMpdhAomF9zMTouGpiVvolr9zuj093y+LK1bl9BfREBu
         dtVHyCVOTFcwl0ieSXakMT3H3O0x3dzlorXiFh26gJiuo/4FHYtfPKGxKMFMJGuT7PEF
         BQTOkbu66oJPjyLkucwHaUQap4eYb7Uwt0EHaQDUwucts4oqLOVcZsaCBYhwm9frmtO1
         ksFHuZ9ajJB5+Jrk9dl56Uzf1HYvxZ+IJsq34Nxb0B4cS7jeTy/2ByEO8GfUjp3cM3cO
         o02gqcEOVN8pYob/rME+cLpGdaLFlhYTiXd3l0+3WFdux/wr/iFR9gmeRWoBauUYhH4S
         PTDw==
X-Forwarded-Encrypted: i=1; AJvYcCWC/IeSO09bwa+H/XjgZDjyqV0owYTO6pZR3t2PrDLJ272XHm6NNfbMm4sAh2WMEDsVibQ04dHbCrQu/UmXKoL8mRW1SW7ro8vQbFjtAA==
X-Gm-Message-State: AOJu0Yxh+lZS/oSlSV61293CZSmst9hiGtk2F6BydHDXnqKMcCV+kNOC
	TLX57UJdY0tuOe7o9mXFZ4VV0Zh6X/rAoieuryjg82w5n1rNZLBW8D9RS7T/2DE=
X-Google-Smtp-Source: AGHT+IFfdE0wSDcpswRQGHdJ3wJuk/Aivko6hlf8NFc9hysPwbGoKDFxjddxqAciq7EqVqNTrIw0yQ==
X-Received: by 2002:a05:6512:230b:b0:523:a89f:aa57 with SMTP id 2adb3069b0e04-523a89faad5mr50980e87.56.1715768863887;
        Wed, 15 May 2024 03:27:43 -0700 (PDT)
Received: from localhost ([149.14.240.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41fe518a8fasm204238535e9.33.2024.05.15.03.27.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 03:27:43 -0700 (PDT)
Date: Wed, 15 May 2024 12:27:37 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tree Davies <tdavies@darkphysics.net>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com, anjan@momi.ca,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 17/31] Staging: rtl8192e: Rename variable nPadding_Length
Message-ID: <1d874933-34f3-40b1-be1e-84ca7ffc380e@suswa.mountain>
References: <20240515045228.35928-1-tdavies@darkphysics.net>
 <20240515045228.35928-18-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240515045228.35928-18-tdavies@darkphysics.net>

On Tue, May 14, 2024 at 09:52:14PM -0700, Tree Davies wrote:
> Rename variable nPadding_Length to npadding_length

n and length mean the same thing really.  Normally we'd use a shorter
name like "pad_len".

regards,
dan carpenter
 
