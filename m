Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64067126BF7
	for <linux-staging@lists.linux.dev>; Sun, 25 Jan 2026 22:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769379757; cv=none; b=Y4fv38sZXlswpfxfcdjr5XuSpgpemLAVD7lA9+DAyE6Qy88wRMNF6CU8Iio7JzxHLHUFDDfCCWRHIUwqD2+7QaOie6TwX4Ryb+0n0IS/wNkvbUZ+xkSJI5YLdMUaCsZ6Hw8s60zX1X8pQdW9W5JkhcuieXS6+dc6fzyTdaYUWqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769379757; c=relaxed/simple;
	bh=pDt97TE9+N9OqDYW8W3b3sp9edmUgt9ZFwP62WETY/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VNAxY6SSa/gDD2WK3llU/h4ycoGiQclqN8tlc4E5yyw8g225D4+Ou11uBayUuCBBece7Lj8yme15DWM8uEJCvxpOhogevdCHj7UxGHbgWnzRrQGC/h98I0aQy+1hGNSfWuk/nDNQD15IqpSc5DtYiR+XpgMqKNKUYybcX3N5BPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=v7jSgMTe; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="v7jSgMTe"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so57726385e9.0
        for <linux-staging@lists.linux.dev>; Sun, 25 Jan 2026 14:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769379755; x=1769984555; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K08h/9XDDyoYcyZBnc69B/7jptU6R1syGCkGW/zElEc=;
        b=v7jSgMTeFI/nU8Cen3jtV0+PmVqVUkZbET6R0LPb/2XxKstmomWwMdneMdxEFSKdiu
         kxX4LnyJyyNO0AqFFi8RX6IuxJKQS5k1XAvqJM7RRwdzKrzys4k8EWNXfVEV3fgKTZ7i
         WITjjkShe+yox8Kzcdp+XFpWDPWEt2dyWriO0itz7KpzFZ5lQSTx18k56sk6bqNel3R0
         vqnE/+bYfNN5mJ46emq5zUYG0BassEeb/X86QlrR6z9ENT3cM/02YTVJqjx6U+1YUg8O
         N4nqqhVmHihEi7R/h46fT/qqcIT1lkUckOEOOfNm+NpHISRloW7FZfvDGXQPACSzJDgs
         rZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769379755; x=1769984555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K08h/9XDDyoYcyZBnc69B/7jptU6R1syGCkGW/zElEc=;
        b=tF9oskYS7H/3nYCtjHQwFFG5+3sZeMkztsxpr0ARh4O3NEU1PrZblC6a6fD5Fg8Li8
         UflCFk7q4PCxXIHjNwbuv83x5WVqRhPCTqGJNVAvcEMIlPVt8Cz72A9CCVB7YUGwSVwI
         xEVxb+eN/HPHh0vRQ4cNHMgfDcQtOWfETZ3xwsd29v9Fvb/GuV+7UqEau+m18S6k3jVm
         BN4+Sf7OXl07R1vPN6bwYih+uzxeH/aaH9y2tuFdOlOZjonFlB6FpDaq4MNNzU1Vm0k5
         b3JQ9hqdt/jmqwW91wmebk3G542TR+iEGo/e/2Xw3hGhrsX+jCJ57OLj3XnKNzlQ+rlk
         TKUA==
X-Forwarded-Encrypted: i=1; AJvYcCU0hXpn/Gl+m/rsD3pM0dA/NbCse1uEyoSaclQNAueZAOx2Ovln2B06bjs+xX3i5Gycz2/E7pgFpqsRBvmE@lists.linux.dev
X-Gm-Message-State: AOJu0YyQ6+as+iqohikagO3ZLCIxGd9kSrXtURTtxAe7aMlx5No0Rore
	iLX3PSrBV3r0zle4LcPo7m29SqgpA2HqbijmHnz7wo0LGJlWQ6xjnkRTnJKmW512nwc=
X-Gm-Gg: AZuq6aLY8pXHZgmWjVlhXgLUIVWY/guLbpi/GgzOLQbvx1Pj3jgqHpvTMn7DPWIQZ6o
	kzxagiB+BCeiO1JV8YFmZB/gT+TxYdOHo1BEZ5g+0OXvUEB6g8njkRQz8y/ISBDtj3/hwYkf8PQ
	IP0NMpnBhrZRmeOAeReYw+ThVsysAdOG3m7bJaDrKsUhX04qzeG2EFgpqbAESxiHmk88fDOwabF
	1Z5bcdjmP91siuSpNh8yIpxhOAhDkKBD+tDDIdr7ZmV5VH3QRxhGIEQ12CsdQYszGEjdLA8oKZx
	rL2r4R6Oib37DrmcmCGzOFoGJVmi65ZhTV/ySQbTg08TfsN6B7+2WkrcedxtdRaWALG3qcwcBie
	P+vxNPdT9BICfCVSMsoQp87i36HvoMmbGm2jeid0LKp2JSBviNsqjwu9fOrN8kxMj8+mh+ZyKir
	9+q04CR+gDk8H1nPH5BuyUniI2jL4=
X-Received: by 2002:a05:600c:4f8e:b0:477:b642:9dc1 with SMTP id 5b1f17b1804b1-4805cf669d1mr39228825e9.20.1769379754766;
        Sun, 25 Jan 2026 14:22:34 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c01783sm25762820f8f.3.2026.01.25.14.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 14:22:34 -0800 (PST)
Date: Mon, 26 Jan 2026 01:22:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michael Huang <tehsiu.huang@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/7] staging: rtl8723bs: cleanup and refactorcleanup
 and indentation refactoring
Message-ID: <aXaXpt-WLenyV_nK@stanley.mountain>
References: <20260124104920.5721-1-tehsiu.huang@gmail.com>
 <20260124231557.18189-1-tehsiu.huang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260124231557.18189-1-tehsiu.huang@gmail.com>

On Sat, Jan 24, 2026 at 03:15:50PM -0800, Michael Huang wrote:
> This series refactors the function in rtw_mlme_ext.c to
> improve readability and comply with Linux kernel coding standards.
> 
> Following feedback from Dan Carpenter, this version (v5) deconstructs
> the previous changes into seven atomic patches. This separation ensures
> that logical changes (such as flattening nested loops) are isolated
> from purely stylistic cleanups (such as fixing indentation or NULL
> checks), making the review process more straightforward and less
> error-prone.
> 
> Each patch focuses on a single category of improvement:
> 1. Logic flattening: Use continue statements to reduce indentation.
> 2. Comment positioning: Adjust comments to align with new logic.
> 3. New lines cleanup: Removed unnecessary new lines
> 4. Line length compliance: Resolve 100-column limit warnings.
> 5. Operator spacing: Add missing spaces around logical operators.
> 6. Braces removal: Clean up unnecessary braces in single-line branches.
> 7. NULL check simplification: Use the "!ptr" convention for brevity.
> 
> ---
> Changes in v5:
> - Split the series into 7 atomic patches for easier review.
> - Renamed "guard clauses" to "continue statements" description per feedback.
> - Separated logic changes, comment refactoring, and style cleanups.
> - Fixed indentation issues (replaced spaces with tabs).
> - Simplified NULL pointer checks to use the !ptr convention.

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

