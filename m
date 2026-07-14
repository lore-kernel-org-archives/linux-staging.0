Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFA0481FAF
	for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 14:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784040544; cv=none; b=JAQmzBeyiENHi8eqASQ+UgwA08yXUwZB2+rrQDYj05zUyvmuLX7jDOxORJAXFZHMs671G5ZQQH+pglJ67EVdcXK13/eTPKIcw8+LyLoylCsHXnT6fDCKJf9Lo15ETXHhm+5Ar462vaxf/7n/1MS6d0ED2v/4UrYcjB1ePACRapc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784040544; c=relaxed/simple;
	bh=gPBEjdyji6cUpDbtJJ1jZhYTKfnTZMFMevK4TwfqdxY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mKQPCDyTRJjFxFvMNDLwvhssVx5QNd6Zg70Ej5aEqpHW/NgcaKkpDOraajl5gnTX7P9wxzHyshh+WMEkKy03mX1+EmNotJLSPOD0x5njJM3K8WIuqjXkr9LjzB8Daw3oidOTzDJ1BuKerakE2q2fXyibYMZ9BMFNTMsypaHYxuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ho7XxPf+; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ho7XxPf+"
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-7eb9b427da2so655573a34.0
        for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 07:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784040540; x=1784645340; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k8/cdwxu0uottieq8qk96CFsJjE7R/FEoysB551YuTo=;
        b=Ho7XxPf+BtltdbFkjrgWCrc6P4l/xs04xHquUzB7uJ1Bwpiilu2XgQyhAdXfTpW44w
         NhcY7L7obyrOuhcHxYxR8fhHn3vVmkoAu5dCG5LMTW7nhp6Y5rLJgzOBmbW8NiOYc5pR
         KHBqTXAt2zzkd/ESq9xgIrJpOFlr3yCObdxynmQCDimG199b86vzlb99OhpZoUia+K7o
         XqJJzchEKNl6Xm4kdQP/Prj2tZCKefhbgPf3lHKnd7lJeo+arGbR0r7RJzxqoniKaY0s
         bX6t8yr8LTK8gtm9Z337diUoxXvl83qv7Tr2NBUJwYn01QdIDeAlErDA2rK5f4jzBlGd
         uBIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784040540; x=1784645340;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k8/cdwxu0uottieq8qk96CFsJjE7R/FEoysB551YuTo=;
        b=LXoG/w6wXaL281LE0yG4y4V/dONE05GruVrdj3fx2IYFLhf/rZYlvw6ofNzS2O/dzW
         gAjAWxX/+0SXXKuW2vDC7OXWbxPKFfmMf1wE7DuXW9VbL6MXdd9ppF3L6Gq7JhiQ6lrR
         YM+wa3Np5gR670X6cvUge4rqN5yvAJAhBkzdIEGM5/yJeLHiBCEzXkFEI6ypoggyX4Nb
         vpmv3G4s/OeFvFqouMfwHdiIhMmqwIr3XoV/C0s62Xxg2Y2Fp8G2Mg2sLXb5sfXYxd5o
         HP1nSxpFZbMhOq//dZKkzgqdZ+TdDlaWWM6hcSkOiZMhpAenRyYXBW6+tzMDJ4tNjXV6
         VnQg==
X-Forwarded-Encrypted: i=1; AFNElJ+VkRpwWhzrXDVtzJGaNkkroNan1RU2SdR2K0lVz/SH63J4Le9rTMzbI9pu0vJPxUVw1oQHcRtZ5vRIBnHZ@lists.linux.dev
X-Gm-Message-State: AOJu0YyL4ffn98dmoOL1B8FaeOnuqbjslMnKHA+BBHykRg51tj7Hrxup
	BuTLkFvzXCPri884LxE9QXJJBq5x7YjnRYvA4Z8+Uf3EnYdUHKwY6apk
X-Gm-Gg: AfdE7cku8zmfbhPNZoU7Q5mYl9Na6syk3sZu5ywxHG/bEDGHvQnYKUZ8kzA9ATMJBVK
	RSCS/wz+U5Wfctw0vIsBBigBljPKzJTh73LfpaBibWirOsdlPxyNH96gkB/j6BHtLrOTD6lFioV
	LJgYCGu2nn6RroGltoRha31sqfqbLxDNqHu/2R7Sx1iKjIIAjvM4dWRGt0sgP3luW7oMjaUnKk4
	OqPA/b8jQPNDADhRbK7DWBuWyDSU+ZSNNAAQJ/zQ10veSGVFzQMqo85ktQuyI4BltemE+Wyq5WL
	5qY/HIIXScdXvNIT57oqIZUb+SMNRcMVg/94kSJE1Ba+XT87sUv6cyTdOwyyWJbku+uKtAah4iV
	vx7znt2yCOFE84/9V3DQ0ZBlCwwACeaonZaXhdF8taX16bZ7G9u8dmkoRssZPKrRAqD7c078BzZ
	bMG9lH
X-Received: by 2002:a05:6820:81cb:b0:6a3:73f7:18b3 with SMTP id 006d021491bc7-6a39be39be7mr6231360eaf.23.1784040539847;
        Tue, 14 Jul 2026 07:48:59 -0700 (PDT)
Received: from localhost ([74.80.182.78])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a37b58f98csm11294977eaf.13.2026.07.14.07.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 07:48:59 -0700 (PDT)
Date: Tue, 14 Jul 2026 17:48:52 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alfie Varghese <alfievarghese22@gmail.com>
Cc: neil.armstrong@linaro.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	dan.carpenter@linaro.org
Subject: Re: [PATCH v2] staging: media: meson: vdec: propagate devm_clk_get()
 errors
Message-ID: <alZMVMH5t9WI3iSC@stanley.mountain>
References: <20260714140458.1276-1-alfievarghese22@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714140458.1276-1-alfievarghese22@gmail.com>

On Tue, Jul 14, 2026 at 07:34:58PM +0530, Alfie Varghese wrote:
> vdec_probe() hardcodes -EPROBE_DEFER for all devm_clk_get() failures.
> This masks the actual error code returned by the clock framework, such
> as -ENOENT when a clock is not registered or -ENOMEM on allocation
> failure.
> 
> Return PTR_ERR() instead to propagate the real error to the caller.
> 
> Fixes: 4f75e7dfa6dc ("media: meson: vdec: add driver")
> Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
> ---

Thanks!

Reviewed-by: Dan Carpenter <error27@gmail.com>

regards,
dan carpenter

