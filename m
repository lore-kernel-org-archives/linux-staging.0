Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4FD34E74A
	for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 14:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761143203; cv=none; b=PB4yn2hs5JCS4q4JOIMXDLow9Q2e5yGPrK+Qg4p7kr6ILmGGV3D1t+YBhgnMt4poxgAE9tY92xJI1iH8KugdvpdJJGagUladJLgrjhje3vm+J05+wuIo9CxXMjku0LwwHqTbTkqPfTJUncGQtH0duJah5p7o5FCuK9dqEASzQSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761143203; c=relaxed/simple;
	bh=0yDEVFPlpDrDY4lSgYlw+L+esP2rwCt9Zxk6fxftYBc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NgUlcm0Lv7S81uv/Rh2o8WqKrqJqbMfX0JSux4smpwyvTBpnCImT/6X4OJvTyWzvShsyIvdr+PcxL5OxkeKTFztfLyNxHX76k/qv/wwC97jl0RDJc9Nhiw1ptWLwU0jof9t0lfkxMbT/TuUOGJinzdIu1ejASoAAiH0UFP/EKjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=3Z8daWoU; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="3Z8daWoU"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-33e27cda4d7so863162a91.0
        for <linux-staging@lists.linux.dev>; Wed, 22 Oct 2025 07:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1761143201; x=1761748001; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0HRFxOWUnlei3NJ6xug5QBfMRbuNH1+R/j9zw+bSO+A=;
        b=3Z8daWoUX+w0/DBIbC/DT+f39nJlm4kD6XGJ/myOCStvLoIz0zUdKaSH2Xuzl15nX8
         1Zn03Sb1HJiu8ZNjk3xKk11ol8B/sYVqBB+6WuVUE51bfeao2AnMgGjfTp7g7wrmALxe
         yqzSJdS/0f0RnTQcKBg/d2eQKwIkVxXKpp2E3i/ONhMlKZQKXl4VtzMzjthF68YEwurB
         AvKtn13XSO9MhLVG4ZkmQaZdGWj8pt6ksv5Yz8jZR9Wa1S3r21DCN76vGZ7LVrnkwmtE
         vr7Rt0PzhVcRCdU+L9Q+LX5U7L+ld18WSLF+zHj2mQz3RVNOEf57ibrJraXRKD8NrIWN
         gcjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761143201; x=1761748001;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0HRFxOWUnlei3NJ6xug5QBfMRbuNH1+R/j9zw+bSO+A=;
        b=kO1TvwEJqkAPU2CSAB1LSwDQ5dbvydwwwaZFIxZ2l8bXm+hD3jK/C+S8RzfuDo1Gvm
         5OV5kVH7AXJ0ZOgBegOGjWmkI14mVaA5W4dPcUN3xQ/Mft65uGQ2K/yuUpIl/DZXW6jJ
         SgwvkFpHQHcaik/xk0zQAxOE0+oxMJIbUTSuVwUYyiIV2ZosyqNZunKZ07R0uPbyvJc0
         SPktBtX1LyK8JOnmF/1Q6jQ55YlysQMzxosA8TZ3hfeKI3BnadRYu7zvBys+5j9z//o9
         0yXEXEW1XR4gJgRWS7ZxQ11vxR23uQ08nJbqUuVH+cOfXsHzVhQrC6ihtIz6yDRzhh6d
         O+DQ==
X-Forwarded-Encrypted: i=1; AJvYcCVlJH2pCYf3OGS9NBpDtn47MkAF5Wl/F3ozRa4vhSIFx9j7Q9IL8+ZHN+Xti881E4r2dEd6xiyJrXJfbHnT@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2TkkmBTMpwxBgCqeZu3tIeye9updJvQG7ZH3Ys0gNajrUEb6e
	BcbAMptrqJLmf6CE2zMJqVbDfaEdlUceOtjGF5mEIPuIGRkEOlHyU/gD1qz1I+9VcA==
X-Gm-Gg: ASbGnctprmeL80QDh0l0lwlPLt0xuw0FLJEw8Iyh3UcYG5dDTfJ228NM7ZfZBiHEK+w
	1BXUg3sLnVKIf7iXw6tpd+yyEgqYMCl78VEguHcf7LGwFngtblIpETGBat6Wu75XsnAwFKG3s6S
	QHTt3nXAE0vDkIuHffQAUX7XzBtSS8yWaWsGk3NS7gaIF/cp30zyo0bQfkkPvssXeGxD9QXsFaH
	X/e6JnY2IZILJiQrGndo6+OS0gq4NSc+baNQQyczAgQmbZ/w12tqo/lIUukWmVGU5XYZMT0LQcw
	U0r0f5ij6LoEaO+4Ea2SBwVRVb+Ut9gfA0Yfz6oBrB/0AwONmas3gU9cTCWsZIF+w/MwywEkDB7
	2CbdGqGCrAHqqPKIorpNoolE//KmNMJCIZwPyDY3GamAgFbO6+oyuQ2uQ9w/vWiCJqCm7e+XNhB
	nYE+U+vueZDm9DPdrC6IQad2zCkA3KbaGcG93Xy0yAXs/zIZpnKnLbqQ==
