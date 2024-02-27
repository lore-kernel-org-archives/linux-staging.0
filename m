Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0154CE17
	for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 22:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709072258; cv=none; b=TgLgQ3P69/J2iY9P8/Nyz8zN7Y10neQJ61X1PXFN3GxFabnUu2EbGRNfIIqYUWj+SvamcLw9/eWt7egrEEQX9jeZbAnLd3JvbnK5XwA/FiR7SX4EhxDCTbNiyHxJZGFAuQRx4JKlD9Klp/TH7ThRhyFZeiXB7ih1sQcbWWmqU4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709072258; c=relaxed/simple;
	bh=aR5t2Wfku+THDivp53lV36poeGH4/NI+Gq8iHybN7bk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s44wXh/RZPFqgms2PV2FjOkMcuyoYXo0sKnxqleXERi8X7JNCp3tH9MHx6H3QHP/Pi5CJ2ZmYvXmJaTl9hENkgmQJcV7hnB+7O9tmcIvNvuQ0dCqJ2qdgN2tE7P82PiZIbCvfZ3V5S6IlCwZy3x4cn3tQChXoBSR3mU31Rxokms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9O1UeYz; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9O1UeYz"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-412af574501so7001435e9.2
        for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 14:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709072255; x=1709677055; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jL1OrywmYVgdUyq4Qpu3yOEeDXFaEcSGIdQX1BM8BP4=;
        b=L9O1UeYzUxluI94AqdoXWucO1kCWoBcBqbUhciQbiEZ/wbPV/pftIAC+QIS5ACZ5IH
         +D2+7WLVMDiUPEkz0x8ahpihd3HoAhPqPfh3s703DsceIPyHv3SX8kUfH7oKKaGwYgdM
         IF8il4f58amVjPwetwmiH+38kZIYxZIs2qNC6w42xH1W6Nc8GP0poMTQZR5y3p0fXIKB
         +g4ahWynfWJ4g1zl+mn/jj63bYXWzVprQG4WY1oYBbwouyL+wa3H5LVdO4ig0t0xBF7l
         8Iwm4QyTdiGhGg9pc/jHtIQXbK1rakfUTEwmnWzf8QcnOeSVC7a0RCCAnxyl5z0yW3ko
         uyfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709072255; x=1709677055;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jL1OrywmYVgdUyq4Qpu3yOEeDXFaEcSGIdQX1BM8BP4=;
        b=jv+mK9d9h34EFjw9B54p7AWPkKwFTxCNv1dnOXzfx0FS1WUWqorAkWTX813Ff64Eya
         /RaeF4SJG94jHlzGS0quew+LxFeVZEv7JZxiAxcRyqosm6HlOfy9a5g4rvUu1Ehr1y4M
         KPc/omviQ9v2X5Vkih/lV3zYnEXUKBRhskRXtv8D9uEzClhAA15dW0veULyKnkmX0v4g
         s9b2V/jtydiGe/yN9FkFBJ8nRbIOT7jGVQEZuErCFdi3uV5hqBmUZqPaOeE4z4IeM0Ca
         QSRqiM7JfHJ17mCh6Yb+/iZ7fXQ8r48txG/+Oeo1/39jseOcAvV4qBqEPNDp3EG7rkkN
         jEJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQlegeCsqYZALmj/JjmN1v3wDNWqWBRI2a4h1tf/Vn5dhfSFSpJW0kws6zzHB+X90YOA4zFEsn3EhgbNm6or1pYzeyy8XcLkH4ezyh1g==
X-Gm-Message-State: AOJu0YwW+owlBRPNunBxCIVS5PYs2aXSLroNPspw2WLytghD4Rp65G5d
	aG6VF2VURlBe5U6v3jnXvBqfU3NmThr5Mnf5GYrgVUfPCxaAw7a+
X-Google-Smtp-Source: AGHT+IHQ/oHFxiN6KJDBu9GX112uZI8SoNaVjD7teKCAcFdClHDhdK7NfXhX5gnjzn7G8naRwqf+5g==
X-Received: by 2002:a05:600c:1914:b0:412:8c96:b15f with SMTP id j20-20020a05600c191400b004128c96b15fmr8088331wmq.37.1709072255506;
        Tue, 27 Feb 2024 14:17:35 -0800 (PST)
Received: from ?IPV6:2a06:c701:736b:f200:73a5:2235:8954:9b7c? ([2a06:c701:736b:f200:73a5:2235:8954:9b7c])
        by smtp.gmail.com with ESMTPSA id a26-20020a5d457a000000b0033dd56b002asm8380083wrc.73.2024.02.27.14.17.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 14:17:34 -0800 (PST)
Message-ID: <38e1b141-f7ef-40fe-be8a-97d9f9273a8f@gmail.com>
Date: Wed, 28 Feb 2024 00:17:33 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] staging: pi433: Remove a duplicated F_OSC define
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: gregkh@linuxfoundation.org, luca.ceresoli@bootlin.com,
 benjamin.tissoires@redhat.com, elder@linaro.org, robh@kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240225173341.1278918-1-ikobh7@gmail.com>
 <20240225173341.1278918-2-ikobh7@gmail.com>
 <ZdykDGo9fMw5fEdp@smile.fi.intel.com>
From: Shahar Avidar <ikobh7@gmail.com>
In-Reply-To: <ZdykDGo9fMw5fEdp@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/02/2024 16:45, Andy Shevchenko wrote:
> On Sun, Feb 25, 2024 at 07:33:38PM +0200, Shahar Avidar wrote:
>> F_OSC is already defined & only used by rf69.c source file
>> Also fix define comment
> 
> You missed periods at the end of the sentences.

Thank you for noticing.

>> -#define F_OSC	  32000000 /* in Hz */
>> +#define F_OSC	  32000000 /* Hz */
> 
> Instead of having a comment you can
> 
>    #include <linux/units.h>
>    ...
>    #define F_OSC	  (32 * HZ_PER_MHZ)
> 
> which will be more robust code (no need to count 0s).
> 

All comments are fixed in v2 which was just sent.
Please note I sent the updated patchset twice, I forgot to add v2 the 
first time...

-- 
Regards,

Shahar

