Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241F1337BBF
	for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 13:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761141177; cv=none; b=XKhP0CRre5UxbFhvw9FClO/rxUvTymncZXx2jEx9G8T3AQQvmH+33/64Vnu2GqiidRQc5qH4NRIQqMwTK6P+mnPLd43HuXWJ9zLPD2TDJHC1tYlTQrjpm4emuO5L8gvgVPylCEEHwvBAs38o4dX9DYWGCVPKNKPtGKc+//1Kao4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761141177; c=relaxed/simple;
	bh=didw2C0i4D+/X+keN3poTuKMTf3BqhJ8jS8paF75P1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nDdZdq1r7Arnz5qzmFaBifBoH2OOst2g2VJLLJX7VXoovIS6cEQRZ0tEje2XDk8QjzEsm+Pr0P5BSI1poznEJj8gulEoCXGXZ0tUjtH3ySGv/dxn6HRAZK7aZHHpzWfDkEKi9auPdyT+hWCXZS3XSc78Rx2KWc0MsX1z4bnrf38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=QsjaocFp; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="QsjaocFp"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b6ceb3b68eeso295883a12.2
        for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 06:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1761141175; x=1761745975; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ItoLblamzHGO8Wh2ySn/6TGEpijj7f+Z1zigzIOj8RA=;
        b=QsjaocFpgxoU1QwE9GXtv64g0WP4bVYicT3As0sm+RKOGtNxDXBTJ8T6xwXajuKmkk
         oLSRkJP/fBYZOp151FQuXMJrfOn2KgTW3l3JOuTWeRTT4fZXJ5W/e1QORednwgWv9dJL
         q7v9mAD+Imr3oxu2jeA9azndrCg1BkO54d3yMWQRSFNtdqyl/XRvz25X/U3QzcaMT0FH
         G9Gj6o7+cKALr1UlAwEMsfJyNyc+5YwrUVXDG1+fehd3o6iiDMhy8O962e5KR3L40KCC
         8UKv79t+l6yCkhSdVWtZHGt8LlOUtXmfCMa+iSkNyoVXwHJD/p6Sr/xvQEPzPoKkf7tq
         0Gyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761141175; x=1761745975;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ItoLblamzHGO8Wh2ySn/6TGEpijj7f+Z1zigzIOj8RA=;
        b=Y4a1IblVfKFCzSpKXxVrhNqyTDdOEhKOv+dGRhXm2sKS8S7CdmOl7SyW2T6CpSPoyq
         Pb9Hp4u8lRTos6Yo8QQ91hsTCjaAHJoRcbRT+9YYsqNmQsT4akQ1soZhYA1+O/RNCg7L
         oPtnWdQS6ZXGnIgbW67tVP8YaYjSH112UQtssZyTfVGW5lIKxtrLPOQ9pEv0swEiN5LG
         Rv6IhO5o77/YpNDPsPgAH1eomA1/tkv3cP5pmXcoCv9v4O/zY65x4yYmmZW4puDmSo5H
         2oMaYjUbNbLWSuJ1C+2U6gQEfq4+W6G1yq7MqtsdsCIVHa7iPtQUbzm8Z3sNYYGbM9gP
         qc0Q==
X-Forwarded-Encrypted: i=1; AJvYcCU39qoKI0I147ZTzUJPckq1aMl3+hxSqyQqy9VlaoeQwJIa6FTtMiAJQcudP7vuLrD/FeV0YPtlXfjMJjMF@lists.linux.dev
X-Gm-Message-State: AOJu0YyAQhSXLuFFZzSir1h900UQDDmaSHD6iGocCrStKbG2l51iL4Rj
	rq4kKatgxO0R4UF+gpvlgGRDWMpCITFu4oNcORAG8NlxDDHij5Io1KH88zsY8ATSGg==
X-Gm-Gg: ASbGncvQYdSWAzXIFaXcP3MP3FABtB3PL/znu3dKH83Z66v5wtDm2Xk6D0TyPhmU9nh
	nUS03QCRhLvx31Wn3AkDSBUEXPtr2ZdD6ODtJIop/p3qPTKHkxcrHUIbDc/vl/AsZ9bjBf0euhp
	ux6uE710cndzuuJaJtfv3MJJ0VlIjw0w35xpKADRUEO79l55vKWChYzo8fRnr+flVg35DOt+Z/7
	iKHSLOak5jIxFd1DwpjouDDsxUcV3zKnJEHzwLvVsePZG/lhjpYEDDxFSuGn8l8BQFbtstNhg1W
	A1nNMsq7wW+4cqw0XwLVn2NDkvKnYc9aORZXhMMkgoqX/+zQR5h+KKpCh0J14WjH+TjTK9eLQJw
	kO57Bib3wfbULSXKjmo9w93F2g2+m0v1sHD9Bmi8i/a+dMuZtGpaJ96jb4N/HpWtTqGqqoIQpqh
	C88iTiXMhD0g4tDf6DY36l7FypCYcClBOoo9yqBAc8F6reLFSakeReUA==
