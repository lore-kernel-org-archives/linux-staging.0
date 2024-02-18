Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FFC86EB46
	for <linux-staging@lists.linux.dev>; Sun, 18 Feb 2024 16:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708274918; cv=none; b=iw3R6x6N5yzgdHzfoFID6QvSwD74LNKTju1GHDW/LwMi87GY1NwZzVNwu3MpbIjsqpcJs5CzEnxmEtzaXXG6jsSfD0QQhzRmvtyiWeXJiU1P+il4GRlbZIfmenRQmCdxKd0wDkve0EwTnKAO8uGBI2m0xFYiX9aNqc1d5spGCes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708274918; c=relaxed/simple;
	bh=KpFfggUZ5hMwU47Zuz91oYFFmXWnyTnZeq8DfngWL8E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eDjTQXvrfslg/xQN+7+m/08zVHgghvOKPPjzgG58GOqLppb9tuPIRMqd8Q6WEdeUeulYIKkVRhPU7pwRnUMX5lBCAf/7GwRzfFvLiSxpYeNHVU7wbBk5ct4OmeHAQjexnjJhmDGjY7ZtqEjJ+6LEn4RSXE7/M/apODPkcfxvIjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=SEqFsmwX; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="SEqFsmwX"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-364f794f237so14941875ab.1
        for <linux-staging@lists.linux.dev>; Sun, 18 Feb 2024 08:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1708274915; x=1708879715; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=37nms9BmJJEsQJsbt0jcgUsWdlYRkTGGuwtAPDF2YJA=;
        b=SEqFsmwXDt4L+1JZEfHVgDStqxXk/UGX2yTcvFCTJqVGNfC3AHBifCM7TJXZTILR4W
         I29biWl5kOH0E69XYSZKLZJPq2TqP8g2gOce1Tkq8JCHzFowkHnbijdLfP7Tin9ZJ16H
         nqQpbsXMJHBSCPHCpW9h3+2e19gXIKxcFsgJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708274915; x=1708879715;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=37nms9BmJJEsQJsbt0jcgUsWdlYRkTGGuwtAPDF2YJA=;
        b=qVOPZOf09+4wsaQ+2bYaSS541m94eGkk2oiophh2JyzYZPyoCms98Sd3x7CJgdkpdp
         Sze10DxLFs61cZ++vA9yyt8haIRXjKv+EOgbzwlM3+LfxMa1nbOyc9W8nyWtBaXhOss/
         Dko1OjlAN4G7m/5m18oerkIW9RwniThpnuQu/k9dGGnGOns2gMZSxdbGyNSj04u13B1C
         1Omqr2xfA2CK0U51FN6aZLE8SV2VYhOMllkO0ZA+lRAxZjo+rZ9tpmu6uY2omXpEUe/Z
         IRkhWSBwOL7vvF78sQIkprB8pgIwPO8rH0ak0aetZ7uxWmLwcsWK3B7I/hcj58bIr8iZ
         vGFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlehGIcbQg+1/ScnsjK48jumV7fV0R7uSqxCDNCxsFT4cUuCBZsiqC3ui+xiUpfZVRD0ror6OJNlLGbq31j7pzN/JFni8xwc/0XnzWfg==
X-Gm-Message-State: AOJu0Yz5NMDVWViQ90wzzZWOx4wblZkdHUIpTMxjqOzNZtwzu8EMqrr0
	inI62M1ABoUr8METGcLFePeEfQfVqWlTA40gjEQVimdVNhXDCBCqUB9uFfCLPdCjCvjrZSeCwN8
	=
X-Google-Smtp-Source: AGHT+IFcE6tBwMe7ot5+O/3t4TbbhIKrINl4J+8hLvJT/caqX8sqYCCWCefFmQzI3F/jhqPVS3tGLw==
X-Received: by 2002:a05:6e02:154c:b0:364:216e:d1dc with SMTP id j12-20020a056e02154c00b00364216ed1dcmr9851712ilu.22.1708274915594;
        Sun, 18 Feb 2024 08:48:35 -0800 (PST)
Received: from [172.22.22.28] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id hm11-20020a0566020f4b00b007c46318b9ccsm1107820iob.14.2024.02.18.08.48.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 08:48:35 -0800 (PST)
Message-ID: <0123aec7-f7ae-454d-9b4a-361e97756242@ieee.org>
Date: Sun, 18 Feb 2024 10:48:33 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] greybus: Avoid fake flexible array for response data
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Gustavo A . R . Silva" <gustavo@embeddedor.com>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
References: <20240216232824.work.862-kees@kernel.org>
 <672fafca-547e-443e-8dd8-80ccd2320767@ieee.org>
 <202402171357.E671B5589@keescook>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <202402171357.E671B5589@keescook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/17/24 3:58 PM, Kees Cook wrote:
> On Sat, Feb 17, 2024 at 02:17:33PM -0600, Alex Elder wrote:
>> On 2/16/24 5:28 PM, Kees Cook wrote:
>>> FORTIFY_SOURCE has been ignoring 0-sized destinations while the kernel
>>> code base has been converted to flexible arrays. In order to enforce
>>> the 0-sized destinations (e.g. with __counted_by), the remaining 0-sized
>>> destinations need to be handled. Instead of converting an empty struct
>>> into using a flexible array, just directly use a pointer without any
>>> additional indirection. Remove struct gb_bootrom_get_firmware_response
>>> and struct gb_fw_download_fetch_firmware_response.
>>
>> The only down side I see is that it sort of disrupts a pattern
>> used on Greybus request handlers (and the response structure definitions).
>>
>> I think a one-line comment in place of each of these two
>> definitions would be helpful, something like:
>> /* gb_fw_download_fetch_firmware_response contains no data */
> 
> Er, maybe this should be "no other data" ? Do you want a v2 of this
> patch?


Sending v2 is probably best, because I'd like to see these
comments.  Greg could fix it up himself but he probably wants
to pull it from the list

And yes, "no other data" is fine, or maybe "no payload"
or "has an empty payload".  Any of those is better than
nothing; you choose.

Thank you.

					-Alex

> 
>> And then add a similar comment above the calls to
>> gb_operation_response_alloc().
>>
>> Otherwise this looks good.
>>
>> Reviewed-by: Alex Elder <elder@linaro.org>
> 
> Thanks!
> 

