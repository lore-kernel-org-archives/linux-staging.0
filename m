Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42F61F1534
	for <linux-staging@lists.linux.dev>; Thu,  4 Jun 2026 14:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780583523; cv=none; b=HWJ4IuxDcW4fv+M0hkidvpmnA0A8ZAw9og8XKLg7PAKxD7gYbs9uHIPalCL4XCyTb42FfAWwCS4n7GXI784slhu7KjLKFSo4vftism/JFWHOfgpIg+9NIvBZqHi+RaYU7EEdesrcvfkU7quGWnkDHlKmVz+oSq6iuhI/zg3GRC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780583523; c=relaxed/simple;
	bh=uzlrQCtnldSvuoWyKhh9/yf9r6GReJCJj7X5/87LRkU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SEhgc+2QYeFR7ZXb26++tNdr5ExGuc4xoNK0JMXcpb1Uie+F2shFLZynwOpTU4H0a2mUbsCIOAFJNzhNDbE1TR6MaX06Ep0b7+qORjgfYjmnWWplE0rbBOdeJ+mOsAj6RS61GnbsOzh771YpILrxYtyfx+VIpw9a469gouHpWIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b3uK4lTU; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b3uK4lTU"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-46019b190b6so628558f8f.3
        for <linux-staging@lists.linux.dev>; Thu, 04 Jun 2026 07:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780583520; x=1781188320; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6+05Ym76/NdzLd3/eZUvTemls6uArOmjCWU+hee9x5E=;
        b=b3uK4lTUYAJmkt5XEXgR5aXWi3Ah7pWunapzdbW3Pf8Qv7izUAMiLQg3IiNkExG6s6
         SiLu0O92d4Oecr4XAA3yvPtH4s6xqSj+9KOnTXvnKJlqGW97cHRWq5Fj8q0NQygEuyAw
         nAdTrnknX8jNFnjeJrrMIGUToE2ZGD+Ja/8c9E/J5Cj3+RBkW6ys7vs0+iS/aVgzPv0/
         fL6Ag4cMq45vvDqRisUmwCgL2v0Rq5wM/CPb0IAMr4DfIfY4ZdCUH2rK2JfZS+tUOVNW
         iGBaWR2WjlCLKb4z4IKtewR0/hBFHcF4d1mtBHsFWhLFxM4WFtPtrJ9A9+JjYB1EEYZd
         whEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780583520; x=1781188320;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6+05Ym76/NdzLd3/eZUvTemls6uArOmjCWU+hee9x5E=;
        b=kHtT9+LoX5Q6/OhtTtCB7PkYmyhNx2/sBA/upAEU8yXykLIpCG8jva85D/PAvIvuRU
         TS1qkqn3EAhpJ8OpbY31r3fPQoDVNBveo6uTLop/D9Nb4HBrYIJLHwNodODPKBCpeeXD
         SZT64vX85V0GUNRiYLkE+ZdR7MuVlQWG7cHhJpFMKhAsVOI7+UN82CCoUMoxBSP8EXAg
         vcP+7xJkjgBDsFWHeBJXcxYlgtAmCDtsG+dA3KsUBxJDN/lIMjfrK6wt6uvPIurUD25M
         xHsOSgWZj6r37K6YecgVJQKpJ86vXXqUOdW1z58IY+pdRDM3V+XNtoncYEUZLc5LQe8h
         MNxw==
X-Gm-Message-State: AOJu0YzRS7W7I20HosRZAQ+vafMYJ2tSGRkECGN2IDLU06NsBXmK4Q94
	d2XDp01BsIvGu3aJ8n4FyjlBJ2cj7uxlEyEkO+d4lAGGjPQdiXc6xMIG
X-Gm-Gg: Acq92OERzKC+rtIS9sWutVTvAcwPV0DaEZo2qsexpc+A5Dk+sIDxvgnUlZ+Sy8A5n+U
	qlffvmGNoJ2M1HGUUr7eK9+1vDm1ziF5HlItikY+sYeHo7yXQEoKN+CUoIxjd+l3UFsnGdUzh8B
	zZ8jTWjapIV7WryLcuArkZHII10RY/gCSbxNcyPLCVOwJzUezStb0fjpKNRBqZFnpKtaRljqaF4
	O28MF0Z2tVVffc2dbPGrhDi728ej2t/QOTpp8WLDnQmGR6WZmXYAGORWdOuKkebgiP2IytTWm/b
	Mr85L8sA3iEV8gnmIBZLg7otQWNs4AFy6Qz34r6Kbw0hrZJU0ihdhKPHvEtN67P4n3JiJAH3tyE
	tiOEa4HTBg2OO0xZpCxee533ISpB4vipfc9Ipa4u4jthEVVKqjAU0+UwB7FaqIuGODAZRpdTMmv
	xDB0AGDrAxS6G+CdlCFb3ocO7fH/s4ig==
X-Received: by 2002:a05:600c:4fc8:b0:490:5057:f5f7 with SMTP id 5b1f17b1804b1-490b5e8cd0cmr128141695e9.11.1780583520254;
        Thu, 04 Jun 2026 07:32:00 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc39eb04sm78015075e9.6.2026.06.04.07.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 07:31:59 -0700 (PDT)
Date: Thu, 4 Jun 2026 17:31:56 +0300
From: Dan Carpenter <error27@gmail.com>
To: Jad Keskes <inasj268@gmail.com>
Cc: linux-staging@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: replace magic numbers with named
 constants
Message-ID: <aiGMXBNQ0TbIGbpP@stanley.mountain>
References: <20260603143127.343103-1-inasj268@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603143127.343103-1-inasj268@gmail.com>

On Wed, Jun 03, 2026 at 03:31:27PM +0100, Jad Keskes wrote:
> Remove the magic numbers in rtl8723b_InitBeaconParameters() as requested
> by the outstanding TODO comment. Replace 0x6404 and 0x660F with named
> constants defined in rtl8723b_hal.h alongside the existing beacon timing
> constants.
> 
> Signed-off-by: Jad Keskes <inasj268@gmail.com>

Just having the same define but as a goto doesn't add any information
or value.

This is actually the third attempt to do this.  The first two were AI
patches.  On the first time, I asked how the author came up with the
definition and the had the AI generate a halucinated fake spec.  On the
second patch, the AI found the first fake spec and assumed it was
correct.  :P

Your patch at least doesn't try to pass off any wrong information so
that's good.

I was able to find this explanation from an out of tree driver.

https://gitlab.elettra.eu/intel_socfpga/linux-socfpga/-/blob/socfpga-5.15.60-lts/drivers/net/wireless/realtek/rtw88/rtw8822b.c?ref_type=heads
#define WLAN_TBTT_PROHIBIT	0x04 /* unit : 32us */
#define WLAN_TBTT_HOLD_TIME	0x064 /* unit : 32us */

But it's weird that the comment here says ms.  I don't know what
is correct.  That driver doesn't have any explanation for the 0x660f
value.

regards,
dan carpenter

