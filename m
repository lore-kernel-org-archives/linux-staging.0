Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3342D7E107
	for <linux-staging@lists.linux.dev>; Sun, 29 Dec 2024 10:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735469179; cv=none; b=nuOa4H4vbNcpNsmVPxiHusI7ASRd3LgkxfG5A4XKwwPwd4Io56jaXrWQ1+nCUP++ANKYl8t7GF4gvmv5FvBWbh9jqXNGae4bE5B8b1WBGyC8b96rKqNqhZr1g1VqbhWRPuHboEw7EvPi1AgoGgZrdUdBrxFCx7xsnORpuU4RpeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735469179; c=relaxed/simple;
	bh=pox7wOhpgeOGwbylosDIGPIe0qzc6zuJGo5jrvS7JoY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gkCEbPpWCvZhBhEiXQuHyHUvHYD4hJKTy3cdZ5znHbGviE9taIcvsxF0s19jhoA4HbhFw2ZQC9ZNWAKeRzC8biffNaaS1SmY7zQ3Dap2wdmMBztGXes6uBx1r5L7LlOJs2hZ8BiWsEHP5/4e1lCpD2o0mTHqxYvRCEtX19GTooM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZbjeaxwU; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbjeaxwU"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21644b473ddso12193545ad.0
        for <linux-staging@lists.linux.dev>; Sun, 29 Dec 2024 02:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735469177; x=1736073977; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N7GnVocTVzWX7YX1xEA7961wDfmO4N80qGH/AUbSiDo=;
        b=ZbjeaxwU9azVUhXijXph8GFYNHTwN6fFa9HJDFamPJjGUe8jCIwB9HTdnENo+kxiZp
         zpyz+rtRkyE+l9/DycOE5VTarhZz1t1AtkZOiV/tTTC5wGTYpsRjv//Y4hUJBOa+99Bo
         VSnEYEzjymk9zL5/xzdCle3szi00SVQXISP6BsPGeLU9/ChBD3au64xST4GgQbCTNlLo
         piHAOkGNXWuxHxJ8++GVYgrAAoaukRAGAcH/cRFlpxoL/5Kq9ECcM7PbpYzveypImI7s
         7RYbFizRnOMqrlPewtw4h37m2sBMPVxyH1ij2GSzhRjLCVTs3x/VhdgT7fsoiA6k++h3
         WJHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735469177; x=1736073977;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N7GnVocTVzWX7YX1xEA7961wDfmO4N80qGH/AUbSiDo=;
        b=fzww1rUrVpza4lb/ilyzD3pWyo+YuZTyhmbUWPC0oA5QElqQY6hNZLtHMUBAF0FQQ6
         ql9CjzG1OX8Fv88qwri5KuANmJ3AQz1hhqgsug8PYTwWrBgwZd3suLgwY0ZVd0UUPcfU
         KcTGYGvDRg/Z1KXV8ZhrCij3esjcfVHPR+2oJPecATgmBnrhly2nNpiuBTiRXIaDtqQg
         dEEn3d5EHi5GTEI7351WMvXlc6CvGmciVbSeuOb8OMw7OlZ3TJEsk5DB7JpepK9LumX8
         Dnrl4KAAGBPV5eI3iAChhEubxKJZzp/l/Ih3EZX9JUV3n4zoOdgukDO8FbHebbrSPm54
         rYRA==
X-Forwarded-Encrypted: i=1; AJvYcCX2Qq0bqxmps0kd3djD9Guu3qW/lT5grnQ8b3XlTqY47xrn7KdB2ntg35LJaZEktoKOBjGJhpkWrpVh+Hub@lists.linux.dev
X-Gm-Message-State: AOJu0Ywz0t9TAMC8mwopuRBzT6sU1zqmfiZnuzsj6EbJ29ykHKLbOIB3
	uYGTmQuHgxPWR5vtXP3z5WSD0sNkfxAD/mrwgJoM+8PJHXxtbzi4
