Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A5E168
	for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 15:13:38 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id 14-20020a05600c028eb0290228f19cb433so3756158wmk.0
        for <linux-staging@lists.linux.dev>; Fri, 23 Jul 2021 08:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=PTknFqwDEG5+u/MwyGTY6e/TieiPOQcfrLwoM5fuVkc=;
        b=SE1bOFv0fTlMJ7dqvKYzRz9MINPtUiEii2KKns7raNvkZEG4bC0f25k3IEwdkMMqx1
         hjdAfaPytnDxkukSxVhz/Pv/UEshT9A8QRgvbJciwZoby4Q5kzCK+2gjfgqTFzriqyIy
         05qMiZtVHSH5hjZenZErcsavyY/E9n45zARR8dbuAoURost7C42s9Mu+lfsxZVdKytqW
         y6LbykKl2HhjLyxPEKtz18De8xM7VYgJfvW0ly/8yrpk65xxMqtiPSNwzJnl35k9JhBm
         lXrD1B2aJoZGsbREqU3eSqgxFeyH/qo6hcM3mh5xalomj6sUmbK2K4p4o9iwcSSEY0U5
         KyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=PTknFqwDEG5+u/MwyGTY6e/TieiPOQcfrLwoM5fuVkc=;
        b=QYCt6prEn6N6n8O7LTzwFoyHYepkhgz6pA1iw2fDl7PAR6ANCR2/HTx7LQSJqu28pq
         edhc/YjqEsVHFXAC+9ctsYK5kfr068gwjmtU+ppKcYK4b3uMWALLZGVAVjyoU1A2bLgC
         jtvWlblOsVsbfu5duMASt+8mvRjAebjqb/5nSsrGy6g2RsPn2Q5j9hCvudQhtbk1kwgz
         ewmsAfm6HK1O+tahykpydl4Ti074hCwmbx6oYpGJIleU4P8BjD5S1tk0LhOkJNbB+T7t
         vWbWkk2G/hVfHXH7joCEolST3FzoUAxQq+OjDhN8bX8wjlG2dTAxU1R9eUXKWAhLMPht
         XPzA==
X-Gm-Message-State: AOAM530OBbleDLhagduWVeAMu8GI7NFbmHmgqFvUgJjkY156AEkIn3Wf
	OEnAoCQtnuT0X4Xj3LJjP8U0zA==
X-Google-Smtp-Source: ABdhPJzTMd+qGfuPa/CQeGlM3g8Z3KuPSGqufC8PoIchY8WtTomZONyf4lhef5ufOGsSb9gtIrDECw==
X-Received: by 2002:a7b:c84d:: with SMTP id c13mr14850302wml.30.1627053217297;
        Fri, 23 Jul 2021 08:13:37 -0700 (PDT)
Received: from google.com ([31.124.24.141])
        by smtp.gmail.com with ESMTPSA id s14sm17109718wmc.25.2021.07.23.08.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jul 2021 08:13:36 -0700 (PDT)
Date: Fri, 23 Jul 2021 16:13:35 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Lucas Henneman <lucas.henneman@linaro.org>
Cc: greg@kroah.com, forest@alittletooquiet.net,
	linux-staging@lists.linux.dev, trivial@kernel.org
Subject: Re: [PATCH 01/15] staging: vt6655: remove filename from baseband.h
Message-ID: <YPrcnylo47dFU8Cl@google.com>
References: <20210723144340.15787-1-lucas.henneman@linaro.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210723144340.15787-1-lucas.henneman@linaro.org>

On Fri, 23 Jul 2021, Lucas Henneman wrote:

> This patch resolves checkpatch's warning, "It's generally not useful to
> have the filename in the file" for baseband.h.

I would paste the exact warning you get from checkpatch.pl, warts
(line numbers) and all on a completely separate line.

> Signed-off-by: Lucas Henneman <lucas.henneman@linaro.org>
> ---
>  drivers/staging/vt6655/baseband.h | 2 --
>  1 file changed, 2 deletions(-)

Nice first attempt at working with Mainline Lucas.

The premise of the patches seem okay.  I don't personally allow
filenames into new commits in subsystems I maintain.

Seeing as though these patches are *so* trivial, if I were Greg, I'd
be asking you to bundle each of these changes into a single patch.

> diff --git a/drivers/staging/vt6655/baseband.h b/drivers/staging/vt6655/baseband.h
> index 9354ce724446..0a30afaa7cc3 100644
> --- a/drivers/staging/vt6655/baseband.h
> +++ b/drivers/staging/vt6655/baseband.h
> @@ -3,8 +3,6 @@
>   * Copyright (c) 1996, 2003 VIA Networking Technologies, Inc.
>   * All rights reserved.
>   *
> - * File: baseband.h
> - *
>   * Purpose: Implement functions to access baseband
>   *
>   * Author: Jerry Chen

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
