Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6D5258ED7
	for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 15:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770822585; cv=none; b=L0iEVKkTu8rjm21KsGkuJwmVEBBxPZjSszVlwH3oYlhg/c+dSOyBrgQGrqjYNp7T9XJCLZVquTzksLiN1mXXnEVGAGOXmxlAqFLpc6Lg7qOvHCL4aDjyxe+GCl47mDa9cZH/oDN6rc5zCsTnJL4DADxzzpHEFRpxWQlZHF1wg8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770822585; c=relaxed/simple;
	bh=v5uO4djRCBnRnJhoxJS/fzguF0IvUhDHiYPWt9e8PNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bFAVyHbZyquCXcmVtF9XHiSZ8j6IP99vK3Ibn/gLR3HUIJBLz6ozBNuS/4nRMvz1sWZgkGSz3vqkIPYs+Og3T1fWFOoxpyK968216XLSVnUy8Ert0an8l/U42IZl5Z59QbXBhp2M87lYqawIvHhGk4PvMS3JNEqzNk7JP5lXW60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QEKOBLJw; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QEKOBLJw"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4359249bbacso711072f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 07:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770822583; x=1771427383; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dau17VCYokfxTfUGZo+mfg51i2b8t6lgZoepnCppk/4=;
        b=QEKOBLJwo0uYt1KWZPb1OSUmJts/hpFzMVFYeHLseMHjStMXyalixd4wzwPMtNCXVM
         F2f5qc5FpS+6YqFUaHbGdCpCpmp/nO3w2NRbqiOt/96VW2U+U1TW094AQCC+NL4taT13
         eq9JI8c35wragmIQzDAxDSm2RMjGSTBJLgbndz93bKys3a7cWNPl6/buiq0fT/cWOYvp
         fRrXKcYrRwOHOcGv7g5w9SlakgtlxayifbJSmJ66tXeDYApFCtG6xXLFVX9I+OT9AU+B
         eKe/QUK7apeV5tdoM5CuhLymAN//9zjfKsfPsNPw/VYgyqKvhRMM80RXvSC0p6UNuz6t
         QMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770822583; x=1771427383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dau17VCYokfxTfUGZo+mfg51i2b8t6lgZoepnCppk/4=;
        b=Um2QLVH+IxTqGinI5iF+vnMI5yqdg9Sbl7o8az6jKdHJrGIFev4Jr/Ag9y/xuc5OQy
         Gx+oxsQE6twhEiPuSoS7DXvjVKNCTotSBxsAyf7AaoDgTnduj+XR2NYsky6LqXPgooMh
         YZo0GKZgAMDw63BWBxb3eypEHWA1n84IS4u+7uzyQOpEAGGVLy9VuvRRJDmZWKk9uYwc
         RBX9Pws+kBCOhMQwqLOnK78EvBz43XbM7ruKXEbnPTou89XNqcxo5YbfyYQivW9a3B0o
         aVGJnFrBYXa7V3Cf2ngfXnYYJ9oec+MguUhpbhErE/gw6pUx+xqQ0Wuf2M5L2d+HuDTQ
         OKYg==
X-Forwarded-Encrypted: i=1; AJvYcCU5fnIb6vnVzVn/EKpPg8ReIHaYPTBOaHDY+7X6NH4v0o0wrVDY65ZSxC5YIWd4zPSJx1NbO7mnht8Fzt2x@lists.linux.dev
X-Gm-Message-State: AOJu0YxciHEzURSFsdTKLyXfx+ZAb3tIrp4ybzcWSz4sSMRJXvKI0NTf
	CzucBLBvP8haON/RGXKKybNvmvcJa9fELWU+EmPBHANRstD9G5ZS5V+vJ9ZHPMyYDJY=
X-Gm-Gg: AZuq6aKL52xEEVDRD1Yt80WKd1KV7lYjWSd5PT8fBIBw6vBSKDexJFsbfEGXVjdEB/V
	1lg9S6SKsKgp7HFWlQCIAgQOp8WeyoQ3i4YcVh5nIvFRL9TF8ZKJgU0Z7m7f0ogXQD8iV0JBn3W
	Ma4TP20Vr1a4DXx005f/ssK1AVLr96VTys/Vg5ua5X7UWTCLgpH/VP1UxaCzZMgEff5es1pKR1X
	ZjufiR4q1ivfVtrWip9/tEJhUyH0Na+xTsY63KtG1zPL/3vK7jpsXs6yI0q499qvoZ+Hi+4VEYG
	iToxVY5vBth6qnihdawwrY4qQVGrOmvl6hUxSjoPtbh5c/Bd7zO+ijDihTM7oyhnClIr9zbhw0s
	sYKw7Onio8suehR1QY9MhSRRu62vmtuYEI+6BgjlxDw2eY1HTtVw/rBcQvmGsLCHv5nEarNhtSn
	HHBa6TqdPiFX5ofW6JK7pXh10FwU7j
X-Received: by 2002:a05:6000:615:b0:437:71b2:6f1a with SMTP id ffacd0b85a97d-43779debe23mr11057591f8f.0.1770822582863;
        Wed, 11 Feb 2026 07:09:42 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43783e39c75sm5186539f8f.29.2026.02.11.07.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 07:09:42 -0800 (PST)
Date: Wed, 11 Feb 2026 18:09:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mariyam Shahid <mariyam.shahid135@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix YODA condition warnings
Message-ID: <aYybs0WNl5sYWL5W@stanley.mountain>
References: <20260211135731.13560-1-mariyam.shahid135@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211135731.13560-1-mariyam.shahid135@gmail.com>

On Wed, Feb 11, 2026 at 06:57:31PM +0500, Mariyam Shahid wrote:
> Place the constants on right side of the comparison in rtw_security.c
> to follow kernel coding style. This resolves a checkpatch warning.
> 
> Signed-off-by: Mariyam Shahid <mariyam.shahid135@gmail.com>
> ---

Someone already did this.  You need to work against the latest tree.

regards,
dan carpenter

