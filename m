Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6D8129E93
	for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 21:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724709381; cv=none; b=bt+OkTeeqnQOJ84A2CF58Mvm2bsiczjY0oew+uFnA14L/c07wz76W4YQ1y/IeTUxhM9oYKL7RozNwOT8akr5O1filBX9w0fLXskGo+bbHN8iafKV9dMkIJQNgRFouZ5VOI030bgm0gDaEANTkI4ontwNkpz9bBaaPFgJZXTt85E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724709381; c=relaxed/simple;
	bh=z1V+5X4NGL8P1NP6M55Sd9QL6xANf8ThVPfSxOkr7z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k7mGYUJ/657VRcWrsJDDQpGA88uLUoCszIkOFhuQyBZLjLlUgINtbvIkRuhwJLAlmrWoi/xDAEHjR2av5TA+alELYncy3cZQWsiVJdgoHwyI3BXcx89MwrnPlIbQrWUmpB93SqIpoEKZu/2TSxgSXFI9YTyhRl4M77SxjKjQ0c4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DiGHfQWr; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DiGHfQWr"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-58ef19aa69dso5063491a12.3
        for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 14:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724709378; x=1725314178; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W6dUkFSd+S/BDDOrXrzqOyvghgGgxpTPpn+EU6Vf05k=;
        b=DiGHfQWrWBwd8O5UfOQt2ABshh7y7/z7gMLFFXY0rVaFfEP1ymRfisTyaC4KpIvQYb
         4N9xd+HTRq53mVCUuvWueh3U7tlU7VGJdYwt5tFn9vGMvvXR6y7yMBXhvyXU+jI9ce0E
         EQ73jhxbszcfaibmExPs1ILJzdyoWjRvSTItSky85bxY6L2y+krTsOs+jhY+eHsCn0x1
         FXgrE3rI5eGuIXhaA12Q/wPqn0eiJi4WHzrlHvxlapuJC3FzbdHTirvfWUsja3Iy5hsB
         sAO143s/LauNWCodDDGSpPTdu/4BdA1azvVFVcnZRSEdSZDsHjgGp60o0dKXb+gwmZlD
         NNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724709378; x=1725314178;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6dUkFSd+S/BDDOrXrzqOyvghgGgxpTPpn+EU6Vf05k=;
        b=Fn9lH/+vsCuCzz+0hyE+B7pndn4L8uZPdgbR0rTLJRXt5+01cYZaCAZbVxQtoJiLPo
         Ud61fqVFLHAVrxMHuA+omZjDQ0CCNB7/PYsCTVo8cLSMD/KTvBbg1TxHO5jHnh+lvJWR
         MuxQ20pFlL6k7+Ds21Bl+QoGykvID0CF2IyVg7LSeUAX5XwHS2RbhfMS6haI+Nc/wfQ8
         9ls31qK15lqjxc1IT0TsECG3r/woC2e8Lwzd2ODwC/FfV/VpaUC0Swgllf9yhp9SSOAU
         IYjGgxnP0QbrveibB1+qE3pHYFCjysvAsVsX2i+xkRl/iwzXo/6XnvyYSMCOThl0MCPs
         b1rA==
X-Forwarded-Encrypted: i=1; AJvYcCW3MCqXPPuYCCimVMkvd9TD9chCJL/cgJmh5TqwJgSo4xqXkcML0IXof1KBm0kgEPaJaE7GbnEyI8aAd0Bk@lists.linux.dev
X-Gm-Message-State: AOJu0Yzeo3ds1sefI3UsS3Av0Vo2aJRONBqLmBoVKEx/BLnn3UhCZZ3M
	ZD50DtFyCueUxbBhRCeclHEXH96dXcAbiYk2Xgriz96YcTMKHN83Xl9m6N1JCy8=
X-Google-Smtp-Source: AGHT+IH9lzOnn4XJQWgQEf0R30Ms8zeYbDabfY++XhhQRNHVljlbOHdyOf7a8ZpvfBq7LfL1HjNDYQ==
X-Received: by 2002:a05:6402:1ecd:b0:5a1:c43:82ca with SMTP id 4fb4d7f45d1cf-5c0891a1ff0mr6491430a12.26.1724709378040;
        Mon, 26 Aug 2024 14:56:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c0bb4722b0sm231354a12.69.2024.08.26.14.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Aug 2024 14:56:17 -0700 (PDT)
Date: Tue, 27 Aug 2024 00:56:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Riyan Dhiman <riyandhiman14@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: Remove unnecessary type casting and
 data type of geoid to u32
Message-ID: <1e365b63-64da-4ad6-9fea-1026c55b88a3@stanley.mountain>
References: <20240826144430.50488-1-riyandhiman14@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826144430.50488-1-riyandhiman14@gmail.com>

On Mon, Aug 26, 2024 at 08:14:30PM +0530, Riyan Dhiman wrote:
> Removed unncessesary typecasting to int.
> Changed geoid data type to u32 because it will always going to be positive.
> 

This does several things that aren't necessarily related.  But it really needs
to add some bounds checking to the probe() function to ensure that geoid is < 31.

Here is like a life hack: The one thing per patch rule is slightly ambiguous so
when you're writing commit messages you really need to sell what the one thing
is that you're fixing.  But in this case the changes to resource_to_user() are
clearly unrelated.

I am going to give you the most conservative advice.  I don't necessarily like
to split it up this way personally but it's the least common denominator path
and we will merge it.

patch 1: add bounds checking
patch 2: change the type to u32 and remove the check for negatives that you
         will add in patch 1.
patch 3: remove the cast in tsi148_slot_get()
patch 4: remove the cast in resource_to_user()

regards,
dan carpenter

