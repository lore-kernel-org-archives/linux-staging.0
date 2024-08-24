Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 340FA15688E
	for <linux-staging@lists.linux.dev>; Sat, 24 Aug 2024 11:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724498310; cv=none; b=cpJ7+Fk7O2OtSvauN0DcBxMMAO6JvkMwK6D7lZDgK5mDKZ1I7RbSs0At5n8piUrVMQaorqaxmxpGl3ijfbgYpVMD/2KN/245EOpjQtCZnDdJtHF5iervpiV3KGVt+INdF13W/7rIaoWSUjEHMoATsD5jzMeW5vq5CCWYv45hoTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724498310; c=relaxed/simple;
	bh=ArEqVk23aqUOcd1GpupV1li/luninoloc3UULGN4yrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H0FoPQhEdasFCza/RD9E+YO017x66fVOPs/vzxlvJncy26Xx/i1+hrxz45V+tKcDISREkY1r2RN8KG0dKniNqFdKtx+IKmedzC06SrHgRBU3+Ea1vxOJXoE0+kO48KYKuSAqnAltIsRPv9jwOexvdR8WALHFcgYOyXCZ/YZ9Jz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lQBgWT34; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lQBgWT34"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f3f163e379so45871681fa.3
        for <linux-staging@lists.linux.dev>; Sat, 24 Aug 2024 04:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724498307; x=1725103107; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gYbbaRAr9Ic3qjqTHNZx0zH/my3OprgnkZd3LOPXAv0=;
        b=lQBgWT34+OzCjTxFK9xdtwsm/JBVq34RmrU8lzmLtOXXcczJeOJwVHs9kPCbNwAOMg
         MaK37cYuH5nd7wAc5FfCh7OkBzJUKgyh33j1VHV7fdboJCQl8ZfAtqypnZbqBKIk1faL
         AGMf8/gZGAKXDWE0yFB4pRmD1jT3BE4PXUnXRw56bMkzEkRRG57ugvPZDPKhk4a1kSr0
         dimTricZwvj4SaxjSDXTiMc97cU53F3hpxhkMGBmoEL2GED9YJ0vKV6MwUGkZ/wqcYMq
         bPX4pzQr70H2CQE5odWjaK8Nqm0GZrMmDe5tqjwa0szX6PeuUULFGpgfqDmex9sHxC7L
         kpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724498307; x=1725103107;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gYbbaRAr9Ic3qjqTHNZx0zH/my3OprgnkZd3LOPXAv0=;
        b=FQ4uuSgRmfn8uHQc7gNwEeUYlIetW3Ads8GVYCmW9aINFsYin+SmDj8grNy/HwkB3i
         cFXz6Vf6MfeXYy6doDDojsoLNIp8Vxeats+WFwkCpLGW6lT0r6fWkRwy1ocEQiEF6jWf
         UHzVm7tQ8kYxAA3udmErFPetzsM9wydidNITN8WHOgGEbnGRguAWZvWktXeog31o07TW
         VUdiCuEbMJ6tkLtIFXRNwGDJyzpw7w7aJgpJdMpKPWAm/NIL7X4MC35CY6ICBfaEFBFf
         xTsY9gJ402B8rGCUwS1pecOzg67bC1dimq8lEvciiwkduaWBJ+PmqcqQPI7zxYX+433j
         aC3w==
X-Forwarded-Encrypted: i=1; AJvYcCW1/HEJJBG/BT381QhL+qwucz8sLY25GTBVQ6wHQzOtaBMGDGP9AP2q8l4ihXNOjepKCVHktAqSk34nU6HS@lists.linux.dev
X-Gm-Message-State: AOJu0YwjA76hrhWeFYwMyroeuxAMC+lAO0mjVm+FNJ5usKTVy881PElM
	OG61+CfCYsEsl2dueuYl2G/BVuYNmyVhpi2mcpIYcLP4SjHVlyEekig8r5PVlH8=
X-Google-Smtp-Source: AGHT+IG88fGzP8xPqOhCEV3ZN8IhUmVcvCaclZzixTMUL4q23NOwvu12fStPyuQYpPZvkBVEIDbH2g==
X-Received: by 2002:a2e:b892:0:b0:2f3:cf43:c2a8 with SMTP id 38308e7fff4ca-2f4f579e8eamr37332881fa.42.1724498306972;
        Sat, 24 Aug 2024 04:18:26 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f2adc84sm386803966b.81.2024.08.24.04.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 04:18:26 -0700 (PDT)
Date: Sat, 24 Aug 2024 14:18:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Abhishek Tamboli <abhishektamboli9@gmail.com>,
	gregkh@linuxfoundation.org, tdavies@darkphysics.net,
	philipp.g.hortmann@gmail.com, garyrookard@fastmail.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192e: Replace strcpy with strscpy in
 rtl819x_translate_scan
Message-ID: <aa6c0c3e-43fc-4a50-a1ee-7afc20388ac6@stanley.mountain>
References: <20240820184216.45390-1-abhishektamboli9@gmail.com>
 <2348e646-e1da-4deb-ab55-c438a42e25b3@wanadoo.fr>
 <510b12b8-91d5-43ce-a191-9ee0a6c91460@stanley.mountain>
 <77e4dd0b-2c82-4f00-92a3-069526a5f795@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <77e4dd0b-2c82-4f00-92a3-069526a5f795@wanadoo.fr>

On Sat, Aug 24, 2024 at 08:35:03AM +0200, Christophe JAILLET wrote:
> Le 21/08/2024 à 20:23, Dan Carpenter a écrit :
> > On Tue, Aug 20, 2024 at 09:38:22PM +0200, Christophe JAILLET wrote:
> > >     - if a "mode" matches, do we need to iterate the whole rtllib_modes
> > > array? (have a look at wireless_mode)
> > > 
> > 
> > Can only one mode be set at a time?
> > 
> > regards,
> > dan carpenter
> > 
> > 
> > 
> 
> Hmm, apparently several can be set (see [1])
> 
> Base on a few lines below, it looks that WIRELESS_MODE_N_24G is exclusive
> from the other ones.
> 
> So the 6 char array seems to be sized either for "N-24G", either for a
> concatenation of a few other modes that won't exceed the size of the buffer.
> 

Yeah.  I started to review this patch and found the same thing but I never hit
send on my review.  6 chars is enough.  If you look at the commit which changed
the buffer size to 6, anything larger would cause a GCC checker warning about
truncating strings.

Still, it's kind of ugly that we need to do this much research to verify that
the code isn't a memory corruption bug.  It doesn't feel future proof either.
It would be nicer if this were obviously safe from just reviewing the function.

regards,
dan carpenter

