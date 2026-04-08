Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC2B388E5F
	for <linux-staging@lists.linux.dev>; Wed,  8 Apr 2026 07:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775634036; cv=none; b=D/w879EU2E9VVO0M+Bmq4p+uWFwi6wpaSlvx15bc8Dvv+Ocb0nix77tYmxftgTFgJmYjlIDNQVpGUr31+mj7tMyGxRicGLnm637aBN5eU1umTxJuKPodm9ur/+1KZ12prD641yFynJGtiA61CGa1ch3B15zSXh1aGs1yM1vnatE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775634036; c=relaxed/simple;
	bh=ruT9fHvv7+6JiRY3/fpKZBu74HQlu+cTKGiEJh/M4Z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HnJBYl6CpYTmrIrjjE4VK2oy2nD/ES/JLwdvXIL4dYEa0t77B//2eJo0iiqvkpjh332eTk653Ad0zP3zrBQCOS90vARyImtcwhXVgo7H/3N2z9mD2/CWqDhHNr5Bwf0V1XqJ5e82jocdDTa1Zvk1nuSf1FSKa9UNnxtFJg84nwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AT5pXIfm; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AT5pXIfm"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4888375f735so54964975e9.3
        for <linux-staging@lists.linux.dev>; Wed, 08 Apr 2026 00:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775634033; x=1776238833; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0mL8hBd7svM+oHdl0KgcAFujd7BacdqcxKlG5vQmrck=;
        b=AT5pXIfmfYnE2sy1NHAst6hIjDkDgfYVJ2F7Ndj+E4koJMBeNpURwwzteFRK4I587f
         0NxERa6AScNnUteNxAiO7lZupUQ9z3/1DocwnfWyez5q4RqdTcHxTRJpnQogAPABuoXK
         YivxzGYJShakeYLfzH9weqBxTKgvKH9Pv/QrDrfvAKrSJfWGGA2AIvGpKOCRywUKEJ0o
         qg0ptLjKx+P39Abj01VgQFj4etZOHIgd2GFaaLQkSaPVs+Nd42nRbzY8B+qbABoWBgzW
         uoYGfGNn+hYibsbEJfMoZdu5zYtXf9Jot2f4f4Wj/qRFLqZgLV8TOrdz01Y5KRg7X0HP
         pbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775634033; x=1776238833;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0mL8hBd7svM+oHdl0KgcAFujd7BacdqcxKlG5vQmrck=;
        b=hDgYKQGQYdkaKZ3Rc6gRopvhceLaSRPXLVeVI/ELtZlTo8R/YeuEqDT4xCXl440eod
         Yhdt3czU4FX8GDxckK1PdFPZMozePuwSqOSQffuWwJBhB3szNfmSZYctQMtVNNcqBtby
         VtnIAJLf588kat/yZlcoA1N4XPFeAcWzmTm054WXEK8aGvPkZLie6IARIcdEbOO79ya4
         qpurXCwbdlXI2RDT8FpkrVX01QDRlw6mfmSJnuzTumewS0a90DZrwjm2k2xSwCyO1R+U
         F7Jv+xx90pdstq9Ropdj6STKpflgAXJAWRXvv0PurO+evK153tOSaAsd0/Ssev5N8uO/
         7xBw==
X-Forwarded-Encrypted: i=1; AJvYcCXu0NFK0Vwa7okRWr14w8xiSeDsD9SoyJEg+GSb9MqphPLRd/pM3LzjnpuA5Cur+qAMUlzZlhjvZZZoxug1@lists.linux.dev
X-Gm-Message-State: AOJu0YwOYJ6n+7XCWyQFM+QsmvnHAl+cyo0y05CC0r2cqrdYRPI17SSP
	Qy5BKzrp1LiULBjeLd/l8M+hVXaD0G5EcBiPZL8i86OmF7J/RHlz6gp6
