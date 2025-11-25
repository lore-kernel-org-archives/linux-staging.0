Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC7A21A434
	for <linux-staging@lists.linux.dev>; Tue, 25 Nov 2025 15:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764083820; cv=none; b=PJjM868qYpOXtXX7EiR3kLzav8s3XM9l1J7tPL4/ayaRdduU5FnipyGFntWQvxQBe84FnnUKiFe4Hqj518SiJ4KJXZpnlzwCysy2wxLGW/EPjGoiMgVF15FmlGRKNIP3V5xelZC5VqiSG+UV+UiMc7eMn8MFh4lcsVbRti3ozJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764083820; c=relaxed/simple;
	bh=MD5nWVKY2jRB++muLXsU6nTHU+2ceOnjUYevse/xaIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bNt1vWXeMilO3i9s4GKHT9kpuc2nXebgX2eLkXSylBBs4Mzz8N9JEs6viE8ockyqiyFd2IvduCPE+z/VWIJY8X51MCPWBTSJuMNIVoXXpnEOGRCHnbRkpDVj40rw4nN3i6xu4oUOLjq/IPSEJmsM5E1NYu/rCrHjeK1P4aJ0d9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QuYgBxQK; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QuYgBxQK"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7b8eff36e3bso8813265b3a.2
        for <linux-staging@lists.linux.dev>; Tue, 25 Nov 2025 07:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764083818; x=1764688618; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YyuveUApEW6MqWB346tjkOT5gsvoDpbyWY++Z0qVq0c=;
        b=QuYgBxQKZ/CjfE5Yk2Srgllmm7KpKyglKuBzTjGFdfKyFpLiuLASLo8KlozspxArB0
         K8/ZZr+KW68UyWR41Q0lVFhvtIJyggu1CVe6T4BvT7/u7sb9ID7G+TuLJ9ZxEhFWHCvt
         7x1g9PXVl82gMkp9NlzBjH0UOhUYQUavI0vfmlF9YNhMUUJM7dFnzabGT6yERS71Z6B/
         sOL0iZM+pilEftgbTpVHdexIVHNG6NBcIx0S2egJUVfWDbu0rcQjER/7xXFOuMkLmitf
         T2ENBSWYqMIj7pl7+2px3WVVRKS3fWJMFRkzM3vMJ/z9cQ8pULsq66c+IwUC27ssTl5j
         zUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764083818; x=1764688618;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YyuveUApEW6MqWB346tjkOT5gsvoDpbyWY++Z0qVq0c=;
        b=AbTZRXM5/WG3yHzUz+S9g9y4+MrWZVDP7qI106q/+dzIk0VFnuqwAhq7wV/GP2TGE3
         DYF+23PMypHv7uRnM4/uqaM21xf+TkbfSME6AvgUf5zJEUySRSwu8/i8TlV34lTgJkS2
         3fvntQEgC890ur47LPT4JIwsDRisiz0VbL0rhE5qAyXm8qcO5rIRofcaGXR8NeCZ+kVt
         XaemfmZqCyMIhSNdEmYwuVzNqW3tsHwgYQl3XcQ2WRyYkrIm2IQZ290bCPRSwtB4ugV1
         4vHJ0sLZ+ht3cAWVN/cAtJcVIv7fdHaiUjo5ZhLzplV4fawAcb4dhaKPOoHSSdIvkUsD
         g9tg==
X-Forwarded-Encrypted: i=1; AJvYcCWCQIluhOclCmd5Fn72+lYMXhWXMi/MFGwWCAlsL/Skqw+voGh1f0a0X60BkhUguJJoCAHfdclcpksEwYvj@lists.linux.dev
X-Gm-Message-State: AOJu0YxOOapi7TQ00/Tc2ggOFIeL3gTIuB3JQgwUzMiWPMyvHVYhQlYU
	JRRygn+SKErqGyGz4oWk0OQtvXbm0mgmQdzPo7cFAulkgeG0ZLab85xn
X-Gm-Gg: ASbGncsndoWRQsdprwsXGofxl7npIGEJZkXqaiIkRPLCAKc9E5lruFK3q2kmEaDm/X3
	+/JVP2KiI7/DXGOw2O4+aiH3/odO4CHklfOLhwjsgbQVNuE61u5dNkT840p+iog9EoABYrr41Aa
	tZ3hggBPIYaeYJwrBREJV5AtjexDsX8FKa6gvrr8aFsJF/QbWxKZx/AKFCFigfaBoegRxdIEFt8
	5GROG7Gr5/up1J2FlGbfZ6P94G300MTUnG1+7Qu66nEgWpylHTftN0QsV1GpGmDqFH0C9IpIhqU
	DjJjOelRXE4+KZN14E0jPjQ+ICaL4PFhuGwDph/wgLjPZN7w24Fw5j2Ak/Fbh/mzv77KbZoJkSS
	LojPAGvGpKdpqOcr3ZLYUfli01lGyfItaUIUHy4GQAonz78rQrF5c1p9xxTbfkZMk
X-Google-Smtp-Source: AGHT+IFmY4gEn5RSgbnY+b8HRDNSnBw5LS1ogEFSzfabUvMLIcZ+gb/f+1rnx+8c0DDa7uBAkobDQA==
X-Received: by 2002:a05:6a00:3d10:b0:7aa:e5f2:617d with SMTP id d2e1a72fcca58-7ca8a138bfemr3371035b3a.30.1764083817909;
        Tue, 25 Nov 2025 07:16:57 -0800 (PST)
Received: from essd ([49.37.219.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f0b63dbcsm18409406b3a.50.2025.11.25.07.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 07:16:57 -0800 (PST)
Date: Tue, 25 Nov 2025 20:46:51 +0530
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: Navaneeth K <knavaneeth786@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com, 
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: most: dim2: fix missing cleanup on interface
 registration failure
Message-ID: <sgvpvlvyjl2sd4ehwujuetrtzl5jvvwkk7yxmjourgduylqf2w@g3qosecznvic>
References: <20251122185656.251902-1-knavaneeth786@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251122185656.251902-1-knavaneeth786@gmail.com>


nack.

On Sat, Nov 22, 2025 at 06:56:56PM +0000, Navaneeth K wrote:
> If most_register_interface() fails, the function returned immediately
> without freeing the allocated 'dev' structure or resetting the hardware
> state via dim_shutdown().

Based on the commit message of the following commit,
most_register_interface() is expected to free the passed interface using
device release both on success and error.
commit baadf2a5c26e ("most: usb: fix double free on late probe failure")
https://lore.kernel.org/all/20251029093029.28922-1-johan@kernel.org/

>  	dev->dev.release = dim2_release;
>  
> -	return most_register_interface(&dev->most_iface);
> +	ret = most_register_interface(&dev->most_iface);
> +	if (ret)
> +		goto err_shutdown_dim;
> +
> +	return 0;

Commit d445aa402d60 ("staging: most: dim2: use device release method")
converted this code to use device release, where the function stored in
dev.release (dim2_release() here) will be called to free the device
when put_device() or device_unregister() is called on the device.

dim2_release() does free and shut down the hardware correctly, so doing
it again in the error path would lead to a double free.

However, I do see that in most_register_interface() function, the first
few error paths (before the device_register() call) are not calling
put_device() to free the interface device, which is inconsistent with
the later error paths in that function.

Leave this code as it is, and fix the most_register_interface()
to consistently release the device on error, by calling put_device()
on those early error paths.

Also, when sending bug fixes, add a Fixes tag.

Regards,
Nihaal
