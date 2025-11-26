Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43137339B2A
	for <linux-staging@lists.linux.dev>; Wed, 26 Nov 2025 16:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764175956; cv=none; b=Ki1PztltGiXWwjXYDYyUvVmBD13fXq6ChqJeKlKy48tlRsFSypsp5KKGljcUx87Zt9ku3pbj4lJSE0mpoSDbxM5xyI0En1J6Ru8kid0KeGymFe5i1auZXmqoNiwGT/UM1ZiRq3EVhGaNr45OFDjhgYw4li5TKOt5dAmIGKu+1PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764175956; c=relaxed/simple;
	bh=tXgAR95/YaGZzmQuvt8xSbEW49jP0TAWk4bGgco92eE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s8z+2Iu4H4ix3pmfrCVvOv8IKYjJt0OxwUxwOyq45QDOCvH/ipA6gGOXxmGmUCJo4Y5bXa4nCa7mGn4EpXal/6gwt6G+zoqmT3CPpXHHTRm/HChy02KhfHQ+cnie/LSX63XFZepFXUUMRTVxG6FSx66bKlMVucleHDkAiS1l/64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AnK8Zlui; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AnK8Zlui"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-477b198f4bcso45917925e9.3
        for <linux-staging@lists.linux.dev>; Wed, 26 Nov 2025 08:52:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764175953; x=1764780753; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=f7dRJm702Lvq4q3HovanCG1NEfD0HpBHO0M4kPzLxQ4=;
        b=AnK8ZluiAxSdtt6NVI9VdArbdY7E1u7ROLjrCEj/PVs7tRQMjZwEhR+Ft0E21yY5d6
         yl1RVHucxrLHeG6CulXG7MUZPqLv3CzNbfiSWRiriyFKYCyL2wDLeBHwxP+ymU5w1PE0
         xwgwFF/FSg1IWB4TSf0WzQz9cag2cLHYliry2qaHxZQ7BClIQjqgEZvWh1MaB356N2ii
         k/SBuZAwfWMK9qFk7NcuTzpje7Hwi6djO18zU9Q+OsmenmYTzikbd9b9pRRj+5XoxOXM
         n3NYWUrEMmg43Kqk6ZJbJjRuw6f5Ep66ge99QB685OzzDk5aLjG/Xt+gG3e1e1yKAtD7
         yE0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764175953; x=1764780753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f7dRJm702Lvq4q3HovanCG1NEfD0HpBHO0M4kPzLxQ4=;
        b=B3zSJapeb1tAKnTiH5z6KUuPd3rtR7NREizTvjVLr9oz/5GQOGIGy+F90vuVfceQN7
         /i2sYqmIzNfshZCm133aKmy6sGVDog5RR7FNg7nqx6NN87NXaDnWuKc8/SAOiQVRAKRf
         IjBjKIdtjYuwYSE7DCBRJ1SSMHPkCrFO4BdyWW7XUkB4woMkkcgJtIq1ZYKv/Hyny+FV
         ZPFIQLpHa5aa1ZYnhbn823xUoSzBLQvd/0REYCOX+l0tC6M5v0K5tBK+ugsocsBsbpt3
         Nl3pLe+iJRpbWEGiI0d8FfRZeFbeeXyuPfOYDRlygzT0FluP3twPd+kiXKJqyK8VSVBZ
         zN4A==
X-Forwarded-Encrypted: i=1; AJvYcCXDUFEiKAaonXjDlPnLlyuxXUpWvj9ByDOU3g8GNtetAoUnAtWnh2PmOczqf0ZMPQwmQhTKvKIOUoF24Nys@lists.linux.dev
X-Gm-Message-State: AOJu0YyYSe8fZWyhY2vZbkatFuveXHoH9ydc0znuJAjxaGM40K8NFn0U
	YwdPduTl/C7U2/WyEM2DelXeIlLE2KO3bToU8po/SUd2HbqqhxEzrHAuaJPl3MGNmPQ=
X-Gm-Gg: ASbGnctb1MWlXnQC6mcxPh8x01iloP7fiZNTUFHqVq6TW5JQyNhHm1+Xe7W68JAqrw1
	iB3ipmNdzVf0DPTkRMCp9BrvcMylwFOcjiUbYkx+onehEZdC+2b7TEPVdl47M65UFLUwig3Zymd
	AZOq8z6oDwF7eNvFSkVBuCZlcvCvADP5kIEeI7NvSVpYCDccom6/UWDFhUs3xMfVXxM39lq0h9c
	rHZVRd45q/RluR2+kznqaKOdPRHqZrjamqXbQGVqPRFhuR/t5A17UF1jXQ3OAx3F7uKv/E+0ik/
	RHILIcbHdbmZ0J2eIalMtGSZLiSGR0kqZh0+RagG+WMWdyWSpn4wDUPBA+YFUe/dEBB07wqrZzh
	rQO5y7bTlSTbnJJn68Ux+3NB8BNZifJNjf4WNOkHsj9U0EwrdqHcYMPsMgZ1PoZlwTWSrov87LY
	VTNS5iPsJnQmm19ic=
X-Google-Smtp-Source: AGHT+IFfRmxRR8c3IxvYaMPU/kTI2h4l3am7ZLnuAqWlKDP1daGZzNVkP3YDEGQyBim4yVqg96zaHA==
X-Received: by 2002:a05:600c:154c:b0:477:7b16:5f88 with SMTP id 5b1f17b1804b1-477c0165a5cmr191273135e9.6.1764175952541;
        Wed, 26 Nov 2025 08:52:32 -0800 (PST)
Received: from localhost ([41.210.159.101])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4790addeeaasm52987175e9.7.2025.11.26.08.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 08:52:32 -0800 (PST)
Date: Wed, 26 Nov 2025 19:52:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomasz Sadowski <tsdwski@gmail.com>
Cc: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: fluke_gpib: use kzalloc instead of kmalloc +
 memset
Message-ID: <aScwSm0RoNVRj68q@stanley.mountain>
References: <2025112636-planner-straw-a530@gregkh>
 <20251126155453.45178-1-tsdwski@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126155453.45178-1-tsdwski@gmail.com>

On Wed, Nov 26, 2025 at 04:48:52PM +0100, Tomasz Sadowski wrote:
> > You did not specify a description of why the patch is needed, or
> > possibly, any description at all, in the email body. [...]
> 
> Thanks, the commit message now includes a proper description.
> The patch itself has not changed.
> 
> I also realized that the previous subject line might have been incorrect.
> The correct subject should be:
> 
>     staging: gpib: eastwood: use kzalloc instead of kmalloc + memset
> 

All this is weird commentary to put into a patch...


> Use kzalloc() instead of kmalloc() + memset() to simplify memory allocation.
> 
> Also use sizeof(*board->private_data) instead of repeating the struct name.
> This avoids duplication and keeps the code correct if the struct name
> changes in the future.
> 
> Signed-off-by: Tomasz Sadowski <tsdwski@gmail.com>
> ---

This isn't how to send a v2 patch.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

