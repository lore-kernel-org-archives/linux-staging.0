Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BCE1D1506
	for <linux-staging@lists.linux.dev>; Mon, 21 Oct 2024 20:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729541231; cv=none; b=Bnhyy85KXGPhSrq+rGwUUO0PBuTaoQMTkcaxKAWPnC7uta6XaXgtK4+8OMVbFzgwr6hEuZEafOP0aQ7s7Xwc55umHg/Rc0vj/pVnzg+lTxycgtjc9kNjq2E3inEUroH5pkFlAOyYLPUEDGIdCGBB8JzoHG7RLLHMg7axBSXgF6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729541231; c=relaxed/simple;
	bh=YN7c+SicrNCrOI714T65jBaZeIjvfcTiodCm2u7dZjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E2pSEFqQGzku3Y2JhE779h5p9XSGGwGTVjIYP01QZvMejRdBk4oQPpXg5Ppe0haUKBXOTp6e4yz5yG7h7GK6nmqkfGP4mqFmDrEcUMcTA0KU2qo1BOrSHotYrmr4dQvAHrYc9X+0/MfcLxvZegUp/w+qbb0fKxx94HNJT8LKGlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hZEw3NWT; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hZEw3NWT"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4316a44d1bbso21546705e9.3
        for <linux-staging@lists.linux.dev>; Mon, 21 Oct 2024 13:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729541228; x=1730146028; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L3PomcoWryCCzwy7sYRWrSmRynSxSz+3fmsPzcL99BU=;
        b=hZEw3NWTOaIxOB2ja30TQT5Nr6fQxMhqZniHD34WvPrSAi/CvXN6VVgi08YmLeH3ER
         mxK0UW0bzJxz71+NjtiJHNRShJhmuMZZ2xRLsIdawwKC9sd+hbfsE17T9eaKmog9USDm
         nNXQ9I0TXgqURaZSsxJWNmjP5xPTQuytLIrZHVFWcvy+N1pYgmpHzNKN3N1Zs8jNdpMA
         xEDLOHgT74HP44tFmfj0B4RJ7YfB2YhugesXk6eDINPeRIhP22thH4CS56cSztHBxHeg
         V9FqB9BqHkW0X0bsD18qyGm3HQqtxmC8ku42vXdromtyGkiFVYIHys5JOPCDMNAMFSjX
         7ZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729541228; x=1730146028;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L3PomcoWryCCzwy7sYRWrSmRynSxSz+3fmsPzcL99BU=;
        b=EIjdEKi6wCISuyzI5xeJ6enEUKXUhrskDMlna7sqY++EEv5DjVV6Yo7eYGllrEGV13
         uV7lgWNfOL5Ji20R8RBSaRLJLNj3u6zsjFRljuazRIgo7xi03LADtyuV0GIuQI/uVo/n
         RGzyHVJQzD/kVWwHSc58iJsNqyMXw5HHIy5kDrpg7lSRTco+BQqbfoVOzwxjb9h5HEYs
         y8ItDC8BKJaJLO1v7NfCsAanpAduDntNumHOU/qvf39V7MSCgTKKV8LMDepghnmsrLiK
         dB+9mdPD4BXdPYc3k5mVpJcG0Vkurm5R6acpg56E6Gpkc3CMl066uHo5jgKm1UWhYx8g
         p3vg==
X-Forwarded-Encrypted: i=1; AJvYcCXD0/ldudZMx41EZiamny23Ed66PORI6MW2Sz1iFT8GXorm+DM1qfVmkh+4YvCJj05r2N0titunOL7ANd5d@lists.linux.dev
X-Gm-Message-State: AOJu0YxXKtg+U/5oWtXHAXFok0Ntk31ENh+8TsMT26Fnmre9SOQzsOWt
	pexItME5PJ+7BmyUvZkH6hChyT2Gnvttx1GIYBWTBPTPwWxvBAoyCd4VsmUJqf0=
X-Google-Smtp-Source: AGHT+IEsguBbbXSd3UhDCvdEdmL5nLBIlu7Q0M+pLxOpiuVNd7Lk8r5NGGzjB0Ud32pOW5Lu0daG2Q==
X-Received: by 2002:adf:fa4b:0:b0:37c:d1b6:a261 with SMTP id ffacd0b85a97d-37ef21c9902mr197770f8f.59.1729541227848;
        Mon, 21 Oct 2024 13:07:07 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a37b35sm5079648f8f.2.2024.10.21.13.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 13:07:07 -0700 (PDT)
Date: Mon, 21 Oct 2024 23:07:03 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kees Bakker <kees@ijzerbout.nl>
Cc: Dave Penkler <dpenkler@gmail.com>,
	Linux Staging <linux-staging@lists.linux.dev>
Subject: Re: [PATCH] staging: gpib: Add missing check for NULL
Message-ID: <984a92b4-5e4e-4330-8af1-7d6b4d093a7b@stanley.mountain>
References: <20241020192243.C6A0F18DA7F@bout3.ijzerbout.nl>
 <4a049f7e-b852-4b69-bfd7-1a4ce3dccbe8@stanley.mountain>
 <95bf0807-5f99-47e3-b926-cdbe794016b6@ijzerbout.nl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <95bf0807-5f99-47e3-b926-cdbe794016b6@ijzerbout.nl>

Actually I've reviewed it again, and I think that board zero is supposed to
always be present, but that might not necessarily be the case.  I'm not sure if
the checking in close_dev_ioctl() is sufficient?

Personally, I don't have a problem with adding a NULL check, but you need to
sell it better in the commit message.  Just saying Coverity says we should add
a NULL check is not sufficient.  Anyone reviewing this code has to investigate,
is Coverity right?  How can we trigger this bug?  If you did that investigation
for us, then we would review your patches more generously.

When you review lots and lots of patches per day, then you develop rules to
avoid wasting time.  And one of those rules is "We don't do things just to make
the checker happy."  It's not a rule that I invented, it's the normal rule for
almost everywhere in the kernel.

But if instead of a static checker fix, you sold the patch as a clean up then
maybe that would be fine:

    The NULL checking on handle_to_descriptor() is not consistent.  The ibclose()
    function has a NULL check for this exact function call but it's not checked
    here.

    It turns out that the zero board is always supposed to be present.  It's
    allocated in ibopen() and freed in ibclose().  So, really, the NULL check
    should not be required.  However, the error message in ibclose() suggests
    that desc could be NULL in the case of a bug.  Let's just be cautious and
    add a NULL check here as well.

To be honest, I don't know if that commit message is good enough to get the
patch past Greg but I might have been sold by something like that.  At a
minimum it shows that you are invested in the code and we tend of give people
who care about the driver more freedom.

> If we really hate to add that check, then there can be two alternatives
> 1. add a comment
> 

Adding a comment is fine.

> 2. change the code as follows:
>     /* There is always a board 0 */
>     desc = file_priv->descriptors[0];

This is not fine.  It's an example of making the code uglier to silence a
static checker warning.

Btw, don't get too hung up on silencing every static checker warning.  Kernel
developers are good at fixing any real bugs so just look at how old the warning
is and ignore the old ones.  It's not like there is a shortage of real bugs to
fix.  For example, in open_dev_ioctl() if increment_open_device_count() fails
then the file_priv->descriptors[i] is not cleaned up.  It can't be used or
freed.  If ->is_board is false none of the file_priv->descriptors[] elements
that come afterward can be freed either.

regards,
dan carpenter

