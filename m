Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D761BFDE1
	for <linux-staging@lists.linux.dev>; Thu, 12 Sep 2024 19:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726168282; cv=none; b=I8TsUOqawpV4TI9E5SFJ8+OIcspXyH3E4mEJGrQQQFU6A81FtQp0swxmMCidjWItoK+Yi3IvkZYcJP9O3/Okgj2QYcd9CwCjIPxrCt5PDWYOol1QfbDC8zKACDEDJFhct8ok1zHjcNc9IVX4ozS2ZgV1YDwG1PrdaS7XQKAa4Fo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726168282; c=relaxed/simple;
	bh=9pxMsq3kin+w7i0XPqkWPMNX75/Iai09DK3wFfzOpDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EI1T2j+TFQONUlDvCyCxkwoe26ofa8iVGM5NzCMpgaDd/E/jxwp+IUQ1XpiqHm0G7j35aArl1eYDN7s8o2y+Dff2nepiArwh/lSiNH4X8x8wk+gaLsow0vXUzORC9cPKJ+ZB4bl4tkM+SkTeqtMd4Yni/5vyqyheDbpwnaKusHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DqMIKVtv; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DqMIKVtv"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a8a6d1766a7so173091966b.3
        for <linux-staging@lists.linux.dev>; Thu, 12 Sep 2024 12:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726168279; x=1726773079; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Sl3/RAaMWaN7KZUdljkIsdyNaNAnnUZU/wp9mRU9gvs=;
        b=DqMIKVtvqQG/FnudnifkXMMLe58SOpRr3e9jFXjjn+IVnKkF+Ukpje1LIvG3jnnOUn
         TUT1VkTOEqiSenAkK0DTKRYObg/bhLRB4siR7t1WZNdLFCE7w306GKdjaPSR8Gx+xdH0
         x7qMA6L2vfIVYv3GX197u7huVzawECquJDooA2sdUGNHqyN/P6dRgLekwgqU/RXsfGZz
         MfQ/tm+0X176yeG1bXwPxIGxsgn8+0LFPC63p6zTEkyuCdc1nogycCdPjsD9u9ZzGmit
         3DBQ7wTejJJ++9mDAEzYnm4bsMqmOA9sh26RD1oiSQK03f9ZoiH45ZzAKSfgArUDNbdB
         aHRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726168279; x=1726773079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sl3/RAaMWaN7KZUdljkIsdyNaNAnnUZU/wp9mRU9gvs=;
        b=GOoy9BxqNs8dEkNpxEiP1yfeO/NDJ2IQNTugLDn/u+1LKfCFVx+/5nF8uWWAgXxaKT
         xu4lRlMqPIwF/ZAxuTzekXDVipLqY03pXFyB5DWg3nIE+GcHRhZxh8aKiFI70OOUoUF9
         p0QGjrZ2ZGqxdlCA4cEYW7vuVtK1+HW6cN5ob1znOcVaUfWtkmCzEloPn613l6a+6kUB
         6/QL+fmxGI0Pm/ABEoq5K2IDEbrmqQEjLpnbw/Hj3ygUaxiCf1Uwfe+sww1eibAji2Nn
         TF1Gi2nq0xrpTJJ48NXfMDsrw5xfkWhKLD4OtfHrJMHLmLwtoWRpV1MwTXoKNfBVslzn
         QRUw==
X-Gm-Message-State: AOJu0YwzC6fRbfvkFIJQ3Oo3axitLzIJ2SoU4HhATqXaba1b3PR9qi6s
	CCuSGpej+1/eT9tMTQPqeQ7bheTQORMYDC6i2bnPQ65Jjd4jqakgd/z+6/KB
X-Google-Smtp-Source: AGHT+IHcNFOerQ/D4yBwRvRNcqzJx7r0UcshDu8UsLrFetoBEvuzw+gxeLM+VCafpwaT0zaK4PgpqA==
X-Received: by 2002:a17:907:948c:b0:a71:ddb8:9394 with SMTP id a640c23a62f3a-a902961794emr374570166b.40.1726168278335;
        Thu, 12 Sep 2024 12:11:18 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8557:476b:8cfa:99ee:514e? (p200300c78f2a8557476b8cfa99ee514e.dip0.t-ipconnect.de. [2003:c7:8f2a:8557:476b:8cfa:99ee:514e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d7360f398sm418431166b.5.2024.09.12.12.11.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 12:11:18 -0700 (PDT)
Message-ID: <6141d6af-a959-41af-b612-33c8f4e16645@gmail.com>
Date: Thu, 12 Sep 2024 21:11:17 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: vt6655: mac.h: Fix possible precedence issue in
 macros
To: =?UTF-8?Q?Dominik_Karol_Pi=C4=85tkowski?=
 <dominik.karol.piatkowski@protonmail.com>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240911180149.14474-1-dominik.karol.piatkowski@protonmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240911180149.14474-1-dominik.karol.piatkowski@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/11/24 20:02, Dominik Karol Piątkowski wrote:
> It is safer to put macro arguments in parentheses. This way, accidental
> operator precedence issues can be avoided.
> 
> Signed-off-by: Dominik Karol Piątkowski <dominik.karol.piatkowski@protonmail.com>
> ---
>   drivers/staging/vt6655/mac.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
> index acf931c3f5fd..a33af2852227 100644
> --- a/drivers/staging/vt6655/mac.h
> +++ b/drivers/staging/vt6655/mac.h
> @@ -537,9 +537,9 @@
>   
>   /*---------------------  Export Macros ------------------------------*/
>   
> -#define VT6655_MAC_SELECT_PAGE0(iobase) iowrite8(0, iobase + MAC_REG_PAGE1SEL)
> +#define VT6655_MAC_SELECT_PAGE0(iobase) iowrite8(0, (iobase) + MAC_REG_PAGE1SEL)
>   
> -#define VT6655_MAC_SELECT_PAGE1(iobase) iowrite8(1, iobase + MAC_REG_PAGE1SEL)
> +#define VT6655_MAC_SELECT_PAGE1(iobase) iowrite8(1, (iobase) + MAC_REG_PAGE1SEL)
>   
>   #define MAKEWORD(lb, hb) \
>   	((unsigned short)(((unsigned char)(lb)) | (((unsigned short)((unsigned char)(hb))) << 8)))


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
