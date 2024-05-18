Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222CEDF55;
	Sat, 18 May 2024 13:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716040025; cv=none; b=rWC1Ovzif+Mr7hwtokhEEHsnFfwmXF5T6BG8AfV9wOhxCuN5wTGUrXDw32OlpXt0PbKVmomL3H73vVTeNmlk6NC+1658uDpeKfMQEotGbDdbC7keXJctQTuRgccyerhspjEP8it9lGBIayMg2jGk5kBPVKowRBFJPUHr2Uc7iEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716040025; c=relaxed/simple;
	bh=gBwiPDUKUdo0/DK86Vgfiy4MVB/T/tLIG0TiIn8nI54=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=qsTfF0mLqbPG2FDu6yarF42omLTUWBOZpPJUoEEAxfQ2/sERYDQyRAVeEpjDAtLo1Wjg3V/kiVuv0STXXIJyB6/0/C1rk23HM3uC7S29kGOuJBorQhh49veTKSSY4XImOl2mfsqr6VIrXk6Q+TS7/QsZ7ETB2QUhb1fxk3lCzrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tr29kzis; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tr29kzis"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-51f22405c0bso211888e87.0;
        Sat, 18 May 2024 06:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716040022; x=1716644822; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=piPMR+AewjslaXfFTHwpNmiSJso9W6ms/k21mjS8LoU=;
        b=Tr29kzis/2WDIoXApPeS80bEuP/oe4B3tPdXsFXtoq6f4xSs0JoJyVd7R50Zk78RHr
         FpPAkN6MNNEFBLHGq1hjz+7DLYv/7aEUdowdkTIgV945SEB5bcwoV7WRuNJgqJYtKvO9
         8kFBZadVAh5bAnK37LMHmdx5oH+/V9QWNR4XyIoNuD7EUSf6d2pGTT0lwYdVbUYiCk8I
         Y8U7kuKf0JYgxkz3P68WgZPBN+/O0Zn0aoqRrYRToVacy/wKe/tDGkVqGvlx8Tw+UXtl
         95QksjKIoqRTluw++uXK7YQSrtEO/ylyA9DivQR15JYFDOM523GeUdIy8cQiw3HoblyS
         4wkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716040022; x=1716644822;
        h=content-transfer-encoding:subject:from:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=piPMR+AewjslaXfFTHwpNmiSJso9W6ms/k21mjS8LoU=;
        b=sL5WRi+v3vDP/NxwUEMzibEGHa/jK5gQ+Pk9klJ1qCJ2cOeHL6a1QCtzWXl2sEi2Ye
         kROeMEn/M8XvHdUirHj8o8rRFq5dh+HT9A4WxdXhcSAbApF5zGo/RWRoMXQZw0JdwZZH
         vrzKZs+U+W0ie/LiWvROTXISwFMT49LUcH61SLOpwtVUBW5FhmJgklnX4XDTdhyHZ0xb
         OR5F4pwA2fIemWB+hZP3rcByJwaxFBwGese6zGBL25Swn9DeaqAJ5afoOy+ZcTs0Gc8Q
         cb77FACft5cKGCEV62nCOlWHE0cMMGFoshYbxnHjtx/w7HXWj+9/BgT8PP8Sdyo7g38H
         u+jQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnXsXZNcqJYxUn1lTNvzgcPeMjiLE4XjZ8Opyz/ySHRSsSzZ1aBgO6odrmVxPXNHV8luue8MIY3GNQoRd5PfvNOWpenzvDHpUG
X-Gm-Message-State: AOJu0YzNfUCQcbM1XoocP9dnfGrljtSgl+cU6mM3MWtzGqIjR/kmIVQ9
	LrSbQN/lthUxxyPYueCpH35q8Js3hgboU4GrrhmV/ZFghxYzJgAOCTVbXA==
X-Google-Smtp-Source: AGHT+IG7QjLOHIkwSE9XNOlBm+6VvxvI4EFJbcja0r3SwUe11Cv1EAyK8LQklu0j6zdhFoeOjHEooQ==
X-Received: by 2002:a19:f604:0:b0:51f:d82:8e07 with SMTP id 2adb3069b0e04-5220ff72b4cmr11697903e87.2.1716040021745;
        Sat, 18 May 2024 06:47:01 -0700 (PDT)
Received: from [192.168.0.102] (p57935690.dip0.t-ipconnect.de. [87.147.86.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b17754sm1215855066b.192.2024.05.18.06.47.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 May 2024 06:47:01 -0700 (PDT)
Message-ID: <623629d4-87ad-4e7d-b4f7-2d10e0c02a2d@gmail.com>
Date: Sat, 18 May 2024 15:47:00 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
 Linux Outreachy <outreachy@lists.linux.dev>, kernelnewbies@kernelnewbies.org
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: Which driver to use for patches?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear knewbies and developers,

maybe you ask yourself: Which driver to use for patches?

Here the list of drivers I can support you with tests (from the staging 
subsystem):

rtl8723bs
rtl8192e
rtl8712
vt6655
vt6656

Please feel free to contact me for questions.

Thanks for your support.

Bye Philipp



Hint: You like to get your own hardware? Here some hints where I got 
mine from:

rtl8723bs
This hardware can be bought directly.
https://www.ebay.de/sch/i.html?_from=R40&_nkw=rtl8723bs&_sacat=0
But since it has a SDIO Interface it is not so easy to connect it.
Luckily I found out that the
Laptop ODYS TRENDBOOK NEXT 14 (not so easy to install linux on)
Laptop ODYS TRENDBOOK NEXT 14 Pro
do have it build in. I just got one so I am able to test.

rtl8192e
This hardware can be bought directly.
https://www.ebay.de/sch/i.html?_from=R40&_nkw=rtl8192e&_sacat=0&_odkw=rtl8723bs&_osacat=0
But you need a mini PCIe Card slot to connect it to your computer.

rtl8712
I found this hardware some time ago. It is a USB Stick brand packard 
bell Part Number: AW-NU120

vt6655
I found this hardware long time ago. It is a mini PCI card.
It seems that it is build in a One A400 Notebook. But I do not have this 
Notebook.
https://forum.ubuntuusers.de/topic/via-vt-8739/

vt6656
I found this hardware long time ago. It is a USB Dongle. It was build 
into video cameras. That is the reason why I found it and was able to 
buy it.
