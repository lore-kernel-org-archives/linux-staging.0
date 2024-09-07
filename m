Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2BF0AD23
	for <linux-staging@lists.linux.dev>; Sat,  7 Sep 2024 05:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725687216; cv=none; b=rYO/VQhpHEoSNgFwEVl6nKolfYzNLxHV+oJfmj5EmViDncfvuSMsWs6/dSxT/HhklsGer2A75vDmzUk354OYBx8IsARREKo6O6TXWIU3WtuIo3sird58h9S6oc4mZPcGfZvYRDWSbiF7XvDnH/k3jCwOPLao4uNKebsDoJa830A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725687216; c=relaxed/simple;
	bh=zantoeM69tUQKQTq7QtVcfoqoVWwS6/m4Cby2VdJdlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qZ8rnrEWQSJ+3CU6X7ypaua1t+v7G6WToWkb2v6UfF7vKSax027LV2TsGbFm1tu3qvsFArQz5ww+kG5Vw7J3pISkuGb3xGuGPGZz/W3y5XLRXW0or3n7/svb221XWSk3ADYiEnQLum7k2WpG+U0M0pk+apxP8qyKwU4aOckLHZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YUw9hMdi; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YUw9hMdi"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53568ffc525so3635150e87.0
        for <linux-staging@lists.linux.dev>; Fri, 06 Sep 2024 22:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725687213; x=1726292013; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EMdYzbyGz4WlAzyMlzXjH9QYo1m21KCeU40Swdjo/50=;
        b=YUw9hMdiy7qdhpiHyxhGq0QP11r6F19fIYa/3npMAtgRqEZ3ZIC5U8QodOE/4eaCbe
         +g66JjR6+WCFSnTryEoMU+RLiuMNF68tLDuOZR0h/3Mje9tjDvRU1h8qD91rLws6n9i3
         9XwITvuI21cXqULH5PraEyju7Q3EmIrjSk+zC9hLdOG0SKWho+4hMYUWNSuft2mx2ZN6
         +lDpI9DVneuv2coa+bD3USZ4YY9H8cWQb485wDSnI79eX7a/+K3M79HK5/qWAqvWtCB0
         yqLVcx6DTxdMuh9EjSwSZU/A/0BbyZIMPLfQyJ+uPgvJnbJ1FRgKtQU3ak0l/A9uHrDe
         dLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725687213; x=1726292013;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EMdYzbyGz4WlAzyMlzXjH9QYo1m21KCeU40Swdjo/50=;
        b=MKiU/rNf1jJBLLcb/UZzIO3P+IGGDARVhuR96wLovrqTvFxyNn3gtgpkXOqNUSFCE0
         h06xZYv+ZBAhrI4Sh77PDUO7l5YE2hhyC/9fGq3cGc1QEJ74g6b7/yvUu0dFQj3YybV0
         FVhSVo53MEoB631XfcOsj3IY6Rgv52w+GK9xiiYJJib6v8uN9Q18BYLhDaO4fRyoRYN6
         xBjX6kCHFt/1V2OSKCH2jV61znfFH9d6ADk8aDHjmeu5TZWjEw6qV1XKPv5n5tap5rC2
         HW27G4ZnLBqvYwNjqU0J/mPLIZLuq+pihSbI/Kft+FS7EhmxIsfgrJkjOFDS9y4bpJ0K
         tKAA==
X-Gm-Message-State: AOJu0YwvFukDvOvichWqrNeoJI7PhxBVPvDwP3jZLE0LkHlyxqyHeyDC
	scSnNKbN+ksnn3uu3lvkhrmrU/iLYVtp2gYsvhLzbkZIATV/0DGH
X-Google-Smtp-Source: AGHT+IG/jPYS5sRhAiOU1Ut2nosRbh1hUF6KcwbKLKt1k83KOZgeNvrJElJS48a61Zs79yLrzLokxg==
X-Received: by 2002:a05:6512:3ba1:b0:530:ae4a:58d0 with SMTP id 2adb3069b0e04-536587a40c6mr3414143e87.8.1725687212339;
        Fri, 06 Sep 2024 22:33:32 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8554:83ef:b48b:9bd4:f165? (p200300c78f2a855483efb48b9bd4f165.dip0.t-ipconnect.de. [2003:c7:8f2a:8554:83ef:b48b:9bd4:f165])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25952761sm30294066b.59.2024.09.06.22.33.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 22:33:32 -0700 (PDT)
Message-ID: <34c89f36-915f-49da-bea1-c9b9ffaab905@gmail.com>
Date: Sat, 7 Sep 2024 07:33:31 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8723bs: include: Fix spelling mistake in
 rtw_xmit.h
To: Roshan Khatri <topofeverest8848@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240906141024.10021-1-topofeverest8848@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240906141024.10021-1-topofeverest8848@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/6/24 16:10, Roshan Khatri wrote:
> This patch fixes spelling mistake to increase code readability
> and searching.
> 
> Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
> ---
>   drivers/staging/rtl8723bs/include/rtw_xmit.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
> index a3b4310caddf..544468f57692 100644
> --- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
> +++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
> @@ -15,7 +15,7 @@
>   
>   #define XMITBUF_ALIGN_SZ 512
>   
> -/*  xmit extension buff defination */
> +/*  xmit extension buff definition */
>   #define MAX_XMIT_EXTBUF_SZ	(1536)
>   #define NR_XMIT_EXTBUFF	(32)
>   

Hi Roshan,

please make a patch series out of this 4 emails. This makes handling 
easier for the maintainer and the reviewers.

If you send in a second version of this patch please use a change 
history. Description from Dan under:
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Thanks for your support.

Bye Philipp