X-Google-Smtp-Source: AGHT+IFkuD3hlsYA6IEyDaofmb8SoGz5+EWzDF7yLSMdSUeC0iJHJl4cWk4F6gODzG9q9yM9CWSZRg==
X-Received: by 2002:a17:90b:3812:b0:32e:15e9:2cbc with SMTP id 98e67ed59e1d1-33e905eec80mr2139523a91.5.1761143201070;
        Wed, 22 Oct 2025 07:26:41 -0700 (PDT)
Received: from ?IPV6:2401:4900:8898:a21f:edff:5244:379d:6d28? ([2401:4900:8898:a21f:edff:5244:379d:6d28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223c7e19sm2746875a91.3.2025.10.22.07.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 07:26:40 -0700 (PDT)
Message-ID: <4d87a2ef-4cc1-4774-8716-e4a3f7f346cb@beagleboard.org>
Date: Wed, 22 Oct 2025 19:56:35 +0530
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
 <81d8d424-ad21-490a-b071-e1b3b3564e2c@beagleboard.org>
 <aPjl7G7fmvqtgww1@stanley.mountain>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <aPjl7G7fmvqtgww1@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/25 7:40 PM, Dan Carpenter wrote:

> On Wed, Oct 22, 2025 at 07:22:49PM +0530, Ayush Singh wrote:
>> On 10/22/25 5:33 PM, Dan Carpenter wrote:
>>> On Wed, Oct 22, 2025 at 12:57:57PM +0530, Ayush Singh wrote:
>>>> diff --git a/drivers/staging/greybus/fw-download.c b/drivers/staging/greybus/fw-download.c
>>>> index 9a09bd3af79ba0dcf7efa683f4e86246bcd473a5..06f1be8f3121e29551ea8416d5ee2666339b2fe3 100644
>>>> --- a/drivers/staging/greybus/fw-download.c
>>>> +++ b/drivers/staging/greybus/fw-download.c
>>>> @@ -159,7 +159,7 @@ static int exceeds_release_timeout(struct fw_request *fw_req)
>>>>    /* This returns path of the firmware blob on the disk */
>>>>    static struct fw_request *find_firmware(struct fw_download *fw_download,
>>>> -					const char *tag)
>>>> +					const char *tag, const char *format)
>>>>    {
>>>>    	struct gb_interface *intf = fw_download->connection->bundle->intf;
>>>>    	struct fw_request *fw_req;
>>>> @@ -178,10 +178,17 @@ static struct fw_request *find_firmware(struct fw_download *fw_download,
>>>>    	}
>>>>    	fw_req->firmware_id = ret;
>>>> -	snprintf(fw_req->name, sizeof(fw_req->name),
>>>> -		 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_%s.tftf",
>>>> -		 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
>>>> -		 intf->vendor_id, intf->product_id, tag);
>>>> +	if (strnlen(format, GB_FIRMWARE_FORMAT_MAX_SIZE) == 0) {
>>> Change this to:
>>>
>>> 	if (format[0] == '\0') {
>>>
>>> In the caller, the assumption that format is at least
>>> GB_FIRMWARE_FORMAT_MAX_SIZE makes sense but in this function it
>>> doesn't make sense.
>> Ok, will do in the next version.
>>
>>>> +		snprintf(fw_req->name, sizeof(fw_req->name),
>>>> +			 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_%s",
>>>> +			 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
>>>> +			 intf->vendor_id, intf->product_id, tag);
>>>> +	} else {
>>>> +		snprintf(fw_req->name, sizeof(fw_req->name),
>>>> +			 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_%s.%s",
>>>> +			 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
>>>> +			 intf->vendor_id, intf->product_id, tag, format);
>>>> +	}
>>>>    	dev_info(fw_download->parent, "Requested firmware package '%s'\n",
>>>>    		 fw_req->name);
>>>> @@ -225,7 +232,7 @@ static int fw_download_find_firmware(struct gb_operation *op)
>>>>    	struct gb_fw_download_find_firmware_request *request;
>>>>    	struct gb_fw_download_find_firmware_response *response;
>>>>    	struct fw_request *fw_req;
>>>> -	const char *tag;
>>>> +	const char *tag, *format;
>>>>    	if (op->request->payload_size != sizeof(*request)) {
>>>>    		dev_err(fw_download->parent,
>>> We have changed the sizeof(*request) but we haven't changed
>>> ->payload_size so how can this ever be true?  Did you test this change?
>>
>> The request originates in greybus node. The payload size here is calculate
>> from the greybus message header. It is not a hard coded value. So as long as
>> the node sets it correctly, it will work fine.
> I guess, how was this working for other people then?  It seems like a
> behavior change.


Well, it is technically a breaking change, if any device was already 
using fw download protocol. With that said, I have no idea who is using 
greybus right now. And since the changes are in staging drivers, it 
probably is fine.

I don't really know if the spec came first or linux implementation. But 
one of them is currently incorrect.

Just to clarify, greybus-for-zephyr is not the original or source of 
truth implementation of greybus. I just found the inconsistency between 
what the spec says, and what Linux kernel implements and thought that 
spec should probably have higher priority.


Best Regards,

Ayush Singh

