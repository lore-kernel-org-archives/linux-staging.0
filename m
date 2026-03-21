Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D28E3002D1
	for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 15:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774107167; cv=none; b=LosiA+W8d65t30nAWq4WDiYWJfr1KUwVy9Fm256wXE7zSEPcqfbqhi6LeGioYfQSNHdDuMCHrhzOlGsA9bJM10KSDSXXc7ccGCYlgThe3CkhUUqtBFEx/eiFZ8TN5icNAAqp5rHyRxeFHbLiyxFYYbiUl2VnkIqp0xINXmeXxSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774107167; c=relaxed/simple;
	bh=nw4QcdSFUVxY7JeDmPlncuCvC4La8p06UFbAu6YKNFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BkZpXXuw1SynZdnG/M+DU7mq2H6w2dUUi1eKaOOcFEJonq0GNO4U5qsxXxsfIGhTDyjhTk8oxCLJkfhIdjcWXKs612/wjMIrDFiT3zE+lcxghzlMw1K6tqsEoYKK7Kp0AUDXvScLozBpSXTHV0L8UMopiwU4apfP6gkEmBn4cCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q2m7olMc; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q2m7olMc"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48541edecf9so28800665e9.1
        for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 08:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774107165; x=1774711965; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3dzHj/qPvXNDV/FPnpoktTjASNEPHELip3yFLAmvNe4=;
        b=Q2m7olMcCoGdY+y9GRaYUEJQqR7VVOXrD446TsSO4u47Il2+oEzLt9fDQ6eZN/cAxl
         I5NyhILdxtfk0c3+D4/VhueUe88X0TUVF0Hq0LbkoC7Oramt7rC0It2Sk17HQOM+I4jh
         x4fJJmD9mEjz+dYF8RL54p/Xs0J97YffDzJ/pMeCKp1wNVnqP4eE5En3bBATmkVroAKu
         b8O7Xj6X1vKQt3i692MjIEpAd5FEcx/PJR7ct5h6+fe01ipBdc7VydCyNhjNiPMD+U1K
         GvGG49jdcHa5KIwsvJPBZx98V1B3S62twQzBfEpU0U26e5jT1RSo11jwqgvOBORdgJ5c
         zcww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774107165; x=1774711965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3dzHj/qPvXNDV/FPnpoktTjASNEPHELip3yFLAmvNe4=;
        b=PKx4SjRHx7K2320Qp1/zsZIbo81cYhBQirUHMibAk39jW3W0+6/ftlt4xdeqPhPaqD
         qqVEgH0QwIHas3W1lkQH2jpeHTuD0QCXn47ixxZkj9Ji21PMH27AsZI9oNoYCtXi9QcG
         GYJ/qtm49qVlejuApPEgBwhgh0o3e1c27yxFaLkHq603IYQykuTKKl4fs673QEAUZ8TA
         +Cqwib/6Be4r9lhNSyVnZC3AqCUV6AuEnpdX4wtI17EXo+dpvPsl1fVJ8UKRH90HVQ+8
         u4PYlvW4ZSwx6F/z+b2ksK/zDbFGiXKlDqNGGQqMynns4xqDP2iERRBuaYcCms9f2fWo
         qGdg==
X-Forwarded-Encrypted: i=1; AJvYcCXsOKo/nBWkOj+QVCZqQUAy4XhPpjl0S5WfVxL/RpXajDjR3Vlz17xjUMB+MuawfSupNIUajnngNk56AJuv@lists.linux.dev
X-Gm-Message-State: AOJu0YwTh3kfh+FztzdWK97gvyyXG1cZEfNIaJgze7c5YQXjphl0yvSu
	J1VQtm+tvix/qiPFNwgHckS4RrurPQ3zHNR5xdw0ZcXlShjuyUfzoVkO1qlERm/FNuc=
X-Gm-Gg: ATEYQzwYYJZTF+i9JeQ+O73BUlY41NQE4mRsgRxgy4lOCjtW7FfvOkuMxe9Wfmn4/gu
	i1E2ACONASv8Z52J8FqQYdoAODtW1yaz5Le6U+3lGFXziiAOHnRwDsSXJ89UczC4c8ki2VpJKGZ
	ijo5XruWWK146/REQUorUvyOxqAoXw8aih+CkIOLmqaGgJCBXOUjXu8uUDRORxQgWSnhrgblfXa
	4tDdtdFNVVvBQ7RlnyEa2L8obKJOnJfHP6uFMIkhdLHtpYO2Ez+Io74C75RL+UEuCHa3G/rJCVS
	EaZBt42G+0qF9sEN0D+Vjscv/H581wFKl3/PP0Hufl2jBucJIGeMh8G9+2UoySmL/OUhUsOffc8
	I8jmYUAAqHO4qBaP1pthNQuQMayr5Ig8SnRdwJrzU9S+uqFoKl5q2OQ02e0TMfdvtWCnqF+WlGn
	lw1UtfU6XpB2jjjycDLn4KOlsLcOK0
X-Received: by 2002:a05:600c:a47:b0:486:fc46:be9e with SMTP id 5b1f17b1804b1-486fee265demr102213965e9.24.1774107164594;
        Sat, 21 Mar 2026 08:32:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487004e7bc4sm52580815e9.2.2026.03.21.08.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 08:32:44 -0700 (PDT)
Date: Sat, 21 Mar 2026 18:32:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Gabriel Rondon <grondon@gmail.com>, lars@metafoo.de,
	Michael.Hennerich@analog.com, gregkh@linuxfoundation.org,
	andriy.shevchenko@intel.com, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] staging: iio: replace sprintf() with sysfs_emit()
Message-ID: <ab66GQeWKck9rTSs@stanley.mountain>
References: <20260319225719.73587-1-grondon@gmail.com>
 <20260320222424.53294-1-grondon@gmail.com>
 <20260321130307.7992dfb8@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260321130307.7992dfb8@jic23-huawei>

On Sat, Mar 21, 2026 at 01:03:07PM +0000, Jonathan Cameron wrote:
> On Fri, 20 Mar 2026 22:24:21 +0000
> Gabriel Rondon <grondon@gmail.com> wrote:
> 
> > Replace the remaining sprintf() calls with sysfs_emit() in sysfs
> > show functions across three staging IIO drivers: ad7816, ad5933, and
> > ad9834.
> > 
> > sysfs_emit() is the preferred API for sysfs callbacks as it is aware
> > of the PAGE_SIZE buffer limit. Build tested with gcc 13.3.
> > 
> Firstly a process thing. Don't send a v2 in reply to a v1. It should
> be a new email thread.  I'm not sure where this style is coming from
> as I've never encountered any kernel subsystem who ask for it.
> 

People used to do that in the early days of git, but now no one does.
It breaks patchwork as well.

regards,
dan carpenter

