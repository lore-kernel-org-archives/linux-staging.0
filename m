Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B313C129
	for <linux-staging@lists.linux.dev>; Tue,  9 Jan 2024 07:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jLf3Svab"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40e4f692d06so1433615e9.1
        for <linux-staging@lists.linux.dev>; Mon, 08 Jan 2024 23:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704786681; x=1705391481; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ajIAvbvfoHd2Dm4Y0RFYgsc64SgXUokhIDDglANw3bU=;
        b=jLf3SvabSI3Qi0NA/5mn2/HedbFKTLRdk6vHTJfbxUulm74Yevan54ARfo8oatvK8L
         1wM/jQYmQ7KHkqlhcGWje71j5j9niu2ceoiFsXzL6hSI1aPyumKeA8Hr4mFYxADOtzUL
         1kHACoqCrQmr6gYvliwC7mcSvaR9LXT2P8tGeX0dHWOdmHShoWUg7jxFF5xJWEkq1nL5
         WwcBYFSjmCLrHkQd2iPriafpOFNUzi9OCuLDKpz8X5NzWDejUrk0KfJPMRMTOGONwc6w
         O0pWJQONBK+xJN5RQt7NXv1RVMf68wuZKd3dqg6rx60BjEAp118FfoIVb1n9NNRi6Wnt
         NTJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704786681; x=1705391481;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajIAvbvfoHd2Dm4Y0RFYgsc64SgXUokhIDDglANw3bU=;
        b=ja3+Sgnot75mgMQnSTH+XV3EMXYW71/qPglfwISg+0DIY3hmIFopCBRw2/Ahu7xvwx
         VJITtL3ekSbLW28tCcNgfWV3AAGhYB3Av2gg/O1q0PkVEaMXy5nHeTUUIHbvrw1Ql5Jq
         JXvjQbKard9onEuszTjjCuHw1M+HdJPiDfp5V7BC+3k/iM0H7xS5/bP6mhOLTz/Hu6qq
         RaOLTJED1CbKYkxoRgnEmvl0Fc8K9pPSZhCC6DaRO9yj1HTxtuG8m44jE9d18Z//WeNv
         Ru5fPpMDbLWxe/7MnQWIGBElkBBiDL9aBF55p48WrwSIr0FGljXaxzR2nWm1SunJSdY1
         mQ7A==
X-Gm-Message-State: AOJu0YyLcvoUmP6D6qi2e6RFJHBQJHmyPO/ho9ABGOFx89fCwoAWSU9C
	LZTjrTCIblspWqD19AxA/k0oz6KGAZ2ndQ==
X-Google-Smtp-Source: AGHT+IGjfcsvgCctKIWthRavB2j4sQAq5t6BFCH1lgirHrvd5/nWv+jm6ATm5mMLTYU76UWU3eiycA==
X-Received: by 2002:a05:600c:5491:b0:40e:44ad:7222 with SMTP id iv17-20020a05600c549100b0040e44ad7222mr159229wmb.8.1704786680743;
        Mon, 08 Jan 2024 23:51:20 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id f13-20020a05600c154d00b0040e3635ca65sm13777111wmg.2.2024.01.08.23.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 23:51:20 -0800 (PST)
Date: Tue, 9 Jan 2024 10:51:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hidenori Kobayashi <hidenorik@chromium.org>
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
Message-ID: <68ff6c83-b8c7-4bcb-9b94-a33ab83aaf58@moroto.mountain>
References: <20240109041500.2790754-1-hidenorik@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240109041500.2790754-1-hidenorik@chromium.org>

On Tue, Jan 09, 2024 at 01:14:59PM +0900, Hidenori Kobayashi wrote:
> The imgu driver fails to probe because it does not set the pad's flags
> before calling media_entity_pads_init(). Fix the initialization order so
> that the driver probe succeeds. The ops initialization is also moved
> together for readability.
> 

Wait, I was really hoping you would include these lines in the commit
message:

the imgu driver fails to probe with the following message:

[   14.596315] ipu3-imgu 0000:00:05.0: failed initialize subdev media entity (-22)
[   14.596322] ipu3-imgu 0000:00:05.0: failed to register subdev0 ret (-22)
[   14.596327] ipu3-imgu 0000:00:05.0: failed to register pipes (-22)
[   14.596331] ipu3-imgu 0000:00:05.0: failed to create V4L2 devices (-22)

That's what people will search for when they run intio the problem.
Could you please resend a v3?  Normally, editing a commit message is
pretty easy, right?

regards,
dan carpenter


