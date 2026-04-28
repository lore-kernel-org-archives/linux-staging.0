Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26A047AF63
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 18:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777402761; cv=none; b=tdUyjzYcFRQR65JXV4iG4Z12ZKqbc+e/swYt0t3+o5fwNn6x+N7NPs+tTSTi29oOL+1lQlwht4XZR2Ya/9TxUdGiZSlHraPTmVQ4oTqTLu/YBB9LJ83+/T0FCoHJAxsb5KWA+/CwTWB5X8ca/HTRPvce0uQj1vWZFHhuH28unss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777402761; c=relaxed/simple;
	bh=6a9Orqs4M+G9Ps0bWLS4aQAcCVzvmv1AumdBspToX0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDjxI/+9Coy4zzOEAO5rYciqjUrqZAsvIzlFj2lyZqoi5axziB/DOsKihHWsHORNSiZSn11yznfo6I4D8b8Nfp91vDmm7ppkQTCrSYvWju5m6h0HY5z1OpowdtEXwZJhiTR5YMeMRagyKSoYo/KzVKBPefx0p6cqvkjAKgiUdak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gThDwZel; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gThDwZel"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4891d7164ddso60439245e9.3
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 11:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777402758; x=1778007558; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iXO2sWkYj08jDd50w1qkyZoYNw3zJTVw3EQTk5oc1B8=;
        b=gThDwZelnh92d43nczSLlDTJFJJuw0II2CiUs1DtmZ5XOl2bJvRn6biv6kdarL9y/c
         WNYcbWEhm/Kvk0Wc/IIcCdple9Af3Jy3ToqNBuLvHK8M96si5bxu5OcMz8Zn7PxM/RLU
         1IGjqUbITtao1I5R8HpWWV5ZRS+VYHCx5l0irvLdxOHffJqK0e8hrM7HJSDshjSD0bSn
         FH/vWKlzs12WA1sTENnjjHIcy+g7/Gt29WdURfELdZMkCxZP4HqFzwLtPgIBdUaBQ9XX
         xyobDrWQWkQttFgkDKEAgU8xsI2rp+vwBsJQCgnCP/PFbw1QiEb+O25ZOsSGs2JEY9n3
         22Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777402758; x=1778007558;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iXO2sWkYj08jDd50w1qkyZoYNw3zJTVw3EQTk5oc1B8=;
        b=Zr1LY/ZXz6Qm4W26c965n6MbMyRVQtx36pUiduCZtU+C6kORYBRQDZDIaDB6+qccPX
         tO11uHaXMsxigpHNA55gOlQlfz+WjK0XpFX3nL+ljimyD/ZD9L7cFneE5SQUd9mLJ2E2
         Hi2o/ONZi5RnJxCSCXu3RfLSO0wCt21aj0CPU01lgiLN1APkH7Ngs4IzssVGLscEJ5IT
         rPnkPtYw0SuVYcWv6KTobrGcT7zpi8gp6cAfWr2x1Nr+qolv67EQVL1lx+C0R4KETBW4
         jMk+vdHgtOkM9YdLaFqGeNGj4MRgf6NH0cHFDP/6FAhif7KBtmonVj8CO8j4klCukpKj
         RiyQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ifwhaWzbXTdSi739UxU89u4zOHL2LEAA9TJ8r1liKc9OnjvLptCJKpyhxBFsUUOERvWzEyKA55yiMhVwC@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9oBfV6CDbhstD1NUuRJB+0AH4RyjPAF4u2wMf1E+3YReHKHig
	5GpKGrxa2/Y2aDNOMl01bUdhdGHDTSV6iTajDGuj94O/HkiGJXEJnKM3
X-Gm-Gg: AeBDievkuzyNGowDhmxiGqjlQ/iiwyIrlRzYk8LZI0hsnAuBfaPA5wBmJoimLPzZEuC
	AKUnLdcjBipF/eQHwLBdONvVgfB7neyuMY4DhHiZ/uI8cBLBVd+4Da+O5Mqn+VH0LzWytPTic9I
	0/wtuyL/1oHB2ZGET/fbwH97o+VgfqJJWHSRZeHNPKQ6nabZHN55MXO1FCUO2pyeeoKRK6bLRBG
	wxCPmB8oYqDCViYe9dmz2boYl8AWXwRgMoUEs5ANBrIJC60NnROgdHwbNPExwsLotbHePMci4l2
	mJcC7m/cbXz8Wr0HtiBwHjQbZ1g0Wvgt3SIOH3/eD3Dzddr9jcMJGIcgqyKmIwbeZA6cCWWkkwa
	q+3dNX4NsVfTMRvBwbGQbsLxtetILoSwVcomW5AcGyvfiO7gRtuE/WoW+oQLhXTOcgr7KvrUgVf
	QYZJptf28C199YqMzMbWBJ5BoBmKwhhEzRWV2zR4h7
X-Received: by 2002:a05:600c:6610:b0:489:1ba8:5bf0 with SMTP id 5b1f17b1804b1-48a7b54009cmr13442935e9.21.1777402757968;
        Tue, 28 Apr 2026 11:59:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463fa89038sm8391584f8f.26.2026.04.28.11.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 11:59:17 -0700 (PDT)
Date: Tue, 28 Apr 2026 21:59:14 +0300
From: Dan Carpenter <error27@gmail.com>
To: Marc Hanna <marchanna111@gmail.com>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	thierry.reding@gmail.com, jonathanh@nvidia.com,
	skomatineni@nvidia.com, luca.ceresoli@bootlin.com,
	mchehab@kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH v2] staging: tegra-video: Align wrapped function arguments
Message-ID: <afEDgrzzxGf_VM5B@stanley.mountain>
References: <20260428185024.853-1-marchanna111@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428185024.853-1-marchanna111@gmail.com>

The subject still says the patch is aligning function arguments when
the patch is about long lines.


On Tue, Apr 28, 2026 at 01:50:24PM -0500, Marc Hanna wrote:
> Align wrapped arguments in tegra20.c
> to follow kernel coding style.
> 
> v2:
> - Fix From header
> - Update commit message per review feedback
> 
This goes under the --- cut off line.

> Signed-off-by: Marc Hanna <marchanna111@gmail.com>
> ---
  ^^^
here.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

regards,
dan carpenter

