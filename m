Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A175726F2B0
	for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 15:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768577028; cv=none; b=Ga0GBiOT35fBXs04k+kqL32BzNDpkLGOzIP7G2NSnx0yO3lkSrysirIBGJ5mQMjoAc/ht+2F2tEWVvZ+2z/LeX9gOjCjVM5XqTFbXXZaVf8zraWdr9nGHCWpKJ+Lved/UKZqL9odZdJdiVCyOrjfR2OHqTeijtbeU3ZtzkiFur0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768577028; c=relaxed/simple;
	bh=95GDuAadkm+6JgU2MI2LFsOZYVYBGjEbuYeMyNHRjgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kwr0Ht+24TrIulEa7u1guHEtuNMQDZ/AJF2YgY+l/11d4ZB87dy5za+CkSXqU4rOrEf4jvlEeWy96luaIbcnPXrrE3hKBTC0RU0kMms2abmt9D554aCu/A8RxIO8wcoh1gPfI/v9OnsR7l7+SSK5uH6BkplrWg9Os1gz7A6dynA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kBsmA2U+; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kBsmA2U+"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-81f46b5e2ccso1273221b3a.0
        for <linux-staging@lists.linux.dev>; Fri, 16 Jan 2026 07:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768577027; x=1769181827; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=248wLl192lT1KJerB99Je6z9RqvQZNdV4S1C0r1pmtI=;
        b=kBsmA2U+8OO68TD5sldPTVV5f/HkgOmSKCc25VT6JOJM850XEzihQGKErvmptu/NES
         ruxr+gze4y9Wgc0lt4s9duB6LPwjeGjSImRJCCwqlXu7Uy+TC2HXjbFPNqGYV9ygPYR9
         QL6mzts3yRlr+dn72IAy8WIbyK+k7tayOs20gaCuGn4dh1tePNpjx1llVHRxOiGmSCbo
         ACMzYWd9D03aBS3tviaUDDb9lXlMO8pxMBrTx7i4SwAbprvKUWYWDZheaxp8ufS/02y4
         4M3dt24s6oDfyvARrqKA9YkEoX9RUuhm2p4RdC3majwaaEVJbOtetUbmdNiOMbUAuwrl
         mpdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768577027; x=1769181827;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=248wLl192lT1KJerB99Je6z9RqvQZNdV4S1C0r1pmtI=;
        b=j10bvzh/2SFYW5vslKLnbW5vVJLQ4ZFb3FXYYdcHWI/tGhchDmss6KGWpL5RrYRED4
         6ZLMUBvAuAOx0pWZn2glMxYVjfQY1Yr28pmJVahoCG8wW5/J6iTvgHPd3S23XGnqZ9cr
         LRI9a/1BwA4vAdAfN3dq7xo73bIfWP2/iYSp0sIsebUcLuVHyuJyVH99XwIi3TxqI6KN
         Cw6AydGydfUKrQDJ8esgVDqsoShGl8O/mrDsg0y1IU5ZqkHiep04yVjJw5W2lfNQQ7P4
         c/qqIHKJeoAzYtV7VxpHg3vUUUCHidntpLqdvlWT00qEL8dfUPA2IKxprfjDxVF4FktZ
         BUlw==
X-Forwarded-Encrypted: i=1; AJvYcCUh05lcMDB/0B+DSvzoDzKWjbkhqbLIw4bTwf2EuI0n7XozRhwxNZBNNZjVbPUbADHDXpkrCxVsQnH4WJsP@lists.linux.dev
X-Gm-Message-State: AOJu0YzQuX07e7lE32jANsh2BL2nYu9TCFinkPHOpjPsXxFbyrATQ0rW
	jjLqfZQgAQkNxT0RSM2LbNrA0OiyB61hscM5hcKssezs726OawZHhJZO
X-Gm-Gg: AY/fxX6+U7CrQLpfK42Vg3xz0vXUKa1O/xldaD/0CVz05kAYSB8qxXxy6s0JlwArJAt
	+pvcyAdSYuJMap4ZniSIC5obBJu+UPXzbzMH3v1gyEbFHdQaBmHI9tqq7B5VgikgwQYGs9Ho5pB
	OCbEWCWlLm7Ih6kmwGQYOUk2FS+im8kVWXv6k4Ab5GVQVRHz3jVJ6RG/+VVd4Rcl3+v4haQk67W
	E+5j682Pgm1dNSI/4AGZ+uSbgHmbWTADCq8L+blQ+ntKtIStt/QmsC7n07f+E51F5W/c84hD87D
	Vc5OGrPtc25Hc03aBjY382bQmCueICByj5gL64xK8M++c6E4Cz77S4kklSDqkmizlR1llmXmmuX
	ax5nTDnCrtmZ34MqUebotx3codTFgL59okxszl20p0XAln1/t3CZBLBmRFYsRwTaWeu2k7elUIg
	ozlXSq+vVZO75v78C3CTiuQua5OWAU/mvbP9u2L/vwzp9nteELzBQrSp1omniTIv5ATLzqOg==
X-Received: by 2002:a05:6a00:3395:b0:81f:3ed8:fd29 with SMTP id d2e1a72fcca58-81fa01ec37bmr3452790b3a.36.1768577026960;
        Fri, 16 Jan 2026 07:23:46 -0800 (PST)
Received: from ?IPV6:2401:4900:647d:8d87:29d8:49f2:6b71:bc64? ([2401:4900:647d:8d87:29d8:49f2:6b71:bc64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa108bef5sm2358325b3a.12.2026.01.16.07.23.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 07:23:46 -0800 (PST)
Message-ID: <b879146b-3894-494e-accf-a99f341b44b7@gmail.com>
Date: Fri, 16 Jan 2026 20:53:39 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] staging: rtl8723bs: fix line length and alignment
 issues
To: Greg KH <gregkh@linuxfoundation.org>
Cc: dan.carpenter@linaro.org, straube.linux@gmail.com, hansg@kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260116053052.4198-1-khushalchitturi@gmail.com>
 <20260116053052.4198-5-khushalchitturi@gmail.com>
 <2026011640-smudgy-kleenex-afb1@gregkh>
Content-Language: en-US
From: Khushal Chitturi <khushalchitturi@gmail.com>
In-Reply-To: <2026011640-smudgy-kleenex-afb1@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/16/26 6:44 PM, Greg KH wrote:
> On Fri, Jan 16, 2026 at 11:00:52AM +0530, Khushal Chitturi wrote:
>>   	/*  (1) RTS_Threshold is compared to the MPDU, not MSDU. */
>> -	/*  (2) If there are more than one frag in  this MSDU, only the first frag uses protection frame. */
>> +	/*  (2) If there are more than one frag in this MSDU,
>> +	 *  only the first frag uses protection frame.
>> +	 */
> 
> Break a sentance on the line length, not the ',' character.
> 
> Otherwise, you get odd looking lines like this one:

Thanks for pointing that out, I'll fix it in v4.

-- 
Regards,
Khushal
