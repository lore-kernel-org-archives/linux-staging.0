Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41712561A7
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 07:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772522862; cv=none; b=mMk8QIjY3GjDy7HvqeWUbjkrxlFihLRXYJetxt5OYWSfbKwyuJY7hGkN3mf3sKv9fT9jqvG5gTEtEgCMChVpRKm0BsBYEN+lBynKQqDphhMIjnnOEB3aNTYfyYXWMY+6U1wM1YoW4DlQJEE+OOVZ2D8NXMt6X5P0sSaIkurSaN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772522862; c=relaxed/simple;
	bh=w6nBFB7MG07gVPm/T6jS002ktP/JMDf4QkikZjOw9PE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U/bomSJBMYCdy74vqipQblndh3v4FCMv9mezuXx/HmefxEFgdz2WhnbHZsGs52nvcAIBlZ1WuhmKup+afKrR5laoqLBrjL6CR5bzViIR9uOvzl0b/SLmgNoZaGSPEy9EdcSP8vg55rK4zFWMnpi58Kkxpr3DHNE651r0mjSSXwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VydDf27w; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VydDf27w"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso44875015e9.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Mar 2026 23:27:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772522859; x=1773127659; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9KdQsRCCHJuEv/DS1mscb8GYq9xDcloDyLyMxh7TCB8=;
        b=VydDf27w5iExJUMWozocR8Kw8sPPgnEX/BXNZwVgnOc4PAcXaEIp1/ETog/HT/Dl2o
         V7WI5PJQQNW2V332B1XYak3rFaG3XZLMAtgOmyJqA0HRx43D67qqVT4KqfnhNkxVSGCK
         660tG9WvYNM23BWpG1mBtG43P5dIO8fYo9FBsGuPPDXcPgFrm4Q2e9m3G7l2PsgRh2rd
         HlKH0tjzpGINvb1gIitdocfq/Md1ioUQ0WDLG2NovzODeXAMmr0i6IODPIfpPPrwZojT
         tfr6JY7tooH2q0SMSvjj6vfEdYAzbCbAp6AzmxBuFuDRbqdkTj4qi3LJD6Wjjk5YT5o5
         XweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772522859; x=1773127659;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9KdQsRCCHJuEv/DS1mscb8GYq9xDcloDyLyMxh7TCB8=;
        b=FrOr6igwHJsq3ejwogvut0rxeqFhJJUFfIoh5oH+NWND8tLEYx71iLASwnUl7KVdh6
         Rs+WBc+SM1zbASbTkCMaaHoONEdMgQ538fzRIFCHCluF+n6dlfCNfC2nY+X4UA4jy1QL
         fEVAHEBUJoLykxs3PeH4xR7fTlfHAFRdhGwqZ8hikxM0aJREctvGUwSKFnSFGU1hzEbH
         lxLRpGuvt/hR+eGm/wsX8HB6R7EBPGAUCxT0TafSiXHjKgEZZVz1SYMdKYLZ4P6of3MS
         VqOQX7RZ6yyfN+IbzQ8DJdaUZfzrG9s2Nj47q4jb6dYgAeuY1J9EWI8uwl4ov0dCQhAU
         0M/w==
X-Forwarded-Encrypted: i=1; AJvYcCVjeU1aNMKApubxzXiDg22bPtShy5lvHV8gkswSdi+lrVAUUlsMC/kzlI4S+C6nIPibvEQjonJ03qNpFAe+@lists.linux.dev
X-Gm-Message-State: AOJu0Yy90QdLe5QZwWmuq32kuQbnamA85DBcfWaANnXPTLLUGER6FmKW
	6nc5f9QZKbE1awwuFaCJKSJbC7AaVXDeufiW/Jon0ZhDcfGlUWqCp4F2dxHuR0ETkNs=
X-Gm-Gg: ATEYQzzR+1ZOFywOnFjB2HGhOjidnwQKfrjGgIeEhsOQQNTtDnqFtuiVkNxM8Lu/Ko5
	ygjdVpBvxe6tuJ1ZOz/jlJ7cJyoXWjiDDCemrrO8qLbFxUxGWN1M3rJTV8cawRTlOeDzmwVnh4o
	YhYwsChdCNRoQT71jP8D2GeozJktf6Sl1o4HkUJtz1CbBFpGW8V0OIB4xbdSxqj77Y5m3E5MIpZ
	ll/ErPR/yNUfb8N8rNsxYZ/sXnGvETbSd+QuHbtaUhwEHxzFLDwKgWDL0cs7IWM0yDc8gdOKJY+
	zy05PuFpj5y9xrJDq4/8jDRAWQJuSs6sjK7iTViJkdMY2TLUu7ntS9oHysMsMQt9aCPFqzStlo4
	4pd9VmnxUBAu1sLT2ZBF/C3x7PXgWB7CWwffQN4ZLNezoCmGWfaRRLTRarYnI1Ob7vYEWhiR8wq
	uOsYAeZ3oH8ObJZZnRJ782CM4BhcsHV0atYtBD/9w=
X-Received: by 2002:a05:600c:4ece:b0:46f:d682:3c3d with SMTP id 5b1f17b1804b1-483c9bad811mr298284005e9.13.1772522859143;
        Mon, 02 Mar 2026 23:27:39 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851336656dsm12982385e9.8.2026.03.02.23.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 23:27:38 -0800 (PST)
Date: Tue, 3 Mar 2026 10:27:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Josh Law <hlcj1234567@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	Gabriel Shahrouzi <gshahrouzi@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: Re: [PATCH v2 05/10] staging: axis-fifo: improve IRQ handler
Message-ID: <aaaNZ99qFZ-1nB6I@stanley.mountain>
References: <20260301214815.2628942-1-objecting@objecting.org>
 <20260301214815.2628942-5-objecting@objecting.org>
 <aaVEsCIacXl-kuxa@stanley.mountain>
 <f8772114-a495-409b-a590-a9b1d8ed1d41@gmail.com>
 <aaZ7QfW7cFAJ4m0R@stanley.mountain>
 <239a788f-7ed4-4bd2-8ad7-8d0783bcdaf1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <239a788f-7ed4-4bd2-8ad7-8d0783bcdaf1@gmail.com>

On Tue, Mar 03, 2026 at 07:02:19AM +0000, Josh Law wrote:
> 
> Lol, are you gonna approve ANY of my patches haha
> 

The life of a kernel developer is full of heart-ache.  I recently had
to redo a v5 patchset because there was a O vs 0 typo in the
documentation.

I believe you resent all your patchse in this set, right?  But the first
patch is obviously auto-NAKed for not having a commit message so that
kills the whole thing.

regards,
dan carpenter
