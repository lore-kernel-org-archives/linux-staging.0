Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04728392C25
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 07:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776065234; cv=none; b=lCW5cCG5HuIBNlhbOoQ+/Ef+jdC0gxs/myzMZxsYiwUuIxv47u83ukV/TsXwPsOQBFfBfjqjhwRDD5Ow4k7k+uRZwkyDqwlfYYKDDbNgJXgON2XSp+Cx/vcwKwkpqu+MQICnVBticoI0swmiJ57JQo3IKAO7m28jhOllQLFjXjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776065234; c=relaxed/simple;
	bh=TMX0GVYUcC/4pa4IA0Xg1yJG8EYpQyDgj0o91746WJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LTlxUKP42mS9WBRtpMog9Dfn3lR4Cr+0oiE4mxFyFqgZ521NW2cVqEPO9L+entsr7KRyFIPD2xz730//mr0yEdO8jUX4c9NfQUAPutjEWOAia321JUU5LchKFQu3uXl+MZdVSCiH/Gy/nrYkXhzRIAr1RfZsGPVZKSZcZCzdm1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8EqymQR; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8EqymQR"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4888375f735so38403435e9.3
        for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 00:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065231; x=1776670031; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vB8fTOutsfZIie2qCEI929IdjXgTwcdUZphinUXaVGs=;
        b=i8EqymQRsZkh5wc7HfJlrVnCWjxInnriKw9hhj2YTIEffuOH475HaZLTJ3KPNn2v0v
         gnDnCu7yboJ0SCV0hw+zzWjvYPSV7ekhUobdrmwHenyBy+i8jmfIoK7g+WSUshkqgMMa
         wNGZwgQD/0SYC0IcCBWTGDwzJnByflY0+i32UjoWWtLn5QG3uqT7kMHGR7LPPDch8JsM
         PiU8kvNcPcEUiNnXG8x1qI1Rd+EDzKqs6dWIdt95b9g6crU1OUn3xgTHmz/yrQIRdFxC
         gV13KvqppTFfqcu2lDp8a9Mg1pQ4nZPOGdr8a9AtBrgWHZiRRzJ6A8EJvoJKQmpABjUl
         eXSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065231; x=1776670031;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vB8fTOutsfZIie2qCEI929IdjXgTwcdUZphinUXaVGs=;
        b=dGqgFDLVOFeFP90O5iUh/gefioEmUqOEVfSIfyNJX9BKt8tQTVlHr4wYj54yX1QUg3
         epn/r7vIykKKif5lq09612w7kDkPSb+R32p2IlXyd0LXrAKxH4VPCF7qDTa2QwsRPfSe
         r4SIDqpVMIILKqMCkg+DdQ/6/1ZllsmXQsVLT4fz4SrouVTzG/RtFTVGTzUbgoHCCr6R
         F1nqdtN0giaAD/3ixUABdZD8aWTGT0EqXzyiS9NJ1JSeAbnVcZF+E+SqHVnC5Ip4G404
         n2G9Ed36Lci8x4Ki3O4AQp7xgZm0/EgnAqRpMXaxdr1Gu+CmaTlMlEW1CiVmFavjhvKF
         nJsA==
X-Forwarded-Encrypted: i=1; AFNElJ88C+NVWvQM6Ri46cYAunSrtyCSHNd5TVVvFBfWfsJI8sEWml9Sh30znJIMQtTbbQxEoX4u4xSe84NbpB1E@lists.linux.dev
X-Gm-Message-State: AOJu0YzzXlyeC/qkWQVrq1EPwBzkRdJbq17aeLKwRIDB8qHzMJoUiCvJ
	JEulUM/PzwDqpBPpaNS+x0jxYiMLO8tD/pFaOeeyoM4xsx1GVZ/Zp87p
X-Gm-Gg: AeBDiesWI5vMBbmI5MWGHvRF9snqrY3IJL6/s9ex1ndGWm5si71zFcVvywtbKV1WGUX
	Ai5iHYM1A9f5G7+zW7FGeMLBeo1mLetCBkSmMoL8PRkTzboiag2Pp372zZ+Pdm664ukZ21kLJm0
	xGQoAhEmUrfDBYb4g2lqYNkBL/mw4K2Mv0H/kh8X5TWwLrt9rViXLkINd+AoG1m8XLDqA+e3Xpg
	VaGEkkhVN0Yq/zRSUqwBrQOBCBhaop3dvX4A2WFUMruL2jKXCQHo2Ci7CZXVr7+1JjAoSGTq+Qj
	FUjuWjfpYqT/F9RqyZCIFvsf+WKpPqCCaimCkAm2uIQv7V9s/9L/xzzF9khinnlK+4A1I+QULxz
	/6F3timohRreJ8JQmkl3cPBN7j311KkeRsj9Nua8tklX8kffxIwWGVQ5CGQEd9H8te/Bl+LI48N
	4X0AUVsAP9uh1oPKnfSjo=
X-Received: by 2002:a05:6000:1447:b0:43c:fdd9:1890 with SMTP id ffacd0b85a97d-43d642c999dmr16766155f8f.51.1776065231364;
        Mon, 13 Apr 2026 00:27:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d7400708dsm12208844f8f.25.2026.04.13.00.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:27:10 -0700 (PDT)
Date: Mon, 13 Apr 2026 10:27:06 +0300
From: Dan Carpenter <error27@gmail.com>
To: Alexandru Hossu <hossu.alexandru@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: media: tegra-video: fix wrong return type
 in tegra_get_format_fourcc_by_idx()
Message-ID: <adyaymJVZV63WzQ3@stanley.mountain>
References: <20260411211006.150782-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260411211006.150782-1-hossu.alexandru@gmail.com>

On Sat, Apr 11, 2026 at 11:10:04PM +0200, Alexandru Hossu wrote:
> The function is declared to return u32, but returns -EINVAL on the error
> path. Due to implicit conversion, -EINVAL (-22) becomes 0xFFFFFFEA as u32,
> which is an invalid V4L2 pixel format value.
> 
> The caller tegra_channel_enum_format() assigns this garbage value directly
> to f->pixelformat and returns 0 (success) to userspace via VIDIOC_ENUM_FMT,
> giving applications a silently wrong format descriptor instead of an error.
> 
> Fix this by changing the return type to int and propagating the error
> correctly in the caller.
> 
> Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
> ---

Do you think you could analyse this to see if it's a real bug or not.
If it is then give it a Fixes tag.

regards,
dan carpenter

