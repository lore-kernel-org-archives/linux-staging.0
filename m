Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5E4227B94
	for <linux-staging@lists.linux.dev>; Tue, 11 Mar 2025 11:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741691808; cv=none; b=CrFCuaeH9iJazUB1iJvD4m+l/O1lcCULhWnlooR8vhFkk2kM5oTp3hRxlwpO7rgftvoIbly1lj069I+MMDgXSQZzbnrRhn7OhDJ6jfNVIk8SEvbosiYrHq2HxAdc3SugGC6X4rCKzIFiddqYjSfqGNSWrkpd0iaNMxx7sqhJq2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741691808; c=relaxed/simple;
	bh=mpmz9+gNfBkSRlzf5ohqnrqIElII8nIlcNv4e65+ehc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u6nuvjaW/F4HCvQJsUCaJmem1+fU7B8iGc1x12oxorwggelDHBL63lSPZpxpVt/UCZIpoiGy344cBipt9gq6RUX+6D/7HwcXNH9EupfaPGfi5txfqATwNTfybPZkW1nSWWJkjRvllUoicXmazbO7zBfe+8NG9crPq5nyBO+P2hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lqz8dQYN; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lqz8dQYN"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cfdc2c8c9so10350595e9.2
        for <linux-staging@lists.linux.dev>; Tue, 11 Mar 2025 04:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741691804; x=1742296604; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9Ee2vMUDZRdjGNIbzmhry++VVeENs1uRLq+FlAoQjWA=;
        b=lqz8dQYNzJiFnExf72++5Chk2mDYcaf/Zt/5+0zzTN2IO0qag+py3zJbm7a2UGs1ty
         RBoL79n52s4zSL2NTzRqo0AjefKMo+cTavAoi2BRJH6wy2K5AoKwOEYGqpFbiAut99Az
         w/kJeXWjB3Z5+02dfwE6p2i3vh1SjF+dpf/2cCQniYYurRgWIq1wAQ9kdn7a9O+zvdpM
         q/8kNYAXTHNwhZcIZrMdOXV+qOlwm7wZrHVIzdWITiwtCJNWP7tvs9WGFXq071I63pg3
         v0/v70PCN3OttsmG+fs3vhTFHdcB4GBW6OtpxZvg1jeIJ13eCAHU5ReEu6iu0Ri4pSAB
         4Qmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741691804; x=1742296604;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Ee2vMUDZRdjGNIbzmhry++VVeENs1uRLq+FlAoQjWA=;
        b=fbMGoaoIMKNI/0xzVObLaDFGCgx9l8Zy0cbp7lMP+dwgQcZ6FE/QqnauBeco/yiP8G
         pF0NV/uubDTuufcLjx6n/XoW+GPUuebNYA4H0YNGLJiDWmhz6jIXKnJn/3G50TH+YCBj
         wS2+ABNInboV80ZjjOrZASfUmyEzZ+wmUfL24Plh6nbzXsnnS2dmL27cz/fT26mpH/HE
         UT47JZeL1SjK/7LiDXWUcsMt8Fg4YfvBs2KNYSnJTfoMpTDNF4OIIF73P1p3DhcbqYFU
         hoPSjmzdTOE54IzquouNbva9Kkx2+cM7GVlUW+Y9WQDPqPzUgT+GiYVXV9rjkUtsLaZe
         RDQg==
X-Forwarded-Encrypted: i=1; AJvYcCVl04GGq5D8RHua+U+Hk9k7gavBHaHZdggsyO7jaIyFRkOtYLAeS0p0UxDx5e3lQANKjq2Fo+8VJKSjqxJJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4TYKCyM4PQpaVBGne+8yfaUYsO6NX8L9nq4mHzk54mKjW1R1x
	LdPMpas9FwdpygO6RiqAgDjIwSShtjJ7oPFA87vaJ24ag8HuYXZhnYS5cH2O5+c=
X-Gm-Gg: ASbGncvpVxCsywOmNesJHH10Dn+iNSyRWCxj9oJervL4kNZ86rGjTVna/ldg7vMWQIr
	jedDGdoyEYQnU+18aaEaqJ71Y5NZUiIGnA4xf9crFtNAKdn5ckzli21QyiXO42hLSpVDoPEH4Kz
	DqeFGE2O88RsNrVeH+st2fndo4g+mFQvyM60tmeDsv57ppnzh6mP9+v+gO/wsfBU4u7nVca36zJ
	cuNnt+FNtige+7LEnBxl1dpN/z26u5M5nOUyDiwZG7+suvj2vqBXWTU3x+AAOdsoIQ9VHLtdF6f
	m8M3M2L+tZAMVoNt3/PAZinwLZBaF+B5YIFeM+y4cvlCPYL6tg==
X-Google-Smtp-Source: AGHT+IH62B2vN00mbQ7cGtF3KOTyZWYGf3hAB5PaS1iAsRYUThgYmKN7VFoKRyfU1FM6J06fivQQQQ==
X-Received: by 2002:a5d:64cb:0:b0:391:3fa7:bf66 with SMTP id ffacd0b85a97d-3913fa7c415mr10740994f8f.31.1741691804523;
        Tue, 11 Mar 2025 04:16:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43cf0c42eb6sm87876805e9.16.2025.03.11.04.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 04:16:44 -0700 (PDT)
Date: Tue, 11 Mar 2025 14:16:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: vchiq_arm: Don't use %pK through printk
Message-ID: <01a1fcd4-b626-44a2-b850-bf0d8b9efbfa@stanley.mountain>
References: <20250311-restricted-pointers-vchiq_arm-v2-1-a14e1c0681fc@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250311-restricted-pointers-vchiq_arm-v2-1-a14e1c0681fc@linutronix.de>

On Tue, Mar 11, 2025 at 10:40:49AM +0100, Thomas Weiﬂschuh wrote:
> In the past %pK was preferable to %p as it would not leak raw pointer
> values into the kernel log.
> Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
> the regular %p has been improved to avoid this issue.
> Furthermore, restricted pointers ("%pK") were never meant to be used
> through printk(). They can still unintentionally leak raw pointers or
> acquire sleeping looks in atomic contexts.
> 
> Switch to the regular pointer formatting which is safer and
> easier to reason about.
> There are still a few users of %pK left, but these use it through seq_file,
> for which its usage is safe.
> 
> Link: https://lore.kernel.org/lkml/20250113171731-dc10e3c1-da64-4af0-b767-7c7070468023@linutronix.de/
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
> Changes in v2:
> - Fix wrong replacement with invalid %K (Dan Carpenter)
> - Link to v1: https://lore.kernel.org/r/20250310-restricted-pointers-vchiq_arm-v1-1-dd04f208ee55@linutronix.de
> ---

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

