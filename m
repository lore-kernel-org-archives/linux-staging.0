Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2AA2DC767
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 09:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774863314; cv=none; b=CShGlr/xZX8qlQmHgyGdcBSMV6KgHp2ZHOjh6HfSIISJivHRIuvxuldZgl/7oheuagpiqSHvkck+OSLD0xJYI+A3Vfj30jkMz7aFUvwqaxfFW9DY2Ihg9FCdpGOeCwNQyQ3fLqJLWi52PLyIAWgLkjV0dDavx6o4CWziSWhDt4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774863314; c=relaxed/simple;
	bh=d1eHUYZVrqhyt2zFBgTI4z9glgcOv/f53BlO/yFQ87k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=djwgHiiEROIzHZUt50jnrFoYp1FIZXlZhkzSynjTqMYNGtthg9+baPHr7vwI4ApXYrMWrbkbEji9y64Eg6CkKf9Nzp6hFZOLfsDPCHtqnu6/fPu8qrjwbLwIkwUXNpZqjNyxAuUbuG+UBFOIC8bZnij+QKHZBYzaMYrfXtYGseM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+TEiAob; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+TEiAob"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38bd60d7a2cso40456661fa.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 02:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774863311; x=1775468111; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4QA+DyJyDUPG69YjpkY0E0FsABY3pRGNgm9Kth96nxo=;
        b=g+TEiAobG3SaJHuce8Q9pwojP4aPaM7BQhhdazQWDlFc9H2hhJ/e4EHOBpfPYoFEGl
         UR4/ZFsZWPxmO+f2vKOOHgv66Skpcmd5zTHas1YZvEMYeUhhqP9EnuhqOxSEwA7kXSfc
         E65UfLwFO8JuKOBrcbga18K3eZodF3yrvt7rAsKgONwqD/pCNcG2Z/t6Nf6Xo4qb3YOW
         +u94Z2xbN3UfaRInfml59BvBE+3aZg7u0meHmP54x/hJw3+Yize5PNZe1w92Pk3W3v4y
         EXlNdUi6AdIE4dXckAFTwWG84MqhzZmuSSm0yiFK0LeRFKrH6yDLnuf9FdGjO7E0XLkq
         XxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863311; x=1775468111;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4QA+DyJyDUPG69YjpkY0E0FsABY3pRGNgm9Kth96nxo=;
        b=Rtvbs2dEfoyoB7jt/AVBW8rCU7pVe4kQuiK5Oxa2Vzhvc2kUA6Iohg5QbT3PCsCqoS
         yEIGYpIDAKc+BD9d9/HJrUnfMxn3l0doxinL7McSnaOk9U5TyTXk/FEEKCzNzmCvrgDo
         k1XRWVkqg7fVOUw0r1xyIDbWxIsfSnJsfdT8tSKGzXhTXaXfOf1sGU60cQJZ6UA11+Qe
         vW0EgML8ufZq5KFS9i2XlB6KGNQ2Mddr5FsxkE3NbtSHiVh2RGnTo/dIFt0o1clSrh9W
         6kA/pNv1VHZTHfSKIwsATJmnArZ2bRXdT5TxTFhupRO6+qAUTsZ8JgqCe3NLRVgXBH9c
         7Gww==
X-Forwarded-Encrypted: i=1; AJvYcCUfNZ45Stx7TR5nRTZm7g7j9v9FoC2yWWkNV0R8GrVSjryFX7A8KwgewuGfXpZ/XUPo0PQPEpV1RwgR3iUL@lists.linux.dev
X-Gm-Message-State: AOJu0YxhHyIqNGH/7jaku8DB5VxWhjQ0j9vfPNqMFsY9q+wbJjHF+eYX
	7uApLSGTvWw7Fy5Yc5ObkstAOeZ/RV+VZkWdZe77RNigupfV6am0yvER
X-Gm-Gg: ATEYQzzil9DjbUqrIOj2sjfOGE5nL3UMhQGOvvbteDBSun8m0KWJzkmP4Wi8J6MnIiQ
	BcAlXOpZwMpIvDgqWky/N3R8CdoDABclvnvEW4YU5/ycjG9/EpduGg0G0UhsgXv4R187koGDhdL
	6yum2nWxxm6PuTLXhA4wDfnWGlNyGc2cFEZNMVYJfefhoaADjWsuPJOE61UptLNNvJORpbjKTrV
	yougIjVlo9PVh62omWso3pH2njyeG0uoJnbiEOLOsUsqNQWDhTbabCgC+vzD6EDyfKxdhTQ9XYS
	3hQkKEXruM73RU8OVC5vaF9pKItJH0SgubYSMoS+IVFM0lfC4U9gXww9qmx3BAo72YbZ2gFb4wI
	xt+3NKZntrzG4Uk/1JbPjQr8Mu/JpoKfswwmFic9QwI7Y8bat9mZE+a0/YY0dvLbJE4UpeLPi5P
	C9GMV4vJkkA2MkVKiOanE=
X-Received: by 2002:a2e:a9aa:0:b0:383:20cd:52fe with SMTP id 38308e7fff4ca-38c7325fc20mr39611771fa.17.1774863311118;
        Mon, 30 Mar 2026 02:35:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83890bbcsm14487271fa.25.2026.03.30.02.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:35:10 -0700 (PDT)
Date: Mon, 30 Mar 2026 12:35:07 +0300
From: Dan Carpenter <error27@gmail.com>
To: Shivam Gupta <shivgupta751157@gmail.com>
Cc: gregkh@linuxfoundation.org, johan@kernel.org, elder@kernel.org,
	vaibhav.sr@gmail.com, mgreer@animalcreek.com,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: audio_manager: Add missing newline to
 sysfs_emit outputs
Message-ID: <aceO98aKU9Yc_OHt@stanley.mountain>
References: <20260328044527.10489-1-shivgupta751157@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260328044527.10489-1-shivgupta751157@gmail.com>

On Sat, Mar 28, 2026 at 10:15:27AM +0530, Shivam Gupta wrote:
> sysfs_emit outputs in audio_manager_module.c do not include a terminating
> newline, which is required for proper sysfs formatting.
> 
> Add newline characters to all sysfs_emit format strings.
> 
> Signed-off-by: Shivam Gupta <shivgupta751157@gmail.com>
> ---

"Proper sysfs format" is all well and good, but this is something which
already exists and adding a newline is changing the API.  If you were a
maintainer of this code, then I would have more confidence that you know
all the user space code which uses this API and are able to test it
thouroughly.

We merged a similar change recently and, whatever, that's fine, probably
it doesn't break anything.  But the more we do it, the more likely we
are to break something so my instinct is that we should discourage this
kind of change.

regards,
dan carpenter
