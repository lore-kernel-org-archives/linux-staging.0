Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751AE21CC5F
	for <linux-staging@lists.linux.dev>; Mon, 31 Mar 2025 23:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743464996; cv=none; b=FJm1SwKmkW5GJLeYvlmV0zD8PjLnADRhDzbcPQxS44UbStURaZaNMLKlOyGSdhS+0g3D9ONL366a3lD/+FES4EB6ZYdSUzFh1dIwyBtwZDsMjvH8Y0b88fDbu+LjfRU/oleWcqzc45KnQ88frLbw7WABNGDrt08JAq1GpMjUeiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743464996; c=relaxed/simple;
	bh=7rGt8Eh//HNg+rLIWTgIIJ61fMIPanZaEXUjLulXGOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VQv5b51pEbDuyAS6TUdaYfwvP6a5NUNaHswj6NIwJaOcR0cNtlycHrLpUBAsCSXYRgDr6pSsBDEoxqExtnRhlsWiYMaktwb8UHauj/pbx5WU0MJVfhMBMneOmdG4PRtx6a3PdxWV/O+dNfJfayNci3Q7W2TUaY9le06t9DfPnH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=XVKdX2iu; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="XVKdX2iu"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3cfeff44d94so17714845ab.0
        for <linux-staging@lists.linux.dev>; Mon, 31 Mar 2025 16:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1743464992; x=1744069792; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rDbOavufpFo26W+Zku5x0VpH9Cvbcrt9SziwHnr6lV4=;
        b=XVKdX2iuLDwPcoY/VHZ9wEtKVmpfDYO4ETDRrszFYTY8ep3DHnuFCayUQin9uHEgyd
         BVA2aqTuhjXSQVk4Du5BSTdwniBCABdR1zydAW/MvPHUXWntIW4vVndVKF4NtZd+fBKU
         UsGI7AV+XUNQ0qV9mj9rQWQRRuRKliqwTyedLBLN/i1UFJW4m1HEx8Box/oUvnYsHbc+
         IewKD30gVX8UIdPxpH5wTyujSx5GUWH/qsH21RyeyuaZcwv40X+8I7NqfSGXEElxUU8d
         6qgoQzvPRkYjx5bFfyoxBcvVlimRg/SkARwJctsnm7MaR3XAzqfkvpmW0UK/1ikDSKgk
         niZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743464992; x=1744069792;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rDbOavufpFo26W+Zku5x0VpH9Cvbcrt9SziwHnr6lV4=;
        b=l/hWaftibQKG0bvNE9uCO0ZVqRCJpz1e6VAniYCkHGOgakDUhhh7Cpi4ak16MsIT5T
         i8Lg4FukFb6wkOfmotwvbTLm0VVntkGR6QFNmqVO0PX003kphLZ4TCYkvItZFl5jnJMR
         /2byCGLzK12i5Ww1QfnjlyXpW3vxmudXrgY5WY+R2rA6J4nS1AwcZCY8BHzNtf/zANXc
         pM6DlFfHHCJ6NLSh5/UEL6tqMJZzZFNhD/wqdNl6GYLl6Ue3z0xdk/JfQFdjjctxEXnd
         NfWXsJjLAPhVwhDC8Ze46qvdkhyr3h4U+JvdPMm1uPAL/zDYXtufCh/iK2O3hBAkT+qf
         6ZUg==
X-Forwarded-Encrypted: i=1; AJvYcCV4ierTuMXbU4m8Tyae2zvcfqE0d+W8s6BKdFYZIcH/a6FdYQYPHzaPcykdVczT/o3EZIj3wEvI3nm9O/qH@lists.linux.dev
X-Gm-Message-State: AOJu0YyWBZOpE6vSVpLsB6unBAvP7D6e3AXUxBoc+eDJBjbsqAAb2owK
	lyuYvKeN2sMoqs+C9s2MRm3YvuwQpOo/z5/S11yBMLfRWLjcatSL7bccUr1Ns2Q=
X-Gm-Gg: ASbGncvZC1WTVEuZuuCIaBLi/QWDm5ATppJAH2v5fNuZLsgqTr8WNNTDHR9/aW7Lys/
	TV1dhwIN9JN8jxQl0VXoi6DWDqxoUrlt+5SoRDgT5G1xfnHd9ZNWCpcNvavqCJZn7Fi70qjyBFZ
	CmZQnUC1S+slOBvEipbh30Sk0mKo7ycHUQE5SWpfhchs0Ab28WGl/5jDa/q3vHhdNGB9lvleb/B
	8+WJsGEAblOaHYc8NS+tBWxWKlKJNz6vWo5qm1jNKUqxKBdiDHr4ECDSSgX6jJtDI2hx9uW4xCA
	1KKxDe586AlvzPokkrqHn9DFkd5XfNpoeK5oTLMJ4AIX4izKHWV8GTzq6V1ePxoXlV43GIcIicM
	RCcnpKot5