X-Gm-Gg: ASbGncv56WltaEpYmzvyRafQBWsVJdWTmTv+J34iM0xW6N59IOFWNMjy/jyces9Mkm0
	bZ9VEQKjco69VTiYEJ/VrnWH7UI1aSZcwEDQ/Y2lkIJuz/ktRErZQ30e9+HjmY6kJTqY+WkeA+j
	4uBd0yuLv20t/5i0fvDKPyRpVgazCepEwKwtW5fn9uYOPT5q/AVAWPDVEW/q216d9HaQC7H+fia
	iOah9WVsZogX/NAMkAnxJ+7FVdjbNEMfrgzZzvo2gtJlT1M7ptVMzv/Z+0yQk413L0=
X-Google-Smtp-Source: AGHT+IF37Rjb/Z0OEwaHGhUolTO2jg0pZ50sJHxjMOGU34y+kM6tO1sL2YAT8JzJVqbLNI8SvZipqA==
X-Received: by 2002:a17:902:f681:b0:215:5f17:4296 with SMTP id d9443c01a7336-219e6eb3ac4mr159796165ad.8.1735469177134;
        Sun, 29 Dec 2024 02:46:17 -0800 (PST)
Received: from [192.168.1.19] ([171.76.83.141])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc96eadcsm161911235ad.73.2024.12.29.02.46.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Dec 2024 02:46:16 -0800 (PST)
Message-ID: <1380b46e-771f-421d-86e0-825c9ae7d039@gmail.com>
Date: Sun, 29 Dec 2024 16:16:13 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/15] staging: gpib: ines: Handle
 gpib_register_driver() errors
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dpenkler@gmail.com, dan.carpenter@linaro.org, skhan@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20241228060800.107653-1-niharchaithanya@gmail.com>
 <20241228060800.107653-12-niharchaithanya@gmail.com>
 <2024122943-fervor-unhinge-0ed2@gregkh>
