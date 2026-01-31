Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F4734FF54
	for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 13:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769864959; cv=none; b=bJdEHV7cC8RNH9GJLQaXso9o8R/T6iwXiGFIkm5hFt0vsOg6PYBaoM3xsmrsPJ+rdbRygsIsD9HhYyuA/pIX7iXPdSQTihn4tIQfx/3FvoleEJYe97oArFOCXEnTWrLeIGS8feiRSyhlstTtPrFmIl5kL3+IC40e3fpHDxWP1nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769864959; c=relaxed/simple;
	bh=1AUUBdvFiJ3fuOV3JhKWAF1aaCikwQbzF7G/ejngtqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=knizr57mJ5ID6NClt5pqL077S1CSyvbwtHTX54fxf/U2S2EUwqoCBMEts9WJ1PKrBrfqbO/C7wnmpLx1A62cxpmc4dpfYonP6DMOigx9zI5V19MOHAUg6PsPfVaHg4EVcdcanNg/8DtMhVZs78Iq9bjvfcfjzGjFBpdlZqVJI1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MRRRZSro; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MRRRZSro"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-47f5c2283b6so24019525e9.1
        for <linux-staging@lists.linux.dev>; Sat, 31 Jan 2026 05:09:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769864955; x=1770469755; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1AUUBdvFiJ3fuOV3JhKWAF1aaCikwQbzF7G/ejngtqE=;
        b=MRRRZSroYqJt04knRPTKzzDbFluKtuFD6mppR7Gpb6SlmIRiAyHqkD4solOTG/Xhmi
         2iJc3PR6TcnQw5guiAWqbFZYpjCTV6GJ8Fgd3v9En72BtRQxcSPIIAUT2zXKErSXWJr0
         VND3cWt1Hmssku3QHd0zFehig4Fyu4q+ccvDhHNUGG5yzZnWaZ6xBr3F1Zmi0P64hi1E
         Wox+lZ6p8OXmJ9Nk3pS3Our1NErJSvy2f4jj5NZ75WCUrBRebjxbypH8vF1Nsb9ayi5X
         GncJYbe5mucYreLZz4sdjvgDNlH4nWgfsNePcRVXADaYzH3j44Juz0k0xY9UgzEjLBjU
         6pgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769864955; x=1770469755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1AUUBdvFiJ3fuOV3JhKWAF1aaCikwQbzF7G/ejngtqE=;
        b=UD+PvzvCsqBHudsGvV/Xw3Vek3os950OFSZPeFs9LfTNP6C/KD5cfyz/qPuNYcf9iD
         VrV0Vu3Ygf1r9QqIP9hGkvgA8fLrJC4rWphACILCt1zN0aQPSEmtd3mcfAmozXSbUtS6
         QIuXwEjicGE1ekm5jFQ/ikfjOMkQYLjm18X/7t/dT0NRU62enPR2nwHnb+BS9WjEw2f+
         avBPQNqizm055pZhwSmYYtd05eoQZ9p+i2Ogck3amYTA2udTK21q+p5mxAD4dgcSsztN
         8CQaNtLgMZRHPsmH4eupi+3urxLHU0CGkYjhMbk46EdD+3Q+Zd5y0vRt9kmi1AgjKMyP
         3cqQ==
X-Forwarded-Encrypted: i=1; AJvYcCW7Xxb7y3ZofZe7gtHZPGZGItGYIyzWU9M4qD9Aj+7yawr62pCsBI4uGYSEDxiXdIHZdTW54sIkwEoa4T/Z@lists.linux.dev
X-Gm-Message-State: AOJu0YwcYCqKbVTeFWJS1ibebkwZbzwvjVQYf/8ae4+jnrLP1YEbEoaq
	YwLom7koWP95/zmw/LQEl3izTRUV+SvSGcWgTKjLUi8derQVgubY9Cpumg5IT5Ttcw0=
X-Gm-Gg: AZuq6aKlM69JML9IetkeiFWHe8HVqt0eQxmtqEfWg3myNjQoQklUxfp2tpno73Y3853
	LpP0UoJXSByiBmTpnKQyY/mCdhZgjMdPY/tgDa/NFpO1AkWdYCeUgL9+EUq1RWjEWJF5C082odX
	0VLtFjI+dU+g9Ywavh+Svc2+cJPY8jrQ+b3UIJfEO6r4mL0PO6S2mAYzEW98VNMg8Ef4GVMYq7I
	zpMjjmCNU+g/PfHgizfm5vTXAwG5aUJP1IDbJbV28rPdfowPMiFkeqv8gF0GtHNryoJ4wTxDFbt
	mKc5yNi7eajTDUw2KOWeHHdRxTtbuevau7tvErOtL02NTqkiy2Plbt8w/8i2oKanS9gHhbxbiLq
	lKD8N3UneZU1TWtU+5K1ErLtIHM/kLnYyuoxHn6FZEnqW+VcXOqTBcpd18udhthPneXdeV760OZ
	dhIp6MJIIqy+yPJtBDS63WhnRcNTQ=
X-Received: by 2002:a05:600c:8b27:b0:479:1348:c614 with SMTP id 5b1f17b1804b1-482db4997c7mr68802505e9.26.1769864955481;
        Sat, 31 Jan 2026 05:09:15 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cdeafffsm244722205e9.7.2026.01.31.05.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 05:09:15 -0800 (PST)
Date: Sat, 31 Jan 2026 16:09:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Luka Gejak <lukagejak5@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/5] staging: rtl8723bs: fix OOB read and perform
Message-ID: <aX3-9zMnUBVUKP1L@stanley.mountain>
References: <20260130181620.199152-1-lukagejak5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260130181620.199152-1-lukagejak5@gmail.com>

On Fri, Jan 30, 2026 at 07:16:15PM +0100, Luka Gejak wrote:
> Changes in v5:
> - Corrected commit message line wrapping to 72 characters.
> - Removed blank lines between tags in the Signed-off-by block.
> - Removed "Security:" prefix from subject lines.

Looks okay.

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

