Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C00352FA0
	for <linux-staging@lists.linux.dev>; Wed,  7 Jan 2026 14:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767796404; cv=none; b=bO/rAuheZT690UF6W3+dr363SCAUKX04WHzsYxTq/FsB6PD/7Y9K9Xx1MxC+KdPCtjj0LIm2736Tjqdf4UGvRBHOB34kuOk2chPHRlyGDGJvg/BCUBYAxJGYnuN1nZX/Bqg1MGlVpPlmi7kDZq0wpjTIi8LLFQ+KfIMHgPNX+NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767796404; c=relaxed/simple;
	bh=2bzqlIKsXX9eO3lZgBojgE7dcdQpm//aVw2u08myThA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rHWY7ulxpc+JiePQN8ly1ip6xsjkNCm22ziSEr1wSlLXXXjcyxXkaIuEk89v6kLVIOKvRNiWcJwrnNGW/ZTv7G6OKcl7lmWT1Y+ZDEAjxQ7gMbTNE3RdSu68W2JcJop/mPSlVIXhnqdQUdlFooY8S9GfPkzIqIX2I1GqDwM5z0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q1mdoty7; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q1mdoty7"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so17457685e9.0
        for <linux-staging@lists.linux.dev>; Wed, 07 Jan 2026 06:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767796401; x=1768401201; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ehCzga0f5q0xi43P9nCB2+2oc9tg1sqwri9arZAFlk4=;
        b=Q1mdoty7/P5nto9rGfsP6RSbfGAXVJqEbuw0/50Vwx/AZLEPPeASMIT0qJ22/XC1Dw
         zO6smLRAVgiIqe+ZT68VgXE6FdZblYmZpHDnXwZNiRKnp0aGMALYQG7OwMGHEgpMRrMR
         f7HOip+1O5fBkzmwq/iyTgRg7Y6n7d5q+qh/bctIuHM9pu8r3Fpy97D6Ak7CXocrVvkD
         LRtZSag8OyJwG79RVulZ3Byvb8vFo6a6BVlGdrBf0D4jF6HZt7HlOqefNkC/H6BAAUNI
         45N+9Cwq/Ww4WR5DLAt1vyfp63s0kns2hrZJYElUL6ngGxMCfZ0cxapPwuD5RpHPdCoH
         URSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767796401; x=1768401201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ehCzga0f5q0xi43P9nCB2+2oc9tg1sqwri9arZAFlk4=;
        b=En1iTO7HIHDYAm6W8DbngbO6Tg4dX5I3TdHq1L0rSox3j+GBOerIcCAKItUF0uFl/N
         kekkxCEI++68BwvQbrSyd+RWAF7dhsWfksbUhzHW9Jhn0wm/EfLoPyUc67SyNmp5QZlc
         7MhLC2VcnOFCHQOkPLvMcRhyHtv+d2R5+aClfN8FQNhTYV0tZWl0fwXEDuhnyjagCBjq
         u3FCe5H8SP1fAF8S+sgw8rK4u4XRy+TSX6H5JAWuscjjmtqmXsB93XE85DA8j4/aCaLv
         4bDbTwWJv4Ao5FRr5A0MT8p5rA6rcsS+6uVFOHpfMKqqxcwnZ67v2lYf/WgJtCxnhVFR
         jjAg==
X-Forwarded-Encrypted: i=1; AJvYcCV+hcCJcpwXAhYctYyGOugdpDYkMFZtl1eCB+4j+ZOERjBBg6ZC+xzrV5dq2ltniaRDNKAojqp+/k8BsZAZ@lists.linux.dev
X-Gm-Message-State: AOJu0YwVpF5Gy4nTdJPmroNxi99r11KRZnaGLgXfbzAalAfGpJBj36Gb
	jNBNTiuiEGHmZ5z5k5Eat9wiSTeuiCecyN77AWKPigoGLm5jnlQsftMfaM3SjAulM3Y=
X-Gm-Gg: AY/fxX7POxWM/nI3xWFZM6xBxDaUeL0GN//+tAOCE7VLpxvYxNYvMCsMiUcx/AHuiC7
	uZn6ErSvK9ndNxyGynCRX4+VDy4fIsDlpeFG1bGsVC+V2k5yyGWYa5eSdGQdX7kpHrIEDKgAFVL
	BCEZNsuBvGZZ4XGKZHVMNpzjJ1pLUtpJrqtzUcGRIzliBjr2QhPFaKbFtnxrRmZPfNwv/UdyLw+
	uBZexUG3NwcgoS/F9qk1aT1H+VEBf8QN7mXZaFOsZHUKq+EvGBQ5VU67OpzLLU5/iCx7NoMX1St
	TSSAnanT+PfzpeCVf1d6qDGStDC5O3j04RZIT75dUyViRbWgaueIMMkhQLo6CAHJiE52zRL+wNt
	KumuvAasgDLNmi5U3U9lTbWVlpG+hcOwqajBQAiLcZtwF5//beZthLR78tCHcaoTNfecU9Si4Bw
	d0S8vl+cAooMwl2AAG
X-Google-Smtp-Source: AGHT+IHkgW927iPiW7zVWJf1VnqJUxtlpbfccw9OxZ6+AFkNdl4ava7yOMMQmuHv9ZI+fg8GpAmGDQ==
X-Received: by 2002:a05:600c:4692:b0:47d:3ead:7439 with SMTP id 5b1f17b1804b1-47d84b5403dmr31430905e9.37.1767796401195;
        Wed, 07 Jan 2026 06:33:21 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f653cd6sm106370605e9.9.2026.01.07.06.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 06:33:20 -0800 (PST)
Date: Wed, 7 Jan 2026 17:33:17 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Karthikey D Kadati <karthikey3608@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 RESEND v2 3/3] media: atomisp: propagate errors from
 ISP xnr and IRQ enable
Message-ID: <aV5urWWGzYlZr3lo@stanley.mountain>
References: <81e2d12c-342b-4b88-88a0-3e24115541aa@kernel.org>
 <20260107134844.68074-1-karthikey3608@gmail.com>
 <20260107134844.68074-4-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260107134844.68074-4-karthikey3608@gmail.com>

On Wed, Jan 07, 2026 at 07:18:44PM +0530, Karthikey D Kadati wrote:
> Propagate the return value of atomisp_css_capture_enable_xnr() in
> 
> atomisp_xnr().
> 
> Also check the return value of atomisp_css_irq_enable() and log an
> 
> error once using dev_err_once() to avoid flooding dmesg.
> 

Leave off the "to avoid flooding dmesg" because otherwise it makes it
sound like we were flooding dmesg before.  Just say:  "Also print an
error message if atomisp_css_irq_enable() fails".

regards,
dan carpenter

