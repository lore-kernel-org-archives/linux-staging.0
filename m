Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B0E32C1BD
	for <linux-staging@lists.linux.dev>; Thu, 18 Jan 2024 16:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705596641; cv=none; b=V97jRJ9Mybl/4LeUDnz5OIkNOAcsgSK5fc1TNXYZC7SalWWZwgn4bcYFM95JGSZk5BvAbkJQ4Hoed5+vhhPBPvyDVz1ioHF4Mdnvig8NiBGG/czrntU8f63XFWBWPl0OFVMElFdYUksJOX2HcbHk//BASFMz5mc1/VjN7J6Iayc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705596641; c=relaxed/simple;
	bh=GoSnJvbInhUneOcpIMpG6PO4wGt94pP9zivRHcpW51o=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=k3U0vTN5YQU9O/hqHiawKI4m4Z4OUWjwmEh7z2WD1Noc6ozw4YjwR9PsrtGiKuR5aEFGZzX9oAfJXcCgg9awgNyIvU2YF+EZ9hx8pdQAEmqJ5Obf0E3w2MnHFMumb8ysg+oNSjQYeAaC9CchEN0FJ5EZO9wcDmWKvhNGJ93oNaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IRRrIs2R; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IRRrIs2R"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6814d9a6acaso2282996d6.0
        for <linux-staging@lists.linux.dev>; Thu, 18 Jan 2024 08:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705596639; x=1706201439; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s8NzZFNxh2baIGiQbA9hgRxIhE+RRKnrU1sqWVerRcs=;
        b=IRRrIs2REYvUQgGo/B7sWzprBp3jC6C4Rd/VsGJEmQukYXljr+u3ks+7aBdUJUBB3n
         LTG0bFmp78Pk9zupaAkz/hOiQNxjr30uxGfPnPf2IhyJDAUPnw1qZIa/LNcqZQVS+Vy3
         QPIkfyOZM8NrLv88fAyr59UruUFnrLiDQjjYxEr+lFnPVGrGTwReQL1mLH+Pv8FXWgKo
         P/PnC3ktAGiuwALn0cdboUMjlZQ0rBW1nOriu2vRp4s4Jw+Gm7m4CIDhZeqILwZVGm+Y
         x8Qt61VcL1/HlHTNfMEqVn+GjuvRr7wiiA+Txamh4Y2xSAISr1vMLkhTMpfWmmYGLdQF
         Dtlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705596639; x=1706201439;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s8NzZFNxh2baIGiQbA9hgRxIhE+RRKnrU1sqWVerRcs=;
        b=F35qm4w/rM8gLz17q57MJ4NwMZQmuemDsDdya2v77FLb8qAc6EGuJVZQ7NmR8f1RVW
         QRG653ZbFcAFIOl+Cd2FZ91n4/gIdY4vTs3FdC4k2Ca8llXwvAUbYSiYAy+HG5icF7L2
         3nq1H+z56KGm1625j9iqpcd4jlSW/x0iQ1HJWPfVOBhz/pvbH6SK8QPG6L9a4KfSbIcE
         qJDp8HFvRHGG24cvRfa5KvcV181Zgywok2+t2YQpN3lCqBzE3BjityfWnoWGrYj5XhWF
         VvTIL8QGlRpNrxFtjIZmPxbqW+0t7TPC+yaa+iqQg7FPq5oQPf/Ovsz1L6A5UMa9sJf8
         ygpA==
X-Gm-Message-State: AOJu0Yxj4/iyIz74hqVw3hZJDvZPvujCNtQjWodeLygu9AerF0dWcZ1g
	4FWBhsT+rWtK3jOAy0BnO+XCdtXj3hvQiMYmiiKi8LX14y2Yl317hbYorpM9PqEQ4g==
X-Google-Smtp-Source: AGHT+IGLoi6AJacYTFUutdPDIxXBhjkd7tv7QpRB+NoK37GloZywG2v+3j4HUZ2urt0NpPQVD6fioA==
X-Received: by 2002:a05:6214:5184:b0:681:86fd:33c1 with SMTP id kl4-20020a056214518400b0068186fd33c1mr1994344qvb.4.1705596639180;
        Thu, 18 Jan 2024 08:50:39 -0800 (PST)
Received: from [192.168.1.157] (pool-74-98-201-227.pitbpa.fios.verizon.net. [74.98.201.227])
        by smtp.gmail.com with ESMTPSA id w20-20020a0562140b3400b006817d42eac6sm1441776qvj.53.2024.01.18.08.50.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jan 2024 08:50:38 -0800 (PST)
Message-ID: <5a60b50d-34f5-42a2-8112-f988b89f1e7f@gmail.com>
Date: Thu, 18 Jan 2024 11:50:38 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: rts5208: Add more details to Kconfig help
To: Randy Dunlap <rdunlap@infradead.org>, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240118160901.71756-1-jklott.git@gmail.com>
 <3f4582ac-8180-417b-a83a-0b9f362cc5a0@infradead.org>
Content-Language: en-US
From: Jacob Lott <jklott.git@gmail.com>
In-Reply-To: <3f4582ac-8180-417b-a83a-0b9f362cc5a0@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/18/24 11:47 AM, Randy Dunlap wrote:
> Hi--
>
> On 1/18/24 08:09, Jacob Lott wrote:
>> The current help text is short and triggers a
>> warning from checkpatch.pl. This patch adds more
>> details to the help text which should provide better
>> information for whether or not to enable the driver.
>>
>> Signed-off-by: Jacob Lott <jklott.git@gmail.com>
>> ---
>>   drivers/staging/rts5208/Kconfig | 10 +++++++---
>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/staging/rts5208/Kconfig b/drivers/staging/rts5208/Kconfig
>> index b864023d3ccb..4f9cc3f00e1a 100644
>> --- a/drivers/staging/rts5208/Kconfig
>> +++ b/drivers/staging/rts5208/Kconfig
>> @@ -3,7 +3,11 @@ config RTS5208
>>   	tristate "Realtek PCI-E Card Reader RTS5208/5288 support"
>>   	depends on PCI && SCSI
>>   	help
>> -	  Say Y here to include driver code to support the Realtek
>> -	  PCI-E card reader rts5208/rts5288.
>> +      Choose Y here to enable support for the Realtek PCI-E card reader
> Above line is indented with spaces. It should be on tab + 2 spaces.
>
>> +	  RTS5208/5288. This driver facilitates communication between the Linux
>> +	  kernel and the Realtek PCI-E card reader.
>>   
>> -	  If this driver is compiled as a module, it will be named rts5208.
>> +	  If you opt to compile this driver as a module, it will be named rts5208.
>> +	  Selecting N will exclude this driver from the kernel build. Choose option
>> +	  Y if your system includes the Realtek PCI-E card reader rts5208/rts5288.
>> +	  When in doubt, it is generally safe to select N.
> That's not incorrect, but it is verbose IMO.
> More than we usually say.
>
>> \ No newline at end of file
> Please add a newline at the end of the file.
>
> thanks.
In general is there an option/additional check I can run besides 
checkpatch.pl to catch issues with tabs, newlines, col width, etc?
