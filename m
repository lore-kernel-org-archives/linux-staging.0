Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727B32942E
	for <linux-staging@lists.linux.dev>; Tue,  9 Jan 2024 08:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IXxPtqg/"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-33761e291c1so1448860f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 09 Jan 2024 00:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704787984; x=1705392784; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+1COLRupOMO77VMV9Mt2MrHA2R7Q54lSMFZhM27v8nA=;
        b=IXxPtqg/wLmnchZuERvwKurdazPnpE+kNaBi9hgS/XJEMCdgyRwIBWX5bsISz4DSxD
         YkCwuDeBAe7C1lfCpSWv3Gvbj+AtzbyFJGyMnzGf0KAkddQBPlLJwZSgpo+6xhJszuBm
         yWuHh4fSevOnPae1Cb2IJ481QQHblMIlV8qDw+0w5sOeN+PN0mMSMQ0Qb3d58/nzxuaG
         UvGxb85CX0gktcDdpHTQySKB2E+FtaS4lAh9Y4gE4dev11fexRG8/kJ7VIocHuTc+zKs
         lPdUYfJu8JFrV2O8oUfuvyVWQojwkAZSsfoCFBa1s8pN2vxYpBB4uNhYaA0EFn9wZTu3
         Pt1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704787984; x=1705392784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1COLRupOMO77VMV9Mt2MrHA2R7Q54lSMFZhM27v8nA=;
        b=xGoD3ppOcl4ZxPugAinrR1W02ekTEHaM6DLXUsZoe317BAW0SokSaQAXc50ZtPxh7F
         Vr7H3wq9ePNQFS9aPfmA+7CiJ7VVI46KuhyV6Kvm+8H73Ap4PJTp7fcnuB2U8MRg5xlM
         Mx0R1ebzUFB/Z1Aan507MOWV+LnZsWDhOwGa6ptNzoG4GiqiUlrAh/lQuUIcxftFkGhH
         j5zxYEBIKAFp3s/Sv2YNIId/8UQ4HQHSTkTE6hNVbs1JZBHUs7RadodQTTB02d9aSEtV
         c3113MyDoon1pwQwCGOHmmn2SSe5IS1/NES9VzpM+t9u1xVRXYrjfEJOUu0KA+oSrFeg
         +ifQ==
X-Gm-Message-State: AOJu0Yx2S7QH2GepW+El/qiwKILjzPfAOg5y5FAcAJimF1BlLc2EYj3+
	W1AznsIwixa9hcdRj5MFjk8iQEo8oGFeig==
X-Google-Smtp-Source: AGHT+IFh4etKDv5DqxBx1VDGukffIzcMl42znwEO74QkPkL0OrCjUXOmjbqhJ31eGCDvDf9YczBJlA==
X-Received: by 2002:a05:600c:1d09:b0:40e:43db:7174 with SMTP id l9-20020a05600c1d0900b0040e43db7174mr183460wms.27.1704787983804;
        Tue, 09 Jan 2024 00:13:03 -0800 (PST)
Received: from localhost ([102.140.209.237])
        by smtp.gmail.com with ESMTPSA id t7-20020a05600c198700b0040d6b91efd9sm13811533wmq.44.2024.01.09.00.13.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 00:13:03 -0800 (PST)
Date: Tue, 9 Jan 2024 11:12:59 +0300
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
Subject: Re: [PATCH v3] media: staging: ipu3-imgu: Set fields before
 media_entity_pads_init()
Message-ID: <398e06b3-351e-4a1d-b3e4-9c02893ccd83@moroto.mountain>
References: <20240109080910.2859780-1-hidenorik@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240109080910.2859780-1-hidenorik@chromium.org>

On Tue, Jan 09, 2024 at 05:09:09PM +0900, Hidenori Kobayashi wrote:
> The imgu driver fails to probe with the following message because it
> does not set the pad's flags before calling media_entity_pads_init().
> 
> [   14.596315] ipu3-imgu 0000:00:05.0: failed initialize subdev media entity (-22)
> [   14.596322] ipu3-imgu 0000:00:05.0: failed to register subdev0 ret (-22)
> [   14.596327] ipu3-imgu 0000:00:05.0: failed to register pipes (-22)
> [   14.596331] ipu3-imgu 0000:00:05.0: failed to create V4L2 devices (-22)
> 
> Fix the initialization order so that the driver probe succeeds. The ops
> initialization is also moved together for readability.
> 
> Fixes: a0ca1627b450 ("media: staging/intel-ipu3: Add v4l2 driver based on media framework")
> Cc: <stable@vger.kernel.org> # 6.7
> Cc: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Hidenori Kobayashi <hidenorik@chromium.org>
> ---

Thanks so much!

regards,
dan carpenter

