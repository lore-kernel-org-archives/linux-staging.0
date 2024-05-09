Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7500A13C8E1
	for <linux-staging@lists.linux.dev>; Thu,  9 May 2024 07:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715241097; cv=none; b=hC+Lp02n+mdNWN42t4GqhxkN2D+Vh0Oc0Jz8XBXM/zjpFXZkgfl0HqVZONRFK6bOxsXIDX7g2RKCN4lSG1mBIdSDK+nFuGum2Wd3yKFRO74PNWtSC+yVhk6wlp/WC4EmRiXPYFIgGtTA+PbWYM2tzc6uKlx6CvLA2a3iN1zgN+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715241097; c=relaxed/simple;
	bh=Qpetu/YpQMTZ8pAa1jeqlxfiWUijO299LmcayGsUaX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=j2wQiMbWGl3eLZYFA4L9xwm5MYyOK9fxVFkysU0mKc0EJglq55Z6g4s/uwxjwVQK4XiOIKfmUsTP2gLHFaoIcE6mMkR0hoIVRHpU9/2RRXakeIH/f8QqCQb58nFpAYmptRrvY6WkqgmvuL4Ij+R/8pUb8hIkfwjfMz+4gDw3E7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=elilZSAP; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="elilZSAP"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a59cac06ec3so14391266b.0
        for <linux-staging@lists.linux.dev>; Thu, 09 May 2024 00:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715241094; x=1715845894; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M6xNzfhaoWFm6sJlVLBh3GSwTzYAxKnIt/VRGk/R2Mk=;
        b=elilZSAP2Vx1T+74r6hW8LqW+4f/08IiVFmqKRUuuqDhOJqG0HCHUkh3D3PBXRTeKq
         yQOgtHiqCmJOeB/2IqdvZjUSPSFbkzidgvHcYFrwqByoVa2W7KR2VwHxNc3efEw7afu+
         dSWi0t83SlZ6HCtXUqXKU/MEgzR/aXaygRneCiFFk0ReCpKjjFLSFGCYwq5+POdEM8Gp
         /iC30nODRIntFNbTk4n8ZJyOIdAXMGfptaYr80QcFB9lBkxO/8hxRhPsDHQIjE0KFCDY
         P06CkVRjedEPG2dQlXQxX7Gt0CAIKBwkUA4g2BpORJ1hVuaK0XtGApY9KW0l3EVT4NsI
         slaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715241094; x=1715845894;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M6xNzfhaoWFm6sJlVLBh3GSwTzYAxKnIt/VRGk/R2Mk=;
        b=gabAFixwzAMOMkJgWurQF+xKZM4Y8NPrLUmYUCMwqt9Vumjaq1f9zSFwSPj24bzOC3
         h+8X+Qg9cweyDxs2qpjPiC+E3/rdX7vNjJ4PS4xSpq7mVfLS6DY8XYuUeqd+hQx3WKTp
         pR2W+lf8M/tozm3t290zkmasJz4+G6JtbsKrRrFWRE3UFyjx8Bvmf/N/xf1+MmiWZxRv
         vWLxloXtYD9nQruO5renkHcjcVhIsqDUDw19cNHurbDTu0OPYmVsD4mC/vl9cMprLWsF
         hpAX1HFXksf21WIEg6AhcNWHPs/fopMfdkI5P6G8bvzZzJZN2Gt/AbP2kdEaB31fHtHa
         T8SA==
X-Forwarded-Encrypted: i=1; AJvYcCVixeZnwOooIWFn8EVGfPom1IrrNu3DnCiCLqccEpuhAykxqstZAagFUMsHX+/chNqrQHSLMbxGHkTJvXt9aIktJN6P9AYf/dGU4n2wKg==
X-Gm-Message-State: AOJu0YwMkWr+fB1rzywrhCYJiMko4LYysj3idpy2LfZQINjaawv34Gv3
	pNZyuARYrnbMl+pYmKBtKJVUsJsPd4iq8PzD5GhcQbNjeTdsrEKO
X-Google-Smtp-Source: AGHT+IHFBKDCvOz55Wyv8QIEsf4C9hOee+D6I/ijudRZT079I4yTV8oRLt6pk1px/3473/B+DRXWwg==
X-Received: by 2002:a05:6402:3894:b0:572:543c:70eb with SMTP id 4fb4d7f45d1cf-5731da28059mr3237730a12.2.1715241093597;
        Thu, 09 May 2024 00:51:33 -0700 (PDT)
Received: from [192.168.0.103] (p57935690.dip0.t-ipconnect.de. [87.147.86.144])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733becfc24sm448399a12.42.2024.05.09.00.51.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 May 2024 00:51:33 -0700 (PDT)
Message-ID: <190dcc76-7753-4191-8578-482c2942583d@gmail.com>
Date: Thu, 9 May 2024 09:51:32 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: rtl8192e: remove the r8192E_dev.c's
 unnecessary brace
To: Chen shuo <1289151713@qq.com>, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <tencent_1992979C468AF087A1909000C6D0D5E61207@qq.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <tencent_1992979C468AF087A1909000C6D0D5E61207@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/24 17:13, Chen shuo wrote:
> There is a unnecessary brace in r8192E_dev.c.Remove it to shorten
> code and improve readability.
> 
> Signed-off-by: Chen shuo <1289151713@qq.com>
> ---
> v2:Make "Subject" line more unique.
>     Add space after : and driver name in the subject.
> 
>   drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
> index e3ed709a7674..1862a9899966 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
> @@ -1640,9 +1640,8 @@ bool rtl92e_get_rx_stats(struct net_device *dev, struct rtllib_rx_stats *stats,
>   	if (stats->Length < 24)
>   		stats->bHwError |= 1;
>   
> -	if (stats->bHwError) {
> +	if (stats->bHwError)
>   		return false;
> -	}
>   
>   	stats->RxDrvInfoSize = pdesc->RxDrvInfoSize;
>   	stats->RxBufShift = (pdesc->Shift) & 0x03;

Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
