Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC74E6166A
	for <linux-staging@lists.linux.dev>; Mon,  4 Mar 2024 17:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709574598; cv=none; b=WZ7rcnGqsVjkcXUDpfdGkHvTcWEo7ykdWL5PSGBmaFTmz2kV3pcQ1If/Pe71qBuvJNd8Tir78vuuqbf7y4jaMyjmnPbSEOEUy23lTiC8gSX7FS/0/kEoj8RN4GBgBq4dx25VUeQovHNHa0tIqlrnQOMm4BK7dvOBR2exm73s8SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709574598; c=relaxed/simple;
	bh=VtwakiId4faZUwyLZXPzBmmz2ssNcRrMaBHvrtoWAa4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XHP4C0lRbns/joz9OM1679RvjXtU1UnHpNBmQxNt+4U+gcDnvED+jofe7pHGv6Ac3njhBPm+CflLRWDz0IEcqwgetUxWvdfZlVBamYS4TqfSTgNUXT9njmQDJGVTqE3nIrHdIiYWlJwgz1XRG7B7k8UgUa8ptwKJPCTSx3iOtiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=VAd69Nbw; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="VAd69Nbw"
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-7db1a2c1f96so1451704241.0
        for <linux-staging@lists.linux.dev>; Mon, 04 Mar 2024 09:49:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1709574595; x=1710179395; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Pd2ZqD9+Nj0j4ec7ryunKzk1xgCPWEAoRbwQKMaYuE=;
        b=VAd69NbwSSR/mesR0VvjFNbfJA8bl1tM39UbEvRlp6oR0WXUwDBLzYj/jCCSkVr9TH
         m/cGB1SmDC+o1pzzMTwyBBVdgAqusPWo4WzVpp/UJ9KoZM7xSL1mOjdxHkkhc1WkG+l9
         bxehlwE+U6QiJx8sHkolLdwhjwnIaMsKOi1uk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709574595; x=1710179395;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Pd2ZqD9+Nj0j4ec7ryunKzk1xgCPWEAoRbwQKMaYuE=;
        b=Xt0T7JSCv6BdDuStUJ1Rba+FdmEAG4DX9CxTfTjPF7uPhLWewcr2pCMiErOtSlqcj2
         Ni2fbbkyE3Gr8rXZgdQrrbbeXfJ43iG0jGl1Qt+TmKrndQbO7sedmPH22bjKuePn0V+e
         6HifbGMEVtiEMSieaoBwRsMr+A1MxhhAlsGux4H9YVe6w7QFsoUAKU3oDRylBfJrHkxu
         u/Y/adK5tOkS5YY7cMjRX3LABoS0MMya1rkA713lZaeG03z8aAcoPsnPybw9N3bfuDDu
         si7V/6xfEIPNCDBWn83vW3leziYbxoNeFgsmOyOmO31mB2eRAalPrfd8YeaYoI082r5H
         hmZg==
X-Forwarded-Encrypted: i=1; AJvYcCVdpxRvXqJ4oB5QvvxpEjSWJpw7O7vlAOSMl5AVAzujBSN5JOHEm7yHNe68OkW331VA6qeIcdZV/im3dGlvWl+IE3fJOd17BHwMuO8AqA==
X-Gm-Message-State: AOJu0YxN+q+4s9ISj4ThhiTcVq1uUjxHuz5LqA4xAgkL54tCBsPD5W3d
	YDwwJsDyTBJv9GP3sicpkW5s80+sPedbv2joWQzVn/8zmZBHn0HOXdY+PJjzoA==
X-Google-Smtp-Source: AGHT+IFKl0IbUfafOj5m9zaSe/S5V0PjhekyC8gN8/+VSm+peqpjggkhFvHZLy6t34sJp++enhU9+Q==
X-Received: by 2002:a67:e34e:0:b0:472:6e92:dc9 with SMTP id s14-20020a67e34e000000b004726e920dc9mr6672607vsm.4.1709574595513;
        Mon, 04 Mar 2024 09:49:55 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id kd3-20020a05622a268300b0042ef2740186sm1103686qtb.51.2024.03.04.09.49.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 09:49:55 -0800 (PST)
Message-ID: <1c77c0ef-c098-4962-909d-6bf53cdbde60@ieee.org>
Date: Mon, 4 Mar 2024 11:49:53 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: fix get_channel_from_mode() failure
 path
Content-Language: en-US
To: Rui Miguel Silva <rmfrfs@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <379c0cb4-39e0-4293-8a18-c7b1298e5420@moroto.mountain>
 <m3sf16tky7.fsf@gmail.com>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <m3sf16tky7.fsf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/4/24 3:17 AM, Rui Miguel Silva wrote:
> Hi Dan,
> once again thanks for the patch.
> 
> Dan Carpenter <dan.carpenter@linaro.org> writes:
> 
>> The get_channel_from_mode() function is supposed to return the channel
>> which matches the mode.  But it has a bug where if it doesn't find a
>> matching channel then it returns the last channel.  It should return
>> NULL instead.
>>
>> Also remove an unnecessary NULL check on "channel".
>>
>> Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
>> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> 
> Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

Looks good.

Reviewed-by: Alex Elder <elder@linaro.org>

> 
> Cheers,
>    Rui
> 
>> ---
>>   drivers/staging/greybus/light.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
>> index d62f97249aca..a5c2fe963866 100644
>> --- a/drivers/staging/greybus/light.c
>> +++ b/drivers/staging/greybus/light.c
>> @@ -95,15 +95,15 @@ static struct led_classdev *get_channel_cdev(struct gb_channel *channel)
>>   static struct gb_channel *get_channel_from_mode(struct gb_light *light,
>>   						u32 mode)
>>   {
>> -	struct gb_channel *channel = NULL;
>> +	struct gb_channel *channel;
>>   	int i;
>>   
>>   	for (i = 0; i < light->channels_count; i++) {
>>   		channel = &light->channels[i];
>> -		if (channel && channel->mode == mode)
>> -			break;
>> +		if (channel->mode == mode)
>> +			return channel;
>>   	}
>> -	return channel;
>> +	return NULL;
>>   }
>>   
>>   static int __gb_lights_flash_intensity_set(struct gb_channel *channel,
>> -- 
>> 2.43.0

