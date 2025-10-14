Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF8D264A65
	for <linux-staging@lists.linux.dev>; Tue, 14 Oct 2025 14:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760451326; cv=none; b=dMWBISjurOz/+J5n+vgmS3buhaHTim1p0isod35XavSiNOoSA/O3xATqW968xxixp97y5P/LN+k/BQScBQ9CbjNSWS9FD+hyMaXSvGkP1rT5e/XWWZ2FucUMZINyR/d/10VCa/PDGC/qSmZFnah2BFfOwS0r7pudYdSqXrjVCEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760451326; c=relaxed/simple;
	bh=JJEvsdx2EKYhgF4ioQ2Hnp5mKA4ie/BqmPFrQ95ZZmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BZRh/GuyCX+oFgVUq8gywezTMUP9oOIjEJkOcsmkHGiXRmzFeQv4gS8sFX1XSJPJrSfxgEBDlJ/3C2Ic+5MvQjrm6EOHUvEVBMVX1L/Rc7vjlexkBetRzpFA7GtT3tPxHozyQNQ0oCQmBbGeOKehjNiHuEoKRLIZUECH8tC3ug4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o6hr5S1Y; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o6hr5S1Y"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46e326e4e99so31221385e9.1
        for <linux-staging@lists.linux.dev>; Tue, 14 Oct 2025 07:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760451323; x=1761056123; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5vRSRvvpcXw0lckahk40k2dwuwYW2dWayzhYRmO9OLk=;
        b=o6hr5S1Y72FI94imDuZCEiCB9w89iYTdBWBhI2njXP4b5iHAAMC/tZJkYrS4qe5Cyv
         EfKkPCnOJ9ZZAcHiI2k3RLPah8JYq4LJIOP0QpFQ9PeuBFLJvwFB2Pvkn6kPaeKeVkUZ
         CrCFcIr1Zzud/iZH6QtMGEtFUWTo3Mv/wpEPvOQz7jWd4femwjAzVi7rVS9YrP3YtNQ3
         0Np92lTak0xFhqeYSBZdH5db2w0BYs8HASFbJN5c+8GSpHFQa5o/EsyVTb1+lfmDw2VA
         kvIR7bKc0I1mUUpWPJ4ZloOaYB/UPfx2GDI3T+1swOLao8Fr19H/YC1WjH4WN16kWXjS
         6dog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760451323; x=1761056123;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5vRSRvvpcXw0lckahk40k2dwuwYW2dWayzhYRmO9OLk=;
        b=nlprlX6xbJp6BuZRSxiyUMDUCuZgoIEe79aNBcPbxZjA8rz80WC5oGwpAh75jdnN1g
         ar4e4FTk/oXdFS1d+dcQZatZY6JAYkBLHVYUxI5HmSpAHpX9W6oI/5kGq5ibwFmnbA8v
         YdsYFDdNp4p/eVkgH8FnxphtYNS4INzCWh3QjAJzZTNHAdorxD5HWX7XOZvDGZAcqZwl
         hHIl2L5Gcfw+VeCYQt8FcrZdJB9T3SlVn3QowhL0E3Vvtz8Yp4w3wHLuCFqLm46yfFT1
         zeNPhOUeXgA9nJ3gJrYvzQjaF2WYYKGaoBvQWaxZsvzI63kKsFHt8I3XWuw8VcT6Ccvi
         VkMg==
X-Forwarded-Encrypted: i=1; AJvYcCXEac9sMllnyDssVBVMvbxRvXIjLvNxFYkGzcr2VOynyTJtGDtXubZAAklAElQwpkvp05tTfYMz0Yhp4brN@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0WknWDGxUUNOc1v9IU63/Fkn4/KVkQkjWs5RNEvXRer5ed1KP
	iSBsug5jyYRnNcgc/yX5PeSulvnkSLZmNGcVAPHKg4KuSE29+juBPS+zRs3a+ClvUQU=
X-Gm-Gg: ASbGnctPAeKyYnSW9fkE9UFij97SkmaBxp2ZTtjxLRr0KsHHNa2GQoixL1GY/07IcOF
	Lo5LXhBi8cIDh2VGyy9tGH31YwlVVhhD1CVm+l9UGUFcddllr9/i0i3LJMlXYx77kCQP5xd7Tl5
	SJR5kLwBUeBVmSAhvulgFF9A9mmS7/H8+gBVQA9bStEkQgxH1HHqonTLGC5Id2kjO+te4lha9gO
	lWb+xQNVA/ZCMauHMsqqoY4cqdgsI13uCLYITZM1idf1/hMaCc6i4ccTHEC1FeInmoyebZPGL/a
	dRl9ppEuTwWqB/9QzWEDRrgGJqOAGVQbh9lk9Nwt7BPpXW0UIT77PljOrd0B9kkpSX7aNIyYNm9
	9obxRAvTt4tIUR0m3UmBTPb9IBT9myNTnO7OUOZKRDXFJDML5UvhZH+f/NQ+Ugg==
X-Google-Smtp-Source: AGHT+IGWbodeDpSgzFoLY8qVHoIv4GluIBqFgtel/+kqrsa8p0+/YdDB49sS6YR0/0Tn+4xOCMMzQQ==
X-Received: by 2002:a05:6000:26c9:b0:425:57dd:58ca with SMTP id ffacd0b85a97d-42666aa6384mr15765996f8f.8.1760451323183;
        Tue, 14 Oct 2025 07:15:23 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-426ce582b39sm23589081f8f.15.2025.10.14.07.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 07:15:22 -0700 (PDT)
Date: Tue, 14 Oct 2025 17:15:18 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Cc: gregkh@linuxfoundation.org, johan@kernel.org, elder@kernel.org,
	schopin@ubuntu.com, me@abhy.me, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: documentation: replace strncpy() with
 strscpy_pad()
Message-ID: <aO5a9izAISpCDJrc@stanley.mountain>
References: <20251014134148.2597178-1-vivek.balachandhar@gmail.com>
 <aO5VvrKTswmfO-n9@stanley.mountain>
 <8918310c-d0aa-4e02-b9d4-9aac98b0a48f@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8918310c-d0aa-4e02-b9d4-9aac98b0a48f@gmail.com>

On Tue, Oct 14, 2025 at 10:01:28AM -0400, Vivek BalachandharTN wrote:
> Yes, Dan. Nice catch. Building it with below sample change:
> 
> memset(&intf_load.firmware_tag, 0, GB_FIRMWARE_U_TAG_MAX_SIZE);
> strncpy((char *)&intf_load.firmware_tag, firmware_tag,
>         GB_FIRMWARE_U_TAG_MAX_SIZE - 1);

There isn't a need to doing the memset()...

regards,
dan carpenter

