Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17051DA22
	for <linux-staging@lists.linux.dev>; Fri, 30 Aug 2024 18:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725044239; cv=none; b=qWlCRTh3U9G2s6RDLefI2s5dUm0+0wAKHbmXEPLbV0b+N/YHuKNURZZIMgEg7PA1A/dtoDbVmyL5PU2oRTLsLmsRtCZCrCcNl6g3KunWjQlV8snUBqAGOXqRnIQq+DTJ6+q3FoIgVtFw9yCHD2VL7Ss3ePCSEE0l4ftboSTer/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725044239; c=relaxed/simple;
	bh=rvX/dDgBSvlVL0izU5WpcjGqdz9GGibZxL4sSXYenXY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=h26meI754aUKsPkmkIKxfHUs70lA5ShcPeZOCv3F0hI3SKHqAHYH8dg/7JksxlkURZAd3Jn90Cg5oT/HzFihypFgqdpt3faEVYnJoDLZzbn+cEYkHd6ojgG5weBzOiGIOYRGrhLnCVPx0z4HOxDfP+mACIuaG7r/o8Qbw3u1TuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lgkKg/4T; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lgkKg/4T"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5befd2f35bfso2114546a12.2
        for <linux-staging@lists.linux.dev>; Fri, 30 Aug 2024 11:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725044236; x=1725649036; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rypafLFMFg5+ACnGvncHfDlgMeufA++ocEnyXpczDK4=;
        b=lgkKg/4Tm3yLNr91xxmyH6ChdB17MErGpvyQHDF40HiXpyPO/3SRe3iV9A4z6R7U/T
         8aIxPGi9ZkSKPtETpnXegd5FvEPrq39mFc05ohm3UV+NkzNkvT+o9euTePMlddbE7SuM
         Uk7i7sBBjH6AWP31CGJsVbriXAT+dVzEOK31zz8EZoIuvijQ2tJ7l98BSPxHJYnVb/HK
         wfrGazNCSrFObp34ATYBZhJb9lTAxyVBNUQJqBRzQHxdeZm221c7yLJoZ35p9o5mHBHi
         vn5l7rxp2tuEscJDvVvj/wfjUT/TScEqsAh9GkpQ5fXEVdUsqnkghzc/W2kgyh3K4AQM
         t7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725044236; x=1725649036;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rypafLFMFg5+ACnGvncHfDlgMeufA++ocEnyXpczDK4=;
        b=QqwICEQUfZaaC1uAVvbqE3vuw83aNIguhCjNnAkySrhGkCTlZ3ZNnjNx9Hu51P/8sv
         CYT6q+lh/g/POGgWaV7zS4yquxIR03Y51CcwFWfZQXo2oMT0xnW3FDjxoD8VBuRtoVcN
         QbtSK0nZRf9Nta7HxuP35whJ02QngDBmSwZkdNMzEZna+hJ7I+/ghRjCob79tVFQET04
         CPl3MV2JDgiZKbQaINKsydoCnlvw++Tc43fkPtAjeDlMOs4CkAosqB1hcuJJV+VKWXjb
         A28p1d3oOAx/HgIqYeLCIZ99g1YxoKlg2d63ewV3nIacF5aOilGzVighCFHoodbBtHmR
         +LbA==
X-Forwarded-Encrypted: i=1; AJvYcCUNhrZt7gY8mYh51M1U7sehbBqvEeIxuKDiLyLzzNbz10dO94ZidU/rs/6hzwnnVd14RvsAqwc9GlzUN3/H@lists.linux.dev
X-Gm-Message-State: AOJu0YymfjJp+4k2+zWROfIqgF8G0N57pEKpb9a0bE6F2Kvtll14jwfY
	l82bbZPyw6LC12DOZY0smjzVWMneu6gl/3TqMxNf8tkGvCIMF/Uk
X-Google-Smtp-Source: AGHT+IEwzDsiIilTOBnxKPwDu4FaomR+DASGJ5X8afzwDXzpevmTO3JZzR6pzbAFc6AMu13BByD3uA==
X-Received: by 2002:a17:907:94c2:b0:a86:993a:93db with SMTP id a640c23a62f3a-a897f92021fmr651788866b.39.1725044235521;
        Fri, 30 Aug 2024 11:57:15 -0700 (PDT)
Received: from [192.168.0.104] (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89892333a0sm241142266b.220.2024.08.30.11.57.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 11:57:15 -0700 (PDT)
Message-ID: <2cb71c09-f64b-4ed3-9c0b-88c12d418a5f@gmail.com>
Date: Fri, 30 Aug 2024 20:57:14 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] staging: rtl8192e: Fix parenthesis alignment in
 rtl_core.c
To: Gabriel Tassinari <gabrieldtassinari@gmail.com>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ~lkcamp/patches@lists.sr.ht
References: <20240829214031.4893-1-gabrieldtassinari@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240829214031.4893-1-gabrieldtassinari@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/29/24 23:40, Gabriel Tassinari wrote:
> fix parenthesis alignment in _rtl92e_qos_handle_probe_response to
> silence checkpatch warning:
> 
> CHECK: Alignment should match open parenthesis
> 
> Signed-off-by: Gabriel Tassinari <gabrieldtassinari@gmail.com>
> ---
> v4: Remove line number from subject
> v3: Adjust the indentation by adding one space
> v2: Include the modified file in commit message
> ---
>   drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
> index ad21263e725f..75192041008d 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
> @@ -322,7 +322,7 @@ static int _rtl92e_qos_handle_probe_response(struct r8192_priv *priv,
>   
>   	if (network->flags & NETWORK_HAS_QOS_MASK) {
>   		if (active_network &&
> -				(network->flags & NETWORK_HAS_QOS_PARAMETERS))
> +		    (network->flags & NETWORK_HAS_QOS_PARAMETERS))
>   			network->qos_data.active = network->qos_data.supported;
>   
>   		if ((network->qos_data.active == 1) && (active_network == 1) &&

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
