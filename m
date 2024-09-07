Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B13532C8E
	for <linux-staging@lists.linux.dev>; Sat,  7 Sep 2024 05:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725687232; cv=none; b=XCMm2Jb9X6ce2N5PDOEUoXT8jasYWNPViVD1J4XUigkhHUmRj7BMdu6E1VRwwcGxoLCoTxvTadUYyNEw06psEwAwFnzDrmdnY3LREQJEwHeH2l8YjEspwqb3nN1i82PaO8QDnUWkUVc5KdsCjhWQt7beWvq4hYze8O2Z6fA+3FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725687232; c=relaxed/simple;
	bh=+H/I7whN0NNpqToF+5fYnih+o16BXEJ7heTUY/b5+T0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Nre8WShQwU1m4hW0vxVwavHvykWJGgZgLr4R4SLir2Zx9pnbqoa21dlCNgeX9tJAA7oyQVMKTXKQHG/182DZKt9s5Oz5RcCOIHeme+A3VHg9vJYU2jfyPy2mtdfx7afSAUp7xqPyy+lEIe9lAdho9iB8EfU1STr2nMPLlDfUlNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M3ltPe1m; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M3ltPe1m"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c245c62362so3487600a12.0
        for <linux-staging@lists.linux.dev>; Fri, 06 Sep 2024 22:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725687229; x=1726292029; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZM2s1Cg/60GKM8GyEK8yuEznjDVkHGQO4WsXgAoE8Tk=;
        b=M3ltPe1mHAYolXF0oDE1EoDODbq0cm5zxpnByyTT3iPgXIjdg7LyB1LtfunNHIN2ge
         SXACwr/AqZ3l0mHaAPkMbmAeHDLdQUfFoDoICA5/r9O3lo5odO0CzWq9vnfUMDhIN8Fx
         PhTVZndH/XCrCwPUyZdwMOsbUBREBvYTZKcM9r9B9/8/xY3l3iFz2tY80tfQpvmY7hgC
         3uUS5Yp3YIi2ZsP5nygdw6NhddLraE7XKWJiqPHV9JV9vxV4PpOo+5D8hnOGRUJgfJ+I
         Cx1c4tHmL7GVj4K+RdhqbfcpcRSzu9+A/rYeHJU7siiDv/MN0JctqteUgzxFP/CltFIC
         6Y/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725687229; x=1726292029;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZM2s1Cg/60GKM8GyEK8yuEznjDVkHGQO4WsXgAoE8Tk=;
        b=wCeSk58eBfusWZs2mMmIqmoKlgstkuz8lNRGys1iiVTToFMUIpGfblJwdZnSW9+XP6
         5pbeRoObEB56nhZxxnWBlepI+qaAlKfryBXpQ/6ubDbFrvZpi0FYjircAU/LVnqJqUFP
         WqqcPrHLGFhkryAAZEEZp+Zv+4lWiUcHdLPSWjm3N4VzORYqAxXp7kgIR5MGzSZQipa4
         5xKXubTtYrV8p/mdqb6DzUQknkzjzYHmaDuoOVYcseT3l38ft5TXY4gysVoi+SRf8vHi
         3sQ80m7thqiqcl+pC53zD14EkYAR6Fw1ZXAleWHjt/FHuDerdRwVbB5l8HeEVVhb0Ltu
         Ms2g==
X-Gm-Message-State: AOJu0YxGOGby1JS7b7ziSbZC121zUjrCo/c+fCHJYgImiZmxgdd8rqkE
	oJwLMaVUTBKy0fxp0AhGqiZJkb9GfDccnIfOwGfPoLVfXSMrVWAR/geUJ4R5
X-Google-Smtp-Source: AGHT+IG7GzWFmsfvVo1AaQt75WN4uxIiwobekgFNnbMDqyvyn1poRmtdtfnUTPFBzy/UFNfiQCgljQ==
X-Received: by 2002:a05:6402:43ce:b0:5bf:2577:4346 with SMTP id 4fb4d7f45d1cf-5c3dc79a821mr3416162a12.15.1725687228698;
        Fri, 06 Sep 2024 22:33:48 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8554:83ef:b48b:9bd4:f165? (p200300c78f2a855483efb48b9bd4f165.dip0.t-ipconnect.de. [2003:c7:8f2a:8554:83ef:b48b:9bd4:f165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd76f8bsm257776a12.76.2024.09.06.22.33.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 22:33:48 -0700 (PDT)
Message-ID: <5aeb10e7-bf33-431b-9669-133cda54d5d3@gmail.com>
Date: Sat, 7 Sep 2024 07:33:47 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8723bs: include: Fix spelling mistake in
 rtw_io.h
To: Roshan Khatri <topofeverest8848@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240906141104.10076-1-topofeverest8848@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240906141104.10076-1-topofeverest8848@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/6/24 16:11, Roshan Khatri wrote:
> This patch fixes spelling mistake to increase code readability
> and searching.
> 
> Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
> ---
>   drivers/staging/rtl8723bs/include/rtw_io.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/rtw_io.h b/drivers/staging/rtl8723bs/include/rtw_io.h
> index be9741a056e5..0ee87be6dc4f 100644
> --- a/drivers/staging/rtl8723bs/include/rtw_io.h
> +++ b/drivers/staging/rtl8723bs/include/rtw_io.h
> @@ -13,7 +13,7 @@
>   	Otherwise, io_handler will free io_req
>   */
>   
> -/* below is for the intf_option bit defition... */
> +/* below is for the intf_option bit definition... */
>   
>   struct intf_priv;
>   struct intf_hdl;

Hi Roshan,

please make a patch series out of this 4 emails. This makes handling 
easier for the maintainer and the reviewers.

If you send in a second version of this patch please use a change 
history. Description from Dan under:
https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Thanks for your support.

Bye Philipp
