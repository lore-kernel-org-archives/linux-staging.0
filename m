Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E67A23AB85
	for <linux-staging@lists.linux.dev>; Thu, 31 Jul 2025 16:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753977940; cv=none; b=TYbsrKUoye0hVTaBX194WSICOKzH014Q9W6dHJuA8AQyN5Ib157YKgGtBP2x3R6aPJvefbcqTJjHx1pw3zOyTgpU3YS+ObgzpBthd0N265DxwNQiolENIf1PdtFZm5UnAeKanGJanfvrCzlolvV7RFEGZYBabOgw6WBemEbiuG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753977940; c=relaxed/simple;
	bh=CnYIEKLx4TAFUxdZTssELh7lELrZ7WzEgh5Jw6CgJNE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e9qkadDAAXEQWgnipop0Z/KakFJHmRy7w3mEsFEs+cCGenI8psel40v5FqRl7IB3irXPR3nnoYvYnKbUGozJMwu016cxQiIYkIN6wqJBoBdqxXLtdGKVYIlpM9AP29+VZ+Q3Ai+6LXsQhy2hqgkwu4c9Px3vQTSl1/kWL4dtPAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MXKUgiDa; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MXKUgiDa"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b78bca0890so805614f8f.3
        for <linux-staging@lists.linux.dev>; Thu, 31 Jul 2025 09:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753977937; x=1754582737; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LdhQmFbMkNSed960dmFtejqXjsu13SQnTKg6pcVU8yI=;
        b=MXKUgiDaZtW4pf8IWL4VbRdkK6mmtPNNLifNJmDmEAaasRjOunlLt7N0GkwuJrKhFY
         OYY++SlnsdJVbJ2zWDTNKDx4LUWBBzbI19UR0aljQ03uwXOWGXuQFKtQ06qBQp3QS1Oo
         BVvvBsrWRe9a6n9etZpxNPnNO31X1egWvLZusTmSskPX1g/o3ehCzOklLnbYbXR1Z+xO
         PwJF1jLKwNEJlrEV+MNFzW0GRHnRATB3/SNpT5eMiMu6wMEMfo1V8ds4dpZDYdnDMoMm
         TumKtav5P/uTcqTu8wPESYxRRGvSQr5FXnyu0zN7QOwMZcUXD+W09ZSLXJEJibzTYK0V
         t11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753977937; x=1754582737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdhQmFbMkNSed960dmFtejqXjsu13SQnTKg6pcVU8yI=;
        b=CzFKWupWvD5WlFBXuIOyEzJDqbHwcyGFvju71cXyZ7ho47J1d4IGGi+Q6lj5v5LcMc
         2GJ4PSHIrsVy1qiqjUxjXqe5gr0Ycw4v9ojfnuGFJC8eaqLovPidUarMklObm4aQvYjH
         3Vmsh5b+cSkpNLL9W6ONHrXD3oJQ+VSO9tcVLkSnp68gVipBVEQiwgriYyGC2lMJwJeH
         K3g4NryDdX0Pb1f/BqG0bFzLlAA+yQjKSSUru1A8OwDCPiY8gU2fQ+BlNXKdRwCFS+Kx
         +PF21m+/McO9Sx9ZTg84pRaf5iTBgZJeh29f4a9lepBOBvYAe3eZkfdDZn8CUoIAyQWI
         oh7A==
X-Forwarded-Encrypted: i=1; AJvYcCUDFAGQL+17Uq0HIBfySYg9UjQg9VZ/FN1+BDhyk/hc2qxaYLCZD/LLVzw2i06fimpTJF8oW/VDy/2hXGnF@lists.linux.dev
X-Gm-Message-State: AOJu0YxU+pAliaawNr9g1vR1qWtZS0xrxUtEGncGQxLCD/xvXKOB492G
	QYAlNguDmEZKft+4fdxlRpAw4FBJGIGKTNaLU+3PZvl1Un+IK/WPHitS2h2dy3mH4rE=
X-Gm-Gg: ASbGnct3EGlUQilEbuwmf7s4rF14XEvRFhZ5o/t1cRFyrFZMeN/kqOkAmnGGaXm3z8t
	T0H/+IU6ddQTRDDTYbTYFhD+Dv9j5Ym3bWSv1JdHqDT+VCR7BrvrJqHQmd1s0cxU80elW6LibNZ
	iqAWK5Gvpi24q9bRcrv1xLiJe9ZOarQXLhAkpJ6xX7CbES/r850NfSIO0k1+1MMB3KF2s0xqz9h
	PmpmQM4UdsT2JtVhQRUfSKGQdUrb0eNd+ERmOiFAD6gDtWFSDXwaOh/cEA2OG3aSWLxFc9lmQ1r
	+ax5x2uq5bb2MRT0hUEYFF+LG3h6M+FK+qH5nTqDw3hveZJ1uJ/c6d7bbH6Mx/x+TzslCHEJh2r
	pTtVRYyqqQwDJm0XGE+Kx+dQh8SCk1Av2HSWM7RFhr1o=
X-Google-Smtp-Source: AGHT+IHKEgPI16zTrpdtBA345eAj3eoJCpdLSHZI7HH7keABCX5N2v7AOToBccj7RD32n4zicM10sg==
X-Received: by 2002:a05:6000:4212:b0:3a3:63d3:369a with SMTP id ffacd0b85a97d-3b794fc182dmr7100030f8f.25.1753977937312;
        Thu, 31 Jul 2025 09:05:37 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45895377956sm69939275e9.10.2025.07.31.09.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 09:05:36 -0700 (PDT)
Date: Thu, 31 Jul 2025 19:05:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: ashirvadm04@gmail.com
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	sayyad.abid16@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Replace magic numbers in
 rtl8723b_InitBeaconParameters
Message-ID: <8c350c13-3e6d-45cf-b9d2-2e8df07b6dd2@suswa.mountain>
References: <20250729141224.16013-1-ashirvadm04@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729141224.16013-1-ashirvadm04@gmail.com>

On Tue, Jul 29, 2025 at 07:42:10PM +0530, ashirvadm04@gmail.com wrote:
> From: Ashirvad Mohanty <ashirvadm04@gmail.com>
> 
> Replace magic numbers 0x6404 and 0x660F in rtl8723b_InitBeaconParameters
> with macros TBTT_PROHIBIT_TIME_8723B and BCN_AIFS_CFG_8723B, respectively,
> defined in rtl8723b_hal.h.

I don't really think these names add any information.  The number is
related to TIME but no one really knows how it works.  Someone posted
a theory about it, but it turned out that was just AI hallucination.
The spec they quoted was real but the sub section was fake.

The 8723B is the name of the driver, but without the "s" for some
reason.  It's just words but with no meaning.  It's a map to nowhere.
It's a waste of time.  I would say that there is also an element where
these names are a bit misleading because the BCN_AIFS_CFG_8723B is
really specific and the name suggests it's more of a generally config
button.

Just leave it as-is.  I would suggest that you could delete the TODO,
but it's good practice to just learn to accept that we can't fix
everything.

regards,
dan carpenter


