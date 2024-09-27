Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F9E1C172C
	for <linux-staging@lists.linux.dev>; Fri, 27 Sep 2024 15:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727450809; cv=none; b=ircRny8RC31b0cxBlETl3R4cPY6KlzTe/a8FtOH/OrJ/HC0eCDQMBBWoX2bLwF7CVQ+3TPgZ1iW1fGrV6iiu3AMNikaAz+ohTlx5oBxTTfBUCZWnxbSOdh6Ey9xLX40zoHUB24FRZRLFOShQA2LhqJwudKdNRhDhiDT3DoEAA80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727450809; c=relaxed/simple;
	bh=Vdfhnsi3EotHXVW995ft11x8B3qGPa7cvav7Yi70Zhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bAaCbl2lF/QxotOb5Xxpg4+im0wwMFGGc+mo12JKPJFpUfygBPHu0c9/AvuRYRU//FLDC83iHVkG2KSLVsgYXanXBHvHw+dWAfjZOPFKt/fva/AqZpx7GTTlBLOqI2kXItl7kd/CTzsx2NoQI0YqvFHxAfc26rThZmdy2dkVyI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DTjVpGYX; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DTjVpGYX"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42e5e1e6d37so20834065e9.3
        for <linux-staging@lists.linux.dev>; Fri, 27 Sep 2024 08:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727450804; x=1728055604; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/nNMy1Jele6OQzwkGo6J+HA5rYJclMwLaw2lNZiPamE=;
        b=DTjVpGYXgEavh6aPakIMPypImpRQGHbrJWYkvwir21Yy1JHLpY5glifsVrtd57VDSH
         1TsjOE3FlOGo1XjFF0bDSVMPrrVGbyEAWLXTW1lHSqtzRSSejyOBnp/91zy7h96J9s0s
         B+2LVe3ZbdCR2RrLjuq9U4Os8Kywc1beHRQ4MHj7KOsHOTfh50prWYbu3fPmWlmGNET9
         Bb4CGyRytql1MHlgr9rFcp/NoYg9tm2FG4MG2n6MmL/bpFmm/X7o+Ld6+2IuKkPebh3S
         xEO/sC/CAhNHdDYCUc6kF/BDeY7PAEKrrF3eIoKlXV8PvEIsqekCqcUPjX0a+h9tH7rW
         dV3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727450804; x=1728055604;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/nNMy1Jele6OQzwkGo6J+HA5rYJclMwLaw2lNZiPamE=;
        b=Yg+KkK+DRme1NfO3yE0zK1E1MU4EwqcWhICZ7w8wAF4Lv9VWGfxrIt/vDNmHzm/BJP
         H8lLJBsfmfzyhMxJ0ESumSOiPnhYirhy9WmVixnD/GBxiw7r2cJH3ZzWvL9PRTQmjhf4
         RzH6kBGn+1Yd57XG25O4l7yBBGy5Z6mKuz5oMS5AHIqu7ll7vej38uHL/0UQXB7KIkJY
         sgZmAKx4lOiYO19tifbpnOMmZB7eZ5vbTcdOgMDi45FweXSND6E4LGiBvA4DS3JE7upW
         chV1WGaVRNxGh2iojM1Dw4i1yq0IJGm7bk3Rk12DJcI6UUzU08V1XFXBYOMikyd0tp0q
         6lpg==
X-Forwarded-Encrypted: i=1; AJvYcCUFdWPk5+ISm0WbxuwtzW6LSgqCI9KeFXGu+QeKsJlOo88fg8JJ8AmCcqmSnp3nX5TNONwk1RRASelcdgU1@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9NXacY+0DQhXvpmGiECX4jHDsXWQwF1dqlgfT8ey2O0bcZ707
	/QbBAWi9PpqX9+KFZSHN7tpC0loBf404PDhZFNufWZVhIWBOxjRZbRbS0tcZpYE=
X-Google-Smtp-Source: AGHT+IGBH2Kg/YpCT/R723MZc+TGVSxQKlIeip9U0L75aWbuvjywKgl5Tnj1OrlrAkjg/xIv+vWNzA==
X-Received: by 2002:a05:600c:4e08:b0:42c:bad0:6c1c with SMTP id 5b1f17b1804b1-42f5844b3b4mr29417935e9.18.1727450804379;
        Fri, 27 Sep 2024 08:26:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f57debf07sm29600285e9.22.2024.09.27.08.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2024 08:26:43 -0700 (PDT)
Date: Fri, 27 Sep 2024 18:26:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Xingquan Liu <b1n@b1n.io>
Cc: Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8712: Fix unnecessary parentheses warnings
Message-ID: <9bf11c06-85c7-4ef0-ba26-e4780a28f23c@stanley.mountain>
References: <20240927151637.82772-1-b1n@b1n.io>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240927151637.82772-1-b1n@b1n.io>

On Fri, Sep 27, 2024 at 11:16:36PM +0800, Xingquan Liu wrote:
> Fix all unnecessary parentheses warnings in checkpath.
> 
> Signed-off-by: Xingquan Liu <b1n@b1n.io>
> ---
> I ran clang-format additionally because I noticed the Linux community
> recommends submitting code formatting patches along with other patches.

Probably avoid running clang-format.  If we wanted to do that, we could have
done it already.

> 
> I'm not sure if there are any issues with this.

This patch does way too many things at once.  This is a long way away from being
something we would even look at.

regards,
dan carpenter

