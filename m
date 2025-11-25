Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F15224AED
	for <linux-staging@lists.linux.dev>; Tue, 25 Nov 2025 16:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764086784; cv=none; b=UE1xZf4xejfatOCxHaRlC/Mpxs1puJ2m60zucxPrd1lmCi48OyjtHbhWF+oFFozDiw/SOtDKF8oOtPyKFMtoOmE186VWjv6+GodVM3rDmO7i1XPU9uAEII8ZywqFwLPxwrGmnHAWUBA7nBkyuQFdIMiX/t9wqxsoE2QIshIdyMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764086784; c=relaxed/simple;
	bh=jgsGJBsnCvaNQU+L+rBP1pJ53Y+2N8jfRU0bZti+g8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HoZBcSvmpkyouvZqs2qJu8Ev5OEPYclCsbabbH6MJtYWJsGBK7qLzeb+AANPEaCtBxA/GHremmModevr2uf7VOIf39smAiCjcRShRpqeEc2oXsP+xgV1IKoGPXxLZS7jj23DO4s5G4/IY7qJlrwF/Gyo4KQGYWoTgAeLWGi6Ws8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9wB0fip; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9wB0fip"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7b9387df58cso9006971b3a.3
        for <linux-staging@lists.linux.dev>; Tue, 25 Nov 2025 08:06:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764086782; x=1764691582; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eo5CI+Lni0xfVNflA2YV6V9mRS/kG552howy/H4Z7eE=;
        b=P9wB0fip9fVJ5quhEvt2rB3VuDNcqjZhy0uPNLoQxo98oqLie3Rtay/48Yi5WQnwr0
         SXKiGJ7wk24nt7V9kxinkewOrn1GMxOvv2+JEYsf6sSEY1vnCen2XEVeAHXBj+73G0Wn
         9WyrGL980mKI6ogjYKtMBNP2i9t2HwaJnCCAJ53cak153iWP4p8pYRUgn1411FBqEXcC
         cUbIgrUG2sXOFAVMdpbdfkhvl2Q4t+lf5R/TXzSjazftcbN0+WAhhIxOczzQm6ChHxdM
         WL34t4iXywyz+BnPyFQbeo3k2wYSNbLfm17WTGXju7pUbOiR9KOKFWUSi6rfBI8VSxlW
         eN7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764086782; x=1764691582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eo5CI+Lni0xfVNflA2YV6V9mRS/kG552howy/H4Z7eE=;
        b=aaUfKPdfF/hXeA3EKMxNyHQ0wXVlnuDin764plfScA98g0G65u9LNYiTPoVUqOnc8j
         QIUqJKT7NpnKqYHvDYCB5k7dURNvim/WkdpMq+SW3v7qJAfVFcrWY7WTnMmCK96ILZjK
         6Cs3KeXatP9B4/bdlK/sdJIrteSvph224ShL66RRmEtXJKqgRdEMSpnK2TqUUlc/hDL6
         1SgGuG3qsL0+qcxt3J5W2VG/c8lBrHrXDKt/fkB+6jK/inZ9CyHYeDRO4G2/yPG6MGQ9
         UiC4vJzv0sbGgI50RtrIJ5Ji2ishsHWcKg4Co4qS47CqQzLZbrve4IFw4YCeO0LTMubY
         BADA==
X-Forwarded-Encrypted: i=1; AJvYcCVo3hcippWm9hUcSNePcnL67Fjgc/d1Gvzff/5l+9LmX1e+FGBiIV8BLZIdu5GGsNeW/0vmc+n5EVb4xO9x@lists.linux.dev
X-Gm-Message-State: AOJu0YxC9dsKNNhExlOoL2jZ0C7GB3S/PN78TkU0Ue6QO+w1Om5nq2CB
	xQxB5oK0JSmM6Lkl9zfJeY4TgJp8E35H4BPqvi8gx7bZrYTuqeclhulW
