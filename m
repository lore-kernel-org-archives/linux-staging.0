Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15352D0C62
	for <linux-staging@lists.linux.dev>; Mon,  9 Feb 2026 07:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770620953; cv=none; b=pHLpAPVRT/6MwXAZ73uIUjS1IH93jMUyXElahrqTzOKfFxD4HGejy5raVmbYkX9eDU/adawB79Jdpg7FJIzifvgM1LijUB+XwNpxlhnweUGcTrmAMdTQ2A1S6r25yTRIHk/01SnQDYvo9CexrVoTMg3f3RRyFJRmfvzs33qrSCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770620953; c=relaxed/simple;
	bh=JQ6KieO2BytO97um39ZUy6qMsNYgjWeYJKy3C65SQqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qXt7pdRzvjvA00Bmi+GwghMA47x1IeL4TBkkFxCzd859aYDlmhPBLxopoGG8gVeG5dNLIjNQl4ObRodguNYGXfnKSLxnu7WEr09Y878cFMy8pU6tp4RmJFCOGN5nl7VeUPPQiptXADhuAcyWlfikt9UOUiENHK2ETC+aUy6HzRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ipc3ywV4; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ipc3ywV4"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4806fbc6bf3so30098765e9.2
        for <linux-staging@lists.linux.dev>; Sun, 08 Feb 2026 23:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770620951; x=1771225751; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CHcb9GpFerkiwQUmjbisuUz1eFP8rTweshtbwygwIyI=;
        b=Ipc3ywV4Tl2VM/6PcZysPVK2Pgx3Lae9Vdn94FVVahRGdC+3Ji/GsqHxEyYornpHRT
         e4vh/LxE6RprUcFqDcTsZ+6YNKDpN4K5/6jYc5genMU8WKC/xVIfqJXj+/14vFR7UfIu
         Rc8LodwRwaYQttPe9pdvSWdjEshSu7iwNOUb5CfSmqTAH5K/+xNO44EuZkemjDjRDkgM
         0FfpAFVi6CsmfHycB0a9E3DPcuLDoFgQs9UhiziM8isiNrmzxq51Vv+OyjnkM3C0rpo0
         +t0yWxLuGHOhrZSDK73VuM9SatopLZt1SzRFSUtNwTMtGaAFn0HiFO94uzU5bywAuWg8
         irzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770620951; x=1771225751;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CHcb9GpFerkiwQUmjbisuUz1eFP8rTweshtbwygwIyI=;
        b=XGmUdDe1/mpkXEpb0fba/ZAloMiMSYJ8oTwGHQ9nIAomOJ4tfAl/xK5HSBdgP6U9LQ
         LHIFekbjtIJ1sTc1emWljXrp7iJM11tv0IXMyJDNWqmgWVEYtlg+pJTyv5sX6zeDa3VZ
         u+C2d5MgDa7LECSfwrhrCRz3vcWwViiOkrOX5lI1VEPnXzgcTmGZglGulFNarwE7qeUU
         ik5LZh8Jb4EnCEJkjZYh3YgdElYdTRT52pKSuYYhOKCGUpjivGyg9WZwlSh4tSOIoCoz
         lHo50zPZYcSMLDxj2sY7SkoY9OJsgWzKeliJ6ST+fIjmR2oeEGRqbB8y0U2KZrcX9o7Y
         8SvA==
X-Forwarded-Encrypted: i=1; AJvYcCVbjC6GdYA+NG0+1KQjt7bTofOFXQnbk1UrXxhE11ICbCBscQbqr73m8Z8V3OVFLNs7yCCv+wT7KCjoGiHU@lists.linux.dev
X-Gm-Message-State: AOJu0YyAhOEOCvxAOZcr2eddaKdYMuQYq56P781A8ty+Ix/ynO0bzBBH
	8R4F++cu3IngMfoVtboMxNUZ2okbpsvLZt+3oHvoi/nwuP9wMfOU+vfhBWSVnpFZ5vg=
X-Gm-Gg: AZuq6aIa7dERPHh6bqHVSaVolpaXY4+cJX08CEFixAdgXFjwjrkNlAUgTQaZ3xxF9e6
	kZyaHM2F3S5/iDlFz0FOII4hFbb4OZb0KnVFDLA5kH3AYEW+HC5slEKYN+e2h83uRMmR7P9FJ3D
	dZ5lyEeVhNX6cmei4J4OopCNAUcmydLxQx6JVyzubhaBWOHFmNaax+fn5jZlarXPKjQOPcQiumC
	GG63pCxAsy1fr6DjIi1pSBxaKuaOkqbGNIIMZ1j5gh5yoT1LAXjEcrCMOq9Knlj3RrsQ/nIAiF4
	j2478goF1uiPtY9f2jzBUwltfqxJDS/w/ghjZPZmlcMfr6or7Bc2QC5h36iW8dr+ogZH1vCBjW6
	NLsyEc53xTZKYDoVT5jgflQ0ZGPvpf2t2LIS3zwVfhW3I9+Ug1wR8CtX2K959sbXnTt1Hjs0O21
	McSgjKZ59B6mipC573
X-Received: by 2002:a05:600c:8b0f:b0:47e:e5c5:f3a3 with SMTP id 5b1f17b1804b1-4832021613fmr160869105e9.24.1770620951242;
        Sun, 08 Feb 2026 23:09:11 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48317d299bfsm286866755e9.2.2026.02.08.23.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Feb 2026 23:09:10 -0800 (PST)
Date: Mon, 9 Feb 2026 08:37:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: William Hansen-Baird <william.hansen.baird@gmail.com>
Cc: gregkh@linuxfoundation.org, david.laight.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: rtl8723bs: replace ternary min comparison
 with min()
Message-ID: <aYlygIEu0qvZMUZg@stanley.mountain>
References: <20260207220136.67923-1-william.hansen.baird@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260207220136.67923-1-william.hansen.baird@gmail.com>

On Sat, Feb 07, 2026 at 05:01:36PM -0500, William Hansen-Baird wrote:
> Change type of local variable wpa_ie_len from int to u8.
> wpa_ie_len gets its value either from elems->wpa_ie_len or
> elems->rsn_ie_len which are both u8, and thus there's no reason
> to cast them to int.
> 
> This allows rewriting ternary min comparison using the min() function from
> linux/minmax.h as now both sides are unsigned.
> 
> Rewrite as well wpa_ie_len + 2 to wpa_ie_len + 2u,
> to keep the expression unsigned and avoid overflows.
> 
> Signed-off-by: William Hansen-Baird <william.hansen.baird@gmail.com>
> ---

LGTM.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

