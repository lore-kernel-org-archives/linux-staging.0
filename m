Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB6035DA78
	for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 19:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792093528; cv=none; b=TGadceVei01wK0uD+hk17IPNM78hSov5ZRCKaZgN9IuuhSlWmsN27MwL6r2i3rn7mEYsaUxGYmXyjrUOwGZNwq/jn9UkHuKL0uzfHIaxqXzT/zL/mSaac+cMp5OUJT53rvDkXyMLGmuTdRkAW5Gp0ATIekaCltdKX9q1QOzKD+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792093528; c=relaxed/simple;
	bh=PvNRqwVY3U96lVu6LwTnjyNn7YRRoGPY+tOwZREgySg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I1+AEFGKg1UPn7Wx8a9DEJ7hTHKavj6eJFfBtzmYkONT2uBx89PgJQ6kvnXtk8UA4ny28yuA6Kpvzuya/P68G8KW+fQWQTa1CyBlToGhFOYZOxLDtVFxNySzH19+mGPDQisVAylMumfzU49SfKBVPf8jtq4TKIZFDUGYpLWPLEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMwkXwQe; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMwkXwQe"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso53545635e9.1
        for <linux-staging@lists.linux.dev>; Thu, 15 Oct 2026 12:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792093526; x=1792698326; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j3TScMJtX44eJCAHUzTz+8yigx8ZEb71Hc0vt5ePLJU=;
        b=DMwkXwQeAWX3PqB7oUhjGhYdOx128SWkyranTvbaECnYcjarv0pk1MzRc1PIJcuz4H
         vzz5tqcJkoZVH1bnv0HHXKsyIJbjAEhJs9jx9YeLbPG1f/8Rna/sjA+rIUoSb0KTrr+T
         NiBZOD0iZ6LkfvD/tmaaXOSP1ULQBuXAacSGGNBHuiPjqvLD2//oOvecEYiCHfDNgj8V
         bKtSYstTqU5RfQdTzyVTfJrk/7OuVqWbGoDDBgE6EnjgnDg1c+BWz3lmtjcHYxukhAUf
         JQzcV7EQTf2pai7cSRthhEjIL83/hp3Km/oCOBlZyaRji5kb71MYARmUoT4uSiOo2rqQ
         DBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792093526; x=1792698326;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j3TScMJtX44eJCAHUzTz+8yigx8ZEb71Hc0vt5ePLJU=;
        b=h9YEH5Ncrdi1uUG4D4iiM+sxEPKF5Yc+1sg9/wxeWuZi2gmENxqav3VcfJjD7/OsH2
         oWscCohK/XFI56csMjNxRl4gI9SlK5+ULJLCWnvGO3rymW4scWUpP79w1t5WEe028M5W
         HBPkxTbfFKQ3eRsoKBTSpGNjmIiPGf0NuxEbqpqSVzSA0cp7OOymTSW2lNqLwLAGGurc
         0NeEnCjIVTcEIQ3Dkeg7d9hzidGK7CTpFSroczEvtAlNZNTpmK+gigbmmSKGTsH+3INu
         C4ktwVLIobwt3D8lcnOA3fW2W+aALdRkD5ngrVouAS021bf0p+aTWORJQDIsopKwkELE
         e5VQ==
X-Forwarded-Encrypted: i=1; AKwUvBxy/8R0gA+ATtAtDFXq/sPEl1ZDqqFjkkWm/ctPmMtEq4wftCTjiMd4b85qr6gItqu7dSW9642/f9LXYgs6@lists.linux.dev
X-Gm-Message-State: AFq9FYLa4zuzZ89oFO/EqwWQCbHcG6wY/HTNoIiNBy16i4q4ceDK9vGy
	VIApHvHHsTiANMWfqvvd56OSqIltFyvMLBv1s7LUKMVFHbnwLeW/WIs7
X-Gm-Gg: AYBFou18dqInq8QRhHW/vBy6DjjJP3n32cBdG8riWFjYicSBlyJDMyBkF5V9HW0wtPO
	TtjupucU+x8t2X54Rkt702fLXc5F3heb2JzEjpcdF2ruUFozRMlhlfg6kokzN7PbqJJShlX6vgt
	HZRld9fKcqt5P99t8iOnWmnRZNgNfDToHiVWvlGwCw0t2jwbup0PsbxgPcSL4YX2fUiLRS5+IRj
	bs48GeKJqI8RVFvDLpfHwkwOxEiv/pbfjlF9mdBsavROZmrZgf59EvRUZWnS6eBv3ysaIDN3qkv
	uLpJzef33Kv0Cqs3C4YWdTRa0ZeQPaDRHc5QV+F+54+FWXzwT2H0EQi/7g9a1I9o23Bczfma0O8
	OVkawFAuDJ//W8AhJViuBwYaenWVednBzLSKZdoO/HXJxKN/mSOKQ1nFdGfjVVjNMlmYHrcDkqu
	4g5ZQrCwZh6YOILp59xwX2m+Sk7naclkKEvxct7Yjk08wndjWj5aOHwxEIxOf+Mv7juJk=
X-Received: by 2002:a05:600c:6994:b0:49c:dada:30b7 with SMTP id 5b1f17b1804b1-4a18e446f3bmr402490965e9.2.1792093525743;
        Thu, 15 Oct 2026 12:45:25 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b8b5fsm100897135e9.9.2026.10.15.12.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 12:45:25 -0700 (PDT)
Date: Thu, 15 Oct 2026 22:45:21 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: Luka Gejak <luka.gejak@linux.dev>, pavankumaryalagada@gmail.com,
	gregkh@linuxfoundation.org, outreachy@lists.linux.dev,
	dennylin0707@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unnecessary parentheses
Message-ID: <atEtUV5q9MHRSTJb@stanley.mountain>
References: <20261015120634.95218-1-pavankumaryalagada@gmail.com>
 <5d577cb1b4a91e8cdfda171bc7100105ae90d91e@linux.dev>
 <DM5IYFCRBE9W.1U3KCU36BUE36@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM5IYFCRBE9W.1U3KCU36BUE36@gmail.com>

On Thu, Oct 15, 2026 at 10:41:53AM -0500, Ethan Tidmore wrote:
> On Thu Oct 15, 2026 at 9:11 AM CDT, Luka Gejak wrote:
> > October 15, 2026 at 2:06 PM, pavankumaryalagada@gmail.com wrote:
> >
> >
> >> 
> >> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> >> 
> >> Remove redundant parentheses around the address-of operator to
> >> follow kernel coding style.
> >> 
> >> Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> >> ---
> >
> > Hi Yalagada,
> >
> > I'm just letting you know that this change is no longer needed as the
> > entire staging/rtl8723bs driver is being deprecated and removed.
> > Support for RTL8723BS has been ported to rtw88 subsystem.
> 
> So rtl8723bs patches aren't being accepted anymore? I saw Dan reviewing
> one earlier, just wondering.

I didn't know it was being removed.  My expectation is that we'll
probably keep merging patches until it's actually removed.  It's sometimes
easier to just merge easy uncontroversial things without trying to track
everything happening in the kernel.  We should obviously delete the driver
as soon as the other patch is merged.

regards,
dan carpenter

