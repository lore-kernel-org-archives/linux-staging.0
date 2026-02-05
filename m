Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C667235975
	for <linux-staging@lists.linux.dev>; Thu,  5 Feb 2026 05:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770270410; cv=none; b=Ac7nP//I+lFbpgUFyC7UM85EL1OTiVPxruaXGRtEO+mLRE7kfiOACd4CvwCaWBYVpnva1Tt8krmWZa+xhzRq/h6b+N8vPxLKf670OPVjCEWmSejQDdQ8nVuJd4CBquKOzal1NnP8pkZBrFprMBouDhXVhXxOEeWkby/LfWJBVNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770270410; c=relaxed/simple;
	bh=xZMzOliLNQOb0vHOHye2LmVSruptmxTvELI4ah94RPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OEKvIVWwkyg1npW2dadXiDahLBUivtax4uqs//6Yttae1dg5Sbdv4JGmtFFuBcOYD1J5/JDPJGkTQ8GCQswOB9v/gTb36TMGxVOrxGWhGcwnFeCRorpvvwYpmmd0AXSPREYN9Td59I6AH8cO9PIT9j+8mH+uMlEa1J/F3CVxQKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mJ6rtjlQ; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mJ6rtjlQ"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4806d23e9f1so5276035e9.2
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 21:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770270408; x=1770875208; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qJA/2IOSYuQFhDc2xvdpqyFU6ndugIR0rttkiRO0dZU=;
        b=mJ6rtjlQJXIHsIo7zQTSXvoJTrCfsxc8j7FhS3FP06w4324zNjoIFZ4XMx4GVDCGXB
         RdaBb1gD4AwpRCJzPY7ubct9E/cXWXq4HwgCFZMc7tED4r0AGw5v2GumI8n+TMp69Rsg
         NUbfTnBrFykIYkh41wo+xFY+UAs80rCDhme7wvpX8Vt1QBc7haiRH2nMdhp5OCJgyonq
         ClsT67du4G3XcdATSTmXFyFpBaXxa90P9klHzk2g7jKBO2E76LyFufh1ew5RzfG/Kc02
         MZP1HdBGWXzTz5avL9bvjlQOLP8bs/tvFphn55BxZmuylgTIvWvocEliuTO1bv8PLAPH
         5eWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770270408; x=1770875208;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qJA/2IOSYuQFhDc2xvdpqyFU6ndugIR0rttkiRO0dZU=;
        b=rZk0SeYzmV6Ks7cn6/42Q9Qim5aWGWxSNik+amN6bO8NSYAlbTUjs1qJOsczWFGtFX
         l17djT4laz8HIw8CgN6uzAcKQ7FnJzQDLNlCIW8k30k9jVMmbhzwWgwKG6Je8vDftPmc
         uqBvaWem8BRbqwZChn+fW8sCUuNfcIYbFXNXMLQc+vB+ivFGcRKIn+NrlcYn/JZ90IBp
         nTlJm1LSVTtp7vULXnP7T7dQUkOdvhTLHvVZwKBIqfKJeE9xvcNP5F9UYg81REFSAjhp
         wXWlIzY6X5rRcIVR3sfsyG0j5ugCynMEjqriOXi7ew1wHtOVldhiLgcGk/dPSJ+DaT92
         UNTA==
X-Forwarded-Encrypted: i=1; AJvYcCX4IvQboxreY1E6zUI/w4G0n5g+cepCCfximoTZF0JUWdOZJIUx0ACJmnUy4DPtjb8tC8Ftq7blM7Q08qu5@lists.linux.dev
X-Gm-Message-State: AOJu0YwD1ItP8Cu9UKMqW0oVToaaKoJglwPoFZYZE0PVdJT4k+4s3Uki
	DtzSRQpT3VfOr6uqpr6UNddcD567/xlTiliqpm6ZO7gpmwzCd9bMPZivyDnZk0E+b7w=
X-Gm-Gg: AZuq6aKaFRyOv+LcJx+YUY+h/tl7t8SGAAC+vxjESZXsHM9oheyNq419TBYvKzYRzna
	ksKUHsvxFyvFh3oDNCqMLS9NLHvATeYtJV7o4NcmvE4jhrXyrVxHBNlJA0silyAb5Q8c5cfOq5B
	DSLrPRNeb23Cl7y/uDWyfhyMk4cVUlEdAMEBQrWa5FK52d7m1AGe57P/s4HBqmgnN08vBx0y7AQ
	WO8Ip9jhm/P8ZM2Xx+Nr5m1S0Vazhup7c7+gDo2kQfhDm+dLaSw8ZLDvrfcR36GS+FzwqjrdbQX
	wsezDN11/iGtzCKimvQ5aJmcMSxyVBekragO2ROMSXqdYtxSW+84okeAUg6Imaepxxt61OmYLVY
	cAzz75/ASPN9545qKSql6DRumQg/AW2gDRTXTVeVXpJqp2m0vCYc7GcmHqiGtk+Wv6kekSMHFLR
	BXO1zV4WZsaqZKizI5
X-Received: by 2002:a05:600d:844f:10b0:480:7162:fa48 with SMTP id 5b1f17b1804b1-4830e9492aamr51558415e9.13.1770270408132;
        Wed, 04 Feb 2026 21:46:48 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d299bfsm30190735e9.2.2026.02.04.21.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 21:46:47 -0800 (PST)
Date: Thu, 5 Feb 2026 08:46:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Haroen Tmimi <tmimiharoen@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Fix checkpatch.pl warnings in rtw_ieee80211.c.
Message-ID: <aYQuxJ2ruJJjI7Zt@stanley.mountain>
References: <20260204184133.142511-1-tmimiharoen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204184133.142511-1-tmimiharoen@gmail.com>

On Wed, Feb 04, 2026 at 07:41:33PM +0100, Haroen Tmimi wrote:
> 1. Fix "Yoda condition" style issues by moving constants to the right
>    side of the comparison (e.g., changing "_SUCCESS == val" to
>    "val == _SUCCESS").
> 
> 2. Change the _action_public_str array to "static const char * const"
>    to ensure the array entries are read-only, preventing accidental
>    modification of the pointers.
> 

These are unrelated things so they should be two patches.  But
apparently someone else already did at least part of this...

regards,
dan carpenter

