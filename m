Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B8C2E88BD
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 16:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772210400; cv=none; b=Z35OcTDCNRFZjAPMzYatcKRR8+qmnKZMlAixJjtCUUZnEYAxbJvamY0Hgtemg7uFJ1vCvnBkG7F+gW+1VNQ2ZHWyNNPZ1cbZd879eEQkwC+kFKAqeDJ/y3t5epLQwD5dEY9UTlySx6YHH8wbd/DkTcmQK2EATw9O6IbueXD0IoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772210400; c=relaxed/simple;
	bh=40us3EAYr0jd9t4cPeE3LbJbTaSrK/1lJhji66JgsL4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHX4kVP4bTMghsqC1Ai1TNqjmnBxUcaHCmDGv/6TjPqM5wRnrZoc7mTC/bzPee999/XUM+0Mhe/tMHks0I2XVvWYlLQ5fJLYxX60PYyq1+U9IoT/NAuDkcZhAK1t20zAYD/PI6yrPmA2GfE5lW3p8CqKZdNFcYo0ryBSl1KGbCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wQKQ0gzz; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wQKQ0gzz"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-65fa4713bd3so4136725a12.3
        for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 08:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772210397; x=1772815197; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/TU8pJDzZHIXOYpriXH+I1hchhH6j+5Eu0uZI5ch9jU=;
        b=wQKQ0gzzjFJdu8wtMfmA4aZtEWKnRYhPpG75l8Hht2GEbP2tV9ezcYHU1AdF3DT1Gp
         RRY4qfk5S9xPnNchohvTYRnGrPXZkOYqa7Ia36HVH2mw7qr4fT6cfYy+CqrV56PB5JDd
         wLELmlTwzftDDjPCbzFaNzkj2yqDh1EuCbYaY4Gv+XmjEyG7+oG+WihjejHlJEXEeA+U
         pBxPL5YCR+UFHxWq8vTeoO6Xwm3wQ6B/TdDkizq7d1MRFTYpc5Fo66+kcDavrnIEEwXv
         F8oir1NArBkimXYbFD3IJvq2MIcsF6jeyYnhVRPbV1OMWEULndPl1n/+OEqPbGJZrKEI
         IScA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772210397; x=1772815197;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/TU8pJDzZHIXOYpriXH+I1hchhH6j+5Eu0uZI5ch9jU=;
        b=Wm4AwRnQ6/2fyMBo53ppiCrfnrgURFEp85JUeZC3tQY4/xyrh1lYnCH5A5H+zTGKlU
         IEo95m8TQAaZDKJuIqgcDoGgSNsfu+ppW53py0XzeQhZjfzS8siyy6ME7pXiFJd92ZWB
         45apnRmG4wwEUwyBZt1Es0G1XQR0SW/tQVvncEyw1Qql31TqNT/tFCYop5dzkXOuXj73
         cmbYRb9FFr+BlfJ3R54ONHZxwzI9xTZJ/Mwe7G9A2jc8SRSCcFV8iHo9wEgvrvWk9aj+
         TawaF1lzkgt0489thDD7wwZyv0FSo4dbWR6uy/RR3jqGMAmAxcP/iA5Be/ALYNCaPXTP
         6WSw==
X-Forwarded-Encrypted: i=1; AJvYcCXP3CZdF9194zrn5NBtLuqoOHrGvZpjlWtm+kpCAH2bovpZH/gbdKxKzoz70X6kqNyeeIwK37VNiid22tmw@lists.linux.dev
X-Gm-Message-State: AOJu0YyhCDOePnDeaoIvvRsC4Ddjyf2PPLFlMizCDGCvga4k6zq9hh/m
	qWUbSfcRUJidh4biT8HjkmZC3bHyzOSvEVLh8GZJ7OybDVBNT6HEzUlyH1A3U/Es7Ns=
X-Gm-Gg: ATEYQzzlYgmGi5QWrQASu9nrWohXMu6gnSgq0OdxACoHTVZBSWFPpVfgILti6kG8dgd
	BK28vF+CM6vVBF7tz8l9Rk+Rqw2AzpCZivMq0+zPErFpWOX1GV2QfQo9EogmAUIVsUQo5JcmDGh
	Mkm9jH6hE/hDBc22R97XCekNghTmpQxBXdPoN6ob8JSUt63DI3v6DOzqa35dBYB22leN5YQK886
	ZUlta871TSNPMjVJcBTgR4869VqjOpuN4trYoKcFLJLEhxqAgjZFesP4AK9MfpDyrmkzOvdfckq
	ZpMy6Du/07VCH8CPNNnyfZefNCGEKOusnQy5ZFjVeRqb+zaN9Mi000PtOal2oLMTWq2ZsH7bgcp
	mBik/K5DRsfxLywUemGLuqOKiWPkGL4RMrnxU9WqbkN1n2qRAVHdm9iGTj9laTtFNHoxkD26H8D
	3vq8pE6faKdShn3MsiJLPAI9jIHOOu86qpHoxRPGw=
X-Received: by 2002:a17:907:2702:b0:b87:2780:1b1e with SMTP id a640c23a62f3a-b9376547e0emr175598366b.41.1772210397387;
        Fri, 27 Feb 2026 08:39:57 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae6132asm164299566b.32.2026.02.27.08.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 08:39:57 -0800 (PST)
Date: Fri, 27 Feb 2026 19:39:53 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Minu Jin <s9430939@naver.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: replace msleep() with fsleep() in
 rtw_cmd.c
Message-ID: <aaHI2a6DtQlSXS0u@stanley.mountain>
References: <20260226010536.179729-1-azpijr@gmail.com>
 <20260227084623.209913-1-azpijr@gmail.com>
 <DGPUF5A1SKXT.3TSUTM6ZCRH3N@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGPUF5A1SKXT.3TSUTM6ZCRH3N@gmail.com>

On Fri, Feb 27, 2026 at 09:18:24AM -0600, Ethan Tidmore wrote:
> On Fri Feb 27, 2026 at 2:46 AM CST, Jose A. Perez de Azpillaga wrote:
> > Replace msleep() with fsleep() in rtw_cmd.c to improve delay
> > precision and follow modern kernel practices.
> >
> > Specifically, this fixes a checkpatch warning for the 10ms delay
> > in _rtw_free_evt_priv() and updates the 100ms polling loops in
> > rtw_chk_hi_queue_hdl() and rtw_free_cmd_priv() for consistency.
> >
> > Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> > ---
> > v2: changed to USEC_PER_MSEC instead of magic numbers
> > ---
> ^^^
> Remove this.
> 

Having an extra --- cut off line doesn't matter.  The other thing that
you sometimes see is an extra blank line before the --- cut off line
and that's fine too.

regards,
dan carpenter

