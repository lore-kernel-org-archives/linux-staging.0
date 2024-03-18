Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D205F55794
	for <linux-staging@lists.linux.dev>; Mon, 18 Mar 2024 17:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710781662; cv=none; b=bVU0FHhLYx4dmG4ceOAaGrJ3kbuszgoair0kAEn6qjQ0YvzQedqMxQwm24taBzKElH2/s7hWHwqTpcI+DEZXu30zmbVY0kxrt+dhyz49CbWYkuCBqElQXYeHvxju5VvdlDOmqmhg4f0LTbr19Ijg8RkOYtN1mSlKFI+CiaUkqEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710781662; c=relaxed/simple;
	bh=iw44JYMdpRhnvUSLK2BkH4jibuZa/JCBTRlLI+djmyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=th/k6tc11/Zg66XLwSYVn3lLUs7m0E+zl8sKamKEjQz83tT5R/zkUhNHBCa4WC/XaAmryQ6UMOaTKoAl/KevApsF0w1G9rHuSFwKjXvoO2VVJ0YB0XUmnqerKvAnCku5/U4c6ebyrWAcKt3MohhWFtJMykzIRg8ntsgbFcFb4ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lBtPzrWt; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lBtPzrWt"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-56aa63bd94cso278264a12.0
        for <linux-staging@lists.linux.dev>; Mon, 18 Mar 2024 10:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710781659; x=1711386459; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RQXiBvps7/vhp9jm0e7FEbfRyxZWtxROwZJ9DzCuQWw=;
        b=lBtPzrWthi/66uNh1ZHi+BQgpHzLPCQwbb2CpgLn8p3u19i30PB0nqCJybZRqU3NnV
         9PIKH0WCzxaeZorFUDYftBQ2woDJGQTqXdxEJWPFJHGsUr1PmQ9j1Bs/PnD7CZKQBVD8
         pMWT+/QKx1nFfBC4/Cc2k/xq3vA+OiD0hYIxPfBDzP+8I9xGASZuntz49w08wwhBJsFo
         WxwiIguw5r+t1zsG+dmoFsQBqUUVY3YEeqcQj1miJzX6jhlr0fVRVwBBcp19SHC6JrnC
         owKRlgVtuhzLkG/xhqLmCdzFM8Xy42J5tzi4QFtsJmo5W6XpfXzu4MKkn9JkAHdpKg79
         /RZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710781659; x=1711386459;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RQXiBvps7/vhp9jm0e7FEbfRyxZWtxROwZJ9DzCuQWw=;
        b=RKcQPU97kTTmWPBiKrH/jTlqJ0kMMwOgmY/JBEJq++a21LPk9RdwlF0trrsM67tG73
         z3xvSvD+ppTrNsBvH1BL3EMPBi/okzReX/AhwTT9p/W8zE2cx/RvL5aenbh3E8NiYSVP
         b+coNo2v78dCkX2sZApXw6Nk00AxmMsPLSO6b6Cf/RvCcoQO53AirJ7q20ilw9aZFM2Z
         TQ98F3kBBLEFvvO2lNPwDVrSLO7rYFM5CbpaxQw4+kxx3DaaRU9CLxNF1tmTD3lbfxOF
         meFuJ/BqEPpQ6JWibiTV7GBLB1sMEA2wXv4Y/AGsmQuu1bEBDbyIFQWz6wXlhc/+3q8b
         N99Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxjDqXAu7lO+Z3t5wJgpymt/dd9gBty7t9ESIX9iwFGLG325U5Msv32pvi/KnUcxIB/lg4SHJphi1kQttVTtlj18MzBd4FRTI+UCLQpA==
X-Gm-Message-State: AOJu0YwJrAwqFOAnX4EDuqmoFT1rya6AU5peX/nZU9lj0J+SE03ZMyjt
	CSolQYYel7s34YC73b9fZ1qmw+RmocV3xHo49e8Lj8x2DMgzJu1U
X-Google-Smtp-Source: AGHT+IGuaU6uzyYeX6jSGyfcME0djstfNqJmUWGI6VUkVW/mutim/j1ZGboBusSrwRLn6uTqmrHtLw==
X-Received: by 2002:a05:6402:3212:b0:568:8b4d:ad91 with SMTP id g18-20020a056402321200b005688b4dad91mr34361eda.0.1710781658985;
        Mon, 18 Mar 2024 10:07:38 -0700 (PDT)
