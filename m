Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A6626FA6F
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 08:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770021361; cv=none; b=nKrRd26zgvLk02XuH7ZSqhDroJtMnW5wp1umdrjBcVdffE2AVdwgfhh50WzLhWz0hoaxGvKgrnQLspTEQLp8UYIH5z3Sb+uItmdYHjEyiLqAM70SXcOCO105uVutilSriQLQ3fpQrbaSAdZS/PG/2mJuvr7leQqzuomBtr//xrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770021361; c=relaxed/simple;
	bh=bFK8hFfh52GXzblS1wDcEuJOY1t7IatvC8umODmXQlA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FNgDW2lRWB0nSZqsVc8MSjsMdfA4S6++tRApyhboyso2WMc/iPRqpczhyZ5I/eYjAlirSd3AtA8JyUEb2lUxZsczDGGkWWZtUh/+vt9e0h4esT9kdSOyE+yLrHK7B+efO4vndA3yhDc/0rOYkM9bFxBZhuY7EKtbHo6JEnmJnzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FRqN4ChU; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FRqN4ChU"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42fbc544b09so3860116f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 00:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770021359; x=1770626159; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VRWMpqnWk+tTgP9S44SDSmGmyzdMBAQmlJJaZ+BHavU=;
        b=FRqN4ChUt3lfpbFy0mUB8h+FZOhggFN50rbyof+HW6xKgI4Drn0Heghis5c4CLZb1e
         2gK1uirvQP0Vn/KY19GRY8eOnOHk9BuYm7YcFD/6bk6C3CoaLdnwwKPCvlclo4k279Mm
         /sHZwnSd2GrEqSPQQCGjKWRlqrR1Pun79WfKGpOdweyyTI996tI7DZNZlH9aLHL49+S7
         RMq+tUz46B21rZxFvekC4j8+QVt9kxumBf8IPvfFXd6IBKsA+u5EASRD8zzCGAweDNqN
         QGgK9hv+OQa75yG/tp/I9QH1yUnm++jxoRtF+pPIRddhkYuk6fyS/nxJVtiyy7DTuF6N
         pLAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770021359; x=1770626159;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRWMpqnWk+tTgP9S44SDSmGmyzdMBAQmlJJaZ+BHavU=;
        b=sg1NZtyeFWrcPj2h8cZ04DvqyaRDDT4rgOG4P3RNuKy3hs3wzCphx/vRaq/FRRwzGi
         Zlv1aYM6tUI4dpQfyeVlbfLGp0+jyMaunjUbpk+2vNgp+RYAIJdH7w6c4AcH4ZruS9Tz
         ZO9T25PjkLR5WAGD3eAOJ4TaaL9kT+gIEoGhFKUYWRzlP5cDa/Y6/tZUEGUgxK1MtNtt
         9fIxXwPQ9MVd6Du7fkMna3SUaLTvNIp6bb9rLhERbe4ZD4On2YDjAfdmysvDJuy07mha
         YE8ZY03XGPVCc6MQFvgw/LpwaAsQyCDYjj5KSkr3yUJmUS3TdKLs8Gvs/uJU5RLvBK1R
         Ctug==
X-Forwarded-Encrypted: i=1; AJvYcCVs5SNdnn09XeQ+v0ma/LAutQVL13hPUegbffwP8NLeJ6Rk71S+B+HYmPOTWRZSNjaQ4ZPBB9SUGeZtcJPB@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1rvHR8+HPvwHPxJHzxiMfSV55ILcGZtoqqnOcQ43PrTkjAjzj
	/6dCiH2ATJyjJhx1tg4NIKCuFeTVZYLgGG84VD1sjXmRoA9dkJ/D1jYcb1qGPe/5PAGUUCyNoh+
	gKnx0
X-Gm-Gg: AZuq6aIYdQaI3oKoilsM1ujqbWhgEvnutmr7T0A46/wM3hCUmCQer7adbv9ke+BVXSo
	bOmFYtoWB08U9U69Jac1ap55jP1hQbhjMunRG+1uxMW0ew1PLOMqY8CYJN/c4U1R89+qKjpSZZV
	3rQRRwI27/aU+Hbe12RXH9MqPOzVAYBPMK6omwL5uFbqTJvRd0Zn+vpy0p0cNaFVyAqRGhjLWwu
	EY7Ag+Lv7UIn9XTmxAJhHVwpVuiONIYCLunxvMx8AY8R0iQKR89w1Kn14F1yq4VpXbGiAIazuBv
	zGDdwj8Gh0Wn3x5adarM4QOEjhAQ65jwPsRxxvvXWpiuAeGBLsJgcVN/tbPqMIUNsrYhgxzxjHi
	PTJmQSti/C/F5TxMHMFkD2fULpiz/dVZ3S4OJ7oiC8XB61ZHNUQQGetkOkcBDikLCD/uf1tN+Pp
	cKXuNSxprKP63xWU3XAmPvSMKuRM8=
X-Received: by 2002:a05:6000:604:b0:42f:ba58:6599 with SMTP id ffacd0b85a97d-435f3aa7b4amr15547903f8f.35.1770021358614;
        Mon, 02 Feb 2026 00:35:58 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e10ee078sm42434054f8f.16.2026.02.02.00.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 00:35:58 -0800 (PST)
Date: Mon, 2 Feb 2026 11:35:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] staging: rtl8723bs: remove unused private debug
 counters
Message-ID: <aYBh67k7sfVpmKU8@stanley.mountain>
References: <20260131212128.25548-1-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260131212128.25548-1-ethantidmore06@gmail.com>

On Sat, Jan 31, 2026 at 03:21:28PM -0600, Ethan Tidmore wrote:
> The driver maintains a private `struct debug_priv` embedded within
> `struct dvobj_priv` to track various error counters (e.g., suspend
> errors, alloc failures, RX drops).
> 
> These counters are incremented in various files but the data is
> never read or exposed to userspace.
> 
> Remove the unused `debug_priv` structure definition, the instance
> in `dvobj_priv`, and all associated increment operations across
> the driver to clean up the code.
> 
> This also removes the following helper functions which were used
> solely to update these counters:
>  - rtw_reset_rx_info()
>  - recv_indicatepkts_pkt_loss_cnt()
> 
> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
> ---

LGTM.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

