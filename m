Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D182D785
	for <linux-staging@lists.linux.dev>; Tue, 17 Oct 2023 18:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xe4T59kH"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-507a3af69d8so1210683e87.0
        for <linux-staging@lists.linux.dev>; Tue, 17 Oct 2023 11:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697566055; x=1698170855; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A/3/619f+Q25m7gUwsaHUF/akHXjvSwe1+LWiXMJ0Gk=;
        b=Xe4T59kH8rYIVP9nS9Z3FsD3FwtjpUa3E3Wc3aTIELH6s+HiQArStStc6M6HDynIQz
         +/tHcFFTkAzkGJfuSpUIkXRojh9lSAFnUh2xm0VDsUgP77TckMVdSs7sEnjUIt9L6w7q
         n4dqfCHIvpep/bot0fPDR5kTfEIXDEJskyPupVnFwebvHHj10bg4tVmBGUQqEqgOzGYL
         6j1VNrq4baNqzZoMP/jOoHrE8oMDmY9DTDzhe6t10Ocb/qqpPFnlba7XQgBXdbAcNE81
         Cohggrnin/vVTYgqPeDQzf5EZJx4WAP4Eklq7kLsDzHe8G1I0RbjUFjTAyB0i3a4oDbU
         LRaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697566055; x=1698170855;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A/3/619f+Q25m7gUwsaHUF/akHXjvSwe1+LWiXMJ0Gk=;
        b=Ahf9bSuPbs07Sketn37oBw4LLzpy7M2XKBa/hYS7SU3gKnWOOm9z7KEvbbWDIXBFjk
         VAxl7z+39NPcMuf56gVAR16zCNl2A0DLcJAbm3M29C17Dyc8EcBYCt4CAoKIL378d/rl
         3M0TT76YinYQep5fuboaioSwzCHTLUiuNCiv2clG6rcsuES/bhJs2ONQmrZY0KiA3vQZ
         03sc24uPIIMbn/nr2bRN5oNWD6SkRhm62xQuDu8u4quhfYsjZ7Gk3WRq/El8vc2hN149
         l0BvpiGzioqEM5PDSagA2pRZZiwQdunsjTukFQN9NgsRL2iAqJTQtJ/SPa6mVYArJ3IV
         +dBQ==
X-Gm-Message-State: AOJu0YzunVVoPq8ED12LLWR2lu+tInrrdELnjkGAZ0cGInjwBHZ3aP4/
	7rt2dJnpBsl+6ZJLPx7hG8viTzkyTT4=
X-Google-Smtp-Source: AGHT+IGbPFD0bcE5wCs1htp9GU5eeHdcWq1LsHPM6G0yMoj/MHBbqHcqGORyISlDm6kxnblk/eo4YQ==
X-Received: by 2002:a05:6512:3d25:b0:505:6edc:b548 with SMTP id d37-20020a0565123d2500b005056edcb548mr2522823lfv.2.1697566055251;
        Tue, 17 Oct 2023 11:07:35 -0700 (PDT)
Received: from [192.168.0.104] (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id c12-20020a17090603cc00b009adce1c97ccsm210358eja.53.2023.10.17.11.07.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Oct 2023 11:07:34 -0700 (PDT)
Message-ID: <337b7086-98fd-469d-a9ce-36b2d8a20559@gmail.com>
Date: Tue, 17 Oct 2023 20:07:33 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8192u: remove entry from Makefile
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thorsten Leemhuis <linux@leemhuis.info>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>
References: <2023101709-amuck-upward-46f1@gregkh>
 <51fcd05c-cb8e-420f-be62-0c9ade82fbfb@leemhuis.info>
 <2023101757-defy-spiny-4faa@gregkh>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <2023101757-defy-spiny-4faa@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/23 15:35, Greg Kroah-Hartman wrote:
> On Tue, Oct 17, 2023 at 12:35:57PM +0200, Thorsten Leemhuis wrote:
>> On 17.10.23 10:13, Greg Kroah-Hartman wrote:
>>> In commit 697455ce4110 ("staging: rtl8192u: Remove broken driver"), the
>>> driver was removed, along with the Kconfig entry, but the Makefile line
>>> in drivers/staging/Makefile was not updated, so things like 'make clean'
>>> fail to work properly as they will decend into all subdirectories to try
>>> to clean things up.
>>>
>>> Resolve this by removing the entry in the main staging Makefile.
>>>
>>> Reported-by: Thorsten Leemhuis <linux@leemhuis.info>
>>> Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
>>> Cc: Arnd Bergmann <arnd@arndb.de>
>>> Fixes: 697455ce4110 ("staging: rtl8192u: Remove broken driver")
>>> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>
>> Thx Greg, that fixed things for my case. In case anyone cares:
> 
> I care, thanks!


Sorry for messing up. I did a compile test of the entire kernel but I 
was not aware that I also need to test 'make clean'

Bye Philipp
