Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179564E3EE1
	for <linux-staging@lists.linux.dev>; Mon, 19 Oct 2026 12:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792411786; cv=none; b=ddB5shjMRdnhZ3SsnjpBPyKSgAUMR6oCQi/gAI0b/i7WRcjcCnsvtsClCKiH9Go9rMx5HH8M19UlyeoUxXvGhinN2aDpQRlr8sqM3CMmHUrNBcNyZgTPoEzYwDBDFIWMIdEh6PRJZB2qnEY0LMtSlsNI9LgXdKwKVDczRW1rJHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792411786; c=relaxed/simple;
	bh=nVoYwK6h+y+Te91/ACo26V6pW3by7vFNDYQmaVQSNIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gFDq4WdjuidxjiSTiZC7B8KT0H80qVdwiyAOfs7cp3YgPQLWpglK6JpibKooZdOxYS3djfUa8qcaTzq6lXT4ag5zd6jvGi5J+5/cXhRm0NzRdS/qG1ihUxTWqVTZV9JFdlDx8VOGKHdbGaoAw+qjZLsHDDhSWNAx8awr+E2DMZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=SvyHb/D+; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="SvyHb/D+"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-53397554beaso24083641cf.3
        for <linux-staging@lists.linux.dev>; Mon, 19 Oct 2026 05:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1792411780; x=1793016580; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uNC7zOFArXbnYHi9LwZ86fn2ykdanOuG0zEVBU7RnSA=;
        b=SvyHb/D+BoBs+ARaafNgEo4xpE8wNc7eH/wtp/+IeEfI9Y/Bm5/5h5vyGBO5lfM8/w
         ffQyhQLh8h83ulkzqd6gPHv9dVRvvhcWGxWanOHyIQsFOeRfNSk7Vp/19TDhDMLBDObl
         TX0eDX6ly5MC4cSHey/13qErNcbTU4MtpBIWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792411780; x=1793016580;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uNC7zOFArXbnYHi9LwZ86fn2ykdanOuG0zEVBU7RnSA=;
        b=ZmuRQPoVd5iGQTge2f8dGrsXtg8dqLGz28fsbnHITzLDzpzKKi1YVojPSCeCCHrTNM
         mPZCeOvRJUxLVl9YeWssZHXVuqGxHBgHPJghr1uNE7FRVOKMGmQbTZLQ5nc4ivcHKxf8
         1uFNi4SmNoQYlp54rGIXPxfaA8V9NSbd71goVjwDH+jUQzZMDqcoJvYuUGARB3oaznu5
         wmozlGzNZVksS01OPyYxMC7yhKboGWUGLu/m0PYdRJGpsoYs3AiS/N/KNAUAKgSGy1Yi
         JSnO/8mtkd/ajLPFZo3ZF5DmwDqzbsXvSkG+Xm/MJlnfe8ZXbTlJe8FvdhSXqNu1jPp1
         6SHg==
X-Forwarded-Encrypted: i=1; AKwUvBz+7VdS9eiDcP//WoTf/wJKwiReO6VK9X8DN25DVLhIkh/GVePSmR+PbUNKlwUBqwwZH9TzBgNhdLsl5V0x@lists.linux.dev
X-Gm-Message-State: AFq9FYL2t0SMw1cqkMNNR/QPMO+elNA1vV3/ZQsOXbYtmaxGpIKD6opU
	/M2vMs2bUUulRq6vzQ3h0StftGwSq0kpZbNao49x0kAZNO2YSiWmxlxt5fvZG1UHDg==
