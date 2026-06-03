Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CC13905F9
	for <linux-staging@lists.linux.dev>; Wed,  3 Jun 2026 12:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780490893; cv=none; b=JhyuRYPv4KggoCE6pMDENQL+ht/LqdpULmrTda/jeNQp5pRwpJNXcolRYCiN/VfE/kQus0EeIRrH7LbN6C8PSGoLLVpuMQLx6DnMy5c1YQGfyVsDH0JepFGIrVTLM71IEE41xs692f5nKU7YnfhLFY3Y8cnbgnR/qbKhEyxL/i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780490893; c=relaxed/simple;
	bh=xlOXLAxObYM0H755ypmNgwyw2u8sfHRzxCVxtOPiR6U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F3FEZ7LkDnWMrd124hd/ltchFRgWDOjn74W/M9dBTgQCd8qd6g5NWMfIgOi8DlLgSC7c+MwrmUrxjGctwsCAWt5qdk4J0CiERLVGeEydZQSTuYbnuxft9WpzI1oWHhxYZt/CxIYamE0itzMFdsnAHChz2xAfQO6iUWA5XjMY3zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y2AW78mH; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y2AW78mH"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490b8a97b11so7418645e9.0
        for <linux-staging@lists.linux.dev>; Wed, 03 Jun 2026 05:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780490888; x=1781095688; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVsxgh2ujbRwP+s61o1Lj96pnFL7ang79UkYU7JexyA=;
        b=Y2AW78mHGuRvXjTRR1UwTkqJ7fwqtSRK3fOs3UyXiISOU/ZqNHap8j/YntjMgEgyQv
         aeuze2+A7EK79KDkT2SzP12mxOUGZYzuP6j1e3OOAOTzy5rjrHE+FLJVhbL0eHFg1rsf
         aZhBiHT0B9UOvzXHXG6RSRPjzYmsd1la5Icb/qWPhd+t5NeeMaB7rQjlGhcTF3V+LRVJ
         4OmUCg+6HsXiBqppMKI+TRFWpoqZa/jMWZu2dwpGzBzooQq8b/XHqOZg26RLEIiG6Mna
         FZ7r/A0te8gWH6PyHOAeGm7DztHiPBoGkPZsoETCIy6xINfwsp9xc3QKqynidvVorkse
         yP6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780490888; x=1781095688;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HVsxgh2ujbRwP+s61o1Lj96pnFL7ang79UkYU7JexyA=;
        b=Pkf7UFSgiFkvloq2eSipiCJQ5foZmzh/H0RAefTl+GVbX7oVtByD44UBmr5at+oKyu
         eOr/HQo4uLOUwsQZHDw9DcIodrcwopr3mKedmMFk95oDekMPpWtb+1ou8Y1+bj1Yjkxb
         S6GkTjX5dQyZzupyXpyj9ZDymVzMn+DphckkSnvT8JGHcjDYnp5Rb+32gTpVf4xccyh4
         0w3iQ7lUBpxxu5CCd2poGZDQU4+TpR9fzNOo/p3ENbAx1fWzStCgVO0JtsJknQABQEDm
         m6LNKMYiVVtTrZIIR7IaD15dvunEbuBLIzm4Xkzvks9FjLRylSFjVoK36zG3QG2N9nM7
         QGqw==
X-Forwarded-Encrypted: i=1; AFNElJ/pp4JhFpQ42pfpRP5MBpbDTDYdISJXvrAFfrpoG3eCZjewyrNnMTTjyDfdNn4NVY6i2wtQqatyw2efDCYu@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7lwWdUXrK+04fgiL2Swa8UQw6kXMxwn0qMR87yXfFnmoZ/LrG
	aWYPGvR7pQ2P0wm/tPiNFOOF368H32OMnGLVjY6P07cd2gE4SaRnA6L/
