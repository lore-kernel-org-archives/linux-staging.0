Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4A32264DB
	for <linux-staging@lists.linux.dev>; Tue,  7 Oct 2025 10:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759832136; cv=none; b=lHPyiexRc+fq9J0eph51L8E3cXv+3Tkg6FvGS/DQFiMNwgsjqqP0yR/UBYXg2cF4IkSCePIkJMmcwQhAw8cKd7v+J6wEZ+ChTMKNhKnoMqDSLO4s0FoIEiaXbrYDFL/layhKbOaWJG4/Pn97fT+Gb54IBkxViN94U1y0EZBrPfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759832136; c=relaxed/simple;
	bh=A8Tf+OjdCf5lVPFHR2KREf1VuWMLVEm4o6QLanOAcuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QgDj9OvDbebw8dwKTa9y4T0ZPNTOGmjQZNGeuj+H/4hnWqkMBR31srx6VdSNE31ss/no6mprljszARW0Vb7XF0I7NVchOH0Pl97Uohs/tyfz76CuqAQz3Asgh/oE/k4KOipMJ5sEMkmIOfwpO5B02K3LtCxcTLCiSSGwJazRG18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MkUlUsyx; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MkUlUsyx"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so4630632f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 07 Oct 2025 03:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759832133; x=1760436933; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0yXg9AcgYPyqp7prkWmLpT+mSUIgyHjgb+sEzlSemMY=;
        b=MkUlUsyxrRPYX+xdfY8TOpVk5V+FUeogqURWQeS0lKVG0Rc+Aq+CKiYhQARzjrqXEr
         Q7i+k+2r6nPeAVdSx3BL1BuGnACI2/HWaUvenyPlU82pNVL4wBon4G6VIWn3LibrDAr5
         iPhezMz7T6Jkv1Ta2Q1K/mYV6YIBKSCrzZz1aa1fgZchnaftVx7bcm5NyX4oXvbGpfvD
         kiSCZQy/tCp89hj7XuRaVb3M1EejgTJ5H3oA7RhJy0ACMVKJMYN4TNa4QJyYhvHfvvdz
         Y0eyWEgQPWhhYm9FxCHbicEavdxohOUz9nR82XIOPgeWC+rsFZ4JMNk8rLrMqU+bT4Dl
         EmHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759832133; x=1760436933;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0yXg9AcgYPyqp7prkWmLpT+mSUIgyHjgb+sEzlSemMY=;
        b=nUi/n8RyBKeyMk5QMqPDOhykQEgfh0nFRN2TTQ4msshbhQ/XYyJNppyl/eijiaVq2M
         f7xnZxo8mzFg7tQc9mo6HjY6Z3b/uiHfJudpzFisshlot0XMQS6uHBBZIz/A9DeQGR6f
         VdFI/H9xlDdoLX9jadsmi19WIZur08Limdnv3xku2hbYcxjDP9/GlKXF9sgbo0vr41ll
         xTMM3V8+96pudvzlPIubiSdm1dyJFXX+2FQv5nkawvtT3bl42TcuQDE4nqzrrmDANfnK
         PN0bBlZ8/qXT5n2K2v8bSl0j9YN2PZG3xdhAKGMAuPKQcIjV37a/vNa/x7BScUIqz139
         qtjg==
X-Forwarded-Encrypted: i=1; AJvYcCXAoXRqu5v/4SJE7jNNHseyqJv+uzFHb2qVimrwoh2aHdWnO7NiSiEYL3uCJyPBIJ1I7s+FSn9TqEWMmcZv@lists.linux.dev
X-Gm-Message-State: AOJu0YzbihTmJ2H/RF6PCIM4IfmOvYJkru11DTkB9ZDn2EGd+8RkD+3P
	BgYTA2/Q4zIP9eRMynnknE6fbvoWCEV61pNmQ8tVCuczIw0rNRF3gE3bsTsQrCujrN0=
X-Gm-Gg: ASbGncsDneZd8wPpnanc5DeH1JUvhgbrI3Tn1/Wd0oV/m5BskZBW/zQElhRUmkknlyj
	zw/aAnqWvPJKliOHMGaIP09u7BxROlbr0oHH8/pO+lIBYqIocfX2dnu0qjQANXxfpgdQKl8wqR5
	QLQtQj/PUmcpXigN7c1H/CcMLGyRecF/HwwwbuK43MHyBvtnuRJrxBiJhRW13GrLKI22EtmXE/4
	ONo8IbSzcdqO+QWr4H7GEd9eaifU+nOYtdte1zBXfRxhg52gsANHK69Y26WsyFBqOlht0qcQSze
	70XQ5E8yEOFFxFClWJ2VYWUec+Brx0Rap5WfkaJPkRpQWe3yc4/x2beCKNcH5PackfaycpTLnCZ
	esft3+HZmNDTD8r4wA3UsNrN5/sCEDOYeDakGvqIOLTl1JwjAapm7cyF9
X-Google-Smtp-Source: AGHT+IEiT5FN1FKAizEpcgIVkRix673kPGjQ2cVd4EsFoPr5sDZw5EWuiYpkdxhZ49rGiJDXGIO3fw==
X-Received: by 2002:a05:6000:26cb:b0:425:8c06:b78a with SMTP id ffacd0b85a97d-4258c06b7fdmr80060f8f.59.1759832132912;
        Tue, 07 Oct 2025 03:15:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4255d8a6bb2sm24248577f8f.10.2025.10.07.03.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 03:15:32 -0700 (PDT)
Date: Tue, 7 Oct 2025 13:15:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rohan Tripathi <trohan2000@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] staging: rtl8723bs: remove unnecessary blank
 lines in rtw_ap.c
Message-ID: <aOToQUMOqkG8EDII@stanley.mountain>
References: <20251007091303.491115-1-trohan2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251007091303.491115-1-trohan2000@gmail.com>

There you go.  Looks good now.  Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

