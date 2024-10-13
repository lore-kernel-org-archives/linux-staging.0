Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C117713D24E
	for <linux-staging@lists.linux.dev>; Sun, 13 Oct 2024 12:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728824138; cv=none; b=cTMoqdcFDIpamChtz1XTnOr94rvFDm4XNFbgW4WWGl+iSbM9h91P3rtM3mR3s5tblcOX7q3+WKY6W9n6I++nBkYoBeNcJgiadc0L+tfMX1Cosg6KnWPXavdaflJMhh0Kal/80xXNC1lwkN14BTBuDnSI4G7WvcOYnNo3qtFZSVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728824138; c=relaxed/simple;
	bh=PGHjAbYs47V3IL/rq2kwUEzf4WBrICwxIJb375H0MdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s2KK3QdxoMn45M6UVn1f1TCwvLezDHF+sQjXTV+YrW0WUmqomJS99TLwO5VoUy4XwiT97EIRS+xFWIocH3AZYb1Z9Aqup1G+a0LtTBteY5jcY6zUZjCrrDGA8e1iWq16c0ebkDb9bvuiuv4RN3kEieBMK/nNPYPE68c2uDtr8FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HTiXXIJz; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HTiXXIJz"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43115887867so22440175e9.0
        for <linux-staging@lists.linux.dev>; Sun, 13 Oct 2024 05:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728824135; x=1729428935; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YWMT5lNGu1xTshtgdsecoS6+Z5F56R0HKb2/GtovXRw=;
        b=HTiXXIJzFD7Ve45Wj5il6GFuLRsJZyZ0E/7AL89NJI0EiyWcybjq6yImsSoxlKBqIH
         Ptw2w/WRDdWHv2FXkAf1Td+aB4MHqsovnhtdQuqh3ziM68bbUoxu1MIlTZXTDCGhEFiG
         6gzWjos4zaUVwkh2SVL/k2BmbBkKuRttpaqQa8AQcSFL/x3mlff270ylvwhPneVoDqBk
         8Cggk11gwSWpfLatHOMm3jFaUbZ0RpHM7167KaXoe4IJHjcum4TAJ59eCKNr3iNAP2yo
         69IcRubN2Y4+9VYj/tJ6ZblTmx2mliCerdSKBzRY2J0PNdkiKCCWlHCPJ3dTR4f0C5JM
         V1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728824135; x=1729428935;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YWMT5lNGu1xTshtgdsecoS6+Z5F56R0HKb2/GtovXRw=;
        b=NfRcfkgEyeX0jPxaWPKgqYALenO8Ynj7cfizGQbsK+hdPjjSU1ayXDp9p75VTlaolo
         oSnir55xeRW3RLJ44yy7idcHSIAUT5QMo6dzL1dloFDBUaUqUcgBqZGt+i0O7s8ppdyE
         k2bi5OzP74NK8kyEG8kHqCjwV0kfBXYiTjGHX52qB6j/FYHq9UbEDlL+RRpwKjeWmMRy
         5KP5Gq7FsB2s9sB1X5WJgBHASfzX+D+fPPQ36cS6NceAcOHvyemppV3d3TJcMZnx4TIA
         32skxLU9Hv95axyMWJcKUHveFZs8XwY7RcLsrqbb67s0qoEZC8Mn4OXhARZ1VF1nJQQ5
         KkVw==
X-Forwarded-Encrypted: i=1; AJvYcCWUlBlXNTnqu+uIdx7OemNqrou/nP4+zK03aeJfURjESR6yNrrvOu2iXQF8R+4mbaHWRDXq4uub0g7r+mCD@lists.linux.dev
X-Gm-Message-State: AOJu0YzYuMNjBhrdHAy634BBOLclZwhlcA0JGQEGw3o6fGuvzdltATz9
	/fQYb1I1GsRCsLYZj/V3QU86sleuikQJ2+FxokfT+L8KQ0+crs76
X-Google-Smtp-Source: AGHT+IGx9lvPuk/IEYQT+CiW4c6HxwiL9K8/Y3t0ehXw4g7CKJ3aTbBceq7YmC9Lx1M/KpvT7OODvw==
X-Received: by 2002:a05:600c:b9a:b0:42f:84ec:3f9 with SMTP id 5b1f17b1804b1-4311d884328mr70492185e9.3.1728824134850;
        Sun, 13 Oct 2024 05:55:34 -0700 (PDT)
