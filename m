Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5212381B18
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 08:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773651366; cv=none; b=gAclcTA7XnQTvoSH7q+znYsVS+SBWkfkqONNye0fZw/GO33guNzYwbdyOz0J+eKPvgod+9O0GKzW//0HEXPtF/pb9CJ6FXO4uxvPPFx0N0FiKHWCDk19OEtOq7nIpIGauMKc4s+/NPflYhTq/C+6bGg4h2a0BAcRO/k5J8p8fKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773651366; c=relaxed/simple;
	bh=eABlA2VDKd3+5VX2KjIEWTpjrYdlhep34hzJgLFMIQ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gFMImdvbpl6CN5/zU+HZcYFZhS9jnfY5NRpfgJFzswieEIvTkQgykoB/02gAt2K9voCYDU/vqYjRXb/rC8YdtFHmCJ9FOMidQ91dE3xJj5emLhKCyZkIhn6gIqKHsy6Y32VHZN4jJHyVLgw9CqYUOUHMS9owh3bVEJRX1oPVuBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HicqvXdg; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HicqvXdg"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48540355459so39598945e9.3
        for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 01:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773651363; x=1774256163; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ElOuVFXFpDm6rPhqYIQli2UADT/0TqiBL46FFSx3R8I=;
        b=HicqvXdg//cbDgEvaQNHU8zi9/KsDg/Xiau4er/H+RAFi8588bcSQdWF5Oq3AeYwrT
         LNF+mrltzk++Ai27v5/5GcSvv/zCZnRnwvjFo/S1xkKN2yUq4BLH2qq1ZWKgsXj7oIOZ
         7jiji4zyuUyilv3VuKYM7FsORIlK7gaFLw2+ljTXVJ0Qbbdy4Czjbl/CDZmVxp/Ev+PL
         mClz4ClcHksoGtVlStZjp1QMgRv1pG/kFcI68hNIDYUQSprDsLDhA5S/0GbAIs0GM2FY
         0OkkilzryFpyRKQYWWUebWv4P4k2XFT5gjFALPjmYoAcdzfQZ9lA7J6glkWR/hoJ3Ifo
         OQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773651363; x=1774256163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ElOuVFXFpDm6rPhqYIQli2UADT/0TqiBL46FFSx3R8I=;
        b=ZSmsZNgowqSuI5u4M5Zc97yABJdMXowR9ifcCq6LL7aQIXoIascDKMFfErct36gM5S
         HvzCJuYnhPGOuE61ez02Izyq4XSqrEkeufehqJI7JN/PCPYtzXXWHEjpCU2XlNwMLV//
         oIVL+IXoPJIYZAI47ZRM/f8uu/TGR93CPeeK0BSnoSaYsITdGNcZUWQPGuDANA+6U6Qp
         ssd9f/7xao5Lwj3FcTpm6wfq8mWHkCVEguox+qFUJs8ozLOsRWyw0DUcoqBwpTK5/scK
         1wTDRQW2V6XwHUim5hGj0lan8tkZozCMudTpR9OEdW6Sx30II2X8fBxqw2qvutCCVgov
         59fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVO7qVDeUN4O8d4BMubolJNZScOKxnt25D8VrsXw66uTRi/F/vRRe4NbLISBw51q4SRMO7NQnq++NikO+Fg@lists.linux.dev
X-Gm-Message-State: AOJu0YyM2hrRBqS+m9lgOClwTSqRMx5TrcKi/xw60Lj9kPtpObVHO5je
	sOg/xutRb4z7sMVN65NfcP/JsGi+cyyZ84xXg05+JJAR4od6u1/DcDAJannsT67iNyY=
