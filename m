Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4396032572F
	for <linux-staging@lists.linux.dev>; Wed, 11 Mar 2026 06:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773212063; cv=none; b=YucmC0FJeoXpBqmYwkm1VYrY2HNzC0CU+F1G6bKm5PGgkCe8m/A3irk0FIdsF3tDtf90rvRv4fXCGghMJro4mvsA8zDtvsOUSXuEqGiJa7rBbC4u1BD/ST1BsCBkKVgxNvt8lZY6OarJdPSYe6K8dywwpoUpyWGdxJFX9lygFGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773212063; c=relaxed/simple;
	bh=UVRKAdZHojHmopPQfckr6WfYfaCPtUN605Fdvm8Mskc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JlMDgrRHCHf/FGym0ylyHmVHkvmZd6w7m/+rF9TxZXXSBa7QKbO5BNOcRf0umc/PhPFlT0e3c6/3ZrEkCbXKCGbQFEtHioVca7QrgqhBvPjW6rXggr5cv5xui46+WtjRrv5BuAFYxDdf2QfkK1r07V3VE43Piy1jwcTxOr2oC9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WK5OiSt4; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WK5OiSt4"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4852a8482fcso42070425e9.3
        for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 23:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773212061; x=1773816861; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lF5ZKsF6F7Qr5iBaoEQm8iifpJM4zWXRKtFu+dhnmr8=;
        b=WK5OiSt4Bl6T87lNmxwQAR3GxFDEKH9nlK0WiKcS85NpAuckTkc+5YZH2MIcXatOIf
         ErGXsIxci5lZXB8BUd083jpVCvef+F1ebKnjhtLXNhI6F8wMPgRHRia6g/rxMdA6T9Wj
         /qSHcx1pIhAExJXeMYaOuEwESV49F1ry6C7y79sRZ6D6xzSSISHPI4iLBQ0M096l/jOh
         H87F3YQXirtIBO9VR4hLAXXnIZ8mVTK+mFNw0BzCiKy9OQyPBXbAHeSLG0pOvQAt9w58
         1VDctYECxo1JIVp5iSSHKILWsJUaUVLQT0sEU0/1+yNVg7bTPoiye5L5C7TLu5+TIDb3
         EqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773212061; x=1773816861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lF5ZKsF6F7Qr5iBaoEQm8iifpJM4zWXRKtFu+dhnmr8=;
        b=PkS3SM/vNx53uCkRUSLx6OgcJRDClD0k8bdDT/18ERipmP9CJZ11+3XY79GPd0pbO+
         50TqYJ1ZIdi95asoZnuNLfamegFEHGm5zFfTdhNLxNJx4DOMJOsLvF2SY8bEKRWpF4Pk
         rESJCPZWIqKwntOgp1Ml0LHA7rYb/p/MIWDlyj6blq439w6C1ClObnuo+lQP4xx3NUqs
         47qwTEbSlwPPzh6KpkgGn/AhbH9Fvh1f7LCc6U8XcF5NXbY48AqzRG/6ClIphC7XvPh3
         gmbKHPY+48zi9cOfdCLXQo2DpjB3pZJhSVirqyOuiRfe4qDHLoiPJ/ThK5RKvDdFx2IC
         aruA==
X-Forwarded-Encrypted: i=1; AJvYcCVIQFDr0jQQlbtTewncK7AqAzNuhEdeZn9qGfnOiWw4EUAMSZq95OtrPi+CofRcdFj0q/SVmgyqGa6WKY+x@lists.linux.dev
X-Gm-Message-State: AOJu0YwHnLcnaIEVHMVmOoHoc+FCoCGjPzxpEsuF0QJbp6Bm8i+ox/Fg
	irtJx6vE7M3K15kihOPEhaarJwZ5d0ynFaD/1HcMj4BGUXSJ7M2LX2O31hB7jM83dto=
X-Gm-Gg: ATEYQzwJOP1Zf4IlMzqSNXUsKNGCtKSslQyt0iX9iUbbBEmA4ZrIXaA/dsGI5f9QSjH
	YoEbCBJUgiBDH+rOSBu90065pAkO1/UT7hLPtn/zOVOKpuedd5jZCo2zVVx48Y5TM41pBXWMuul
	RpUAEMALytW+XX0FFCfWeluMdsrMJslJQc/nZimnA3m3xRtctrihvAs5vrpJOSxTZ17RUBRxmry
	qBoJSPboum9d4Yr8hylWXIvTpb5Wjjt7UNF7hobHirBsNwXYllX/LF6veL0RMTSrcEp/ilCqJZH
	UXVdtIsE8jY4tnQrCZVVzPcPQkfFZ0GpaRqgcHiEB+1wkI5r3pWfEx2FRzpPvDIwZYrPooWF+ht
	Lf/nO3MrRgAwEUNfyBBO2f0WkJw2vu9+z7UzbFpv5C7eavUEodQP+G0ovA1lD2s6vCXx2JbPD/6
	EJY3LV+j/RQGXK7mqumyCHIejYNS0P
X-Received: by 2002:a05:600c:46d3:b0:485:17a7:ba0d with SMTP id 5b1f17b1804b1-4854b131975mr21611215e9.32.1773212060586;
        Tue, 10 Mar 2026 23:54:20 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854a307bc4sm19730455e9.3.2026.03.10.23.54.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 23:54:20 -0700 (PDT)
Date: Wed, 11 Mar 2026 09:54:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 06/28] media: staging: atomisp: Remove unnecessary
 return statements in rx.c
Message-ID: <abERmUmWxAXm5dB6@stanley.mountain>
References: <20260310-atomisp-remove-void-return-v2b-v3-0-3fdddab41271@yahoo.pl>
 <20260310-atomisp-remove-void-return-v2b-v3-6-3fdddab41271@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310-atomisp-remove-void-return-v2b-v3-6-3fdddab41271@yahoo.pl>

On Tue, Mar 10, 2026 at 10:39:17PM +0100, Tomasz Unger wrote:
> Remove redundant 'return;' statements at the end of void functions
> in rx.c. Void functions do not need an explicit return
> statement at the end.
> 
> Found with checkpatch.pl --strict.
> 
> Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
> ---
>  drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
> index 9cfb8bc97e24..bf9be11335d4 100644
> --- a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
> +++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
> @@ -44,7 +44,6 @@ void ia_css_isys_rx_enable_all_interrupts(enum mipi_port_id port)
>  	 */
>  	ia_css_irq_enable(IA_CSS_IRQ_INFO_CSS_RECEIVER_ERROR, true);
>  
> -	return;

Delete the blank line.

>  }
>  
>  /* This function converts between the enum used on the CSS API and the
> @@ -197,7 +196,6 @@ void ia_css_isys_rx_clear_irq_info(enum mipi_port_id port,
>  				port,
>  				_HRT_CSS_RECEIVER_IRQ_ENABLE_REG_IDX, bits);
>  
> -	return;

Same.

>  }
>  
>  static int ia_css_isys_2400_set_fmt_type(enum atomisp_input_format input_format,
> @@ -638,7 +636,6 @@ void ia_css_isys_rx_configure(const rx_cfg_t *config,
>  	 */
>  	input_system_reg_store(INPUT_SYSTEM0_ID, 0x207, 1);
>  
> -	return;

Same.

regards,
dan carpenter


