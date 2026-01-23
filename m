Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80D4325491
	for <linux-staging@lists.linux.dev>; Fri, 23 Jan 2026 13:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769175438; cv=none; b=n11mOUre5DPLMAgd+HGRHz/YqIcDzdFknEwLFNgQiwoV7viqXV6Oc7Bl2USFBWPxu0LXjaQOO8BGeBbjBvtM/uvoGpaMaP0zTe7hXqsLz5jJOlhjihVUgzodBlwSehdlyySxb3kBZ/S5YfuHieZhzs3MTa8i+tVQWjv0PVbvpVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769175438; c=relaxed/simple;
	bh=vNBTEDX8CrK6EKPN3jmj/Bn7V9H6xqG+FPTNEtCYoK4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A7DmH/6Kzt2OAu8eUac9LqjG71uI+nOk3dWEsDYlxLKbFDYPqtx7GvWhIQSi8fyaFtEPyS6kUvzBSbShQVVJb9KOcAo7abP6hqCkmn4aJhrx100f6RQI/h+eSQT6Sb8qCyaEGuibKJXh1OM5QmSrXyT6QAWCaNGgQLAYzkiKxHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MwZshOKH; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MwZshOKH"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-29f102b013fso20669545ad.2
        for <linux-staging@lists.linux.dev>; Fri, 23 Jan 2026 05:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769175436; x=1769780236; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HErKn5h8g7RQpeSo7mOtJWLCMpuawZ5piVFZViS/OmI=;
        b=MwZshOKHf6LhM4y/0a+5eApolNMphgmfJg88SRE2vsTRZCeTuFSyoS8ubGSCfnmFhF
         9vqQCekJEKrwCf/aE0ssPbU32w3HLmSzi0Ax+Wpl/djDYYTmqnf7RGUqgWEdNO0g0FSo
         Yk29ShyqIYDMcNbABgS3tbTXD27DlC1A1kzOidmx/yV+KQERnqRwjjuj7wO1h518K933
         2eu8mg/UgToHR4/kcGADp9E5Q4xpvFzBNOVHMfNwEHuJwJVoF9ILdw+4pLvMUVSuZz1W
         AQA9DYzHSicEjHBpn0WX01irzDiMwFyBeCu6M1aRlTpaN0EMx+LxXT9LOCjSJAJ4m+hw
         bwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769175436; x=1769780236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HErKn5h8g7RQpeSo7mOtJWLCMpuawZ5piVFZViS/OmI=;
        b=E/uEK5Plfy1RbZi0I5KqTUo95V7buBsJBXGmMrz+EtQsQZ32ggLL5n2sy6M7clPY2y
         O+beF8LbOrkLEu08R2QFwcxYHkneV3uK1jWZibmxP/Qraj7tSVtA+egyGdTR4aoWXmPi
         TPfuV4EV30ql1+ncDbIYyagno51H60QsnevAerWES4pV5CprfsafFoo0FrQqJ8LwzEAW
         6cmzbm6ZiwOAsTm1yGKs5XdlH8CeZ6vBXIBbtAHJGxka/bdiFRHg2x9QcjZoyz77iOm7
         tSGCBhqikKtI5rkj0jZfgjVUxUkAri5/hIKyeecbRNxKIy49Gw0C0YDjhvUazRyJQA9y
         3qqg==
X-Forwarded-Encrypted: i=1; AJvYcCVCBuzpMRyWYABV/ZknGNivd3P3iOkhqNrg7y4vr6K9A4qhbms53lDWUtDHzeF9tWAMq4xiiUl2Jpv0/aR1@lists.linux.dev
X-Gm-Message-State: AOJu0YxwDJNkQqL+5VmJ49UP34LYz1+kkXzJiuh75XyAQRhVFYpJkx3W
	fmuzgDoZ4zlEtr3jyu82ThQRsjuXWXduVgJBypUgFk69cZXOFtPjK/NzXwpTRkEe
