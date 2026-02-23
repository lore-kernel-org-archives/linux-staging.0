Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A12E3446DE
	for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 05:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771824956; cv=none; b=X6wegNqfY8yzULMiPROgSI74TtTh6F5t1M2YMgIIOI0zujmm46nCWvTBa05XpKqzrzvw5Wh/O6lYJFAnkQvV2DGocPT6VA2OP9XsKO9/FNosHZU9n1Ul8sRPanT/WKUvtN8ft1jCA9Y3sXzyvhGXUrspJYGugtPIgz9d7JeFSVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771824956; c=relaxed/simple;
	bh=kcD2Qypr4c/DeYvc5WuUpVMI+R1taGfhzA+Mvk89/uA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l6fYNv2NeBfEZo4uIvG8Tfm7IB0/wwM5lYOZ9damcQ4SySdFgiWZKkziVI6TMJybvgaKAjTvVOczRLDAdaO7+hbFiywK4C1L/jQqLYYQjqoQljCuEC8z/Eca/i5bF80d9sf30CrSKslU0cPQtHThKNu+WYHay5a2nVGes7WiNTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V4vIZHhs; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V4vIZHhs"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-4359a316d89so3561606f8f.0
        for <linux-staging@lists.linux.dev>; Sun, 22 Feb 2026 21:35:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1771824954; x=1772429754; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=43+fGwdSCAnBYjvtYUejC/oNQLVadZR9N3vhLjZSPM0=;
        b=V4vIZHhsZmaAIAXT0BgaQ2m6QDexVOABMTZKAmOfEbcurGC9vZ4coJNDF73jlVVg/K
         iK1UD8wIlMp0AJJSYmAYhHnE0rUBHJLLqZZKZPd99oxduJk67HlrgXCBg0ymeknTZXyR
         m1T/W/dd8yBwM0HHHmBb9XKBrEaolXisUj6L3Mv6IH2vf7ldK9g17cdeXV1tCooAygqU
         g6MtVvqxVNLo9+qqz72jNuQusTF8u3I5dNpvL7wbEzL1m8xXEehTVkYJCm9axQ1NtdBi
         VkETE0qvRR88b5FqCSwiGXcB65OdPSwNuvvpFMdI4XIBmLEPP1TaUyRlEjA0nneOLrp7
         TIGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771824954; x=1772429754;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43+fGwdSCAnBYjvtYUejC/oNQLVadZR9N3vhLjZSPM0=;
        b=R2k9ajoQMidoYgPXxqwzqA1Irf8OIhdIuFKEfMaNIMv/Tb5ftRhVom10VfXOyHAoXW
         7TIbqS5YuFilyx/jYFVKeILSXx//8vCTFDBvnNZwYSwK/1GfDFXelmaIucxewLgANZfH
         H0K3gwFukU91Csn8erzBFhQSmFjrk/RnyrZTL0k3DSW/wxJliMRFAfJXF4AtiVJ5qPD6
         tOk4uc6niG7GEOL1fxyAihzi+uPbvcnbJOrFps+9AYecbdCN/yV5zt+5/S4oRZyi+bLQ
         zUjXvlRQDHZVXxhyrrCDjQd2VUngX+220EekMUIdYI/4azKgOCMFpKxXMSw28+b6wQWS
         0YLw==
X-Forwarded-Encrypted: i=1; AJvYcCVAxhVxeuuLtgFrZXsa/EtOH8eFm5KFvCxw4WTqEqiKvHiV8jd7/oeKWjtWYxyvSXRnS12O6AfgPI3ADJV9@lists.linux.dev
X-Gm-Message-State: AOJu0YzFYFEpYmd/n5VoDvT/OKouHWLoYAiLgaSLzwX2SZNMzJXFG1qB
	GW40XTktxOpHetJ2Ov4Iuh9k5ES/zLuUSZYExNey9Oq1awcbRfRRIUvbnj/yjlGAd84=
X-Gm-Gg: AZuq6aJwVw0k40lt/t6QLq/0vUh1jR9jYK/DOpDZN15/pqyCIdS5ivO3dFW3akXFE7a
	oeschlgvLZTvhMU1hge6ILTftgG29x0/W6BD5LDHEm9S4+9nEhjh5gJTyXCrQMD4oOQ5bWK5FQt
	fNEEM0ywar4RteBdutFjfrDp1DDlapwQl30TmSwaJbz7GUPioToWrfA5rBbaF6VxtvOmu/TM2tA
	e3IzWInMlOldmpUcBOlIa0DQmy33H5Rs70yr9Wwu0lRAGQybYUr4CTmSIs5puGugtpPkdWE7UGX
	v+HBIiy8/RYmT3tu2WKJc122Arna0Wy5WzVIyUfTJSLvqxDV3l5pbVneEkQH0JZMYD9aR12nVzi
	EdorSA4/z2xNEHGrvZYgVsbSbIyIR8HnCbtCEBYmDT/Aoam2cTLGJzcWM4k++VIEeirMRt19DJs
	rZSjv+JgJ884A3Hrhvw1pqKw8OWG4M
X-Received: by 2002:a05:6000:2312:b0:439:5c0b:1037 with SMTP id ffacd0b85a97d-4396f14c9d8mr14932079f8f.3.1771824953719;
        Sun, 22 Feb 2026 21:35:53 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00485sm18589893f8f.9.2026.02.22.21.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 21:35:53 -0800 (PST)
Date: Mon, 23 Feb 2026 08:35:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Mariyam Shahid <mariyam.shahid135@gmail.com>
Cc: gregkh@linuxfoundation.org, straube.linux@gmail.com,
	ethantidmore06@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] staging: rtl8723bs: Replace kzalloc with kzalloc_obj
Message-ID: <aZvnNTNVpaEE_9u-@stanley.mountain>
References: <20260221111003.11339-1-mariyam.shahid135@gmail.com>
 <20260222162018.4744-1-mariyam.shahid135@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260222162018.4744-1-mariyam.shahid135@gmail.com>

On Sun, Feb 22, 2026 at 09:20:18PM +0500, Mariyam Shahid wrote:
> Replace kzalloc() using sizeof(*ptr) with kzalloc_obj()
> to fix respective checkpatch warnings.
> 
> Reviewed-by: Ethan Tidmore <ethantidmore06@gmail.com>
> Signed-off-by: Mariyam Shahid <mariyam.shahid135@gmail.com>
> ---
> 
> v4: added changelog
> v3: rebased on staging-next, kzalloc_obj now available in this tree
> v2: switched to kzalloc_obj as suggested by Dan Carpenter
> v1: initial submission


I don't remember suggesting anything...  But, sure, looks good.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

