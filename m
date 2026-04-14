Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C169289367
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 05:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776146134; cv=none; b=CEDZ8YnTrmesYAcMz4WISA3Q4syfcDbBJks8+u7fHS4Xslz26Dn64vmMXgdcTrpk8/PCW4HK7rq70+ujoOXbVLsLX4bmX0CeQbIy5ZpsgX0rPQ6FvaDql493vlBt7/NHleGN+vRLaXLL/LpLVr8IZt74Zq7H7ub+LnbNH6j4Z64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776146134; c=relaxed/simple;
	bh=KzEIosqJxP4BHkPpu4NHlIIuRW007FtiscoyUTKS2X0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hOixextm7lx/brwNTub5/EZ0nGLY5GnlPBpHe6fjwMCRqaM5OETeMTGkTizP6UBLacsxTXTtU4uRjmg7GxFTyr8lH/t86kqh09CzZ1vY0hs47aOcU9Oi0nuXw+D5Ytn1iN6y2n3ag7M0ca8XQnSeQCE68Da6xfV3m2CWtbunDn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tmk5SBt5; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tmk5SBt5"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43d7645adbdso1094074f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 22:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776146132; x=1776750932; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=muj8PCwO3shpp/+65atzohj5RcAGvKdQQoRXJ2xczQc=;
        b=Tmk5SBt59LmE11l/FnsC+GMPFYzE7CXBEmOmF1B66yFYb/WGyKEiK6lZ+S1z/8cFcU
         XVaFb960ipqwW25KQDJB+hiVxhOaqb0BviWy1LnHn6s2q45VJSOFMeOCs+JCs7At50Ka
         KXgj1+4Qb9Vjj5oJJmOs7mBqvggqMX3WMdBbKc/y8DT5R07x+RPFOPjd3RqF3aXX4IYl
         4TWjDxRRVvjOf8usjLr+Och+Aiqo6o4AKPjn7VFid6NiLzilCZ0K4Y0gywyVkQKq3bww
         8dug4Bc97lsXsl2aPZ3Bv7otpx9/74zBeN1+LbD04Deg3deY6AhhAA3fTR/kZhTV0rZI
         e27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776146132; x=1776750932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=muj8PCwO3shpp/+65atzohj5RcAGvKdQQoRXJ2xczQc=;
        b=N8OgbvU3g7Q9gMTcNLVOAqSBUZSAKdApb8j14LHu41x8otJrhnHkSovWj52U9Tfraa
         8MtDEGjj078/O+M6BwK/DSXTXbGPWoykH7UhLi6vdfR66vRwNJS4pT61YX6TgFzRXF35
         ocCBfU+YZyN/bxwHkeM+hWvfEergwPD0oDHrndrMSdqx7LtdnRTaKsV5aolKg3S9XIJo
         wiI6nzbHGSrSTJgEwiy2LcP8pS2jOrWmDojGvvC58qA9IHvclxjH1G3D9girqtD/Bd1M
         I9v5kvjSc/kZ3d2YF9pFymHRjR0MftcmsLCbg2XX2iM5b3tdW45UdzUdqkleQEzgk2jt
         x6og==
X-Forwarded-Encrypted: i=1; AFNElJ+1ovKoo08UHWdBjjFKCManpWr8EkufKeZnH6LS2EFIRVhob9NyVHzsxzw9lBj4Xdt5KunkbzIufdhUCmo2@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7Mo5YKY0INi94iK8TyUTo5W9iz1gO2w5sBhbN569xSMXsBFXl
	pfGIe5AviftRsJ1Z29RDgzTD0MUl4SYaS+R+wZOQ7VGOACij76Q2NxCk
X-Gm-Gg: AeBDietZcmnODQz9rHZG81wJoaF5UTnlB4paljYOy+tzpioDc3XGuMXz5uzT4cFbQLJ
	FruEWboN7rWFDLYdwBdi7FpJifTRZT76R64E9dQ96sSb0eVg5F1mHiw33y6mmuTY1pLu3Owfxd+
	cZb7VGB9P1IFSmj66PLPc5fELBz8Fp1J3NZWpzKai8u6AdOAZiehFqDp54S5uuago3GiGd39uRZ
	OgpxDc6/6hQ8ho2cgcYpOVfQJ/yn7p7pICW73w5d8PMsRTQSVWz4aVhdrZc95vAjDE5dWtmcpiA
	+5ogWSihJGpUeDb4RmLdrbmo3e9cImD/w+0/CnJs3xVEXhqjvzoNbtdv75NaD0hKY0n3wcJBuPt
	JGzluUO/M3A1X0/4RPB13c8POldNO2VuiXd3aLJdVW4k7pgFAx40EY9zQBq5wpQDkCvcWx4ZJj1
	+iz/6cYvF0QHUyyw+L
X-Received: by 2002:a05:600c:45c6:b0:488:a723:ea53 with SMTP id 5b1f17b1804b1-488d67ce902mr186633235e9.7.1776146131481;
        Mon, 13 Apr 2026 22:55:31 -0700 (PDT)
Received: from localhost ([41.210.143.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d6839981sm112966785e9.21.2026.04.13.22.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 22:55:30 -0700 (PDT)
Date: Tue, 14 Apr 2026 08:55:24 +0300
From: Dan Carpenter <error27@gmail.com>
To: deep@crimson.net.eu.org
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: remove unused struct
 rtw_regulatory
Message-ID: <ad3WzM-c2EEmZ3WO@stanley.mountain>
References: <20260413154433.1366476-1-deep@crimson.net.eu.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260413154433.1366476-1-deep@crimson.net.eu.org>

On Mon, Apr 13, 2026 at 05:44:32PM +0200, deep@crimson.net.eu.org wrote:
>  
> -static void _rtw_regd_init_wiphy(struct rtw_regulatory *reg,
> -				 struct wiphy *wiphy,
> +static void _rtw_regd_init_wiphy(struct wiphy *wiphy,
>  				 void (*reg_notifier)(struct wiphy *wiphy,
> -						      struct
> -						      regulatory_request *
> -						      request))
> +						      struct regulatory_request *request))

I wish you hadn't made this extra white space change.  It's unrelated
and confused me when I was reading the patch.  Otherwise the patch looks
good.

Could you resend without that?

regards,
dan carpenter