Received: from [192.168.1.101] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id c1-20020a056402100100b0056b8345e10csm516764edu.6.2024.03.18.10.07.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Mar 2024 10:07:38 -0700 (PDT)
Message-ID: <5fa18cb8-3c51-4ac6-811e-63ae74f82f17@gmail.com>
Date: Mon, 18 Mar 2024 18:07:34 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] staging: wlan-ng: Driver broken since kernel 5.15
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Cc: Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Larry Finger <Larry.Finger@lwfinger.net>,
 Johannes Berg <johannes@sipsolutions.net>, Kalle Valo <kvalo@kernel.org>,
 Julia Lawall <julia.lawall@inria.fr>
References: <6dc14151-e71e-4118-826d-3ca5c8ee907f@gmail.com>
 <fba3951f-00b7-41af-8ef4-1e7c86e0cb48@moroto.mountain>
 <6c772d15-d249-4175-93f4-ca523006129b@gmail.com>
 <5716d138-ace0-4621-ab34-118610255207@app.fastmail.com>
 <cbdb25ca-f419-4afe-9b58-7d274445aefd@moroto.mountain>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <cbdb25ca-f419-4afe-9b58-7d274445aefd@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/18/24 09:01, Dan Carpenter wrote:
> On Sun, Mar 17, 2024 at 09:20:34PM +0100, Arnd Bergmann wrote:
>> On Sun, Mar 17, 2024, at 21:07, Philipp Hortmann wrote:
>>> On 3/11/24 08:04, Dan Carpenter wrote:
>>>> On Sat, Mar 09, 2024 at 11:09:24PM +0100, Philipp Hortmann wrote:
>>> You are right with the statement that it is this commit.
>>> commit ea82ff749587807fa48e3277c977ff3cec266f25 (HEAD)
>>> Author: Lee Jones <lee.jones@linaro.org>
>>> Date:   Wed Apr 14 19:10:39 2021 +0100
>>>
>>>       staging: wlan-ng: cfg80211: Move large struct onto the heap
>>>
>>>       Fixes the following W=1 kernel build warning(s):
>>>
>>>        drivers/staging/wlan-ng/cfg80211.c: In function ‘prism2_scan’:
>>>        drivers/staging/wlan-ng/cfg80211.c:388:1: warning: the frame size
>>> of 1296 bytes is larger than 1024 bytes [-Wframe-larger-than=]
>>>
>>> But It is not depending on the line you pointed to.
>>
>> Right, the kzalloc() already clears the data, so the memset
>> is not needed.
>>
> 
> No, it's inside a loop so it needs to be cleared on each iteration.
> 
>>> I need another week to look into this.
>>
>> I'm fairly sure this fixes the bug, the problem here was that
>> the cast to (u8 *) hides the incorrect conversion:
>>
>> diff --git a/drivers/staging/wlan-ng/cfg80211.c b/drivers/staging/wlan-ng/cfg80211.c
>> index 471bb310176f..9d6a2dd35ba9 100644
>> --- a/drivers/staging/wlan-ng/cfg80211.c
>> +++ b/drivers/staging/wlan-ng/cfg80211.c
>> @@ -350,7 +350,7 @@ static int prism2_scan(struct wiphy *wiphy,
>>   		msg2->msgcode = DIDMSG_DOT11REQ_SCAN_RESULTS;
>>   		msg2->bssindex.data = i;
>>   
>> -		result = p80211req_dorequest(wlandev, (u8 *)&msg2);
>> +		result = p80211req_dorequest(wlandev, (u8 *)msg2);
> 
> Ah, well done.
> 
> It feels like this is the kind of bug which should be caught with
> static analysis.  One of the things that people want from static
> analysis is looking at what a patch does.  So if we pass &msg2 and the
> patch moved msg from the stack to be kmalloc()ed, then print a warning.
> It's not something that Smatch does.
> 
> I have my rename_rev.pl script (https://github.com/error27/rename_rev)
> which I use to filter out variable renames or see if (1 << foo) is
> converted to BIT(foo) correctly.  Maybe I could extend that to check
> "move stack to heap" patches...
> 
> regards,
> dan carpenter
> 

Hi,

This change alone.

+++ b/drivers/staging/wlan-ng/cfg80211.c
@@ -350,7 +350,7 @@ static int prism2_scan(struct wiphy *wiphy,
                 msg2->msgcode = DIDMSG_DOT11REQ_SCAN_RESULTS;
                 msg2->bssindex.data = i;

-               result = p80211req_dorequest(wlandev, (u8 *)&msg2);
+               result = p80211req_dorequest(wlandev, (u8 *)msg2);
                 if ((result != 0) ||
                     (msg2->resultcode.data != 
P80211ENUM_resultcode_success)) {
                         break;
makes the driver work again under latest kernel.

I can only use unencrypted transmission. Throughput is 200 to 800kByte/s
WEP would need further investigation.

Thanks for your support.

Bye Philipp