X-Gm-Gg: ATEYQzyXppbQRHOFjTVJtQa0MDdgygVDrXByhTBlfhZczHh3wOv94uskOZfxypb7zqX
	d0UJFdYhp7gKI85G78wkeMy9em+f5iLmVyTSlhm0M1ssviRM4X7s0AnWDZh49feFjpKsHLxUwfI
	cHFHUTHaAa1FL4q4E+OjFTcvxolLkL+68gnkyOjvCnWqt1rS4NvulgOFIcNs34yIZULcrjPSlOW
	S2lOpks4WHxh7h8/pBtYUz4G32xKqqoRWSuCnLDTVREb7t8E2bqfzOL/ZqmRyVVO9daWrwspxLv
	w70CbA5fUHwUgcyMxGk1+PDpyKfzUZEr7fzhAHpAlKkGBOKBPSrDGEAolQvteBIrfqqtds3fAt6
	4bluzmA726080LBtuqRbQ6FvzLdzzpnPmZYszyP1dwuyAbS7PsgObaQjkdsqjDPU+j0P5y8Qjce
	78wgm+VPPINva3lBw0YVWL5v5CIV/X
X-Received: by 2002:a05:600c:8b6f:b0:485:550c:cda4 with SMTP id 5b1f17b1804b1-485566d9318mr194216815e9.8.1773651363073;
        Mon, 16 Mar 2026 01:56:03 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4855778eda8sm138525295e9.5.2026.03.16.01.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 01:56:02 -0700 (PDT)
Date: Mon, 16 Mar 2026 11:55:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: OaroraEtimis <oaroraetimis@gmail.com>,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: Replace busy-wait loop with udelay()
Message-ID: <abfFn_AET_xAVjji@stanley.mountain>
References: <20260315150532.87280-1-OaroraEtimis@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260315150532.87280-1-OaroraEtimis@gmail.com>

Hi Sudip,

What the status on a replacement for the sm750fb driver?

On Sun, Mar 15, 2026 at 11:05:32PM +0800, OaroraEtimis wrote:
> The empty for-loop in sw_i2c_wait() triggers a -Wunused-but-set-variable
> warning and can be optimized away by modern compilers.
> 
> Fix this by replacing the unreliable loop with a standard udelay(2).
> This also cleans up the unused 'tmp' variable and outdated comments.
> Include <linux/delay.h> to resolve the implicit function declaration.
> 
> Signed-off-by: OaroraEtimis <OaroraEtimis@gmail.com>
> ---
>  drivers/staging/sm750fb/ddk750_swi2c.c | 20 ++------------------
>  1 file changed, 2 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/staging/sm750fb/ddk750_swi2c.c b/drivers/staging/sm750fb/ddk750_swi2c.c
> index 0ef8d4ff2ef9..d0aeb917be92 100644
> --- a/drivers/staging/sm750fb/ddk750_swi2c.c
> +++ b/drivers/staging/sm750fb/ddk750_swi2c.c
> @@ -11,6 +11,7 @@
>  #include "ddk750_reg.h"
>  #include "ddk750_swi2c.h"
>  #include "ddk750_power.h"
> +#include <linux/delay.h>
>  
>  /*
>   * I2C Software Master Driver:
> @@ -80,24 +81,7 @@ static unsigned long sw_i2c_data_gpio_data_dir_reg = GPIO_DATA_DIRECTION;
>   */
>  static void sw_i2c_wait(void)
>  {
> -	/* find a bug:
> -	 * peekIO method works well before suspend/resume
> -	 * but after suspend, peekIO(0x3ce,0x61) & 0x10
> -	 * always be non-zero,which makes the while loop
> -	 * never finish.
> -	 * use non-ultimate for loop below is safe
> -	 */
> -
> -    /* Change wait algorithm to use PCI bus clock,
> -     * it's more reliable than counter loop ..
> -     * write 0x61 to 0x3ce and read from 0x3cf
> -     */
> -	int i, tmp;
> -
> -	for (i = 0; i < 600; i++) {
> -		tmp = i;
> -		tmp += i;
> -	}
> +	udelay(2);

What an interesting thing...  This function has always been nonsense
since it was first merged.  The comment talks about the old code which
did:

	while (peekIO(0x3ce, 0x61) & 0x10)
		;

Which apparently "works well" except that after suspend it becomes
a forever loop so instead of that they have this bonkers "count to 600"
loop.

Your patch looks reasonable, but generally we don't merge that sort
of patch without anyone to test it.  The problem with merging your code
is that it looks so reasonable, that people might assume it's correct.
Meanwhile if we just leave it as-is, everyone can see it's totally buggy
so when people report bugs we'll know exactly where to look.

Sudip was working on a replacement for this driver.  Let's ask him for
advice.

regards,
dan carpenter

