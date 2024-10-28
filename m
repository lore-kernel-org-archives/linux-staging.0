Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0E41DACAF
	for <linux-staging@lists.linux.dev>; Mon, 28 Oct 2024 12:46:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730119606; cv=none; b=a/tkUNdoup+MmfvTlZsQsPq9oXxkSW1THlbASwGeVNhqH4XJ6SBhPIoTrhEppcte3gooELdFj8TH11CQN+ETBWY+5xKyLReZgCOPHQzjr4J17YB5UgCGVEV+RLhobwCJj09f6HJGY43pkXYf98SL6J0iefwBQWpT+wk+S3HUxvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730119606; c=relaxed/simple;
	bh=PZSoodWMsOoQQCTyvZUruBMNVCFTNghWTBXW5UDY+/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AqaM4HADgzI53Z4747TccKpsx0MqDhViMGvmZqkHVYiO18R/ZqsLNWHfWtu/PTddxmwMyCIPKhjhAbv8yZXUBifkLYowqAXn76zQlkLnOH3z2XjzhOyCAW7AqQaHQltTU+MBsy1o+WwmeL/PG0bNzaQIR5sIXn7faoqx0V55jZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=YQeRb8pN; arc=none smtp.client-ip=209.85.166.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="YQeRb8pN"
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-83aba65556cso175460239f.3
        for <linux-staging@lists.linux.dev>; Mon, 28 Oct 2024 05:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1730119603; x=1730724403; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7gqziD48iJSw59sUbg1Xn4EgpxjmEAikt0eo9LrL6y0=;
        b=YQeRb8pNcvdXf+PW5v1x93/+ct5ZDbvoLgemJ2X7PN73coXoqxdm+bFr/TXN0SuZIT
         /SDi+rSz6LZya+yP+W5q47fK/6/W0zSeWo+EA8vSZgtDbRukrSHgjy059R0fSe5db12+
         dt2NZHJKAQNPbKC5hQuDau/zWZRSRSrtcuipg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730119603; x=1730724403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7gqziD48iJSw59sUbg1Xn4EgpxjmEAikt0eo9LrL6y0=;
        b=Rw06wLJ29xJTTW98ePCmkHvT0JsnQg08frGYbOXd7ql6tDdMfpK8dRbh+81z9LnTY0
         bL9R+vmdCWkSvWXZIkjSU5KSlFp/M9gvfAqe94WbxqbEFSvIKO8MUMEqzbdhYledWUhx
         q+0k8aNCuQNnhB8PF6CYk3XA4rYq9zCE0mdsccvLZII4MXBsIVjysIS4j6GaqIGpMsEL
         LW9ar3uRVN/QulGoEVBtIqeSdVooiM0wcdIAeYV6MfNfwy6P4ny2rL7hwt3eFHeFh0dl
         s81iBcap782iEiviGATY1yY+FEXIv37RIvwyJqKM4s3VdV48fgJqdwKtqzk/fpx0c/t6
         RXmw==
X-Forwarded-Encrypted: i=1; AJvYcCUGMUNseR/4j9bxpAQKq2p3KbvNXmfDUJYpEXbkiF+Ru2xEItOezXQgCTZhVWwk3Ek/qupz4Vn/9bsffvlw@lists.linux.dev
X-Gm-Message-State: AOJu0YwGrSs/pHyHi02gj+INZAp0VcnIrxLjc/dMTEtEIe83hMr/RC9p
	KhA5KSIFx5c4elfq5NqCPJvmbYkN5OhoiRKpKdN0I8XH01PeRo9PuXtK6sqknQ==
X-Google-Smtp-Source: AGHT+IFk2W9xgzmvAPsM1lDa+gdwQgC9agSg3N6MCb5OTtBXYvgbyYC2xFyDB09UbFic7ODwjwJ3bg==
X-Received: by 2002:a05:6602:6002:b0:83a:a96b:8825 with SMTP id ca18e2360f4ac-83b1bcefdebmr750425039f.0.1730119602691;
        Mon, 28 Oct 2024 05:46:42 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id 8926c6da1cb9f-4dc725eb4fcsm1664421173.36.2024.10.28.05.46.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 05:46:42 -0700 (PDT)
Message-ID: <a9cfb5e6-33f4-495c-b329-7e97f626d1a1@ieee.org>
Date: Mon, 28 Oct 2024 07:46:40 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: fix possible null-ptr-deref in
 gb_audio_manager_get_module()
To: Dan Carpenter <dan.carpenter@linaro.org>, Yi Yang <yiyang13@huawei.com>
Cc: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
 elder@kernel.org, gregkh@linuxfoundation.org, ankov_svetlin@projectara.com,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 wangweiyang2@huawei.com
References: <20241026081153.2649890-1-yiyang13@huawei.com>
 <9ada17f8-7b3a-4bf7-8fc8-f40bf67adb33@stanley.mountain>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <9ada17f8-7b3a-4bf7-8fc8-f40bf67adb33@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/24 5:50 AM, Dan Carpenter wrote:
> On Sat, Oct 26, 2024 at 08:11:53AM +0000, Yi Yang wrote:
>> The gb_audio_manager_get_module() is EXPORT_SYMBOL, and will return NULL
>> when incoming parameter id < 0, fix possible null-ptr-deref by add check
>> for return value.
>>
>> Fixes: 8db00736d365 ("greybus: audio: Add Audio Manager")
>> Signed-off-by: Yi Yang <yiyang13@huawei.com>
> 
> Where is gb_audio_manager_get_module() called from?  So far as I can see it's
> never used.  Why not just delete it?
> 
> regards,
> dan carpenter

I agree with this.  I suspected all callers might have guaranteed
that the "id" value passed would be always valid, but... there are
no callers.

It is a simple function, and could be added back again if it is
needed in the future (possibly even by reverting the commit that
removes it).

If you do this, please remove gb_audio_put_module() in the same
patch.  It too has no callers.

Thank you.

					-Alex
