Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4719253F00
	for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 14:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752677362; cv=none; b=af+sQe8x7DBCEtzzj3K/y4y05n2lqswBYA1BA15PwK5fNDkqPRtRlvWGifhgY0+Drlf4ftvrZUSvWbL6IQsnJ5Yv5wsHbW9+OEjGeHFqRFgSYJF4D+I0PaQ+WE0BN7d4vYb5LBWqZGvJuvPH2OMTkbOKHXnbDGfA0FdrwTFJ7cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752677362; c=relaxed/simple;
	bh=rb+JcVig+1JxVAXB+2ujL08krPkxo/YfrGlS7HNGBZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jxkMRonT4lKbP4tu1EyVZ5LpLvwuJVRMbr5ciqOZAbLg1Grj4X1cjnn3vVhOkH5+7d9RkBfkYjwJr++8cgl2+aGUChs+V6OPi64dvBR7ROnU94HS2Hurcwqd2+8BtrJYKjpXI0DqfWZnqvkhoUvnjw4GktXQp094b3OT5Jd2jto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J+B3lFhC; arc=none smtp.client-ip=209.85.210.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J+B3lFhC"
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-73e586fcc28so583123a34.0
        for <linux-staging@lists.linux.dev>; Wed, 16 Jul 2025 07:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752677359; x=1753282159; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IsCfdjXlvijfA91XUA0RoS/QIVlPjo3qX7wrVxeu8Tg=;
        b=J+B3lFhCzcANcVV4dDpGGGqvVYjYYk0UWBa8l/QaKv5NjGNxXdZ9trE0Gfp+iZgjUz
         PpzPU4AK6rcrffe3BXS2ELxObLvkeUTxsvOjvad/IHOdRvVmR1i9oPRwH0BJWrcKRena
         hSe1uIR1YoErASVWph4TNDcQSW+EhfQ7sU3D1fs+Rr/HN9P7PnEkAwFRywDDDR3qqW00
         zQJf7i8O+wV+bBnufgw9STSEHUBm6BZvn7X38Jg/0lLdFYP6lTQNix0n1hoJCSk56Ieq
         lp4bhBc7U1LOaDHPqTA8e93frI+tRw15HTVE7B0YNSh+RrG3PYsSMrs9XW4WomwaO72K
         gc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752677359; x=1753282159;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IsCfdjXlvijfA91XUA0RoS/QIVlPjo3qX7wrVxeu8Tg=;
        b=gyv0xeC7Jf2ARxo4rDau2hJ4GuaZw54BJiFpjORObTxrnyYBSt1QKiIyMKxHxEMOuv
         ihKw7VTSiIGC6gnStWmafnqMN3rgm8Dry7yFXFI5gjqMKrza9PbBPnrZvIm7ITl3T+uB
         aTmeZXjiRthvOVYl7LVWsEjt8UQK0h5WEgCvHTVTHr19V5CHqrfadUOH67hKd8FgTG9a
         n5NWAn8/jegKs0+BzgoxpCENxjNNaOfa0A20rRiWqMFPhTNEbs1EKmhjpJ5p4kGCRgdf
         +rTrac51OCXrpGhwM9Soz4LVdoYLZMZTNUx4EPjnEzTwnsJrL2kBRC07DCFepCz7GHFI
         v6mA==
X-Forwarded-Encrypted: i=1; AJvYcCVKctJSYwOj3Vnu1qRF8W2psL37MF/QnfN1plAkNn7U1eeRFyCnNzyra2+6T5wpTug4dAdvMwMsugVL+VeG@lists.linux.dev
X-Gm-Message-State: AOJu0YxNygVtjLUSMeWn4ekO+5wyPcD9fLII4vcNdkArpQpU/KbcpsZ3
	gpIKGpeD+UcWgOvv+Df4+8UpiHZOEu6+ZxDWhLqCTHTQN4vUzwFxquyV+KWnCZw2xWI4TPGc/gt
	ZHS3s
X-Gm-Gg: ASbGncuNyWY6wCWca8khHlXctgr846XnftzOgXpxK16gXq7fWIxvzcNBdJGRN6Kqvwr
	C1gdmvYHaZhj6QAg7by9QFZhwGud34KnJ3D520Ikw+mWsj/nVnTXbf4mvEoumrnK7BZ1A5NiRmz
	C1mND8uzqU4vAY+HXqZZzb14XfvzITBX+l9COcX+pfl4XovvQZfMUkgvNqq7vAuX5JbRG/50A0z
	ipZ6mCVcvjKxQKa1Z41Pdlled0zhTRSc+7bXDZ4TAjDU9LAjEHOmJCTxLhXsBfYhhvoYzqie4qb
	PtBlaAnmP65e3TnH4vjLbbyfKhdwv4434QMUjHILacjwvBqtIDe5Fs9iYHJSw2OFrsl9hk9+pmq
	/LyJqlKAhbaZsCuqn8v+0m2emq/7O
X-Google-Smtp-Source: AGHT+IGr+PaLVt+okTkyHFXFyqJwvz0KNCEPfk2u3WIVNq2/RJzyGGS2Wi1+QcalWaannwCfQj+XVQ==
X-Received: by 2002:a05:6830:668b:b0:73c:e6de:88a1 with SMTP id 46e09a7af769-73e652b3a70mr3551654a34.10.1752677359541;
        Wed, 16 Jul 2025 07:49:19 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:2564:68a3:7d6:cb7d])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73cf10ac870sm3025163a34.28.2025.07.16.07.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 07:49:19 -0700 (PDT)
Date: Wed, 16 Jul 2025 17:49:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ignacio =?iso-8859-1?Q?Pe=F1a?= <ignacio.pena87@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 1/3] staging: rtl8723bs: remove unnecessary comment
 separator lines
Message-ID: <21139f7a-207e-4770-8387-c408bab8de9f@suswa.mountain>
References: <20250716113740.73025-1-ignacio.pena87@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250716113740.73025-1-ignacio.pena87@gmail.com>

On Wed, Jul 16, 2025 at 07:37:38AM -0400, Ignacio Peña wrote:
> From: Ignacio Pena <ignacio.pena87@gmail.com>
> 
> Remove the long dashed separator lines from block comments as they
> don't follow kernel coding style, as suggested by Greg KH.
> 
> Signed-off-by: Ignacio Pena <ignacio.pena87@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_efuse.c | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> index 7a74b011d..abc123def 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> @@ -70,7 +70,6 @@ Efuse_Write1ByteToFakeContent(u16 Offset, u8 Value)
>   * When			Who		Remark
>   * 11/17/2008	MHC		Create Version 0.
>   *
> - *---------------------------------------------------------------------------*/
>  void

How is this supposed to compile?

regards,
dan carpenter

