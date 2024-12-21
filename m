Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCAE25949C
	for <linux-staging@lists.linux.dev>; Sat, 21 Dec 2024 08:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734770199; cv=none; b=FG3suhRUUmTOzxZBfLj4y1xhncxZbjIWmkSa61d3fQyi2H7TK/0vgWeFrVm/a2TkcwbXsQPeyDlhYq4aV0yccZCvV1hqeya8K2ug6rfBCKhiMkUGbxeTC6Og/GOGhoEUNhUnm2dYGPafP8+pG7wNVkKdxKaHYuJDwaPXTkrxIko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734770199; c=relaxed/simple;
	bh=zq3FSIPvqai8PSLZbc+wQrZwG3OyZj3VS22c3TEhcvQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AawQQqzoLnoD7aFOYdXJJJ4R6hO/Kg3c92OtjaaK/lfHkul8sXuY69YlQHPqV8VrlaIRx7cR8XcomdG+aeSFC/fg/yFK50majZJHuDjfi5t3N01lfj8hjgjPmbS2ENybarwNx8ZSd54KLpTz60CO2SoERpogfwlq7preQahHpcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ggTiWhjf; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ggTiWhjf"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-725cf9fd2e9so233119b3a.0
        for <linux-staging@lists.linux.dev>; Sat, 21 Dec 2024 00:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734770197; x=1735374997; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AxlozA5WyOTr/v1vw9MOVplJHdPgAXlfgvmtt+Wtfs8=;
        b=ggTiWhjf27XtUTdAOiuUZP+bxiyNraRHJ8OCSrJHL0+ELnVYGAbD+lUkRj6chtu0lv
         TkUyIV0BDQ61Ibv62swwy0uCsTzTmzT6DfdW2V5IwIwUGHvCs0X95pUHmJ46kdtYDFvv
         Ad5y6E7vORImLqyHzDtUh5kkjHPknXh4Dw8mETr2QaEWRXv3GV7uKOaHs6khLn7ReKmV
         7TQlEUOQ6csV2OIC+nLcT+lknxZX0HnZUO87w84la0zphNEQXS5P6JzG5RFDg/53YyIN
         9/P1UL2MaVokl4R4BHLXWdif0K3BuaVi7GSDzLbZSh+L0vkV44EB1hZT154m0sT+olaK
         9x7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734770197; x=1735374997;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AxlozA5WyOTr/v1vw9MOVplJHdPgAXlfgvmtt+Wtfs8=;
        b=AtPzq58xCHO19QWZyMaTRv+4OIlFQ3qQSM89S6OMI5DSYl502IbVp83rkH31JJ4R2y
         tdv9DM5T/RswK3GjeR60tWOD7Dg1XqVN5+ISY5lMMzRcgvXdPsMESMSvzCxYdyvtTvg7
         mhHZdEij1FINJCmiR/S+N2FxwM5Dh8AaMzNoxOMblz8L6ztbY73LI5MMvUlEXyvpOJh9
         67J9zk8b73lVMCHyqe/hqhqS6ieQ3x9QpVxGIr0xFFsuGQjcOMFtVnRyuZv2ALWw6s3Y
         vxfCSCvqzXN7de9XkDFi7WTCrxU7/9t2/WrC8A49O5BqLssK80ktoN3hvYQQrmiSX+F9
         dvPA==
X-Forwarded-Encrypted: i=1; AJvYcCWOvi/SJpJ/VdIF788rNN7iVyjUhKz/5Lrg6LNEbN5/bnoQStsgNiEbO7t7YxJUe/GQQkfhigUJZIhir238@lists.linux.dev
X-Gm-Message-State: AOJu0Yzsmwr+eSjixTlRhKxINPydNn/A+BHqP/4omJj1SK/GqXve200b
	+w+n2KiCqhlY4BzEm195ypALnuWjWGmdGmBIyDRkySN5dbTp8pmT
