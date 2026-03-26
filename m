Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5E43B4EAD
	for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 07:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774511722; cv=none; b=gtT/TASkGRSDyxJgtlY04H2DiRYTAUK0TrKK1Vm42sMHpmHAAItFFCVaykWluVjVjByTByLZsMlr+Fs0wywxZkHEZLVsj/4QkYCvqGheiaHg2MClxJ8TLdMppkY5wMusIvBxLQ6Hlgh9NgZLWNMjSP8ClsYef7WSwXGRgB/Ma+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774511722; c=relaxed/simple;
	bh=6DC/ed0UU9WXByi2HCAlQRWhc5885jY/8RAX9erDNK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=esJc9Ci2vJ4ODF4F14WmE8mGeLj8J5+qT8Rjtr9IrXUUaW4Abl8sjDACakTWiJ8zXR6BEBXkw0f0w1lZz/Psnv+p3aLnhdJTVRlU+3oARisq9oRdH9ROExRQZboev0jPn3A3/nM8vA5IFX0XQs6ia/YU5uuneI8A1vR1kqDOa3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZndcB5JQ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZndcB5JQ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso5655705e9.3
        for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 00:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774511719; x=1775116519; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OPHuBc/d7RsRCOWZz/jaWTaB6CmrMjgeFXtXevdrXbw=;
        b=ZndcB5JQEhGlxqzX2485lmL2PbRUBGhh8KIl8+1ABjFgkgaIiQYFS0SGLE0Ah3LzYL
         DxomQsEQb9l52H8cTaOiNinlP/stGnS+02wezo/oo2lCWHXrtDmN2dEFMJgCtVGzZ5s4
         oyGDcIybAX1K+hHnahhf9lQkFVbJXFBO9r7ovnP0Z0kPKOIK69UzNT8WuzfT/nFUtVy1
         pg9RAtkC/4mO3KJ5MyBJ0Vtho368YaDnx9ZTM/gZm0+fobx5zOLF3yCNJVKLWOeonDjG
         ET7Akqqrkv42H9T9oYo80Pdv38V4YxosgQShsNE5gBGuHuUFM3gAjfFLjr+AzY3+1lxO
         u1Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774511719; x=1775116519;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OPHuBc/d7RsRCOWZz/jaWTaB6CmrMjgeFXtXevdrXbw=;
        b=CRzjKJUoNJxOFJIMPjlDUCCq2hXyvDX4gBHFXcdvR2tZe1HFi7DwIUoYAfXpLEMCNe
         gdXkZPySdHZVjBnx8/MXO+kAhW398GhsR+NyeVLogDPE8m+n43UTZnPh5nWUN4NgGFTG
         n1/gR8JS16nCUJ6nO3O45P6xwQNtM7VCBpa1Vlwy5KYXvOoFf0GY6N91yQy4IL1DiWA1
         EENF6mH5Y4oAsXV5rIDhY6O92Yh+p5MDDnGQ0V9G+zn3KP+44kuMzFrDCW0q/abAQdGE
         9OMFx73rE1+IjeuoW/MYoCAOiVii2yXbvQk33lf8ygLnhQ18P9Z2gbLTyJhr9o8XRpcH
         zZ8g==
X-Gm-Message-State: AOJu0YzxO03Ou2bfRg8NwQ0Z84+INR+7alk7GvENik2+knKyp73EuBgl
	Z+pEVsWnvcz8APS1EQBsIZy3UaPJ+UHBO+AiZ7h/Q/CjK5lHlXA9QQratbPD0CULv6U=
X-Gm-Gg: ATEYQzyw2cuHhzFdOgbeN8CjFzqnWUfhYLhGPjDhItEDFArV1QWKI1qzDy908OtBU+3
	FcbJOZT1YeBydHHbqOb0C2QNXoTKSkUQvMaG8Xx+YoWsQ6bGVG9I5+xuNCRuNhVBNCmAMCSXfHh
	VpY1f+nd0EXpfZQaw3bc09JyT6TQS0SFRW4nAZ+ItTTnBg/UqYtvkBUleHNUHSoVy3tPWr3ErpW
	T6nb55XZIH+ftNEbf5jBWNTX35CQj4mPq3Z2jo6Fm5PffcaYQIiqEiiPEyBGTRMwfBBKuAPE/TY
	Q9WkT0bw0AxBWeUJZrqP+dMz1SqHPp5U304PciqwekBliyk/m/cBWY/TzGGZLvI1S/zCwn3dguT
	cLwEzh2Etoikcqj8zqmhwIS9jsteKxoUn9Wuvbcv6y+EbMQbMeq1bRbVu0bOmN1VmslYhXatOFI
	eIljG4rUHP2QtB01a51roE2+pw7aew
X-Received: by 2002:a05:600c:3e10:b0:485:3baa:af14 with SMTP id 5b1f17b1804b1-48716042a26mr92519025e9.18.1774511719082;
        Thu, 26 Mar 2026 00:55:19 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722fa8dc6sm24317095e9.1.2026.03.26.00.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 00:55:18 -0700 (PDT)
Date: Thu, 26 Mar 2026 10:55:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Cc: linux-staging@lists.linux.dev, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: refactor ia_css_stream_destroy
Message-ID: <acTmYxTHu9X4gqOY@stanley.mountain>
References: <20260325230453.848584-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325230453.848584-1-azpijr@gmail.com>

On Thu, Mar 26, 2026 at 12:04:48AM +0100, Jose A. Perez de Azpillaga wrote:
> Refactor the ISP2401 cleanup logic into a separate helper
> function.
> 
> Fix a logic bug where the loop variable 'i' was being shadowed and
> overwritten by a nested loop, potentially causing incorrect cleanup
> behavior.

This should be done separately and have a Fixes tag.

> 
> Replace an early 'return -EINVAL' with 'continue' within the cleanup
> loop. In a destruction path, it is better to proceed with cleaning up as
> many resources as possible rather than aborting early, which would
> result in memory leaks for the remaining pipes.
> 
> Remove 'assert(entry)' in favor of an explicit null pointer check ('if
> (!entry) continue;'). This avoids a macro-based assertions and ensuring
> the system remains stable even if a pointer is unexpectedly null during
> cleanup.

The assert in atomisp is a wrapper around BUG().  Add that to the commit
message.

You're going to have to redo this anyway because the i vs j fix needs
to be done separately as the first patch and it needs to have a Fixes
tag.  I would kind of prefer if you did this as three patches:

patch 1: fix i vs j bug
patch 2: pull it into a separate function
patch 3: improve the function

It's easier for me to review that way.

regards,
dan carpenter

