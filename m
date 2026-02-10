Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8102EA151
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 06:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770706243; cv=none; b=p6xlt+Xr6AH6k7H1eTY2Xks4PhS2uqjs/A7uA6yQcbU834LShIa7NZmaj0gctw/0V8eW18m+kTQDb+qQTk+h3/ofn7vZO0XSgY+Ujd2Sxjb0vCiogcQlqIoS873mx7n2jriVl2GwbAO5TPYs6Tf9AFurytTAPzTbsdu9D76zeQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770706243; c=relaxed/simple;
	bh=ziIwfdWrLMZKQdz88g4/Gp2tXYcAS67ujYqr2k5I31I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YbW9ZONbFLZO853bkGcfLmE/KogoDZ6m6F1WLlc18I0rSlqmuuIOIOsJCsvOcUSTQtEIcD18y4e9ziFabLTweF0Rjhc8Uo/yTxmHUJe49fMidQ5jx6jPaygdqMdUOJjJrX4lueHs60ZIwLtddOya5xOSJHW9b/+/ZnR+7/ljYnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YLdBn6G6; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YLdBn6G6"
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so31135925e9.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 22:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770706240; x=1771311040; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ns007NcOBuy7TVgVTAMiclCNP5pgSsFA2zQweJd7GMY=;
        b=YLdBn6G6whpdNFla3UyvkYw+UtNhxb41W8Kyqplp6LNWYbgY6VRydyQWzREYOZVkGW
         680nhk4+YNfA7OaeOnskyHvv9hcCWRgt8Y5nE7oN1qOvDDtsiHd8Q8BUZLxQw0wrfy1Y
         2y8YMD+wLbKERwyVVihOi0vlQzKfKD8bf9JifQmwexNlBMNMzjvFOBMgsdqx92BsekEU
         jHdMSEhXasp4/MmHvIA7hcAXL7ZYCxJlr5iOpRRz0bWZaqnohWRAB5hT0lcuunLlkadQ
         LNhXcx0/GZlAp7AT+I1XSZ3ivUQtxQYXyDXDLyupw9oDo1sSzuXX1Ss5pMecbVn4q1f7
         XYGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770706240; x=1771311040;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ns007NcOBuy7TVgVTAMiclCNP5pgSsFA2zQweJd7GMY=;
        b=Cpb15lZbBhXXCzOhfHz1jAhiY88A8aHU+6xWo77sCTZUvpVbI0oeoGJmmTX1oZffmX
         EMdqOwPTpqhxA4oZl6qfAOgBXQ7bamhLZOmQBFCK9ZXcoXLccfg82zNkw6VaE8glD/SI
         EKpJH4iolIRcFrxbKhuKpDIaKdabmnsGgIjPa+OVLApw1JwHVZzwDqKC85Mqr61ff+oe
         H7HhxLTHmHhItAFXBi2gUT5ggB8sKXzlVYVYniYvcBvv4epKj7VQjyJx9LQY+09nmNkV
         6oDPX8dJDS9982BgjPbDCUR/GZX+yZ7XxOvh02ZTXiF4+0DPZbT7qe54oskaPm2PslmB
         bKyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrLMnD0SpgtsFClXaZYj0WIuD3tKKU8d8HVYKoyOZlrN0AGjaLz5S1p/N8N5hMJPk8VZlT7tWiajMhYjXi@lists.linux.dev
X-Gm-Message-State: AOJu0YxkjDIpUAtDItZoDTSvlpRrSUm2OfjFON0Mp+XjehVxokBVbtbo
	i2iThFuYYMCUe5DoKnHZQI9O/rP0ozK2L1CtfMHBbuoUhQuPIG/BH6y4X+zyI4A7HVs=
X-Gm-Gg: AZuq6aIwuud8GJBzgxWf+2i/ul525glFsAljxIKxuCLv7VGK5sn1mZ10oSfBZ8glAWE
	XSRqTrKhz+VKUveL8LD4l6D9sO7ZdpuBeJMCMNC0RMCjE50HajfHyzH1LiBEt4PAQLAnPodBQrF
	J3FdlOEZouYINMGICBQRR9qeY8VJLuduRc0+UbevErUUMXrl8jsoKmtMN3A2PlCelzw6ehQ9ZlX
	9FsVks9pdUs1dm4q7nUlDdg5gOSjgon7O4eV9wI5iWh5+DaQk8vDIrsow3l5p0roeR+8zip/bcw
	AtYD0R+P8RMMgdlhBzqCbCU2/B7BBWySjFFz1NjT1oG15rQKYboigaCSjTUm3pQE9GVy/aY7Vdz
	TCLZTetSpulUIoovCRXXNWFfgpZjlOhsEc/FD9/Qc5Az3ZAUfCUU1BdpZOViEyT9q2RlAX49ILA
	ltgYVA3lEEzI9Pndl/r8K1xE5QUQ9w
X-Received: by 2002:a05:600c:5253:b0:471:114e:5894 with SMTP id 5b1f17b1804b1-4832021c93cmr206793935e9.25.1770706240265;
        Mon, 09 Feb 2026 22:50:40 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d7d53c3sm42953265e9.7.2026.02.09.22.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 22:50:39 -0800 (PST)
Date: Tue, 10 Feb 2026 09:50:37 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yoelvis Oliveros <yoelvisoliveros@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH] staging: octeon: type change from uint<bits>_t to u<bits>
Message-ID: <aYrVPUj1nma3DUPo@stanley.mountain>
References: <aYq028TNyXQWZ_v5@home-pc>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aYq028TNyXQWZ_v5@home-pc>

On Tue, Feb 10, 2026 at 12:36:31AM -0400, Yoelvis Oliveros wrote:
> Runing the ckeckpatch.pl on the staging/octeon driver they where using
> uint<8/16/32/64>_T as type declaration and the checkpatch.pl was
> putting a [CHECK] flag on those and that they should be change to
> u<8/16/32/64>
> 
> Signed-off-by: Yoelvis Oliveros <yoelvisoliveros@gmail.com>
> ---
>  drivers/staging/octeon/octeon-stubs.h | 1922 +++++++++++++------------
>  1 file changed, 972 insertions(+), 950 deletions(-)
> 
> diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
> index 35b5078ba51e..aea3dad37cfe 100644
> --- a/drivers/staging/octeon/octeon-stubs.h
> +++ b/drivers/staging/octeon/octeon-stubs.h
> @@ -1,188 +1,190 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> -#define CONFIG_CAVIUM_OCTEON_CVMSEG_SIZE	512
> +#define CONFIG_CAVIUM_OCTEON_CVMSEG_SIZE 512
>  
>  #ifndef XKPHYS_TO_PHYS
> -# define XKPHYS_TO_PHYS(p)			(p)
> +#define XKPHYS_TO_PHYS(p) (p)
>  #endif

This isn't related to the commit message.  I'm not sure that it's
really an improvement, either.  There is honestly a lot in this
patch which is not necessarily more readable afterwards.

regards,
dan carpenter

