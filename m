Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F8C1A267
	for <linux-staging@lists.linux.dev>; Fri, 24 Oct 2025 16:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761323709; cv=none; b=ssZY4Gct9VL/ixiy+ZX1NT5nDdjWK1ZrwmEvK6BGJRzy74Jmg7ErSnLRhO16dawr9X43lzTwdrUESUws5gCsYpvOfaEgSPFHTYTcNUnZDTRlebgjoZZKjYYO1g4WzdkjgKT0inEVBMRp6/XyEQdGJqTICrzKYDusE//hbq4gFTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761323709; c=relaxed/simple;
	bh=DhRCwdNvbg0ECgLE/33ymnPVqstW/0n2wxszIpo5AFY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cOurcA/M1kDBI4IlnXTzkgElESqy3tLHiFqnIiLmSzwwgkvgsvQgWbMBBbD9lYwqmQpraPCa4XiJdvdN8hH8Pu8/dpicqQWGRxbheHOije1MZXYIj3pzF/ebbCQSaduPzUeeMejfFm7jvjXgo2W8jCAx3GKzyxIRvowyV4rrXWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=PHnUEOQU; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="PHnUEOQU"
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-93f11fdd538so92043739f.3
        for <linux-staging@lists.linux.dev>; Fri, 24 Oct 2025 09:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1761323706; x=1761928506; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SieTk0lLthZD8VLdIVorzKDMIA01AjtccQtQenc4l58=;
        b=PHnUEOQU5USa3Qsq4UctmBA7vQYTOyEP11KQpD1wvNB1JKjeQMBIeXGTpip+MhQdmy
         CjVnJRpBQzt5JP80Yyhhkw7Aw2DHUa347liHvrsxXGh5P93El4UkA21QQZ6xlTOdZV9h
         6UEigIPccPwZuJMNw2LUSq0mmCzgkc5RBeyPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761323706; x=1761928506;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SieTk0lLthZD8VLdIVorzKDMIA01AjtccQtQenc4l58=;
        b=wM1+uFWQdp3cz7cQnSnE6ClgLy/3a57ZwdMVJZtDuA03Infp4vrvfeaahSMHF4Azvc
         JGaxDwj9sxKTJyS8gKxurRPnAMgCNnYPsbHqITzS6vYcA/ufqBKn/8rNhzKgo8rKH/L0
         EMZ+wlN6Qa9qT3RCnaKivpld99idU/wUf4ol/UpZ1gNuGXzaTkFwFAxHlyN05Hc2fZE4
         HHqngojot3f3W4o1uJFV2T81Ko3pT6nXE7WwDYz2KadnSPst3/pXtGyQSN0I7f6WhIqa
         V8KmapNbPQaeIvwY8Ec768QWVhR6ny7bo/MFGLdFjqsrcAQhelUd0Q5Tu5Y1ui0lsTpQ
         UTMw==
X-Forwarded-Encrypted: i=1; AJvYcCV4oKmNXAf3OZ7gJB54dmCr8hZ76iL9udmXD/y6tetfKUZNMHkP7PUnRsj0EOMa7+baqfeMDLSgxhQwPoKR@lists.linux.dev
X-Gm-Message-State: AOJu0YwcyVUs/DhGDEIXO6hoVYDvArFSNnfL6tbNSrfWiEk/gDkWPHGQ
	VKBzoJ66BtXsj56KhDO2OF0/ytOGayxmm2+1UNHpOJZMjlqFvjWzez/8447VZBpkJg==
X-Gm-Gg: ASbGncv0uDUjXsFxSHDFCY9INfmMSr1ueRFwyjxog7CqcChxcH997FPLOsk8ketxhyp
	drIbobZyM1DILfWxxSG1hMu08V61Hfr579P2o5ZJrF8H0CcKzoJFF9qvOuK/RWytH+7izrAF1vG
	eKgzp8NYslw2M6UkYqqaEFG1qNgiPqb2kumonDtqBuV5gr/wSrM65OgxamIP5dhwozswZo+63FG
	t62g1KbTiy8wqQ+jKd2m6tF/a1E5/ai/7hRnf5pBvliliYjzJy7SUlSx9WN60X3kedNEX8XSv40
	O77KCZruJSB2uMbfa5eJtHRXneHmRv3Pb72p52beIwOxfhQ6e5qRco0bVEitTmZodvRfRwtjPj0
	j+nXHqcGuOpNwT1XU5kiYPXDOfnzQxL+QvXdQViAWd8ZeqbXIWfsNqacrWaB3cEpQa8oUXw7Jm2
	/siGL+I0VMCySrE6ZGZDlF907cJKQGTE2m91BzPJH7Df69
X-Google-Smtp-Source: AGHT+IEvr3zqSq0pk7SM0eNShfV9IIE6MlKKtdecM5+l1t2PsCDk7vWtM+Qndsxoy2QDzXkhz1qfvw==
X-Received: by 2002:a05:6e02:190f:b0:42d:8525:ac81 with SMTP id e9e14a558f8ab-431ebea7c09mr34018895ab.17.1761323705541;
        Fri, 24 Oct 2025 09:35:05 -0700 (PDT)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-5abb4e4badasm2271394173.1.2025.10.24.09.35.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 09:35:04 -0700 (PDT)
