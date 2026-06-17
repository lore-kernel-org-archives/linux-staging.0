Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AFA5368D42
	for <linux-staging@lists.linux.dev>; Wed, 17 Jun 2026 11:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781697148; cv=none; b=ockeg8jgEng8T/iFaM0+/C0w25xO8v8oROyJPO0rIvK15U08AD2FuZ8FYkdzWyJDlQeKnl7kn3gyVaVQzon2UBh9U8xSh8kZWVTUajeCb5Mqyx5erPAO0cedpGDvKpT+WKfcwRtFvobr/dXi0cgFXRIVauUVF9GqNPrdzYzuVwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781697148; c=relaxed/simple;
	bh=yIPtgMs9deL/TlQQ4tA3NwYA0h1cXIkV4aX8S7j7w3Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=up+H0MMEUGrlMEq0G1ROqOx2+vpEJ04NpzcL5+nJpmDdwREh83Ik1Pc7zuibi/0FOCG4DqzEw9p+BJX6pqNxlGOBYApaoWfzwYXtZe4RKU+fFBeo7UqkAOnB6lbeyAsLLUxkTEz8gCLSwyhSf3Iehfl3sc3zpq15XaWrigbiBvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rCSfy3/7; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rCSfy3/7"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-491609cdd8fso30299805e9.2
        for <linux-staging@lists.linux.dev>; Wed, 17 Jun 2026 04:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781697145; x=1782301945; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SnZLmQEebgYysl1Vbsxbo2Xi49elzgMMGKSOqliugSg=;
        b=rCSfy3/7AGBoFYWVH26EySfxrVal20ca+KXQjYw8kgDzD2ghA1fRpWkkuHIMZJyri2
         RcSTqkO5osv11Q0JagLYPgRrPl5THOe4mmZUnqElNOIoJ8CcpLpeVYQGbPCyg17U5pQi
         OYPe7LYq0+z7tHzjbsVIozrmDSjGdauFdll4I3ph0uzLCETzjDAykR3sY7M98zZhaeg/
         SLyqtviLOMejzmwVlt4XVRIvw63fvx4EQ0TWIdK0NgDbbytRHIJjLOAmBuR3Av/QH1CL
         4GqKAPpfoEaR7Sc6T5mFqRmocFZg60pFPrHxxnXUWaFlyfNtnngYgStkELhpyjV4MTkB
         NW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781697145; x=1782301945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SnZLmQEebgYysl1Vbsxbo2Xi49elzgMMGKSOqliugSg=;
        b=YJZKiq6wZeh3vPN4hFCl0kR+VoZ76maE1811Cx53X6+OUripUuEspzJPzrvIB+cfy+
         gm93uJa0rWtPWTh3G2nsS6rQPiuzw6E8vFIAJDDIvZ8TJ/YvWozTWyYQMp12Rw6r+vcg
         ywLjJwbyWiSZg8tvvyCbvF7FvSUBVpt1hk1Gd7Aj92/wEVf9/kNbtcC+PSfexyhr2TIr
         a3bzcgi+IvgibopFuzFni1exZAeGF0OjS8rrERIbA12Ylku0fWlQuYkDfoT55ClM//N8
         S4LmkisDnXssYcN6sQij7/SyRGnyUg8H7ozGgp1u5YsVKF/3GCJ8kv/aD3iSpHUvijej
         AM/w==
X-Forwarded-Encrypted: i=1; AFNElJ/fzgaaV9ITXwOkLJnVtDqlSFKs5fBGGWuxSo21qn3C0CJGTyEa8uMKHGvKhoLWKmy2xrCEkP/+/aLjwMvH@lists.linux.dev
X-Gm-Message-State: AOJu0Yxc/z87UIOAp+xpy9AFklljn4UI9Y0a0uwwVgXghrGtKpxTicl1
	TeTvF6FXIsIpaI1HsMg2xL4Ex3jr3taSN1N17A3SAHTEMLWFxi01itUENiFObqD6
X-Gm-Gg: Acq92OGacfu8/x5L5eWE3qPCm0sToOxQPlzgfMqZjyw6Xq6VnvUyfIsqjbgefgjnXWN
	2JJEv2xCEtttZTdiAuaMi+ZHWVQcifi+qvbBJuqrxlXc4gz9t5Wg0ABwfeewmp3PI2t5jTLuCW/
	fVM0B09PgUg/yr/VEC+zHtgc8jFb55GoSgOqNd+2t3whdcJr1BOAOlPIMBd5YYS/FvElrOM+RmF
	lPTdvbCjhTC9hOutebXPzf+t3u7XQPIRLukmD6OS3ZYpkj6eE9W5pBjnjtG+/8ZfHeGV/0oGeFM
	EUYoSIis1ifROlLvLu72mh5RrodqiOrg6Cv/lNeEVN3vkV4fCI0qg+8mGrATWiC1aG7gOFDEZYY
	4WlrpwPUO0U5Iv0yPUnkGhBxrZg7hdvHvMhoscyY5jKIB/S5wnfawiEruUaAl/GB5U3L1skp4S/
	/O/4faMYJN
X-Received: by 2002:a05:600c:4f83:b0:490:adb6:793d with SMTP id 5b1f17b1804b1-492335b1d1cmr58108705e9.26.1781697145258;
        Wed, 17 Jun 2026 04:52:25 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a96b47sm128294405e9.13.2026.06.17.04.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 04:52:23 -0700 (PDT)
Date: Wed, 17 Jun 2026 14:52:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: Jad Keskes <inasj268@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: rtl8723bs: replace beacon timing magic numbers
Message-ID: <ajKKdPWMAaiN5D2c@stanley.mountain>
References: <20260616193134.1759947-1-inasj268@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616193134.1759947-1-inasj268@gmail.com>

On Tue, Jun 16, 2026 at 08:31:34PM +0100, Jad Keskes wrote:
> Break down the 0x6404 and 0x660F in
> rtl8723b_InitBeaconParameters() so people don't need the out-of-tree
> driver open to know what these do.
> 
> REG_TBTT_PROHIBIT (0x0540): 0x6404 = hold (0x64) and setup (0x04), both
> in 32us ticks.  Same layout as rtw88.
> 
> REG_BCNTCFG (0x0510): 0x660F is an EDCA-like register.  Lower byte is
> AIFS (0x0F = no contention before beacon), next nibble is CWmin (0x06),
> top nibble is CWmax (0x06).  Matches rtl8192cu which writes 0x66FF
> (test chips) and 0x660F (production).
> 
> Drop the TODO since this was the last thing it referenced.
> 
> Signed-off-by: Jad Keskes <inasj268@gmail.com>
> 
> Link: https://lore.kernel.org/all/aiGMXBNQ0TbIGbpP@stanley.mountain/
> ---

Seems reasonable.

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

