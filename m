Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DAF39447F
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 11:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773054332; cv=none; b=fb9wPaL+5kx17/ed7weHiH0eDbGtHXNLeCSOcS7cahFhY5sKrE4/ffsv7vUK+563b7C2WojI2sVQGzgOPQZl6wqqrjqFoiqAgIB2oXNciVvvm0hzZ6vVqm0gojsSrISRZMJ0hQ916Po8U1Ez5KltvMhUVC0m+PTcHPyQVBtV+wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773054332; c=relaxed/simple;
	bh=+limjLd0m17IXtM+Mp3MuY7KsB77S2nEELZeD7vvhsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U9KnFMtFWvKAumsyu2CKlxWe2fDHip1x+YEZ8c6DbM24OBVlYPKqOMcDgkU0ktwq4kI370PXmDpVWqwGfHMsv3//HjVIR0xsADQdoixtZ//4jm8DBitByTjmbuggsogdSCAh+pBJq+tFHT0NZJCaG14K6fd++CgbUj9PJ808Www=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WEzswDy1; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WEzswDy1"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4853510b4f3so17640885e9.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 04:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773054329; x=1773659129; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Fqqdoq7khyQkP5h0iHqGtsNLIoGtw5+n1AILl71npk8=;
        b=WEzswDy16a1YyuigUMTG6W45/L24gSvI6ZGn3UaXoOFHOIZIq1SiNHFWzMXnkisjMv
         AgPQkLLGhihxzdjYh6e3BHS07uaUrVI5DMNenAOcJpULMT83hcKg94HFuRPiDDfyfdZ6
         ZMtkQhjFwP3GoIps81gRRQlGsYeldYourSHNP6vivmbzjAL7ZKNESJURUpc/8qhsK54Q
         fVPOl/J6YmAJqAHW162EbJ/KJfJZbyZtiaenr4LU2EDnemj7pGpXSugTQ/jtRjbd971/
         4E5Ji/lF6giV2qPtArxNbBkwU9f6J+2yaqvnKysRbgaGa21N8PdyZrqRy7EA14YhdjGc
         +qAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773054329; x=1773659129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fqqdoq7khyQkP5h0iHqGtsNLIoGtw5+n1AILl71npk8=;
        b=WVY5qCaBoJ4d2uMULYvyx+gftjCccjQHy+6IPFMKbARtcOvLqg5q/DocMlvFjLmDkE
         oi7JYXbIAaTdeuE4pObDdI/dtLsdxDIaF/73d6Qhk6Dc2wS+gGJDpQMA5yvY13pmPwPv
         jT1/Vs1e7qV4UgGhrO5Rjn0L90paf4xq38X/KbTZhyyzArXsikC8mN07R2wCfyOvFnMu
         eaF+ibBjcgtGNu6BlX2APj9nNVXJm12Bo3e5XGlg0HA432XLB//oUhaJeBYNRDly65tk
         3YgDBAUFPd/QCeGBC2+comiHiScIiglEwDPpNofrmWyaROnzLBcxwKnqucfNUpSMStZ5
         RK5A==
X-Forwarded-Encrypted: i=1; AJvYcCWmhWghr3HXIQJivFRg95YNOV3OL83oesd6EdPhXXaPOaajTRMU1v9Kk2H5J26aSgmi/BtDPgbqvaKfZXd/@lists.linux.dev
X-Gm-Message-State: AOJu0YwsqM0j+tOO7l9fSWb9PJgWY3v1jsQ8KG6LocvsZyFJFITWgOMI
	mtyo0IIrjkK/0wXzQ5p9AhSHK8q77sYavLBHImjIQRRb+MssfKMLGDK7GWZIJsrpKnM=
X-Gm-Gg: ATEYQzxXsWVHkpGgXSvDhx9cHooisi/Yk2+0ITOnYOvRhDSHLp5jf1n2lliUUudmv2B
	oDOVRdHHGURDwSIbgT0yV1icQGEU+531B9+rrVyaU+dF4PcuLX89CckmTFCp4Qb1UfNFrPekrpM
	i/2qaZvmj/5j+GXfvUAxAprHb/ENWSjCfG+jZp5dCe6iqMG18gnvd9FIttypLOeeONryLALjm1n
	5s4DIcJWn3f345fOQ/+kuq0js9MGgwv6kGYa9TAloo3Vr7qW3LjJI/YJAZZZKpriqFHgDR/JGOj
	KTf19R2VbCDH/MrsBFLlzs7IsIp2zpAyOTRFNOAK7aPIvR0oAhpnuvESsFvdLSgG+Et9W1Mu2i5
	+xKAjMZowOTJglNo+2UUxiVpiwb3Fcx2QiTRaqIaTTaYxK6GB5+WoiMtzovPRhkKYEvz7cT1fyd
	/bQr2AifxJczvqtkyx+8usemwW2O+5
X-Received: by 2002:a05:600c:3492:b0:485:3e19:9e01 with SMTP id 5b1f17b1804b1-4853e19a14cmr25442585e9.28.1773054329150;
        Mon, 09 Mar 2026 04:05:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4853438017bsm197849785e9.0.2026.03.09.04.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:05:28 -0700 (PDT)
Date: Mon, 9 Mar 2026 14:05:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: dipesh chaudhary <me@dipeshchaudhary.in>
Cc: gregkh@linuxfoundation.org, trohan2000@gmail.com, s9430939@naver.com,
	ethantidmore06@gmail.com, davidzalman.101@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: replace comparison to false with
 logical NOT
Message-ID: <aa6pdbWTD9R6xaoW@stanley.mountain>
References: <0c3a1503-1af9-4507-b386-741c26c329ac@smtp-relay.sendinblue.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0c3a1503-1af9-4507-b386-741c26c329ac@smtp-relay.sendinblue.com>

On Mon, Mar 09, 2026 at 10:48:23AM +0000, dipesh chaudhary wrote:
> 
> Fix checkpatch warning "Using comparison to false is error prone". Replace "== false" with the logical NOT operator "!" to align with the standard Linux kernel coding style and improve readability.
> 
> Signed-off-by: dipesh chaudhary <me@dipeshchaudhary.in>
> ---

Probably you should capitalize your name.  It's supposed to be formal
like signeing a legal document.

Run your patch through checkpatch.

Someone already did this change.  Work against the staging-next tree.

regards,
dan carpenter

