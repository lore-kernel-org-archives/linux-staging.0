Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2D51DBB2E
	for <linux-staging@lists.linux.dev>; Tue,  1 Apr 2025 19:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743537321; cv=none; b=SGF9E/ZJQ18uqRWjXBjAa7eM1V4bjG9x29ZIuVb/x12RAPy42s1Qcpm18J54CRPXx8DG0k5LwwPn/kpKFqdsEiwcNB1qOHRt6uSxxQqpEEsRmaXrI4tGNfNKvvlCXnbgshd5yLNL/yG6i1YA7EyDcARKqpYn5jkjI8CVfkmuwA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743537321; c=relaxed/simple;
	bh=ytEdkfb9Cq6tZc0KOluGufNsxHHwxjPykXj8tPxkUhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O2NwcaX7SwOCb4cjPcXF/LK+7AGzMzc5N3Ky4XyMxZqIIO+tbD4Xx63Q+1iXbDa4HUoAANZ3S6mZ8Y+uCtQS1ARiDh2IrJRpwabLRH9T52I7hpfrqAloSaKKAU+4uOzXGitQkK+pSNptOxzVGWYCZaaDtLlcCHTaEKhAcU9ksAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=UTW7OF6H; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="UTW7OF6H"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-3d46ef71b6cso47231095ab.3
        for <linux-staging@lists.linux.dev>; Tue, 01 Apr 2025 12:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1743537317; x=1744142117; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p5BGxV995iPbNsm0G9OmkNVQGbzPtq/umLW+mNxhnvk=;
        b=UTW7OF6H2megRwNXxS7VyFZz7EhUpVgp47KCv4lzdfPlXrA12lpr1nlFrhj9R3DwXf
         JeCr+vWB9nouo1QKDd02TMcopRBdzzsGXFHfOMj8S/aXXK324W8WMYyZNj44tG8WyRlA
         GfTQmcGdkeU0SuKMUu1wfS4x19eLxpG+sUYTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743537317; x=1744142117;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p5BGxV995iPbNsm0G9OmkNVQGbzPtq/umLW+mNxhnvk=;
        b=JBICVeXPQG+D5mxMhgi4HUc4LXPcs/na7u3wjicb5IY3MkC3sbE8cTok5h93S4qzj9
         WbV+1xyByfb1Y7BM52qaKshu8S3nJO2j2clStID9sTSFW6wjlCcZsrBYfOXXlcd2+UFl
         hbDhuIBz+bRJ9zSosabllfhe08UadD6RZk7OjciTRzxsHOWVZc7scSt0LdQUZnefaw36
         NOtJnq+Afwo0AtE+1r8jEV771QkPy52mHELoDwuJxSkEkpsS0zugRGbF4QemndDZE6zZ
         zMU1odODdbtEW6C8nSJGkZlmwcq51bwCBlD3Qpp68sfrf+k+fYZaeWP8m0JPq6xGyAsu
         yvwA==
X-Forwarded-Encrypted: i=1; AJvYcCX6p6/LT4Ehx0qTsQL4BEmqA79QD6m+flLQwyXKdR0szj4nEajl5K7Puex0C6gXs7IECCfWS7hjC9EO2yzX@lists.linux.dev
X-Gm-Message-State: AOJu0YzRbNwNUinSGt3xqRjJ5GQQgX7bjMEQEi4LeLvlNnPxwkxc8iHO
	foTRVGI06IjMewETaLFcujWW0aUcJs+AJCI7xJAE0TlL4u6KSa4rkvQkOmEPtg==
X-Gm-Gg: ASbGncvOWxjHwptPYNUpbXRq/lDBMfWMBEoBxHQBx7XigmNC25Ie0QjR29Tnsb9Lzyt
	0Z+NFlJFSZG2G0mfDBN4nqa7geKkh8Z5UN5Mom+gHwECvrvKXor1B5GdhEF8j2/SS/NtiXBJVxy
	q2Ay5+R8Yb6CpqrI+Bq1ZPvWK2MQRRv06KZCCMN1aFk1e16CjDr/0ZTGRub+YjIxlkidQqWtgjz
	yIfvcCO4jmLYVhzyFecUjGF0NWHx/93Zco1KVfQV5+RTB2sEzd7jkjIi9LVEOU2nLeDt103hzTX
	iUYgb0gG//qrUm8MajF285xgCa948B796j/ezB3TAuVFrziEvpZdNZWyhMr8DPKVbBPdS6d78EN
	4cGA=
X-Google-Smtp-Source: AGHT+IE8Yzt70TZYcNhHaKZmfudRm9bqr4DZF9FrsdiV0SgnjyY2AA4L/NqUonhTzt1HtCqJmAo8IA==
X-Received: by 2002:a05:6e02:378f:b0:3d5:eb10:1c3b with SMTP id e9e14a558f8ab-3d6ca5b4575mr55992685ab.5.1743537317009;
        Tue, 01 Apr 2025 12:55:17 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-4f46487159dsm2569433173.97.2025.04.01.12.55.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 12:55:15 -0700 (PDT)
Message-ID: <bd773190-1cdd-4faf-be39-ea042d6e8124@ieee.org>
Date: Tue, 1 Apr 2025 14:55:14 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: Remove unnecessary NUL-termination
 checks
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250331183935.1880097-2-thorsten.blum@linux.dev>
 <8a68ab78-cf18-4937-a8b7-fb0fa41c9d53@ieee.org>
 <9288204E-F6B7-4C9D-AADB-511A845A2624@linux.dev>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <9288204E-F6B7-4C9D-AADB-511A845A2624@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/1/25 2:51 PM, Thorsten Blum wrote:
> On 1. Apr 2025, at 01:31, Alex Elder wrote:
>> On 3/31/25 1:39 PM, Thorsten Blum wrote:
>>> @@ -125,16 +125,6 @@ static int fw_mgmt_interface_fw_version_operation(struct fw_mgmt *fw_mgmt,
>>>     	strscpy_pad(fw_info->firmware_tag, response.firmware_tag);
>>>   -	/*
>>> -	 * The firmware-tag should be NULL terminated, otherwise throw error but
>>> -	 * don't fail.
>>> -	 */
>>> -	if (fw_info->firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] != '\0') {
>>> -		dev_err(fw_mgmt->parent,
>>> -			"fw-version: firmware-tag is not NULL terminated\n");
>>> -		fw_info->firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] = '\0';
>>> -	}
>>
>> Interesting this didn't return an error, while others below did.
> 
> Should I keep it that way when checking for a truncated firmware tag or
> should this also fail like the others?
> 
> Thanks,
> Thorsten
> 
I don't know the answer right now, and I don't have time at
the moment to investigate.  Just keep that logic the way it
is, and make your other fix.

					-Alex
