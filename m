Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3181D1B29A9
	for <linux-staging@lists.linux.dev>; Wed, 11 Sep 2024 18:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726077848; cv=none; b=ChToAN094RBRk3dQ/lerDnBL1RuHzDk6IDBFPeni+JyIq8IkUKksnD/GCfcnr+MPt6lZnyoc6RGflclSQZ6ChDsT9TjtBG4KrgbevI5TgU2c8VaeAo2N1dcTtPtGIFdCUAkshk5rvEXOV/Dhf4Vx6VXddD1JCbbmWGW1chFGiBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726077848; c=relaxed/simple;
	bh=Rw0HYoUjUK+L3ACEPUXcViiOi8IqipyTgLTRVmCtdpY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aLC5QGWFScLy9KgeEFY72nAluQGkc7NRvHY/eI8nk7o5moKwD58/iGmKJaM71ToEWbQK3KlvlBSP2HJFizffBEMPicAk/gcd6GAw2gZqnwyLZaanAjIKhNZ8CmCtajc+vuKwVVvmC7A7KIFiKy5g448PKmcnr9HA68Q6AG1MrW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g8Zfsl5d; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g8Zfsl5d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726077845;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IH+Ib1b5pn8WaOZaeFGsrZvEitMV86mg5/DLE/udy2g=;
	b=g8Zfsl5dFjjTXGulzhBcLbq881UbkUizKWo5BxgrTzMy9P8IZMd2hyUEcqCD7A+RTR0eM4
	xetL220vYpdSbUs91s4eRTz2iMMiuZ7sQM+pS5O/IuM0h+80sg0clgDvMmJSJhEaheHU04
	3NBEIVkc6dPHI2uRbLpvVBHinll8KnM=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-PtckC-w9M5mKghzqCkoaBQ-1; Wed, 11 Sep 2024 14:04:02 -0400
X-MC-Unique: PtckC-w9M5mKghzqCkoaBQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a870f3a65a0so7631066b.0
        for <linux-staging@lists.linux.dev>; Wed, 11 Sep 2024 11:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726077841; x=1726682641;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IH+Ib1b5pn8WaOZaeFGsrZvEitMV86mg5/DLE/udy2g=;
        b=aLGxJyZNSRT7gBRyZgPlAzZ8lU87Kuc/zmidTuc7HRdscBGgnXAwvLUIfwuPegGpNS
         1dVioIsqK1SOqpW+hr7rgtJnFD5V/L7gpjmP4sP5QuJ5gO8bibqRmC7JmINiE1FSkSsq
         w+uZkWF3/L5HEkTiTzOWcWy7tppX9udjZZVVEUf+DoTtz1DJYl4o7KrGJt0USZtk8bxr
         F3CcooFH9p94NzgOvgPTIdrLcdXcBZtC6rzNSWiqHcgA2hgFQxfSD+NxmuIrE26+2rZO
         uxB7H/MQ9Vylv9QKu9iGyFEgkuiYsBcuDkhlWFn3fP2h8hJRLbFAbB6AeZwOK/bBh4HZ
         7Slw==
X-Forwarded-Encrypted: i=1; AJvYcCVzN9UdKqf1xKpZWDyoxQr9liwJRJyR0GQsM/zUWEehvla1V/OstIxuWdqtUrQlGhp4KqACHJCEsKOjX66O@lists.linux.dev
X-Gm-Message-State: AOJu0Ywwfs/9thTCvZABGNhEtVbbPfjGz8BU/au1NdzhMk5pKrLE4HRg
	rg1I9Qn55pTcuOfPYjcopX5AYeKHu1XcnizvOekH079dtBa/wqmQmdfnqSyte0lC1ISnVxAycOO
	8X/UlNFLp4he0W6Cl4QZChSjG1hXkVMYtBA0HKAjUvinypDhDQgngHQ95CoJFOfQ=
X-Received: by 2002:a17:907:3e1d:b0:a83:8591:7505 with SMTP id a640c23a62f3a-a902966f459mr27778766b.59.1726077840913;
        Wed, 11 Sep 2024 11:04:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGiOUHQziAMSw1ySVvdKoiB3VewkXKRFTMsAed1ndUNhLmUSoKhACnYsZh/d6DuW5PXkj6CQ==