X-Gm-Gg: AeBDietVsYF7sAOkl+oU1KHVPz9WoHmJZbkcn0qoqYLVtuKxcnY6YQSwDKjuTi7Vo27
	7DTFIBvAZwZIMnyAHXoHGaVxvGvWTQDhvbOrxSjhc0/tonuCtwvkmEn4xfhdfQ0CFJTlAT3hN3H
	q9/Js7K3XYsWXW3W1F7NFYyxzB+zT1QXifDvXKvPBkGGHNUptXcETEGzYSmCf4Bcg5XPo/4Fp63
	A76NLoER8f6gdvbk2NuPDX1G4joiN2nx0CkPmbRxp0tdi92fm+QAiH9QRTje4vshqq868WYfCsP
	4lgj5cbjd9XpKJ09EDMfdYcNpa7pFi68DufGTxHDD504QLdTQ6K28YCep/01QH2M2Kew9LTx2NK
	JD7dfbEUXXI/XnZHDDf7rXcYKZn2HRTauc0s+NGEsJyZLJLyxKNZVwQ0rbY6oast8AJyc2gg2oN
	+dnLrnkgnjhRJjhx9tZ5AfwQazNbmy7Q==
X-Received: by 2002:a05:600c:6085:b0:488:b239:77ec with SMTP id 5b1f17b1804b1-488b2397962mr134666495e9.17.1775634032762;
        Wed, 08 Apr 2026 00:40:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488a91686f9sm350538545e9.10.2026.04.08.00.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 00:40:32 -0700 (PDT)
Date: Wed, 8 Apr 2026 10:40:28 +0300
From: Dan Carpenter <error27@gmail.com>
To: Hungyu Lin <dennylin0707@gmail.com>
Cc: gregkh@linuxfoundation.org, b9788213@gmail.com, ethantidmore@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: convert xmit init path to
 standard error codes
Message-ID: <adYGbBEBDkNGBr95@stanley.mountain>
References: <20260405232534.14122-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405232534.14122-1-dennylin0707@gmail.com>

On Sun, Apr 05, 2026 at 11:25:34PM +0000, Hungyu Lin wrote:
> Replace the use of _SUCCESS/_FAIL return values with standard
> kernel return conventions (0 on success, negative errno on failure)
> in the xmit initialization path.
> 
> Specifically:
> - rtw_os_xmit_resource_alloc() now returns 0 or -ENOMEM
> - rtw_alloc_hwxmits() now returns 0 or -ENOMEM
> - _rtw_init_xmit_priv() updated to propagate error codes and use
>   direct truth checks instead of comparing with _FAIL
> - caller in os_intfs.c updated accordingly
> 
> This improves error propagation and aligns the driver with
> kernel coding style.
> 
> Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
> ---

Break this up into a bunch of patches:

patch 1: Change _rtw_init_xmit_priv() to use direct returns and get
	 rid of the exit label.
patch 2: Make rtw_alloc_hwxmits() static
patch 3: Make rtw_alloc_hwxmits() return negative error codes and update
	 the call site to look like this:

	res = rtw_alloc_hwxmits();
	if (res)
		return _FAIL;
patch 4: Move rtw_os_xmit_resource_alloc() to
         drivers/staging/rtl8723bs/core/rtw_xmit.c and make it static.
patch 5: Make rtw_os_xmit_resource_alloc() return -ENOMEM on failure
	 and update the call sites to look like:

	res = rtw_os_xmit_resource_alloc();
	if (res)
		return _FAIL;

patch 6: Change _rtw_init_xmit_priv() to return negative error codes
	 and update the call sites to look like:


	res = _rtw_init_xmit_priv(&padapter->xmitpriv, padapter);
	if (res)
		goto free_mlme_ext;

Making the functions static makes them easier to review so we don't
have to jump around between files.  Doing it one function at a time
is easier to review because we don't have to remember all the
functions which were changed.  Direct returns are easier to review
because we don't have to scroll to the bottom of the function.

regards,
dan carpenter

