Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627961A2632
	for <linux-staging@lists.linux.dev>; Sat,  2 Aug 2025 07:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754119928; cv=none; b=NpkRqtUdeqdfxfli2Xt+MSM+gaQrKjHmLQ0Fy1/GZzDN/NeO9rtvR1G4YzP4yjrtK+KU8h+I/YcM2+IaBHDxVPG/9tAae9+fgCYn/nD9vrWwt4ZXGHMYj05JOi7AZUZpUc6oFVOyQFzu+3W68yl51jlzc0+100GuxhnXVM1dk2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754119928; c=relaxed/simple;
	bh=X8HRyQFPoOlzxmLgSDnwmZXBUKycsDjwrurq5e80avE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lOAf6MY3tnWXYB9XcB1cNfC0N008aOhdTngGfoq8kAat5+xRKh2v6F0uYp/Px0sz/ReNFwUYQECQVP9Pq3wxCJ247QqShJoegGr7rLy0B+M6Aejvt7hKiC8U4gQT4z21TLVjqKQL95k3/9Oyy8SFYU8j1zIvAeAELnaj7zkEEOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vDhdC6h/; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vDhdC6h/"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b7823559a5so1647814f8f.0
        for <linux-staging@lists.linux.dev>; Sat, 02 Aug 2025 00:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754119925; x=1754724725; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6Pft35+3lXQVnWPsUsq5tpsncZSpCehFTU7fpA7XTkY=;
        b=vDhdC6h/9NjVpoNm2nZlzyUwTVOgheg0MRx/iM3cK3T1kFjQxZIZ84tFbFT+7lTKHh
         wuEdQClqAKL8LW9cL0lBjwZ+jgvI+/T2+9DLez9Y9cT7OdFl2azbUDihCQ7muiGW4RnM
         Q//C773H6qf/Re1CIlQ/sRGJl8A5qTn4V1uq4bjTkPaFlEylFRibLt0ghrKDwNcaoeqN
         /Nu9F5eFZHRlCZgCwuhokrGzPQxg49/rRadENPMFUrzERmkKSt1gS3bBSnxNGVkPaj2x
         cqlSgwwQKd32+vwgoOI8xXGK7fkmLQvF8U0/547DuYBlikkCO1rRN74AI6YneF4u5Hc0
         M6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754119925; x=1754724725;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Pft35+3lXQVnWPsUsq5tpsncZSpCehFTU7fpA7XTkY=;
        b=vU2ISydL9q7AwDV8LDTtTEGn7IiK568d0lbkxVgskij74sFV3BWXCwVvPGidxF1YKP
         oToZp1AdESelwTQEj12iYo39q/LZH79NFFyzJbxrqfMMbs+37WdxKJjCBjWh4pEUCJTI
         3Wkl4Lzm/3s5yFLXEa5Wl5+PFWJcjgpfOoTEgEv/R5WI/rTEku1LLa3Dh8MOIqA0URSf
         /IWwkjBE/scpb80Y7he7dpWvstuUYKwItM8JQaK4mCIGaGrRTMwCPvz6MjWpPSDfR5z7
         A+4hxV200ZuodbjAUGcshL/3ayBkR0f6d9d+wtLqhIaGD97NVHzjMT5LKHzsWwicgOFA
         yGzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUv0CffhpeCtD1pgQ+BtfIpLPteJexwMHGSj6QoNVTidL7rGN8pMpCDuJ4DOhK1dO8PUUAbNzbzwmJ/4w9A@lists.linux.dev
X-Gm-Message-State: AOJu0YzZn0PVMqHFlLo82bQyd/UNjEeTTpDukbcey1cft/g07lSWEgXD
	nKHoP1gpClPUujfldEWQpH4Ko7+vw778rTzSnh3TLvYAL39isyn3iCB+SCHi5wS77DQ=
X-Gm-Gg: ASbGnct6FBPAUfb6aDJATqCXcMmVpzluHQaLfXC3pnf2Cw/xR0JXVvY8/X/vDVgaKq6
	OjRw+Qkg0sa5cFL19WYHIJGsQgS92zmH8k2GTO3UE3SIJpZMHrldY38+/iSWniZqxFVhe5yrAoB
	eCZO4WKI2KUBG+2LgA7YBOJEa93fdMM+KekM7zMdzLfjjN8YRq9qV5uVFFsZvFhu64XciptSXq7
	lPfwruWOzIfYF979TPp9LrFFrktO6F0VoCEQX4XorV4jjQwNYSQB4xs3VuhSjLLqC7L28RZ6zHu
	8WsFJvxPlbCPml83mt4X28F99+Ux/bvDVnvXdSZXKE6yael2lX7jjpnPmBXoYeP++Myyv6NKRpf
	cSU0EiIGyYHt3OlpcDQbjLOj8Ikw=
X-Google-Smtp-Source: AGHT+IEncAhoLdtPekt1mG/QjBbcpjITQUAV/Ke+Zpd3fYn54X7RELoK7NrhYvkBeCEbn5j1iK8FgA==
X-Received: by 2002:a05:6000:2481:b0:3b5:f93a:bcc with SMTP id ffacd0b85a97d-3b8d94c1ceamr2065362f8f.35.1754119924640;
        Sat, 02 Aug 2025 00:32:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4589536acc9sm133848185e9.6.2025.08.02.00.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 00:32:04 -0700 (PDT)
Date: Sat, 2 Aug 2025 10:32:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Colin Ian King <colin.i.king@gmail.com>,
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] media: atomisp: Fix incorrect snprintf format
 specifiers for signed integers
Message-ID: <10626b28-9619-47ea-abad-db823c01bb96@suswa.mountain>
References: <20250801160023.2434130-1-colin.i.king@gmail.com>
 <CAHp75VeDt=1=9epJPQjzfyyph09bov9UWWwpaAXgu01Egf1hag@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VeDt=1=9epJPQjzfyyph09bov9UWWwpaAXgu01Egf1hag@mail.gmail.com>

On Fri, Aug 01, 2025 at 11:57:43PM +0200, Andy Shevchenko wrote:
> On Fri, Aug 1, 2025 at 6:01 PM Colin Ian King <colin.i.king@gmail.com> wrote:
> >
> > There are incorrect %u format specifiers being used to for signed integers,
> > fix this by using %d instead.
> 
> Both of them sound to me like the fix of the symptom and not the
> cause. Can we simply make types of the iterators to be unsigned
> instead?

Making iterator unsigned by default only increases the rate of bugs.

(Although, my stats might be biased because I'm only looking at bugs I
can detect through static analysis).

regards,
dan carpenter

