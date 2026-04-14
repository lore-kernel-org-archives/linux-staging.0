Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39FB386554
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 07:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776153364; cv=none; b=X+q7NX7MwXXSR7U7DZ1hbb8zpC9NzcFeZkM2mFG5eodJNWU6iutLmRQfi06exBgMX3BNkK1d19fAk0pP1a7B16TmVjJXlgtzGlGUmuKvav/o0bu+NgQBBxRr3Xa7BT3EB4vnPCBWzXuFeq+Dq0maGqwhQ/hGO8KPArGWiw4jSGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776153364; c=relaxed/simple;
	bh=EO61ndOQWekXegEyX5t1VPcc5albENG0PHNwbyqWxsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NY93JgAgMpg+nXkMZqzkK4Mtl5kag4/O8cfxPzBAzwf7vvnlw5VeDntnlg67HqQfvS/MutFMxcTyjBB/A6I4QBAikBdHSfWkZNoHDzqWVu7JG01OOGtdgNXcgJvvL+gooJcOWnTY018a0xSSmNdKVx7DcdLVWX19Z/MXpQ3DxQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V3z8AM1w; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V3z8AM1w"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488ba840146so50864505e9.1
        for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 00:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776153361; x=1776758161; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=axgVeh28yHClCYz0L8M4AbQLJql6b8YevUT+Lu5qK7c=;
        b=V3z8AM1wVJrXkoxL18WX2IbWqtJ6JBTHWK/S92KgmNAVXJ454My1cWxxS/nPRYhHyq
         HUdQhXxAJztJE7FHMOvkFxBAoeq2YJvszFTw5vZQ6zeW2sETvB3hvUVeYVwycn8Ljkpv
         Dw9na3A1sm6C1z3u2VolhN/wfyhTbqVIZ3Iv6uUIE4ZsS/liR2U6xRONlfUgcy5ZzFfI
         8sb+rGLkLjVrZ8d3nLOKL750zj5Zivg6ZPzuGOfsxBMT4qStZoyDlDsjTX3j9cVwfxXn
         k4tDI6iocPrzuxgCEv7WQJUAkQIc5vpXZVZ/OIeFZs8yWwSgz27cX0ycQFpMqhShYA4w
         jSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776153361; x=1776758161;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=axgVeh28yHClCYz0L8M4AbQLJql6b8YevUT+Lu5qK7c=;
        b=rEpurzUKAqUU0TKd5wLJwMGO6g+dLaanltPRN5s5SfM7c9LQ52YQ6rnTUHm4bGih2Z
         Cir8gQuhBkcVe8FTTU8Ua9l+O7q+banqldkzvlVsrQedAzxGOG9bUvlWjdJAE0CncLoZ
         ftnQVZY2XkkcE7vDmNa6eLB+nCVt1UQs7gPZKefOCiVFTsreeUdqNwhvbCyplmDQuLAQ
         LjFmOUglOEmfYCv8WO2BWBW5ggPGlSfhoChOty2IIzC2TnERWMeoN+LzQWWXDTz65bAz
         0rzadHQB26zSSS2ynHgx2TrnfxrDkBjdp2B6giXJyE3+z98dOdEdwDgcewXhhYaerUEU
         osIg==
X-Forwarded-Encrypted: i=1; AFNElJ+BslZitccZnRMs27UhYSJu14ShlHcrYx/vNVduUtBumtp4ePCaeMESLg5gJLDJRtXYIgNK0M50D4EJ3xyS@lists.linux.dev
X-Gm-Message-State: AOJu0YwVD5m2apD8r6SiSOgcEWinvFG/0U3jCeP3607AYVCRBL0YK0X/
	VtiokzYxgQtatvN4NPz92aSkszIUi9z5smIMQUGldpbt018AvQ0j9ulg
