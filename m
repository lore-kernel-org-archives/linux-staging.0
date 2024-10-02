Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6FF71D041E
	for <linux-staging@lists.linux.dev>; Wed,  2 Oct 2024 15:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727884419; cv=none; b=NMtjR3Vy8PxwWEhqkfGYJ+x8UtZgKgMvKsuGFSw/bjQFKuHJ4jT7ZtGpEyvyoiT3sVeIxKgJlwNM/qp3vEbM/57Fz8ApUYJLxpqSxanGsZioCRZZxXmrDsYYZXJXGVGEpuEShFyf8FXCu60mGlYXL031Za62W5ZSfcPY6UhjkhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727884419; c=relaxed/simple;
	bh=sdxpKH9V4c5yfJjsw3qgNvWJOgyXW68pU2J1QpqbmCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LHrJWbD3CPJJQ3jZURGt+DhtsdoQ5xTvZ3Zcb8E/3OsAi031oI1XjOWEpayDpfiH+TOzkJcB1rnpnLnYp7vfFjf/cUx4SZAh8LINurN92TDxqDSxWokffDaeFEnibrfWteG78gdefauaQmZoYAK11FHq2sf4OKLB0DcuoVshiT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yNgt/Bsc; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yNgt/Bsc"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42cb8dac900so66535465e9.3
        for <linux-staging@lists.linux.dev>; Wed, 02 Oct 2024 08:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727884415; x=1728489215; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MdHSrW/ChJntpJXVDEopdglyYp7fbBJgyKHsyD0baf4=;
        b=yNgt/BscUvAyWY/mNsyXXjGPIRUXsq9MvjgfSQNh+7XxuTVrnGtVyyblyuMV9AovsO
         8tRGtrnhG2+MRUWUQq0vUFOVU4/gPmSgqry8FBhkqTNEBcOQMbpGOlQUSiZjNYvRbFhH
         ysYWKxWzj6Y1in7uR8LTpattCw9KDyd5vTTqQG/xfk9L3Be2jYGpjyXdLL4l4JPOf88+
         qW8CjhjM3Deg7ByvbPDzKS14dShVyADWzb/T8fqbFy8OzepPWw9ZZrg05X2j74V8H8Kb
         jI4kZyve4Gfwo8FhsoNKlynp7TScP+3MDX1Yqo6Ci+GXU38Ed2+mxcgC04yAz0p2WbZA
         EVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727884415; x=1728489215;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdHSrW/ChJntpJXVDEopdglyYp7fbBJgyKHsyD0baf4=;
        b=aMvkpnnD1iXKBB+PZrlR4hmrdv0RDXdDWDyenAsQEPZ2Zg54QdYwjvS3QgBzcVDI89
         PRp8PZZqdq7J1mmvnMAiRQ5QehHGWJF4Z/UVnaZQ8yYj2dHdvYtPLDNNYAdZgEVryMMX
         ym7sqeTyOvtV55frfKQVCozTmfl0N7mKV8UY5Vf7sCoPLCTX6iHzhsa8LIob8zNItj0v
         pKBLuWo1fEHrIA9nZMQa6SBxQAOwpndUVSeOeGglrRBIbUQ+q02/U/K8INVDa6qFZaCt
         /1RygANHBhkDKcVMkwH8kDRf3FQXZwaKhAzybx1yBqQRx0TDh403wNcBJJAxfStfGO4k
         hxTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyHZQTRPo30w+gFz4qCYbYX/myGfE1TTnD6VzpIqBKgFTxcVuHp9agdo5jCpo8e6jtp2JArE0e7HBy6VvO@lists.linux.dev
X-Gm-Message-State: AOJu0YypY1/uTXH2/Y+JrgRnrFCoFxpQdxjR6HW+VzFrC/wqXELVvHwr
	2FZmFW5E1m/Zm9//ijt6UjugfzG6qyOp56JxY9eI5jcHBbhZtoxbbNHhbI6mw6E=
X-Google-Smtp-Source: AGHT+IErKLNJPzyffjAz6YIrrKSomVc/nej9Sz/s59zloqG0Mzrd8SoXK+sB4+dGv+nZ3cX0x1Gm+A==
X-Received: by 2002:a05:600c:358e:b0:42c:df54:18ec with SMTP id 5b1f17b1804b1-42f777ee3f9mr24259735e9.28.1727884415231;
        Wed, 02 Oct 2024 08:53:35 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f79c67c5csm22433425e9.0.2024.10.02.08.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 08:53:32 -0700 (PDT)
Date: Wed, 2 Oct 2024 18:53:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hridesh MG <hridesh699@gmail.com>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2] staging: media: fix spelling mistakes
Message-ID: <8c62e5ce-3c01-4c1f-b8e0-1c6a0164670c@stanley.mountain>
References: <20241002152231.8828-1-hridesh699@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241002152231.8828-1-hridesh699@gmail.com>

On Wed, Oct 02, 2024 at 08:52:30PM +0530, Hridesh MG wrote:
> Fix three minor spelling/grammar issues:
> 	chunck -> chunk
> 	procotol -> protocol
> 	follow -> following
> 
> Signed-off-by: Hridesh MG <hridesh699@gmail.com>
> ---

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