Content-Language: en-US
From: Nihar Chaithanya <niharchaithanya@gmail.com>
In-Reply-To: <2024122943-fervor-unhinge-0ed2@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 29/12/24 15:58, Greg KH wrote:
> On Sat, Dec 28, 2024 at 11:37:59AM +0530, Nihar Chaithanya wrote:
>> The function ines_pcmcia_init_module() can be replaced by calling
>> pcmcia_register_driver() directly. The error value from this
>> function is not returned and the previous registering functions
>> are not unregistered.
>>
>> The function gpib_register_driver() can fail and similar to
>> pcmcia_register_driver() function failing, the previous registering
>> functions are not unregistered.
>>
>> Replace cb_pcmcia_init_module() with pcmcia_register_driver().
>> Unregister the gpib and pci register functions if the subsequent
>> gpib or pcmcia register functions fail and return the error value.
>>
>> Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
>> ---
>>   drivers/staging/gpib/ines/ines_gpib.c | 81 ++++++++++++++++++++-------
>>   1 file changed, 60 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/staging/gpib/ines/ines_gpib.c b/drivers/staging/gpib/ines/ines_gpib.c
>> index 9d8387c3bf01..73df4cd16926 100644
>> --- a/drivers/staging/gpib/ines/ines_gpib.c
>> +++ b/drivers/staging/gpib/ines/ines_gpib.c
>> @@ -1227,12 +1227,6 @@ static struct pcmcia_driver ines_gpib_cs_driver = {
>>   	.resume		= ines_gpib_resume,
>>   };
>>   
>> -int ines_pcmcia_init_module(void)
>> -{
>> -	pcmcia_register_driver(&ines_gpib_cs_driver);
>> -	return 0;
>> -}
>> -
>>   void ines_pcmcia_cleanup_module(void)
>>   {
>>   	DEBUG(0, "ines_cs: unloading\n");
>> @@ -1420,28 +1414,73 @@ void ines_pcmcia_detach(gpib_board_t *board)
>>   
>>   static int __init ines_init_module(void)
>>   {
>> -	int err = 0;
>> +	int ret;
>>   
>> -	err = pci_register_driver(&ines_pci_driver);
>> -	if (err) {
>> -		pr_err("ines_gpib: pci_driver_register failed!\n");
>> -		return err;
>> +	ret = pci_register_driver(&ines_pci_driver);
>> +	if (ret) {
>> +		pr_err("ines_gpib: pci_driver_register failed: error = %d\n", ret);
>> +		return ret;
>>   	}
>>   
>> -	gpib_register_driver(&ines_pci_interface, THIS_MODULE);
>> -	gpib_register_driver(&ines_pci_unaccel_interface, THIS_MODULE);
>> -	gpib_register_driver(&ines_pci_accel_interface, THIS_MODULE);
>> -	gpib_register_driver(&ines_isa_interface, THIS_MODULE);
>> +	ret = gpib_register_driver(&ines_pci_interface, THIS_MODULE);
>> +	if (ret)
>> +		goto err_pci;
>> +
>> +	ret = gpib_register_driver(&ines_pci_unaccel_interface, THIS_MODULE);
>> +	if (ret)
>> +		goto err_pci_unaccel;
>> +
>> +	ret = gpib_register_driver(&ines_pci_accel_interface, THIS_MODULE);
>> +	if (ret)
>> +		goto err_pci_accel;
>> +
>> +	ret = gpib_register_driver(&ines_isa_interface, THIS_MODULE);
>> +	if (ret)
>> +		goto err_isa;
>> +
>>   #ifdef GPIB_PCMCIA
>> -	gpib_register_driver(&ines_pcmcia_interface, THIS_MODULE);
>> -	gpib_register_driver(&ines_pcmcia_unaccel_interface, THIS_MODULE);
>> -	gpib_register_driver(&ines_pcmcia_accel_interface, THIS_MODULE);
>> -	err += ines_pcmcia_init_module();
>> +	ret = gpib_register_driver(&ines_pcmcia_interface, THIS_MODULE);
>> +	if (ret)
>> +		goto err_pcmcia;
>> +
>> +	ret = gpib_register_driver(&ines_pcmcia_unaccel_interface, THIS_MODULE);
>> +	if (ret)
>> +		goto err_pcmcia_unaccel;
>> +
>> +	ret = gpib_register_driver(&ines_pcmcia_accel_interface, THIS_MODULE);
>> +	if (ret)
>> +		goto err_pcmcia_accel;
>> +
>> +	ret = pcmcia_register_driver(&ines_gpib_cs_driver);
>> +	if (ret)
>> +		goto err_pcmcia_driver;
>>   #endif
>> -	if (err)
>> -		return -1;
>>   
>> +	pr_info("ines_gpib: module init is complete\n");
> Why did you add this debugging line here that was not here at all?
>

Hi Greg, I thought to keep all the *_init_module consistent in gpib, so 
added

this. If they were not present earlier I won't add them in the next version.

>>   	return 0;
>> +
>> +#ifdef GPIB_PCMCIA
>> +err_pcmcia_driver:
>> +	pr_err("ines_gpib: pcmcia_register_driver failed: error = %d\n", ret);
> Why just this error message for only this one failure?

This failure is when pcmcia_register_driver fails, it could give multiple

error values.

>
>> +	gpib_unregister_driver(&ines_pcmcia_accel_interface);
>> +err_pcmcia_accel:
>> +	gpib_unregister_driver(&ines_pcmcia_unaccel_interface);
>> +err_pcmcia_unaccel:
>> +	gpib_unregister_driver(&ines_pcmcia_interface);
>> +err_pcmcia:
>> +#endif
>> +	gpib_unregister_driver(&ines_isa_interface);
>> +err_isa:
>> +	gpib_unregister_driver(&ines_pci_accel_interface);
>> +err_pci_accel:
>> +	gpib_unregister_driver(&ines_pci_unaccel_interface);
>> +err_pci_unaccel:
>> +	gpib_unregister_driver(&ines_pci_interface);
>> +err_pci:
>> +	pci_unregister_driver(&ines_pci_driver);
>> +
>> +	pr_err("ines_gpib: gpib_register_driver failed!\n");
> Why not provide the error number here too?

When gpib_register_driver fails it would always be ENOMEM error value,

so should I mention this number?

>
> thanks,
>
> greg k-h

Thanks,

Nihar
