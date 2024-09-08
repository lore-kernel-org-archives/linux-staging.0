Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25876178CD9
	for <linux-staging@lists.linux.dev>; Sun,  8 Sep 2024 20:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725827623; cv=none; b=d0AoswVMjB7vsQXneDSL78ZGTYk8vHYIJnErSlZDDOqRe+jerAq91bTWx0WRsFkvk+77dKrwWMIJRIMHVmHTMvqcahriouDVMdgQ9ho9xl+BjbF4xK/GU6nMmUPcI9cngGVTc6NcsmY2KRMhJosCSR+OhelRfUn8dGmcrIZgGP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725827623; c=relaxed/simple;
	bh=xwD4m181/ghlyX16sIsZDzu4zhFafGG1cb7UM3VEeS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IbDlWQ2KPeqy4WAwvaVC5zweVvWIoI/BtMz/o0TjNEWy1bsR8b/nkNgMe2ieS916KlvIDD+KghIgYCUJVQwEDJ+V2YtRf4akAJGRNhpxkGG28w4jFttoxNaoBl+aW4w2gPKcFRG1RUJ0gz7cLm32CoNPE6I411riPMG9kB3hQyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J66C8tsE; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J66C8tsE"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5c3c3b63135so3863525a12.3
        for <linux-staging@lists.linux.dev>; Sun, 08 Sep 2024 13:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725827620; x=1726432420; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kF2uO3WLFmIzAKWxOZE3qObArcTQBZD6pgoNP5m+nYs=;
        b=J66C8tsE1KtOi5InDsYUKRN7C/Fjz1+gA0T3F6ZIKnsadNCRu/ia8mBXl+kePgCGEQ
         4fZyG8TNaEVrO0isAYvxaOnm//WiQITtFfUeoo5M8fGlMElbYEMz1As+H1IqAuilycfE
         ZoA8ZtnPUqC1gFJd9JGpbo6py3UggG1zi92hk2pBkBwrvtYxemC1HwgYWoenGC5N960m
         c5Z1z9nke7oSEs1rZ9RsnxUcc3bH1CuUFJDjovy+waR/JxG0SsmezzRm6qLvuM4T5zcd
         D/8Jr6osLbsDqSVkmHOHHr+a62MhRwKWc3xrTfXsi6VsO9CDAyom6Wz36wLN6DDmbliR
         Qs9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725827620; x=1726432420;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kF2uO3WLFmIzAKWxOZE3qObArcTQBZD6pgoNP5m+nYs=;
        b=jtMu7FfCCQvwby3ZnAeQSmIBzlBWJqFCDMlMZpmMHba9Db1CI5h77iP+StVugavW3i
         MXKwthfe1L1nXFSUIpTk6S9PvwD6f9VDrCYbGjZ6doFq4YKTHIHEgNsb/9RIZm4IaRa1
         qU5aX3kn931Pni9k6kTeNkmUstW26lUVU5ahhXrOVVmATjO/aOPsfcoGKFt3r9LcTWau
         K/glCgA6SOza7sBeDQ4rz1BMpd4KjkhUYJgeXdxCg+E6Er5hPt46AtCkIJWmdbTSqWiS
         ub7MoAFf9ROpDEKekKrNOmBzoh6A/FOcNa5ME3HFj9gCSy7gvCctOGo+TY7mAWmt2/Cu
         K0CA==
X-Forwarded-Encrypted: i=1; AJvYcCXkHWXtf2HJav7FPRbsKSrvoiq1YqgBuSWZ+hBs7agQQptNyF4ZnZf5i5BuW7dTacTBRRTaoeCtZp/5idA4@lists.linux.dev
X-Gm-Message-State: AOJu0YypqPHN+WbmNmhYivErf84f+k4kAU4McPHHZxUOhl3MDlSGkvZk
	Hf1cnX+1dlHEhxZvrZryd8d7OngUkpPpg5Q+koK0e2TyB0Mxn5noQurUrv7y
X-Google-Smtp-Source: AGHT+IHkhLuRJsXaIsWySKb1wYWCss338DDk4msZoEw3vDmi8KE+93iuiZd4yfSMTfIOpsAjfe1ewQ==
X-Received: by 2002:a17:907:2daa:b0:a8d:489a:d23 with SMTP id a640c23a62f3a-a8d489a0f42mr361532566b.25.1725827620292;
        Sun, 08 Sep 2024 13:33:40 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8576:4416:5fef:fc17:c89e? (p200300c78f2a857644165feffc17c89e.dip0.t-ipconnect.de. [2003:c7:8f2a:8576:4416:5fef:fc17:c89e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d2595117dsm246784566b.63.2024.09.08.13.33.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Sep 2024 13:33:40 -0700 (PDT)
Message-ID: <b335b3dc-61b4-4e39-8627-76bd4acc82c2@gmail.com>
Date: Sun, 8 Sep 2024 22:33:39 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] staging: rtl8723bs: fix position of opening braces
To: Sayyad Abid <sayyad.abid16@gmail.com>, linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
References: <20240908101110.1028931-1-sayyad.abid16@gmail.com>
 <20240908101110.1028931-3-sayyad.abid16@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240908101110.1028931-3-sayyad.abid16@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/8/24 12:11, Sayyad Abid wrote:
> This patch fixes the coding style issue of opening bracket "{" being on
> the next line.
> 
> Signed-off-by: Sayyad Abid <sayyad.abid16@gmail.com>
> 
> ---
>   drivers/staging/rtl8723bs/include/rtw_security.h | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/rtw_security.h b/drivers/staging/rtl8723bs/include/rtw_security.h
> index 487d69460cec..3ccbccf92417 100644
> --- a/drivers/staging/rtl8723bs/include/rtw_security.h
> +++ b/drivers/staging/rtl8723bs/include/rtw_security.h
> @@ -170,8 +170,7 @@ struct security_priv {
>   
>   #define GET_ENCRY_ALGO(psecuritypriv, psta, encry_algo, bmcst)\
>   do {\
> -	switch (psecuritypriv->dot11AuthAlgrthm)\
> -	{\
> +	switch (psecuritypriv->dot11AuthAlgrthm) {\
>   		case dot11AuthAlgrthm_Open:\
>   		case dot11AuthAlgrthm_Shared:\
>   		case dot11AuthAlgrthm_Auto:\
> @@ -191,8 +190,7 @@ do {\
>   
>   #define SET_ICE_IV_LEN(iv_len, icv_len, encrypt)\
>   do {\
> -	switch (encrypt)\
> -	{\
> +	switch (encrypt) {\
>   		case _WEP40_:\
>   		case _WEP104_:\
>   			iv_len = 4;\


Hi Sayyad,

I cannot apply this patch. Please rebase.

Thanks for your support.

Bye Philipp