Received: from ?IPV6:2a02:8389:41cf:e200:a034:352b:6ceb:bf05? (2a02-8389-41cf-e200-a034-352b-6ceb-bf05.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:a034:352b:6ceb:bf05])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d4b6bd3e7sm8582567f8f.39.2024.10.13.05.55.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Oct 2024 05:55:33 -0700 (PDT)
Message-ID: <4c190f41-eac4-4dfa-8667-368f57b9f445@gmail.com>
Date: Sun, 13 Oct 2024 14:55:30 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: vchiq_arm: Fix missing refcount decrement in
 error path for fw_node
To: Umang Jain <umang.jain@ideasonboard.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stefan Wahren <wahrenst@gmx.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20241013-vchiq_arm-of_node_put-v1-1-f72b2a6e47d0@gmail.com>
 <e88e5faf-d88a-4ce9-948a-c976c2969cad@ideasonboard.com>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <e88e5faf-d88a-4ce9-948a-c976c2969cad@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13/10/2024 13:36, Umang Jain wrote:
> Hi Javier,
> 
> Thank you for the patch.
> 
> On 13/10/24 4:12 pm, Javier Carrasco wrote:
>> An error path was introduced without including the required call to
>> of_node_put() to decrement the node's refcount and avoid leaking memory.
>> If the call to kzalloc() for 'mgmt' fails, the probe returns without
>> decrementing the refcount.
>>
>> Use the automatic cleanup facility to fix the bug and protect the code
>> against new error paths where the call to of_node_put() might be missing
>> again.
>>
>> Cc: stable@vger.kernel.org
>> Fixes: 1c9e16b73166 ("staging: vc04_services: vchiq_arm: Split driver
>> static and runtime data")
>> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>> ---
>>   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 6 +
>> +----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/
>> vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/
>> vchiq_arm.c
>> index 27ceaac8f6cc..792cf3a807e1 100644
>> --- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> +++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
>> @@ -1332,7 +1332,8 @@ MODULE_DEVICE_TABLE(of, vchiq_of_match);
>>     static int vchiq_probe(struct platform_device *pdev)
>>   {
>> -    struct device_node *fw_node;
>> +    struct device_node *fw_node __free(device_node) =
>> +        of_find_compatible_node(NULL, NULL, "raspberrypi,bcm2835-
>> firmware");
> 
> How about :
> 
> +    struct device_node *fw_node __free(device_node) = NULL;
> 
>>       const struct vchiq_platform_info *info;
>>       struct vchiq_drv_mgmt *mgmt;
>>       int ret;
>> @@ -1341,8 +1342,6 @@ static int vchiq_probe(struct platform_device
>> *pdev)
>>       if (!info)
>>           return -EINVAL;
>>   -    fw_node = of_find_compatible_node(NULL, NULL,
>> -                      "raspberrypi,bcm2835-firmware");
> 
> And undo this (i.e. keep the of_find_compatible_node() call here
> 
> This helps with readability as there is a NULL check just after this.
>>       if (!fw_node) {
>>           dev_err(&pdev->dev, "Missing firmware node\n");
>>           return -ENOENT;
>> @@ -1353,7 +1352,6 @@ static int vchiq_probe(struct platform_device
>> *pdev)
>>           return -ENOMEM;
>>         mgmt->fw = devm_rpi_firmware_get(&pdev->dev, fw_node);
>> -    of_node_put(fw_node);
> 
> And this change remains the same.
>>       if (!mgmt->fw)
>>           return -EPROBE_DEFER;
>>  
>> ---
>> base-commit: d61a00525464bfc5fe92c6ad713350988e492b88
>> change-id: 20241013-vchiq_arm-of_node_put-60a5eaaafd70
>>
>> Best regards,
> 


Hi Umang,

Sure, I am fine with that too.

Depending on the maintainer, the preferred approach varies: a single
initialization at the top whenever possible, a declaration right before
its first usage (not my favorite), or a NULL initialization first. I
will send a v2 with the latter i.e. what you suggested, as it keeps
everything more similar to what it used to be.

Thanks and best regards,
Javier Carrasco
