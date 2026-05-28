Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF443B2FCC
	for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 10:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779964561; cv=none; b=VOBScPl6shFq6fG97k/GSWwxi80KgF41zsSP81uycUEhSpprLiuvBwYHCTxmCRSPZSo6jcxu4so0EfK4ENFdjardr2G/vK91mR3ehmURkiIQ1lSsRyFmZlIJMm4VS3f8E5adhauwuaBW5O4wbOmBlZ5szhGPF0hodNqOLFW6llc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779964561; c=relaxed/simple;
	bh=Fg0V+oZAidj1nvbVQoP29tA6JrA291eDGVe7t9LD2ow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eRQHGApkqqVQpWBobIRjrLgO3Pye0yjsWAeWk5SK6/SEe94dTDPZNsmnsPF+dPURa5GQfKEk85s41Cym9xwIOMokyLGPH12q++6Yxjbx3wGd4UsPcMx+5ufeor6VXqyCAlUZmkify4I0vBYOcprwqr6ezlQ6cu5zykvWyWnV244=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PiAkYMUN; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PiAkYMUN"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4906869f0cbso45135545e9.1
        for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 03:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779964558; x=1780569358; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vJQU+eSTX518rgVEwjuFGD9upNQtN3nUPmcXZInkkD8=;
        b=PiAkYMUNlfzrD9/pD4OoT4wmhRReywL5BjmvhlgglGUOaLgaSf0/YKbekT5loeQNR9
         aNQa8o2t8NpRLdU4lP+sNgj4FcI2jBenrOVgObRf7Ku0jWzw6l5jiha1qZ2CKxmzgbpO
         vwvGvczy7SKKBqi7lyrZu/IHPwKJQyjloplgiZEjtT7bgenK6A/gxGs/739K4V9ao82M
         UzL72ZKuDtso6VqeW0kGBD8iNwDzYRHoPCkWHCP/D8OaI/h+m5mRXbS/jtFjp9VJ4Qjt
         JblqaHROH/3qiNpvLCEUtWf8KuWw/3YXR8GtAhkT0uEP9nMilpXGH+yd024+ZOUOrlLw
         Xr3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779964558; x=1780569358;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vJQU+eSTX518rgVEwjuFGD9upNQtN3nUPmcXZInkkD8=;
        b=g6i++h1AKUeWLg17pGUAa8tWBvj+t765oaEmUoUe4xOVaAqXSho4dvghpMzNoEdM1k
         RvwITEGvQbuVnoPh92dgwBIcwFpxqwyVtE8oC0mjwa0vZ2yzZZBEVuyU9frorafaOkAW
         Z8a4efweWvRevvj0ed73BHYm83aTyhs/6Tb53YvSd7eDARTwdH/wx7XXb+5K5WUfesHI
         85DbkCElftj1EHqgfezXrdfBYcNayInN2Zc1s48dFdP30Yr33/w3ab77QhaxRNBvm3Fg
         UznE9+CXCEujJe1WYUWlqXoTUik3BE2EmZoK2Ymou5OE4c5DK43p/8qPhPoJ2vTb/yQ5
         sdjw==
X-Forwarded-Encrypted: i=1; AFNElJ+oEIpKR3y89RSeBqFE4KMfYj4KrocE0YGkQwt2wF9p0kLXTJZw/xfbWvEmfVUu2hgVEeuN/XhiOxf76MGE@lists.linux.dev
X-Gm-Message-State: AOJu0YzsPeny/n0T5dcWjn4ftKx2Z7aFVYzrVdvrqSwElj8A+a+OhPdI
	YfzgEPFLTcnl6MzLPfCrx943pskUJefUHsdETzxncnG2zhjcf5ZEcigM
X-Gm-Gg: Acq92OFsKtAO12sKS7H+JUXfhmiY647BtcPJqGgm2LmQ1igsW98tRXDRh8yqmeByIch
	lEp1JuxUmTtOK3S6Iszowse5zgXz0XgJ+M3hor1++Ten4WgoqAJnIn3NqbL4C4iw1J3WVgcVjyn
	Tl7Qu2BdoUuldHD3d09ZUVxIXP1UP1RiHxw/droqDghkYIxVyxU6cokrF4xo9ZEZFguFGu9QtOd
	OUSjXfL7tuwox6PfD2TOlVkouH5ri1pbeDUURazJqQqbi7eDl3g5eO/cSlkRD3bv6UPVVkHSWL3
	HgXwk/GYqDhGaeNe00bM4P4CrT+ZfnC81ewCqOGeQEJl694tF+xqHhMPePxpMhs9dHy4OzIW96+
	TqLgZ7SjyIofmJgxbqleu/23qMeyyq2ZzX9GXQuwNXWoZ5zoyjQYkkYYbF9hfrCiD1+5n9JM+un
	Ep7Ufc2ceBChCsktzAztmGFnh79FOx8Z6jtg==
X-Received: by 2002:a05:600c:1550:b0:490:4f07:6d15 with SMTP id 5b1f17b1804b1-4904f076e3dmr375800285e9.17.1779964558385;
        Thu, 28 May 2026 03:35:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4908eab0167sm13315625e9.16.2026.05.28.03.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 03:35:57 -0700 (PDT)
Date: Thu, 28 May 2026 13:35:54 +0300
From: Dan Carpenter <error27@gmail.com>
To: Dawei Feng <dawei.feng@seu.edu.cn>
Cc: gregkh@linuxfoundation.org, omer.e.idrissi@gmail.com, hansg@kernel.org,
	hi@josie.lol, straube.linux@gmail.com, xela@viard.dev,
	ethantidmore06@gmail.com, liangjie@lixiang.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn, stable@vger.kernel.org, zilin@seu.edu.cn
Subject: Re: [PATCH] staging: rtl8723bs: fix mismatched free of HalData in
 rtw_sdio_if1_init()
Message-ID: <ahgaii6K9EEVCDIK@stanley.mountain>
References: <ahfvCpI6YOA9Gpyh@stanley.mountain>
 <20260528101542.2395619-1-dawei.feng@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528101542.2395619-1-dawei.feng@seu.edu.cn>

On Thu, May 28, 2026 at 06:15:42PM +0800, Dawei Feng wrote:
> On Thu, May 28, 2026 at 15:30:18 Dan Carpenter wrote:
> > > Manual inspection
> > > confirms that the issue is still present in current mainline.
> > > 
> > > An x86_64 allyesconfig build showed no new warnings. As we do not have
> > > suitable RTL8723BS SDIO hardware to test with, no runtime testing was
> > > able to be performed.
> >
> > to HERE should be put
> >
> > > 
> > > Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> > > Signed-off-by: Zilin Guan <zilin@seu.edu.cn>
> > > Signed-off-by: Dawei Feng <dawei.feng@seu.edu.cn>
> > > ---
> >   ^^^
> > Here under the --- cut off line.  We don't need this kind of meta
> > commentary about testing in the permanent git log.  Otherwise
> > the patch is correct.
> 
> Hi Dan,
> 
> Thank you for the review and for pointing this out. 
> 
> The reason the manual inspection and testing commentary was placed above
> the `---` line is that we were strictly following the example template
> provided in Documentation/process/researcher-guidelines.rst. 

Ah, hm.  Perhaps, the rules are changing.  That's fine then.  I would
normally ask for a v2 but you copied from our template so that's on us.
No need to resend.

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

