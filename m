Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3D4135A63
	for <linux-staging@lists.linux.dev>; Mon,  9 Dec 2024 16:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733762155; cv=none; b=WxHHMOqaJ0bIUIM7XJYs3L/cD0Gs3bv5q/1WpDMdsrWP0H14X2Ysv4Iv17iN9PghOWWga52Fdqc65HHan+YMFSlNqsznprfGTXLsfGdaLSoWDeiiHSBKcDooXBaqF29Ggg4t02XxZjpcngsFK7V5iuQ5CZMXV7PwCwLXVBtnSjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733762155; c=relaxed/simple;
	bh=NhxF+okDJajDLMdR8AxwdmDd1vO3lqeLb5pDI1pE6pE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=svkjtC6rKK+jsP9dhkxbjFFf/v3Hyfw6kER8T6MDnP7wLpKfPiOPBBIhFMlAonpfg/jI9YTwySTFr7PQsKgCpKVMfIGtKGkwt0MZq+1eb6RcfGAgJcV/kwZ7ldX1fJEsY1so38BDc7ZjpHuYDhiX3JJcl8ip6L3koDH1HIEcfv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MAp79ypd; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MAp79ypd"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21634338cfdso20926645ad.2
        for <linux-staging@lists.linux.dev>; Mon, 09 Dec 2024 08:35:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733762152; x=1734366952; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=5en3TXnHvPZeZRfF0MQab9m3SG+CXpNk9+5CBNpxusU=;
        b=MAp79ypdDmD6hadCFkam56ndjyMPpIaOZc9lJH7MZx1yZ5yhaa216NQSDV9Gv+tkig
         3LgNiuhzbJ3wsKXC2/ttfpqQ9oU2S3fGa225c2mRfTdZB/zk3CQ9FyYeuqqj0/5OBMqa
         uGX9YG4ES6hkm+rG3JJKpLe98Ky7f57tLnqHYMx4Tddiw+odlZ3soAIUZWxaKkfCKJ9I
         PkJeYkCxKVcmg8DnZxdeUvR5Qkxn43/HFXk0RpdnrGLbRGIWGgzUTEgHo69ZUbMsp+pZ
         Z7wAgYCQfkvwcxAw4w1thO67pZu1CfLjt8ao3hwnD1hMOjjtNeye1jOfHS/juQBka97Y
         bBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733762152; x=1734366952;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5en3TXnHvPZeZRfF0MQab9m3SG+CXpNk9+5CBNpxusU=;
        b=aVH9+XT5i0G6rkOj0tJtWnySD6Mg6AzIuRyxHsDs803+XX6SvGQ6TG1T0NRIGiMI1B
         Z0o7Kly2FieoRpO3dRNsIyfI4kISiGzoP51pqAsojD0yHgTxcrLWygp3zLoDLNxBhcRT
         PT0v0Jzll2uSx3XF9w28yhDpWI15yZCXUOaGY+hCI5o1GUgawripfoVAVwLb3CmvI4Va
         KrYQP0regJ8tdbtpuDyB0nav837YbLv7fSawZNzVdD6SBBmDv1RDaa81Js5CWy3aAdRQ
         Dn5g6j0u2mgKXcRHme/bBIVUypoGzP8M42PSw/0DdMzdVGkpnUp/VonH/nur9tNz2ian
         5Kkw==
X-Forwarded-Encrypted: i=1; AJvYcCWwx7LY1doH27/jLlwd+gYBsAhFCt32z3v6gVWk+mGUf6kITDdUnxXIPu2aaYHr5KrhnmJQd9bYEiSNxljh@lists.linux.dev
X-Gm-Message-State: AOJu0YyysqKEVRWv6sfQgsCRXJlsq+V10DYvX8MxwOfyCXHeMUgMaUti
	HOgTPWj8kUt2aIQN0KRPCS0fm+2PMalKEIav1A7eTcxwaREfnj+3
