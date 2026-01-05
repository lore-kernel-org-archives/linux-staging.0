Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1AB155322
	for <linux-staging@lists.linux.dev>; Mon,  5 Jan 2026 10:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767608208; cv=none; b=u22wrTU53zcZs9xkhvt+pmn0/Tl6j251b3La3RN2DvWDTthyuGEBM5qCYKJdqYYlZmGcCJcYrfRDKqASlF/O/uOZA3VSkMp97Fp2edDMDUnuuQP+lEWx+W5Rf/+PMf4fGxLI3GBuinTuA4hRJAbuYmpM4cC5zfIboicaFNXl0j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767608208; c=relaxed/simple;
	bh=hlEGZo/eLhDf39DBRhDdA70sVQ/OKRKGpxjg0bmNqGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JYP7Rwy3PMWn64Yi6H5RvTf3aD3IGA3CxqZudWirU1l3RiNJtTboVqQDPfq3E7FDYV6N1IkWTurvsowpxfTDywegO/s9YHRr6nuQF38JXdCc4Av3Gy6kA2x58/5zxAmkSq2vY9H54RLRtAhLgP6SKw4o93jNuCQomD4tbqZf360=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nkzQdEYu; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nkzQdEYu"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47d3ffb0f44so50150235e9.3
        for <linux-staging@lists.linux.dev>; Mon, 05 Jan 2026 02:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767608205; x=1768213005; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iV+UDzommVY2aDcUuH+0k89DYiMteCt8ig5zrzxx51k=;
        b=nkzQdEYu4c149vfVNv7j1MnYHxCWStDMECtHbyWbtPN1VxRKctexvQnKARWrTWxZ/N
         Out7B0FgNubVXT5OQBUXzersW318jln1OxPsV/LZlLkdTYNHewq5dW+zsKb5sRtMdQuA
         Lx2gUYUsHdsF9DskV+q/LMemq9d+Wycz+gcYHDgStgFlsrPft7uva8szCNrxzbqUyijo
         hGJ3HCYeDIxZijm5Xh2gE+o3xG/ydygIew8QIhiqITfFhnlj7klkZgfS9pS1lzEFtfUL
         J/lL2LMclbdqS4rWDQxTghpTS52wE6vK6I3p6vWitfvROHOCZfXHJ9NHRm3rmU/ywSEh
         wvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767608205; x=1768213005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iV+UDzommVY2aDcUuH+0k89DYiMteCt8ig5zrzxx51k=;
        b=n/i9OPmrPFgS31VVaUImX0M8RxvZpjN74EKFuOG6QMwLUva3X7RYcYKLAkto30dTlT
         u20snQovXlnUgVtzVOzvXRQf/K9xxhLB+f7eUjCAGk9j+CrKOPelvuVuRj5wZ7bQbsCQ
         Q6alJKQED/i+qU53hcD29R0CAaOSscS8EVkKe6VbWPLYWfHKpVLeE6g6Vc2F4frG0YS2
         9oWqqc7kCPtO13/sCsErP7ECv5dNMoXj4PHs/rFWl5cjXTw7VbwVrlQjphGTaA/gTwRq
         NzgRG8j/noPxxzCBw+h/3QDoZSzsPwvfhqZr2CLZykzXvQefTGfJNb5yyEvLKUCBQQft
         wN3Q==
X-Forwarded-Encrypted: i=1; AJvYcCV5BTa9wYr+ak9hcNHRY0wyJRNZPK6dr6/0LZsBv4LpinCSDFKyAqKr7CiY+rIdJfR+f+fGNq+DDRC4LPC5@lists.linux.dev
X-Gm-Message-State: AOJu0YyQKiyIvlskzTz5txYgt8AX1Xvw00oGf5BV8ZLpcXt6N+TczQAG
	3IAtnHX4vON7csE4Lhi/Z4clWcIJk04dytOPhuPZ0l9XCQrC5Ir2i00L+8MZZi311N4=
