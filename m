Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993D6306D2A
	for <linux-staging@lists.linux.dev>; Thu, 23 Apr 2026 21:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776980479; cv=none; b=NRg1nQiWLUK6TnruXmUmd9kl1IeP162gyLakIZqsVHBZjPZav4I1yek1oyjen518DSLnRXAe9SFwzHPNN36XLVvFV0caTnY5JBEahd7yLqlTPkSC4OtctS23pnzq2PpKl8fmVmLY3SkXnorhWcsvCPSYEVJBXVJ6HjitjMbWYvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776980479; c=relaxed/simple;
	bh=JEKsVBcRrDVMqqbEs7/mfp7dXa3KIoMMkKfmuqiHclA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=omz1s+59mCDiWzL/9hH7YnijqEJxPhT2CJ3SImlaI0CvLmrEOfPWdyxQlyssqEe9E9exNlp3fdCZTKNEtOEW4b8vzscVx/ysMfMQRCNJ5JW5kjW5Ez5cP6hJeIxnYYM3qxV9/LsaikeN8ZduSd7hgMlk6U08t28/5nsGXvaiSAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gZ/OTE5o; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gZ/OTE5o"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso32345495e9.3
        for <linux-staging@lists.linux.dev>; Thu, 23 Apr 2026 14:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776980476; x=1777585276; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rqvuiv9xtBmAtPWBpCuwRI/0uOECtqSe1ZKpqdrsv0M=;
        b=gZ/OTE5ovug2uqeVF22HjcxLti5ImKKc//dthLJV3dxjzw4ylTiyHB4QxTa1JLgHtR
         Zh/EtUo2+K2+GRoAdAfDt2FZk+HqWDhkH1prPC+Vy0ydgVXEeGnf+6sgnnPpniUQ53ep
         3jJnxu41t9LxCigSaeJ3N9X72RhmO0BWBelGe4mwuxRARMkNgBZTT6a6uBbq4e4NjC/y
         A4cEVA7o4gktiN/0hWqwL9dnaXfMp9e0GfT50PQxfL0/ER4NjeV1vVwEYpDZJGjrZMD/
         1sDyw1YSyxmxNwm3qWqFm6zycpbQ4HsBU3H7SRWbPzXuuvU/Wd/hVtZx9hHwr3BgNXhF
         XZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776980476; x=1777585276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rqvuiv9xtBmAtPWBpCuwRI/0uOECtqSe1ZKpqdrsv0M=;
        b=j89Fw0EtaoVr+lpsEdTK/vcP9oURZuMagjbrlh5EjLEwq+VEWCtfrzzv3EX8wCeRP3
         nsq+Jofygij3eeGQz6e15cIdTY6mi+vK/N5TwmjJiPk4Qf0ZwY2hUD003yifJ2KhnB8V
         le7ryR2aC4BroifpEgdmsQUF6lBXZMsYxID80IL3Xzj4JVi6TzPghwwg1CTO1lOWGCDv
         i89O7FOpkZ0yly9bI74mtLs+jYnFohsssUXO4jly6kniv6Xvq+dKCuDZ/O1Rein08+z4
         0cGz+b3EUGh6CsxlQkljpKLY+bpAbi0a6GAQ1m41RQJ/CwgZvVL+4e1RS0++kBjFsEdR
         lCYw==
X-Forwarded-Encrypted: i=1; AFNElJ80hl+Pbrqz4HA6u8P1fjmzaS9s0tcYjWCldGdcmQqTSkYSWjxmSjFyNo/Tv5bIW/FYI7niva7EercwLCzp@lists.linux.dev
X-Gm-Message-State: AOJu0YxUgaXVLktQHIG30/OCQw6mrx/bQphlcP7gpzg+2B6tEWaoVmle
	CudfyFOVCHQtICbxsuZEUleUVEhNqlTnZCcmPvJ/70fZCAO4dYalB7BDh1wt+XS4
