Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B278B17F385
	for <linux-staging@lists.linux.dev>; Wed, 17 Jul 2024 19:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721245740; cv=none; b=cafqtQTfhB2rJjSG53xNSIU8OD0J/Xs21x3nWX35PlkdxLwbSxAQAppdS8mVTQaZE3u5luzf8kbLDvip8eebwqvTkJGOSaMyrry9i45kq3qoHU5OcsAvt48N0Gb18XoHeVT8d1UjmSsL4gkBdF8egHTovELcOVKiBaIc7ekxKQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721245740; c=relaxed/simple;
	bh=cH+Zeq2maryTVTe+9VY4AVKUK9zcm5riSNHKwoyD0ZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mb7egq0h18yrDi99CGQyyvDBDafpkyX3luLDs3Hkx+OhX1t4EwxhuwGsp9ALFoip3KAzt02O/e4sULiqvx7KGoJw/BS/CyuNfp/EX0Cn41rB1N1pMRwrmBC8YRbnfIOGImJsBXWtsYFA/WmbWYh3YNXyZOv24OXK7Evl3A5ErBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VnfUz519; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VnfUz519"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-36841f5f3a1so1215f8f.2
        for <linux-staging@lists.linux.dev>; Wed, 17 Jul 2024 12:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721245737; x=1721850537; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5SNZ+fxd75Yf1ilckpOxtxVrcOC31yvc86O8amMKHI4=;
        b=VnfUz5197KIR0dznQCcU4jNOEIQ5Xvw/Ptw0wrRiOA9bDVNB0yCphlcAxpTyGA+2vP
         AF46MfZ+WMipe7/MfRISMR7j4+JQuxfMS6PoayTHLNv7Ar/pierxqyOWR+p6CsLC91Xd
         uwAM3CzN7+vfAqlP81evNg8F24ouL02C3x1BhNpYN1p9ll4Rd30BO32HcrKzFF56xjKw
         KDM7KcP5eKPJBqMlTxcWVSyAKzxS1pZzt6veRTl3r1DrCRB7MaI0mzFwuIsTgowGb9wt
         WCNzYDRpOwkTKA3YNd+EXsTwzDxThEgzBPiwVmrWq/Vd/12YZoxzSQqO8bmekDGmQqvh
         dbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721245737; x=1721850537;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5SNZ+fxd75Yf1ilckpOxtxVrcOC31yvc86O8amMKHI4=;
        b=GM8qOXnLM5bNbTbsHfX9tduvD+6TDu3tCmA3QZ8vvxuEvZ1KpDE62kl7gCvMJIG6Jk
         jZt20H+32kgpGviB2sAkzX5Sk/3vBMXN4Amvzr3NGjBmuw2OwYv3Z7NKr+2CrX5Pwtly
         LmVNLhayRZO8ItGekbdxdPw11X9sgi+ye+dnTjHxBVxvD8SswI4dr4Y3nt8b3riTyEbH
         CVfZG1Aoxq0Nyd19rHy2Q33C7EvyddjwT5tpRaMlnZNBkLqKTAqPy8uULTFI9ysIHfRu
         RBSRitcGFaGqmlprxoTyQw2nZtfZJjoQtI5U7UnKlq6we/dA+qOqbswYx2X794lB+sMQ
         xs5w==
X-Forwarded-Encrypted: i=1; AJvYcCUvdewvE3cTcIvS7BsUdJ4kOoI5QFLQ7Sd1E3QcL5edEhCUvPtxBnnlKUx1UZietHIKXJbRQlEpqbjxIBCOXuSNLrGmPDyYwBCaFf9y9Q==
X-Gm-Message-State: AOJu0YwrO98ajwPlhf6E2IhmUykM+0RqjmtF0yF4H9Ku1A7RWPtPG22I
	RinjWnVfiLakcka/wiybfR0jp+T6eplS3dLcPjMMO3YCLGHVnfs7
