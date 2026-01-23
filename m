Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359962EE617
	for <linux-staging@lists.linux.dev>; Fri, 23 Jan 2026 20:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769201135; cv=none; b=b/+LeIJLB0Lgz+ep9AhJ9AdE+XHnNAQtcqbtSHXXf0l11Lc0LDYUljOZ0vTMNbnTUU2Vajoa9mQ0lvIGvE0Zqz09XH9urWfyl3pzcIO83Jc5SHr8SRqgJs7XUull4ZKnppgNUswncfazE27zAjq/KzB1QSJ1pk2+C2YWa6CKokg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769201135; c=relaxed/simple;
	bh=umLB6rOEr3GkGF61tcxwckM/8U3WZrQ/4qv93IEA1H0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OtIINof2Rs53vQ3N/XB5IcoFD6M0oKMx+7VEEGzyN4cQp0qOPCWZMN9fGI+FB8B1oc+Hf6+s+2DFQrkiKtcuU6100a9Dd5oDIGmeJ/JSPKffFleKPJ21gr5rrtsVxuf1+h1dhNW43w/ANwc4m0+ygBHQotR6JVyV4AX6bZZUFl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LliXGI38; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LliXGI38"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so29633905e9.2
        for <linux-staging@lists.linux.dev>; Fri, 23 Jan 2026 12:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769201132; x=1769805932; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZW/tiNOTCqEygs1+4rLDniih84DtCcxkDnEgvERK+7s=;
        b=LliXGI38uUbJrc1qJ5TFB6Pvn/Qfh8s51GrmS1WoMeNRHHtAU7WuqrpKsEtdlps6JT
         ooqv7xgexZJWwumAJwjxfuDp7fxiu1v8IUn0TzGNTq+VUn9jvhjzmN2XwZX/fzBq6SvM
         oKe6/sn+Jvy3LBWrNqTQn7lwjM9fDKhWy3Zz+zkBFhGiO4E13iuzTatqHDGBnSBLlxFW
         5ydbIGPGvMRxUFlwhSJRKaK9fTOXIyHbCMiXBmB0q8zBQs/epzaBo/lOFYusk34DXLTs
         tCp02n01Wmkd7Guu0Itbj8d6pkNizONx0Ozc+cIvLLt9FZzjx7Qz+xwvM+1oy0+OhIOW
         N+4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769201132; x=1769805932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZW/tiNOTCqEygs1+4rLDniih84DtCcxkDnEgvERK+7s=;
        b=Tsgtz2lrlyFIzUOJx74pt2fvWQqePzSQEsZYJpjFQhfeEd1xFdrnDASIdZMMs53kAN
         BWPzCG8cT6Xx/DL3K4k9u9GzvNfGjonTm0tL1LWbpRZevMs5BCX+Wt4jbt41nwJJryKf
         e/ryPfcvZ0v4+kHTMUIjEQJ+r2jkmfxq178oy4v8SzGIcUWpzKz8QCrle9BDwYVDwGq3
         PvOwnjkC4ZyJjh1U0AsZ/B1KQyCWwJW2E77t7mInkl7xKC1+1kRZt0Xvdsvqer2QsweY
         9TX1bjMnKyTMuyr8wncgbJh1lLzV3RJjvI44URCjfpT6OufUGV3j+CMQfu+xuPrKATnQ
         id8A==
X-Forwarded-Encrypted: i=1; AJvYcCUJfaytqguDtDxFVGbsb708txLQfI1YmHl5b6IAssGcVuIKRWoNvehPfjPbKMaZGPI6DidPKVZ2zgxdXaFG@lists.linux.dev
X-Gm-Message-State: AOJu0YxKCX0o6DH1YwhSkGhNM+LuKzjW8hKAMdHS0nU1PxV6tAOTh7ha
	G3yT2jJvBPx+qZzaay+kT9WPJGrz5TXnVeP2Bj+8D2j9KrobtATCWw++o0kdSX5iiZ5wVEw7zQw
	xYDDKsP4=
X-Gm-Gg: AZuq6aK+XcbegP1/eOTaF51INveagrpEiiDflow0Ha2vTI8VL4dleHUBg5iqkQCSAok
	/XMDtFrLnTz62nOGOOKYind3hoSnObXWENj35zQfhGg3irARdbD+qvUYfJ6yVouVp26M28/efie
	2ooq4mGi/srnO4ErLgBvY5/6gONOJjSLUcu4kzg4BHhFaK5f45RVozJplIk46YC9LPxdywSxJls
	u9td2PV5TGRSnk6wOVtEAHyX5nTss3x2t44jldEeJpvM9OR9QOe+FvapqP+zxFNyNHCPddoW03r
	0LVN7FfKfVAS3rd4ObZRjMzsslqTtPeOYD2SAu9YA5V2oxbxFk6BaqNAwGdetF0n12MRIaSBECd
	5+nHXfCV72j3qo9KjttqIuXhkjr462M+9gnZnxFx1JJrnqPzj1OlWwrR+0IPanSeafYEpwG3XsP
	CqFhuJj5fKzVTzK6cW
X-Received: by 2002:a05:600c:8283:b0:47f:b737:5ce0 with SMTP id 5b1f17b1804b1-4804c9b4cb3mr74893575e9.23.1769201131982;
        Fri, 23 Jan 2026 12:45:31 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804703b59esm168362405e9.4.2026.01.23.12.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 12:45:31 -0800 (PST)
Date: Fri, 23 Jan 2026 23:45:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: parthiban.veerasooran@microchip.com, christian.gromm@microchip.com,
	gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: most: dim2: replace macro with static
 function
Message-ID: <aXPd57ui8pFGMuzS@stanley.mountain>
References: <20260123191150.3281-1-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123191150.3281-1-ethantidmore06@gmail.com>

On Fri, Jan 23, 2026 at 01:11:50PM -0600, Ethan Tidmore wrote:
> Replace unsafe macro with function to avoid side effects.
> 
> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
> ---
> Changes in v2:
> - Removed 'inline' keyword.
> - Fix indentation alignment in return statement.

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