X-Received: by 2002:a17:907:3e1d:b0:a83:8591:7505 with SMTP id a640c23a62f3a-a902966f459mr27774766b.59.1726077840333;
        Wed, 11 Sep 2024 11:04:00 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25a079bcsm638970366b.83.2024.09.11.11.03.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 11:03:59 -0700 (PDT)
Message-ID: <bfd0243f-9159-4397-9f8a-e26372ce85a5@redhat.com>
Date: Wed, 11 Sep 2024 20:03:58 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hotfix 6.11 v2 3/3] minmax: reduce min/max macro expansion
 in atomisp driver
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Richard Narron <richard@aaazen.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marcin Wojtas <marcin.s.wojtas@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S . Miller"
 <davem@davemloft.net>, Arnd Bergmann <arnd@kernel.org>,
 Linus Torvalds <torvalds@linuxfoundation.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-mm@kvack.org,
 Andrew Lunn <andrew@lunn.ch>, Dan Carpenter <dan.carpenter@linaro.org>,
 stable@vger.kernel.org
References: <cover.1726074904.git.lorenzo.stoakes@oracle.com>
 <b38d8936eaddd524d19823f7429138e2ef24e0d1.1726074904.git.lorenzo.stoakes@oracle.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <b38d8936eaddd524d19823f7429138e2ef24e0d1.1726074904.git.lorenzo.stoakes@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9/11/24 7:51 PM, Lorenzo Stoakes wrote:
> Avoid unnecessary nested min()/max() which results in egregious macro
> expansion. Use clamp_t() as this introduces the least possible expansion.
> 
> Not doing so results in an impact on build times.
> 
> This resolves an issue with slackware 15.0 32-bit compilation as reported
> by Richard Narron.
> 
> Presumably the min/max fixups would be difficult to backport, this patch
> should be easier and fix's Richard's problem in 5.15.
> 
> Reported-by: Richard Narron <richard@aaazen.com>
> Closes: https://lore.kernel.org/all/4a5321bd-b1f-1832-f0c-cea8694dc5aa@aaazen.com/
> Fixes: 867046cc7027 ("minmax: relax check to allow comparison between unsigned arguments and signed constants")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans




> ---
>  .../staging/media/atomisp/pci/sh_css_frac.h   | 26 ++++++++++++++-----
>  1 file changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_frac.h b/drivers/staging/media/atomisp/pci/sh_css_frac.h
> index b90b5b330dfa..8ba65161f7a9 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_frac.h
> +++ b/drivers/staging/media/atomisp/pci/sh_css_frac.h
> @@ -32,12 +32,24 @@
>  #define uISP_VAL_MAX		      ((unsigned int)((1 << uISP_REG_BIT) - 1))
> 
>  /* a:fraction bits for 16bit precision, b:fraction bits for ISP precision */
> -#define sDIGIT_FITTING(v, a, b) \
> -	min_t(int, max_t(int, (((v) >> sSHIFT) >> max(sFRACTION_BITS_FITTING(a) - (b), 0)), \
> -	  sISP_VAL_MIN), sISP_VAL_MAX)
> -#define uDIGIT_FITTING(v, a, b) \
> -	min((unsigned int)max((unsigned)(((v) >> uSHIFT) \
> -	>> max((int)(uFRACTION_BITS_FITTING(a) - (b)), 0)), \
> -	  uISP_VAL_MIN), uISP_VAL_MAX)
> +static inline int sDIGIT_FITTING(int v, int a, int b)
> +{
> +	int fit_shift = sFRACTION_BITS_FITTING(a) - b;
> +
> +	v >>= sSHIFT;
> +	v >>= fit_shift > 0 ? fit_shift : 0;
> +
> +	return clamp_t(int, v, sISP_VAL_MIN, sISP_VAL_MAX);
> +}
> +
> +static inline unsigned int uDIGIT_FITTING(unsigned int v, int a, int b)
> +{
> +	int fit_shift = uFRACTION_BITS_FITTING(a) - b;
> +
> +	v >>= uSHIFT;
> +	v >>= fit_shift > 0 ? fit_shift : 0;
> +
> +	return clamp_t(unsigned int, v, uISP_VAL_MIN, uISP_VAL_MAX);
> +}
> 
>  #endif /* __SH_CSS_FRAC_H */
> --
> 2.46.0
> 

