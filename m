Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5B22BEC3A
	for <linux-staging@lists.linux.dev>; Fri,  5 Sep 2025 06:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757053884; cv=none; b=o3L+mX5swP5SN0unpBOQAi13d5lMPWtT7aFZzn6ND+YlWE0jynTlnbnw/AcyC9IzXht1acI1TTvAyRbBsql3SSbEIrbQH0/vBZxwLXCrEnVqVadmqZTLGCGRpTshbr4KO+qL2hmXPtnO4qCOS3iopUjDwf1FfU64tWMw3HNLssE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757053884; c=relaxed/simple;
	bh=Lj1NCAueVWdAkoX4S8LLnOQ3/stAEiD4Qf1ycv4L8eA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hDvRXrfB62A6xg7tLNKfcDYEkcJSx8kCDncZYzGDbFB0EJlgzij/1vZfogG05LsAtvYGnXW+JG1pCpXdmhdTzeeXEj6h86MHhGuUEsNi7j5vOxt9kqMu3zCPIYumrxk0gNuq4vYmhlkXO39OR2rhtbzNDXAzNFBAC54brvAXX48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=be4YT4GC; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="be4YT4GC"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7e872c3a0d5so159823785a.2
        for <linux-staging@lists.linux.dev>; Thu, 04 Sep 2025 23:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757053882; x=1757658682; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uHSvQN6UoDz+iHef94OYnP6vRyyEaJZRaiHOnjtu3yo=;
        b=be4YT4GCNSKK2xmnAhbRwn+92eSGjyObxBmPVeX7G8dLvHmgOZTxYQVeNgvdYhRWqC
         +X84uTTLblZr0tJcLpQpE5VwTShGjGcrrIWu/rdBJ9Tkgd/pF9t6EpFMiQ2wlGu3fbbK
         WcxIpyjKOlzpz3O4Svyaw0S2jcDuS2FL9/z3v3opAN789D3vWWiTqFvURpBlaEr88aWX
         G3/tfcOFyZrymmookoVcRaJ1QvZfGZRfY0eZaXkIH4u+4BZIxMZxOwqaucxxxf7C3cTE
         SOoIIuiTu4LdEry066RbvsXXzkxMEae+rQoO+CADmw0mkrCa02dtP8LmZSDucW7P54zd
         Ybpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757053882; x=1757658682;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uHSvQN6UoDz+iHef94OYnP6vRyyEaJZRaiHOnjtu3yo=;
        b=dJCWpGZc06QTHhNRsIKs8Sg5HSGbZY8nkht0RNYL51m3L8fZsreY7uHbBrLoQ6s4W7
         gU5I/GUJYYbxXuvg8oHHNYs1MzSpM96L6NC1wWcVSnoDvqTLnsNsw1nPJgiPkm+50iHj
         NndKgeyxm1T9OPPDysB0B5KOqYA2Qw2EKdzK/UH+fNSRHSSEj4L8xnczLt67SOJ7HDeT
         Lul68naqiQXeJbhzPbhofRmn3XZHdICyxLe5aAI/5CH12ZW37N2wDsYymPjt0VY3c7lT
         VKtxmaEVx5ilviaLQeI/GQF6O78Jx3DnfW+gkXRbLHMwxIuOGzy6cyIoUUPPM9gHQD8E
         XjhA==
X-Forwarded-Encrypted: i=1; AJvYcCWRpBc/nI0FQrsgBUQ+t6IP8lgFH+fHySuajfNKF+M4C9JxfYL5zjcBKtZ2izHhQrkvp387bb5HQVlOAP6s@lists.linux.dev
X-Gm-Message-State: AOJu0YwMUQRRetoH7MVhR6ACJCV3SKT1UEO+KVkZKOJrefjSlxYZXRiE
	nlEj/pl35HNVTS18965G7Mh+OaXi69St6AposOCi6Ibtw4/iHlSA4vFU
X-Gm-Gg: ASbGncsbTW4AoBM/d1x63OrZpq/MUnm0XW9YGcW+Y8jpNDOl6f/yOgFL0xJEVgbRpwE
	C8KhWQ8D8q/gz9r30i6tatIm09Ka9ncsFGEVGPiFgsFMpWrnX9VOcCYgRZUPs9XLFOnQM2VtbOo
	vTxmReun7+nSgMgrEUcsRoa2V+snBvEp5d/Dlg80Uczr1F5Et7mGRJhVRh+afuukUSCzM7cQy3K
	Y3ziPUvpGk6cQgoClSSBKyPjHgdRbJ0PSWKC0nhbpU8d3ojBUQjT/sAzWS19rJrr1IsmsqlcFa+
	so5Ugiq/kAGgblblOiBJ0wALR+6FwBZUrVwRwCCixaFNX4kSIP4XbAXJqKq+scvUz+MntWGC55k
	YYsbYuRNNBM9v52fhu0rYGoAGeATITLXJwmsYT+QDg4t8QXaIBTsz0YLabDY3
X-Google-Smtp-Source: AGHT+IHnE73tmpgUQukbfUoelnhjI7us3aOnbj2jVzEssSlexB8FYNdlMRj7VtGr6YBOmDPf88ldvw==
X-Received: by 2002:a05:620a:7105:b0:7f9:50da:915c with SMTP id af79cd13be357-7ff2b4b00f9mr2602434285a.50.1757053881846;
        Thu, 04 Sep 2025 23:31:21 -0700 (PDT)
Received: from [192.168.0.155] ([170.10.253.128])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80aa712bc92sm423763485a.27.2025.09.04.23.31.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 23:31:21 -0700 (PDT)
Message-ID: <7f80045f-a8ec-46ae-ad83-4c93027a353e@gmail.com>
Date: Fri, 5 Sep 2025 02:31:20 -0400
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/16] staging: rtl8723bs: fix excessive indentation in
 nested if statement
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250904021448.216461-1-vivek.balachandhar@gmail.com>
 <20250904021448.216461-10-vivek.balachandhar@gmail.com>
 <aLlIEspZ2wLRnCru@stanley.mountain>
Content-Language: en-CA
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
In-Reply-To: <aLlIEspZ2wLRnCru@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Ack. Will fix this.

Best,
Vivek

On 2025-09-04 4:04 a.m., Dan Carpenter wrote:
> On Thu, Sep 04, 2025 at 02:14:41AM +0000, Vivek BalachandharTN wrote:
>> Adjust indentation in a nested if-statement to match kernel coding
>> style and improve readability.
>>
>> No functional changes.
>>
>> Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
>> ---
>>   drivers/staging/rtl8723bs/core/rtw_mlme.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
>> index d05ff073af2d..a2b1e34765ac 100644
>> --- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
>> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
>> @@ -1254,8 +1254,8 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
>>   
>>   					ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, pnetwork->network.mac_address);
>>   					if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true) {
>> -						if (ptarget_wlan)
>> -							ptarget_wlan->fixed = true;
>> +					    if (ptarget_wlan)
>> +						ptarget_wlan->fixed = true;
> Wait, what?  We're moving from tabs to 4 space indents?
>
> regards,
> dan carpenter
>
