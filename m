Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E20D2C1598
	for <linux-staging@lists.linux.dev>; Fri,  6 Feb 2026 13:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770385685; cv=none; b=SynzDt4P65p9Q28zDNhgp2Qg4xpCAADZz7cm0RzuKHXh8PgcE/bmvgZ4GiWeu4ncF0hSvwCN9CWIxqz7eL4K6hQD0llC9HQjUz9pUus2+KtWtY+IxM/y56oAmM6uwkAT2mhb9en1vFAUoSbhMpgtB0Nz/quAP6wwasorVgL++ZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770385685; c=relaxed/simple;
	bh=7yY/8jnS0hsT8F+rqJ3RTB/ADe9ZLxkoVIu/vTfrouI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q/ZUzlcG4/KT9iOJfzwHOjP70ZQKsMOqnHcTXZLdGUGs6ZE8R51pFq21S+Ibbq8j4I9aBVQ9PVhebQFnY8GfLj2Mb+FVs4oG3PzqB1qp2M6prZsuyhklpS6k9fOmqnGbjCgFfhRb1WHmOo6SaSQ9aB+ewhoqrVhtPMV6CCH24CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MzXDbeb6; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MzXDbeb6"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so19358575e9.1
        for <linux-staging@lists.linux.dev>; Fri, 06 Feb 2026 05:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770385684; x=1770990484; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cSbD0Nw8/bt38xPR3nRGhyQFOgHwlTx7dTgkCl+akPc=;
        b=MzXDbeb6oc4cKNDPFHu1FXTqKT2CkWx3VsPAmpImiNT9auIroBNJA4K53IxYUiT60O
         h6iNc+STsSXnJJOjDhqFFrrqWvFotHjgOPJt9kBHjUiC3Tz+pNEC7n6Qbn7b+VWIlc9G
         v0LJALsdcBLMiUjwN1RNXuF/Lze923NqLlSLqxsLDApgCn8PIaqxFMXyVupLPRZgjnbI
         jeXbefC/0tD3VO94S//Mmx7Q3hpQSLvVFhqinmpGRgcxb4RhxNDdRa3K2OVwF1hs0QRN
         i+CQA0+XUHub8gwoiqc5OXqWWA8hfCBUQacXiwz3OUf+dyNQvbXdQvDrHQAhPPlCD/G0
         X0+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770385684; x=1770990484;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cSbD0Nw8/bt38xPR3nRGhyQFOgHwlTx7dTgkCl+akPc=;
        b=Z8pID0T366axag+1fBqoqW35uUYwnzCRo8XqM8+ApPYKfQ83vGLmyXQIFOil6sx4pO
         H/+E+ZIHEFK5cUpBRFLm3MwSPSNuZCEzuQrbkDUalbuWNVKY8JLgCBRRJMbiDytlTAv2
         n61zQZhIvZyT1fvtIO1mo5ocBu/zUitUNxFp+Lfo3kXJAoenBxCU1ULICSqIQy57F9kE
         panArdUGBZFBGGuxH2NKzT7U3osoSsLDlinaVETbUhpO0VbGi+f1tXwDpJIwMT75E05G
         Nt2+Nc7mgCK0MzUQM33OUMqPIZiTEF3qPEtzdY2/slXh5Qrjq05EIHhALBjryI9QS2JR
         7cmA==
X-Forwarded-Encrypted: i=1; AJvYcCX1ta7Rzdp2mG0pNSgCcBiIwVeGO5qP75TdYrHI2wpf4Hgb4hNMx3F4AuiifvFfpBB0X+QuhJwAb+pQEdVi@lists.linux.dev
X-Gm-Message-State: AOJu0Yzd9s9dNKZV7oouekfN1zeBDoeJsl5LWaPJG01zOTCFs60JlNWb
	drMCl+QDX6Y2WuvV50ToIUd7SSwVek9thBzcgPZjULRPlxSF++gbijejE32F0kixYbE=
X-Gm-Gg: AZuq6aKb0NfRCYuTMSZ+nl+BaNQBteECs5JynaeEovgDRNAJ4hTCyMfbPTNo5uPDrt6
	n0n5VjTqED+10r+U7VugmP2i4IMPxSg2IluAt1LtIFxNABisixYTeUX/JI5/KLDX160V9Tg02Pe
	3TpGlDG/6EuBVMlEolJCsJFo92meGL0HqF9Rx/pE5B2DaAZA7uV4myfK4LGns7N2wkcR6dQt51t
	Nf1XEFshql0mWkkBEMDaOWckuWzvCkHIlDPi0VEpcC5cfyzZhRBR9qVrHXOXxgpmnw0I2r9TjC2
	P18KKHpV+ayg/2vwJIQAIMQ0ebD/f2PXXvCGYdcxHrTaOAqmBkqOtBT5Nos2+5LfzzSdZ7FNc/G
	WqlIwnuw4FNd3ER9hU/e9eTeSpU7wqZK1921U8ZN4VFfuUuHoU9ts7KLDr5wbk9xkWtUl2HiqbG
	DvxQkpwkg9eR252+/i
X-Received: by 2002:a05:600c:5253:b0:482:f564:d60f with SMTP id 5b1f17b1804b1-4832020e2b2mr37986635e9.15.1770385683622;
        Fri, 06 Feb 2026 05:48:03 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483209d0007sm18673515e9.15.2026.02.06.05.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 05:48:03 -0800 (PST)
Date: Fri, 6 Feb 2026 16:48:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
Cc: gregkh@linuxfoundation.org, ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/2] staging: axis-fifo: refactor device tree parsing
Message-ID: <aYXxECAuS9nyWUia@stanley.mountain>
References: <20260206131148.13643-1-gustavopiazdasilva2102@gmail.com>
 <20260206131148.13643-3-gustavopiazdasilva2102@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206131148.13643-3-gustavopiazdasilva2102@gmail.com>

On Fri, Feb 06, 2026 at 10:11:48AM -0300, Gustavo Piaz da Silva wrote:
> -	ret = of_property_read_u32(node, "xlnx,axi-str-rxd-tdata-width",
> -				   &value);
> +	ret = of_property_read_u32(node, "xlnx,axi-str-rxd-tdata-width", &value);

You moved &value to the previous line which is the right thing.  But,
please, don't make these unrelated white space changes in the same patch.
You can do it in a separate patch but they make the diff harder to
review.

regards,
dan carpenter


