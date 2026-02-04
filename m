Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B73BA3D5238
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 11:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770205147; cv=none; b=f8mhI9HXwKHRkPDokg9u0RR+pS/5CDISmtzYg78MH1E94MGEHPB3cF+Zqaps/VXRniVjCilDrStPMHFqU12Mt3yzjlbJhgzXzQsANs2iW0NFnExsHWKqN/87njIrbPEmKkLC3oyjXmLoYw27/kYMgGg6tg+ECbmDrjNCi2OwkCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770205147; c=relaxed/simple;
	bh=3PLp7u4/e9QtU/Z9HbvZ+sWCeQ4IFeck7aj64OWbhLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k71Xkv5NtTTU8rakFMyZEjUo8D82mIF8KsB/E2mIFhyBvE1ZxF4fvBoGI+UDgMF30Wk7fuGMAUgea1A2CxPS92leNDCnFBK1q3TXYWxn5YEpZws8bP4FkEjknw2bLt4ad7gSa2s1C6MCt/5c0u/uQc/KESxuPJliKuRAlG6z/fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OEBnG/OG; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OEBnG/OG"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-482f2599980so39573465e9.0
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 03:39:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770205145; x=1770809945; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t9tqnl4nl5DEpP04BaFMoPL0bj/Xd+YqfHCJcLoEdNs=;
        b=OEBnG/OGy7DwvtcdoZFW5eEMU9IdBwIdJPiCTpAOlsD5pL+FL4SlwmjAnUInuGIh4n
         xpHEDEvPQSS77I7v4g5x2EKT9kdjtnHJe4VJ7r7rP+LcAqt3twZx0+DDABHBO7rw/0uU
         /kd5BrsWt9MfDay2KVTyeM7XI7Xce9oWTcvUJUmIQc+rATqWJcY5kLIdkdSlLtjIoMoO
         BForjPnPZoBNvtSriKZO/zYeXiVjudAQIdzeNOqZhTkbYW5dW9M77FvpBiJEjEib/Rx2
         uNjhiJqVYose4YRVfKghzZs208KKvi8X+3KyheWiRtsmO7RISHRO024HviI+FAtvaEZa
         Albw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770205145; x=1770809945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t9tqnl4nl5DEpP04BaFMoPL0bj/Xd+YqfHCJcLoEdNs=;
        b=s0DvZCzeV/O3+FIFqvPcQ93ZgEYP/9oDTzoxmR48N6zgxZuezHcO3WcYeNYvV1d8PE
         BQXN/cUim2e030GwfLdXoDLyJqfHefp9flCCgU4t5Uh64a4oxLgszyx0LgoleSkmmJw6
         TaIcW3Qbyxe/aQbnPurpJFEg5wD481u97O1/+o73Y5zOmmvf76HF9HM2+iqoKb7lbS+G
         ZmjIwR4+Q7FT7NO1GEh/mfg6kCInFnd/btB2iKMdOHOLjexcsuoDl6o3z58Z7LDLiqHU
         9ie5eqicZHjDo2pbRbnQAny5x7sG6P1VDV8qMwqupBCVhTGCCxraGi3EXcRYrrJspjJe
         mSmg==
X-Forwarded-Encrypted: i=1; AJvYcCWoNVU4tZQ6svXseIuKGHUp1OBOKJCUKuWifaw7ECjrTyEgdwVlmBkkAN48M7XzgwSTtTtPi3bZXoMDEf7K@lists.linux.dev
X-Gm-Message-State: AOJu0YxyhYjGpK+sowaEV2XuCnghnsGVcI0/eH04ItKuwkbwxk/EFJx1
	rhGGrgXhpxTzkcwX4TM1TeJ3pBt3amOuT2BbXB49vJXhf88ngkZ7MbkVqV9Ou5jjGtQ=
X-Gm-Gg: AZuq6aKLinxpe8Vwc9Y1GsGQIKGPK/4ovL4NBauZj9kevlgW5oSo5eMNt0K6CwzG/kk
	oFN0UZ/DTtepbG5SGSK0/xPca2F7GcCCm/OBlQFpHLS16zpY/2RYVP55eG5OHUvk+L4AYNR9xXl
	k4bRKPjA2YINLgSRDxaFit+9HMzCceWhy6HrfzIQwOj1OFj9bWSpUABfE1ybKaj2az5VkQQK8yr
	Zb0u/KlWxgY4I8LXUPGLt2IYPToCChuJE6KHwfKKAXBioTTAzHOhCWbvET6jVNIc+guqvUIfmW9
	S6m38ubG9b8BZsFNTwwqJ990qGSFu1MmkpibULKdDRXKpbwQMTvpOOpK5w8ZBAb/9rPe/M1CJeO
	4ICxSkS6UXIbLOfd5S1yr/7yZrlAFCjwPRA68HlnvL3rolMeol3efM7zAlek2r7ijsG9AukL1Op
	RtRxwYJPz1DP1cgHN2
X-Received: by 2002:a05:600d:6447:20b0:480:7385:110f with SMTP id 5b1f17b1804b1-4830e94c939mr25956105e9.12.1770205145002;
        Wed, 04 Feb 2026 03:39:05 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4830fe69e9fsm22558835e9.6.2026.02.04.03.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 03:39:04 -0800 (PST)
Date: Wed, 4 Feb 2026 14:39:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Artem Lytkin <iprintercanon@gmail.com>
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] staging: sm750fb: remove debug prints and convert
 logging in sm750_hw.c
Message-ID: <aYMv1UsvKfe4hbAe@stanley.mountain>
References: <20260204101536.3311-1-iprintercanon@gmail.com>
 <20260204101536.3311-4-iprintercanon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204101536.3311-4-iprintercanon@gmail.com>

On Wed, Feb 04, 2026 at 10:15:36AM +0000, Artem Lytkin wrote:
> @@ -163,11 +156,11 @@ int hw_sm750_inithw(struct sm750_dev *sm750_dev, struct pci_dev *pdev)
>  			 * The following register values for CH7301 are from
>  			 * Chrontel app note and our experiment.
>  			 */
> -			pr_info("yes,CH7301 DVI chip found\n");
> +			dev_info(&pdev->dev, "CH7301 DVI chip found\n");
>  			sm750_sw_i2c_write_reg(0xec, 0x1d, 0x16);
>  			sm750_sw_i2c_write_reg(0xec, 0x21, 0x9);
>  			sm750_sw_i2c_write_reg(0xec, 0x49, 0xC0);
> -			pr_info("okay,CH7301 DVI chip setup done\n");
> +			dev_info(&pdev->dev, "CH7301 DVI chip setup done\n");

Delete at least one of these.  Pretty sure that Greg will want you to
delete both actually.

regards,
dan carpenter

