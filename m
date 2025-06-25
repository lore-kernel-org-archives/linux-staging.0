Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B68E25A330
	for <linux-staging@lists.linux.dev>; Wed, 25 Jun 2025 11:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750850388; cv=none; b=NO3odfkWkLMnNcvDa3yxctwj6pj4n+Zio7wnwCh1b1epvQZJrxutxsUCzxjEq+bWjEAJ2C096WuqMUVVeY64Wni9rfsK2CSaki3wNIpDtbTLjBeYDASdX3qA9Kl9vzCpZdv7RhdOIwOg2KGqJZN2IOoPXYw/a0JsbyBaap9lknw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750850388; c=relaxed/simple;
	bh=VNz+lSy568xXrNEW/LdsAyCYu0exIyy51MijlASqERI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gC4Yz0g8qhe4r8J7aagSC5D9yPqpOfbeN+pecwm85Zu9EhV5vhgi0vOxXXi/oOxMFELDlAoPX2aSJKby6Q/XJWWIYVbjN4Wn2vSmq913jTMv6tbhz1zL+Y9b5+n/usJVZtUOWyzJsLPRFO6NHaExoG8QBDLrQAnjH2wuwEaFA7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=U44ECsAl; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="U44ECsAl"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-73ac40e810eso467525a34.1
        for <linux-staging@lists.linux.dev>; Wed, 25 Jun 2025 04:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750850386; x=1751455186; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iq4wYZ8O8v8iGoHVKCZbSBs74G20nkHHqtB4OQv75Kk=;
        b=U44ECsAl0dKvHGB+2znI/iinXKQfjrixZMs20/rSrkimp6P/yHKTyywhFtXjvUOaF6
         DiFkgYeKIaa3TX2tO0qtX2BHRNbhB/zLI7z//Pl4IWTQVWNl3GObxq0IepGim5ZEv5Mj
         L26RK8QAylBMOGE4+ptMusOVSUrtk8Ki3NWVAI7Xl0Nqy3vFgLp+fN/nndRlRsbMHmts
         7sIlTx3DwQS7G5XTwX8/QKuBVBIaauHaqGehsVG4hbJAZeh1CIK/UaOPsuO0NN4Mln5s
         2hJLQOMxUK4k0kSYH9esPmSVVtA3ylH21BZB/BwlK4FQNXwoWAvsOc1D41K0zppvXc6z
         1Dng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750850386; x=1751455186;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iq4wYZ8O8v8iGoHVKCZbSBs74G20nkHHqtB4OQv75Kk=;
        b=GOTAw0uPz3h0Ew0FXfU5g8Rq73sALBWKcdI7qNv82qSni/8jRD9VTnoS8r6fnEYON1
         h1sref28ZWAvEXSxPT0lDJBpv96oBWyGsJX34P/4aOVFj7sk5ava63L6VlZ1xJMPnKG8
         riqX7rLzeAcqHWcs5rn6aLhSf6x6deyi6s0lmgAycS+YGZupuJiUYTKS96mVDuQ2vX8X
         eCyVR3PO7hi/f3Fa1oTJ2p38aRfESFbeBjBglXi5amA/5y3U94qEFde/u2bTDoxfOApF
         bZvmZw4u8iJyv90BRgUpLE/THb6YAjClUGdSXfpmk91IPf9OcQClkFJaJv2agA1aWbCd
         73Tw==
X-Forwarded-Encrypted: i=1; AJvYcCVbrD/bBY+pZAYwMCWUkGq9qUyjTa1kYUt6RyMo1BpKt8QyIWl0nCh2N/QEvVQvemIfArbNvFjUFrvkAA34@lists.linux.dev
X-Gm-Message-State: AOJu0YyLiIWBwCbjq79KZP71gYyELMemLmC5+98G/8OhUyScGI8T0y26
	FszIO9jloCTaOv5TtQXLk3wVltbHxZoTURrTqMMWJB9n1aJ6J7Z2meU07O7fK7Ky9Gk=
X-Gm-Gg: ASbGnctdjvQGSSTwi7hVwdanYvvE1u//PTgGh1e0ysu+VTp28j38CCzwPFPE+d/DltU
	WASvLm1p1K4wVcbJqR5aKpibkOxT/bF3EwVI1X2tfkhvJecFQERtbdG3oynVM0ENs3cIW5B+tjY
	WEa6Qd4Qi2Lw1NtCfISrSkHfEInuCHxYwH2LczqCbgrfQwqXLbljeNPeWiFnQO7QeRiTEhthKn5
	9VGwgZPmkTs7flH/JDVSSqE/xtEqLAj01MhpGeUunABPt2sT/vlvACDCzEUFFFvpTGoMXQUNXFs
	a8YmS663BrpC/oZKl7u1YN6ErwDnmq2U7jbh0J1UUI7UpeJDH3pQtmhtJyZ4YcXqd9LbEMD+XZA
	dABy0
X-Google-Smtp-Source: AGHT+IHUPmQyLG5EAp7kEhFfGkI4eD9tbFqoGyW5KZup0EXS2PDOGnB5h/POMmLnHUjyUistd5gdNg==
X-Received: by 2002:a05:6830:4429:b0:72c:3235:3b97 with SMTP id 46e09a7af769-73adc8984e6mr1795836a34.22.1750850386145;
        Wed, 25 Jun 2025 04:19:46 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:22c9:dcd3:f442:dd1d])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6117598cc6bsm989956eaf.32.2025.06.25.04.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 04:19:44 -0700 (PDT)
Date: Wed, 25 Jun 2025 14:19:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Pratibimba Khadka <pratibimbakhadka@gmail.com>
Cc: sudipm.mukherjee@gmail.com, Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"open list:STAGING - SILICON MOTION SM750 FRAME BUFFER DRIVER" <linux-fbdev@vger.kernel.org>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: sm750fb: Mark g_fbmode as a pointer to const
 pointer
Message-ID: <e477d4a1-a941-4301-b295-c245f9023cd3@suswa.mountain>
References: <20250625045526.82758-1-pratibimbakhadka@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625045526.82758-1-pratibimbakhadka@gmail.com>

On Wed, Jun 25, 2025 at 10:40:26AM +0545, Pratibimba Khadka wrote:
> Fixes a checkpatch warning:
> WARNING: static const char * array should probably be static const char * const
> 
> The array `g_fbmode` contains constant string pointers that are not
> supposed to be modified. By declaring it as `const char * const`,
> both the string literals and the pointers themselves are protected
> from accidental modification, which improves code safety and clarity.
> 

You need to compile test code before sending it.  It can't be changed
from being a NULL pointer now so it breaks.

regards,
dan carpenter