X-Google-Smtp-Source: AGHT+IFs8f7daddBbX3MWM4RijpQrrse5HPBjhyGAGAc3cq0Hh67EUVgKXPiD8oGEtuTNQ13V8j9ew==
X-Received: by 2002:a17:902:c946:b0:235:ed02:288b with SMTP id d9443c01a7336-290cba4efa6mr300025905ad.30.1761141175150;
        Wed, 22 Oct 2025 06:52:55 -0700 (PDT)
Received: from ?IPV6:2401:4900:8898:a21f:edff:5244:379d:6d28? ([2401:4900:8898:a21f:edff:5244:379d:6d28])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2924700a883sm139861225ad.49.2025.10.22.06.52.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 06:52:54 -0700 (PDT)
Message-ID: <81d8d424-ad21-490a-b071-e1b3b3564e2c@beagleboard.org>
Date: Wed, 22 Oct 2025 19:22:49 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: fw-download: Fix find firmware req
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Jason Kridner <jkridner@beagleboard.org>,
 Deepak Khatri <lorforlinux@beagleboard.org>,
 Robert Nelson <robertcnelson@beagleboard.org>, Dhruva Gole <d-gole@ti.com>,
 Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20251022-gb-fw-v1-1-183b18500cd5@beagleboard.org>
 <aPjIJw3ahPxnDE5Q@stanley.mountain>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <aPjIJw3ahPxnDE5Q@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/22/25 5:33 PM, Dan Carpenter wrote:
> On Wed, Oct 22, 2025 at 12:57:57PM +0530, Ayush Singh wrote:
>> diff --git a/drivers/staging/greybus/fw-download.c b/drivers/staging/greybus/fw-download.c
>> index 9a09bd3af79ba0dcf7efa683f4e86246bcd473a5..06f1be8f3121e29551ea8416d5ee2666339b2fe3 100644
>> --- a/drivers/staging/greybus/fw-download.c
>> +++ b/drivers/staging/greybus/fw-download.c
>> @@ -159,7 +159,7 @@ static int exceeds_release_timeout(struct fw_request *fw_req)
>>   
>>   /* This returns path of the firmware blob on the disk */
>>   static struct fw_request *find_firmware(struct fw_download *fw_download,
>> -					const char *tag)
>> +					const char *tag, const char *format)
>>   {
>>   	struct gb_interface *intf = fw_download->connection->bundle->intf;
>>   	struct fw_request *fw_req;
>> @@ -178,10 +178,17 @@ static struct fw_request *find_firmware(struct fw_download *fw_download,
>>   	}
>>   	fw_req->firmware_id = ret;
>>   
>> -	snprintf(fw_req->name, sizeof(fw_req->name),
>> -		 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_%s.tftf",
>> -		 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
>> -		 intf->vendor_id, intf->product_id, tag);
>> +	if (strnlen(format, GB_FIRMWARE_FORMAT_MAX_SIZE) == 0) {
> Change this to:
>
> 	if (format[0] == '\0') {
>
> In the caller, the assumption that format is at least
> GB_FIRMWARE_FORMAT_MAX_SIZE makes sense but in this function it
> doesn't make sense.

Ok, will do in the next version.

>> +		snprintf(fw_req->name, sizeof(fw_req->name),
>> +			 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_%s",
>> +			 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
>> +			 intf->vendor_id, intf->product_id, tag);
>> +	} else {
>> +		snprintf(fw_req->name, sizeof(fw_req->name),
>> +			 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_%s.%s",
>> +			 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
>> +			 intf->vendor_id, intf->product_id, tag, format);
>> +	}
>>   
>>   	dev_info(fw_download->parent, "Requested firmware package '%s'\n",
>>   		 fw_req->name);
>> @@ -225,7 +232,7 @@ static int fw_download_find_firmware(struct gb_operation *op)
>>   	struct gb_fw_download_find_firmware_request *request;
>>   	struct gb_fw_download_find_firmware_response *response;
>>   	struct fw_request *fw_req;
>> -	const char *tag;
>> +	const char *tag, *format;
>>   
>>   	if (op->request->payload_size != sizeof(*request)) {
>>   		dev_err(fw_download->parent,
> We have changed the sizeof(*request) but we haven't changed
> ->payload_size so how can this ever be true?  Did you test this change?


The request originates in greybus node. The payload size here is 
calculate from the greybus message header. It is not a hard coded value. 
So as long as the node sets it correctly, it will work fine.

I am using the zephyr greybus firmware for my testing [2] using a 
BeaglePlay [3] and BeagleConnect Freedom [4].


[2]: https://github.com/Ayush1325/greybus-for-zephyr/pull/46

[3]: https://www.beagleboard.org/boards/beagleplay

[4]: https://www.beagleboard.org/boards/beagleconnect-freedom


>
> regards,
> dan carpenter
>
