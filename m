Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838D447FAFE
	for <linux-staging@lists.linux.dev>; Sat, 17 Oct 2026 13:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792244789; cv=none; b=fDNuLRO2UdXXZyC28hWkXKiinZg/UDwRMRkxj0awtJdYHL9+1Gn7F9qCiq/qPe+4vgo1SUWoJpcsYfZhhUG6oyaHBlm52EIriyG8PmX7+fkAqGfY+kLfblgyRa8uCfOPc+1nqJkL2XN+XMbtEit/73MJNPFXQOgjt1kVBmgMf3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792244789; c=relaxed/simple;
	bh=3DPK6cH6FljcWcEzc8QBsxgrvL5qSlEw3yTx8FrNJmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M7oSS1op/JOdBxC10qXiCfg5mOKN5qwxZRa7eAG/K+w0xihvHy+KvI8ZIwl/pJ1MjebxnbMhP9EnWRp3w1RXNhwTmO/i2HkEyhzqPWIbX69Hjfk3OtA55CGn5CKURc6tN4IKpgqZRE7S1LkZV0y9vECDKzZaGS9EZBTHZZADTAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HKIrIKvp; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HKIrIKvp"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35c76e9614aso1323155eec.0
        for <linux-staging@lists.linux.dev>; Sat, 17 Oct 2026 06:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792244786; x=1792849586; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BF3VtQyRsgICOKVzKwtZMUAurVHYZDeyL4UhBQXKZWc=;
        b=HKIrIKvp/usdR19no0pbdygwsGAa6Z+BBp4I5UTYShZln4xde6IMtfv/3cjWikUGDK
         HHBJwO/yQdQ8aeMme40ppNUNy5JNA1cCmXTQLmzFTNzevcMZbuu260kkQ+t+RR+acd9o
         Ph47FhbjTUdqAzFnhhddYO12+/o8By1FBvLp1muA6/FzM5DJErzeDqzFKYovMSG1YpsK
         wb73dcD9vqzTRSHprdaRVzsDquIMDcxepQBHaM2GeabHOHNDy0DSq7cDgDpQszlmptA+
         Oha1r/IrYBtOBHRIAdqePFpdSNE13CQ2msvpFnMZuBWxLVY3WnafX1xBsOCVbonDZFZG
         4nUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792244786; x=1792849586;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BF3VtQyRsgICOKVzKwtZMUAurVHYZDeyL4UhBQXKZWc=;
        b=ChfD6Z+aBnONO/RioGzgfIawhJG6E57qmJORT2v9QX//VTjiY85O+kahki2Q+oj+b5
         RBswmW7aL/5tbh80JjJwsWXKkoHpstbOnH7YLWZ1xjxwb+qO0glRYBDZNF9EyuhajKSY
         awvccXNB7tGCzsog5d9/lSl3R/b153tAGWqdEf6pkPfixt5A9dsOosQ3pHH0kFCqbcij
         Bvy68HgR7gfPkuL8R1gotwG8PQMZ7ZIQcTR/u5nK0SWyhabKWnZzF9HSUnJ1LUUIpzUL
         NkVe9ojMCy1T4/C5tgLYvdJEnQwp0aVL8RcOpTcgnLdcruwltOgighK/i0qGB09mxULM
         aFvA==
X-Forwarded-Encrypted: i=1; AKwUvByU8RoPXe6pWGcKvKQz2zk41J287aETaijKaLQTB4QGc0vZ8cEJfCb7PPHgiDWabXmmvK35eB/iPGITbTIG@lists.linux.dev
X-Gm-Message-State: AFq9FYKkioBMwNxUPZKncnE2lnObfF7rF3Pq84vq9EfFCYs64R+/3Piy
	XlXQQLKIcx9Ebo4DaAg93o8XJptoEVnfKJuKCGycH92bqoky8K1l/JAl
