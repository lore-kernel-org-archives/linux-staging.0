Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3AC325757
	for <linux-staging@lists.linux.dev>; Tue,  9 Jan 2024 08:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dLwH21L4"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-40e461c1f5bso19902175e9.3
        for <linux-staging@lists.linux.dev>; Tue, 09 Jan 2024 00:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704788566; x=1705393366; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RkCvYd5950mTrHdIV/MAXFZQdz85NWu1PStSMrB5EH4=;
        b=dLwH21L4s0pBvRb6hqhcx1RoQiZP3EXmUBoDpyrskIRJCr+A6gzdlO0wpNSNNiQFvG
         bitKo6RJTirMqPomtEZ7N2OIPpgKgc/RkbEIPuEe07W3NXcWjzLW96eabTAkgdDA3iin
         0o1xWqVM1NiSLv7LsSf0AwoShIJHrr0zGrZ7d3tPo9+Nusyrew/1KFn2a9J44FyfvxjG
         bOk48QEY0Fv35YGWD67sW6Daf13qaUafJhcP+wdKdekVRzeyuOoa0G34xeYLCwaoQdBI
         qkB8vOYadCb8l2bw1x+6bJTYY9ZP9slm+6xD52j4tuWC/WjwT1WAmXHPkRLFLuAnQM9T
         QIYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704788566; x=1705393366;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkCvYd5950mTrHdIV/MAXFZQdz85NWu1PStSMrB5EH4=;
        b=eqf+xG20UTModAK+erciRyXu4l4G3XFug/h1/xPDjBRZLkqqJJyLhwolofm3P7lnng
         d9IB0TZx3JJ4u5CQ2nzuVQuOYAFtB/S6gupMMsnjcMBstWNUrapUhtXgsiPba6sjCKzc
         cjBBDMkvluJnlWgm2uI9NI+22odKxXCbPI3WlGfFlepjQN4eCZrHc2RwENH7xZqtGvIN
         HcAFKL+qe5FkglJ2FOOVqIIdx4YPNhsSMJwo77yj4p71gKItvlEfzUS52A+AvIZHCaNp
         SdgrnygENInwIt6tZL7a2z56/t0EskHjTWqh6WTDVjxMnueVd6iidHwk2AFBlWsBOzGk
         rBRw==
X-Gm-Message-State: AOJu0YwCMY2NusKtOcBX/tmGOQJcL3AYaQWoK8ijyn8Dn709GO6gNHnX
	6VVsmxxgXtHAieWI0I+DVH4X/lVxM1LLKw==
X-Google-Smtp-Source: AGHT+IEXsKE979te2TRibhc6ZGRZCmyLFT3MKUrY3beCGOOKb/lThn1WsQOhRrpexVi+V89VsDhUqA==
X-Received: by 2002:a05:600c:19d4:b0:40d:4e28:43e8 with SMTP id u20-20020a05600c19d400b0040d4e2843e8mr2408207wmq.167.1704788565926;
        Tue, 09 Jan 2024 00:22:45 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id be10-20020a05600c1e8a00b0040e49994116sm4442375wmb.14.2024.01.09.00.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 00:22:45 -0800 (PST)
Date: Tue, 9 Jan 2024 11:22:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matthias Yee <mgyee9@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vt6655: fixed check alignment of open
 parenthesis in card.c
Message-ID: <cea37e85-cc21-498a-a09e-cfdaf7921844@moroto.mountain>
References: <20240109063618.2810-1-mgyee9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240109063618.2810-1-mgyee9@gmail.com>

On Mon, Jan 08, 2024 at 10:36:19PM -0800, Matthias Yee wrote:
> This patch adjusts whitespace to fix the checkpatch warning Alignment Should Match Open Parenthesis.
> 

Line wrap your commit message at 75 characters, and also run checkpatch.pl
on your patches.  Otherwise it's okay by me.

regards,
dan carpenter

