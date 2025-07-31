Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800F4216E26
	for <linux-staging@lists.linux.dev>; Thu, 31 Jul 2025 16:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753978282; cv=none; b=NzecbIG0bGWBnW9j69twwHiUO3mSbLD7jDoH4caHdSXCwGpl1l+WSqggc2+64pBl1E3jrAgJFKbZWmB6BEptcssp54TuMoYe6fOaj2hZHYHDxYNxKl9pH8oGYbp9ZhSjUFPLuw5g5MmcAXt6zXAfmNj9rAeSwJ6TTnd6I8hu73s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753978282; c=relaxed/simple;
	bh=XPJtLkScF22u86bMP4SDqxdWjENN1xCpfKx6sl1lASQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRvBBLMP7P8sAYsdrN7VsdPkYuHAJ9AaBL+2I4yOJhoyy/VD7SmUpMpD6HqCSOwLcjjE6L0U4lnjcEaHEI/aALJlGhiaP86bbKJsr54c6l7kChyuiIEUz0iveoeJIPk7U3ARJ01TB+m6xnIjMv2bebP9HNghB+uRn5fMsCsDHk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dvtsonEP; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dvtsonEP"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3b8d0f1fb49so231095f8f.2
        for <linux-staging@lists.linux.dev>; Thu, 31 Jul 2025 09:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753978279; x=1754583079; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0pKCmCd/yQbFcsUErfFrwExl3US45KhBWUDTffbqywQ=;
        b=dvtsonEPEZ3b3tgBbJaXQpaBeHdllR9R740rz4JGBhxEswr+Dr9BvEZwbMnhaDgK5R
         iuePZGYYuaJwRfRyyvx45shHDLegdXHsYe4+EEFe/y/o4dSNo+1vWVKvQve8VVT3XoZB
         2UACxQdZiHzSWaNoRyLv7ccLwomkCO0oqUgWaETQ6OQXNlDQaTGSwKL4U25SIFkEYD3u
         +ndEfr2F+o5PT7ubsnJMiZR8Fo1JryQKtRYhvH/+06W3lc6rm3DHLRe2A0HBDc+B+q0j
         +ZM1hQkCVuQnOyeSj/l/U1DV353CTVOPl71g62nzWB6072o10RHAvcnIf6PMovXJG/Zd
         kSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753978279; x=1754583079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0pKCmCd/yQbFcsUErfFrwExl3US45KhBWUDTffbqywQ=;
        b=v3E/prsStkECrGPdCSMJ69P0oX2qTmAu7BaYFF12zj9W6QY9m8qArqIQ+w0H6I3oiB
         bds35DTGk5Ed2nv2gglnfjAlPB6trdxE0o44Rflr0yklm9oII2J5+RAcfnUIMW31cRAs
         brBd3gHX+HWGHvEJ+e7SUnWUUwJ1VaS8iGWKLXqZU3tDYc7xAhqgmiHb25pe6bG3cNdH
         ZDp0ibKCJIv7xY4+mSOAZCkEzWzyGyLx5azBcWkuj4uLWE2JxZGIXeycd/w5DjJJn/Vb
         JLrLQjkr8Gi1Hz4IXx+8Bpx22+60BrF9CLN+KRQAv/2CwYurY5U0jyQ0ygmD7hFWnfvV
         RpVA==
X-Forwarded-Encrypted: i=1; AJvYcCVOxQMIW5bkp/xq2u/UZ7LnP61+uenWBiH1am2F5zGbjKd8NVejIXMAvTnmBBdg2E2WwQYB3Wh84QsndnvT@lists.linux.dev
X-Gm-Message-State: AOJu0YyZTs12gZKMQqlaC81R5p0fsJyHPTA8hnyhJFFR92a56UhzaIWe
	SI5ghTsb2aII7eZmb/o8HPI0+7+at32CUQwjH/vIsKkAaKCTwG5ibjNAwJnC9QGtAuY=
X-Gm-Gg: ASbGncvJfsSmTuoGNPtpQB5a5xQWaRAHopvf/AIqvlpz3Q3HMR+v/0nFJIExlCDjY6m
	IHlDyUr3uvZT2dk0olqmBBRfljkLSpntqjC06pqQVCov+gmuUFcDFLAL14AEST2DGOj5+NaSIgP
	h20LoWCnmgjTBAQ9nxl1MZHrHUN+hCWhUT0X61Yw8dGyLgDzx7zfa+yNHRolWruwoicQAAWQxQY
	MSY6TTPASigIsmg5Hvr1PX9aJoTDvpo3RpernwNg1xcl1FpIRLrumwlsHOnxUVBEeOtG0C5uLze
	2x6VGmwYIy6/QiXZUkjTbIg3zfPTWHgOqVGLZnuOcrqUxrdPsWYdelo7Fah1BubxQ7Js6zeptZ7
	cmaheOElJxbEEwaS1hdo/Fbhxqvc=
X-Google-Smtp-Source: AGHT+IEs0sZIeJXRDqHX2Z8CbdsVOdwVXngFwlkweiuRMlQRF2qpDns9PvEmRvHFDIc5h3NClMUWRA==
X-Received: by 2002:a05:6000:2003:b0:3a5:2d42:aa17 with SMTP id ffacd0b85a97d-3b794ff16e3mr6281554f8f.31.1753978278819;
        Thu, 31 Jul 2025 09:11:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c4a2f03sm2779242f8f.72.2025.07.31.09.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 09:11:18 -0700 (PDT)
Date: Thu, 31 Jul 2025 19:11:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [bug report] staging: sm750fb: Fix polarity assignment for
 vertical and horizontal mode
Message-ID: <dbd2df69-27cc-4fd8-8e5b-78b6872d5d16@suswa.mountain>
References: <20250723192528.77109-1-alok.a.tiwari@oracle.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723192528.77109-1-alok.a.tiwari@oracle.com>

On Wed, Jul 23, 2025 at 12:24:31PM -0700, Alok Tiwari wrote:
> In drivers/staging/sm750fb/sm750_hw.c,
> the vertical and horizontal sync polarity assignments were incorrectly
> ordered. 
> The assignment for modparm.vertical_sync_polarity was mistakenly using
> the FB_SYNC_HOR_HIGH_ACT bit instead of FB_SYNC_VERT_HIGH_ACT, 
> and the horizontal polarity line was commented out or missing.
> 
> This patch corrects the logic by properly assigning:
> 
> vertical_sync_polarity -> from FB_SYNC_VERT_HIGH_ACT
> horizontal_sync_polarity -> from FB_SYNC_HOR_HIGH_ACT
> 
> Please let me know your feedback.
> Thanks,
> Alok
> ---
> Fixes: 81dee67e215b ("staging: sm750fb: add sm750 to staging")
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
> ---

Did you find this copy and paste bug by testing or reviewing the code?
How does this bug look like to a user?  Please put that in your commit
message.

This looks reasonable to me, but the patch is badly formatted.

1) It should say [PATCH] in the subject.
2) The body of the email should be the commit message.
3) the --- should only come after the Signed-off-by line.

Try applying your patch with `git am` and review the log to see what I
mean.

regards,
dan carpenter