X-Gm-Gg: AYBFou1sojBA6yy8vbhG51U7+EAchh+rPce78ms8IAU/O++ht+V3WJUn/LqhjhPXBLo
	wYOzZPQHRYewO1NIXt6/1bxuMdkJkgMT7Sksy1bCMFTS6RUA/8Sz0qvl0hbPFCb67d9P1y2Z1ff
	QGqZmIVbG9ys6eXBtuAeF0E+L3mGEAZfH6fje9LRqwpx0nlYjMaJkksXB5AzbStALUTtrsq33jr
	Wez9ZsGvSKGOliPoRrhDjeZ2dNOJY7bYkX6krY1EqIvChtZh91TIOioT7BWMj0J8vaRyy+FLvrG
	2ZfUjH0eEdFF5VGSuawsKgDPbg6Zic9ng3K13mFau0XgJcATP++8ta96Ly3YFCgbWOhZaIGI4UN
	7OfTmx8Q7J6skYyDq2H1uo8Lxa1tA5Evf0LWkq27k8H7zKYDkahSGxZiON9SSP+ST4PtFbe4BjL
	L9cCoMBgP5JKtgPDsZglVUJr+rsQAZWxMZifRJ+Sb60prkwF4bgHRhreM4Ai7NoEY1hFSTGymeV
	7nN
X-Received: by 2002:a05:7301:fc09:b0:34e:e7f4:cc78 with SMTP id 5a478bee46e88-3619ed14879mr3861986eec.5.1792244786348;
        Sat, 17 Oct 2026 06:46:26 -0700 (PDT)
Received: from user ([2405:201:c052:b00b:be87:82b8:3e01:5e1e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm20337821eec.3.2026.10.17.06.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 06:46:25 -0700 (PDT)
Date: Sat, 17 Oct 2026 19:15:57 +0530
From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: johan@kernel.org, vireshk@kernel.org, elder@kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH v4] staging: greybus: replace PTR_ERR() with %pe in error
 messages
Message-ID: <atN8FallRb8IbXT0@user>
References: <20261015082238.65187-1-pavankumaryalagada@gmail.com>
 <2026101707-routine-hatchback-4a35@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026101707-routine-hatchback-4a35@gregkh>

On Sat, Oct 17, 2026 at 01:20:39PM +0200, Greg KH wrote:
> On Thu, Oct 15, 2026 at 01:52:38PM +0530, pavankumaryalagada@gmail.com wrote:
> > From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > 
> > Use %pe to print error pointers directly and display their
> > error names.
> > 
> > Keep PTR_ERR() calls when the numeric error value is needed
> > for returning the error code.
> > 
> > Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> > ---
> > v4:
> > - Return error codes directly instead of storing them in ret,
> >   as suggested by Julia Lawall.
> > - Remove the unused ret variable.
> 
> 
> Hi,
> 
> This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
> a patch that has triggered this response.  He used to manually respond
> to these common problems, but in order to save his sanity (he kept
> writing the same thing over and over, yet to different people), I was
> created.  Hopefully you will not take offence and will fix the problem
> in your patch and resubmit it so that it can be accepted into the Linux
> kernel tree.
> 
> You are receiving this message because of the following common error(s)
> as indicated below:
> 
> - Your patch did not apply to any known trees that Greg is in control
>   of.  Possibly this is because you made it against Linus's tree, not
>   the linux-next tree, which is where all of the development for the
>   next version of the kernel is at.  Please refresh your patch against
>   the linux-next tree, or even better yet, the development tree
>   specified in the MAINTAINERS file for the subsystem you are submitting
>   a patch for, and resend it.

This v4 patch did not apply because arche-apb-ctrl.c and arche-platform.c
were removed by commit 2f75b2eac999.

The fw-core.c changes from my earlier v1 patch present in staging/staging-next.

Only the change to uart.c remains.

Should i send a v5 containing only the remaining change in uart.c?

Also, should i keep Alex Elder's Reviewed-by tag in v5?

Thanks,
Pavan

> 
> If you wish to discuss this problem further, or you have questions about
> how to resolve this issue, please feel free to respond to this email and
> Greg will reply once he has dug out from the pending patches received
> from other developers.
> 
> thanks,
> 
> greg k-h's patch email bot
