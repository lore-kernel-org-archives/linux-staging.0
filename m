Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7898B2D60D
	for <linux-staging@lists.linux.dev>; Tue,  9 Jan 2024 07:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PSU6iOri"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-28c0536806fso2478274a91.0
        for <linux-staging@lists.linux.dev>; Mon, 08 Jan 2024 23:57:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704787050; x=1705391850; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LJaAgkMysyU+rJly+ZLjAMA6XzBdKr1ifp5VcfkkRmI=;
        b=PSU6iOriqJNFqX9r997k2MpS0fqX1d3IdbKs1Awa25A5E5YsJScs/n10mlo1k88xPI
         qdl4Vo7HU/xfCZ0F1fTewf37i/CO836rAqh1cXfLDh32s+U5m6oj6wM0YFkijln3C/3R
         llT/VSK7OgyxdIVlCn4L/MSXIwWcUn3p3/quQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704787050; x=1705391850;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJaAgkMysyU+rJly+ZLjAMA6XzBdKr1ifp5VcfkkRmI=;
        b=pOsht+kd4vAZMwrOhYRSrb6TMdRUeoMx2onr1J0ZRxM0Z/JRuHfUNCrSZS/GnKaOj5
         Gin5dxg/rFmZOqfnJR062UxM3zL6iwzrdahfw1lUSk+ynzfsm+asRPWq02MAxmtLtr0e
         Gz9dQvAw8eA06r7TKZq+vysBhkP6vUhVjGzduz1uEmR7+ju2l6ZKTywMrKL2uBOXNQzg
         EcC/CsrD1YsUnQkCpNv30QBe/UpQt/vEgJL/Y60mHQ8yj+N2Vdc/mMQhpEujf7gZnqKt
         aKGyy9mJTE5jsJewlO2aS3CSJdqFkVC2MwqGbReI7a/YpRMrukHDYyGKjsupJetTwvoS
         u+mg==
X-Gm-Message-State: AOJu0YyBbfwXkz5u5bpjtLxjVQ+0rrI/NoysUTmJ7ea6vzNJpL6VVcQW
	jiUvqRsAe5j1tfVY+MPK738t1F9vUIuI
X-Google-Smtp-Source: AGHT+IHkdc5SEqOU4j+ZTAsSmX5JM1gcIkgcDn5+o0E0JsF/jrPN5rTqY5Qu8XkZuoCUCMrUd0zVDA==
X-Received: by 2002:a17:90b:383:b0:28c:e64c:b97f with SMTP id ga3-20020a17090b038300b0028ce64cb97fmr2688891pjb.85.1704787049720;
        Mon, 08 Jan 2024 23:57:29 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:7b29:709a:867f:fec5])
        by smtp.gmail.com with ESMTPSA id 15-20020a17090a000f00b0028bbf4c0264sm8420053pja.10.2024.01.08.23.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 23:57:29 -0800 (PST)
Date: Tue, 9 Jan 2024 16:57:26 +0900
From: Hidenori Kobayashi <hidenorik@chromium.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yong Zhi <yong.zhi@intel.com>, stable@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: staging: ipu3-imgu: Set fields before
 media_entity_pads_init()
Message-ID: <20240109075726.4ht5nqrtevzk7yh7@google.com>
References: <20240109041500.2790754-1-hidenorik@chromium.org>
 <68ff6c83-b8c7-4bcb-9b94-a33ab83aaf58@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68ff6c83-b8c7-4bcb-9b94-a33ab83aaf58@moroto.mountain>

On Tue, Jan 09, 2024 at 10:51:15AM +0300, Dan Carpenter wrote:
> On Tue, Jan 09, 2024 at 01:14:59PM +0900, Hidenori Kobayashi wrote:
> > The imgu driver fails to probe because it does not set the pad's flags
> > before calling media_entity_pads_init(). Fix the initialization order so
> > that the driver probe succeeds. The ops initialization is also moved
> > together for readability.
> > 
> 
> Wait, I was really hoping you would include these lines in the commit
> message:
> 
> the imgu driver fails to probe with the following message:
> 
> [   14.596315] ipu3-imgu 0000:00:05.0: failed initialize subdev media entity (-22)
> [   14.596322] ipu3-imgu 0000:00:05.0: failed to register subdev0 ret (-22)
> [   14.596327] ipu3-imgu 0000:00:05.0: failed to register pipes (-22)
> [   14.596331] ipu3-imgu 0000:00:05.0: failed to create V4L2 devices (-22)
> 
> That's what people will search for when they run intio the problem.
> Could you please resend a v3?  Normally, editing a commit message is
> pretty easy, right?
> 
> regards,
> dan carpenter
> 
> 

Ah, I misunderstood then, sorry. I will add the error lines to the
commit messages and send a v3.

Hidenori
