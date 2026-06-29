Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D0A3347506
	for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 14:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782741965; cv=none; b=iy/bdOfp7kjcudGOh+67NVIe+SvCTVyaqYN3U4ZM7rnDB411LCs4/WlKB+qyrnl+fXkjBlAai6uWSQY6T6bzMl51t0qBCMidXyvv4laavOlbglnBAxcUVQYAf3Bkc3CTRE1VLzJe0iWCOZ6yIvrlU2/HBntd6ZVPLXaRT31bNGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782741965; c=relaxed/simple;
	bh=EKhy4sthiKAzDXGdV0jIgkXrliIW9v/RpaM+wNp3nHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dBHoyzZModfuZz6JIUiCqYaPrcwCuZtqQKtWvdaVAWhSuz8oWc729AosiNudVS3aF2lwV/0fO0KyW2qtEHAiLAzGcYaqr6d5yEML2gyuM9Wm5asSnUsilQ8ZYxvKVKJOiGTsth0p/1SSSDkmN54dz6X4xa1SveyUVyVBmUFvjLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Khv3HahA; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Khv3HahA"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7e9784666b3so2496532a34.1
        for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 07:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782741963; x=1783346763; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7wG0kxCwms/QpouSCLTFIDxMkmeaFGa5XaDgx6SArWI=;
        b=Khv3HahA4WnA9VCx2d1GFp0y59pXxyvO8But7Gk3CW0ZVU3P9Thcro4mTlTT4/P5O6
         EHc4PvJ56rAeTyI8d5tW49nFTf889XW7vcMUHhzD2kP9ZV80MAg2AWqUl+1pSKEHB42M
         32984bhij2cfyPiHl8PE74xGb7tVHQqhIYyOA0j2kAYLhI0ZQUJtOp1d1orQ4086J5xW
         RP5z/lo/DLHJ6otxgon0GLRtlLmaOVU8qCcRs0hxl+gZqyWSFDptnpp4bUYGcYBx00qo
         E2iQ7CVpFH3StPYAIjuyq7P4VVwzyX0yw9SzQfWCfZlrY93g0rUQXI2SKiCHA27DFkUn
         AkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782741963; x=1783346763;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7wG0kxCwms/QpouSCLTFIDxMkmeaFGa5XaDgx6SArWI=;
        b=lSEuXFLo/Tr9GOSPQ16lJobj1CMWZJXLWOnWlIe4Pcwn8bRVg9gHa13pdv/aOJuisp
         t4EnSX3MruaGxRS4EbxCO0BiS0VnqYqXvHi2+spx/IVRPkv+ygK2fixoZW4vOnr9ohPV
         Vi2uAZQFraM2AR5T1oBZEAJpOBB9HKTZniJN+0UMkbT+HU2pelpRPz1hATK+2IHH0XOv
         seI27SIE0mbnKX2ZO5tY5uZwLpI/CcVdwpktA30g+M4UFIGjxxKGa0XE3fCrr6qXpeN2
         BoAoJXtr7EGXs1iOv3W5PHmzNUl0xl116QNrSFZYpurLs7qQC/goRPD4XoL+QhzFvcw8
         xSdQ==
X-Forwarded-Encrypted: i=1; AFNElJ97LWg2plzU9FxF2TyYDljyxEN9WJ3nvEU7ID2P5gLtrSPdG8etTzY8LRKYSpTryYQRrgkfGQDWoKKgsxD4@lists.linux.dev
X-Gm-Message-State: AOJu0YxDAE7roSnI2Cs2nlbQtem8ODREpG3LUkfOQ/tdtsYlTyl9PsZD
	G017+GYEFAN42fxb6/oPutHyz4mAr1PPrcGwUUIE0+tbLoiEaQ0c2CrE
X-Gm-Gg: AfdE7clzxznjc6gsjaQDwP1lLZMFz2Jv9vpY/tEZvJ7L1L1dddA+WXzcjOrDJX+1wKV
	F4KQPyUMEPilhTLFpxgP7XYgr6rzO78feSCv8IifHh48KoKwGvWyHqR6PBVfUUNacgz0COrZby0
	HB/B/5zCoUJ2f8fUQPEYjN+l2Pke0v6gDnec+ahBZUeqg1XkhK3Bg7TC7Im31COudcCU8coEQ3L
	/0Yr95AyZPK8NVVjyknPp+AGJaWjhOkKa5kCzCXYAFfTlev8TX9R6TSWDAJByyC70fEQuWUaYBM
	Pw9cB90rm1I5TguRtpekSVkRRSZuyEN1+V44R07JobgAgCfy2jHjCrZBfVxOjvi++LFi70aO0K1
	dvC7vx17CYelX/V9zO0xyv98ufkI3piS8+SbtCY8aWfh68v0+PJzYbeYLv2NsNWqdunzGxRvtxq
	kTIeAUmw==
X-Received: by 2002:a05:6830:230f:b0:7e6:e385:4c15 with SMTP id 46e09a7af769-7e9b4fae5b8mr8677578a34.20.1782741962987;
        Mon, 29 Jun 2026 07:06:02 -0700 (PDT)
Received: from localhost ([74.80.182.100])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e9aa5e575csm8854329a34.11.2026.06.29.07.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:06:01 -0700 (PDT)
Date: Mon, 29 Jun 2026 17:05:54 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ruziev Miraly <miraly.dev@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: rtl8723bs: remove unnecessary braces in
 rtw_wlan_util
Message-ID: <akJ7wkKYHqdqib76@stanley.mountain>
References: <20260629132629.107724-1-miraly.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629132629.107724-1-miraly.dev@gmail.com>

On Mon, Jun 29, 2026 at 06:26:29PM +0500, Ruziev Miraly wrote:
> Remove unnecessary braces from a single statement block in rtw_wlan_util.c
> to conform to the kernel coding style.
> 
> Changes in v2:
> - Drop changes to rtw_xmit.c because the removed NULL check was actually a
>   false positive by checkpatch.pl, and removing the if-block broke the mandatory
>   goto logic. Focus only on rtw_wlan_util.c now.
> 
> Signed-off-by: Ruziev Miraly <miraly.dev@gmail.com>
> ---

There is a specific format for a v2.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Please wait a day between resends otherwise it's overwhelming to
reviewers.

regards,
dan carpenter

