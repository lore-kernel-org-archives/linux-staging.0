Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B64730C375
	for <linux-staging@lists.linux.dev>; Thu, 23 Oct 2025 11:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761218812; cv=none; b=G8+lLUOPtQIF3C+xXh9elPH5FFEaAEYkCpUJoMKDE6cxggddos9fGQ3FiPIWRkdtnCsMgAuWPOk527teqX6L6HwwuoN9hQfSZjv1t+PbTVSU1L75EecnWgBkOU0JUdpXOVQcbJYWGRTk1DFP+Pt4iUHjbzGCU5M4icy0a1GK9dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761218812; c=relaxed/simple;
	bh=cBsPFp9W+Q9oKDbgi7i977uygBQhplB61mKGBpWy7Sg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Us3c7Co+sIB3y1ONjTfO17NrToioJ2jFXfKyuHZk3YHAZxIudRvp35ZRkxYhFnCn4XdCqF/w3Uvq2+r/d5XYaSUFHgnwmPcx3NSKZAclZmoCN9pYPYl+CnqpVNJX6Z8BZz1cO4qhA9RKO/pTHGGD2IT3utJAZATjHyAVvJ/+0SE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=d4GkGqSi; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="d4GkGqSi"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-290a3a4c7ecso7972635ad.0
        for <linux-staging@lists.linux.dev>; Thu, 23 Oct 2025 04:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1761218808; x=1761823608; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DBgNwyRHEUD9gkz7ICwjjnV74pCduntR89V9h8ouINg=;
        b=d4GkGqSi1fCZNfhnXm82g7p1EPwNlIkI+GBoWgp5367wio/cYBGZyDr00klN6M+dgm
         OcJZo+1HW4fjpxIP4DO+SPgIxbnv8G8kWz3VhbupBbJHvwr88zd08L7fWDPcwk3zpyxI
         8Sk4GG0mT2XBOoYTe2bfNcS/LHpgZ0sSeNCqpTWZ7EW8HOOA7tTLUEsjCaG/GyXIXy5N
         NqkwLS2B8K/dVDyLezbWgpGe8IseWnzT5eoKwIl+Z0+vTBt4bUQs5Jg4HKPHrZASZfbi
         iSshwcKUIV7SHxouzfzbGIIHmcVPSpuplSX2jVltUWLMgN22FjObXzn+thciiP2quSEN
         ZsGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761218808; x=1761823608;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DBgNwyRHEUD9gkz7ICwjjnV74pCduntR89V9h8ouINg=;
        b=PT/k5uqfNBi7VpUjEQo1fTsgst4rYExuyERqob5c0VKUGULumGxU74X4GHzsDWwOkz
         d0vZ/ogK52SE3WuQKs1jReaTcXEdyDmLlWLdJLtrF5w3DdBb94zyyECzX1Im5aSNKVGr
         PnmbrNGXM0DV9ayfm/68USfrDf/hKSBO74CVByVhAMwjESar4qLBE3dC3tr8j5PMi3I9
         t6yYdHj1zXCQMiB425rHwW0HIc69e4yAx6LLitUGxByY1YN/NrRby0svuD+9+G6nAFBd
         97EdEs90oHZy40bMxBPOXmfTgmkal5fHzSkes5jbyV9xpnbNwNiBH1OpG9CAJHsinzJF
         0EFA==
X-Forwarded-Encrypted: i=1; AJvYcCWZLkPy7aw4LvQCFuPsS2QBWk8JRc6Vmt/6aK/nJPJTZPioQ/wq6w1WmPJMta9tfq97Vo7bvPAHdKrNgUtH@lists.linux.dev
X-Gm-Message-State: AOJu0YwbaVnDe1tj528UNSoMmqYINdkU2rJa2IARhoqVVSzWzdgEs3Pe
	ktgBvZcRtbxQwxARF/46Rj+eMldO0yVein6xoTUJu2KCNdkpctR4ZVrcFrUr0+O/Kw==