X-Gm-Gg: AZuq6aKUOJqlsWjFxVEwXBlhEPgncMuYrsM7RCtC0pxGwOHXfHKOnJJJ1lclBQ9dXT1
	oFWCU9TBWTBf9mfC67glziZ9bnJNTXtpeW42pSOLVupChlpbGQKyQ36v8YaO1FhL64shVMbk1sp
	Wb/WLHykmObiDT++D5WYEJHSzLO3DIe3KKkRsw1/vSu9wXiHWgyL/1jlqdF9LEm3AYZQqvwIn6l
	vXAw5ucE8Ylu0qlb0tnKAytvc6fq+LZN29XaO7TPqkprGXLQKn6iodBQvfV3AYbEuwAmGcylrdM
	vTQSSlsYTPBgEAuGc7IRU5LzVIRVOrrxdSpLcDifGyCGI/i0708N0p3Mm7NhvESBm6ZBl0W+vX6
	HQWXAQg5WsRZAH2jqg4yqbFammkkdzCfRW8UoFYU4ygrGeTPj2eXE85gk7FiN00s8dhBW4UoGSw
	ECUNTn3qzLX4afYMEYvDzG
X-Received: by 2002:a17:902:c94c:b0:2a7:b447:3389 with SMTP id d9443c01a7336-2a7fe43f266mr29851855ad.2.1769175435439;
        Fri, 23 Jan 2026 05:37:15 -0800 (PST)
Received: from [192.168.1.4] ([43.241.121.48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802daa79dsm20649435ad.3.2026.01.23.05.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 05:37:14 -0800 (PST)
Message-ID: <88798f9d-b765-421a-93bc-5e5b76995853@gmail.com>
Date: Fri, 23 Jan 2026 19:07:10 +0530
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] staging: rtl8723bs: simplify boolean expressions
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: gregkh@linuxfoundation.org, hansg@kernel.org, straube.linux@gmail.com,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260115102910.10018-1-khushalchitturi@gmail.com>
 <20260115102910.10018-3-khushalchitturi@gmail.com>
 <aWzLPQ_T5InVjT_V@stanley.mountain>
Content-Language: en-US
From: Khushal Chitturi <khushalchitturi@gmail.com>
In-Reply-To: <aWzLPQ_T5InVjT_V@stanley.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/18/26 5:29 PM, Dan Carpenter wrote:
> On Thu, Jan 15, 2026 at 03:59:08PM +0530, Khushal Chitturi wrote:
>> Simplify boolean expressions in rtw_xmit.c to
>> comply with the kernel coding style
>>
>> Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
>> ---
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
> What are these parens for?
> 
>>   			    (padapter->securitypriv.dot11PrivacyAlgrthm == _AES_)) {
>>   				pattrib->vcs_mode = CTS_TO_SELF;
>>   				break;
>> @@ -420,7 +421,7 @@ static void update_attrib_vcs_info(struct adapter *padapter, struct xmit_frame *
>>   			/* to do list: check MIMO power save condition. */
>>   
>>   			/* check AMPDU aggregation for TXOP */
>> -			if (pattrib->ampdu_en == true) {
>> +			if (pattrib->ampdu_en) {
>>   				pattrib->vcs_mode = RTS_CTS;
>>   				break;
>>   			}
>> @@ -482,10 +483,10 @@ static s32 update_attrib_sec_info(struct adapter *padapter, struct pkt_attrib *p
>>   	memset(pattrib->dot11tkiptxmickey.skey,  0, 16);
>>   	pattrib->mac_id = psta->mac_id;
>>   
>> -	if (psta->ieee8021x_blocked == true) {
>> +	if (psta->ieee8021x_blocked) {
>>   		pattrib->encrypt = 0;
>>   
>> -		if ((pattrib->ether_type != 0x888e) && (check_fwstate(pmlmepriv, WIFI_MP_STATE) == false)) {
>> +		if ((pattrib->ether_type != 0x888e) && (!check_fwstate(pmlmepriv, WIFI_MP_STATE))) {
> 
> These parens?
> 
>>   			res = _FAIL;
>>   			goto exit;
>>   		}
>> @@ -639,8 +640,8 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
>>   	memcpy(pattrib->dst, &etherhdr.h_dest, ETH_ALEN);
>>   	memcpy(pattrib->src, &etherhdr.h_source, ETH_ALEN);
>>   
>> -	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) ||
>> -		(check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true)) {
>> +	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE)) ||
>> +	    (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE))) {
> 
> These etc?

Yes these are unnecessary, I've removed the redundant parentheses in v4.
Please check the updated series.

-- 
Regards,
Khushal
