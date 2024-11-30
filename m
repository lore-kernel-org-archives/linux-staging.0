Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B986B1A2545
	for <linux-staging@lists.linux.dev>; Sat, 30 Nov 2024 17:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732986467; cv=none; b=Zn9ljRNZoq4UF42ZykJ/6zYBMLgcVk5qUfWhi/YLuFd9KInz0qqxOZ5kHNcHJtCamr90WDd2QlpcYvHJsowh4B7rI5n9OCDvSy8rGJQWQiOimRLg0FepthKL+YpVmt1LcmY85iA6EnAPFSgD23EA+xzJilZDWnkabUq+IbwJhNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732986467; c=relaxed/simple;
	bh=J6y5ZqQoQKKt4aDphP3WTv7xg3cQ2l0HTafGOFM7qjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OlAPiiZg6dgLSyp2DfQa48nfYj5XT+aktsLE5GKKPaVxOYJFiBs6sEi2eSo0xKI/fWSDjsLffVGOJRNmkjVGuc56ShqnVjkukW76kA8qsbLs0DWU9eshDyJdgheGoTNMOL7fqaPq9pXtn3mrv9BfOHAubslB6UTzVFaM5637nFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fnON0f8q; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fnON0f8q"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-214f6ed9f17so25292465ad.1
        for <linux-staging@lists.linux.dev>; Sat, 30 Nov 2024 09:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732986465; x=1733591265; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=XAykXrPepQnWzrhG5eob9wgrwoTKq9xYWLzbBJZitOM=;
        b=fnON0f8qXt9wwS2XHFSfd8KmcDuBbjkkL/ms3pN7gXzYw4f4Wjq1HT3EHPz+krOxUc
         UyXkOvLFHm+UscLq9uWNf3Qwp7+PUWhrh9hrrp0e9qG5n5B6BZzVLDKaCagAsYWL8U6U
         DlugdTkWRSHL3xBk+/2iZsFLs5gTbw4oGsvaM4g4EuTSCORZfcVlxHhNvjZCZRqSwp+D
         pRp4a8Los/TG8AzPXAHToWsbAeGfiavHxF2P9Pg8hw/JBKA5AS6VVkPuveeVjZ+L1LDr
         5OrIgCcEZlaM3o0+LioNGOcy1LLY33qDGWFkpErLCvK+J0pemxN69roQ/RmdhLpo0UOo
         LP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732986465; x=1733591265;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAykXrPepQnWzrhG5eob9wgrwoTKq9xYWLzbBJZitOM=;
        b=xVOs8L1KS+78f1NUbR+vU8xqIL0Go2/6mgjtcbGNBcPAFiKGS0PEZovVfKyIytMNXm
         LM8je8qroko6/dv+jjy31BbRkGYY03rTE69VjUFHo72eLv21ICNqROHPsKz/7GsZfiE2
         mtqBcBT1UeIcNg0m5ph7XViIzWBPa64juyhNin7E7hYwIdyF5bCZ+Dp6sdNXc0cfCYZd
         dHz87xG88k/fNL0hf/uweLQZKXxKywPJk71p1Z15SQ9KB9UDk9X5hj/hjQwwJOvO6dUP
         vJ847jBO9ipXiKtyTEBlYqAazxbCpft+jD9cPzfZgk/0IVLl7/XfC4WOvyVbND4AkpC1
         9ddg==
X-Forwarded-Encrypted: i=1; AJvYcCVkuR2mwb8/1zY0hbeurEjz48L+zj+sZdEQGUYWOC5vwbxqkDTXuZuH6UXj/B8mcl+JCT6MVDeXm1OOr5pF@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2gpyMIzKaWoNpZA0e9wQO5Txk/i7PMx+jxR6P0vFOXfNxpUyp
	wmwXOCzGC7f5i/J09RG6w2IayVUcUFXqcGX3TF2IAXZ15OrqVSAJ
X-Gm-Gg: ASbGncsVhawbUNxrN81fKOIGRDuYsIKVBICj/xHtxEdPbnQ5s4OsoP7hCo3Ba5vJUs7
	FwUucemOdUimPvGgtDAO/D89vtlIdoq3AAKKm0/r9MTQFQCmtbBYctlejDcruIa1N6Xxhk+jPy2
	Iqigpohnl/A7O6jdWP7gRD116yYAnH9sRZASN+fRgf/eXXNgczgUUvX6xLRDqYiF3KsMXmU5Yjw
	quqsxOe9sf5NWyyDWnCwNCOZFks9Bp4qoXgTnpivsq+KzsmwAJyCMwT2b8efzV98uZmuVk39h6w
	S8ctnMrtXYbrnrDORmoC+o4=
