Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C84AC129
	for <linux-staging@lists.linux.dev>; Mon, 27 May 2024 04:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716784599; cv=none; b=eAfVOO/wj7+SOq/q6iLuR/6mxyoc6wFYNTwW3OW19Cx8CJ9lJQqYHS9BTX3ph9yMmlnVke7SdY/hzbMJzkA2yJRY/j8Ig0pJnyYmgcsDXnsAUtd+kPCNtYH8bFZZVtOGqgFYOPEu4z7W4Emp4K/FVRnvB3kTvYTGPZ5khwHLVbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716784599; c=relaxed/simple;
	bh=JFCKn4eHAN81Du/zcCpOBwqgtwNTwkK5vphe6gnA6k8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OajbqA7u6Z9Y0A3JrnJ/FBL8dqMPLl0vE9svm8tmB9HAb7xC71ulhcC89s0IbFbu7/pEcTpgDjrvMXzqblCKeSi6zufB6c7LsUqq25KNF4NLOkynUIRn45+6MqSULi5nwd6hBKdRvCysGPL5snnDCH5MkKcUbOtrmOeitdBe2IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NM00TtYy; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NM00TtYy"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-529b4011070so64544e87.1
        for <linux-staging@lists.linux.dev>; Sun, 26 May 2024 21:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716784594; x=1717389394; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f/OfPFNzm2s0MgFj+RxiHO7NnoypMwcCoRKdYIhchcI=;
        b=NM00TtYyynkMtiHa3oyxF4eYkc1sKCJ+51yF7bEkNvFPJesChcmXCq3c+9eKV7WP9N
         bZyh5/eVf6XvIRFKgLnUji4EN9gNrUUtuETqUL0PdpKBo6ZSaaNrBxaHpJs9zVBMkUK2
         k677pnKnesKTpruX2vq2bJWqbY1qQFv9XLEjg86MbENmyS3P8ZPyVBe25hldv8jgGSCm
         sKEEcFcl4StLurRg8E+Yn/dACg7S1NRhz6A9dwkx71o857DvI8rtRh1SsDUVC+jxVHfB
         OLD52jPoJdJzQyBCCJ05qD9cLHZ2of2IZuhTpBeUrlFMiQJYmBA9Q+DL6OW1yVRHa5gy
         fY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716784594; x=1717389394;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f/OfPFNzm2s0MgFj+RxiHO7NnoypMwcCoRKdYIhchcI=;
        b=ZaohZAXLvF9C9+BLIv5F3CK6JHe5gwVhaajbcExg0rGPUw6jDkL6XYPkKQG891ZO6t
         3fYhWQYuvHjBuVOeonn9bL0B3+0Ud/YNTNPH+K00zP41EhRJkwgjbRBAmECr43tZme2i
         bXaPZ6/uIfe6SUuCYPg1/jDRkn7P6A4p+/kt0Nk0jUnXjupTsvJKwmlGg0Ek3xjVpBgR
         ZkaxsUmVUVXpd9ozAssE1hfKgpmlk5U0289ISAiIigYv3E15C0qo/AD6g9U2iP653kEX
         NHKWuY5s6wul1Xi4kQUt8LCJsFGibr5YOhw9yIylUcrNB3sGpGJXq5OBvSFWSchkdqEA
         6ONQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhKGD7md9Rb9n8Qhkgz0zKWMxzws4qN6sEFD/m75xJXyjNfaJFmYm4WfCgC1lOsJuZdDzhFUeBaS6KzYWWhPwCQysR+F0J1JGYT9gf3g==
X-Gm-Message-State: AOJu0YyQ3NScBZpC3me59ZZ33KUUcn3ulb10ODVIrO0w6+xH5DdgDihF
	Q2/BBCXWxmksQasNiXpX8xlvQOVLAaZhskqRJRZVLjNKJjsU6H+s
X-Google-Smtp-Source: AGHT+IGNNEzeiuNtYUmKybjpiz+SU+s2iEZDKnWWI4132MZxeQu7nL3i0x1AHYAGEe03MyxfQoisIw==
X-Received: by 2002:a19:5e0e:0:b0:522:80d:5dc6 with SMTP id 2adb3069b0e04-52964fac61amr4578196e87.41.1716784594308;
        Sun, 26 May 2024 21:36:34 -0700 (PDT)
Received: from [192.168.0.101] (ip-77-25-34-87.web.vodafone.de. [77.25.34.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626c97a029sm450130466b.93.2024.05.26.21.36.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 May 2024 21:36:34 -0700 (PDT)
Message-ID: <e25831a9-9913-43da-831b-d37bdc4d9dd3@gmail.com>
Date: Mon, 27 May 2024 06:36:33 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] staging: rtl8192e: remove dead code
To: Nam Cao <namcao@linutronix.de>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240526111928.14574-1-straube.linux@gmail.com>
 <20240526111928.14574-4-straube.linux@gmail.com>
 <20240526143100.FmVupNWq@linutronix.de>
Content-Language: en-US
From: Michael Straube <straube.linux@gmail.com>
In-Reply-To: <20240526143100.FmVupNWq@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 26.05.24 um 16:31 schrieb Nam Cao:
> On Sun, May 26, 2024 at 01:19:28PM +0200, Michael Straube wrote:
>> Remove two else-if arms that do nothing.
>>
>> Signed-off-by: Michael Straube <straube.linux@gmail.com>
>> ---
>>   drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 6 ------
>>   1 file changed, 6 deletions(-)
>>
>> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
>> index 5392d2daf870..4e03eb100175 100644
>> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
>> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
>> @@ -1370,9 +1370,6 @@ static void _rtl92e_dm_rx_path_sel_byrssi(struct net_device *dev)
>>   					tmp_sec_rssi = cur_rf_rssi;
>>   					sec_rssi_index = i;
>>   				}
>> -			} else if ((cur_rf_rssi < tmp_sec_rssi) &&
>> -					(cur_rf_rssi > tmp_min_rssi)) {
>> -				;
>>   			} else if (cur_rf_rssi == tmp_min_rssi) {
>>   				if (tmp_sec_rssi == tmp_min_rssi) {
>>   					tmp_min_rssi = cur_rf_rssi;
>> @@ -1426,9 +1423,6 @@ static void _rtl92e_dm_rx_path_sel_byrssi(struct net_device *dev)
>>   						tmp_cck_sec_pwdb = cur_cck_pwdb;
>>   						cck_rx_ver2_sec_index = i;
>>   					}
>> -				} else if ((cur_cck_pwdb < tmp_cck_sec_pwdb) &&
>> -						(cur_cck_pwdb > tmp_cck_min_pwdb)) {
>> -					;
>>   				} else if (cur_cck_pwdb == tmp_cck_min_pwdb) {
>>   					if (tmp_cck_sec_pwdb == tmp_cck_min_pwdb)
>>   						tmp_cck_min_pwdb = cur_cck_pwdb;
> 
> I would be careful with these changes. These else-if do prevent the
> execution of the other else-if, so the code do not behave the same anymore.
> 
> The only case this patch doesn't change anything functionally is when the
> condition of the removed if-else is mutually exclusive with the conditions
> of the following if-else. Are you sure this is the case?

Ah yes, I had not thought about that. Thanks for pointing out.
I'll have a closer look and resend the series. Either without this patch
or, if it's safe to remove, state it in the commit message.

Thanks,
Michael
