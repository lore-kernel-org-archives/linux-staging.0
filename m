Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5220D37B00E
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 08:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776413141; cv=none; b=HuCQNeWYZzlguBDtlxnREWo2vYYBR8R0VSYcT0ytThXKvPCGgNRQs6ntBfcb93Pw8hCY3XKqnSTBepkAhDMNPFpOm1Q5EutdZq6L6yCmSW4/ya3qEguPQWPul56kwrDtoi6gWhbzVSbOoySTat5O5sLfLWLUHAH913teFj+AUok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776413141; c=relaxed/simple;
	bh=1AwS8Ldg92WK4KkmlNu1UjhcVxODuBNMsNe67KvbGDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SP6qfFqGz7NttIkkIwxNy3INHaWx3J2jFodNvDb88MJHNbNvsmcPl9Kxa4X7usypYyROh/0CBnzRjMrvxINQj6axz722xrMKLsrHO/KwmHq5QyGUeH3I480SMjsRTnE7bfxJ0xiVDADYq3/aP6NNuOCC1WXb4GskRNpdjILG/64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hCFukvCv; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hCFukvCv"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso13054635e9.1
        for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 01:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776413139; x=1777017939; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GujTxUaku0DnUDB+OcwhQi4lfujIDMhc7CTwSfLTqrM=;
        b=hCFukvCvOFeX4bPlvtMlvXpBLBKSGNhAtBFEH/rzWWkI6zVHnMvxuWXIdPwSc8ewmk
         kFc348tn+MWoEXzyige0tOEQzBMhqDiqzGdw8ls5Kci/ERamtu134IrmXdVauFfhSeoY
         B6wix13kyyMpLKHcL4MrwVF/Kw0gJ09o2n8Wbjob4Ad0Gl+FCIWCI7r9FU3Vt9UQjoZf
         aHFDcc3J92SxSHkwDVhFgZoeJffa2oZAYtMW/ATOsH+K09R7iBs/ZOeOCshVgj+3dj9z
         muxOtrJJOc2CoGoNU3QsV+tzy0mVVdQlz3jVJba0hIGhjI/J08o4dBmWZ/YoZUSYa51i
         R+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776413139; x=1777017939;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GujTxUaku0DnUDB+OcwhQi4lfujIDMhc7CTwSfLTqrM=;
        b=oI5W9QCFIXUp8bLlpWBDzeDU6F2sJkK5aW2+fjhFtR4+W329W39NlmwiCcWVOqPLHo
         A0DX1B7INBQ3Bz3Uw6vzTEyHAiNH1oCVV6S+2M51DL7dX5rOeQGXfCMBYh9P4bsr/qTT
         /ozCKA3UWGZWuXFr9GvfqGtZBN8malZITva9k4mTrvMlwclsEyhR+A/RI+pV2M+7yn1d
         e9q/cQupQom2j3BnEs8hniyO3gX+0v/Z+2A2ma7a7MDkh9p3YNJa+V8G3lpvUXmI7Ujf
         0HqjEf73T7mN1yop6CJUaxfXdHNRHQuZWl7Glr8mG9dEOs6XERjyr79T3h3+ceuPXlen
         lijA==
X-Forwarded-Encrypted: i=1; AFNElJ+OSGoxPTyfGlujKCZxyV5Pz4z/+HjBDVBAH+b1F+4B2H33ktRXAeR2aXeb861JwHHmwGwqSxEjECQ5q44b@lists.linux.dev
X-Gm-Message-State: AOJu0Ywt0fXnXMhXWXtU3dr1LGhd8ZnDm4xipz4OPzmyWZtRNnISk+DH
	BwcICB8kbVYK5NywT7bjGy1YDmiutejSEAuRqmIPylQt0YkpxbmJMrE/
