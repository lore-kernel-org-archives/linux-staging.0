Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ABE81E0DAF
	for <linux-staging@lists.linux.dev>; Mon, 20 Jan 2025 15:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737386124; cv=none; b=jTVWf1ln18cQTe32Oeck6nihOCxHKwJ3N4Q+/CoAYMCX8K9SLqJ5KRcX2S0NzicwUqLb4j/3JdAqzkfkeF2+OdJjYpt1ZSPbC9Nq9JTYXHQqbayuQT8xcihIMl6upTDfXCSaansgRtJSc7FT4huehvHv1PBjuKS32QXBoBGFmvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737386124; c=relaxed/simple;
	bh=pdfD+WMJzLpldEAxMBN+beptAi+MOuTFE9aVXXo20RY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VZ9OO+uOymbP7oh0e3xkrpctnhhIf5FmPOW0CD9XNzAkwIJfcg3ey+yNzBIKvOgdGEBV/CE+FedPYzkuoatNVhooOXAyARXYBihjrlcfZZmWycDlHi38O0Y/lsSrSy8sf1TP/auMVr91Cmh7z+D7XZlN7TDN8TEaMGp3UB1SL/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fUbeUGiR; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fUbeUGiR"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-436249df846so31091685e9.3
        for <linux-staging@lists.linux.dev>; Mon, 20 Jan 2025 07:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737386121; x=1737990921; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jCi2OnTM5qC2jJdB+QtoqWue7Uopuli4sTbtNpaftoE=;
        b=fUbeUGiRiinnKEz6uykCGZNDODZ56cKcXNYgurF5hf4e0axDDpmZRIVeeDha7a93k2
         E/g66NhDEZtqYXtjOShlUMEET8zSbgSDgUf4quLwzjexKxdae3k9TTOtbYtjFRA5bvQ3
         mTcaJalzCRbG5MnmldkwzzFT8fD6LzwqAWO2sxqlOX+sIDRfe6V1TRyjwgOfy26UfNSK
         n4H7eczTuizT5s2uhHKVTiFikdFCNdvWl9V1alT58FelM9eQisuruuEGxKbwNJGA8tN9
         B2AL7+7OsbtIozJx8tvHYS9KtiaDvvNzIpIMzlW6HOgk7rY01dm4YCicO2yNsJLZrJHJ
         EAhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737386121; x=1737990921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jCi2OnTM5qC2jJdB+QtoqWue7Uopuli4sTbtNpaftoE=;
        b=rkNh4ulMmSlMnkPoOVknvxlsZJLdaeGJ5SlI2hyaKHCQdoKoADBaHQ9i1JWRxkQKtD
         OM6ac6fSBlI9t99hOFNOFdTUr9xdrP13sp5YQBC3un4m6CewCe/i3NmziCnxfcyYkliK
         yfWvnN2zSjk4YOxrwr0A60OrroufqJ/iWn5ZzrxR6u/2PqIlpk7hfAX7X0cgcnkkuXUX
         LBBph9wDB/1ifQmbleJQrZgJGE2d0NeaNQrIPXi56KXmAOl33/mpKHRkcDnRGz5S/Pfl
         BqqeruVMXzfqcrbJhOv7KnAv/Au0rvp2tVjzVd+Fm/NfkMrnCCIwtjwXVaQ3PZWog0IO
         67Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUGHhG+XkxnWaCWrNs63Gs4H6SPO0BdDWQg/YC8AWroW7y9RYKbS3cZPFs9X2s2mvpTZ0M8ldFNjwHev4XI@lists.linux.dev
X-Gm-Message-State: AOJu0YzhRQgpqkXCvGdRSyAU1XqimmwquDHS2ZZbDYVeZfTGcCo+aPiK
	E9l0a3dy+xVidU3V+qju5fWCmi3vuhcOsEegG7HVMmlmNgSDzcgy
X-Gm-Gg: ASbGncs638Wvxvrlq7BLRV9IhdAyHwxdf3aMKC5RKkWEZLT/vI+avr3RWrBK8mZeo94
	bJL6XWNLBFc26296Et8WGJFIZ+6r9pcnO7LTKZq0zrdPfP/HBQ2veOKpO9Qw26lzhJyT16vk3hX
	/LiJDwqSs+l5wj1dLGfhEBCfB0krR+aj0KLuQpBKzWjtBn4Pbm8rIEjmQqU8rV6CN39v6Q5ahM1
	fbJlGE7rv9UsDYEZQxbdWhSmxmYZBrl6St4q+TVvwNWaJlw4eJSOfVIweHggUSWl44dtaV6GVVD
	YDivkEqyXw==
