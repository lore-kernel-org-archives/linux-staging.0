Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA44F350D79
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 13:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769606613; cv=none; b=SrTFsT35lcU8ysHSPf1mcZYA512qciB2nPbifHUIP2SG+bXlaeS6PFje8IOiLpQNqstX1e7oI7IlCQ4JLEDKEFJIiiAxtNpqzkrNnjDzRCuZtsf6K2Euuz/P5LapF8ifr6u2UzlxnaQ2+Cnk7LaQPY0KPhF3kFPve+ztVhifLa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769606613; c=relaxed/simple;
	bh=NhcizTnEg/vp4JI/UAEAxnW6TyTX/BAqYB1ZpOQmQOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=shF7k59+hfmk2kk1dsnoJclDIxowCN53EDThS/j1aJWp93upW769HJ66UU6QhFpsZVN6nbJlFLnFpIjdVB9jAdDdf2N0SZjQp27jOqmhrfwwDHZ8iq8FS/xR+i0f9aCNY1pdLClkXRQew2q1gC3FczUeazdejmIjKZojHYUMMvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mwfQD2Ez; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mwfQD2Ez"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4806b43beb6so12866545e9.3
        for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 05:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769606610; x=1770211410; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xjHvN8q7Z4pgwnjGPZzQoYFgUIM/xDeqslRd9gAVyDw=;
        b=mwfQD2EzWIDMIZvQC9bXViMNH2rqtupQra4/R1l2CeLGFqeLUgVLF3mc6225rIm/MQ
         cOZM3DiO/yNThRNu0oK4efwGAaK42H1Fwiudd6xjI/I05nh7gOg8NG3Ip3oi/GJ0H81P
         ymhFX695l3QCEw6LILkhwbN9snjKjBjmtOH4uExMm7b4f04Qt6q5Xyh5kE800s+Qw20u
         RV/nbntAWm35Dd1SR2AjmqD4LPS6sVbkxWI//+vjvlgYNJcXmWhUSQ8M6ry+HyiWTd0i
         Cy0trpfieJWkZ//99d8YD94RGTSvAPY/Wc+K5JAoPFZBFj5JdWXp69YLYI8PFchDuZGF
         0BwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769606610; x=1770211410;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xjHvN8q7Z4pgwnjGPZzQoYFgUIM/xDeqslRd9gAVyDw=;
        b=En/9v7FtjB77O5nYpoG+tRxJsVwrYFDIyXvnCKIXIO/PP0G+8YJVaNGDG1coq0TCxo
         flB3L229KtCwrbQBqOxIPD+6fryJnxqZwVzbyquRkhsMBQihAEkuAVpDy46qNOfaKb6D
         j05+zKbUhcSkEKdFLd2UY1o9GXITRBLX8PT6KuuZgnKsKxuRTnApUhbWYogjZGe/+oO1
         s0C7rXRq0HyFPZld2QCLnseF6siPLfLZxiaNvTK/VRn6tOircdFJ9a/RVgbd6uLGaxe/
         ktHdZODPzw55dbNX+erMmff/JsL9Y4jtMlnkI/x6ttbi0H8NxZX6xoCyyWHT4J7aTslV
         zw9w==
X-Forwarded-Encrypted: i=1; AJvYcCU8dAz9Nu8m24n1kj09AR+4ZyLAUPpOtU+/Xg6dQ8+UyajFgPrgy/k1cO7MmBQGlD8t1fkBo5Z3iX8zoDUK@lists.linux.dev
X-Gm-Message-State: AOJu0YyDdx7zA1NrGQTOS1QTSwoEoWHA/8zORmwGrhshLDZY8JsyFJPo
	oNm+GCD+KsehPf0oTpKQkLlYG4rCqw55McdzwhVi5j4o1m9UNp0zBQ3yVPLZsGjQWJsg7ID0IGJ
	aSyKf
X-Gm-Gg: AZuq6aLhsyenmR7oBiBEjF8+o4dnNm2NCgFDEo1uOGg5BlAF9PnfRxZb0Ebrt7dSfqJ
	rZWdLLXX2PNf1CmJanixCG48rrEJEo7KLXg422IV27XeOOuqDEsdPrT7XHaIRedwv5zllhjUbzf
	pAOLATwe/PGCy6u9ixmslK5MD8WDAKU7pfAostozdtXlP7ScSrC8bN3yl9eYp8DYkik8Xx9cJAE
	Sb2CX8y0eDSmQpD/UE7yhbr2j03eBOfjfNldjcao6SQtOVM2+elCs3MQPylz1VaeJ9W6xJgtsqO
	Y5eAkFBiayUgnBJxr62h7l/66fRy/MPYqOmYbc4TO1BBnwZ3gXhIG/MwesQdpD8tYxdSjbhX27E
	xh6DZSC/trTYCVysoSIo8MxLL8cgb/OnRMb5hCQRvD7B9/LafBxE02MPUZEpEeTLuSdS8D9zYYB
	jvX6xLBxsu+NU51WDn
X-Received: by 2002:a05:600c:820c:b0:47b:de05:aa28 with SMTP id 5b1f17b1804b1-48069c0e172mr65760465e9.2.1769606609862;
        Wed, 28 Jan 2026 05:23:29 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066bfb58esm132400315e9.8.2026.01.28.05.23.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 05:23:29 -0800 (PST)
Date: Wed, 28 Jan 2026 16:23:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] staging: rtl8723bs: remove unused diagnostic
Message-ID: <aXoNztBM_kVOIAHV@stanley.mountain>
References: <20260128004009.51095-1-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260128004009.51095-1-ethantidmore06@gmail.com>

On Tue, Jan 27, 2026 at 06:40:04PM -0600, Ethan Tidmore wrote:
> This series performs a driver-wide audit and cleanup of dead diagnostic 
> code within the rtl8723bs staging driver.
> 
> The vendor-originated code included a variety of diagnostic counters 
> housed within 'struct debug_priv'. These counters were updated 
> throughout the driver's hot paths—including MLME, receive, power 
> control, and SDIO allocation—but were never read, exposed via 
> debugfs, or utilized for any internal logic.
> 
> This series removes the write-only counters, the skeletal functions 
> used to update them, and cleans up the resulting unused pointers 
> and logic blocks.
> 
> Changes in v2:
> - Expanded the series to include the removal of RX FIFO overflow 
>   logic in hal_com.c.
> 

Please don't send multiple versions of a patch on the same day.

Anyway, kbuild bot complained so at least I don't have to review this
now.

regards,
dan carpenter

