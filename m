Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D120B1991CC
	for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 19:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724699278; cv=none; b=KQAyySnmriOpZ4/j9vSqAZ+BMcJjkpHA92iiQb0OIdWF0bliZKix+ikEa0zXqVPqkD4A0W0NRZZmjoeBaWv3Y0dfAtA7kpI/sewbVLiypgysYNCyxZxkjPM+HFMkdgvC4YONTIc0DrUc5TiGG2vnYAYrNYMTPmKQBUCt8SkgqR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724699278; c=relaxed/simple;
	bh=xEJ2cXYER4N3XCO2mOEMn9fSE+s/0OFNOWSEaGbzkp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jz5RR4OPb7oq6p4wAmmErflWgW7cXYbedpSBTlbvcp3A9G1ikSBJlPIxv20nPm/ps8tSVNzc4ot6A3sebmOQNqfPAkWEpu2vhiD+1i5QKoSlICqK5ChvyesOH59rS8bX3Hg3HUgwz9N2bZwx8TE06AMP8wCxSEVFGPEOPDxOYbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KNE5mXV8; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KNE5mXV8"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5bed68129a7so6175422a12.2
        for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 12:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724699274; x=1725304074; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tmtnEYFG7LM3Rww8xbnrxCDknQ7Ml6u6NmRWdx1EeJ0=;
        b=KNE5mXV8gH6irOVu+IilIC1OtO91Ok/A+0Q7FWvbyJQDoZ7FGftEkke3FGUQdW2YY7
         ZPEpEx+F16AbahbSQKKgv9Q0O759kFHBEkFsdCj/MqixtxWA+yy4xVjbv/XU3PbLae4/
         8aUplWE3KKfALyLzl2Q9hzUDzMw0zJ7umOONt4iMGhoECHIEKwmtM20b0ieO99jVOl2x
         fPIRdzXMeR5evDx/uHNaiOg1STDel1c065Lpwj3y4yGUr0RcqTHAfPqa525hXLUoifis
         ZPzhhlb1/C4yMtl9SlINNAei711qrv1gwdEiD21W8iK5OS+cHpsB+wbvfHLvnhE/+SsY
         oHeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724699274; x=1725304074;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tmtnEYFG7LM3Rww8xbnrxCDknQ7Ml6u6NmRWdx1EeJ0=;
        b=In3Os4xDsLmuWwMcT7vkssGUTXMxWlk1FsEFA3pvDC4CLAErfuDcCVc5+N5gJJhOV6
         5IJpeoJx6Rt3ZNrTsXO53R2zgQkhyHWL045Z/EMq9f7XOMTGnfekomSrnl48r8MnaHEK
         qqvEej1tYgqVJvz1gUuJGv62degUcmRKdG8LQQ8rzxWXhwVXCbP01EgzZf/bCgxmg4yW
         rnMIiUp5Q2D37xYw49QmpPe+Tp+GfXttx3P5qAtv6JYwOThofsEtDZez4QPR4y0fUSvF
         qfgTM+1sbk+39Ozcgo4V/mFF+4jV3Qu8IsFw9LTuW8AhBgK0WUhkMlHS7jv6cbda9Ir5
         9VTA==
X-Forwarded-Encrypted: i=1; AJvYcCUwxmB+qyD+mXTkvoLYjWXXArECSypoDzM1vp9//vLcgxDWNZvErHQ7m0Y1WUmKKvk/mvx2yfe/pAzt2DGP@lists.linux.dev
X-Gm-Message-State: AOJu0YyOOhBNcNz/2CpP6DcfPhB7FAA6qi993SL10Y0m3DJPNA13aow9
	S3hnaZlpxXBSmYotO6MqemWQRwmA3gfHQMaRSfrVYstt5d6xYZvG
X-Google-Smtp-Source: AGHT+IHKHKsFx9fhD9tunI7iX3r2A+7rNFND6+T/z9N90Q3ttvn7hbDydR2wPEnuEz4MjM5Whd/6XQ==
X-Received: by 2002:a17:907:3f14:b0:a86:722c:1460 with SMTP id a640c23a62f3a-a86a51b4a11mr885047966b.18.1724699273782;
        Mon, 26 Aug 2024 12:07:53 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8502:42e6:b0b2:a0bb:dc32? (p200300c78f2a850242e6b0b2a0bbdc32.dip0.t-ipconnect.de. [2003:c7:8f2a:8502:42e6:b0b2:a0bb:dc32])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a86e549ff24sm9046666b.89.2024.08.26.12.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 12:07:53 -0700 (PDT)
Message-ID: <e5c1cc1e-f43c-466b-9bcb-8a1c507cdd3f@gmail.com>
Date: Mon, 26 Aug 2024 21:07:52 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8712: Fix style issues in rtl871x_io.c
To: Manisha Singh <masingh.linux@gmail.com>,
 florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240826185213.9445-2-masingh.linux@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240826185213.9445-2-masingh.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/26/24 20:52, Manisha Singh wrote:
> This patch addresses style issues reported by checkpatch.pl in
> drivers/staging/rtl8712/rtl871x_io.c:
> 
> 1. Avoid Multiple Assignments: The original line had multiple
>     assignments in a single statement. This is generally discouraged
>     for clarity and maintainability. The code has been refactored to
>     use separate statements for each assignment.
> 
> 2. Prefer `sizeof(*pintf_hdl->pintfpriv)` Over
>     `sizeof(struct intf_priv)`: Updated the memory allocation call to
>     use `sizeof(*pintf_hdl->pintfpriv)` instead of
>     `sizeof(struct intf_priv)`. This is considered better practice as it
>     automatically adjusts if the type of `pintf_hdl->pintfpriv` changes,
>     reducing the risk of mismatches and improving maintainability.
> 
Hi Manisha,

please do just one change at a time. The 1. and 2. indicates that you 
are doing two different things.

> Changes made:
> - Replaced the original line with two separate lines for allocation and
>    assignment.
> - Updated `kmalloc` to use `sizeof(*pintf_hdl->pintfpriv)` for the
>    allocation size.
> 
> These changes improve code readability and maintain consistency with
> coding standards.

Do not describe so much what you do. What you do can be seen in the 
patch. The most important thing to describe is the __why__. When 
possible just use 2-3 Lines in the description.

> 
> Signed-off-by: Manisha Singh <masingh.linux@gmail.com>
> ---
>   drivers/staging/rtl8712/rtl871x_io.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8712/rtl871x_io.c b/drivers/staging/rtl8712/rtl871x_io.c
> index 6789a4c98564..b81e9b06725c 100644
> --- a/drivers/staging/rtl8712/rtl871x_io.c
> +++ b/drivers/staging/rtl8712/rtl871x_io.c
> @@ -48,8 +48,8 @@ static uint _init_intf_hdl(struct _adapter *padapter,
>   	set_intf_funs = &(r8712_usb_set_intf_funs);
>   	set_intf_ops = &r8712_usb_set_intf_ops;
>   	init_intf_priv = &r8712_usb_init_intf_priv;
> -	pintf_priv = pintf_hdl->pintfpriv = kmalloc(sizeof(struct intf_priv),
> -						    GFP_ATOMIC);
> +	pintf_priv = kmalloc(sizeof(*pintf_hdl->pintfpriv), GFP_ATOMIC);
> +	pintf_hdl->pintfpriv = pintf_priv;
>   	if (!pintf_priv)
>   		goto _init_intf_hdl_fail;
>   	pintf_hdl->adapter = (u8 *)padapter;

If you send in a second version of this patch please use a change 
history. Description from Dan under:
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Thanks for your support.

Bye Philipp


