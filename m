Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2555779E1
	for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 14:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722350821; cv=none; b=jdxMKvW0zQa4TnKUvFGTJ7oCQroFUZWeE/H3GR3qA09Nx4/E4Rep3WihYaONEpUnK9wDph+URS3ymevFQ+cxaYyCXDn9Q5Ch2Gzh1Q/pecktBaZRjpIIDjixqNnT6HqXtPuX23iDZPa2HRY8TD9zfVEORF5H7sfhN1gbe6gsuok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722350821; c=relaxed/simple;
	bh=kYTYimlYBjiquYDmbW3OVap8P13dPnSkQlQ5r4BDh/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NJdhPBZNs6Z481gP4/hfpmGx0RvZ9dk7/84nadfdfSbhB8dC460RQdK4sBUyx9PLoIvq11/h6DgPxZdtidBNhGKWLU2LWZJCqNf3WvuWQes4DFU9g1ZOFzbNmXMhYUnRti0d8Zh0w9O2+Z99SRz+yUEAKxkFEL3zXiNQW97YLkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RaK1LQLX; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RaK1LQLX"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7095bfd6346so497415a34.0
        for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 07:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722350819; x=1722955619; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=19bzD3dFV7tz7aCe19kweAd1yB7wIjeVyw1SeEg2Kvc=;
        b=RaK1LQLXx/VXNadetn3QR6RG9uiMhl6PXzufK5XQouU3YPvvmMxygSkBt+zA78Nz3D
         e3htsXv4H6Wpc92zDjQTRlXxNeHrH7gLVMOTMCSkmSG8kSY2oq+D2LnI0MUfljXG0e4R
         3DgisG/vJJ4PZiUg+sdM92JdZNQztDVaxdeN+NdmnOulYa/3n2vWnaZLZOwmz5bWGAop
         ZxR5Y7ocAxkjBNhCgO4RK6KZEQmStdSV+rxdKGAqWJr2TCH2gfi4q99iMlx43JgxN8th
         ZprirFBmDoUB495LXjS32iOOf56Anv1R/cHisAlaCbduICbUuT9fC31tda0W2WfjRL6K
         TixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722350819; x=1722955619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19bzD3dFV7tz7aCe19kweAd1yB7wIjeVyw1SeEg2Kvc=;
        b=O3XNgmj2mjGivyVBtAErmhzEpwqJaSJu47TcwPOgPn2bLp2qKUfAO6kAxzHQaotOfC
         5u/2fReB4nt7A6rpZy48wuSUsDmHh5Kpa/juiC0f9sZ9i8uwpG92QkHr7E/S02CAlVl3
         vW1Bmr+nM3fWuafJFMPoNdiYpMabJnK/hXKgekrFy5PcOrYGu/cL5/F/t2FbLrKhv+ON
         1jEG10zWLmDLHNuXHlYGXNlaX4rv5UyFDvduVxdBl0p1wiCV/E++8giFIo5V1bpaWnAf
         zwJcGbTSalK42Anqpe2By0VqXATgJJwL9JAdrwveNKf1jm6o/bF5w/E8o0JvC2fFUD8m
         DBrA==
X-Forwarded-Encrypted: i=1; AJvYcCXa87Y6kh3Ee0voadlQza8w6bACjV4z7faw0mR8Ae3Xr7IfX9qIbQGwe62b64TT9lXR9qb0pL4qSfLmIoUwLf/pCIpMJLAmADSKKblqAg==
X-Gm-Message-State: AOJu0Yy9mscYGixMNTL8GH197i2u7sBtxoOQqQL/Qvod6VcHdsVSbDop
	PMf4IcpUj/9g9XFWgzvneoeAZYRL0hOzOZowobwEfcizeD/34ve/r4473LmR96XUkr3X/+kG9dM
	hEhs=
X-Google-Smtp-Source: AGHT+IFzmIHN0DOkgtHQwpPa+Hy+IykmpFZBDq+APGpQyBzcGQJhlffeH0XZLGJ3D0C3lyQkcihSlA==
X-Received: by 2002:a05:6830:6819:b0:703:6543:ecf3 with SMTP id 46e09a7af769-70940c0bb40mr11828257a34.9.1722350819159;
        Tue, 30 Jul 2024 07:46:59 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700::17c0])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5d5b35c810asm1236669eaf.22.2024.07.30.07.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 07:46:58 -0700 (PDT)
Date: Tue, 30 Jul 2024 09:46:56 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sai Sree Kartheek Adivi <sskartheekadivi@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht, helen.koike@collabora.com
Subject: Re: [PATCH v2] staging: rtl8723bs: style fix open brace on new line
Message-ID: <ad55619f-f663-4bc2-ae73-aae7dcaa4272@suswa.mountain>
References: <20240730065901.35254-1-sskartheekadivi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240730065901.35254-1-sskartheekadivi@gmail.com>

On Tue, Jul 30, 2024 at 06:59:01AM +0000, Sai Sree Kartheek Adivi wrote:
> It fixes the following checkpatch.pl error
> "ERROR: that open brace { should be on the previous line" and avoids the
> warning "WARNING: braces {} are not necessary for single statement blocks".
> 
> Signed-off-by: Sai Sree Kartheek Adivi <sskartheekadivi@gmail.com>
> ---
> Updated the commit message.
> This is my first contribution. Hope I did everything right!
> 

The only thing you didn't do was explain what changed between v1 and v2.

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch/

Please send a v3 patch.

regards,
dan carpenter