X-Google-Smtp-Source: AGHT+IG1DgjFv6bPcJnBgOMYqLB0iv+3Hhda6aDLo4vOr3ZL1xBdy3Zx2Qxb+B6dlbJou6UJjxFWCw==
X-Received: by 2002:a05:600c:4ec8:b0:434:f219:6b28 with SMTP id 5b1f17b1804b1-43891435c37mr113466355e9.24.1737386121121;
        Mon, 20 Jan 2025 07:15:21 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74995f6sm206237005e9.1.2025.01.20.07.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 07:15:20 -0800 (PST)
Date: Mon, 20 Jan 2025 16:15:18 +0100
From: Dave Penkler <dpenkler@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] staging: gpib: Agilent usb code cleanup
Message-ID: <Z45ohsfgCSN44rAC@egonzo>
References: <20250118145046.12181-1-dpenkler@gmail.com>
 <20250118145046.12181-3-dpenkler@gmail.com>
 <3a31262b-6bed-4f74-b00e-a124a9486e07@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a31262b-6bed-4f74-b00e-a124a9486e07@stanley.mountain>

On Mon, Jan 20, 2025 at 10:15:55AM +0300, Dan Carpenter wrote:
> This patch does too many things...  It should be split up.  People
> complain about this requirement a lot, but eventually it will become
> instinctive.  I use `git citool` so I can highlight and click to add
> lines to a commit.  In this code there were some dev_info() changes
> mixed into the unwind code in ->attach() that were hard to separate out
> into their own commit but it wasn't too complicated.
> 
> On Sat, Jan 18, 2025 at 03:50:46PM +0100, Dave Penkler wrote:
> > Remove useless #ifdef RESET_USB_CONFIG code.
> > 
> 
> patch 1.
> 
> > Change kalloc / memset to kzalloc
> > 
> 
> patch 2.
> 
> > The attach function was not freeing the private data on error
> > returns. Separate the releasing of urbs and private data and
> > add a common error exit for attach failure.
> > 
> > Set the board private data pointer to NULL after freeing
> > the private data.
> 
> By setting the private data, this patch actually does fix the
> double free that I mentioned earlier.  It changes the ->detach into
> a no-op if ->attach fails.  Needs a Fixes tag.  ;)
> 
> But I still hope my blog will convince you that the error handling can be
> re-written in a better way.  It shouldn't matter if ->private_data is
> NULL or non-NULL because the caller should only have to handle success
> or failure.  The caller shouldn't have to handle a dozen different
> failure modes:
> 
> 1) Failure but the ->private_data is NULL
> 2) Failure but the foo->frob pointer is an error pointer
> 3) Failure but the foo->frob pointer needs to be freed.
> 4) Failure but the foo->frob pointer contains other pointers which
>    need to be freed.
> 5) ...
> 
> It should just be
> 
> 1) Success: Everything is allocated
> 2) Failure: Everything is cleaned up and any accesses are probably a
>    use after free.
> 
> > 
> > Reduce console spam by emitting only one attach message.
> > 
> > Change last pr_err in attach to dev_err
> > 
> 
> These last two can probably be combined into one patch?
> 
> > @@ -1388,11 +1367,19 @@ static int agilent_82357a_attach(gpib_board_t *board, const gpib_board_config_t
> >  	retval = agilent_82357a_init(board);
> >  
> >  	if (retval < 0)	{
> > -		mutex_unlock(&agilent_82357a_hotplug_lock);
> > -		return retval;
> > +		agilent_82357a_cleanup_urbs(a_priv);
> > +		agilent_82357a_release_urbs(a_priv);
> > +		goto attach_fail;
> >  	}
> 
> In my blog talk about how every allocation function should have a
> matching free() function.  These two functions match
> agilent_82357a_setup_urbs() so we should have a single function to
> release the urbs.
Hi,
I fully agree with you and this is the direction we are pursuing in
the gpib driver code base. We have very long way to go still and
I apologize for not splitting up the changes into multiple patches.
Thanks for the pointer to git citool.
-dave


> 
> regards,
> dan carpenter
> 
