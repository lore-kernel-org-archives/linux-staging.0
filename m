Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024573A785C
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 09:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770197467; cv=none; b=oe+eWjCeNPgYrEpL/ogjbS7sTT84CIG2l0FJSv6i4MFudzQ9talliYmEyncU6vqEgngXM08eWGpU7xqtVt/+7XKAZmDFmdVSHcBLtgwxx65aWkQ1ORaIXmM2aWfEmv0fseQdHerJwm9grusXocdoAi9PttaGsGmbDoYgP0WQLFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770197467; c=relaxed/simple;
	bh=9pctG3bqLouoV3h2Sxss2fBOoc+MN07XFIMusz/S9I4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TUl9ndwc4uihMB+jReb7BYxHLH9jSpX7UW1q71NlyuJWAJHgHEOlgmeLWsg2EhyfZmLbL70t/nSFdPgCMtDpjRHmFQMVauvXMPYQoVUwAqeKcFPV2oPIc7DWkfL8RVoA2kyx3EPVkg3oEYZmvYByIfJyTE2bNTvOPcRF2XkimyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z7Wb9GRj; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z7Wb9GRj"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42fb6ce71c7so5581222f8f.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 01:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770197465; x=1770802265; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KG2GKfbQvjEW2JmZRuLJwTnuQG9bribyjhWUk28KFDY=;
        b=Z7Wb9GRjc1mYc05FZjMbTQTK1RnpkeU7ZOiCkhNonvRlMLQjt/m8PNh6+k8DyCJxva
         lbAWIXHurd7pQYKUbrH11QBO4feCgVp114KEU31bzzb85siq0nINr1Q2V+cZP6guxKuU
         xK4waHHFWEvTwQG8k027nrdQTuU/NgEUvGVNXiGVvhKHJVqo4qdYnoSO0jGE1n8Xoh+d
         2Eazv86KxBcv4TmiFJt4evMFfmfQlQ+KkIBu2U5JUVSaeh9OnENgZuA9A/mJkVgQKAQw
         ruRQYfv204RHns8Lr+mHr22T/qL0ORJSFTYYXfNDWmb/3SXux8l9g4ySYZzGLkHczkwa
         O1qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770197465; x=1770802265;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KG2GKfbQvjEW2JmZRuLJwTnuQG9bribyjhWUk28KFDY=;
        b=f7MxFsnF5IbjSyU6qdutsajEbAfMsjrrVvvMUdCosb4kg2JMLjJG631jr43SA8NYcy
         EOCujJdYRAC/ljMlAOExUGD/HuFlsYIhzM4u03adFMpcrwBIFtRZBogsZRrPDO6Ouxn2
         6ykUhGIhNnu/9h7PYfb7Mi/DPq1IMEu8osBjVJISFp8nVlNepi6hjiGvTftnBTYEJnRP
         TPPT5jVgg6eg2gAZ7cLyqqUTtfdEmIQ29KjKlU6dVCF/+mJVGBZgbvX8maq4YnFDUya0
         txPG4aemO49UHjHPHmPpJKxsB4o6OrGxGdM0auNlrQj8dWqLfIVk9/0+Wd3HElO5PCKz
         v5Rg==
X-Forwarded-Encrypted: i=1; AJvYcCVcjGJYg4TuBz83ilOhqLUjFOmUT5bGFXZEF1ONcZmjOLSc/HA1fGG+kQ2DZyf5jUXCVR0rQYkwXcKUQkar@lists.linux.dev
X-Gm-Message-State: AOJu0YzDQm9A6we7fPAZCilEnMhgFsXlJMgL7rQAH0xeThuqeJ+s4sWM
	VIUzeAhoZZFsWwJlOdSxBc+2p7Bcsg1r0y+/smVviBeQw/tpvE69HYd2E6mGdzrUxa0=
X-Gm-Gg: AZuq6aKsRz0eR8HDPOaEH4xHxCk/OhKWSX6WGMWK4lx1f5S2qb3wMIwMWvQtu9+BjRz
	a71eVlUIr7OrExWgKq/01DArXsfL5woe3UWN7lOvfiowj13P40xUK5KWueGtdgm+rDZViCQBNNW
	QlF+ZG2CbiRZS92OhLbDh9JYfJZnXOBXIiUFRvaImALrVFAMGgZ0oTaqYEn6WtQkiOOn8zGYe3x
	AIyswzRdQc0p5zHdfwfjciFeB4AAz7gtj1Qw0mIdn4o2B13iZQ0DvH3Vo4+XBpMI3jT8V/+cmXA
	Yl+xwnWGDo3G05Tg13iUPiGolr8qzZa+iHFogc/qY+NeTU17VRucQ5+lhoKaFDEcSfrfWZLzjQd
	HmyWTpr5UpZWh+JwcjSzLrIdPKP9IUTYmIJt9I8MK7ZZNYyLt/844OfqsDcJa3/CX5Y65IXHQRy
	0U+BtUzJQmiQ7ZTVtN
X-Received: by 2002:a5d:5f45:0:b0:430:fa9a:74d with SMTP id ffacd0b85a97d-43617e3fff4mr3072034f8f.24.1770197465047;
        Wed, 04 Feb 2026 01:31:05 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436180588bfsm5307015f8f.26.2026.02.04.01.31.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 01:31:04 -0800 (PST)
Date: Wed, 4 Feb 2026 12:31:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: KrishnaAgarwal1308 <krishnaworkemail1308@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "staging: fbtft: remove goto from
 define_fbtft_write_reg macro and clarify empty modifier fbtft-bus.c"
Message-ID: <aYMR1Q-Fifzts8gH@stanley.mountain>
References: <20260203044728.23774-1-krishnaworkemail1308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203044728.23774-1-krishnaworkemail1308@gmail.com>

On Tue, Feb 03, 2026 at 10:17:27AM +0530, KrishnaAgarwal1308 wrote:
> Replace the goto-based error handling in the define_fbtft_write_reg macro with an
> early return while ensuring va_end() is called on all exit paths.
> 
> Also add a short comment explaining the empty modifier argument used
> for native byte-order writes, instead of introducing an identity macro.
> 
> No functional change intended.
> 
> This reverts commit 6eec69e273e124dca8549fc52b0958b2953085ee. As per maintainer's feedback.
> 
> Signed-off-by: Krishna Agarwal <krishnaworkemail1308@gmail.com>
> ---

There is no need to revert the commit because we weren't going to apply
it.

Also checkpatch is going to complain about return statements the same
way it complains about gotos.  Actually, I'm surprised checkpatch
complains about gotos.  Does it differentiate between local gotos?
I can't be bothered to check.  #LazyWeb

regards,
dan carpenter

