Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB9114ABD
	for <linux-staging@lists.linux.dev>; Tue,  2 Jan 2024 14:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HsAEjNt2"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-40d4f5d902dso83016375e9.2
        for <linux-staging@lists.linux.dev>; Tue, 02 Jan 2024 06:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704204221; x=1704809021; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6jx4kCirWEKyRJhRB+hSiaSLY7KMEDa3xsSh/eHvycU=;
        b=HsAEjNt2eqLPNS6CklKkct+QmsKLK+TF9Kntg07mNQ/e7dEJZhsXTkqqtiPJwI2yQa
         +GsM0FNkRatrpCcj1DDWtxUIk0qSRn8EY0CQ0Th5xfClZUXyxJaV9mWuAQ2PyK31xZvu
         5kUApJVEQHTZ4EIROwno+v8QcrBr3mk+2q0INPqpm0UgDN4h5Svmcv6/DReHvyNpHdoZ
         L1K6PcCjLeHhXQyORspeV83i2uBnnSuSwQKrcSbhP524VPJWl0DA1Eg+fik+dnXcKqLU
         bxFBtyuqtmSTyRVPqq2LVYWTPGZlOaIOcRTLjv4xjDCgFACWNSPDSUflrT0r3w7PATgG
         A0uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704204221; x=1704809021;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jx4kCirWEKyRJhRB+hSiaSLY7KMEDa3xsSh/eHvycU=;
        b=GcqymeDOOfpUJSADc48PUsaebCSPFqhq6voVs4MjuuZ3ZoTE1lHaw6h8uoMplDZ211
         AaGORrEhu7qRQVamLLc7JdXHlVN1JigTBWCkfgd30ti6aEohiiHX0wju+IdZTmlzHZ4C
         yK6cMBfoFSkaZhUoDrBIXJcxSHA3GpHQTieAOF36PpnoRQwoFe99CCbn41a01CfnhULG
         WkEE4JqXwxMVxIbUMIjzxpM7F2/j5B/1VpwmwL4lRMeqya4wu6rPhQirL6jk1vYWNWLH
         6IA8KJhiEZMUfeD9q1QKdpZdUn1t5+Nb6ub1o5ZY042p/HLQh3MvhknKmTJmf+lx3Smf
         RdEg==
X-Gm-Message-State: AOJu0Yxk2vunEXI89NJ/PpGBg0+a3gpc9GEE/IPT0aJa5GeOjh54oS3r
	9qdkIl6ToV9pLoQ/2dp4BZCjrmgPCFR+/N9VBI0UpPw6NRI=
X-Google-Smtp-Source: AGHT+IGWYIKvLFu7hD6N6JHD2l27CY/uzIzKJYH+mrqppO697Hszjxa8CpubpAtiUgM0X6ER68IsQA==
X-Received: by 2002:a05:600c:538e:b0:40d:7a8e:3476 with SMTP id hg14-20020a05600c538e00b0040d7a8e3476mr3382517wmb.20.1704204221326;
        Tue, 02 Jan 2024 06:03:41 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id q17-20020a05600c46d100b0040d802a7619sm13969451wmo.38.2024.01.02.06.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 06:03:41 -0800 (PST)
Date: Tue, 2 Jan 2024 16:24:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nathan DSilva <expitau@gmail.com>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	tdavies@darkphysics.net, error27@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8192e: Add blank line after declarations
Message-ID: <556cb2ae-4402-4f69-ba41-fa212deb2c78@suswa.mountain>
References: <ZXvevJ2vEEQ92rau@oatmeal.darkphysics>
 <20231215152918.532037-1-expitau@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231215152918.532037-1-expitau@gmail.com>

Also send the v3 as a new thread.  See my blog for more details?

https://staticthinking.wordpress.com/2022/07/27/how-to-send-a-v2-patch

regards,
dan carpenter