X-Gm-Gg: ASbGncuTnf5JxNcVpLWY2Gr9r7LolaZdmQ3ALtNyxDFQGarQ+lbqOTbAO9/tqYW1Oak
	rFTjNb71ntqVvbyUlIxjMVuRCCgLcB4jhe7Rar8WimYuMqO3H3OLkkrOHOMOTT3FDLe5skz537n
	QhsKheorb8jYjdOoTYvrOa9OKSWAEf5+7MZuKfo3f3ZoxlunDavVP2u7vVFaLXmdG1COMKCjSSC
	byZi8tqmxP3mxgXCvGYXhJxIyWMR9BsbMR+Xw2TvgHlwi2ePlF1JYNh8VlrPoSxkUFRWUApePJo
	EFNCSr/rT8s9oNWi9QrLSlYqes/l8RPaWZLr0euhHRHzxZfdGKKUH8pZKk1jxK719YDwLSMRbSc
	JdYfNGFaIx++PQGOqjn1Gi9gL93nQkcYyXmI0s26WRC+lD5ZpZKPxFp4IiAvo14vjEdooHh77CA
	cBi5azIU9P79zZw4rfuhQFkPeJOJsUpwjVoWepio6XgrfdpbZp3w1+vpoLuImccfbB
X-Google-Smtp-Source: AGHT+IEvc72FMuwVpezje+GLZail9JTB8KzUaMZe6RS9mvWmmCXpm6ZrLLn6LaNyoG1hAmpSo1VvRg==
X-Received: by 2002:a17:903:2947:b0:290:bd91:d81a with SMTP id d9443c01a7336-290ca1219femr242415385ad.39.1761218807863;
        Thu, 23 Oct 2025 04:26:47 -0700 (PDT)
Received: from ?IPV6:2401:4900:8899:dde3:4f8a:da13:234c:6501? ([2401:4900:8899:dde3:4f8a:da13:234c:6501])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946e0f06d5sm20757475ad.82.2025.10.23.04.26.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 04:26:47 -0700 (PDT)
Message-ID: <209656e6-efca-4a73-a5fc-cddde9e04a9a@beagleboard.org>
Date: Thu, 23 Oct 2025 16:56:42 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: fw-download: Fix find firmware req
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jason Kridner <jkridner@beagleboard.org>,
 Deepak Khatri <lorforlinux@beagleboard.org>,
 Robert Nelson <robertcnelson@beagleboard.org>, Dhruva Gole <d-gole@ti.com>,
 Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20251022-gb-fw-v1-1-183b18500cd5@beagleboard.org>
 <2025102332-result-palace-789f@gregkh>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <2025102332-result-palace-789f@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/25 3:34 PM, Greg Kroah-Hartman wrote:

> On Wed, Oct 22, 2025 at 12:57:57PM +0530, Ayush Singh wrote:
>> According to the Greybus Spec published here [0], the Greybus firmware
>> download find firmware request should have both tag and format as
>> request arguments. However, currently, the linux kernel seems to have
>> defined this request incorrectly since format is missing.
> Odd, I don't remember that at all, but it was changed here:
> 	https://github.com/projectara/greybus-spec/commit/773b9e0d6cc84a3c7a9f79ea353a552bd66d9de3
>
> maybe we never actually implemented it?
>
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


Well, I don't really need the format. It's a bit odd that that file 
extension is currently hardcoded, but it's not like file extension needs 
to mean anything. Just found that things were different from spec, hence 
the patch. The fw-download and management implementation I have does not 
care about the extension anyway.

As for downloading firmware. I have an implementation. It can transfer 
30K of firmware. But then it runs out of networking packets. So I have 
not yet done a complete OTA. The implementation is technically there for 
the whole process, but can't promise it will work. I will look into 
where zephyr seems to be leaking the networking packets, but until that 
is fixed, it probably cannot do the complete firmware transfer (704K).

I am planning to make the greybus module an official zephyr module. And 
there are plans to use greybus for i2c based extension boards. 
Hopefully, it will bring more eyes and hands to work greybus.


I can make the patch not break old behavior as suggested by Dan. 
Alternatively, I am also fine without it. However, we should probably 
update the spec in that case.


Best Regards,

Ayush Singh