X-Google-Smtp-Source: AGHT+IGS7o7rVQuhHRDL3VF0MNhBcsgv7O47l22zBrXWo8Fko9huCk4BOt5GOeICjubR5V7NnIFH4A==
X-Received: by 2002:a05:6e02:3387:b0:3d0:443d:a5c3 with SMTP id e9e14a558f8ab-3d5e08f0fd1mr125285725ab.3.1743464992484;
        Mon, 31 Mar 2025 16:49:52 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f464871f77sm2140194173.77.2025.03.31.16.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 16:49:52 -0700 (PDT)
Message-ID: <d683962c-e8b7-4adc-9902-483976197637@riscstar.com>
Date: Mon, 31 Mar 2025 18:49:50 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: Multiple cleanups and refactors
To: gpittala <ganeshkpittala@gmail.com>, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org
Cc: hvaibhav.linux@gmail.com, vaibhav.sr@gmail.com, mgreer@animalcreek.com,
 rmfrfs@gmail.com, pure.logic@nexus-software.ie,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250331213337.6171-1-ganeshkpittala@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250331213337.6171-1-ganeshkpittala@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/31/25 4:33 PM, gpittala wrote:
> This patch includes multiple meaningful cleanups for the Greybus staging driver:
> 
> 1. firmware.c: Replaced deprecated 'strncpy()' with 'strscpy()'

This is a good type of change to make.

> 2. sysfs show functions: Replaced 'sprintf()' with 'sysfs_emit()'

This is also an improvement.

> 3. loopback.c: Refactored a large function (gp_loopback_fn) to improve readability

I have only glanced at this, but refactoring something can
sometimes be clearer if you do it in several small patches.

> 4. audio_gb.c: Split logic in get_topology() into separate calls as per TODO

I'll comment more below, but you should almost always have
only one change per patch.  So each of the four items listed
above deserves its own patch.  You could send them separately
(because they're unrelated), or as a series of cleanups.

Note that "one change per patch" is a logical (not literal)
statement.  For example, you could do a single patch that
replaces *all* calls to strncpy() with strcspy().

> All changes are tested and pass checkpatch.pl
> 
> Signed-off-by: gpittala <ganeshkpittala@gmail.com>
> ---
>   .../greybus/Documentation/firmware/firmware.c |  32 ++--
>   drivers/staging/greybus/arche-apb-ctrl.c      |  11 +-
>   drivers/staging/greybus/arche-platform.c      |  11 +-
>   drivers/staging/greybus/audio_gb.c            |  37 +++-
>   .../staging/greybus/audio_manager_module.c    |  13 +-
>   drivers/staging/greybus/gbphy.c               |   3 +-
>   drivers/staging/greybus/light.c               |   5 +-
>   drivers/staging/greybus/loopback.c            | 170 ++++++++++--------
>   8 files changed, 159 insertions(+), 123 deletions(-)
> 
> diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c b/drivers/staging/greybus/Documentation/firmware/firmware.c
> index 765d69faa9cc..8e375c88c881 100644
> --- a/drivers/staging/greybus/Documentation/firmware/firmware.c
> +++ b/drivers/staging/greybus/Documentation/firmware/firmware.c
> @@ -47,12 +47,12 @@ static int update_intf_firmware(int fd)
>   	ret = ioctl(fd, FW_MGMT_IOC_GET_INTF_FW, &intf_fw_info);
>   	if (ret < 0) {
>   		printf("Failed to get interface firmware version: %s (%d)\n",
> -			fwdev, ret);
> +		       fwdev, ret);

The two changes in this hunk are not mentioned in the
description above.  Please remove these changes.  If
you want to do reformatting like this, do it in a
separate patch.

While it might be reasonable to include a little white
space change like this occasionally, you should avoid
doing it.  It is unrelated, and complicates your patch
unnecessarily.

This comment applies to several other changes you've
made below.  It also applies to removal (or addition) of
blank lines, or really, any other white space changes.

					-Alex

>   		return -1;
>   	}
>   
>   	printf("Interface Firmware tag (%s), major (%d), minor (%d)\n",
> -		intf_fw_info.firmware_tag, intf_fw_info.major,
> +	       intf_fw_info.firmware_tag, intf_fw_info.major,
>   		intf_fw_info.minor);
>   
>   	/* Try Interface Firmware load over Unipro */
. . .
