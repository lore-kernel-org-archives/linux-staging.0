Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89448322DB7
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 07:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769671234; cv=none; b=VQu4bJPiH36CSrkiLcKzKPubP0QSEdjspPqZg5xVgtMTmYAHEe3dXVic3whHKt9Nf+n3J9Inmf0JDtfxKgJKP0m1EQpEtdaevV6CdWAg6ovu14NtE1S94OKEEi+G4H/xM/mmu4DcCtCD42cdd6N5+NyMZsHP6CjZMzbqLsIGkgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769671234; c=relaxed/simple;
	bh=qcUuvSmjmi0JKom8xmnCotiQYfTppN7mwpBztz/O3cA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dceCyngc2mbYlEaDfjZ5un+mxBYl047CFS0urSQZfjHilnjfWZcPZ/Mshw3HDJiL2YD/xkMEr9y26tU4eJj3iOvk2wHl7ShpXUgiWN1DwYttVpgjRy6wcnaiVLcw2TZ4+4YlAouJ5JWwfcw/Jjr15uXAyXSsh3epxI7GNbNblCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FzC9bo5u; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FzC9bo5u"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4806e0f6b69so4170985e9.3
        for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 23:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769671231; x=1770276031; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LhWSNicDlPD2jFA5Z5dM20dNQAcQvamWAtNQkSNU8M4=;
        b=FzC9bo5udPBCFOkP3TpovJixBB6HRzGvEk33KZTRjHXYBWmbA1E/+8sLByH4xrXPlO
         34hWfF822szxbESnBtUZJtbg+AfVpBeLjEz3i9je/ztlngg3adAdi5v+7/eAPbMzCLSH
         EM+uYz2C3WsybHHeQXPGpPzYc5A630HVyVjmTYNvRgI+uHkpfw0YKwW7VE46WeV2UiCW
         Y5ONiy2FO/qCQm73appyV7u0wAXWVxuUCf5cIZaOqmoTrWYjSdB7VnPswRNqYWDYXOKt
         fI1QHVROJ06q+d3SwozNDYvDGVPM22D8O6qA03uaDBMNlmz189+IuF24JMzTGcQV4LUS
         dWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769671231; x=1770276031;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LhWSNicDlPD2jFA5Z5dM20dNQAcQvamWAtNQkSNU8M4=;
        b=lg/Mr7Z9QtQp+MItBRk0/vezRAXzWR4O50dgZi0NUgG+axWd/aw2b4kNUbLRwRs30A
         PCntNi7sdxx4shSzDdtMX+yekk/CJVKq9/yfAAIq7N7yKaN0p+3N9/9lkcHBew64jQ77
         6DNo6vZnI/+WPFecUvqeuw2t+AbN5r3VXH14aKfGvnfLK4+UEqiaGls428cZ4KiDTJwB
         35mV7FxOSQ5JigbG9IGJn3QLygf/NVj6BrLL+uTF2CAnWeRZalSc57reaV8YKFwWUGf2
         Y1QSYtAMxQu4Ugi4CWFlUtTKKKc/OoIGD1oKTJJ4fqsphh1PZi0maO70qMx88k+pmJSN
         QIaw==
X-Forwarded-Encrypted: i=1; AJvYcCWGSpONeIXF3sJgU5vdNkTUd5boDTcUcoSXubY374UtXDKFhQexRQP03hJLuAxoezTn7VQO4za4z3W5uwqv@lists.linux.dev
X-Gm-Message-State: AOJu0YzaLYx6B8wOSRUdD30DPa3NdScULrbQE+EM20meLhZc5ctfcYns
	Zvsto6VJFk2Xxig66YdMtMW97Lk2bQknMN0b8zl0DSucOTov4m3joh2h+haYx/FE09Q=
X-Gm-Gg: AZuq6aJdVeVcZRr5txpTTIB6DKzQLuQbRlGhfdFfkNd5jclWjA++ugYELdikhguUTAg
	F20pnSOYT3b4yjQIIloXCGm87gNBh3h8MW4gWhD3peZWN549uPEDusUBCJELMbZ9mhhirZFn+yG
	TVuoeAfFa8i5O6a2u7WZDTwTlPgFOkHoI6090yQOGgeG4gQTcj0k51r8CPYwbfLxRGranTTn2nA
	rNRf38/R9qkSnwTVby/gNRxBPU/8XWUE0llPynOBvAxBQtqNGSUpAL0U2kF06DXy4TxEdzI6VT+
	kU7fD4k5W5pg/cp7PFQm81gwWGkbeStbeci41smYjnaHsGsdk2oBxEdBVrY4b7TJZrzm18Cu0HI
	e1/AEPOryL398e+SRIoKxMWIsQoO9obMjbK6w6TPBGC9/yVlBiuvMkdwRnc2++lgZ5GPTd+kSOi
	zUc5CafoexA+HV/SXO
X-Received: by 2002:a05:600c:154c:b0:475:de12:d3b5 with SMTP id 5b1f17b1804b1-48069c6136fmr83170155e9.34.1769671230923;
        Wed, 28 Jan 2026 23:20:30 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c37433sm161435495e9.10.2026.01.28.23.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 23:20:30 -0800 (PST)
Date: Thu, 29 Jan 2026 10:20:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gus Stoermer <gstoermer1@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix checkpatch warnings in
 os_dep/osdep_service.c
Message-ID: <aXsKO8F9vmdrBK68@stanley.mountain>
References: <CABm+q84v7jvq-kF4v7U3bQZjdQJS946FTGowSAGPjk5FY_LKpA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABm+q84v7jvq-kF4v7U3bQZjdQJS946FTGowSAGPjk5FY_LKpA@mail.gmail.com>

On Wed, Jan 28, 2026 at 06:28:59PM +0000, Gus Stoermer wrote:
> >From 64ab45283c7e006c3420242e0f7b00acc1c3fd38 Mon Sep 17 00:00:00 2001
> From: xlumen1 <gstoermer1@gmail.com>
> Date: Wed, 28 Jan 2026 18:08:46 +0000
> Subject: [PATCH] staging: rtl8723bs: fix checkpatch warnings in
> os_dep/osdep_service.c
> 
> Signed-off-by: xlumen1 <gstoermer1@gmail.com>
> ---

Please use your real name.  No commit message.  The patch is corrupted.
You're doing too many things in one patch.  Fix one type of warning at
a time.

regards,
dan carpenter

