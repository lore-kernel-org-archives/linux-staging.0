Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3EE17C220
	for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 15:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770908465; cv=none; b=BOXK70p246wn4B+oF1iKnDhXuYP3YySBQ+mPRSe5PmUmcMB8blA4YETD8grIgs0kEdROh3FuVHifJQ0lZYaZZgKujsCu0YXSq/l2VXRfgQHgdQtWhOCNKcKhiBOriMOrS4236iXFqCW+gR6pL6KLQaqkVMn/iZ6laGeU5hji43E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770908465; c=relaxed/simple;
	bh=Sy0FXxJS9pGFwK3ox3r003dONE+A7x1aAWa3wwqnqAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DGlLGUvhyPHFijniHqHO2wdd8yjggCwoaXWTjIObvv4REGBvL9V+cvK94vfIZrYDs1zRUZrQ8d+IE5lmfqyyo/c6AJaRnP/JmheCeEI68tFv5fT0ini26c5raegL4S+CTWSPXO//ne6Iz1TuVQhihNMjlVU+rFL/L8RyltrvQFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OYXtZpKv; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OYXtZpKv"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-4801bc32725so49847125e9.0
        for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 07:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770908462; x=1771513262; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dXjq2POb9F5N9HBoII/VkQ6Kh3mw/X9QSJ8H8qoNuWc=;
        b=OYXtZpKvFWjkK4rBtfNOsBJNW8I0uHGnIRxrhZufRHn4LNsoAHEPSj0XJXeQ9iywSn
         YDj5U4xdxdTznXHBto9Hh9peqcEyATggcpsMihVGWpb6gsNnEfomYZSFghByiecvJ7HR
         5qQkAuwV97mNTq2dRJA1g8jYHLk+OUsvATxTQ/Sj+/Bf7GAD/tUNLNJ5ArTOeiagnYaL
         UpzO8fr4mCPt/+DLbvNzeEgXokQEHpFs4R3P/iW9HmpRK/ArvU0/MC+n1TV+55b4+Vwh
         I8ZERVLJ5QbdQFDPofStjnK57hSGEBXKWEaXykgBvf6eXXIcjamcsW06znjKUcogX7lO
         +xrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770908462; x=1771513262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dXjq2POb9F5N9HBoII/VkQ6Kh3mw/X9QSJ8H8qoNuWc=;
        b=bCv7zzHne4Uu9MEH4wCc5Wn3xUMj2oupPPR84VEf0siAN/2SBcjjG3dmusaZl/UzhF
         uk+RghfnCvm8GjSBdvX5vJMeeO1orNuiMTrAunaZAwg8z8gLbnY2OB6OLKLqkRmGGrqZ
         pyV3l3dDIuBv0IpkALQYMknYqRzbiMUnYbKxIZiGtI+J2APUgA/HqPfzxa7Z7FCbihKf
         Ds6/Oc1hyO0kwvcVYTK7OdSwlg78BGvCBpBNEDzgHd+iK++06SKrQhg1ra79tYztbtSa
         pUPY4BrfI8/FLWhTL4+Ij72kxCWkQwIvA6ZAgQvWoDXqD3XAqHRgBbFjU1paYBjjc6gb
         OLYg==
X-Forwarded-Encrypted: i=1; AJvYcCXxtEvLrcdQcVxfeAfMm+6YxSrcu356JFv2cyFyl1qtnraJTiySgjx0791rtFT2hsiu9XJ8shRc820buZAF@lists.linux.dev
X-Gm-Message-State: AOJu0YzAkS4m2MIltvBEid/J6REfn3A5Z7XGRKZkPaoHtCiSn0ncDysD
	3BEFJv2cVPPBU3sNx4iIFkn0nCou/yFEdllKq6S13qXbmKuDgNAqOF3XA9CgLGFkIxa/Huu5Kwy
	KB0uOF6k=
X-Gm-Gg: AZuq6aIPyU+ckV4wzPNmTkeSWvlidTOEuIYxaKrYR1gvKbPsKZlgAbhHqoQl9/gQGBY
	VXaV5lEw6M6kJnA8a1N4Z9Lh+xk8E7QD9BO2pymPVuZiuM/igIiytY8yYVS4rlLmIw+Wgv82mvw
	yBBUenY1GVH4D6iKbEk37Hu9IxX/rOMy34VixoSP41RPyBxTZS4pExaXQByRW9O6nfdZf8yoP3J
	cwh6jdR9riTUvrjXWqyDb3cza8YOR2WIz4+CzvkxvH1hDhNxhI4RZdZ3C5NVjEgPnkglSpa90PR
	bngboIP5SKXJmRMJqjZz8fMwgr4W4IyVyfR5ArOGm8lUoy+FGfvbgkWzD1WhdhN+Qa/LW0RD9mx
	IcVksCtQ/tXnNyu3nN1bEzeHWz+ILDb3H+YGleUQ8PF8xVZCVF/hFGkOlBpiuVgldd58sEMzq/c
	zdDNzq8f0m/2ssGxT54dcL5l5Uc3k5
X-Received: by 2002:a05:600c:4e14:b0:477:561f:6fc8 with SMTP id 5b1f17b1804b1-483656ae486mr42929955e9.5.1770908460742;
        Thu, 12 Feb 2026 07:01:00 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dfb4bd4sm132868965e9.7.2026.02.12.07.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 07:01:00 -0800 (PST)
Date: Thu, 12 Feb 2026 18:00:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Juyeong Jun <juyeongjun.knu@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: split multiple assignment in
 osdep_service.c
Message-ID: <aY3rKcvfzKPIYeZD@stanley.mountain>
References: <20260212111315.4979-1-juyeongjun.knu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212111315.4979-1-juyeongjun.knu@gmail.com>

On Thu, Feb 12, 2026 at 08:13:16PM +0900, Juyeong Jun wrote:
> v2:I fixed my git configuration. There are no code changes.

The v2 got under the --- cut off line.
> 
> Avoid multiple assignments in a single statement.
> No functional change.
> ---
  ^^^
here.

Also no Signed-off-by line

regards,
dan carpenter

