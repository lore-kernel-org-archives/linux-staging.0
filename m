Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8860D4595B
	for <linux-staging@lists.linux.dev>; Thu, 21 Nov 2024 18:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732215343; cv=none; b=Y5dRwoB0Teqt7r6ptRRa2qW9xiCXRBPQ97Gd/8rKUJgzQIZFJ0NovQyAjQXN2sjn6t32eRxUZ2ym8/+Muw+2HqBxJlhL+E/Z3HOPFquJLsXDENDHS7o/gEV1KM06Gow+T8YFOddl+aCEkbDw2/dHHZUQtRZUhKon/SEKKF5rW70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732215343; c=relaxed/simple;
	bh=utNGoZkjgvglt/ZQDAjDh2iz+WWusLLFgdqTAHc9ZcE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GLlpZrZa9KalmHeb9tU+C8LXuUb2ps+Vza4ReSfdhENF4eXTHwsTbXUr0H1AcffbivBUyd/msPzzYoQEU7rwAHW3u+2GlPyEgUQ3pYJZJYVubwUBTII1wZj58Jrl0H4kdoi0k6wAC8+aTvfPtO2CzWO7eA9rnJgBuxOTbJgHSwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=agZRxZpR; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="agZRxZpR"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43167ff0f91so10787315e9.1
        for <linux-staging@lists.linux.dev>; Thu, 21 Nov 2024 10:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732215338; x=1732820138; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zzzPxQcvikn1NUF9cz7KZrPBlQYcHbkUU7Sgh4Ie0Vc=;
        b=agZRxZpR1ecG8JI/ad/J6qjhc3OZVlHszuPKX1ouPqgyB0aqSEQN/iVmSXFG9v0wAr
         3KD2axRRRyU68lFnAEKGMI1VzEGXgrv6jRaZOFrUgrV2ATpjW+iRehtCEzxkjD2NSZLK
         UZ651jAMIQN9SbNL/0JhT25UX/2HUf8UYj0gOZ/NLmAVDOcNOO4H5A19SnILP9qPCQtn
         yZXcnkNFO65QCoSWB86MF954J59Nba1Pqvf53BnJNSngobrOVdeHOrhdZvoVcjaA17ng
         Hj/az1juEiXae+8kJVyvG3pHQSuJAgfOSeJpokRQbAaUyOqXvviTm3LJZW3CReJf0oAD
         Yz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732215338; x=1732820138;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zzzPxQcvikn1NUF9cz7KZrPBlQYcHbkUU7Sgh4Ie0Vc=;
        b=izWMNcGA7eMguzxtQxFs8OY4jDQLlhlyMLVAtdEc4pT3FE/fwPp0MgjpVMfYzT1HvY
         bPfesb5K9S424NVSIe2P/9/7oMdA1LfJf1GQ2IC99Ldtp/P0Z3UI9iybGD1JrfUaUDfa
         fIP+EVZnjDfIls1JcP6k1og3H5pUIssA+VotxThqtVO1ZnsjgsR1r5ZruJZOiIWzVM5m
         rBjB29uqPy4Gf8scz715WLR38OpwXS5NQWxBY4ClYBNgCrVMFYQNUHwDz8I8iLU9Xyi5
         ujgxHwTo+amNQcANmT59nNaY/rJ/yJ36ztOKD6YzK/x2QXnlPP4at/JpyAW8j1kP8dII
         hocA==
X-Gm-Message-State: AOJu0Yy1KeRzUgUp7WZ+vTuBmw/xNg0iwDtPgP+jyW+GH+y3noHB0kHB
	63tJqK6NogyW9W2qms8XpfjWy0eCuilSlyIroL1X2bQLhJ3IqAkJ+rSSj7l+kh0=
X-Gm-Gg: ASbGncunNZZMW0lmn/WY40o22B6FCLpIQ2Ye0iMi3k1bRm49m6f2fmJ5Ioxo+Y20MV7
	w2GdnX+pAimtNQHdrD0Ai80r5/dVOwP95xRX7Hp02lsmEohQqguAoVSPtG+eaLDOftGoz380Nss
	eL3KCrDySdV3EHqBUeLkhUEHgb5be6zhzQtM5JnN3zrUTwmIEquXI61MMvqN+UAi4Syz9Sc3Qo2
	6JMo+9JYtGAW8kFAFiyMm7yhGoCb1y9dfvEX7F5JfdKrmnudgwiE1c=
X-Google-Smtp-Source: AGHT+IFmXIVpqP3HqT9KlJLNs+gw8NPLRwz++A/b/6fhrRW6TBSJRYOt2LadxPAG05FPEhMGpniIPg==
X-Received: by 2002:a05:600c:3585:b0:432:c774:2e24 with SMTP id 5b1f17b1804b1-433489b2389mr71992225e9.9.1732215337852;
        Thu, 21 Nov 2024 10:55:37 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-433cde8c8c8sm1441095e9.34.2024.11.21.10.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 10:55:37 -0800 (PST)
Date: Thu, 21 Nov 2024 21:55:33 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Paolo Perego <pperego@suse.de>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Bakker <kees@ijzerbout.nl>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2] staging:gpib: Fix a dereference before null check
 issue
Message-ID: <dcefdd75-643f-4492-9e65-8b289cbf418e@stanley.mountain>
References: <20241121152221.6415-1-pperego@suse.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241121152221.6415-1-pperego@suse.de>

On Thu, Nov 21, 2024 at 04:22:21PM +0100, Paolo Perego wrote:
> This commit fixes a dereference before null check issue discovered by 
> Coverity (CID 1601566).
> 
> The check at line 1450 suggests that a_priv can be NULL, however it has
> been dereferenced before, in the interface_to_usbdev() call.
> 
> After a discussion, the NULL check is useless because private data is allocated
> in attach routine and freed in detach routine, so in detach routine the pointer
> has to be not NULL for sure.
> 
> Signed-off-by: Paolo Perego <pperego@suse.de>
> Fixes: Removes a useless NULL check

This isn't how the Fixes tag works.  It's supposed to refer to the patch which
introduces the static checker warning.
Fixes: fbae7090f30c ("staging: gpib: Update messaging and usb_device refs in agilent_usb")

The patch has a couple checkpatch issues as well.  Please, fix those up and
resend.

regards,
dan carpenter

