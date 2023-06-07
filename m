Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A4E61ACBB
	for <linux-staging@lists.linux.dev>; Wed,  7 Jun 2023 15:07:28 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f732d37d7bso36181225e9.0
        for <linux-staging@lists.linux.dev>; Wed, 07 Jun 2023 08:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686150447; x=1688742447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KH8Z1a3lx04BjjGgQh8aDWIlPdF1CYV0Q+kaQr1wwYU=;
        b=RPz/yVLPBvrSoUXI4bmqeFypmd4VQR+o8OHdrINgHbgrp/k7jrVOrjde4qcvKLsL1F
         OmpuDXucztTOMvaaI5Ro0E9arPla6VDp6H35i6sES8gBoQTqfL6qwgi1rWJKN9GMwKKE
         4zMW5JG+653chqLbFD3Kj0JVzDRRVILqLlufxrwKmcykTVfpZxy7CmlQBuaeocIjTdZq
         pwpJ5iDwxsh7FyZuqgiSDfD+NaLJmjLosA6KD5e5nyJ8fR3M86x15HPVZhjQFA6xrVeX
         SNW2mrUz+4WK3FE6hNiS1cfuCvTODSDBuTjrhvs3KdCW7/3pLCOucs8YQ7d8hxcJYlG3
         08ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686150447; x=1688742447;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KH8Z1a3lx04BjjGgQh8aDWIlPdF1CYV0Q+kaQr1wwYU=;
        b=EBJ3fgTeT+goMRFppygnaCg+yNQaNp1/9RpSlV59qFsfocitlendG0RMd5+JBb8HNH
         RcLM8DjXz+ODVuLba/9Ztlvfp24u28rbN2i+VdOdVI9cMtMsa1lCEL0MnKW6fTqieEXP
         u1c2zcmg77XyD5nWOpTWZio2PW4hVKZWGWIyQweLxli8Z+uSVmNQJQQTWpidGHISTCVM
         FX1Fvpq+obeJMzwIJf24dYF1gnRDjdTDvWfvPh4DN+h3ZE2s6TeyfYKOx5Y/6dTW8kRW
         3mNM8D50rF4cluXGpITB/5yqZeenTkOUizE0RCkLFx02RCqf2xp8oh1fUsBtCv+qEnGW
         oTQQ==
X-Gm-Message-State: AC+VfDwOF/kqEEvCB6c9rshzPXsRFFmyNlcKXbmwLUoJy6HzHEEfMhBA
	KJn9NYwABFuC+3xMn8I/yhAanQ==
X-Google-Smtp-Source: ACHHUZ6KhqbmwhFvTf1Jv9nGQY+WC2ITFQzkw+o7B+v+PixosEq1f3BOeT1qq/1BEiYg+pf7QJ0Ysw==
X-Received: by 2002:a05:600c:2150:b0:3f6:58ad:ed85 with SMTP id v16-20020a05600c215000b003f658aded85mr4808156wml.10.1686150447182;
        Wed, 07 Jun 2023 08:07:27 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v4-20020a7bcb44000000b003f7e4d143cfsm2446750wmj.15.2023.06.07.08.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 08:07:25 -0700 (PDT)
Date: Wed, 7 Jun 2023 18:07:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Yogesh Hegde <yogi.kernel@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] staging: rtl8192e: Remove variable SetWirelessMode
Message-ID: <01a162c5-f0de-47b1-97e7-8a451a89df80@kadam.mountain>
References: <cover.1686149467.git.yogi.kernel@gmail.com>
 <fba56522e419351b05e33df8cd0ac31806534d8c.1686149467.git.yogi.kernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fba56522e419351b05e33df8cd0ac31806534d8c.1686149467.git.yogi.kernel@gmail.com>

On Wed, Jun 07, 2023 at 08:31:41PM +0530, Yogesh Hegde wrote:
> The variable SetWirelessMode is set in only one place throughout the
> driver. This patch removes the variable and calls the real function
> directly instead, eliminating the unnecessary indirection.
> Additionally, the removal of the variable aligns with the checkpatch
> guidelines by removing the use of CamelCase.
> 
> Signed-off-by: Yogesh Hegde <yogi.kernel@gmail.com>
> ---
> 
> v2: Removed the variable and called the function direction instead of
>     just renaming the variable as suggested by Greg Kroah-Hartman
>     <gregkh@linuxfoundation.org>.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

