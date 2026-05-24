Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5665E3B3BF0
	for <linux-staging@lists.linux.dev>; Sun, 24 May 2026 23:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779664393; cv=none; b=hnJwVe3lUrtHGQuYpK7VxutXbIFZ7f+F1DDH9m1Aph+McKpluFH31sxfYpQSij0rvO20m3iKxuMyXlDJJKyodJafAxDYndO7Pu+6rH0Dzqg4sEjuvEvwMmmXjSMzfuAcaQwuApufmZykh1CtQjqd7Md3sIU0GrgL27vWcfRDurs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779664393; c=relaxed/simple;
	bh=ghtTJnS/NvCsA+vIBbl6m6PoiATZqfVB2noOWi3YZvE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KDw9VJcKMtu8/sg05Zpw92oINMN6N9FA0737M8u6RMZZLfB0vXp1osSvkuC82CvySVdm01381epU3JB3FkHvLaqOOu6HsmN2i/pnOXltpuC0E+wLNYVl0y13cN5y2o5QSh53KXQJKkcuxINAJR5BhQLHb4xsqhHgEoPVJd6XAdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rF44MUAO; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rF44MUAO"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-45e8a834cc2so4787285f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 24 May 2026 16:13:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779664391; x=1780269191; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y/iNeZb6FKh5gV3yvVj4pfC+LDioS88XVB83Lk6lMMk=;
        b=rF44MUAO8KEhY+cizRP3t7K+y1W4KyE4B/bEBU8qsdU0Cd4TfXq3hBvquTGH3PmTx1
         Dd4QhwFulASMGgmiyHlcsLPkVsH/eiKyLIywoqSRtC5RfbZ2r8LzXbSlzfZav7x2BOqD
         AEtm0N9wLdnBFTJkpc2d+JRrW8odhKWXsR5Vh4Ph+n+hTiPWms0kZybOztteG+XwPyn1
         Kulb7Ja0LxzFdMSUet/m6XVVmj7vFMW/dHeZA/k/nunbG4UYZZRnTA7uhM8BSZxNsEHd
         jDsjRrN91DgJPAL2a4ZWWYimpH16xTjfXPCJRKguzQdViALpTtuLcHVFuCoTOsLWPbSq
         U7WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779664391; x=1780269191;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/iNeZb6FKh5gV3yvVj4pfC+LDioS88XVB83Lk6lMMk=;
        b=JMD9ssRnhai47v7i76SyA8Jtp0wKwcAHfzHbXreiCrgtw9Kl36we+YjD22CcFTdXx8
         fZfxildIP3SjmwRfYPDoOgfe1BQqnYt3c/3BLpQAL3CKFQ4tU4TvDzbEW8wWEEwOktiR
         mIDWwz+o7JF4jh9/2E4bDi91mPKtNgoTIU/VNWtMVv8eFNLSmkgSAYZ4f1oOG7+zGAN9
         wgTJGg2WCQ0a9M9r+W2Cj2sOI2xsOf6UxiBl43I/WOHze4k1rHrsU17nTJdDXU2OEQZ8
         f/n4/wJfAD2liYjYMcpFeoFzzkE0cc15VCVD+LKgMrYtm7bMzyR3bP8JjctJWlTl4bh0
         trKQ==
X-Forwarded-Encrypted: i=1; AFNElJ/3BygkzkUWPVsFSolDe5QPYWdsC6qsKxZ26dfXZB3lZ9vhTMLRK9WD4E7JfVgjzGcG326sF0NZi8AHyG5z@lists.linux.dev
X-Gm-Message-State: AOJu0YzsoWQvozC3cUEUTzldImpyaQDVU7A6DGmQ+K7030bjt806dQWS
	gfU1hKO3I4ZqgP+SeXGbOKmPVMOkoPjWWKRVBxmDq2iX/R71pcxgCzds
X-Gm-Gg: Acq92OE9kM+3Qoi0RyZtOlKFPQ+GJUU3FG72tKRn91LV0l4vaKLJifJ/xjzkc3cUBTq
	BQgKP0BxkBdwCpyLogutbLzTHuBhG8eQEPjOlY/6P0fFTU+VDdczE7P1Ze58iu9h2QQNV4ePndq
	AYIY09UMFp7okFko1HRhxiGc36i3PD/t7lZ+o+Qw7L74J3WxlyRSZEpaIUPw89DVCqcf6UFjQJj
	ciliASCbEohNLDh5eYnibCcy87jj4JLKpWi0O0CTeNMWhXyL3sYOK30bP8FLk4fzy/fIFGkejE6
	Uqv77U6UfkP/+NZBPd3bk/0rlaSIfrWBc92Bf0W+nboDkjKcru40qP9dsLOZHVCHcFbFaoNsp1f
	i3CB6ntlCg203REEVxS0DR8GYh65J2mc1jJOULKlRrwmlXow304s24jtJjppINeEV3St4EHW7xR
	8Z/LKx0Kyp5vQ555edaQCH8bZVeS6gK5S0tEnUsdaqvYZ73/zNCOsoKIMpz3D09NeD7uBGKw==
X-Received: by 2002:a05:6000:480e:b0:45e:739b:3e3c with SMTP id ffacd0b85a97d-45eb36418d3mr18111822f8f.0.1779664390580;
        Sun, 24 May 2026 16:13:10 -0700 (PDT)
Received: from michalis-linux (adsl-75.176.58.251.tellas.gr. [176.58.251.75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6cce0a4sm21813310f8f.12.2026.05.24.16.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 16:13:10 -0700 (PDT)
Date: Mon, 25 May 2026 02:13:08 +0300
From: Michail Tatas <michail.tatas@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: sm750fb: Change camelCase to snake_case
Message-ID: <ahOGBLV2g5HUZrr6@michalis-linux>
References: <ag-XlRifxjqXF-Zx@michalis-linux>
 <ag_ucCZEOnZuJOCz@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ag_ucCZEOnZuJOCz@stanley.mountain>

On Fri, May 22, 2026 at 08:49:36AM +0300, Dan Carpenter wrote:
> On Fri, May 22, 2026 at 02:39:01AM +0300, Michail Tatas wrote:
> > Change variable names from camelCase to snake_case
> > as per the Linux Kernel standards.
> > 
> > These changes remove 9 CHECK messages from checkpatch.pl
> > regarding sm750.c, sm750.h and sm750_hw.c
> > 
> > Tested changes by building the module sm750fb/
> 
> Don't put this kind of meta comment in the commit message.  Put it
> under the --- cur off line.
> 
> Please wait a day between resends.
> 
> I don't think you're working against the correct staging-next
> tree.
> 
> regards,
> dan carpenter
> 

Thanks a lot for the quick replies, much appreciated!

Dan you are correct thanks for noticing, I was 
working on the main branch.

Some variables have not yet been converted, so
I will send them on a separate patch series as a v2
