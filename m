Received: from mta.al2klimov.de (mta.al2klimov.de [162.55.223.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7886635674C
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 18:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.55.223.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779388937; cv=none; b=fv6uRa0EB6Memu64Y8EERA6gbWV2M0UDsfxgmVJPtfCNANvAg+UhEh+CkmjT7R08vYlnTAqwgU9KMBmDDty2MpTXA10ItDoQaGiYW5h5shaqxsor7eDCnFj6vvrCYmgyuj9bv4qTP0AcvdzgJ96UZhp7Upqz7rWOWvpw8X5MQMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779388937; c=relaxed/simple;
	bh=rLqbQsV5BI4AwXsZDpvAjnsg7vcKqpN0QIFRNDQ3Ztk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JklIOX1yDnnHz9rzHXLQ6//h4I2aHBg5L3GLxTQW9HfBILw4XO4R2LeL6aAYIJ64KBGspDNQMbd95fj0NSMuk7azbXuQ5YRTxIhMg3UYpuFbBFKtlDV7D3N4NXDR9Bt9IKynxAjc1xIiqhnYl+/zzUad9VxZ74zX0oWNeiZb+dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de; spf=pass smtp.mailfrom=al2klimov.de; dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b=HVJbct7E; arc=none smtp.client-ip=162.55.223.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=al2klimov.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=al2klimov.de header.i=@al2klimov.de header.b="HVJbct7E"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=default; bh=rLqbQsV5BI4A
	wXsZDpvAjnsg7vcKqpN0QIFRNDQ3Ztk=; h=in-reply-to:from:references:cc:to:
	subject:date; d=al2klimov.de; b=HVJbct7EJl4+tRj1nh1s/RESvTYEVmJTjBKsIV
	7iX/AVdrTINNz7M++0yOZ3oyqBQdnQKhNo6kFR7VCo4yXYAzzJ5/pxJjpZUIY4edV9wcD0
	u+0sA74PG62QZ9iL8KqAwG+NmOLAJK0Xwnf2sEoupeppo0IxzEoRfMxR5e0NVpTJJA6825
	grQ3rngg36kspM3hSZ3pkyt+iZX2UMmBB644Y92d2Q/b4C3jbP54xwuoVjJeg/2ZF4ehUv
	9fvRUxJ9l6ENgvSW5r/S5FQMejjfi01S43pXS9Y+YqTODCF9P6BOJznXTkLJC0jbZMh2kC
	ROuqoXVs0QF31Gvfvb+Lyntw==
Received: from [IPV6:2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5] (2a02-2455-18e9-e011-4d8a-aad2-c25c-50e5.dyn6.pyur.net [2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5])
	by mta.al2klimov.de (OpenSMTPD) with ESMTPSA id 10ed28c7 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO);
	Thu, 21 May 2026 18:42:07 +0000 (UTC)
Message-ID: <9caaf426-1912-43e0-949f-fb7bb6bbd1cc@al2klimov.de>
Date: Thu, 21 May 2026 20:42:06 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: greybus: audio: expect 0 from kstrtoint(), not 1
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
 Mark Greer <mgreer@animalcreek.com>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>, Elise Lennion <elise.lennion@gmail.com>,
 "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 open list <linux-kernel@vger.kernel.org>
References: <20260520180401.539215-1-grandmaster@al2klimov.de>
 <20260520180401.539215-3-grandmaster@al2klimov.de>
 <2026052158-willing-dreadful-857b@gregkh>
Content-Language: en-US
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
In-Reply-To: <2026052158-willing-dreadful-857b@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/21/26 10:38, Greg Kroah-Hartman wrote:
> On Wed, May 20, 2026 at 08:03:59PM +0200, Alexander A. Klimov wrote:
>> kstrtoint() returns "0 on success, -ERANGE on overflow
>> and -EINVAL on parsing error". In contrast,
>> manager_sysfs_remove_store() and manager_sysfs_dump_store()
>> checked for 1 which always failed the operation. I fixed this.
>>
>> Fixes: f9a21a3f4919 ("staging: greybus: audio_manager_sysfs: Replace sscanf with kstrto* to single variable conversion.")
>> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
>> ---
>>   drivers/staging/greybus/audio_manager_sysfs.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/greybus/audio_manager_sysfs.c b/drivers/staging/greybus/audio_manager_sysfs.c
>> index fcd518f9540c..581791d566e3 100644
>> --- a/drivers/staging/greybus/audio_manager_sysfs.c
>> +++ b/drivers/staging/greybus/audio_manager_sysfs.c
>> @@ -44,7 +44,7 @@ static ssize_t manager_sysfs_remove_store(struct kobject *kobj,
>>   
>>   	int num = kstrtoint(buf, 10, &id);
>>   
>> -	if (num != 1)
>> +	if (num != 0)
> 
> Doesn't checkpatch now complain about this?
No.

$ curl -fsSL https://lkml.org/lkml/diff/2026/5/20/2139/1 | scripts/checkpatch.pl
ERROR: Missing Signed-off-by: line(s)

total: 1 errors, 0 warnings, 0 checks, 16 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
       mechanically convert to the typical style using --fix or --fix-inplace.

Your patch has style problems, please review.

NOTE: If any of the errors are false positives, please report
       them to the maintainer, see CHECKPATCH in MAINTAINERS.
$

(Ok, sure, it says "Missing Signed-off-by:",
but https://lkml.org/lkml/diff/2026/5/20/2139/1
shows only the diff itself, not the headers.)
