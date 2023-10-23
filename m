Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B129818032
	for <linux-staging@lists.linux.dev>; Mon, 23 Oct 2023 14:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FqiiqYSm"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4084b0223ccso26334105e9.2
        for <linux-staging@lists.linux.dev>; Mon, 23 Oct 2023 07:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698072102; x=1698676902; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=u0+KyYoYHk/UMVzb9ufT5X/yFDuVJYSaudNnGVYxEZs=;
        b=FqiiqYSmM4vqyGavx8d9Js7nFJYUm3LOYTrStTpHRFZk4ill/mM98wOB+MLaSDbpXN
         LksiJ3wMVqoX3p5ehDa6bXnIWg0iMbY4oVR0cK61s5/bw4EYb7ekjGapK6pxO+XEmZYx
         0P4nFYZ7cGeAaGj28pYW3RNd0WdO5uPXqdjCm/MlSO7kKWQEDOAGL6CBdaCkhV2eXMzJ
         fkOOuNU/T2FMZkoyNxmqAvAhvn5PqaMTh/gad4jSQ/yB6vEDcxa37Sv0n+2Go/NsZ4FZ
         pXOMPbaKCE9iQxWryacv4/kv31Y8j52t6UiU0yCz8o/UQKlqK4kE+Q4tPJfQGfIsVANE
         MG9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698072102; x=1698676902;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u0+KyYoYHk/UMVzb9ufT5X/yFDuVJYSaudNnGVYxEZs=;
        b=YeroyGGWw+ArH+rFqEdpg9BfXazvvF3RhlhKnMn1x7JTjsNmA2vkTtqrb0HaXdxbP5
         8Dry7abw+osMwergoFyCKMhuaejiCBXCGSbqf8Ecc2IKZ2FqYGWnRFBn8Oz8++LA88er
         IoKIrTfheUx4kDN9DRKDambfmm0ykbu3XYWK2AAHo7MacV9K62W+d5hwl90Wg+tR8F3K
         MP8C0F5rfjYnZ5QfuGtAUmZJe9K4nA6pUJvbHcqx4kDzxeXVEbeCUxyJmZspHi54wdaX
         UyeK88eTNImt/5DgbP+OQuklP4WH+dhUb2mgi8fYUNFDEYXXcVDzPzMdm472RCC06NeG
         Y/tA==
X-Gm-Message-State: AOJu0Yw6QRTyNH7gf02XN22AcMC7lkigLg3/lHD4cGY9anElk2Za+ZYR
	vEjgSedSrBHVojcmf9yDvXjJRQ==
X-Google-Smtp-Source: AGHT+IGxEIbZFmB4AraQ9pR4q3k4h9U2rvbNCkh34AC3yOH97A4Jl2sj3Io4ZVIo8/QLVKu9SbeaIQ==
X-Received: by 2002:a05:600c:4f81:b0:408:55f8:7de with SMTP id n1-20020a05600c4f8100b0040855f807demr5528052wmq.28.1698072101799;
        Mon, 23 Oct 2023 07:41:41 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p12-20020a05600c418c00b0040773c69fc0sm14127963wmh.11.2023.10.23.07.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 07:41:41 -0700 (PDT)
Date: Mon, 23 Oct 2023 17:41:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Jonathan Bergh <bergh.jonathan@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/7] staging: octeon: Fix warnings due to introduction
 of new typedefs
Message-ID: <7e866f48-840a-4b9e-a28d-2016075abb4b@kadam.mountain>
References: <20231021101238.81466-1-bergh.jonathan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231021101238.81466-1-bergh.jonathan@gmail.com>

On Sat, Oct 21, 2023 at 12:12:31PM +0200, Jonathan Bergh wrote:
> This patch series fixes (removes) the introduction of several new typedefs
> for enums and structs in the octeon driver. First the declarations are
> fixed and then implementations are updated to remove references to the 
> old typedefs.
> 
> Changelog:
>  * v1 -> v2: Fix breaking change spread across multiple patches
>  * v2 -> v3: Break changes up into individual patches for each removed
>    typedef
> 
> Jonathan Bergh (7):
>   staging: octeon: Fix introduction of new enum typedef cvmx_spi_mode_t
>     in octeon
>   staging: octeon: Fix up introduction of new typedef
>     cvmx_helper_interface_mode_t  in octeon
>   staging: octeon: Fix introduction of following new typedef
>     cvmx_pow_wait_t in octeon
>   staging: octeon: Fix up introduction of new typedef cvmx_pko_lock_t in
>     octeon
>   staging: octeon: Fix introduction of new typedef cvmx_pko_status_t in
>     octeon
>   staging: octeon: Fix introduction of new typedef
>     cvmx_pip_port_status_t in octeon
>   staging: octeon: Fix introduction of new typedef
>     cvmx_pko_port_status_t in octeon driver
> 
>  drivers/staging/octeon/ethernet.c     |  6 ++--
>  drivers/staging/octeon/octeon-stubs.h | 48 +++++++++++++--------------

Please don't change the stubs without change the arch/ code.

regards,
dan carpenter