X-Gm-Gg: AeBDiesj7etYu4tkAf8LtXMdNQVaydrxawrGPKcivP0QcxC/jkI3r8W2xuTXWdAC9cV
	aWl7wMN+8/agiO7WHyDfLv33aobdwXY+0e4c8IvT7zQUXO9EzVkPqDBqyGyzsCKn8sTCFSu2xMd
	ULFlIsdz9wvpc+xjJdJJD8UAZXl/MIPE8//GR5wlAzZ3h2+vBbAThBJNu/3LIrNim7wDO6l0fb1
	hY364BGi/zIvB/KmPpgF4oZgfwMnUDD26toLbI5xn1Aa1Sa8m12K0JRRz+RSxdPzB0DiFXvjoDk
	nAcO8qPo3lVLShlnkW3+gRQp9j8HMyPdzohKNi+0KafY0BZDeXczw85muKGQ066sRMcYQkBdVFn
	I6pF8Uu9bLhThE5GXkKa424tG+GVUO9RfUbZS0HukvhNLootbjH438cGEh6tp1ZNfvNC2oYZmTE
	9/IATQrUEgMHTGjkS5t65LsnYrOHJnz3dOnuH/
X-Received: by 2002:a05:600c:3f19:b0:485:3ff1:d5ed with SMTP id 5b1f17b1804b1-488d67bbc2amr205094565e9.1.1776153361269;
        Tue, 14 Apr 2026 00:56:01 -0700 (PDT)
Received: from localhost (hf33.n1.ips.mtn.co.ug. [41.210.143.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488ede24eb0sm32070755e9.8.2026.04.14.00.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 00:56:00 -0700 (PDT)
Date: Tue, 14 Apr 2026 10:55:56 +0300
From: Dan Carpenter <error27@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>,
	gregkh@linuxfoundation.org, ethantidmore06@gmail.com,
	nayana.mariyappa@gmail.com, s9430939@naver.com, kees@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: os_dep: avoid NULL pointer
 dereference in rtw_cbuf_alloc
Message-ID: <ad3zDOhTjfwy_vj9@stanley.mountain>
References: <20260413224417.5674-2-shyamsunderreddypadira@gmail.com>
 <20260414071308.4781-2-shyamsunderreddypadira@gmail.com>
 <ad3wxbGGPxxm72_6@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad3wxbGGPxxm72_6@ashevche-desk.local>

On Tue, Apr 14, 2026 at 10:46:13AM +0300, Andy Shevchenko wrote:
> On Tue, Apr 14, 2026 at 12:43:06PM +0530, Shyam Sunder Reddy Padira wrote:
> > The return value of kzalloc_flex() is used without
> > ensuring that the allocation succeeded, and the
> > pointer is dereferenced unconditionally.
> > 
> > Guard the access to the allocated structure to
> > avoid a potential NULL pointer dereference if the
> > allocation fails.
> 
> You have a procedural issue here: please avoid sending a new patch version in
> the same email thread. It makes things harder to follow. For example, I usually
> mark the entire thread as read if I see some comments and don't want to go into
> the details. It effectively means that I will never see the new version that
> already was in the same thread!
> 
> ...
> 
> > --- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
> > +++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
> > @@ -194,7 +194,8 @@ struct rtw_cbuf *rtw_cbuf_alloc(u32 size)
> >  	struct rtw_cbuf *cbuf;
> >  
> >  	cbuf = kzalloc_flex(*cbuf, bufs, size);
> > -	cbuf->size = size;
> > +	if (cbuf)
> > +		cbuf->size = size;
> >  
> >  	return cbuf;
> 
> Now to the code. This is still buggy. The problem is that the size is not
> validated and when it's 0, the same issue (dereference of invalid pointer)
> will happen.
> 
> Dan, JFYI k*alloc*(0) returns not NULL and not valid pointer.

kzalloc_flex() basically can't return the ZERO_SIZE pointer.  You
would need to pass an empty struct, which is really rare.  It can't
that here for sure.

regards,
dan carpenter