X-Google-Smtp-Source: AGHT+IGE77B4US9yC+cx/cf2ZW+f5ZsDyTURwt5qccjN2BDHQshKCH4EUnjWWTHQoTM7fT3NXIbmgA==
X-Received: by 2002:a17:903:2347:b0:215:6c9a:15 with SMTP id d9443c01a7336-2156c9a0365mr21355905ad.42.1732986463450;
        Sat, 30 Nov 2024 09:07:43 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2156996d276sm9042845ad.238.2024.11.30.09.07.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Nov 2024 09:07:42 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <7d7e65af-b818-45de-a92c-ee59a864dbdb@roeck-us.net>
Date: Sat, 30 Nov 2024 09:07:39 -0800
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] Staging driver changes for 6.13-rc1
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>, linux-kernel@vger.kernel.org,
 linux-staging@lists.linux.dev, Dave Penkler <dpenkler@gmail.com>
References: <Z0lCyXBV06VyH96s@kroah.com>
 <f10e976e-7a04-4454-b38d-39cd18f142da@roeck-us.net>
 <2024113025-sly-footer-3462@gregkh>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <2024113025-sly-footer-3462@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/30/24 08:15, Greg KH wrote:
> On Sat, Nov 30, 2024 at 08:10:55AM -0800, Guenter Roeck wrote:
>> Hi,
>>
>> On Fri, Nov 29, 2024 at 05:27:53AM +0100, Greg KH wrote:
>>> The following changes since commit 8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b:
>>>
>>>    Linux 6.12-rc2 (2024-10-06 15:32:27 -0700)
>>>
>>> are available in the Git repository at:
>>>
>>>    git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git tags/staging-6.13-rc1
>>>
>>> for you to fetch changes up to 114eae3c9fde35220cca623840817a740a2eb7b3:
>>>
>>>    Staging: gpib: gpib_os.c - Remove unnecessary OOM message (2024-11-10 08:04:18 +0100)
>>>
>>> ----------------------------------------------------------------
>> [ ...]
>>
>>> Dave Penkler (33):
>>>        staging: gpib: Add common include files for GPIB drivers
>>>        staging: gpib: Add user api include files
>>>        staging: gpib: Add GPIB common core driver
>>>        staging: gpib: Add tms9914 GPIB chip driver
>>>        staging: gpib: Add nec7210 GPIB chip driver
>>>        staging: gpib: Add HP/Agilent/Keysight 8235xx PCI GPIB driver
>>>        staging: gpib: Add Agilent/Keysight 82357x USB GPIB driver
>>>        staging: gpib: Add Computer Boards GPIB driver
>>
>> I seem to be unable to find the patch introducing the problem (the link
>> provided with the patch is invalid), so I report it here.
>>
>> With i386 allmodconfig builds:
>>
>> Building i386:allyesconfig ... failed
>> --------------
>> Error log:
>> drivers/staging/gpib/cec/cec_gpib.c: In function 'cec_pci_attach':
>> drivers/staging/gpib/cec/cec_gpib.c:300:28: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
>>    300 |         nec_priv->iobase = (void *)(pci_resource_start(cec_priv->pci_device, 3));
>>        |                            ^
>> drivers/staging/gpib/ines/ines_gpib.c: In function 'ines_common_pci_attach':
>> drivers/staging/gpib/ines/ines_gpib.c:783:28: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
>>    783 |         nec_priv->iobase = (void *)(pci_resource_start(ines_priv->pci_device,
>>        |                            ^
>>
>> pci_resource_start() returns resource_size_t, which is not a pointer, and thus
>> can not be cast to one.
> 
> This is odd, why hasn't 0-day or any other build testing found this?

Good question. Another good question is why I see this only with i386 builds,
but not with other 32-bit builds. It should be easy to reproduce, though.

make ARCH=i386 allmodconfig
make ARCH-i386 drivers/staging/gpib/cec/cec_gpib.o

does it for me, independent of gcc version (I tried 11.4 and 13.3).
I don't see it with clang.

Having said this, using the return value from pci_resource_start() directly as pointer
is quite unusual. Typically drivers use ioremap(), request_region(), pci_iomap(), or
a similar function on it to get a pointer.

Guenter

