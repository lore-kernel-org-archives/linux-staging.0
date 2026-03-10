Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 992AE15E97
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 19:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773170217; cv=none; b=FXT8J8x2dnuhGsZrC3FJLzeEmSZro+tx0tgBuxcZQJF3JP+trKp6PImkj1lHuttzkePU+kOt+Q9D7wj8PapjbeFE6nhBodA8DaYabCX7aBQnr/1hbQ8Umo3NHDFtQJBGUBwLZfFLWhjyx/BYVzkenndP+lxN+sbBdjPzkMn5y/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773170217; c=relaxed/simple;
	bh=edRo3zpKKWWf154+w8fNNb0JMBiJeKtMGXVjLvqf65g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r0YYxWz0pRlVW0UI4DIkll+ZdogZg4e/adTlIoG4nRtGKLvB1pYPGFygZpJ7Cq4659yRIqE+YvmsYw5Lnu3OyJouGhovER4oOYAyBvvZU+BxcDdZosUoguv4lNhduoBQPKZwOxUlf2FCxeWd/Li4XlvEwdRfOsaHrCNaTWvnXCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xz7BUa1W; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xz7BUa1W"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79881805788so143047427b3.0
        for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 12:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773170216; x=1773775016; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RWVxxSFVbj96R59+IVOGQpZehxcNkiiR2p157m1Nfgw=;
        b=Xz7BUa1WoHMcNfecMZ7YhrzB7vWwHdAh84qhhywTtAEoroliz8RPzBxOxi7rczjJBc
         pof0OBrZWzvaIBL2yoyHrwS112jomvFeEaxAg1V43g6d7EAeB9SIxPNgEqBF5V/LqH0Z
         a2aXptOBK+D/9G41oTPS6HZGkAGUeDU0/IRg/pCT2qfszOk0p/c3Dfdg+h7fLoI79MuA
         oEat5f8mPpVAzGxD8TohODyijJFicXa6RjoPohTB5W8dRwOx7X28/nOKkQrYZVLrQwEG
         mcPIveL8gG2n1DNEli/tI3AAoafqK9DfheUXqNnHpXSo2KuqGkLUMnh6DiBTK1OkR8RR
         OBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773170216; x=1773775016;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RWVxxSFVbj96R59+IVOGQpZehxcNkiiR2p157m1Nfgw=;
        b=OKTTXWetvl8WXLIKbA5qMlAGp2K9mjju6EYkNMKQND8Ixwk/bvMTxF3y+YCcpTCH2W
         U9e9sRU6LOTVuJ99UPKFG+bVv7JFb3B9Sn+yH0s5HC01wgKarliE1nxxs1KfQaiCJd6Y
         YILihhC/B0AFqMUTN8eWOEF0xvi+8aAXit/DXmpgCbR3fgR7K1C2vnRU1RvHU/oOzrOC
         4k7MjoOdx8UCHtB6yRIvwISlu8shQhke8dHqiEBtMnxAAK6ihXl972te3XEJg/nfyv9Z
         MAf0sP/EVkusNWClCddVEZpWD/a+QEBNc9uCVxIhipmyiThhh9ayUKArktnSuqzeiB3y
         Heqg==
X-Forwarded-Encrypted: i=1; AJvYcCUdsLElGKFcNV5OubGlSlTrlMIfEcsCUfJlcVpLfeHV8tHn6GBw00efM9u1BR+to6ScyFeIfDlJXreWYWEG@lists.linux.dev
X-Gm-Message-State: AOJu0YxbDp24GkX8TFZ6HBG1jvVZg33sNUickNhksW/FSkizUYWqPai0
	rEABZmrm7aIHwE5b1jC0qUA7RSQhNXfcnj9m1TC/FInnJS2mRR/qW1tr
X-Gm-Gg: ATEYQzw6g8itp/hJo9kuj0W50B9qEaXomgaUQq9g6yIWtsnbEyyn6Aki663H5nMpbaL
	9/Fd4ExOwyTh5zYWX3ANGnUEagq/lr/Mk/kxFhA7T/fHqYmT2xZJfwuwCeX9GGHCdv21Npufen6
	OSXe8Eo1ju/ms6MeDy4+WeAzD9TG9rWwZxrZjmg4gkAHblmowYz6vF+FT75WrQqMLj+hAYrhY9k
	uLEp7/xJBVhWAc6Wy980VXcRbCQ1my+sdGdBd+SWDvmdr4wvOhAInCBKPPRrxcd5Gf8Ri3ZMrko
	49gdCCR8XD4jrPzi6lW4wFfBoUlFWErsDD0dLAw5SY/yDggDIOg8aSPw1CPoGhDzSuYzrjnN3wA
	0OdiaVpr4tmO9+/AmPrcW61uR277zg9KV/mGqKea2wv0B79Ec6NYNMC+AUzqdQFECE9noAVMM7U
	MRbkdOPLCTo9cFdBtCv2b9/lAr
X-Received: by 2002:a05:690c:e3c8:b0:799:330:79dd with SMTP id 00721157ae682-7990330844bmr63292587b3.46.1773170215489;
        Tue, 10 Mar 2026 12:16:55 -0700 (PDT)
Received: from archlinux ([185.140.162.146])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7990a6400c0sm20965237b3.24.2026.03.10.12.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 12:16:55 -0700 (PDT)
Date: Tue, 10 Mar 2026 22:16:49 +0300
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Bera =?utf-8?B?WcO8emzDvA==?= <b9788213@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Remove space in the line start
Message-ID: <abBuIY6KZdQCND8Y@archlinux>
References: <20260310125556.874-2-b9788213@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260310125556.874-2-b9788213@gmail.com>

On Tue, Mar 10, 2026 at 03:55:57PM +0300, Bera Yüzlü wrote:
> Remove a space in the line start to follow kernel coding style.
> Reported by checkpatch.pl.
> 
> Signed-off-by: Bera Yüzlü <b9788213@gmail.com>

LGTM

Reviewed-by: Nikolay Kulikov <nikolayof23@gmail.com>

Thanks,
Nikolay
