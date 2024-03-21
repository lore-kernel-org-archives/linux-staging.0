Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740763B2A8
	for <linux-staging@lists.linux.dev>; Thu, 21 Mar 2024 05:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710999703; cv=none; b=WNianwAxqRJkXEXYMPpvB2VwXSgzurU3/Tg+Y40oiByRrXu9P2aTOFjZeQpM25kaFXAmLhfJASRLcUPi00MJBSph/0ILUfB4O2O79beNFOLYPjcrl8e/1CD0acrqXGxlV62qczj8f3fADNuu2khmM4a7XvOSAQNqmwZnaZxgrfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710999703; c=relaxed/simple;
	bh=sLCJ5w7ZjIc5OwI8r6fw90adJAwfvrKs/3vsEHc06vo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=alG/XVPB5HGw63+d32RMfbl7vDGJWAnYPHTt2uB82GFUnUPg7jYSmq9EKgtk2XSK5RJfzF46pT9ih4q0GTdkxjp2E8gw/pUasXGAGn26ovEE5vcOWYfoBc3Z7TieKYHtCAkDUeYxEsEbqDlJmieX7V/pn/wYwCpLLR+pTPNLu+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O3kKqwjA; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O3kKqwjA"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-41412411622so4185505e9.2
        for <linux-staging@lists.linux.dev>; Wed, 20 Mar 2024 22:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710999699; x=1711604499; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zm+dDDn/qjmssizpNHCqnR6eRhc+Lz6SbwtuAIJ0yjA=;
        b=O3kKqwjAQOcrn5doWfWfxbeHxmCtR9dwHW8Ff6vLJSvYOrljHP5vPYwFHnm2uDN4JF
         e+gvwZaqdNHeVXkJE2aUA2vT3GSIjNHfBIM4aAEnkeCLVVhdL3BTrUS04UWLQ4fZgwSb
         z9XSDAb2fwNC+ygkzr6MYVSygZplMYEUvHXQB5Vu9Yjt4NgK4AaLpAbkdKVYOPRjGo4e
         atWzoZ5MtE4zTz3EwSV/7BE9DmtR1RpxgB7VETvdejAmvBRG85q6W7smcLAs412ReKcI
         m9lFPyJ1pAiHqG9jTisDoicn9THZYjkT3oujL98mJ7BJsv0rkF94bCznWZ/i81ltGUuA
         JoIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710999699; x=1711604499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zm+dDDn/qjmssizpNHCqnR6eRhc+Lz6SbwtuAIJ0yjA=;
        b=JRNilxzUlk69HlylCFzpDnUcwm+9ORgewbj3K66PjlSXQtJQra6KEfMcYDM40sKDPJ
         4b1M4oSAfiLrU+SiIEcJA9LZoBPRGU7Xq4wj6FYf64HewEn2AQJCWtEiFRwgg3DHJyWV
         2mRzFqLZ0qPJ5QRPAwliAx61GKuIOry4oE0W4uv49wcBIfdi+AH6JqjJbfmH+ZNzmCnF
         y4/mcWIzLggcUUGcKo/p3jGMqTF7fhNE3DIC01qFhuXBAghYjw2UtfWAtNll2JxiHydI
         JGgUq5A1V7kumnmvODNMBmJNB38XxAM5bgDT5Dme+czYwOpa67c3EU+PIfsll4bMyGDl
         PzeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQX5mJ5EsA46RfIorhNy/6751hqAWCSEsnvj9tY3SSoFBnFCTB6f2dmpzej5r6dfkyaqdmPNaqtpnA5dmEJPF1dCaDzuvFGK+uNMwHKQ==
X-Gm-Message-State: AOJu0YyVRqxMGe8zA2OUi3NXG5TwZGGUjBQNcokba9jPCL9g/OUnxIaM
	oDl+Dgiy12hPoeWfX7knMMCGjsWux3D9+Hac+PJUfyTjgkIVz2wtVtprz+/F9Io=
X-Google-Smtp-Source: AGHT+IFDFiJPls7HzGZtyNHBa42C+coG8tOL6Rb1hcMWDpZDq0e6ExNBc1UHVkYbAtN2t7TZXly4Yg==
X-Received: by 2002:a05:600c:310a:b0:413:ca0:5cd1 with SMTP id g10-20020a05600c310a00b004130ca05cd1mr488156wmo.39.1710999698539;
        Wed, 20 Mar 2024 22:41:38 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id fm22-20020a05600c0c1600b004147266a37dsm1370015wmb.30.2024.03.20.22.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 22:41:38 -0700 (PDT)
Date: Thu, 21 Mar 2024 08:41:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chandra Pratap <chandrapratap3519@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: Re: [PATCH v2] staging: sm750fb: Replace comparisons with NULL and 0
Message-ID: <51797d72-056b-4762-a328-1d968803b931@moroto.mountain>
References: <c4a5e9e8-214a-4ac0-b8ee-01a9e7a1e5f9@moroto.mountain>
 <20240320180943.3683-1-chandrapratap3519@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240320180943.3683-1-chandrapratap3519@gmail.com>

On Wed, Mar 20, 2024 at 11:39:43PM +0530, Chandra Pratap wrote:
> Replace '(opt != NULL)' with '(opt)' and '(*opt != 0)'
> with '(*opt != '\0')' to adhere to the coding standards.
> 
> Signed-off-by: Chandra Pratap <chandrapratap3519@gmail.com>
> ---
> Changes in v2:
>   - Update the commit message to reflect the changes better
>   - replace (*opt) with (*opt != '\0')
> 

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter


