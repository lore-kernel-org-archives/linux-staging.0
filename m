Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8514513B7A3
	for <linux-staging@lists.linux.dev>; Mon,  8 Jul 2024 15:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720453286; cv=none; b=ip5eHPb802+RhS6l/hN/dBaz3ejMVYVQORYQtL/5LHa6ec6oOLdC5BbAolXFrfl95XHnCYbC7Cniqb05o39HsG7tMCAiggDT9K3hT5h0hfuBmSWKainfbxBq9alWxDiJU/VRorIWFx8DuKrSdNZbpQiMHy4pdf6m1PcSp0TYf9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720453286; c=relaxed/simple;
	bh=AvANucvrZ/fsPo2yOI31iWo1FDKNiABMfD22ldNz5dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KvTxB0lCIYN1A+qjtJgg6At+M8F5rwjY2yI5nsEbg/PajcdS1yVtFm6lKnD3BXnv958aj4xIm/I9TG8REIOh+Slfe+cze8q6RrionFukadaPdR9RYG1ZYCA9ZFLoIwnV4lr9Y7rupI26N7aLU2ikp+aFYSn0OnutNQ118LDilf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PrkLNcwj; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PrkLNcwj"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3d9231a8dd6so901943b6e.1
        for <linux-staging@lists.linux.dev>; Mon, 08 Jul 2024 08:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720453283; x=1721058083; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AvANucvrZ/fsPo2yOI31iWo1FDKNiABMfD22ldNz5dc=;
        b=PrkLNcwjrsY+Vk7/2Z/BObzWUo236yn5VebO5fittyypRxj7ATmiTFICEI4NrORX0D
         7HKHcTgLoJuVSMy2jjT/me/XeZh4PXnTQbHjdt/r6nfIklrvwgef77/+GL0pAST7ib87
         fi9dg5VNrxIppjYEvkH70w77tNGuMqSu37toG6OZW3dD1xtIAzPB4xmaiZjgwdtcw5nm
         Mg+G7Izp9YPIgT0PWJRKUtUX5bntKdbBDpp+esha1ArDSy0WTvKQJ0MAE1+mHXlcMBOb
         c9s6PzWSmkt4fqnXiSa+fqqwWz4ihy0HPaJlqYA/us9eRn3l+tt0xDX2AVMT15n8wQu/
         0AFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720453284; x=1721058084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AvANucvrZ/fsPo2yOI31iWo1FDKNiABMfD22ldNz5dc=;
        b=g5laJGnilMJaX3cA/5u2F8NEC2JfQ+eeBs8c6YlJ42rbZFxieQMUilrhXZ7ctE05f+
         srHJkumxZLC7U1/TLr4NTceyVqx6XtKZSDRrOqeluw3pD0/4j7WkbBL7VU4LwFh+jEDC
         6iGLhhkOVx9MzRqdAOwDV/3akze7YiCNhLNsPGJ26D8PyDeeuGWTgCza6DwS2Wel+x7M
         giovzEJWAUOKlWzrhMeXXt7byyU+yDHkWZaOI01nPCh7906qzImT07g7P1BYgSxRBftw
         0SKhSbjC0gZqmI8OjIU8stsctwuZUGaaDohJ3TMEJh1+TWS9m0zzKyhVN7BPmxqVIInq
         eXEA==
X-Forwarded-Encrypted: i=1; AJvYcCWRGSmwgJDWyVuEjk/Dx+mxWdhkff0ty9IWPxZ1kYx27RQpk6kLKe2CWKgfvSnYudU3XilqYiF4yrNomRcBEnkhKLuG7tHwQHVV3bDB3Q==
X-Gm-Message-State: AOJu0Yxd8U1Xi3KMYY66kG746snXz0WTgaYtGWDMfQbTZnSteUJ5Jwve
	cN+82GIsNLvJiNMrroqbjQWmZdD8ZhY2+jcymwcm8bAWy4WNUohJ64ld5UxYfIM=
X-Google-Smtp-Source: AGHT+IE4fartsbVqJ1ZXTAUJYr3DKVogSxSpB+ivKX+k3fcl6RoAaf2u7l1kY5INfh9HbLRD0moHGg==
X-Received: by 2002:a05:6808:13c7:b0:3d5:633b:3d8d with SMTP id 5614622812f47-3d914ea41fbmr11853349b6e.53.1720453283519;
        Mon, 08 Jul 2024 08:41:23 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:6fc:b7f5:4853:aff3])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d93ad2b3e5sm28150b6e.29.2024.07.08.08.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 08:41:23 -0700 (PDT)
Date: Mon, 8 Jul 2024 17:41:21 +0200
From: Dan Carpenter <dan.carpenter@linaro.org>
To: =?iso-8859-1?Q?=C1gatha?= Isabelle Chris Moreira Guedes <code@agatha.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	patch-reply@agatha.dev
Subject: Re: [PATCH v3] init: staging: Fix missing warning/taint on builtin
 code
Message-ID: <11f00921-e8d5-488f-82e5-a22e68fc5748@suswa.mountain>
References: <zsk54zosv6tht4j4nma4ix7lq2knxi3ylqadd2foznc72nkaa3@xbc7gpozx6ai>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zsk54zosv6tht4j4nma4ix7lq2knxi3ylqadd2foznc72nkaa3@xbc7gpozx6ai>

Thanks!

Acked-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