X-Google-Smtp-Source: AGHT+IG4VT3HdJYwEyMiP29GuillCQKrYxdD6BADIxDsiUULy8sF9u8Rw+Q3HL/aYaduDjarg9zAwg==
X-Received: by 2002:a5d:64e8:0:b0:362:1322:affc with SMTP id ffacd0b85a97d-368316fbf8dmr1179141f8f.5.1721245736694;
        Wed, 17 Jul 2024 12:48:56 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8528:bd7:7bdf:9466:88a0? (p200300c78f2a85280bd77bdf946688a0.dip0.t-ipconnect.de. [2003:c7:8f2a:8528:bd7:7bdf:9466:88a0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680dafbea9sm12594645f8f.82.2024.07.17.12.48.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 12:48:56 -0700 (PDT)
Message-ID: <150abedb-1eef-4406-bded-a1fe2bc9ac17@gmail.com>
Date: Wed, 17 Jul 2024 21:48:55 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8712: style fix multiple line dereference
To: Moon Yeounsu <yyyynoom@gmail.com>, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev
Cc: Moon Yeounsu <yyyynom@gmail.com>
References: <20240717130636.2139-1-yyyynom@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240717130636.2139-1-yyyynom@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/17/24 15:06, Moon Yeounsu wrote:
> It fix the following checkpatch.pl warning:
> Avoid multiple line dereference - prefer %s
> 
> Signed-off-by: Moon Yeounsu <yyyynom@gmail.com>
> ---
>   drivers/staging/rtl8712/rtl871x_cmd.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8712/rtl871x_cmd.c b/drivers/staging/rtl8712/rtl871x_cmd.c
> index bbd4a13c7bb9..c8a220e04776 100644
> --- a/drivers/staging/rtl8712/rtl871x_cmd.c
> +++ b/drivers/staging/rtl8712/rtl871x_cmd.c
> @@ -528,8 +528,7 @@ void r8712_setstakey_cmd(struct _adapter *padapter, u8 *psta, u8 unicast_key)
>   	if (unicast_key)
>   		memcpy(&psetstakey_para->key, &sta->x_UncstKey, 16);
>   	else
> -		memcpy(&psetstakey_para->key, &psecuritypriv->XGrpKey[psecuritypriv->XGrpKeyid - 1].
> -		       skey, 16);
> +		memcpy(&psetstakey_para->key, &psecuritypriv->XGrpKey[psecuritypriv->XGrpKeyid - 1].skey, 16);
>   	r8712_enqueue_cmd(pcmdpriv, ph2c);
>   }
>   
Hi Moon,

you did not use checkpatch on your patch:


kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$ git commit 
--amend
WARNING: line length of 110 exceeds 100 columns
#21: FILE: drivers/staging/rtl8712/rtl871x_cmd.c:531:
+		memcpy(&psetstakey_para->key, 
&psecuritypriv->XGrpKey[psecuritypriv->XGrpKeyid - 1].skey, 16);

CHECK: Avoid CamelCase: <XGrpKey>
#21: FILE: drivers/staging/rtl8712/rtl871x_cmd.c:531:
+		memcpy(&psetstakey_para->key, 
&psecuritypriv->XGrpKey[psecuritypriv->XGrpKeyid - 1].skey, 16);

CHECK: Avoid CamelCase: <XGrpKeyid>
#21: FILE: drivers/staging/rtl8712/rtl871x_cmd.c:531:
+		memcpy(&psetstakey_para->key, 
&psecuritypriv->XGrpKey[psecuritypriv->XGrpKeyid - 1].skey, 16);

WARNING: From:/Signed-off-by: email address mismatch: 'From: Moon 
Yeounsu <yyyynoom@gmail.com>' != 'Signed-off-by: Moon Yeounsu 
<yyyynom@gmail.com>'

total: 0 errors, 2 warnings, 2 checks, 9 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
       mechanically convert to the typical style using --fix or 
--fix-inplace.

"[PATCH] staging: rtl8712: style fix multiple line dereference" has 
style problems, please review.

NOTE: If any of the errors are false positives, please report
       them to the maintainer, see CHECKPATCH in MAINTAINERS.
[staging-testing b055801a1388] staging: rtl8712: style fix multiple line 
dereference
  Author: Moon Yeounsu <yyyynoom@gmail.com>
  Date: Wed Jul 17 09:06:36 2024 -0400
  1 file changed, 1 insertion(+), 2 deletions(-)


The two warnings need to be fixed. But it is very difficult to fix the 
line break as you would need to shorten the line itself. May be you like 
to start with something else. Feel free to contact me directly for any 
question.

If you send in a second version of this patch please use a change 
history. Description from Dan under:
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Bye Philipp



