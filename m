Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE7C55E78
	for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 08:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709024102; cv=none; b=AYURUdboTh6ADYyA7+KseCFw+B/A2zi37C0DLcY8m/100KwmTA9ZW2z+94S3J5qHn+hTdwyQ/vPvD19xGYqcLAUJyz/BX/g8YL1a5XLDtU6TVXXRQtSEpSdOM7uLzt3bRY/tb6gB8Y+9xDPKUEHl7zR36cl74lGDc7DJ2ceKI+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709024102; c=relaxed/simple;
	bh=e65miCkicj1NdvFVKAgHu/VbuyPfNh0KeRITNON5WD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XKr+w6/94jM/oGUd09gx9odTz6GRsgpzJIU1zb6nQK6xCDzcwR/k+XpvvttBNRBNg9LnLQBfIBcz6oNdoElF0RGGZ7jtcU0PkKtBYSCWDGoNlcTxCPXdswxDCGPg2MtyniILCtDDGXry432ZUQOiVpYwMsbSllZwYNz9/28j7iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JL+NxPTb; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JL+NxPTb"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40fb3b5893eso31147915e9.0
        for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 00:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709024099; x=1709628899; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HoOFxtqK/5ZaKWmPUt4ourSkgleZpPjmZJgHHXaK8e8=;
        b=JL+NxPTbOl3XpVMcs8U/UzHqdsRDrFxCtFrgo6TtE0RvcY4jMCTRkIm8o4OBflPUK/
         O+pX5ratJUhWtEGfzJyA9f/tC2gLCI/uhAkhIMrgMA2Vhq4d02BYTIK9/sFJoQ+Goel/
         9T3cgGKH0Vre8kyclVfFnI7kXu7vUS+l5wKcr6Gqe8wK99M1w6KqS2fLKSqGA4Z9BAol
         4rPh7Wb8v5jj4xHjmVUAwMRXStgHrCS0/IhQkKBcLLW2Iz8tKHSUojx3ekIXXgGzt/CN
         emm/xrBLpiG7rdFHCw9yrUN/QYIeaEHXQClwXX2Ez+t5AAwRZZ/0RnvgYQE1jAR9HgWS
         VhxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709024099; x=1709628899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HoOFxtqK/5ZaKWmPUt4ourSkgleZpPjmZJgHHXaK8e8=;
        b=meEwZwtv7kOlVXaR5aUcxfo0sy0FqKkC5VfE4pj86ADScrNgtIvcZYIIIjO30mFetZ
         qDvR1xNW7ZP2IJcjqKMBEDcvkQZAjrfAUKx8Y2ahxEsrSlNdq7UI5Y9hSf7HQQQdZwnS
         M0+NRbQSIgPKhuKTf+/XkCVMYmvBIS/uv+7+8jvX29r1Gm5bESqoRH67GJy6lDB5BuiB
         k8Xk38tuFqm9UopATNmb0eQHDuFSggDoP7j9Ce6UD5Ft/X6MvmIg4zFYU1z0ClQaLfSs
         7ufgIJWWp6rzj34Kp2bnNXlCXM3DSe60ePWvmUKtekY0EzMiI9KksHKjdbVB8MOOJ6C4
         2L+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVbbhDez0J+UjJq7a29sqCWFdtDpBjXjz95/XJo+7PRb5484KoT7O9ZtJDM9pitw003iN7vSj+ogHdU044eK2aEbBPFQne8s2KpGciVOQ==
X-Gm-Message-State: AOJu0YyZOusQAW/7AIpRt2DvgO3ybUAfFIUiLGJBKyQX/YsQ2SxUFWG3
	QONVFeTyrVLD1EDhNoz+teS5KKH4xWXU+kpxqgoT8xYFdiZThrILgIEoZid86Os=
X-Google-Smtp-Source: AGHT+IEcssd0DZn1GwRIx6uxtu/6p9Ar/DTRb8JebvM7osNUBQzyWw5I8ki+RUWt518g6UqWWYW8cg==
X-Received: by 2002:a5d:468d:0:b0:33d:14a7:c4b with SMTP id u13-20020a5d468d000000b0033d14a70c4bmr6212734wrq.40.1709024099075;
        Tue, 27 Feb 2024 00:54:59 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id u14-20020a056000038e00b0033dca6f8b44sm8036668wrf.16.2024.02.27.00.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 00:54:58 -0800 (PST)
Date: Tue, 27 Feb 2024 11:54:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michael Harris <michaelharriscode@gmail.com>
Cc: gregkh@linuxfoundation.org, hdegoede@redhat.com,
	Larry.Finger@lwfinger.net, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Staging: rtl8723bs: hal_btcoex: fixed styling issues
Message-ID: <da4ff70d-6c64-40b6-aae4-3aab87da2a1c@moroto.mountain>
References: <20240227080943.13032-1-michaelharriscode@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240227080943.13032-1-michaelharriscode@gmail.com>

On Tue, Feb 27, 2024 at 12:09:43AM -0800, Michael Harris wrote:
> Fixed various checkpatch.pl styling issues: spaces before tabs, constants being on left side of comparisons, unnecessary braces, etc.
> 
> Signed-off-by: Michael Harris <michaelharriscode@gmail.com>

Please run checkpatch.pl on your patches.

WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
Fixed various checkpatch.pl styling issues: spaces before tabs, constants being on left side of comparisons, unnecessary braces, etc.

regards,
dan carpenter

