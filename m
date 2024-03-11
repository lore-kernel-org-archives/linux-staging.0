Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B737654F83;
	Mon, 11 Mar 2024 19:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710184376; cv=none; b=qYO8n74aVZz2nGviqID1+bNHnrAkwZzBcXkxxcEGRonx0qXD/4ZnEsumJ3WfrzbuRHDfgQrVTtH1eP/6N+HjaJgnuKfmh8VvRwCYUxH71wwT5LoOXYPPS5kNV1EB/JfapsRbXPmZBZy38FLxhbZ8SpOsrw9mVFJeT/CYeEjfFMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710184376; c=relaxed/simple;
	bh=vSPmOlLmSST5FDedii1lKp1ln0Krsn7NXYHxlkUi5kc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hnkd3NAZScGhv7IHMdNrGoo5+ld6bueetksOpmm+yAkpDsxalyGt08KNi2JtHKgiZr60HDAFGY5IFs8p2dips5uPgogNIdDCtE6qU9xQudUpHDEHxmIO7BDi8ilExvc62+HLtu8zP0RmrdkDRTU/ihCIqMIqQGmtM6DLpbnJey8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T+4J719z; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T+4J719z"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-565c4d0fa48so2471081a12.1;
        Mon, 11 Mar 2024 12:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710184373; x=1710789173; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yvc3n57sG/EgKjIvn90GbNi1fbIRTY1+trZI6eVmRkA=;
        b=T+4J719zCZa0O9XBJaJJVhVjSd5Klepb2fvJ0danV10cSAUWZiDOet2OGQU63dMLM6
         KvmXMpESMLdS8vKPDMk+CK2NGvw81QXb8yft06DCV3a2z5L2D3K/WzqEzPJnXScqscnU
         ujWwTB871PAwn/ZGRfBVYslZM9uacvbCw4Pg9OK74FhRJ+K3TH3pl9x9Nnh9c6rCEQuI
         kZ3doFfJFPQsvj0fGqSVTHuZop6gjIpjI5l0/FknvvooUGXWfmvdNIxmOSatnX1YTQo5
         m7c0PZQHZlKdgXHNXaJ8P2KSYVYr1acwben+wo8HBblW+hspAtAzpjgJzaxFZfZx2Uor
         9cjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710184373; x=1710789173;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yvc3n57sG/EgKjIvn90GbNi1fbIRTY1+trZI6eVmRkA=;
        b=bMi941lSuTHVhemvR3b8Kln5i5XX6M7CiT9EtHvNHWiCSmGFwh82EdPk6qZoJqfOE3
         5goyYMLvut/FlWEUm8HFWhd2CjacFrSfdq/E518yuuFEIjHFBLHJxgUwuVD2uG78zIR3
         x/5dl8SpQa1E6U75jGlgK9R8NrLSZ8R/V+QputIVs9/3gK1ec0UeyiNhrWUUx1Rhfe45
         0WoPf7QRlrlia40A7MPakQ1PkjCPu+mZ9BLIpAvk0Jbu1wn+S7pDPCv5TerDCRagbHwD
         VsT6vKuhu9Iwaq7jyEs4ueKaSKifGOVnU4WUSQv2C/F0FGtbWlrkmQNo+5tXnVHKXWXR
         SieA==
X-Forwarded-Encrypted: i=1; AJvYcCVeSiRYxqsstEhvZh2VtrYezag28yBG+abBTa6qcRc1s+8cb9PwJhEeI7FgQ/MGD5OlVqiV4qnEgIMUtpZOy/DKv4WBvinZJLv02Ey/N3LftCxpbaWMAK9cPMGd3JzdiNfe9hFcRxuXJg==
X-Gm-Message-State: AOJu0Ywyi5xi+gcEsjYHNQugx6/kGRukczSzAOqCDUcgpppe2L4cbDcc
	maOzMhfCi+/pw6zfXj5oJCAPlylqr/mIy6YbpOndM9sq9FwQxfSd
X-Google-Smtp-Source: AGHT+IEhK78V53bzJOOKLDCLv12a2XM+2jYUL5BNalyQIVaBMmHGdaZyIZAal9qxrLM3OD4p1tx86w==
X-Received: by 2002:a17:906:32c3:b0:a45:ced8:e131 with SMTP id k3-20020a17090632c300b00a45ced8e131mr5381811ejk.2.1710184372652;
        Mon, 11 Mar 2024 12:12:52 -0700 (PDT)
Received: from [192.168.0.104] (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id r24-20020a170906549800b00a45a62e0ed0sm3129450ejo.98.2024.03.11.12.12.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Mar 2024 12:12:52 -0700 (PDT)
Message-ID: <5f6b7fad-5ad3-44a0-9e10-3e1c13109abd@gmail.com>
Date: Mon, 11 Mar 2024 20:12:51 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: cfg80211: Remove parentheses prism2_get_station
To: Julia Lawall <julia.lawall@inria.fr>,
 "Felix N. Kimbu" <felixkimbu1@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy@lists.linux.dev
References: <Ze8LBf6xSjCRt4rd@MOLeToid>
 <4936c555-2c53-d421-126c-48804a26887d@inria.fr>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <4936c555-2c53-d421-126c-48804a26887d@inria.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/11/24 18:05, Julia Lawall wrote:
> 
> 
> On Mon, 11 Mar 2024, Felix N. Kimbu wrote:
> 
>> Remove unnecessary parentheses around 'wlandev->msdstate != WLAN_MSD_RUNNING'
>> in static int prism2_get_station(...)
> 
> You don't need the name of the function in the subject line.  That
> information doesn't help understand the patch.
> 
> julia

Hi Julia,

I think we do not need the function name in the subject but we need 
something to distinguish between the patches. The subject line needs to 
be a little unique. Otherwise we will have 100 patches like "[PATCH] 
staging: cfg80211: Remove parentheses" when we are unlucky. Any better 
proposal for a Subject uniqueness is welcome.

Function name for this purpose is OK for me.

Thanks for your support.

Bye Philipp


> 
>>
>> This change ensures adherence to coding style guidelines.
>>
>> Signed-off-by: Felix N. Kimbu <felixkimbu1@gmail.com>
>> ---
>>   drivers/staging/wlan-ng/cfg80211.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/wlan-ng/cfg80211.c b/drivers/staging/wlan-ng/cfg80211.c
>> index 471bb310176f..7451fd2bb580 100644
>> --- a/drivers/staging/wlan-ng/cfg80211.c
>> +++ b/drivers/staging/wlan-ng/cfg80211.c
>> @@ -247,7 +247,7 @@ static int prism2_get_station(struct wiphy *wiphy, struct net_device *dev,
>>
>>   	memset(sinfo, 0, sizeof(*sinfo));
>>
>> -	if (!wlandev || (wlandev->msdstate != WLAN_MSD_RUNNING))
>> +	if (!wlandev || wlandev->msdstate != WLAN_MSD_RUNNING)
>>   		return -EOPNOTSUPP;
>>
>>   	/* build request message */
>> --
>> 2.34.1
>>
>>
>>
> 

