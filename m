Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41E6256C6C
	for <linux-staging@lists.linux.dev>; Fri,  6 Mar 2026 05:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772773313; cv=none; b=LBNkjj3ynEnf923SItx0g+YFSOOc4J5AIyarXGgKf5p9uD8Xrsud+uOzBDcVRYs81IkszCauhjjjg64O0McOLsed0R3noEpxv5jHrA0ceZnijqm8Js7v6xEDgMN4WdmYuZGUARHhu+RD0jLSUHRr95aqs2cTM2zI+/Y8RP/gYSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772773313; c=relaxed/simple;
	bh=0FRD0QRHdzRldm1DiD+yn1zQIPJEYy90DqSX29PA5Dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NRNTPii9pMhmoxSY6GKMrUWPBNMWMUZZvolCKU7PgioCvnCqyNB8FtcEj+Ss0VM+2XmoSvAhfJbX6rDnNfJ8MYaj+HzwEwdrQBYKDZp03k7TAG0oYoxAlcngsZzLhSPn5bQW5XJWdXybdTnchufMNLiB3ZYJJ2lLdpAQpknixCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HnEdo9Hc; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HnEdo9Hc"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8299f1ca894so270184b3a.2
        for <linux-staging@lists.linux.dev>; Thu, 05 Mar 2026 21:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772773312; x=1773378112; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F2NSHn3l4Sdh0HRvlD9q+A1JuCJs1Cpida7EqqJ+gJo=;
        b=HnEdo9HcuVt7L3ndezT7RJfFQtfm1r/Stodg1+z5A3+GCcHVgPZmy5VwQ6h/lT+nyP
         bzVVi4w+lm+JBmiO8jw3LDhx7cGC1HKYryfoRr+JI6YXoIxiJelbldwULCmUpwPxVNVD
         2K4Mdzz0HzrQWsX9Wac65+zwc7xWpYFfzmOwhx2B1Exi9ac9CIJEpSbWL7klU9F3Ytaf
         H4iQJP2kBrU+hPGoIxXVKj0/1bAKxA2P6Q3pHCWY9Jlj0CO5DRfNfPyQHNv1/8qtkrMU
         RbqL+d48Dg3lxKurN9gJS2sfp2hY+jEC19/RJLOLCPxFytXRCXNt4QUqv4LFaTdjLn4M
         0k3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772773312; x=1773378112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F2NSHn3l4Sdh0HRvlD9q+A1JuCJs1Cpida7EqqJ+gJo=;
        b=Dih2TY83be0aX1FGpk+odOwPi/cKMVahcyM+oR8x1Kz/rK7QRfvvnSachko7y9ZRkC
         zItWHhgec6ws/dzKXd0AFl2etAwj08DPquUjzBAY7f29G/SdaUFlP8ChreRWlmWbivr3
         r2tG+dc2v+n5qOfNi8ZGHHbYJix10z+h7/2+8OedhocWajLnpfGVWD9WiBO+P+7ojBBc
         677+6+6H4SuyOvZ7DPdO0t2/eTm0srUeohhffoS2B+sJk6riL5cxXPbgCAyTWo64jqdl
         wPP4OZS7AZu54yTqvLRRxCzpItvLMXIda/urqnCN+ph+Pt9AfQslXKWXpSE4vjQ9h4Nr
         FA5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVPfMijNmw1GR7lr019E8+MD3Q3C/3gmBhLIcdsM29aKwCrmSa39bVNy62a8xLVGMhQu50k672oaaEf+VyF@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9ZJCIe/+HlzhFkqIFiPYiWDfJFZs8CSNzZZ6WEiVlgfg/jT/R
	xsJn8PTeADgSsFyU8VFGHLY7uKcjAyfskRkqkAv3F1QJSOGFEJdSRZOQ
X-Gm-Gg: ATEYQzyE6QK9GKPRDo7DFJAwikEk8gN4RFknXhG7xY8ryfamwsT4tZNA4TLvjiGYqsj
	ra+lZQAxbybyYQ3FoXXJMeiqc3zMva1iMD863KHDrFwg1Inir37C45WhYGDXZ9TtUR8YYW2+/Ji
	ksrlT0CY8/Ck95tJ4/u3g5ZZezRZsrrP5slasCgMah3L8eW7X0be8KA+ex62DogO0osT4r+Iqda
	JxoKRSthNJyrqWT4MiksBwdtLEWJZ/UKptvBGDuMJ1emP6BySn6mppMezSRnHrOatflCt78aVy1
	lBdVsKR6PuTX2AJg1C0tr43ybDEylqxIrNm4zV9OiIf3QD0epbVpiO9o4W30gYOhsOKlNqp9yA/
	mN/yuU3kbmlSFjIPgJKpvOUzGAuz5y3ZmzlOfSn2KqDMBf2GBgMmzeCF5r/3nZHLYM3gNZ8CtBR
	HkjxR1e9c3V4iWxvwlsjbz6m5DOw==
X-Received: by 2002:a05:6a00:8d3:b0:827:32dd:59d8 with SMTP id d2e1a72fcca58-829a2db98e2mr870478b3a.16.1772773312001;
        Thu, 05 Mar 2026 21:01:52 -0800 (PST)
Received: from localhost ([2001:da8:e000:1218:8c58:2092:77fb:d72e])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-829a48a5c72sm341965b3a.51.2026.03.05.21.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 21:01:51 -0800 (PST)
Date: Fri, 6 Mar 2026 13:01:48 +0800
From: Avon Hermit <avon.hermit@gmail.com>
To: Marc Dietrich <marvin24@gmx.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	ac100@lists.launchpad.net, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: nvec: fix block comment style
Message-ID: <aapfvNobk8atPbyY@general>
References: <20260304054727.70113-1-avon.hermit@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304054727.70113-1-avon.hermit@gmail.com>

Hi,

Sorry, I didn't notice the earlier patch.
Please ignore this one.

Thanks,
Avon

On Wed, Mar 04, 2026 at 01:47:20PM +0800, Avon-Hermit wrote:
> Convert a block comment describing the AP20 hardware bug workaround
> to the preferred kernel block comment format.
> 
> This change only adjusts the comment style and does not modify the
> behavior of the driver.
> 
> Signed-off-by: Avon-Hermit <avon.hermit@gmail.com>
> ---
>  drivers/staging/nvec/nvec.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index e9af66a08448..736f11942174 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -659,8 +659,9 @@ static irqreturn_t nvec_interrupt(int irq, void *dev)
>  			nvec_tx_set(nvec);
>  			to_send = nvec->tx->data[0];
>  			nvec->tx->pos = 1;
> -			/* delay ACK due to AP20 HW Bug
> -			   do not replace by usleep_range */
> +			/*
> +			 * Delay ACK due to AP20 HW Bug; do not replace by usleep_range.
> +			 */
>  			udelay(33);
>  		} else if (status == (I2C_SL_IRQ)) {
>  			nvec->rx->data[1] = received;
> -- 
> 2.47.3
> 
