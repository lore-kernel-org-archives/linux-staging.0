Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD724405
	for <linux-staging@lists.linux.dev>; Sun,  4 Aug 2024 19:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722798148; cv=none; b=sQ0oZosKLFgHozOYC4HRgXnwTAnwbLcBYSF0sGP6uK7LaYPEf4RCJ5RlGyyfqSQMsKd5aCGFHcrMjdwxzn2NU4CwUQZ/usALARGxLH5k+sFLcedbmsdgYvXZxI6VgJNdkupKnx6wUGvgJZAxW0ezS2yKgznY2PGIpy7cYRknuNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722798148; c=relaxed/simple;
	bh=Ic83cIw3LZSk1lL+KI/T3gj6nn83gCmNiOvNt/JKofM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Q/L8sSafJQtXbxZwsV2mZKNCL9QrAfSVtcB/+sCE5/bhDkBmgn6CaTjkyGs5qsxxcoa8KqoZUZokS5ERovV6Kc2faIeskHxpf5Q9VruTHrf5KZuqxJpBRzGWVC4+2lLRbzIxRjn998LtTeVchUrs8ALVdEf4f4tA+mQ84wBTONw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j4jvGpym; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j4jvGpym"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52efd91dd28so1834221e87.1
        for <linux-staging@lists.linux.dev>; Sun, 04 Aug 2024 12:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722798146; x=1723402946; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C0LY+LrUU4sorQ2vC2ZQPJhM+w3LyncwHBAPScP+Lek=;
        b=j4jvGpymfyPL0eqwR/v0AlNZ44KNjp1W/dp6w5J+Qlv64VwkIlgO1mdOILzUHhHXGk
         iLxZIYuGf/CjvQEjuo9oOYDA8mhV8e3AgWgwh4YkHJXuLovsnHdKgIKCtSryOGOjdEgT
         wGbvmJxP2uYhu5WatoVRuWhjrHjOwNQY5ti2T5dgsnwFJ1Rh/8mw0SAz99JUTU6WHazn
         dxETamXU1yzsyTgjdwr5YbZxECwgSCfuERRJbFtTIZYRulPuc+TVYjvuYREHrOlzP1z3
         d187DxtgV7bM3SbqJDSl3kT2+VWk8YNVWr9FFHLsx36LSmdG7MhZh3nP2f6fllQMn0mg
         QsVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722798146; x=1723402946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C0LY+LrUU4sorQ2vC2ZQPJhM+w3LyncwHBAPScP+Lek=;
        b=UfDwnAS/PKu4VM5Awll/6l0/j9g53qrdaBic48MrR8B89KaMnzlO9PWuzF1Npc/z4J
         jhmcqdENgVhmCONK8MfUU2G37qunvt0YCiHD/hRgFsRNCKibidPokkPcQfhBLpW3sU/i
         lGUfaoSslq770G7K6qAjhp6mP+5Ki0Zg47ZbXrx4DjY/WJnYdqb00QRM1WqyYEgH4Lho
         kE0n4Sq9qy6jtTtxuPu7FZsf0FdkQ/vwdl2WNdm55+zj9wq5gin+A8i0+mjOlLq8DG01
         wm2xQyyx0qL27jgnPy5aJ9Q1zM8UgkgCiQE5byp5Qo163aerxRNBkpxTTCqluFc64iRn
         JlSQ==
X-Gm-Message-State: AOJu0YyPE5y47451bIRSDHYoQ3mKYFvR+IisUG2hu5AMFidLlyLMmU7g
	XwvQDIqTYYpEmTV5Ye18oKFLrIUQ7/S0/9n7v+LVw+Fd1DQwx4bF
X-Google-Smtp-Source: AGHT+IFSDZ2DPGUgfGkBrjHXRHxEAgseLumjghtbsTvTtxOpuxqtMuqcnqp0Qsa7uFe7ywiaDeKtdA==
X-Received: by 2002:a05:6512:3e0f:b0:52f:c142:6530 with SMTP id 2adb3069b0e04-530bb39b3famr3475784e87.6.1722798145182;
        Sun, 04 Aug 2024 12:02:25 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8571:6636:3ef:7fc1:f163? (p200300c78f2a8571663603ef7fc1f163.dip0.t-ipconnect.de. [2003:c7:8f2a:8571:6636:3ef:7fc1:f163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9c0c58esm358837466b.86.2024.08.04.12.02.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Aug 2024 12:02:24 -0700 (PDT)
Message-ID: <a4cb6e95-3a61-4e2c-b401-916794a4ed02@gmail.com>
Date: Sun, 4 Aug 2024 21:02:23 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] staging: rtl8723bs: Delete unnecessary braces
 for single statement blocks in xmit_linux.c
To: jiwonaid0@gmail.com, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240804113249.10257-1-jiwonaid0@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240804113249.10257-1-jiwonaid0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/4/24 13:32, jiwonaid0@gmail.com wrote:
> From: Jiwon Kim <jiwonaid0@gmail.com>
please remove the above line. It is not needed
> 
> Delete braces {} for single statement blocks to shorten code.
> 
> Signed-off-by: Jiwon Kim <jiwonaid0@gmail.com>
> ---
> v2: Fix commit message
You changed the description and the subject.
> ---
>   drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
> index 1eeabfffd6d2..e0736707a211 100644
> --- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
> +++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
> @@ -144,9 +144,8 @@ static int rtw_mlcst2unicst(struct adapter *padapter, struct sk_buff *skb)
>   		psta = list_entry(plist, struct sta_info, asoc_list);
>   
>   		stainfo_offset = rtw_stainfo_offset(pstapriv, psta);
> -		if (stainfo_offset_valid(stainfo_offset)) {
> +		if (stainfo_offset_valid(stainfo_offset))
>   			chk_alive_list[chk_alive_num++] = stainfo_offset;
> -		}
>   	}
>   	spin_unlock_bh(&pstapriv->asoc_list_lock);
>   

Hi Jiwon,

sorry for bothering again. Please fix above comments.

Please also remove the "net-next" in the subject. Sorry I missed to 
mention this earlier.

If you send in a third version of this patch please use a change 
history. Description from Dan under:
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Thanks for your support.

Bye Philipp