X-Gm-Gg: ASbGncvl1ci37q/ZnNfXzBZo4TXUXnKWz7wr1LpXkXP3qxhzysebreBYsec4MZV2F3A
	TEM5YzYumJdrw8ZiKoqacZkvJ/fvwURSu9oZgGC1jDugMTvN9fcsDFuxxHPJDU5lf6tg1TKrzDj
	AMODep4/Aeqev2jaXduFYUo3EfNIIHrTH1DUqAMxL1W5zTACxhcjI690XTnoy8ktYMTUlIp2tRU
	yAeEES2dOW0sg8h4tE5McVDtyu8z+erQs5JUgFfwr1Hfqh4z2EGq+jIe6w3Id8qaBc/UglVA75p
	VV8t9aMryF2v2g8YkSGtfaU=
X-Google-Smtp-Source: AGHT+IH7T5xg09G4nsUqTIaMfMXbM5iVvJtlDat4DXzffhQMf2FW9J1E/EhqC1k43SSfHYj6CSNKsA==
X-Received: by 2002:a17:903:2443:b0:216:643a:535a with SMTP id d9443c01a7336-21669fefe5dmr14639815ad.20.1733762151784;
        Mon, 09 Dec 2024 08:35:51 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21613889367sm59052835ad.51.2024.12.09.08.35.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 08:35:50 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <df869e76-4862-46cb-8b12-c346687cfad3@roeck-us.net>
Date: Mon, 9 Dec 2024 08:35:49 -0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] staging: gpib: Fix i386 build issue
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Dave Penkler <dpenkler@gmail.com>, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20241204162128.25617-1-dpenkler@gmail.com>
 <CAMuHMdVUnr4iAZmuy8Z3S+sCYN4P26RdpPwXevwiJrh+KN025Q@mail.gmail.com>
 <ddc720b2-8bb4-4a07-8280-dadeb2de5b26@roeck-us.net>
 <CAMuHMdVsmNqZhqxPu1iMkZUqyGUQqyY1ae01JAkE1-AQbiu5mw@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CAMuHMdVsmNqZhqxPu1iMkZUqyGUQqyY1ae01JAkE1-AQbiu5mw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/9/24 08:27, Geert Uytterhoeven wrote:
> Hi Günter,
> 
> On Mon, Dec 9, 2024 at 5:18 PM Guenter Roeck <linux@roeck-us.net> wrote:
>> On 12/9/24 08:01, Geert Uytterhoeven wrote:
>>> On Wed, Dec 4, 2024 at 5:21 PM Dave Penkler <dpenkler@gmail.com> wrote:
>>>> These drivers cast resource_type_t to void * causing the build to fail.
>>>>
>>>> With CONFIG_X86_PAE enabled the resource_size_t type is a 64bit unsigned
>>>> int which cannot be cast to a 32 bit pointer.
>>>>
>>>> Disable these drivers if X68_PAE is enabled
>>>>
>>>> Reported-by: Guenter Roeck <linux@roeck-us.net>
>>>> Closes: https://lore.kernel.org/all/f10e976e-7a04-4454-b38d-39cd18f142da@roeck-us.net/
>>>> Fixes: e9dc69956d4d ("staging: gpib: Add Computer Boards GPIB driver")
>>>> Fixes: e1339245eba3 ("staging: gpib: Add Computer Equipment Corporation GPIB driver")
>>>> Fixes: bb1bd92fa0f2 ("staging: gpib: Add ines GPIB driver")
>>>> Fixes: 0cd5b05551e0 ("staging: gpib: Add TNT4882 chip based GPIB driver")
>>>> Signed-off-by: Dave Penkler <dpenkler@gmail.com>
>>>
>>> Thanks for your patch!
>>>
>>>> --- a/drivers/staging/gpib/Kconfig
>>>> +++ b/drivers/staging/gpib/Kconfig
>>>> @@ -50,6 +50,7 @@ config GPIB_CEC_PCI
>>>>           tristate "CEC PCI board"
>>>>           depends on PCI
>>>>           depends on HAS_IOPORT
>>>> +       depends on !X86_PAE
>>>
>>> !CONFIG_PHYS_ADDR_T_64BIT, to match the definition of phys_addr_t?
>>
>> That would be wrong. It would disable the code for all 64-bit builds.
> 
> Oops...
> 
>      depends on 64BIT || !PHYS_ADDR_T_64BIT
> 

Yes, that should work.

> Assuming the driver actually works on 64-bit?

No idea.

> Perhaps people keep an old i386 to control their GPIB gear?
> 

The code does not depend on x86, so presumably it could be any kind of CPU
as long as it supports PCI.

Guenter

