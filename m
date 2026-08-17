Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271BF4B04B9
	for <linux-staging@lists.linux.dev>; Mon, 17 Aug 2026 07:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786952989; cv=none; b=sqV+QaZHan2xx/ZUmOYI/gww3cWXvv36x+Fl3w9PB72Q18jBz+gSLqeW4emnREJecwBjT0TCdQBIY3u6nQNvWdHYLXgwjPAK/nsrqrfdQ782MlJN538/titGo4CeXCu8hAvOStMCWSpfbbg/pCcCADDiYIrNIfp3MrZtm/L05d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786952989; c=relaxed/simple;
	bh=veDe8wc34sDAeRMAIFmAkOOLjF4rUal2oKNggxOEmcI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hnec5pw1J/o9Mh4ysnl298pmuE5hP1MxH9bvf7Qj/Yw2gJVuCPYPn94kPnPg3ObgKs/WcvSww/RGwurvNkvOBmFhogrguxfjQou0zkYjUOL5iiNIDJVEf7fooMejs43buRWNg5ghR49xrzb4uv5e72iZ1kc/IPpnYpEWWj0OH5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g9a0ntqf; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g9a0ntqf"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4994c49f588so26760485e9.0
        for <linux-staging@lists.linux.dev>; Mon, 17 Aug 2026 00:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786952986; x=1787557786; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=veDe8wc34sDAeRMAIFmAkOOLjF4rUal2oKNggxOEmcI=;
        b=g9a0ntqfN+bZZdVWMsWcxcN+TWCUtbnDsDVwjemhMb4jpjimBGInck03gJMuTw8NPe
         49UdiAa4FkIVtOq1RfMCs2AYwwtvSm0vJeLo4n8LlVXnb1YIaa/kXvteVaCN4QJ1qY86
         xiUDnZq6nrPlNNJUV3DHZNFrgaMN0h8Lxv2bytEo8p0p7oW3Xp1C9bKIO8RKQdJoiYsS
         RM7AnYZz5eJBN3k8Np3T0ntYnazRAg/dmEuEQx80lcnZiXTErGBMJ7kcboWiYAWyO2fg
         +tyoxeI4hjTjmnrIp0yGVrgXXJS6v55RodDpirZYJTeJTvbdM2OUB9P0PYMt/ef1pecr
         +msA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786952986; x=1787557786;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=veDe8wc34sDAeRMAIFmAkOOLjF4rUal2oKNggxOEmcI=;
        b=UPVdYOj2GRA+REDMaZ7Jp6IUk/X6qtU84JI20RqagT4uMAWR0LjUZD/6mPIS7iAZXQ
         CRadCFTwPyLFc6YnbvTlH/RpwQkk/kJfjLDqdjITrgm1qFZ075UTOnVXjU1OKPHgKNem
         KW+C+aebo/N5wmPIHsSgd96bqrWVTcGAlfnz662dKfrh/BBV25URqHq2RReGO4zdq+bX
         aeDTIAYq6JozoXfRM6FoKBjyrfG5+G9WiyU4BsSNQQMcePJcpJ8lReLu39F7ZmJFYcee
         5EnBznX8BLVvbNv8+ICZSrWcQHC56e5UA6xNsJQ1ivfeXY9yFjOpa6CIOysxvVzYm2Rr
         C//Q==
X-Forwarded-Encrypted: i=1; AHgh+RqYi4jnuKesKW1HfzsJlj6OH8or2hTSPSs8/k7DhMOcVvBQe6l0zXsSh4UKkfUXd0gT6r2Ry3te6vVLtt6m@lists.linux.dev
X-Gm-Message-State: AOJu0YzZMKA/vpCCe/BhS2wVCiUkUTH8wY7bgqkxJc4nPkRODeIOL/4H
	/UyFJ4N7tn6ViSVmMDKTdpTqgRZqger2wwC7Emy+BHKRN7MUyvL4FPnu6X2QxMyhwleAgaYd
X-Gm-Gg: AR+sD12MgwlRT8AxMs3dnI1XABIFPHTlTJBzYYQK8C2C0g1DXpgtB/8+3SxFvN7+djt
	m7/4BfTPSX/G2BTpxaIsABDudC8BC1juS//BSb5fPQZtS7feMrUjesKbncRf4WRUb5A/7GO5B5a
	sL8sWP9GggrGmfKXfACaRGo555DwonQ2ynGZ/QckjIERRaL2b6V56kAXjeCrnm6wz6kCkz0/xTw
	gBApLPJls+b+5lL3BA0r12Plz8ajBog60rTcyLh8jwrjGaLTDK6pmk3d92FDUtMH3BtCbCf+CJD
	dpzt0P+LRevFMe92G1wO5FEd4VfXygfEbCvAJ9LjJSlFbGQrhi1cGMHPZnpNOg8A/dOQv68AcQE
	g4YhWTkNn/LZ9CsPiiqrvMGHCwNfaWOPVTs7JvZWxkxTnvoi5Ov7PUxG+fcTLGRGkxH9m7fdYFG
	Yz3WELDaNFGPAJq8Jf3pGvtoyr1kdh6Q0WOWjpRJQGtx+76tJeWLTLxLFqww==
X-Received: by 2002:a05:600c:ce:b0:499:7f37:cb74 with SMTP id 5b1f17b1804b1-499821546afmr396548255e9.1.1786952986230;
        Mon, 17 Aug 2026 00:49:46 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:9cf4:43df:e612:817b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5a3b896sm1663047f8f.16.2026.08.17.00.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 00:49:45 -0700 (PDT)
Date: Mon, 17 Aug 2026 10:49:41 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ivy Lopez <skunkolee@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: cast EEPROM_DEFAULT_DIFF to s8
Message-ID: <aoK9FSiIGeveeANA@stanley.mountain>
References: <20260815191030.24989-1-skunkolee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260815191030.24989-1-skunkolee@gmail.com>

On Sat, Aug 15, 2026 at 01:10:30PM -0600, Ivy Lopez wrote:
> EEPROM_DEFAULT_DIFF is defined as the bare integer literal 0xFE
> (254) but is only ever assigned into s8 (signed char) fields used
> to store signed TX power calibration offsets. The implicit
> truncation to -2 is intentional.

Just change it to:

#define EEPROM_DEFAULT_DIFF -2

regards,
dan carpenter

