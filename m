Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BEC1A3027
	for <linux-staging@lists.linux.dev>; Mon,  2 Sep 2024 17:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725298680; cv=none; b=h16WqTVFMjTsIOR3H+N5vGzoIDkmZcOw7S06xoG33Uvkp8HIMpHzVCTZq8+tL3IgMjHUW1jHL7tr9wP9zKIW5YxawKBfQmYFfPtsVbPz4b+KlRbsXIXso/jI3XIfUiO9vvBbzIZIdeZze1waMhqsTojBxtl9Gydn548kMY22JEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725298680; c=relaxed/simple;
	bh=2LyLJFBJOmpkyHgmBU0Wd4Kf38GorrwZA3ZkiceVJ80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mVCLDfeM5KxJ6OS3r7/aJJsFXj9W54jDcZZ0URrAw/WzMMW5ycxpnUeYd7smM+dBNP0b6N6LFqicX7ZnLCiD9r8q97rV5rJi10FJmwLzbKl89Zw+SA7T6szZ1MctKShjpBrh0i3K8QdUYVYlDqWC9O2upRPcg0hPLW/w+v2aMrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KjANC/GL; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KjANC/GL"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a86e9db75b9so483481866b.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Sep 2024 10:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725298677; x=1725903477; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LlYC5+UWRQW9485wkiPs3igaS2O+2Vwz4uQskFYOh6o=;
        b=KjANC/GLNnOEdQT8/ueSUsbe3hoYUFAqwb95Iu60bvih21pCP1iGdXP/xuiDz8f55I
         PWloz08VEXPJPMyGDUO1ErjV0ppcjLsX/e9XLRYzdkMhDGzRy7Z9MWAIwjuzAC/1Xqm9
         bGl3Ha/fYN63MbyJcSx73uCmbp8IE+4wmUNkI+oKpk8iuuoWPG06nJkmXjJZdL9krhr9
         hkzLmkQpFwHF3+zRnIfIzpYwJduCl+HX0/pE7nsp/pQvNKQEeOtxT2EejYriOYh/dA3X
         Jd4Nsy6r3E6SgYj4y4iXFlNVAdsDNF+NXHzGBc2NHx52wDph7QgD+kY3tDn1xnjBRl4D
         D+qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725298677; x=1725903477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LlYC5+UWRQW9485wkiPs3igaS2O+2Vwz4uQskFYOh6o=;
        b=KCPJ3nJY8KqdaE5m4/ZcDGv3o3uJNpF/k0ZrA9i+zLMSRqj+tJ/UxZuY0k5U4deEIx
         FDmNQCcm9QeWUPd4uR+zj6ncjk6SsGgzaXzkCQU1Q9dn9mxlDjjhPjprXk4l3L25iC8r
         MnXdWlPuGBjSNdWipYHvPgZw26vY72xzLCw2BBRvk/1gNvsfYKZkX0VlG6zl4DOaWuDm
         hHaCvuWbplosZ9RR1KmkMlVcZ0pVGznOkyWL6VLn8drtMFTQd7m2pXrjnqhSexGK1SdV
         16COjBjpdNaDP2PhKYU2wp71c+WySqVgJgzVb2QqU75IsY2i+HaZ9uV7MUs5n0sRStac
         Da9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXQ/iQCUGOBZ0DK8CkfZCEobdtBbYGg1I84J6AZjN37DP/FV1qNcDqhBAmvUHZ+cV3tzKm+4CnI5/TcPRrt@lists.linux.dev
X-Gm-Message-State: AOJu0YzRGkWXQivsZ2meACZqtlQFXoDJOWyaPZnN6TgNXj+UduowKpv/
	ezdm98lStF1I486SpgzSasztGAhT11JBMqSe3iL7KN9vXzp5tPa/
X-Google-Smtp-Source: AGHT+IE72WMG+NfpRJWbufPMuI0nhMrpl2JfY4rFg8iprwK9c4YxYynUgwNJPBlebwy8FnMGyuHzDA==
X-Received: by 2002:a17:907:3fa6:b0:a86:b00a:7a27 with SMTP id a640c23a62f3a-a8a1d5708a2mr73755466b.60.1725298677132;
        Mon, 02 Sep 2024 10:37:57 -0700 (PDT)
Received: from [192.168.0.104] (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8988feb0f0sm582173366b.20.2024.09.02.10.37.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Sep 2024 10:37:56 -0700 (PDT)
Message-ID: <cd97d2eb-25d9-423b-9037-c4cc3816a760@gmail.com>
Date: Mon, 2 Sep 2024 19:37:56 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8192e: Constify struct pci_device_id
To: Riyan Dhiman <riyandhiman14@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
References: <20240831160831.121720-1-riyandhiman14@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240831160831.121720-1-riyandhiman14@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/31/24 18:08, Riyan Dhiman wrote:
> static variable struct pci_device_id rtl8192_pci_id_tbl is not modified
> in file rtl_core.c.
> 
> Constifying this structure moves some data to a read-only section, so
> increase overall security.
> 
> Before
> ======
>     text	   data	    bss	    dec	    hex	filename
>    17838	    893	      1	  18732	   492c	drivers/staging/rtl8192e/rtl8192e/rtl_core.o
> 
> After
> =====
>    text	   data	    bss	    dec	    hex	filename
>    18006	    725	      1	  18732	   492c	drivers/staging/rtl8192e/rtl8192e/rtl_core.o
> 
> Signed-off-by: Riyan Dhiman <riyandhiman14@gmail.com>
> ---
> Compile tested only
> --
>   drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
> index ad21263e725f..22a203d01b8a 100644
> --- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
> +++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
> @@ -25,7 +25,7 @@
>   int hwwep = 1;
>   static char *ifname = "wlan%d";
>   
> -static struct pci_device_id rtl8192_pci_id_tbl[] = {
> +static const struct pci_device_id rtl8192_pci_id_tbl[] = {
>   	{PCI_DEVICE(0x10ec, 0x8192)},
>   	{PCI_DEVICE(0x07aa, 0x0044)},
>   	{PCI_DEVICE(0x07aa, 0x0047)},


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