X-Gm-Gg: AYBFou3XNkMZOTTWuKs9FHA1WvkwCWl9Mb9p3SsYilExy6O6Eg+J8IYEVP7+DP2qBiE
	arBAeIJLMK7LeFPCExXfcn3VIoQwS2nChdRq91uhNY2ZNNRIBpuAFsKOVeQJnS/yhEirhOrcFMH
	EOmpoFSxbEIU0E3HLihoTxojPDcw8kolaelUrLZZnYsjv13PO57K/OLp6oYEfLosyN57CKHAktY
	N52+hJU0F6d/1y7r76jVcHOUrigSyTaQ41UxNXryoM2FuJetVWJOTZV7pd0YqmWEfggJj6F2HVj
	fGDxG7x7O6uY8cKPoxEN/rfOtmxjRp4JNsVusz6WFrHToLik7XBiQXusYpAl/YVCZxZbGZLIA1Z
	QjH3HBDa2/Zw78TDzkHkoL3MeQaVOyNxTzpct+yM1LNwPGXxkEb85m+SdDm+JviqIFDkiYc+XfU
	/24IAPeHJpd4JF2qotR4cVRDSKP9GzwqxZ+Mo2jdaDaRLDTVP1ddrbMa9emyYhkEIcUsrcpEWWg
	tpJ
X-Received: by 2002:a05:622a:144e:b0:533:33ed:c39d with SMTP id d75a77b69052e-53645c1fa2cmr98728271cf.7.1792411779813;
        Mon, 19 Oct 2026 05:09:39 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.googlemail.com with ESMTPSA id d75a77b69052e-536448b6ce6sm72242721cf.28.2026.10.19.05.09.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 05:09:39 -0700 (PDT)
Message-ID: <e24ea2a1-9fad-4990-8392-fa075217f3fe@ieee.org>
Date: Mon, 19 Oct 2026 07:09:37 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] staging: greybus: use %pe in error messages
To: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>,
 Johan Hovold <johan@kernel.org>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev, elder@kernel.org,
 dtwlin@gmail.com, vireshk@kernel.org, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Elder <elder@riscstar.com>
References: <20261018084925.11793-1-pavankumaryalagada@gmail.com>
 <atXDvg_u1hQAZiYX@hovoldconsulting.com> <atXgBFNsXG6w30EQ@user>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <atXgBFNsXG6w30EQ@user>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/19/26 4:16 AM, Yalagada Pavan Kumar wrote:
> On Mon, Oct 19, 2026 at 09:16:14AM +0200, Johan Hovold wrote:
>> On Sun, Oct 18, 2026 at 02:19:25PM +0530, pavankumaryalagada@gmail.com wrote:
>>> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
>>>
>>> Use %pe to print the error pointer directly and display its
>>> error name.
>>>
>>> Keep PTR_ERR() calls when the numeric error value is needed
>>> for returning the error code.
>>>
>>> Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
>>> Reviewed-by: Alex Elder <elder@riscstar.com>
>>> ---
>>> v5:
>>> - Drop arche-apb-ctrl.c and arche-platform.c changes because the
>>>    files were removed.
>>> - keep only the uart.c change, as the fw-core.c changes are already
>>>    present in staging/staging-next.
>>
>> The commit summary (Subject) is a bit misleading now.
>>
>>> diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
>>> index d47f00751e7a..74c9898c0eed 100644
>>> --- a/drivers/staging/greybus/uart.c
>>> +++ b/drivers/staging/greybus/uart.c
>>> @@ -956,7 +956,7 @@ static int gb_tty_init(void)
>>>   	gb_tty_driver = tty_alloc_driver(GB_NUM_MINORS, TTY_DRIVER_REAL_RAW |
>>>   					 TTY_DRIVER_DYNAMIC_DEV);
>>>   	if (IS_ERR(gb_tty_driver)) {
>>> -		pr_err("Can not allocate tty driver\n");
>>> +		pr_err("Can not allocate tty driver: %pe\n", gb_tty_driver);
>>
>> There's really no need to print the errno here as it will always be
>> -ENOMEM if we ever hit it. You could even remove the error message
>> completely.
> 
> Since the error message is no longer needed, I will remove it in a separate
> patch rather than in this revision.

So doesn't this mean that your original patch can change from
adding %pe to a single spot, to removing the error message
entirely?

If so, I would prefer you just do version 6 of the patch that
does exactly that.  And if you do that, you can preserve my
Reviewed-by tag.

					-Alex>
> Thanks,
> Pavan
> 
>>
>>>   		retval = PTR_ERR(gb_tty_driver);
>>>   		goto fail_unregister_dev;
>>>   	}
>>
>> Johan

