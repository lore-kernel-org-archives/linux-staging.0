Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39689367F46
	for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 10:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770807516; cv=none; b=an8pccsb84cEal2Znv2LzMK6j1V7MkfaZTLsmFIqnwwvWuF1h6IizMdTTxTNX/aAZ0gkYy4KZjYKOrlQeQdqbFqI3rS/+evERUocz7nuggwvFzQKO06RvC8QD3neJARYjwr39TjFZkaEYVkvfVmF4+sR/ik/8o56jaDC6sG+USE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770807516; c=relaxed/simple;
	bh=AFzz5GYA+mDUGUzt0M+3uob4b8hq0lZlTX/Z7EPYCtw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g3nOIJYyBVL6x9r6N48kcQTtzP0ZFvoBiDwIIO92H5czf2TvYrvcup8sPDUvNRMO8/QB9xGlCHpxll6zOmATQGkaaiq9HRgUwQt0xxmm7X16dpD2mgBFEbefodgnPr5wlXbEfVvw+3bn+D4VhV3tC/bJIY87Bd5qvRPDzC12R+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bYeYjBHL; arc=none smtp.client-ip=209.85.221.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bYeYjBHL"
Received: by mail-wr1-f67.google.com with SMTP id ffacd0b85a97d-436356740e6so4432754f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 11 Feb 2026 02:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770807514; x=1771412314; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ujFTCx3IAmFv4Z7B6EMyFoHg88P2vmAu3Qi0rKWNYuU=;
        b=bYeYjBHLKZZX9ATwuiEu8iZ45jVJSfguK8PG/CWc3TFRqbg5YvlIXYfZ2ze1otUivG
         cjXdxWJcmk83SdB3LfzrVM9WY4Vg09Ld5JiA7CO5Y5MdxYRgzI2YudYpkqidCNaLIdIx
         fnfQEMf2v9/1kxxg3+bV4B+6l7ty124NvnQ+s8T3S+6ER3FPMsQ06U9j9O+5LZB/UPRT
         OQv6QzW+58aLYMt3wPHJuQR5ZnFnpHWrpn/o7kRCQHdh+45m9C+ok5ks9uFh73yVoueD
         KTpx5Xo6YgxsdEZA13ah5QVpyMqMy8Soqwy7vXRFwq7o9UMF0cYXeNEOpB3XhYkLQOh+
         ZDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770807514; x=1771412314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ujFTCx3IAmFv4Z7B6EMyFoHg88P2vmAu3Qi0rKWNYuU=;
        b=dC4687Jztta+airmay7CUM5AEScufmIZ32rY1jYeU4dALIPdhua9v6V+oURzPe7hvb
         jSLb2SXHkfRL4QOEBS8USN9waVqWwVUirc5KC18ADzXE01rTkyS7c+8DAFpqJWHRKyq3
         ud9Nhhu+4qQdcO8BI6NlDpMVquhMTuyr4yk6KTcCgTevrRy2t7UqwWAfqYOXMxIs/mq4
         eWNPfPbS7JR4KrHHCPpeDzM4VmG+0zRSY9T12A+VcZSsVCxbpQXpCzc4mpHhLLO7Lf7e
         iFPXubuv6cIC3urhzqBd0SqDjSDkTtL68iC77faHXKjmbGHZbfbJp0WfNgKIJ7ETYYYq
         Kkkg==
X-Forwarded-Encrypted: i=1; AJvYcCVvUM0RSNTmSZxKzIpP1LaaYUkBtpXpmb0eruYbPtFp5j9M9d42IohdEMAhwmpD9eLZ6Ivm4JoTXPeantWu@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+AuPBKiMn2bNBuG4pUATuiF/9yy182QDB5n63e10wQJnrrmnu
	VAsNASaRG0xlMO9E7UKDi92wm7eOEDV226/F6E2yfrXw4rMx7h3PI6a6joZZpL0ZwC0YftfOSBE
	3a6uuwZQ=
X-Gm-Gg: AZuq6aKlZs2EYYYzwEbLrY92yOha6JRcWIOHqWntmMrR6ru+Ai7lmWTM6TwaGoLT7yM
	YkmQXCJ/Alyj7kz/Y71shVjztsmp9IIGonwMEKC+1uU2WLN9cTzrqprzZCI/pvVc14QEdWE+ffR
	xSErw9U1NmGdxU0MX61oy/81mobXYKSBbp6jfuKJ+Zl5o3xvYg+M/MEs1m3vXCOUK7WG+SgNQxU
	JoG2E8TsMp9Ip1lHjltGeI1/UY1CtM9mA2KJCVAEjkA7mr0qUR2AptrKN9u9IDf2R/ESeGImDtq
	picgWZ2gQYVlAU4jkwi39W/+FcOjtp761EiNIx7o6cA6svmiMZPBnt0p+0y7j0XOWWDnffBvKxb
	OzVXinpi0+LNppyB+3apbJd2HVGc/gIIidf9WrgAPK3A0ZVPmt+BXO2jdkcKlRRCO0vkx5WTl3d
	7ijHF3k5lpbbtg12Rr2n/Df8/JXIcOo6JoxMMvzTE=
X-Received: by 2002:a05:6000:238a:b0:435:e440:f518 with SMTP id ffacd0b85a97d-43782cb1c0cmr3889523f8f.54.1770807513399;
        Wed, 11 Feb 2026 02:58:33 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43783dfc55dsm3941663f8f.20.2026.02.11.02.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 02:58:33 -0800 (PST)
Date: Wed, 11 Feb 2026 13:58:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Juyeong Jun <juyeongjun.knu@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: split multiple assignment in
 osdep_service.c
Message-ID: <aYxg1lDqVVuxCAQW@stanley.mountain>
References: <2026021137-buddhism-upcoming-392e@gregkh>
 <20260211094633.3549-1-juyeongjun.knu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211094633.3549-1-juyeongjun.knu@gmail.com>

On Wed, Feb 11, 2026 at 06:46:34PM +0900, Juyeong Jun wrote:
> v2:
> - Fix incorrect Author email in commit
> 
> Sorry for the mistake. This is my first time, and I sent a new email instead of a reply. Resending as a reply. My apologies
> 
> Avoid multiple assignments in a single statement.
> No functional change.
> ---

This isn't the right format.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

