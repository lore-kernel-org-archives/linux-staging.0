Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083152FDC56
	for <linux-staging@lists.linux.dev>; Wed, 26 Nov 2025 22:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764194902; cv=none; b=bjN7ecEf5jeNP2DT2qTL85Z092qrNXNx9GvmIUdguPN3EsiHZ9s3dlEY9CDPuriGBBJUuOl5hC0BQnJKIxDpiaZW8R0KMcyBMWRe2z3flgY4kKW+DW4xXCBAKd1v2qyewSVyFmwdyW/HnlTtM3hjnzsGU22RonPpl3IjMRUPg/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764194902; c=relaxed/simple;
	bh=rtiPfcGehEKgX/iZgoqnie41bS6mGZd2PttvNx6B2JQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kv+eHQbn8Zrek3nUJQ7T4PuE9HtgBV+TaG5WmPbDEjNYAGhb6XqCaoZdiep2Iz8pou3LetIyDghM6LQD6ES+ppMPgCMpaaZMAr1OmbZ1V3ZhGcTwR7k4wf/u8cLnw8ySOyPXe+kmVUhBZ8BM9uDbVtjLLN4MTXHxvEEBwukDR+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UwxAhq/+; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UwxAhq/+"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7ba49f92362so146405b3a.1
        for <linux-staging@lists.linux.dev>; Wed, 26 Nov 2025 14:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764194900; x=1764799700; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xgiTZIOx+y+gqr86BpeS1BjQ5eXjgZJupPMHKmu6Swk=;
        b=UwxAhq/+QoaxqjpmBGjfL4Mu6m3e5zLyO+BsR5WhkCfoKRYKS1MKcGepHsjMyMv2Y0
         WnT/zthOnf0/q2Iz919p2aKZ0pZEj1DQBTl3MdcH3N7x5TW7HHjlnY3MZVRshFpBTvJJ
         Q8Rk9LFoldDtF+3LdunK/v54sujIvX/+aMWdxwcvPt7pACmEKQ3icXqjtQdbq1PhynST
         GuiFxjD423Zq2zqTza43jhKcX9baSvt+aYWO2nn9fV/MGXws8va6ANtlqtIjhWiDqlEA
         Tul7KJU02n4lMQVFbN6RSTuXFqaRxiZhYUoGPT+BPBO+/M7TDXWdqxQFUAmSSkmzUxe4
         sh9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764194900; x=1764799700;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xgiTZIOx+y+gqr86BpeS1BjQ5eXjgZJupPMHKmu6Swk=;
        b=V6f8bfEuITRvON7zxL6LFvwkJe0/rosbMrurbQkcJXi3jk11npVju2L6DRwLTSKQpp
         AzbwccGCq4S1TYuaTyEHLT/+spZ4EJt2miuIGKUPCrfdqF33KZymDHvI1KP7jubnHmus
         HnnwZZ2n0uMO9E22QYBWoCSjtvRaULK1yoPTrqYiJrymEfPCVIs73XPHb4k+ihQdNAY4
         Bjiq+ocZJnvO8ThhhO5OM2+nPiY45QXmfELqGwtkgCgVf0/694H8/AStag33WbMyzX3I
         nP3qyxLM86HU3D6wS9oY/FGo64m+3OmI3GvmkjiHstZ9AMxxWmyCv1lPRvshGU13i+oD
         uVOg==
X-Forwarded-Encrypted: i=1; AJvYcCV5V/8Pmwa9lw3ZXch/Hkhlm9eussMbkucna9xzgtez1sMA76OV64TITqa2bgLb+8aLmjnXl+CGQVjSyR0n@lists.linux.dev
X-Gm-Message-State: AOJu0YyE9U/NXk/hGJCCl3uQHkVOIeZukeiKNj5SSjXL4WyK/UYV4Q5Q
	87WG7cS5h5ULTrVbzc3OXNOENo5fGZV/TQCO5UjA08zojc3VTORCqm4X
X-Gm-Gg: ASbGncsIGBNq0qM2MnhtIvoFjofCDlpiNW/4psV+yFem9XmI2j++8X2IFIRl6nDL9U8
	Fa0v3PyexzZJ2xVXSl1v1KzmTyZVS8xkrPQ+nCyWWqXR5Uo4H8CMb9VJl5v7d82yHSxaYZArurM
	pPnEwP48iGCCzqJsbAnHfP79Y7VUzjOq/MOC6Mh0ZQsjpuo8qcRW6Pm6BSrByUwZB/2i3ljHqQh
	rkGh/RImem+B3ueYf0u3zj61yz9bnnp5B5p0cW4RJiM47L9qjGB+doV/hHaKmCasc+L+EVSjK7V
	BH04/EvmSolc5dT4SxOXDF1RZCwUu2c7tDuhWiaLpJeWIu5/Jh+FXgFVGxv3xPto0BEbe9NNyfI
	NCX0TPu52BgtGjsEWabig0OhKg7ER+Jf7n1GT0RDyN2vjumdmI3fqRWbwpQ5CNiqnnjLkcIasTa
	o34XG4nZFgLEahgNni6kZDZPeZrYMo0LpPxp7aMkYLKhj0cXLMgkuULfu2awjdepkJoA5jnQh1Z
	Da9UID1Ni+7Ea+XcBYjxhsO
X-Google-Smtp-Source: AGHT+IFB41RdFB/0c7IO7tthz2DW2H1EvC3bEKDG9fDDMR8D4Oy8cmDnnS3vlPgC9fcEZdGEl55zjg==
X-Received: by 2002:a05:6a20:4310:b0:35d:b415:7122 with SMTP id adf61e73a8af0-3614f54d36cmr21964226637.26.1764194900156;
        Wed, 26 Nov 2025 14:08:20 -0800 (PST)
Received: from [192.168.2.119] ([103.92.100.179])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bd7610a6f80sm20199734a12.32.2025.11.26.14.08.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Nov 2025 14:08:19 -0800 (PST)
Message-ID: <75bbd0a9-1e33-4f63-85ed-de1607aa5e2e@gmail.com>
Date: Thu, 27 Nov 2025 03:38:15 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] most: usb: remove double cleanup of interface on
 registration failure
To: Abdun Nihaal <abdun.nihaal@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
 gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251125225606.70719-1-knavaneeth786@gmail.com>
 <20251125225606.70719-3-knavaneeth786@gmail.com>
 <gavusoqf5ad2xmimbtuuxnp7znm5z57srcqaf3xodenc2wggt5@otqxmfdkogrd>
Content-Language: en-US
From: Navaneeth K <knavaneeth786@gmail.com>
In-Reply-To: <gavusoqf5ad2xmimbtuuxnp7znm5z57srcqaf3xodenc2wggt5@otqxmfdkogrd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nihaal,

Thanks for pointing that out. I missed that Johan's patch was already in 
linux-next.

I will drop this patch and send v3 containing only the core fix (which 
is still needed to prevent the leak).

Regards,
Navaneeth


On 26-11-2025 23:01, Abdun Nihaal wrote:
> On Tue, Nov 25, 2025 at 10:56:06PM +0000, Navaneeth K wrote:
>> Since most_register_interface() now correctly handles cleanup (calling
>> put_device on failure), the manual cleanup in hdm_probe() would cause
>> a double-free.
>>
>> Remove the manual cleanup labels and return the error code directly.
> This exact change has already been done by Johan Hovold in the following
> patch: https://lore.kernel.org/all/20251029093029.28922-1-johan@kernel.org/
>
> I find that patch in Linux-next. It must have been already applied.
> and so you can drop this patch.
>
> Regards,
> Nihaal