X-Gm-Gg: AY/fxX5VH2OAZ90pMdA8deCoIfXZOQIJrWMlFwSNEur8quRi8qjv61/j+u4PKLgAoJR
	zAG2Je8IkEK+ONJ8KC+ioa8HXZpJG72P3X7c8vrwOCeco8Akh3XN5xwZHbcaLy7mqqBbMQPV+Xg
	yrmz3P+a8OtuJzSJngTVdDvgp16108I0YKPM8RmwfQudfL3jHhgv5wMluoE5nVMCLcyxoelkIVl
	PJE1HvkufYEoZYrJOyXWcQJUCK+UTXHAfL66rt69LpwPW5J6Q6a6IZEkXUx/FKNhymgGM7nS1x2
	FVkSS4Vv9e3xObVgRfkfhiWp4SfczrdXdBKGQ6QV4NDxFc8roycoaSsyOJJhZLgbtLGUGKIibm1
	Zoa2ubFZWvM2UV7NHdQQlOZkULDrfQ3oh8fZk216IGZLcK/+YsbnuX/gIqjmEWcvLN9uesAVsXb
	kJXsryDfEFSINLq6Sw
X-Google-Smtp-Source: AGHT+IECuo5OdIdd8uBzJRpVSu3a+jGgOiKpMmMmsG02MDoyX754e87kGTbCK4yDQtoy9l/ScP/qiA==
X-Received: by 2002:a05:600d:108:20b0:477:9986:5e6b with SMTP id 5b1f17b1804b1-47d1c038664mr424336255e9.28.1767608204857;
        Mon, 05 Jan 2026 02:16:44 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4327778e27bsm66369075f8f.12.2026.01.05.02.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:16:44 -0800 (PST)
Date: Mon, 5 Jan 2026 13:16:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: greybus: arche: drop dangling Kconfig symbol
Message-ID: <aVuPidYUPZxCOdRp@stanley.mountain>
References: <20251230062704.3339404-1-rdunlap@infradead.org>
 <d81069b8-04fa-437c-8bbc-51360784952a@infradead.org>
 <aVuNzWb3TEj74t2M@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVuNzWb3TEj74t2M@stanley.mountain>

On Mon, Jan 05, 2026 at 01:09:17PM +0300, Dan Carpenter wrote:
> On Tue, Dec 30, 2025 at 10:23:40AM -0800, Randy Dunlap wrote:
> > 
> > 
> > On 12/29/25 10:27 PM, Randy Dunlap wrote:
> > > --- linux-next-20251219.orig/drivers/staging/greybus/Kconfig
> > > +++ linux-next-20251219/drivers/staging/greybus/Kconfig
> > > @@ -206,7 +206,6 @@ endif	# GREYBUS_BRIDGED_PHY
> > >  
> > >  config GREYBUS_ARCHE
> > >  	tristate "Greybus Arche Platform driver"
> > > -	depends on USB_HSIC_USB3613 || COMPILE_TEST
> > >  	help
> > >  	  Select this option if you have an Arche device.
> > 
> > Perhaps I should have left COMPILE_TEST here, like:
> > 
> > 	depends on COMPILE_TEST
> > 
> > ?
> 
> If we're going to do that, we should just delete it.  It's been
> impossible to build for eight years.
> 

I did a `git grep 'depends on COMPILE_TEST'` for other drivers which
are never used and only found this one which was disabled in 2018.

regards,
dan carpenter

commit da2827a298f8a2159f31466759cbba2dd4f1b65f
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Fri Mar 9 22:45:26 2018 +0100

    usb: isp1362: remove blackfin arch glue

    The blackfin architecture is getting removed, and this is the last
    remaining architecture specific setting, so the various hacks
    can be removed now.

    From all I can tell, there are no remaining in-tree users of the
    driver, but it could be used by out-of-tree platform ports.
    I've marked the driver as 'depends on COMPILE_TEST', short of
    removing it outright.

    It was originally written for some ARM PXA machines using the same
    chip, but that platform never really worked and the code has been
    removed a long time ago.

    Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
    Acked-by: Aaron Wu <aaron.wu@analog.com>
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/drivers/usb/host/Kconfig b/drivers/usb/host/Kconfig
index 4fcfb3084b36..b85822f0c874 100644
--- a/drivers/usb/host/Kconfig
+++ b/drivers/usb/host/Kconfig
@@ -360,6 +360,7 @@ config USB_ISP116X_HCD
 config USB_ISP1362_HCD
        tristate "ISP1362 HCD support"
        depends on HAS_IOMEM
+       depends on COMPILE_TEST # nothing uses this
        ---help---
          Supports the Philips ISP1362 chip as a host controller