X-Gm-Gg: ASbGncujOBy6ZUOclVPpyc0VdHcWm0QF6uZgvHgb7dHoOEnb7L2qeo1k+Qwr0Nqgl5K
	UGO5zFeEAN9oKrK3sk2jVQThEWbldziEXoOnvH4ESEnnsy0RKMAlVmz2SgW8Gf6Txo3dmJoIsmO
	VBun6/5wH+p808Ek2E6IDDZwtMvptY53C0ei1n70EC478hwG+hTu1OJfCSmNy4p6jqLtecT+Zzj
	H68/Tj2jem4E1RqBnXv0Pu+WKnvD0a28YfoDsDO03Kc7mz3iWrmDvMtKWGe6nUo0kKybmLiY38M
	XhWzk2tSmUo6xclhaHLHl5aSV4iZb6BU+vfPLVRCwmFe7E/scmMi+7kJPA7uMcsbyoFA1pTxJBa
	CLegqRpkSRPp3WxXQF/z7D/Mt3xdkfTvIjYz3y+Fj/dszYZiz4XpGu0m24fmW+OHEMty7cHhLP1
	uNu4TA+LervvZaW9g/iEs/JWG7AInRd1BtB+CZM3AyUesgY6axaV+5NhIrsjPp3fh0Kah7TbaVG
	Y9fqvmYIhKSt68dsPxzD44b
X-Google-Smtp-Source: AGHT+IG7OGSRvQ7WKhUnIXYvLxtQSWqyDNL66J6nGmL+PV2qif4FljnMdvwf0wHJJsMsudGRMsspXQ==
X-Received: by 2002:a05:6a21:e098:b0:35d:1bcd:6874 with SMTP id adf61e73a8af0-3637db85c1emr3711017637.25.1764086781924;
        Tue, 25 Nov 2025 08:06:21 -0800 (PST)
Received: from [192.168.2.119] ([103.92.100.163])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3ed471022sm18603626b3a.21.2025.11.25.08.06.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 08:06:21 -0800 (PST)
Message-ID: <de76ebde-3453-4f4f-a0a4-d054121de553@gmail.com>
Date: Tue, 25 Nov 2025 21:36:16 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: most: dim2: fix missing cleanup on interface
 registration failure
To: Abdun Nihaal <abdun.nihaal@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
 gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251122185656.251902-1-knavaneeth786@gmail.com>
 <sgvpvlvyjl2sd4ehwujuetrtzl5jvvwkk7yxmjourgduylqf2w@g3qosecznvic>
Content-Language: en-US
From: Navaneeth K <knavaneeth786@gmail.com>
In-Reply-To: <sgvpvlvyjl2sd4ehwujuetrtzl5jvvwkk7yxmjourgduylqf2w@g3qosecznvic>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Nihaal,
Thank you for the detailed explanation.
That makes perfect sense. I wasn’t aware that most_register_interface()
is intended to handle cleanup via the dev.release path even on failure.
I will analyze most_register_interface() and prepare a follow-up patch
to address the inconsistency in the early error paths where put_device()
is missing, as you suggested.

Greg, since this version of the patch would introduce a double-free,
could you please drop it from staging-testing?

Regards,
Navaneeth

On 25-11-2025 20:46, Abdun Nihaal wrote:
> nack.
>
> On Sat, Nov 22, 2025 at 06:56:56PM +0000, Navaneeth K wrote:
>> If most_register_interface() fails, the function returned immediately
>> without freeing the allocated 'dev' structure or resetting the hardware
>> state via dim_shutdown().
> Based on the commit message of the following commit,
> most_register_interface() is expected to free the passed interface using
> device release both on success and error.
> commit baadf2a5c26e ("most: usb: fix double free on late probe failure")
> https://lore.kernel.org/all/20251029093029.28922-1-johan@kernel.org/
>
>>   	dev->dev.release = dim2_release;
>>   
>> -	return most_register_interface(&dev->most_iface);
>> +	ret = most_register_interface(&dev->most_iface);
>> +	if (ret)
>> +		goto err_shutdown_dim;
>> +
>> +	return 0;
> Commit d445aa402d60 ("staging: most: dim2: use device release method")
> converted this code to use device release, where the function stored in
> dev.release (dim2_release() here) will be called to free the device
> when put_device() or device_unregister() is called on the device.
>
> dim2_release() does free and shut down the hardware correctly, so doing
> it again in the error path would lead to a double free.
>
> However, I do see that in most_register_interface() function, the first
> few error paths (before the device_register() call) are not calling
> put_device() to free the interface device, which is inconsistent with
> the later error paths in that function.
>
> Leave this code as it is, and fix the most_register_interface()
> to consistently release the device on error, by calling put_device()
> on those early error paths.
>
> Also, when sending bug fixes, add a Fixes tag.
>
> Regards,
> Nihaal
