Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40AB84E07
	for <linux-staging@lists.linux.dev>; Wed, 12 Jun 2024 21:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718226893; cv=none; b=Gd+KSpuBvEUxmgkp5DGcKoBAen5pWHNHp0+PhitQHz+u0cEeF3byDV9H5QJB8UIloI/w0iBcfHcMZpUw8YEoeNcyTUAB5xPE2CVUvUMNm+OqHEf9AynDpoerFNhmDYE3A9C8aIXs7WHmn/DMKPoeAeqpYCgd2rMnVQHOEAIWmgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718226893; c=relaxed/simple;
	bh=2l4CBWe6q7CNgxn5yu4AhHkrHM8iPliCKhrEYDXKk7s=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=psbkVkF02huqTL6SC9fkc48gdNVT7SgyI5taKTmXFdx6pZ9ySEfJ7CwH02rhb5o4DaUJEyxvb/Tgua+HiPITZQJERR9kI9RJC1iH55FTMg+ypdWw/27jGl+RiKB848qBduc0eoojtf15ch5x0C0XuuRTRVwjlJX5yzBUcedYQGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cwAAXLF/; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cwAAXLF/"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-57c6d58e3d3so24866a12.1
        for <linux-staging@lists.linux.dev>; Wed, 12 Jun 2024 14:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718226890; x=1718831690; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xo5IIcIQjLyjRrtVLD88BI3QmE0inmNeEyBU3/k3os4=;
        b=cwAAXLF/UXfMitiw+lgTSm6Z8zID9b2dMFsA0ukc/S0TI56Pd9h19UTU7htjrxZAmf
         mp4hT7Q6gmOi2kBMZz2M7rUnNFKziqcWpB23ZLBPrU82NiFRey/DOPqGIgkQswzf7aU7
         4kxOeN75JkxhHNu/zWp60NB6roPP7sZcRtPz1aMOQXfVgQW/2h8v1JuWlcnGV/8urE0W
         i3IBQmOYkzwobXF8bCzhrjoI2TVIoZtZIIdmwfMV3G7H36XOiLJQ3bfmJVqS3nECpNB9
         WP/VR6mQbt9g6zuWALaA5YwvqTo01W7ufZ6dD5Gl/F5b6HKNvK/HCmgZo/W87EzI7rLW
         eu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718226890; x=1718831690;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xo5IIcIQjLyjRrtVLD88BI3QmE0inmNeEyBU3/k3os4=;
        b=jQnmWXKYMD2CAfEAH6ljKS1YTT4KB+1/YFG0DufFCyGXRpWiscrcz69By2DEueIWye
         sfGr7s1AcJo4EOIgbELTIfeRi8J4rNvIAdyHQmlEgaeUy8KankckiybR0LueTeygm53z
         IiJd70w2ZFevH1bf7AV7tYBDGqrUHsmvd7SpqWzx4q2SmXHD4KKDDKkFn7HbuSk+Xfnv
         XCMkwSKEVPdsIlk6DJ+yw4O5NQDwJ8ZZM4mpcXxJdpDqykdeoq8xGJ4JhuoUhGMFwqdf
         54FsIwaaphSlO21sCNf3MBI7AspnUJOwEeYeViFBjd0QrDrNbO7ADN+uGg1fAREOIxrJ
         vwog==
X-Forwarded-Encrypted: i=1; AJvYcCUrPdvbIH4oNh6+sSx4NiPOy9fS0/xSLT4QBc7qN7RL7tR/VBNyS6FlmYRLvpZNHSmmcjaJaYPGYZZpGqfKTec8jVPIsofdPSB0fNTF9Q==
X-Gm-Message-State: AOJu0YwfYCiemiEztzSAqZjomZkzAkdALnpOBE5hX/IuEYnT6J3NhE/H
	p13Xo3J553WTO52Mz9NVOWxcZnN7+W8nN2U+IybLZYqgqG/dU0DG
X-Google-Smtp-Source: AGHT+IHzify8DAB7btVxLaOF1hblcRjk7bMIcKkdwn6H44fx5jaz2p0/uO48qfqKrRG09x2M0ZM4Ww==
X-Received: by 2002:a17:906:a89:b0:a6f:513a:a63 with SMTP id a640c23a62f3a-a6f513a0e43mr64541466b.1.1718226890019;
        Wed, 12 Jun 2024 14:14:50 -0700 (PDT)
Received: from [192.168.0.104] (p57935a9b.dip0.t-ipconnect.de. [87.147.90.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f26b84265sm367571466b.119.2024.06.12.14.14.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jun 2024 14:14:49 -0700 (PDT)
Message-ID: <5224351f-7b40-4edd-abc7-c5011a92f179@gmail.com>
Date: Wed, 12 Jun 2024 23:14:49 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8192e: Remove unused constant IC_VersionCut_C
To: Teddy Engel <engel.teddy@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240612143326.6764-1-engel.teddy@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240612143326.6764-1-engel.teddy@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/24 16:33, Teddy Engel wrote:
> Remove unused constant.
> 
> Signed-off-by: Teddy Engel <engel.teddy@gmail.com>
> ---
>   drivers/staging/rtl8192e/rtl8192e/r8190P_def.h | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h b/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
> index 8c85f1c866d3..2cab232bbf30 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
> +++ b/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
> @@ -88,7 +88,6 @@ enum version_8190_loopback {
>   	VERSION_8190_BE
>   };
>   
> -#define IC_VersionCut_C	0x2
>   #define IC_VersionCut_D	0x3
>   #define IC_VersionCut_E	0x4
>   

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
