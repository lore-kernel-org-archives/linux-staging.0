Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B44175A8E
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 14:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772634287; cv=none; b=T58q7k8FpngySHJ4sSGyRAn3dtOx5td7QB0FSLvmwzP+ietFACooD27QjkEsS8f7asHZY9zfDi8ZZPwykE2qUpQob6KjDTECm2Pl8aXIlYseNzc0WuGdoPZwwf0nKdHfuXFtb1qOkHD4AnG5RL33re02VFNXNShKRM3zB//FjTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772634287; c=relaxed/simple;
	bh=qvtp9cOPL28AfjMQQuP2kfpfH9rCoFgtAXBmC0n6E0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kEuCXubGm+QkxQ5y10CfRbwok57IRYa7u9V82y400NXOBh0R3SZ/K1cK1Ot5f/dQHmKIChg++89ZyOD4DlUtAmQbm1+5E/CJM1PDHf3KEoUIv4qY2yLzLKZxYl30TWnqaFSd1j+1jNkAyJYbmVaq3CaxxLOSowrejwZADajD6kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dp1wFp5L; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dp1wFp5L"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-660fb578f8eso1073919a12.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 06:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772634284; x=1773239084; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3LfyFtLkVvYJn6xwzstyzyPG8lEHIihq8sOpWTqCBFc=;
        b=Dp1wFp5L11pCMiWu0vYo5GJOxALcwKnXokm2rhJVWZQuxmvtSUHcE9+Y9sGAIJiqea
         xptl7fdVs84+BNjN6jw90ju0np0b6BHu/v1/PYWMeeCMtCDVcZhDXXteFbiOtOzd96Ze
         VmVSLW2YUcxtb1yxf9gb24TrCw3A+t5QRQJ1BMwYEZdWaQhma9pOQWXQx8Iyf3ODKAt6
         57Vr7eJvqusOB5qnLEi0f4h90VQ9IZlq+eBnHbG1dz1A/bfcOK/FoqbuSNXEiF46U1e+
         lGL9DzuEx/kN6Ny1N9u5GOko/iOevNFXzRWqQunvZPwKdGVryzg6fcr//mrlMewDyCE/
         FBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772634284; x=1773239084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3LfyFtLkVvYJn6xwzstyzyPG8lEHIihq8sOpWTqCBFc=;
        b=IIhQCcKprGVCCj4USbozJzJMlNz4KhGnBcvNh08eGHZYPWo+7o4xvPVeida0iMbjZB
         40dI9qaB9bZI/PqlI5jBThKAijqu5Nfz3Efpwy8rmWDbcZDFTE3roCPjQHiCNM8yZI+t
         AG0juiC2PBxrtrz8aoT0mw6lrXmSE3UGoPwlTsbtbmK8+X3scaQ0WH0aIpVzN2Fgv4fY
         rhSnZPFPSlCOwV31rXXW9E4cmUeYyuIpTgGlfwL7raO9rssIiU5QmTPKPHRmqVqGk1gx
         z4Y8wKuL98yDK3jK41QllGGDJhATdrTLTR4eizP903b1UEcSdK1/oPuaQmfFl3mpnBnS
         F2lw==
X-Forwarded-Encrypted: i=1; AJvYcCUb+wLgNiyYGS+ZBGRO0JRTc3dU/1FNGdp26pnju3VnePrhNGy9DNxhYWJ8If/zK4TsGgdpW8ymb+ljt8IV@lists.linux.dev
X-Gm-Message-State: AOJu0YxjqlEoRGfyBCOV7ul/TZqTB0ipdk7Oh369UpRO52thvC81ceGa
	KMw+sJ6tumRapWlndG3mxV2/X4E3RKrViJX/leCSJHZwc1dhJBUjuwky1xakO0JJSAw=
X-Gm-Gg: ATEYQzypss+5/9njqDY07ZDSq5T3DiMhzw+ioqK6rjXbY6DlGOrAwX5n/0aVf/j2zvZ
	YG3M2YlzBqOJbxsDhTextwKT7OfbNJAhkMwjD5fh7B3K6zrT2WAi+p21Lf/Kg06Yqb/6ZFo/OGT
	xQQdo7Rwvs6xcoBw2iof/fci6D1gCuilS+S0HphO2D/5l6tYDnlyrFiY6OxHhV8egfpEemLF8p9
	Ef+S3Yy7RzlNT2MrtXY6Bt1g8v3gG5MuWsDxmqeqfab8xHLQLK+Fblqk3+6T9S1fgsC/NbZlE0J
	amxbgfS7KdvqLy/qMzf5dgd0XwUy5xuiuUmU+pIdmMZdfUbpDesp06hUMrfONzlAk+R62TPsZpm
	EY6sCXq8n/sszZ5sfjNAsy4269r7G147t0z9162lRpQuPgJu49vt0JULcgP3YVRw6ni8+qPy4gU
	+i8N1kQeGPDuZKb/g/kitAyvDIWaYz
X-Received: by 2002:a50:8d89:0:b0:660:fdb5:4e2e with SMTP id 4fb4d7f45d1cf-660fdb55132mr709089a12.32.1772634284072;
        Wed, 04 Mar 2026 06:24:44 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabf6cfd9sm5644348a12.22.2026.03.04.06.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:24:43 -0800 (PST)
Date: Wed, 4 Mar 2026 17:24:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Soham Kute <officialsohamkute@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] staging: sm750fb: sm750_hw_copyarea: propagate
 de_wait() error
Message-ID: <aahAqNcuxpU--an9@stanley.mountain>
References: <aaVT1mSeKrSSlrha@stanley.mountain>
 <20260304084545.156170-1-officialsohamkute@gmail.com>
 <20260304084545.156170-4-officialsohamkute@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304084545.156170-4-officialsohamkute@gmail.com>

On Wed, Mar 04, 2026 at 02:15:42PM +0530, Soham Kute wrote:
> Propagate the error from accel->de_wait() instead of returning -1.
> The caller treats all non-zero return values as failure.
> 

The caller just ignores errors.

regards,
dan carpenter