Message-ID: <12849abe-f4e3-46ea-82c9-ebbaa51e545b@ieee.org>
Date: Fri, 24 Oct 2025 11:35:02 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: fw-download: Fix find firmware req
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ayush Singh <ayush@beagleboard.org>
Cc: Jason Kridner <jkridner@beagleboard.org>,
 Deepak Khatri <lorforlinux@beagleboard.org>,
 Robert Nelson <robertcnelson@beagleboard.org>, Dhruva Gole <d-gole@ti.com>,
 Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20251022-gb-fw-v1-1-183b18500cd5@beagleboard.org>
 <2025102332-result-palace-789f@gregkh>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <2025102332-result-palace-789f@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/25 5:04 AM, Greg Kroah-Hartman wrote:
> On Wed, Oct 22, 2025 at 12:57:57PM +0530, Ayush Singh wrote:
>> According to the Greybus Spec published here [0], the Greybus firmware
>> download find firmware request should have both tag and format as
>> request arguments. However, currently, the linux kernel seems to have
>> defined this request incorrectly since format is missing.
> 
> Odd, I don't remember that at all, but it was changed here:
> 	https://github.com/projectara/greybus-spec/commit/773b9e0d6cc84a3c7a9f79ea353a552bd66d9de3
> 
> maybe we never actually implemented it?

To be fair, it was the very last commit to the spec before the
program was canceled.  So it would not surprise me too much
if the kernel commit didn't get made.

					-Alex

> 
>>
>> The patch adds format to request and am using it as the file extension of
>> the firmware.
>>
>> [0]: https://github.com/projectara/greybus-spec/blob/ac47bc32dce1256489a82ff1f463fb979e9684ee/source/device_class/firmware.rst?plain=1#L152
>>
>> Signed-off-by: Ayush Singh <ayush@beagleboard.org>
>> ---
>> According to the Greybus Spec published here [0], the Greybus firmware
>> download find firmware request should have both tag and format as
>> request arguments. However, currently, the linux kernel seems to have
>> defined this request incorrectly since format is missing.
>>
>> The patch adds format to request and am using it as the file extension of
>> the firmware.
>>
>> I came across the bug while working on greybus-for-zephyr [1], to get it
>> ready for upstreaming as zephyr module.
>>
>> Open Questions
>> ***************
>>
>> 1. Handle empty format
>>
>> Not sure what to do in case format is just NULL. Should the request
>> fail? There is no reason to not support firmware without extension. So
>> personally, I don't think it should be treated as error.
>>
>> [0]: https://github.com/projectara/greybus-spec/blob/ac47bc32dce1256489a82ff1f463fb979e9684ee/source/device_class/firmware.rst?plain=1#L152
>> [1]: https://github.com/Ayush1325/greybus-for-zephyr
> 
> As this is a AP-specific thing, it's whatever you want to do I think.
> You can handle NULL there, or anything else, it's up to the firmware and
> userspace to coordinate this, right?
> 
>> ---
>>   drivers/staging/greybus/fw-download.c     | 31 ++++++++++++++++++++++++-------
>>   include/linux/greybus/greybus_protocols.h |  2 ++
>>   2 files changed, 26 insertions(+), 7 deletions(-)
>>
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
>> @@ -245,7 +252,17 @@ static int fw_download_find_firmware(struct gb_operation *op)
>>   		return -EINVAL;
>>   	}
>>   
>> -	fw_req = find_firmware(fw_download, tag);
>> +	format = (const char *)request->format;
>> +
>> +	/* firmware_format must be null-terminated */
>> +	if (strnlen(format, GB_FIRMWARE_FORMAT_MAX_SIZE) ==
>> +	    GB_FIRMWARE_FORMAT_MAX_SIZE) {
>> +		dev_err(fw_download->parent,
>> +			"firmware-format is not null-terminated\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	fw_req = find_firmware(fw_download, tag, format);
>>   	if (IS_ERR(fw_req))
>>   		return PTR_ERR(fw_req);
>>   
>> diff --git a/include/linux/greybus/greybus_protocols.h b/include/linux/greybus/greybus_protocols.h
>> index 820134b0105c2caf8cea3ff0985c92d48d3a2d4c..48d91154847dbc7d3c01081eadc69f96dbe41a9f 100644
>> --- a/include/linux/greybus/greybus_protocols.h
>> +++ b/include/linux/greybus/greybus_protocols.h
>> @@ -214,10 +214,12 @@ struct gb_apb_request_cport_flags {
>>   #define GB_FW_DOWNLOAD_TYPE_RELEASE_FIRMWARE	0x03
>>   
>>   #define GB_FIRMWARE_TAG_MAX_SIZE		10
>> +#define GB_FIRMWARE_FORMAT_MAX_SIZE		10
>>   
>>   /* firmware download find firmware request/response */
>>   struct gb_fw_download_find_firmware_request {
>>   	__u8			firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE];
>> +	__u8			format[GB_FIRMWARE_FORMAT_MAX_SIZE];
> 
> Build issues asside (see the 0-day bot report), I am loath to change a
> user api like this at the moment, without some sort of guarantee that
> this isn't going to break anything.
> 
> But, these days, I think your implementation might be one of the few
> "real" greybus users that is still alive.  The old phones that used the
> protocol are no longer being sold from what I can tell, and the "greybus
> over IP" stuff didn't actually get used anywhere outside of cool demos
> that I know of.
> 
> So we might be ok?  Or, can you live without any such "format" need?
> Have you handled downloading firmware already without this?
> 
> thanks,
> 
> greg k-h

