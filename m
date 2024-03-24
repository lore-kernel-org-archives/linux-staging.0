Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F698179AA
	for <linux-staging@lists.linux.dev>; Sun, 24 Mar 2024 12:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711281971; cv=none; b=Zz9fYuL6Ij+bJIKlICI1nofyWsFMyDpyAUmkKqDZnNhxuAgejUvJGiXtMf6RoDoYqzFrUaJWUV8cpUcfAD+Y9YCxEtAubcnTY9Y7op0aeckz3/nWeBGKA9khflrr/baB4dVRasRKX6BFeadpJlDxxFjbWRlKRvF2bXSK0UICGC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711281971; c=relaxed/simple;
	bh=mtf1RDgfBz1CQuj0fSdA/b+qA44E+AI5WneOq3D0Xb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gRiz0iOKc8Milp1q3lo/xIshJfJXqfJ10AWVwaIO2r2wzrWScM21QKLefmURtw5yGtue0t3cFtKJ/ioFtt/7NQMDoi6kRLU7rLcG2ohzbKQYK+PVrpWC1Y4W15+0vAU2ptWc5KXxnFVSx2mibvux421spoGscknLsD+fV3zrLf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eLK5K+TL; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eLK5K+TL"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33ed6097ca0so613304f8f.1
        for <linux-staging@lists.linux.dev>; Sun, 24 Mar 2024 05:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711281968; x=1711886768; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CtYyUSACFde+IBYskgVCX0Wr+Na6g8D8ZvFebNcAS00=;
        b=eLK5K+TLIF/474xMJDMKiFohkJ0TE0dti9xy2LLcRu8sUr5x4fDDdqe0dlu+SW01SI
         2J7VR7wl4D4aH4LUdxCAhU2Bs0EF/L5UaIDs9gRNP3+lPVInkN2RjAQzUTS0h9U5gGuR
         qgXN20H+8uP8opjOv39jRJ0W64Z+HQFZbiQYZGmogOvm8zHdgeb5Mh8heDS2g11tF0wq
         0z5OHtrBrLdO6u257FNLPtC4ZmyVy+mLYWe1UKRCiInRXAeg93mfUv4UuCkXKHz9UZNF
         2Egbrd4DNen/ZFZ9QGsRbVac5MBAlmoNhvJ7KZW5GDP0QlabD9hvpxQyam83CLOPhMkk
         bX3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711281968; x=1711886768;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CtYyUSACFde+IBYskgVCX0Wr+Na6g8D8ZvFebNcAS00=;
        b=sSLYddBNHIl+u+qxX6hlrgiuLjUZcWcWCHC+3exGkd7Ux0L9QMKw3xPhoi/aaCgNma
         lHs2GPUv8c8frdTGeUjH2H3lOtUdUPsdDdhTFbkp+6qUt16kHhHR8b2FtDhZq2HaxPTS
         /CrQejEEHI0qO6KSLRpF1WzqgvVZzB+yx9o3sHPX6EeH3yNt7503hyHP8pGmmxsgh93U
         2dOeqCkS0C5n7XpBzcPqoZlH/7BI2H0aE8h2mTslvcgwEQN80vwk2ZJoTINafhzx4MBp
         E+ElBorDfjRCfmZyIV4e4brgWimMQUfA5ux8occqlx8KW/P+6ivwrTXwoNZxy6QOLb6k
         KT8g==
X-Forwarded-Encrypted: i=1; AJvYcCV8v7YK/KsIrC7vKrJ45Pz4f75c84dKV+qtPxia0rRGK0wSNXzcgaj11IyBcHyFSA5reKMicQOBAIy6atFBsqqaYtDIZhrmat1qtxRXng==
X-Gm-Message-State: AOJu0Yzf9af8T/aE5b8XS2kuaBhAQ4vfKYjtoxr+VtPnQDMhLGFamRvH
	uyWItzNfDM3UfmHyzOAVqxy1FSanJLQv/HLFdGuYmJC49L2Gb3JK
X-Google-Smtp-Source: AGHT+IHlXOirsRDZKiAzC3seE+GNVUGaePkht437g4QV4Vul6/RMlMk9xDwrGSXhYmPu2WGx30Ns+w==
X-Received: by 2002:a5d:6708:0:b0:33b:48ed:be63 with SMTP id o8-20020a5d6708000000b0033b48edbe63mr2536678wru.7.1711281967667;
        Sun, 24 Mar 2024 05:06:07 -0700 (PDT)
Received: from [192.168.0.104] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id a1-20020a5d5081000000b0033e91509224sm6666868wrt.22.2024.03.24.05.06.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 Mar 2024 05:06:07 -0700 (PDT)
Message-ID: <11e6d108-e5d9-4c50-8404-766403eb5a5a@gmail.com>
Date: Sun, 24 Mar 2024 13:06:05 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] staging: media: remove duplicates
Content-Language: en-US
To: coolrrsh@gmail.com, slongerbeam@gmail.com, p.zabel@pengutronix.de,
 mchehab@kernel.org, gregkh@linuxfoundation.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org
References: <20240324092917.19177-1-coolrrsh@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240324092917.19177-1-coolrrsh@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/24/24 10:29, coolrrsh@gmail.com wrote:
Hi Rajeshwar,

Please make your "Subject" line more unique. Consider that we may end up
with having dozen of commits like yours, all of them referring to
different removals and all without the necessary information to tell 
what they differ in (except the driver/subsystem). So it would help if 
you add the changed file to make it more unique.

Typically we omit the v1 on the first patch in the subject

> From: Rajeshwar R Shinde <coolrrsh@gmail.com>
This line does not belong here. Please remove it.

> 
> In Kconfig, the kernel configuration VIDEO_DEV is defined twice.
> To prevent doing repeated checks, the redundant code was replaced.
replaced?

If you send in a second version of this patch please use a change 
history. Description from Dan under:
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Thanks for your support.

Bye Philipp

> Signed-off-by: Rajeshwar R Shinde <coolrrsh@gmail.com>
> 
> ---
>   drivers/staging/media/imx/Kconfig | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/media/imx/Kconfig b/drivers/staging/media/imx/Kconfig
> index 21fd79515042..772f49b1fe52 100644
> --- a/drivers/staging/media/imx/Kconfig
> +++ b/drivers/staging/media/imx/Kconfig
> @@ -4,7 +4,6 @@ config VIDEO_IMX_MEDIA
>   	depends on ARCH_MXC || COMPILE_TEST
>   	depends on HAS_DMA
>   	depends on VIDEO_DEV
> -	depends on VIDEO_DEV
>   	select MEDIA_CONTROLLER
>   	select V4L2_FWNODE
>   	select V4L2_MEM2MEM_DEV

