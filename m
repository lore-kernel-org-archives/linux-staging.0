Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7691A36EA93
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 08:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778489477; cv=none; b=uUZAmTQnWrfiJRnFWrBzJV4GAIWWafAHYlG57Jr8mfphNbwVhZOcV7JAhltgNki25JPTFxmpVAwBm5VvyMooVuucHZgT0fkh0EwywQarP+oaLDB1FN9CbC/5ksthVzRejXb0XhcsFE7vD2EmR9utcANEk3Ss3w99oU/BBwM74/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778489477; c=relaxed/simple;
	bh=Hd0xljSQ/qnuco6Czyx6FWY2GKWTmxzgAy91TVZnA7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y+5ntVNXLzg4VU0LjLf5VE0Shpo/RG+uIEGtHAJQ0TkZxsvar9i72i1zvyPC1/IOtgcDdtBSBbvAv4WW5Mt8jHXX/2s7edm35DumXgSI0xdZXp4TP5nNFrhkUWiWGvTaMKyNNQGT3u3WB3DkTtD0ZMx7dsQpp7hjbDJPuA67QaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ogHc05qZ; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ogHc05qZ"
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-57516bb40b9so2340781e0c.1
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 01:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778489475; x=1779094275; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CrenzK47zGkx0FG3TFxLv2Xn0xKN4Zb8+DDnOOAJByk=;
        b=ogHc05qZGElSaxRauloA9h4ChQZc+OG239yam537n82aX2kCHjr2nRUCykW++B+V3E
         1n4NxbGl88o7DDwhnOsyzQDtRLI2HD4qTvEyU9FQcqxyIWvaaix+TmO8sLRXG18gHVFD
         ExSYn85pEOVRt6pV3iA1fqOTo0PQeXt+FZXHjiCTRenqHxe5Vl0ylUYv3jgPsfl5fCcH
         4BAftbJ+A6HYbi+r5z2+dvrLWCIcIStzrImzzFvGTSoByN+kH+QCfqGoZWcAr5s8v9n1
         w+InXp5U5f2vdJt0Tf4WE+8YjLPOuF9WSDHbZqatRBR6oTdPyg89UfXSfqTy78NJKUrH
         wzdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778489475; x=1779094275;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CrenzK47zGkx0FG3TFxLv2Xn0xKN4Zb8+DDnOOAJByk=;
        b=FQI7p/gj3lqr3T4W2PwNa+WtOqGqYFi09FiTDwU40U1kE0tqr882n+uDFfU9iyx2fc
         3s8fWNwmd2azg9/KDAgxgzuaOUedizNQEpT8nEbtkVM+aWvB6JdNXnbhUAEMSpgcoqla
         68gjsG9YUjSOFpdXliWTjgGXpjFHoIOEABeGymh1vbBc5ofvMPLH/+VHPLOjqHnDZVMq
         yJmesgXqdvogE49AADevVPn+ZKdV8Dzo3WxTUq9N+wa8794WWS8GK5u7/InqCCfFD/EV
         XuvIPruCy9VTSAqir/LTBuYL3TEhTG2tgoAMTI3ojkeMSRtmU4xpoYwnlVNA6CaLcbzl
         cLfA==
X-Forwarded-Encrypted: i=1; AFNElJ9/A1oR5MOCuL4Tvr7Ro9Z4c0+zcjsxctjcz4rbv2hCtdI31Df6geqngYXewxBkddXwuDPrbzgS7vXqKf3i@lists.linux.dev
X-Gm-Message-State: AOJu0YzpMBsv0aPJ9cwuwWCTQhAKLTzI0zicYXyYxn2PBcPTI3Mc7sqN
	GLPvFAj+kTf3FT8lWUouF1jDKyEoSXYQMXZqyktxOyvfDJi64+3L2GAx
X-Gm-Gg: Acq92OFdwVuu8KgqjZyxdvvnrMobIatDCCzs6DRza6TYl9RecDBhVXLgvKz+3bIAJSo
	l4H5SFUnJa1gX4lwyfpT2NJbg63F6W9iqsKKogTI4P0PybASY/kLS18GMJKN25X4JSwh9zNLtk4
	j/SqQAQV/KkhajOJZambRMobAbnX3OTaEnP2gDFcm15MrDeH0ZK3P64uzQDKALNY/tA4k9QBMgc
	ZNnCcTqAELXYi1m8i3FstVeLbbTYPXM4sAWk1UpQ8AxWb/9n/cnv8zVG7jN58Y8QkGsV2otDdcC
	BwASLDx/6gVBmiyHmhZt5TXzWXWCv2K5zQ1EKtZIDlbaiaKaOnZDMG2AAl1giXeKVM1JXpc5U0n
	+un6K9p/O+qee3YI3O2JLbGf2s5ZMdhfFfeafWPLTVzFD1fj4spnG0gXxzheouOI6Nht89hCG52
	b1uTC7g9GAGymFE/hLJQ==
X-Received: by 2002:a05:6123:163:b0:575:352f:ead0 with SMTP id 71dfb90a1353d-575595589f7mr12923923e0c.6.1778489475425;
        Mon, 11 May 2026 01:51:15 -0700 (PDT)
Received: from localhost ([185.141.119.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-575869c0499sm5687659e0c.4.2026.05.11.01.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 01:51:13 -0700 (PDT)
Date: Mon, 11 May 2026 11:51:07 +0300
From: Dan Carpenter <error27@gmail.com>
To: Nikolay Kulikov <nikolayof23@gmail.com>
Cc: PRAMOD MAURYA <pramod.nexgen@gmail.com>, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Yuvraj Singh Chauhan <ysinghcin@gmail.com>,
	Bryant Boatright <bryant.boatright@proton.me>
Subject: Re: [PATCH] staging: rtl8723bs: Fix coding style in ieee80211.h
Message-ID: <agGYe8_ggP5aQHha@stanley.mountain>
References: <20260510110228.96612-1-pramod.nexgen@gmail.com>
 <agC1-rqon7nRUdvM@archlinux>
 <CAKR_b74W78QpNKvF_bU1EfT0WhXq4GxQDJiQ05Z454eABRsYWA@mail.gmail.com>
 <agDInsLI8UV7LdhV@archlinux>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <agDInsLI8UV7LdhV@archlinux>

On Sun, May 10, 2026 at 09:04:14PM +0300, Nikolay Kulikov wrote:
> On Sun, May 10, 2026 at 10:48:22PM +0530, PRAMOD MAURYA wrote:
> > Hi Nikolay,
> > 
> > Thanks for the review.
> > 
> > Understood. I’ll split the changes into separate logical patches and keep
> > future submissions more focused.
> > 
> > The Cc list was generated using get_maintainer.pl. I’ll review it more
> > carefully before sending the next revision.
> 
> Run this script with the '--nogit-fallback' flag, it will not output the
> developers who modified this file, only the maintainer and mailing
> lists.

The CC list was fine.  If you send Yuvraj and Bryant can figure out how to
handle emails.  If we really decide that everyone should use
--nogit-fallback then that should be made the default.

regards,
dan carpenter