X-Gm-Gg: Acq92OEgPx+32YhposHxQiGwg4oQLU+1GCn3XgpijcpMX87OXO7vQhaMy01+lL94Dr7
	c6n8Z9HYKEVYENai8VdFSkmr262eNnKFYbJbcvJF/0uAy1daMCs0a4pYbd0ewllGtlH9x9hsqrd
	4x+WciqwUy4gtASOA9aO0Fa/JRqz29NtmLxMfhT3pdmqoNcQBYhoZiFPbyVe5CJh5ul2NcOHoHA
	rZINuyDjhiOCnq20KNZuOf5p2uo5IpTaGhul8O59zPKf1C+tE2jxseH3tOxClUjHbkqHPZO4T0U
	H1QcvhQwSVmUWfVZ6J1MwbTZXocxVxU9pK261Yaqxqi/6ssToiOqlCnvuQjRn+DtyUdg/EgwpxY
	BgfN1ZX3rNv/AI4qfU76WZ4GZrDS7mIRQBOLWVzOTtzwDGcQ+Plh0Cq1QxJ8svr0NjJ3arT5raU
	FeljmILC4qfOTn7y3Cg5vt+FXD4Wvb6p5hbE5Orfzvo8cjT7OknLpht+25ufdtmjbUxDzOGx4=
X-Received: by 2002:a05:600c:8b2e:b0:490:50c5:8153 with SMTP id 5b1f17b1804b1-490b5e73ed4mr48400975e9.2.1780490888332;
        Wed, 03 Jun 2026 05:48:08 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6d16f0csm59311625e9.15.2026.06.03.05.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:48:08 -0700 (PDT)
Date: Wed, 3 Jun 2026 13:48:06 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Dan Carpenter <error27@gmail.com>, Thomas Petazzoni
 <thomas.petazzoni@free-electrons.com>, Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller
 <deller@gmx.de>, Thomas Zimmermann <tzimmermann@suse.de>, Chintan Patel
 <chintanlike@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] staging: fbtft: Use sysfs_emit_at() to print to sysfs
 file
Message-ID: <20260603134806.69df0b01@pumpkin>
In-Reply-To: <ah_cd9Ax4fzOhBp7@ashevche-desk.local>
References: <ah_Y_Y2RtqeGxchF@stanley.mountain>
	<ah_cd9Ax4fzOhBp7@ashevche-desk.local>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 3 Jun 2026 10:49:11 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Wed, Jun 03, 2026 at 10:34:21AM +0300, Dan Carpenter wrote:
> > This scnprintf() uses the wrong limit.  It should be "PAGE_SIZE - len"
> > instead of just PAGE_SIZE.  We're not going to hit the limit in real
> > life since we are printing at most FBTFT_GAMMA_MAX_VALUES_TOTAL (128)
> > u32 values, however, it's still worth fixing.
> > 
> > Use sysfs_emit_at() to fix this since this is a sysfs file.  
> 
> OK,
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> 
> ...
> 
> >  	for (i = 0; i < par->gamma.num_curves; i++) {
> >  		for (j = 0; j < par->gamma.num_values; j++)
> > -			len += scnprintf(&buf[len], PAGE_SIZE,
> > +			len += sysfs_emit_at(buf, len,
> >  			     "%04x ", curves[i * par->gamma.num_values + j]);  
> 
> Can we switch to use hex_dump_to_buffer() at some point?
> 

That gets hard when you really want to aim for something nearer seq_printf().

Oh, the way the loops in the code are written doesn't look like
it gives the compiler much chance of optimising it very well.
This is probably equivalent:
	for (i = par->gamma.num_curves; i--;) {
		for (j = par->gamma.num_values; j--;)
			len += sysfs_emit_at(buf, len, "%04x ", *curves++);
		buf[len - 1] = '\n';
	}
and will generate much better code.
(Although most of the cost inside the snprintf() function - which is horrid.)
num_values better be non-zero.

-- David
