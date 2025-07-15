Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E80225776
	for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 20:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752611443; cv=none; b=pccVZpK6e6RRV7N7wicC7YBkurQiMd6zf8dVg77wZfS7IGprXpolg3FY/Z1V1STBkvKyoo3VVl5HsOdtYQKOcj2sjmCk02cTD5yHntr3AiX3XCQESKn9iMVjWThD6lHyA5R87kXdKitgsSLNLG4DuHkXx4WZ8S6UUPNuO0BwAxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752611443; c=relaxed/simple;
	bh=1yQoQkvqX9mmnClp25QvfEznRInvWZaMgXS1yJYfpKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=psS2ih/nPK1MPnylEBM9uI/1PnclcyVpqC3zbzYEmWA74J7YKDmSxcCxRabEA6gq2x5CJywZYuy3SNEC3Mgg+U8Jc37aIj3MZWStxaFxwaFGofUz1RI+dxJXh4loGyEo9CQhMuMtZPgzZd+t79nHGflNfvCaBbyTC7xzenrMheo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vuJYs0v0; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vuJYs0v0"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2c6ed7efb1dso3878295fac.2
        for <linux-staging@lists.linux.dev>; Tue, 15 Jul 2025 13:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752611441; x=1753216241; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0qnU3e/UbtN7g5RYL6+3ED+hDCWkfgVIl5O8F9TCC94=;
        b=vuJYs0v0EzatMqlXGBJUGxM06N0QKXJZOVsymBASKBZXAsDex+RZ663ih76Q17kQlv
         n4Wu4xe3rJnNPIXmz8SCGNmVsTOJI8ThtAwwEOW7fWP3c5I+gGy81OIPeL8Z71XJfjG+
         qCOM7TuDcDpzYe4C5ZMp/LlBCBwkxRb85BvYT7SctuRGsXV1NyIas5Q8Gf5iP67qiLOh
         Qi65lEa6wf6OKjkDdPmO5WpMMw/Dp5uGasjn/hlFKMCNAeuE7/ZykPFN1rZPmXYP4dK8
         sXWlxBse4Hu7hFvq1d/hgNjn745OSU9dYHm5OW8d2LZwAzJBEOx7eY3Q7P/Bq6QeaukN
         mAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752611441; x=1753216241;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0qnU3e/UbtN7g5RYL6+3ED+hDCWkfgVIl5O8F9TCC94=;
        b=IbZByhuWYzG8N7/hfWUo+/bg02gq0u//f87G9GQ590rISERxfd6grCz/TEutfnrAUd
         c3I8FS1atWWGt0D/TdBTeWnfLILjEfJyICAuAUZkLVkSKkVJ7zd/yCeXHNa+Ym7htLOI
         gKX5KIs5rW7FPvrYVmyeYMf9ATku+M9rRDrrWUIOtTKaGnJkjq5iKYc4+guNMRxEHtPR
         0VbP5iqF59bArKmwDkZ8Ph3NS1ravMqZlAPLPgiLPreR2Xz/n7ydSAir3GIXbGhCOmgm
         PeJ23ORgLHF8kglBifxPa0m9XylxtE4eyy82wrPKpVLAqzXBZwJ9+cjkUyc+KHmcUEYU
         mYiA==
X-Forwarded-Encrypted: i=1; AJvYcCVcdQfur2Whf1OORecUM3ts+AgRFF+dP2Jp0VcZAVgUZkBMWUNNNhEd0D9YNQd9fxExXZgBCjq2uvEGcYf+@lists.linux.dev
X-Gm-Message-State: AOJu0YyCmAv/FVs0KMRycw5WWdrspMn96qubwBB9rIZAatkH4svUx4Gs
	sh+i359Bi6i0bqWU7jxuFzpvI4Ziu6r70g6EbfHfsg1ydhOiq33wqRrpaUOQQMcjcPk=
X-Gm-Gg: ASbGnct2MBlgPEOBYT9DXnwDbwIgTam4pXU3ZvYZXb7e9BnMbUTZbVqoho4+FOLeK/b
	ohMMlJ9SWfAFxP7MwRJ0evy4VBP7dFWvv9mcwfsIZyCqjPpgSo5KJodCXBvrBFXXGj8NxkxHzjs
	yaPLVUqP6c0x+844vYGvPxzEgKsZYt5dSTr5wTjpcMOxO2VC6ge4yMtWROn9Wx2HlbP9T6o/6lT
	euixhboeJ8bZPFuIJR3D1sPzS7YY0BL15+kyhHOM/d5CowAvGWb//OiF1xLaQaiwwEfIoegsOuN
	L5f8OK3e54X1rH4u0g8xXB+xwlXE+dJpESFnYYg+A1URvphkqB0d1GfM4gBA8BQ9udjlfHsY+q6
	VnTkE6GDoHM2FN5KA4ClGFej2ptna
X-Google-Smtp-Source: AGHT+IG2+pwfhzJLrz8IScyfJm6Y2ziaIzZQnZsetieX7P83RKFLQioSOUBeRHkfbvI6bsQBYcAosQ==
X-Received: by 2002:a05:6871:780f:b0:2ff:8956:fd45 with SMTP id 586e51a60fabf-2ffb1eafe32mr237804fac.0.1752611440637;
        Tue, 15 Jul 2025 13:30:40 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:9b4e:9dd8:875d:d59])
        by smtp.gmail.com with UTF8SMTPSA id 586e51a60fabf-2ff11235201sm2896491fac.12.2025.07.15.13.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 13:30:39 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:30:38 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] media: rkvdec: Fix a NULL vs IS_ERR() bug in probe()
Message-ID: <e4d9553b-34b2-4c2e-8d56-f86f3d51fcfe@sabinyo.mountain>
References: <696219e9-a1c7-4c87-b15c-1ffd42c95d58@sabinyo.mountain>
 <6ac8b8db02190da7d2edc9ce4abe5e7a7cab70d6.camel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6ac8b8db02190da7d2edc9ce4abe5e7a7cab70d6.camel@collabora.com>

On Wed, Jun 25, 2025 at 12:13:20PM -0400, Nicolas Dufresne wrote:
> Hi,
> 
> Le mercredi 25 juin 2025 à 10:23 -0500, Dan Carpenter a écrit :
> > The iommu_paging_domain_alloc() function doesn't return NULL on error it
> > returns error pointers.  Update the check and then set ->empty_domain to
> > NULL because the rest of the driver assumes it can be NULL.
> >
> > Fixes: ff8c5622f9f7 ("media: rkvdec: Restore iommu addresses on errors")
> 
> Oh, sorry about that, I'll will test your patch this week, but otherwise
> looks good to me, fixing yet one more error path. I'll take the time
> to test dropping the iommu node from the DT while at it, as I simply
> don't remember if that was re-tested after that change.
> 
> regards,
> Nicolas
> 

Ping?

regards,
dan carpenter

