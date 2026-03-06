Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D0533689D
	for <linux-staging@lists.linux.dev>; Fri,  6 Mar 2026 07:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772782675; cv=none; b=nr6uirnkEE6yd9EPo0k3/SJl5D5yCtMts4SAAFmsGFFHZY/reP8L1+R8lotfdV6cX0Q1q4m5c4o4BTcCrfWOC1I/N2HqBdrLuLwHL729u6q85L5GsT7Nh6s4+rK1v1HlQw4VHva+aI1DopymtZewmNbiQ94xDdfK/oHQQ0o5BVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772782675; c=relaxed/simple;
	bh=uXJMq5NihzlfjA+MCDH1l1an7MdcB9XB4r0mkOIwJB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PFvCvc1lJsN8hyjbwpWINYriGz1RBsuNmRUnX2gVnHsgD2c5zaWcnwx+T1CP6uQawlm38Da+fmY/ccvgXwfmOiU9ujtBRe+L04R9hu/nhSMQIhZnj4PHdXbX9ZEwlE9ghVibyinOonV10BJdd/DqbZxAkgc1DdXRNtCQknZ9ox4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BxYCbecB; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BxYCbecB"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso78092415e9.0
        for <linux-staging@lists.linux.dev>; Thu, 05 Mar 2026 23:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772782672; x=1773387472; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ESIsX+czZQWUv1elVg3NAnroQwJHdnafYZW/tGLRov8=;
        b=BxYCbecBgEH1bJK6Pa6Vx0qzPAuhoQjFrHoIgaFGURiB5iGxawjSVbpjA7ivzZQb/p
         nvNRFsEZakLDCYcv32Mz/kN336n9yYtlVX/uhzCPyU5JO2prPjwdrMTs47zg/oF/yCmh
         pHIiAMaElf+unxiD8tqB3dXAv2uqX5GAMxvbGaKSMzDswkSg2Oe27GZ5aLEr+GXEjnFh
         ogcZZQ+yYzWPUyX6O4gH66MALRssozZC0wCt0jkgEOgSR28f2WJ9RdmVLPRlRnQVY/qq
         92FkJwPfRGUvuxA0L6jugmIeISMZBCtRg1ni2HtVcijG+1tTw9oXLJQBgDQszTclI08L
         S/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772782672; x=1773387472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ESIsX+czZQWUv1elVg3NAnroQwJHdnafYZW/tGLRov8=;
        b=n+eDIfR+3mQ9bDBVrOxl3cw/otYPL7pCPtDZcSTHcTo3RLRfhYAlGt5FV4nzJRB9u7
         4SpfuMwHJFIpzra7uM9nb6TDtmYdhoW1iBPzPpjJfVQQuqOpijAG0OLWSKXFstKGUE/w
         AZXAQ1q/osTAciu5yjo0IPQIunpSf8PO29bUMBk3kFF9Lh+cR5c0iAVOLVTUK+KQ9/FU
         9WJZ+vmGO853HRvpTHS/SkJc9qUEtZk+A7r5iPahTsLlkcWPPN8lwXjnE+aOSac1wF1S
         9leNclUvOIxEF38uHbxm8qq3oreOswan8gevd+RdUzOPHmgwhmZFPF+pZMnLtgCUxmwd
         TMNg==
X-Gm-Message-State: AOJu0YxxFn/SfAqN1ExumzBZktXZD+XjWBinl2edIV31CdFBNHe0VX1C
	ygY98lem5eYHkAoqljGpe3+51CcyJ4FkjlK0AFThI8JtTQOlBv0Gx1TtXpK5CFDElBI=
X-Gm-Gg: ATEYQzyGpl2ieqEa2/0/kx3eH6Dzs5NlM3EIGqSLzZT9xPrieGvYGSXL2Ngh5W+P5Hb
	Q93pgewrpW5fT9OjjTJ86lf1FO5caqnEk8+GatopJ0fjiyTo00SgcDgV/kjdC2xocjcsdsh2MDU
	ZKL75JlMaCb1MWzkMDvRC9I3P8vUkt06EyhLz2wUcsIoRPQGIgVK9XkspqfG7juI/cfEuObX+iX
	fMrCUTGpHOhriGUoY3n5kFVzsmSf4ySo8S1v7G0rchHiv8MEk2AM9m9ReYGP6xt2Kd1HojIUL6t
	p72LlPOBDecO+TmM04gIBI0a+/sqae8yftaZonho5SR6dIJrwcPn/73LExzQ4y+EXld6b430OxD
	kKC87Vj9/zkjHBcSp1GJB2UxiGJakJ570i+13w1+tst8nmnMxV8McUbn4dOGdrYpqB1F1+ggQj3
	TmyUqmIpfiqiIBgwc40DY25ZhjuggX
X-Received: by 2002:a05:600c:6091:b0:483:348a:d3f3 with SMTP id 5b1f17b1804b1-48526951407mr15751015e9.18.1772782672156;
        Thu, 05 Mar 2026 23:37:52 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485276b0c38sm18617615e9.9.2026.03.05.23.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 23:37:51 -0800 (PST)
Date: Fri, 6 Mar 2026 10:37:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mark Adamenko <marusik.adamenko@gmail.com>
Cc: linux-staging@lists.linux.dev, parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: most: dim2: replace ROUND_UP_TO macro with
 round_up()
Message-ID: <aaqETJ-WgDO3-hek@stanley.mountain>
References: <20260306021926.7475-1-marusik.adamenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306021926.7475-1-marusik.adamenko@gmail.com>

On Thu, Mar 05, 2026 at 06:19:26PM -0800, Mark Adamenko wrote:
> The ROUND_UP_TO macro reuses argument 'd', which can cause unintended
> side effects. Remove it and replace the macro call with the existing
> round_up() function.
> 
> Signed-off-by: Mark Adamenko <marusik.adamenko@gmail.com>
> ---
> v2: use existing round_up() instead of a custom inline function

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

