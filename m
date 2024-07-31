Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F113BBCC
	for <linux-staging@lists.linux.dev>; Wed, 31 Jul 2024 04:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722401926; cv=none; b=ICckMr9FGl1O74yU60zLqyoHs5yrEKSF+iGR/MRR2wkdc4nD9/FU3xC10+WlU3oU9RyUMjsMpYiDVM9fLbDm7KL4NTMFxL1N/JtiJlfAffJyqnkPSGrtFZtwAPjkHliqyrk1tRGl5KPsXJEVbZGHrzYVci/l0aY67xqHOa27tn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722401926; c=relaxed/simple;
	bh=NVUNyd4l8NBOU55aoxt7CFuV7mdL6LGF/55dnei9uSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j/juxWyQJHRj2yzffDonH1C0wFwGpj5no2wnSZtOchBmNrQYa7+Hash3n14Xo53mE8HkgP9ixrXgSrSCKdtZ+4m1eHobsEelWOTEKxHattzJ2w0je3mSgrlJAz/gl8t62O/wDgqkc0gq2uIPpsuctnYQ5Lw0LMQNMeRNcydPdts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M9HuKV66; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M9HuKV66"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5b1a0075074so445499a12.1
        for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 21:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722401922; x=1723006722; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/PsU4QPtdaw9JWR+k0QZBRBLHI6SUIxR1xLkmoJhO5M=;
        b=M9HuKV66YvskyX140Jo3+UagDSlK+fqhaH1jIK39/kAFPoGishSBkuYyVgoYFYuTU0
         tstmRDeC7qPMZIm7mLoVoJmI1AgZ7OnBwywQRbxt51zKAI777UF9zo3Brk/f3/TcHMuh
         3sxff3VcDIWG8VEsb53rBhAg8Pkb4GNCfXX6b5Az34uOqojH5waSLVR2vUtQZJjqAUVq
         4p2OJw8VbI+ATZuvcx2okXqi/ZFm/AqKuGLtzercmshosDgXYp9xu5zPV0J4R3sQ3HTP
         Jrp0LpcK0q0WL06wdLk3FjYfuc+ZxwVpcJcNUKB6GHIBNbulFbBAKXHKeUmF7zWd00YM
         sdHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722401922; x=1723006722;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/PsU4QPtdaw9JWR+k0QZBRBLHI6SUIxR1xLkmoJhO5M=;
        b=uVqZEBNyo0iDq9usKAERXgg2PCUxdfyYhjbMGDjPLQpL0/P6HnrYtf4MzzyIJJe6Hj
         +tosxPU5rkLmv2loUb8AvzBBF2LRiwgq7S5ismsaHjEZHKGXA7bOt/DqbWCUc8teFox0
         u8Xynmu2y4w43d+cSnyEdMtEJyhRw4RYyf9qRPI5F1XG4cJiPO39wMHEl4SEgN5l8xGu
         zDqmxKOM7CByVSUtrHNT04DsmHSkKoKndG2Qfg4Liomfbx2UmyGFdSf2Irl4BXTjz+Vm
         yks1tyNaSVHZkrLv++mbmIBRFsNjPB3Qup47WT3q924ORNGp5sb37jbMDc69cbbg6er9
         XtqQ==
X-Gm-Message-State: AOJu0YyZIpTet3CxDCZdPXmyckOClqox458TdfqHNrpzlIBZ2m0o4+JG
	DdVJOmgeRDlPVzxuyq00FJt02CMa8EZzhbhHTcgF/77K20tjqyFi
X-Google-Smtp-Source: AGHT+IFGDqLoeOpxPhFPUM5lpU6Hs665oeNWL989zgzESHN3kWkAZhdsEDEYm8cIBD6QNIKcrIUpmw==
X-Received: by 2002:a05:6402:524e:b0:5af:6c44:6807 with SMTP id 4fb4d7f45d1cf-5af6c44694fmr6970761a12.6.1722401922082;
        Tue, 30 Jul 2024 21:58:42 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8552:b861:5a1f:1e40:f01? (p200300c78f2a8552b8615a1f1e400f01.dip0.t-ipconnect.de. [2003:c7:8f2a:8552:b861:5a1f:1e40:f01])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ac63590585sm8162341a12.22.2024.07.30.21.58.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jul 2024 21:58:41 -0700 (PDT)
Message-ID: <80076244-4d77-45d9-a721-06664e11477e@gmail.com>
Date: Wed, 31 Jul 2024 06:58:40 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: rtl8723bs: Improve MAR register definition
 and usage
To: Manjae Cho <manjae.cho@samsung.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <CGME20240731004335epcas1p382229e79bdaf3f2d48b0f3faa7414ea6@epcas1p3.samsung.com>
 <20240730231046.412876-1-manjae.cho@samsung.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240730231046.412876-1-manjae.cho@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/31/24 01:10, Manjae Cho wrote:
> This patch improves the usage of the MAR register by updating the relevant
> macro definitions and ensuring consistent usage across the codebase.
> 
> Signed-off-by: Manjae Cho <manjae.cho@samsung.com>
> ---
> v2: Fix line length
> 
>   drivers/staging/rtl8723bs/include/hal_com_reg.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/hal_com_reg.h b/drivers/staging/rtl8723bs/include/hal_com_reg.h
> index baf326d53a46..93aa391fa749 100644
> --- a/drivers/staging/rtl8723bs/include/hal_com_reg.h
> +++ b/drivers/staging/rtl8723bs/include/hal_com_reg.h
> @@ -151,8 +151,8 @@
>   #define REG_BSSID						0x0618
>   #define REG_MAR							0x0620
>   
> -#define MAR0						REG_MAR		/* Multicast Address Register, Offset 0x0620-0x0623 */
> -#define MAR4						(REG_MAR + 4)	/* Multicast Address Register, Offset 0x0624-0x0627 */
> +#define MAR0		REG_MAR		/* Multicast Address Register, Offset 0x0620-0x0623 */
> +#define MAR4		(REG_MAR + 4)	/* Multicast Address Register, Offset 0x0624-0x0627 */
>   
>   #define REG_MAC_SPEC_SIFS				0x063A
>   /*  20100719 Joseph: Hardware register definition change. (HW datasheet v54) */

Hi Manjae,

this patch cannot be applied because you build it on top of your first 
patch which was not accepted. Please rebase this patch.

Thanks for your support.

Bye Philipp
