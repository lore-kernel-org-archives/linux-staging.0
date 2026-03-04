Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7895F3AE18E
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 14:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633616; cv=none; b=V49yR7S4WFBMFmI+rs6Cpf2MUdOMUVt/foR8Yyb6nA8NKL/gK+XFEazmIZu/EWQtYfmybNOVizZwy82sySaL+TGzZ8uFlhUywZZhWuW13NDtUbpHk5yrDJphrKp/XUAgUKOA/p5/+z0S6xpGH90zp42k1nKAWTyxAM65Groyia0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633616; c=relaxed/simple;
	bh=lBduCYnTFppw+SqLw1wXpvj47KpPiLLos6S/3189Xuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WWZLeALgpRYLvvFOVYg5IA4XeCE/TPp2pKR8/1vwK/V0vLlOA8tRFKdGoptAoBJGs08UdebYiXd6v916v0GhTn7Oz3xedPHaEqPMS/w2ylkdx51ME2kG71ruEj+9rTSoyt7Mcwr+Tz/6QG3Nk04RyNDJQpK98ypXb0cik5Jbshg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hptMjrGE; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hptMjrGE"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-482f454be5bso72494475e9.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 06:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772633614; x=1773238414; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5ujBoY8C68GR/1NQP8oW51X433MlDNsoIABCVqoIGCE=;
        b=hptMjrGEzUcOhWRu0WDHgaKzE3NwzUFWlyiCEIK7OIXl2RhJpRNqhlebQ2hbYTJEyO
         SXlUKB29/YgGIJYtGWrK5Fh/OWS6HNxmXMgvEebrHgtvAYbyJp2+ugnqwod/t/upOaSu
         /paXo0bwDDha7lAf+bJsFDWHpOhCj18H48MIRvohB0Q8CsIVTF98zVJsGbsogWpkEoB1
         BrvyZ8nwPYGF+SkFXmM4rlTGVVaH5/7/977BVDrMOdaeXcVDWsYdBkP4Vj74zccdNCy5
         H5xxhE3Fzgx0WAoRvT9QBRDJvaj8NRZzXsRPuZ20xpg+gb/k2l8OkylVKIshMOhjcPoX
         QTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633614; x=1773238414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ujBoY8C68GR/1NQP8oW51X433MlDNsoIABCVqoIGCE=;
        b=C5K9IWQvPHhhmGs93okTxLhD+A7hyHYIAJ5PiTAWMIq4dmpWmqhPFDZB7jE6JzFbw4
         F/XHEYMZWOJGwSHZR9Kmg7kZF1LJDGXrNwJ4wC/n5ZFQsR26yMHVj8YBO0A9U+I7jDfm
         RdYAfTHY4GPMAajb5MseUMXcuYMRpeoDWzMPsm0+8G0ezQpYljaVBCTPOXNxVREixLEm
         25esdNm/jvg0NDmrafOOJDuz6seCAk0Jv/KmqlkU0JtxW49cK0hi7nsChbDAvX6JKmmp
         ByXaIyQEfa/p9tc0y1A7ev5KmvjelJWNjiyT4F/bJDjhgExRJf2hUp/Jf28fq4X7nvFQ
         R8WQ==
X-Forwarded-Encrypted: i=1; AJvYcCWuGQoRhO5qv2OOWBXz+cbAcdni9gW/IH8AEMzGtZT5DGozfWl9zZ//kLxWZ+L5VTS+N46N0wBG1u4umQEK@lists.linux.dev
X-Gm-Message-State: AOJu0YzrS0yAZL72pVRWmoPXC8aqmA56lsHHkJg6azEqUBiEYqeA7xvR
	3c6dxpOvItUUlc3PK1XtzfGaCiic1AOMFmckluO9Q8/xCOVcQF9k2Nfzfz0P8xp2DZw=
X-Gm-Gg: ATEYQzwm1UzujfiR+Pp/Atr2TQ5QXD8GIG1OGJgHakW9o0z94Z2rPugihA+kZENVAla
	1/YMrS7wSdKYD2UnbXyZ+ReNVHPOtMLY2XITl6MxQ+sGi8QbSXt4zK/N43a5IyKg5iIJDbvsVf2
	XfzRImFIKXaGa8J5fqtR+Fy3WSa/RRvwKP8THQLKUgV0OQY1wUf1Eq2cDjBtd9svWn2g7lTBN4B
	6mieI+zfHp5wDVMFETKOdjhFs4bXU/Ka/DDVLg6jTn0JrnUyUJgj99P0JxG6mzzBa3uf6tKBvn6
	3DCkaikQuKBNh/O2N3A3LoqD3lsFViXKKzYY1h23UyWx/A/u6S8QG6ioBzd93igbTSOwIu9K40K
	PBrVhCtx2P2UHNir7TBgZEWB2vQZJ8USOPc0Qd162S8hl9XegeGPEvnUcWgZfWtZ6q7J7/INT+f
	ps9wbBuCbO7AnhSgEcsETMTSCviywL
X-Received: by 2002:a05:600c:3542:b0:47e:e2b8:66e6 with SMTP id 5b1f17b1804b1-485198ee3admr35003485e9.14.1772633613702;
        Wed, 04 Mar 2026 06:13:33 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485187b7851sm95166655e9.3.2026.03.04.06.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:13:33 -0800 (PST)
Date: Wed, 4 Mar 2026 17:13:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: replace kzalloc/kmalloc+memcpy with
 kmemdup
Message-ID: <aag-Cn6Gcz73gUKL@stanley.mountain>
References: <c6e77299-e978-40f1-a574-f2f1eec2eb78@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c6e77299-e978-40f1-a574-f2f1eec2eb78@gmail.com>

On Wed, Mar 04, 2026 at 12:26:38PM +0100, Alexandru Hossu wrote:
> Replace kzalloc/kmalloc followed by memcpy with kmemdup to simplify
> code and avoid unnecessary zero-initialization before overwriting.
> 
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>


Please slow down.  Also work against staging-next or linux-next.

regards,
dan carpenter