X-Gm-Gg: AeBDiesBSL1nMbXzeVU+EJIm4Yb4tk7Ut45wiaCf76p85PXDmN2toJRtYe/ujm4vR0x
	YzQvSHejfjv9xyKg4297h+BDy/W67jmBnecO+/sj7TXzDqUfIKg4L/NtRKEjDE3g314MdahqKOS
	DX6ubrj4bZ8CYLyhEGG67/BL/7QsoCpHrb7RnKsJlAF7uGjDFae1IHzA+5/F3Zi8XoJ0ilSSfc9
	VnvyQeScWtNNxgCTxuJ3/w0vUXj1qPuOtpM0GmifspSSu1xxydYlYLcz9fZTNErfrrkC5vZtCUA
	mJXvjKt6SzW9Syi7RO5SIiSBp6NxtlbOS3hgSWZA+dLmCyPpbThKwAvfD18FD29S0gdVj7DmZV8
	ujseEfnSsrISmCs6Nm1KXmXb49CjfURARH4WqYJGp002F0SQTnsaAN+9T5aB1GrNyTMlus19n93
	BsUx2df0lxHYKPkHAQeLb4CcFCf51NOw==
X-Received: by 2002:a05:600c:870e:b0:488:aa33:dc8f with SMTP id 5b1f17b1804b1-488fb84ffb8mr22012425e9.0.1776413138495;
        Fri, 17 Apr 2026 01:05:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc1070bfsm25752445e9.7.2026.04.17.01.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 01:05:37 -0700 (PDT)
Date: Fri, 17 Apr 2026 11:05:34 +0300
From: Dan Carpenter <error27@gmail.com>
To: Huihui Huang <hhhuang@smu.edu.sg>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: ipu7: fix boot_config leak on
 queue_mem failure
Message-ID: <aeHpzkBvclNESSUv@stanley.mountain>
References: <20260416074800.2493565-1-hhhuang@smu.edu.sg>
 <20260417073939.2686170-1-hhhuang@smu.edu.sg>
 <aeHo2WOF1Rcp9zwf@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeHo2WOF1Rcp9zwf@stanley.mountain>

On Fri, Apr 17, 2026 at 11:01:29AM +0300, Dan Carpenter wrote:
> On Fri, Apr 17, 2026 at 03:39:39PM +0800, Huihui Huang wrote:
> > There is a memory leak in drivers/staging/media/ipu7/ipu7-boot.c.
> > 
> > In ipu7_boot_init_boot_config(), boot_config is allocated by
> > ipu7_dma_alloc(). If the second ipu7_dma_alloc() for queue_mem fails,
> > the function returns -ENOMEM without freeing the previously allocated
> > boot_config.
> > 
> > Add the missing ipu7_dma_free() call before returning on the error
> > path.
> > 
> > Signed-off-by: Huihui Huang <hhhuang@smu.edu.sg>
> > ---
> > v2: Reword commit message in imperative mood. Remove unnecessary
> >     NULL assignment on the error path.
> > ---
> >  drivers/staging/media/ipu7/ipu7-boot.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/staging/media/ipu7/ipu7-boot.c b/drivers/staging/media/ipu7/ipu7-boot.c
> > index d7901ff78b38..495b3e05a9b1 100644
> > --- a/drivers/staging/media/ipu7/ipu7-boot.c
> > +++ b/drivers/staging/media/ipu7/ipu7-boot.c
> > @@ -263,6 +263,8 @@ int ipu7_boot_init_boot_config(struct ipu7_bus_device *adev,
> >  					   GFP_KERNEL, 0);
> >  	if (!syscom->queue_mem) {
> >  		dev_err(dev, "Failed to allocate queue memory.\n");
> > +		ipu7_dma_free(adev, adev->boot_config_size,
> > +			      adev->boot_config, adev->boot_config_dma_addr, 0);
> >  		return -ENOMEM;
> 
> Adding a free here leads to a double free.  It's the same issue.
> One magical cleanup function in the caller.
> 
> I haven't looked at this but I bet there are bugs in the error handling
> since magical cleanup functions are always buggy.

Btw, if you had kept the "adev->boot_config = NULL;" assignment that
you had in v1 then that would have prevented the double free since
ipu7_boot_release_boot_config() tests for that...  This information is
not useful to you at this point but I'm sure you will find it
frustrating.  :P

regards,
dan carpenter

