Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FEE438DC65
	for <linux-staging@lists.linux.dev>; Tue,  4 Aug 2026 12:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785845450; cv=none; b=e8uNx8ahTsOZ4523m/e+hmgYKHxnU+huycA4kFjE45uYTBhyro8sThy/9+HO6xA7OsTOTJGcWnqTgd8nst6fkzZtbsn5cJBRetWsSgsBJzAmDFuDj+vn4CgLDYeWSLQUZjiZhGqEWs3OqkUUNRzEBXXEUR2x+kyJlzQu376Ox9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785845450; c=relaxed/simple;
	bh=UVcZ8TZVOO8MxzMJhucuxEeLaGW/RR2rfo/mzbWKJAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ICJcvoJgWVQ7JPNc62YOw5lU8PpxTnCWc66m3mpEHDuTUTYgvCkkACZ78OnBSN2kzhWaIdPA5omf5Ou0IzB6HWSuXdddRW34dCaJdxtPaTIdM1bXR5Ct+Ql/VlIctOzecyWvkuT4k1b+zx9OeCS4iFilOEXoGrcQZMueoPinSM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=coxhfGHk; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="coxhfGHk"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso47688555ad.1
        for <linux-staging@lists.linux.dev>; Tue, 04 Aug 2026 05:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785845449; x=1786450249; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5YzKl/HTx9hxe4H/h1xhyOcFbjFzNfWrOyFbMdFBHhY=;
        b=coxhfGHkTpqioJBlbXv3LYPGL/SxWkB9Ev9TpYXiVIOnk53etNbShIi83lMynbSpvA
         NAjHfYTbVXrSfxwIpUEkwtP7yDdK7Chl+/UborHDeIGVw5cHYMJQtuBNorV2ZQBz/ku0
         9Ytvk1kVEeXVxvzgCfnikK0ZMBz7KHIfL8JapJaHYn7mvtPmu4CinKwiqx2+ldvzEeWj
         gLEsVFEhT4zxbRty/mKe87CfnqIm9aj3vuoE72WsZ963ZsTYE6vPnLiRv+OjsVZPCvxP
         W5nK2Hm+ZplerstY0EGzQ5VEmDazhlRAY5ITQqf+uIqq3aosNhn8DVL3GS2RoyD4JYlQ
         nYJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785845449; x=1786450249;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5YzKl/HTx9hxe4H/h1xhyOcFbjFzNfWrOyFbMdFBHhY=;
        b=c9wkH4QBXT3qqrFRrBcFuQr5mKF+QSK55xx2zj08tXhz7FWUMX9936eJvdMUNHNEcs
         GNXj9brSs9vxCPrEEr58MFIUYb8XCZX+hEOstRKb5rh3CN6L9kGkY3gCY69lWnAgH2Wt
         E3Gc0r1ISI9n6mIyEWiKs7U3U77ZFG4/rboGCka7BSyjIZqJKk7/LaTL810HLCRGePes
         p986r+lB1QExlCo296d3uAZoHN/oW/dVTTvQiOoqp5Heav7I6e71udQlQXFKQl98I38D
         Vhn25zK4G3REWthHV6GkKdb5OBbs/+DzTtDjvYQ3Eb0Ox9s9JQuX5jYgYfVsUTPrhL58
         8LvA==
X-Forwarded-Encrypted: i=1; AHgh+RqnvWtm07Np6EpMO/BQd0i9erFVo/erY0PPaUdflJZ/v5zBSWMkwqMR7Dl/yI0qS0YuakDMyZs+Nci6FmEy@lists.linux.dev
X-Gm-Message-State: AOJu0YxbvBYRd6FP2rngXPR94nNovOs4c+Fs+myn0kdIDO+3AVBBpl+v
	2SQrkGx7/onBypoevXoHswmE2/UhZ31p1degvSnOFHhiFBoyqyOtPXlq