X-Gm-Gg: ASbGncvSlYq9tTrTq+BGqj6VJ640ju/8fx8i/nqyNRuVbzTk8oTh97+Uk2ZbofVqRGt
	UlLBbczu5CVLnULsl6rzO2f8CAul2B4RjLo2ugiB2cQKbUp/hIxXf70ZTMQY5mJXuvLf6tfQCjH
	y06XmsH7cUz7mjas+IWV22TyEOB16lwR7l1ruE2AQJx8V9kT8Kt3+EWxBx/tqP/cXtdZ4rdJJZF
	X+RysSLgSoigSkUPmqcTLSddgaAu4W+Ygg4EYkqj+zpKPXB2xnH/2ELwIUzoRqIb+k=
X-Google-Smtp-Source: AGHT+IHfPptDWXU2iZpfQorvLeoxW3Z2/t+8siyIlERnOkmkaRDld+ziB3FVxh1vwQ9WaYu7HfgUQg==
X-Received: by 2002:a05:6a21:58b:b0:1cf:4dae:2258 with SMTP id adf61e73a8af0-1e5e045823dmr3774779637.2.1734770196972;
        Sat, 21 Dec 2024 00:36:36 -0800 (PST)
Received: from [192.168.1.19] ([171.76.86.134])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842dc7ed96bsm3969465a12.61.2024.12.21.00.36.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Dec 2024 00:36:36 -0800 (PST)
Message-ID: <ae31f6f4-c94d-49f8-a327-fafc018b246c@gmail.com>
Date: Sat, 21 Dec 2024 14:06:31 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: gpib: cb7210: Add error handling
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dpenkler@gmail.com, dan.carpenter@linaro.org, roheetchavan@gmail.com,
 arnd@arndb.de, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org
References: <20241221022632.20931-1-niharchaithanya@gmail.com>
 <2024122158-bunch-critter-0696@gregkh>
Content-Language: en-US
From: Nihar Chaithanya <niharchaithanya@gmail.com>
In-Reply-To: <2024122158-bunch-critter-0696@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 21/12/24 13:21, Greg KH wrote:
> On Sat, Dec 21, 2024 at 07:56:33AM +0530, Nihar Chaithanya wrote:
>> The if condition in cb7210_init_module() would always fail as
>> the value of err is constantly 0.
>> Add error handling to cb_pcmcia_init_module() where it returns
>> appropriate error code if pcmcia_register_driver() fails.
>>
>> This issue was reported by Coverity Scan.
>> Report:
>>
>> CID 1635894: (#1 of 1): 'Constant' variable guards dead code (DEADCODE)
>> dead_error_line: Execution cannot reach this statement: return -1;.
>>
>> Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
>> ---
>>   drivers/staging/gpib/cb7210/cb7210.c | 11 ++++++++---
>>   1 file changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/staging/gpib/cb7210/cb7210.c b/drivers/staging/gpib/cb7210/cb7210.c
>> index 63df7f3eb3f3..b2f6ad70ccaf 100644
>> --- a/drivers/staging/gpib/cb7210/cb7210.c
>> +++ b/drivers/staging/gpib/cb7210/cb7210.c
>> @@ -1353,7 +1353,11 @@ static struct pcmcia_driver cb_gpib_cs_driver = {
>>   
>>   int cb_pcmcia_init_module(void)
>>   {
>> -	pcmcia_register_driver(&cb_gpib_cs_driver);
>> +	int ret;
>> +
>> +	ret = pcmcia_register_driver(&cb_gpib_cs_driver);
>> +	if (ret < 0)
>> +		return ret;
>>   	return 0;
> Why not make this whole function just one line?  And then, as it's one
> line, why is it a function at all?
>
> thanks,
>
> greg k-h
Hi Greg, yes, this redundant cb_pcmcia_init_module() can be replaced with
pcmcia_register_driver() where it's being called. I'll send the version 2
making these changes.

Thank you,
Nihar
