Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831D8217705
	for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 15:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768576330; cv=none; b=c1WGKoNwX3Mg45lEzI+px1DQB9ER/37r0Fj1yAhRejz4Pwm1rZcxs0ql5wPGjU4kyfIbGE731bKZVEgdW5NWSywa8M2EOpY7kpp4xyqtxb1s14u/X3e42Ijx3zrjlXNRgYrxxvm2ZSQnh7Cqt/Kkz8r27sJgBFAiIXjhh2MgpRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768576330; c=relaxed/simple;
	bh=ke4jGI/pMpYJhUdZT278oUx9DIiJ/Ksah+i3cNMi1Us=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I0FSd/xbdIfhx/tabIM9HbnmCm8WdvJL69A5p5BqTwBTxVFLnhA91DYEADnVm/QjZLKpcHjcz3SaxL77ctCHlIXV5cJaj591g/t0apK6+8ziiprGNp7c4yZBQfo1WZU4EDhi53RWGktcmwV0GlUUIJktY5IlcIqJQ05KOdQT/Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJH1oNMD; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJH1oNMD"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2a0a95200e8so14206545ad.0
        for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 07:12:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768576329; x=1769181129; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tQu3pTdsFxlcxxivNtgR//4Npg5GzUX/0HfS0u02h/Q=;
        b=MJH1oNMDj/6PJ+ts3A0usSEZlcO48Ecdi3JxbGL8fuLO2yWHenm9msEdN7kOYC0q8N
         52GxEm9jNv6YXT3d9pHu05+SL/kdat+nZcLqRtfY/OJbrTEgT4qHzSbxAZpS6ZgpGHC9
         ACmr46dLpCKaP9HUATYOw4mEdIeNFVI35VAb/UHGT233xk/tgPRZs8ZlJ2jhAlPhw1DQ
         bp+WLSGhw4b3dcL0yFxAtJsbBMHJN3878FtFPz151YCfzw4NShSpJo7X+Bpx/Uuw/dz8
         oab2UqaEjUEEokUut4Bq/aCwREq/2uFRc0OjhddZ6cTvTl3DaVUElMVBmw6N6p3UpTxq
         ZBkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768576329; x=1769181129;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tQu3pTdsFxlcxxivNtgR//4Npg5GzUX/0HfS0u02h/Q=;
        b=GWvgjvkts3zwv1PCcMv52IS00VkIOagUwz8qj4A6nHvUl3YHpts7t0SqL66zkcYOEL
         meCwpbfhSL/E4YgvwHzhrBBS9R1XR5etXWSrRvvCDMkdohRi94nmmSOgzzIEv8qJnGww
         M7iFAnVb6mJR39XftpMgjLsAI5Czurqzv1g/x7wCLvxJEbVeNhFUiLw9HucQXCoHoJ7y
         oOpGYeGetj7Rufg5hqabiZSpmuSy3fJw1D4Y7SHcShCPo9R1oSg/iPY2r8TA6+Y34fOw
         oQIDbioa1XMTAsIetI9jzCfJR5OJgH3SeqzGQLblM2DSTH3OvWxig/9c1IoRwCi4cV/y
         gEqA==
X-Forwarded-Encrypted: i=1; AJvYcCWgCbJ+G1itI3OG8XE2PtMDhNcLsqc+wDN3WR5DlOJWKqVWWHZR/hWJPHXYgzjYxurPfXf3/SubZe5teSn0@lists.linux.dev
X-Gm-Message-State: AOJu0YwgbTg253bBTT7qdC5xWsixPlvMEA6ZqbzRjlVSkIbevqBH8fML
	8Ec6g/BQImERIyZVoerl5i9KOI72+7uFHmxYiApNJQCg0CUznc0wh34aKlicgVSsvPs=
X-Gm-Gg: AY/fxX4e7s7aA8XCf7TbKqSjgaNDVmIOSWllQp0LqEJ4GU+Ib6x7oy7g89WQGtzHLWd
	q7HINU2WfvVrNm3p/rnwbgcIMwnIYlP1dRa9dRXorQhbQyMvY0o8TiyF+YCUlxDzvgGyPFQsKqR
	nthRKqbRpvKyucGq/DVWxbiKgS42hD5tRLZHWSTcmHDYD0s2yl/o9XIms1syhoVZc1V289AwnAb
	A5Z/B8giki0O/+8zf13fSrtEJJlOvF5UVIMJBu5utYuql+jK8Rn92uybF1g5rQdGUHOgn8hShio
	bigg7jopzaodmyGh4ye0S+OgllTKVTymbgD0etCYNGCCsOrUOZ1jE/NtWzwkyd6ym1HJmouIPi1
	OKkddjWNZzO/oClOwVjXXi1EHuPsBUnPv1kuuiLSd6n6gJjyESkZ8WMoI/hRc0QUMy6D0l2tRo9
	ejrBmyDBa9CdQu2T1RHpkDLva7dWn4nVKZ2io+3HFkY/3lOp4axrDoF8lU/kYJalCkr3lCVg==
X-Received: by 2002:a17:903:384d:b0:2a0:b62e:e016 with SMTP id d9443c01a7336-2a7175a5dacmr31300375ad.32.1768576328776;
        Fri, 16 Jan 2026 07:12:08 -0800 (PST)
Received: from ?IPV6:2401:4900:647d:8d87:29d8:49f2:6b71:bc64? ([2401:4900:647d:8d87:29d8:49f2:6b71:bc64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193fab6esm24234045ad.68.2026.01.16.07.12.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 07:12:08 -0800 (PST)
Message-ID: <be18a81d-206a-469c-8fb4-57159a6575ad@gmail.com>
Date: Fri, 16 Jan 2026 20:41:59 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] staging: rtl8723bs: simplify boolean expressions
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dan.carpenter@linaro.org, straube.linux@gmail.com, hansg@kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260116053052.4198-1-khushalchitturi@gmail.com>
 <20260116053052.4198-3-khushalchitturi@gmail.com>
 <2026011610-aghast-crazed-178a@gregkh>
Content-Language: en-US
From: Khushal Chitturi <khushalchitturi@gmail.com>
In-Reply-To: <2026011610-aghast-crazed-178a@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/16/26 6:41 PM, Greg KH wrote:
> On Fri, Jan 16, 2026 at 11:00:50AM +0530, Khushal Chitturi wrote:
>> Simplify boolean expressions in rtw_xmit.c to
>> comply with the kernel coding style
> 
> Please use the full 72 characters on a line.
> 
>> Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
>>
>> ---
>> Changelog:
>> v2 -> v3: Resubmitted as a versioned series to avoid threading confusion.
>> v1 -> v2: Corrected commit messages.
>>
>>   drivers/staging/rtl8723bs/core/rtw_xmit.c | 38 ++++++++++++-----------
>>   1 file changed, 20 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
>> index bbc42db1c828..97e38ef62ac4 100644
>> --- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
>> +++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
>> @@ -384,7 +384,8 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
>>   	} else {
>>   		while (true) {
>>   			/* IOT action */
>> -			if ((pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_ATHEROS) && (pattrib->ampdu_en == true) &&
>> +			if ((pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_ATHEROS) &&
>> +			    (pattrib->ampdu_en) &&
> 
> You moved this to the next line in the right place, but here:
> 
>> @@ -903,8 +905,8 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
>>   
>>   			if (pattrib->qos_en)
>>   				qos_option = true;
>> -		} else if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) ||
>> -		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true)) {
>> +		} else if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) ||
>> +		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))) {
> 
> You did not?  How come?

You're right, I missed the alignment in that second block.
I will fix it and send a v4.

-- 
Regards,
Khushal