X-Gm-Gg: AR+sD11hSrr/hvyPwEh7qNtEHeW5tLuwPUodl5IMeYW1tCHXINlQutuOSNwz8q7F30t
	Opl+lu5sdKutbVqwMilFNg6CYQ0Cf+4FHPWRqRfK8Gw+T0AUAKh5AV8iyfv4l0bn1+xib/0K7wX
	mTDy7mXuf2gex1Lfu8LDTQWqYwll3jPeCM9q7fUfS4HuVmIg0SuAlNMaUjZDggdFkhornPYGrse
	XjJ3ZWAF6NkTwZtZ2CN9I8mJvlYttRu7zwmzhIT630iwhkrle2Gs7pr3ph5460R5y51cND0R6GY
	CATfFz77T0fy/KXlny+d8mkh4KKdb6dEAYIwA8GXRq/ENOSZhwc9lWFpzhnRXVCpbIa66F0ZMiI
	g5WWAExd+nKLbmpH+GhyDbDRNpz/lNrRu7gV+x6PPsiM2C5UY5svqxthD4CJUoW4vYbXEieRntJ
	oJSMBTeEK+bSQjBv21ttpDQxTzoGfoYnyhlbHFwjcYDgVGdbVC7Z/g0A==
X-Received: by 2002:a17:903:19e6:b0:2c7:f2c6:89e0 with SMTP id d9443c01a7336-2d0521eabe6mr152709145ad.4.1785845448701;
        Tue, 04 Aug 2026 05:10:48 -0700 (PDT)
Received: from localhost ([172.216.252.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0a9f8fb4bsm6289705ad.5.2026.08.04.05.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 05:10:47 -0700 (PDT)
Date: Fri, 31 Jul 2026 14:55:24 +0300
From: Dan Carpenter <error27@gmail.com>
To: Mohit Mishra <mishraloopmohit@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix underflow logic in swing index
 calculations
Message-ID: <amyNLGjym9jzB-NH@stanley.mountain>
References: <20260729172707.13333-1-mishraloopmohit@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260729172707.13333-1-mishraloopmohit@gmail.com>

On Wed, Jul 29, 2026 at 10:57:07PM +0530, Mohit Mishra wrote:
> In ODM_TxPwrTrackSetPwr_8723B(), the baseband swing index variables
> Final_OFDM_Swing_Index and Final_CCK_Swing_Index are declared as u8.
> However, their calculation adds Absolute_OFDMSwingIdx, which is a signed
> 8-bit integer (s8) and can be negative:
> 
>     Final_OFDM_Swing_Index = pDM_Odm->DefaultOfdmIndex +
>                              pDM_Odm->Absolute_OFDMSwingIdx[RFPath];
> 
> If the resulting sum is negative, it underflows under u8 rules (e.g. -5
> becomes 251). This causes the lower-limit checks (e.g. <= 0) to fail,
> and in MIX_MODE causes the logic to execute the "BBSwing higher than limit"
> branch instead of capping to 0.
> 
> Additionally, in BBSWING mode, the check for CCK underflow mistakenly
> examines the static struct member pDM_Odm->BbSwingIdxCck instead of the
> newly calculated Final_CCK_Swing_Index:
> 
>     else if (pDM_Odm->BbSwingIdxCck <= 0)
> 

This is a separate thing and needs to be in a separate patch with a
Fixes tag.


> Fix this by changing both swing index variable types to int to enable
> signed math and correct branch selection (aligning with the TODO item to
> convert remaining unusual variable types). Update the CCK check in
> BBSWING mode to examine Final_CCK_Swing_Index.
> 
> Note: The fix is scoped to the calculation and branching logic. When
> passed downstream to setIqkMatrix_8723B() and setCCKFilterCoefficient(),
> the values are already clamped within [0, 42], fitting safely in u8.
> 
> Compile-tested only; no hardware available for testing.
> 
> Signed-off-by: Mohit Mishra <mishraloopmohit@gmail.com>
> ---

The type issue is fundamentally a static checker type bugfix that
unsigned values can't be less than zero.  Linus's take on that is
that this code:

	if (x < 0 || x > limit) {

is perfectly fine and readable as a clamp even when x is unsigned.

In this case the commit message has a lot of extra discussion about
how the math could lead to a negative value because we entered negative
data or we had an integer overflow etc.  The result is that we clamped
it to zero instead of to the upper bound.  There is no evidence that
any of this is possible in real life.  And also if it were who cares?
Zero is a valid value.  If you use a complicated integer overflow method
to get zero instead of just doing it the normal way, the result is the
same...

The code is pure garbage, of course.  I also have written that choosing
u8 for this type of variable is dumb:
https://staticthinking.wordpress.com/2022/06/01/unsigned-int-i-is-stupid/
I don't object to fixing this code as part of a cleanup but the commit
message needs to be more clear that were cleaning it up because the
code is garbage and not because of some kind of complicated safety issue.

regards,
dan carpenter

