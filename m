Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4573D96D
	for <linux-staging@lists.linux.dev>; Tue,  5 Nov 2024 16:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730823315; cv=none; b=qgxLLvGRn40h7bQZtKIQ6c4eF7dniwvuX84FdvDlYVD1X7OUpdrVi2WC8Qz9opvrjyy2A2bAbMxEfVaRBkZHpqS//jZTm3Lm51SSHcIUuVhYD8VU9DazqgbLaajuR5HETFfDs7gvTpO9HBE2g1dqOUMo7gBMCC5JPj591/jnPVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730823315; c=relaxed/simple;
	bh=WUSAP7JfoT0KrQZ5hTAXo1+SUCAu6hsTJMVzWxbiRos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C3CoI78i8Y7sRM+9AeK1ysbdrGgaTUwPGwfM2BjhUJV35zvrD2sAS2DixgNB+CxO1f9SREyvENCCCJ94zHBig/ezIOiWnDjJMsdN/yAsBCqS9JTw0DEGS/7/t0fSAVjxF++4bnCTQceT3yuanDprJNGGGGApYXbz2e2ik1kTdQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bkPnd0pd; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bkPnd0pd"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d4d1b48f3so3260399f8f.1
        for <linux-staging@lists.linux.dev>; Tue, 05 Nov 2024 08:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730823312; x=1731428112; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CW1Cg/cnkPv9u+n4mqogPh24pUykRgt3ujnVhJASOW8=;
        b=bkPnd0pdnSKOpRh99+Y3rVAG5e9tg7p8DkgxixBe+9ELHgjomn8GYlsaHXJs3nVEdM
         CprEO+0Z08qxI9W58SFh7CezcOvwjdUO/gFDCqwFZSvHIztXFHbQMGN1BT50SE9TgIQo
         +C0d0H2F9ubfS6ujm+kyaachmfshsP76xIRBTbrlKAv9q9qgTQrGRhvGfWdLadtOD7W8
         3VCT8DjdCB6MYt97lX3lS/2hPE97gM7gn5Zub7PooTENUpptaLhcbzZhviIHNt8qQfhw
         cE8D9fzMFHxIGAF+l6tFjvZFmBz4QWkOHL2ubTI7Gk9VJYR45QLmOZAIlg2XHTAsgnE2
         eufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730823312; x=1731428112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CW1Cg/cnkPv9u+n4mqogPh24pUykRgt3ujnVhJASOW8=;
        b=uy9omDNGZ430gsjoE+1It7hcLulFTj0gwDc6b51wicJXt83CdNpVu1DqWSbv+lXFE8
         VPE0yNbcM/orFBAsfJKdjlEo7E8Kcjz9QMr6usSEGoapnppA3AaLWB//0G3acL5EkgaH
         r8bUL0mfYS3EE9k2Eqb8Yz9QfNPdJzT27zX/bbjgRKH3HvZExMDQz/vMGy34O4IBbxOc
         kOFsxKoA7X9HGbpLKdV+chBYayBZ5DDWzWY6CFE1F32uwu+zx4DTRrQuH9TBTfYcKqeP
         M/cTIgxCiKyGiWWIF1SScw/ibcG5x4h6hPRgnHSrXbqkoWVRAyWyXXf+Xa2Hq7WCD2Hz
         VIzg==
X-Forwarded-Encrypted: i=1; AJvYcCWVadk1I9UrnzHNdheSocK9SwVb2ghzvOBAa90nH3a8VJTmcDtqKq1Ot2D+gdTK7/wqVAgvgDyyLUAkihR5@lists.linux.dev
X-Gm-Message-State: AOJu0YysrrUTIqlxstIRBM2TOs3vNB5mjL9zQtafGrSvbWKUH5I+k3em
	0KiuQIB7KjJrO9yBk7s1evnCNzZSP/e6bF7CvXh3poW6G74iD/9dT2hkxVDxYA8=
X-Google-Smtp-Source: AGHT+IF6QXzlIan7zLZ+Ti4McbwWx86e1nJWzWZWC0DEaU8zyIoc2LEiFjd311LHzgQU2S/tBukzHQ==
X-Received: by 2002:a05:6000:ac1:b0:37d:3280:203a with SMTP id ffacd0b85a97d-381b7057644mr17370896f8f.10.1730823312316;
        Tue, 05 Nov 2024 08:15:12 -0800 (PST)
Received: from localhost ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c113e771sm16717277f8f.81.2024.11.05.08.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 08:15:11 -0800 (PST)
Date: Tue, 5 Nov 2024 19:15:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Zicheng Qu <quzicheng@huawei.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
	gregkh@linuxfoundation.org, cristina.opriceana@gmail.com,
	daniel.baluta@intel.com, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	tanghui20@huawei.com, zhangqiao22@huawei.com,
	judy.chenhui@huawei.com
Subject: Re: [PATCH 2/2] staging: iio: ad9832: Correct phase range check
Message-ID: <fe767a87-f3a4-47a8-882a-2a33f7eca2e7@suswa.mountain>
References: <20241105140359.2465656-1-quzicheng@huawei.com>
 <20241105140359.2465656-3-quzicheng@huawei.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241105140359.2465656-3-quzicheng@huawei.com>

On Tue, Nov 05, 2024 at 02:03:59PM +0000, Zicheng Qu wrote:
> The phase register for the AD9832 is 12 bits, which means the valid
> phase values range from 0 to 4095 (2^12 - 1). The current check uses a
> greater-than condition with BIT(12), which equals 4096. This allows an
> invalid phase value of 4096 to pass.
> 
> This patch corrects the check to use greater-than-or-equal-to, ensuring
> that only phase values within the valid range are accepted.
> 
> Fixes: f1d05b5f68cb ("Staging: iio: Prefer using the BIT macro")

Same comments.

regards,
dan carpenter

