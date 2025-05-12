Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22A522A7E7
	for <linux-staging@lists.linux.dev>; Mon, 12 May 2025 14:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747061335; cv=none; b=WZv5FSl2CGHQJFIgCvTjHCGewTf35u2jfnE3M9rW3L/X/4NZr54171OrOz3/AfYEW1UpdKBaFjT5n382e7g7rOJNRoXj4Dw/UnIB3LFBs9DQlJ4KJv2HAulzT83hNBytr6WpVTGj61saeFfEw2BqJH/ydrW1CAKA85TF+cHQXYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747061335; c=relaxed/simple;
	bh=0+DA0HchI6skejeO2v9vUR0tvdYQj/hSzdF5ikllf5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qY/5up+gDB3/fRiNuFMUg124SkhfwiMqZ6bJAKnVPgS9hFyPHpjv19Ocj7utRyaDFb17U8SiXEH7F1tXylPFX91N7C//d+UvuQld7RrYDo8XvAf/DOtMtDT+sx7pHuwk9tntu1R8oxFQne+fQHTKwOUAqKaS7MiRL8eo1GGjLNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A8+fVUAV; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A8+fVUAV"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so52235625e9.3
        for <linux-staging@lists.linux.dev>; Mon, 12 May 2025 07:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747061330; x=1747666130; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oOY69GPeY7sxhniN+8OI5OyPI2xNU8bnc7SUmdP2Sh4=;
        b=A8+fVUAVZy9L3jjPjwkmsIJos0gM06jBG8+j2EyxYUDxYq5ICHBiSWwkuBldbmxcJv
         FkPTipJK91lk6k7rl2DUS+mvDmswRQo18INsw/q89mKEjBtkf973iasLfQpQO35yC5do
         gcZTHMxW6xa+BNaHualh4LuvfbL9O4rivikp0X5RNDrRPhgytEFn2Qjah63U5RhRyUij
         oZd3BPRVjXtqa3tT5CKuvaTG4E3ipuObv6fqp8BTJEyUAbUAGVV9nkpQRGXlU3BADDJx
         Dt7qEAakdtYnbfmrDlcb4my+D3BAvC5zLn5dsJCNZ10PpSD8FojyE6HARSupD2TkyGGW
         QOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747061330; x=1747666130;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOY69GPeY7sxhniN+8OI5OyPI2xNU8bnc7SUmdP2Sh4=;
        b=SE0eHwnONvIfHeFAJ/6UbNGfJy6LHWaV82Aok2OB3ROQO8UQC6FmrR7MZ3upE1YnGL
         Xd/YpLYF50Q5nwhuREvh4arRN2Rdir9QsYtTAIC6rgL5qtMkSMYB/BSFIllEsbXQxDq8
         Ij5MU+GHFTtbRwQ5AyBn7EC+hguw+1jjvKgUANwkBsFsVWhOANoXwFC26XLDoCbjsl/I
         apjCm8dEbgLaAVjWxkEEh6WMEu4N+EVKnqd2JQA9UEgVPJ1ZZVyrFRtQNPY5dK+seHbX
         wmszqUUln9/Cor3NdyfbKssuAxdW17ZYdNJzH9f8GZnBOx87/d670RLRcJuenuN/Ys4f
         wmYw==
X-Forwarded-Encrypted: i=1; AJvYcCUKzPgEH2SV4nykp4DB62V2iXuc9pQiMdUxaYbI37laifdwhXoKAVMAGnb8Bw2JCMSvPllcRX8jDWyuQvJU@lists.linux.dev
X-Gm-Message-State: AOJu0YyRbwYqfoHfpnl84/9eG7T3Tb20BJqcDEpjYdlJFt2feMJtwzWZ
	naEPtLr1us7ZaST+fGaJbTURPvhD4jb9PybTBWhr+kG58WT0upohOxP3HiuL/mo=
X-Gm-Gg: ASbGncvDR+QRX7EHlzj6KvM0OCSShO1Y7GpI+tticE/AsCF0sLWIPVpV53JfNUbA0PY
	ETvSP84swVNxr/8Xl+Z4NHV7GiOCox89R3tCgy3hKXmahItw/1jsUsk9i6vQhjSwrCLMVVEg8di
	pSU7bMyrabCBx8Bw3Q37Y3bfZbzCeiTR3fa+nL3LaOk3/AfXaOigLzqaAi8nb7/JkN3BBfKoY8K
	G84re3HL21X+fYQG0dhEYavn0QFV3R+iI/gXgPfvb+sJ6O3MdV7jSMgtf8WqtQRNNnnKCXwJCeI
	tI/OegjzEAj/dyD0SZWmpNNcLwLFxhktwisKufKcma1o5DQY11ImAq9uwBRvBo0XhYHvbS9mnde
	t71xgWg==
X-Google-Smtp-Source: AGHT+IGdXGPgemNAdaGqFqrAkOPo5m7AI6yWS8X7lQEbLj2J8ijTntHjWwgRce+XmeUIX60FdDfVBQ==
X-Received: by 2002:a05:600c:348a:b0:43d:fa59:be39 with SMTP id 5b1f17b1804b1-442d6ddf515mr114798195e9.33.1747061329948;
        Mon, 12 May 2025 07:48:49 -0700 (PDT)
Received: from localhost (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d68585d1sm129237385e9.31.2025.05.12.07.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 07:48:49 -0700 (PDT)
Date: Mon, 12 May 2025 17:48:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Thomas Andreatta <thomasandreatta2000@gmail.com>
Cc: dpenkler@gmail.com, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	Thomas Andreatta <thomas.andreatta2000@gmail.com>
Subject: Re: [PATCH 1/2] Staging: common: iblib: Changed ibrsc function type
Message-ID: <ccca3dfd-8657-48b8-9998-c06628353eff@suswa.mountain>
References: <20250510153800.130974-1-thomas.andreatta2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250510153800.130974-1-thomas.andreatta2000@gmail.com>

On Sat, May 10, 2025 at 05:37:59PM +0200, Thomas Andreatta wrote:
> Function ibrsc type changed from void to int.
> Returning 0 for success.
> 
> Signed-off-by: Thomas Andreatta <thomas.andreatta2000@gmail.com>

You need to work against linux-next.  Also you need to explain *why*
a patch is needed.

regards,
dan carpenter