X-Gm-Gg: AeBDievD/kdK2Ec0DTyC9UUuUJ0rIAYhT7OqrLXrxyKgxc0C1RWpycSVwgwRO17W251
	ujITFkn/eTyybwSZZDAjbh/5c2r4M8B8d+pO+5HseLNteHtKIegeSA8I9A8mqg7B5mLGlmBt/kL
	LVwSlwvQPo982cuZB/QM94HjvPA3hYlYE5ibHvyDyJ20zQjG4+muRb+2Hj0EgfDsMLAd6rPBU8F
	S9Vgw+k5nR1NqQKbMTDIDYv4IApIOAk4zRcJS6jHdEXkXwLwjCj4lRPuL61pU0OlGAAgtVWjSHq
	wBrxDRhErftt8y5cvUNDbeM45MwnVXOrGAcsINkFN2H43aS7ZgL+kjnjWCIQlY3/cSmoIDsTLMe
	L/Xuuu4Eo5Kq2W1lfIgMZvWY88GgngBecWyVhkaXn8I9xKxRcqNb3ruBMX/JOqGvFXKkK+gaUiQ
	Ng2C26CizJLRKbs8wJI3LMJSE0bqlPLGhK+JFf87uS7KOKzJumRm/sZTVJS+Hf3j1KDn+jd1MXR
	EQ=
X-Received: by 2002:a05:600d:8454:b0:48a:5970:2003 with SMTP id 5b1f17b1804b1-48a59702216mr106747235e9.3.1776980475822;
        Thu, 23 Apr 2026 14:41:15 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fb75a913sm166466805e9.12.2026.04.23.14.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 14:41:15 -0700 (PDT)
Date: Thu, 23 Apr 2026 22:41:13 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nick Spooner <nicholas.spooner@seagate.com>
Cc: hansg@kernel.org, mchehab@kernel.org, sakari.ailus@linux.intel.com,
 andy@kernel.org, gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2] staging: media: atomisp: Use str_on_off() to fix
 Coccinelle warning
Message-ID: <20260423224113.643cddc5@pumpkin>
In-Reply-To: <20260423194727.3200344-1-nicholas.spooner@seagate.com>
References: <20260423194727.3200344-1-nicholas.spooner@seagate.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 23 Apr 2026 13:47:27 -0600
Nick Spooner <nicholas.spooner@seagate.com> wrote:

> Fixes the following Coccinelle warning reported by string_choices.cocci:
> 
> 	opportunity for str_on_off(on)
> 
> Signed-off-by: Nick Spooner <nicholas.spooner@seagate.com>
> ---
> Changes in v2:
>   - Include "media" in the subject line.
> 
>  drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> index 4026e98c5845..322eca4a3755 100644
> --- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> +++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> @@ -13,6 +13,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/gpio.h>
>  #include <linux/platform_device.h>
> +#include <linux/string_choices.h>
>  #include "../../include/linux/atomisp_platform.h"
>  #include "../../include/linux/atomisp_gmin_platform.h"
>  
> @@ -917,7 +918,7 @@ static int gmin_acpi_pm_ctrl(struct v4l2_subdev *subdev, int on)
>  		return 0;
>  
>  	dev_dbg(subdev->dev, "Setting power state to %s\n",
> -		on ? "on" : "off");
> +		str_on_off(on));

While someone went to the trouble of adding the 'helper' and the Coccinelle
warning; I'm not really convinced it actually improves the code.
It doesn't even do &"off\0on"[on_off * 4] - which might be an excuse
for a helper.

	David

>  
>  	if (on)
>  		ret = acpi_device_set_power(adev,
> @@ -930,7 +931,7 @@ static int gmin_acpi_pm_ctrl(struct v4l2_subdev *subdev, int on)
>  		gs->clock_on = on;
>  	else
>  		dev_err(subdev->dev, "Couldn't set power state to %s\n",
> -			on ? "on" : "off");
> +			str_on_off(on));
>  
>  	return ret;
>  }

