Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B8F53BE146
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 07:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781508373; cv=none; b=sLHVyAMDBQJnZjk9uYI29/LXwinfpTQuYUwZ7TSZ5NziheNb7W6yhIIl/MufSkzufa9uV1LPi32U6epi58IBPYRbZXbtjjIOnYFowCBvrZEVx0a8hs0l6HZJPQE+YPmG3QHl1++ORZRKibNeUIiVrf7/P+xvzz3x/tqSZKleMSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781508373; c=relaxed/simple;
	bh=8OVogr30bhr74fW2Hm7sG0AfCXWKExFn9ER5CeaTeaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ewFsNukPZfaXxuKkOfuUsXhYVzy7hLNxINIcULXKJBYkkdT6kyfblR1zfpz8m5ABF7592UOvFrpY4Ji5Ov0ghPaTcHX6SqpTFR2m4aNHvBzLRwz49+a134vzvT2yLGPvZKlqxjnTQ86/K3KnytxZ3Jzu5hROdfRARl0+VNOdDxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mq/e4cjw; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mq/e4cjw"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8ce9df49c5fso50058526d6.1
        for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 00:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781508371; x=1782113171; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7+tU07z37sK78ZvDPE4vdbxZ72W4YgkB9Rpt6sDKFm4=;
        b=Mq/e4cjw5pbeObtIoLDKG8E9erhoklcelRxuPZNucr9HXUAxbJkkzzEjyl6pisnDhE
         /RiSDNwIc40V88x+g8LBpHzepNAnpoHRkVoCi4ibOsQweyarpfOyNIzsNVHkNapx/Jls
         9zRRnr0e5l2OxllnWpUd/FUShuHldtbmx6MsTwSma4wdEHN1hsn0/JOS9PNtg2iRWhts
         U8Gxa2Is29UafLoNiJEbv23uiQHnBCroRX1h85kVII94h7nDxOHXWdnpsv7E1Rn4dlRI
         cGApRuFvAf+CP3tQxoCDOx3gCDkjpviGiy8DZCgy0BJLU/bG6QiBHjahVfmtJASAcdZH
         jONQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781508371; x=1782113171;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7+tU07z37sK78ZvDPE4vdbxZ72W4YgkB9Rpt6sDKFm4=;
        b=h6MGZZLghY6qz+3XkGksYpvMv3QrZIW9mVOYBvg50c8Tr/gWvAdmidV9Q/W81MnsPv
         a8jjiXyVQjG8o2G+6Ao1rE9eoSjOlvYa6/hIMcpnkaZR+M3eBoJDLNvvM5IUUaPyhu0k
         6O0JCCpnREMqQiLl+Go85er6zQcNG1XmrHYa0IrppGOEdG7OCHFdLN++MQPL9NVMA9cJ
         32ACQLOJIXP/y3M4JA7efuSxfTSlTxQnCUj1Cpd6kPyqQRYLTN6xPt2KVOO8MutPFszN
         qLB0qbU/OhUsmcHVBdyhzCCqcQKcCteHbi1SI3HNhpwpsoe2LqnKh6jqA0mgX2QBTLIn
         YGxw==
X-Forwarded-Encrypted: i=1; AFNElJ+jXLJNBmlu7oyUwMIbKAdQyoDPWhwXU2BqWPlr0E4rJhzfhzNJcZXCbqk5OW5tFprE3OOtmbXk7wTr9TkJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzDU6aJ6ygmyqcEEJGxXiatAr1OLXwPlhzg4np9tmkUzecul+xC
	WqVW6/DhLHLxo1iGlPtpeFwaN1ti1RuLOvAe/MrI+ESXHtVRIgqWat63
X-Gm-Gg: Acq92OGv696AZuUa6nLIBwjkS/USPO21b6aY9vWozXsdL3K1Yei0Yf9llqN4LK9bJgr
	MllYOfPuxbWFS4+kJNWNegqlhqoBL2nz2NHUmeTUnmSV6Au+kdHYlXY+OVOhBZdi5bZ6974G4fA
	g2kmG3zrcdvEyjCDihLqZANfSKnalMN5ZCyw0KowXyCfjR2YQWDE7OmoZdo/g5W+IAlrqgsoW50
	iWkrO+9T1Jx2w/OfwMOO0ITXembygqCGgvfvWCVGnPD+I9L4qHsnubZjVWCheHLBaFSF+iS+7oJ
	g3qtJvhDRGqqwtrbi2yTxX6so4tQeVqAAVo4/HMXDse98P9ierQG2O7h5nkEr6lgz7Zc9JMhPn0
	LahlJf15F9Gzs3gFy6vjAL4XpiJbJuFliR8C+71AU1GCDP2itMf+ma2zWVSLgO7anSk3pRbSQU9
	kh5JI4rvnvis6t/lsT
X-Received: by 2002:a05:6214:5286:b0:8ac:7d13:d189 with SMTP id 6a1803df08f44-8d4502aafe9mr166623206d6.41.1781508370945;
        Mon, 15 Jun 2026 00:26:10 -0700 (PDT)
Received: from localhost ([43.225.189.75])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d302114676sm107412196d6.20.2026.06.15.00.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:26:10 -0700 (PDT)
Date: Mon, 15 Jun 2026 10:26:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: Moksh Panicker <mokshpanicker.7@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org
Subject: Re: [PATCH v1 1/4] staging: rtl8723bs: Fix missing space around '+'
 operator in hal_sdio.c
Message-ID: <ai-pDCkETGMFGq31@stanley.mountain>
References: <20260614122155.20034-1-mokshpanicker.7@gmail.com>
 <20260614122155.20034-2-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260614122155.20034-2-mokshpanicker.7@gmail.com>

On Sun, Jun 14, 2026 at 12:21:52PM +0000, Moksh Panicker wrote:
> Add missing space around the '+' operator in HalQueryTxBufferStatus().
> This fixes the following checkpatch.pl warning:
> 
> CHECK: spaces preferred around that '+' (ctx:VxV)
> Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>

There needs to be a blank line before Signing block.

regards,
dan carpenter

