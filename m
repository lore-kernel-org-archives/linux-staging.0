Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E4FE14B949
	for <linux-staging@lists.linux.dev>; Thu, 29 Aug 2024 05:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724909867; cv=none; b=IhTBwurAWS07LvQ44rIoJMRu1GD/7xTcBDYwowKz9D4JX2KzjkzUgcJ7HUxh5y6D6c5dvhcSTbqtnqsLMotBBk9fANNo1ybbxPb383qPYDeOumLoRcvdW+rDfu0fANDpulpabRvvjVgLTVQImxS10hstEgtRZEDMvQaS1BD7xxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724909867; c=relaxed/simple;
	bh=lkk6anRFctndRZTQo8ST3rqb53GeepJeRWThtCQMT4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aqo0Z2HWXq8OWNmTFGtWFBLGDdJ33bGXQrdaCPyy2W5yWrfQzU6knYfiVPFVJ2BCfzcz2ee2ouq7oQFH4ZKNninXGwE1JIQN0ZynEzNOU+sGlotyWOlza5IaBrpQw/Q95aNZgQmuBFns+CSR1w9c7yu9xR5ZA04SubYkSCAReQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GXhlWq8O; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GXhlWq8O"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a86b46c4831so20860766b.1
        for <linux-staging@lists.linux.dev>; Wed, 28 Aug 2024 22:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724909864; x=1725514664; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Mpl613ImjjzIum6yob4Qlo8XGEpDoFGTb4R5TS3Up0=;
        b=GXhlWq8OhqFYU16rC6rt/riRPSOv9rSdvHpNcUQichQMvH9UQSw0UnGzBTf4psDmXO
         DrWhFjOyBb/g+khpjePvwJOi48pQkdADfIaBXfCpL6+t37Ie6Y7Fb3/Z3NbVVZQh4mRr
         cO7odORXr1TDknjTPcOrBRnDHxXNhjecbsA34MZvRu8BOQE38jJMhDGhy3byu8nB0g6h
         weNVMS1cczRv+cnTYubHkn8TdPFRPG43S/Q+KGf3IsLddXLTK9gCYqkamrQp8HjzYLiX
         h+qeTmGEYprmzilx3A873/edMVlpiXpBAxyHd54DoX1zr3mB5QW8SjRWeC5xj5nkBDvl
         No/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724909864; x=1725514664;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1Mpl613ImjjzIum6yob4Qlo8XGEpDoFGTb4R5TS3Up0=;
        b=XHqBKSnBtyKMHcXAXmGXKkMROx19OJlzx9Fd0W3U5tdWDgbHiQRsGhunb0M19pTMDt
         AlyuZ+xKxVyIE4P6BNOX6iVUBUvjZtgs8fQDg7OWNce7vJkZOg9BlEynTgcf4GkieOlj
         KWij7uavnEnhEuDj2WV7icBQxxWj5vKckUeg2dU7Uoo+LXCeFu0wwnmJcmUFKPkkGTB/
         gNG40ttkzMFkejViokRcBI23aSfE/KwgxEWrblLXorveumOMepitGVhng92uSXwR4zDL
         WR+pTWgX9WfBMvnhRVE/NtOPYK1Pwuq/WgFXQuJJ5APg2advSLcVIfbYa2fMQrtckBxg
         hqHA==
X-Forwarded-Encrypted: i=1; AJvYcCVAaOI6oJqah1dGkBVawMGhFpni/oXGabPo7Gh0EoW4F/yD7WhNgvbA/JN2g06iYf0EANYX2wL4YVBctRtZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2RjLA59vdz2Rp5UYC5V/zzCcBspOx1JHBhySc82nF2ylT0lI3
	QVnfNSLLYzNqMn5aKwaD+AHBIf0IuF6UEehZvQJ9+sXcjOITaC0TdpaRbg==
X-Google-Smtp-Source: AGHT+IF478ZX6mihGbhF8/Ix51ceNwaRw26Ei+3LxKfnJGJbMcL7UmotJXindpua0hcV/Qn1ax/abA==
X-Received: by 2002:a17:906:f588:b0:a86:7a84:abb7 with SMTP id a640c23a62f3a-a897f83b28cmr113530566b.20.1724909864088;
        Wed, 28 Aug 2024 22:37:44 -0700 (PDT)
Received: from [192.168.0.104] (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a898900f079sm29667266b.66.2024.08.28.22.37.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Aug 2024 22:37:43 -0700 (PDT)
Message-ID: <0c76ca65-acc1-4167-b2ca-d6d7ef0b5c64@gmail.com>
Date: Thu, 29 Aug 2024 07:37:42 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] staging: rtl8712: Fix style issues in rtl871x_io.c
To: Manisha Singh <masingh.linux@gmail.com>,
 florian.c.schilhabel@googlemail.com, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240828222153.68062-2-masingh.linux@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240828222153.68062-2-masingh.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/29/24 00:21, Manisha Singh wrote:
> Refactor the _init_intf_hdl() function to avoid multiple
> assignments in a single statement. This change improves code readability
> and adheres to kernel coding style guidelines.
> 
> Signed-off-by: Manisha Singh <masingh.linux@gmail.com>
> ---
> Changes since v2:
> 	- commit message updated.
> 	- assignment done before goto fail.
> 
> Changes since v1:
> 	Broke the patch into 2 different fixes.
> 
>   drivers/staging/rtl8712/rtl871x_io.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8712/rtl871x_io.c b/drivers/staging/rtl8712/rtl871x_io.c
> index 6789a4c98564..378da0aa7f55 100644
> --- a/drivers/staging/rtl8712/rtl871x_io.c
> +++ b/drivers/staging/rtl8712/rtl871x_io.c
> @@ -48,8 +48,8 @@ static uint _init_intf_hdl(struct _adapter *padapter,
>   	set_intf_funs = &(r8712_usb_set_intf_funs);
>   	set_intf_ops = &r8712_usb_set_intf_ops;
>   	init_intf_priv = &r8712_usb_init_intf_priv;
> -	pintf_priv = pintf_hdl->pintfpriv = kmalloc(sizeof(struct intf_priv),
> -						    GFP_ATOMIC);
> +	pintf_priv = kmalloc(sizeof(struct intf_priv), GFP_ATOMIC);
> +	pintf_hdl->pintfpriv = pintf_priv;
>   	if (!pintf_priv)
>   		goto _init_intf_hdl_fail;
>   	pintf_hdl->adapter = (u8 *)padapter;

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com> AW-NU120
