Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5E417C3
	for <linux-staging@lists.linux.dev>; Mon,  2 Oct 2023 08:07:19 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4054496bde3so144515355e9.1
        for <linux-staging@lists.linux.dev>; Mon, 02 Oct 2023 01:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696234038; x=1696838838; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lAKzSdJ0JsZA3KIMeGO1s7/CEtUUUhbELYzhrqen194=;
        b=mPava8uIsdEDJjENMyEE84/Z5/flnCwfEF+krHDCxswpNBB0lFmDZfwyxSykk+xDR6
         wOPElTx/oYZBqw3wFsjtIhEZd4+5WbU2jwzyAmC9P6cu7sNcx8yO9nJ9hDbpAygLcNX+
         GEesUYFJFKBXcar5toI+cKZcYlMWNibIOlWkdCzPU1BAwXGbmaEYolTIxSabwznhdqpf
         bhuXKT+HXxBIfq2IuXnNzgDwYHuWQZHFeYwou0nj5b4r6YpQdzbIp/MCxG+Lm5ThiBm2
         ubyvxLyCY96l1Oseh3N2VJ+s1p/oSdKwmD0ROgueTEDQae7Wza9DOeEfLiphMKao/+6W
         4t+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696234038; x=1696838838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lAKzSdJ0JsZA3KIMeGO1s7/CEtUUUhbELYzhrqen194=;
        b=s7YxUp43L3TyUODpTffO4Fnk93YbO2a4Nv1eu0i76YXXfbIWrZ+H+wRkzh9V7y4M8W
         wE+vp+QQFuyl5c2mV9n6tIpXDlCYBGeFrD9cMfOZJvgVRuad2PhRtBjYfL21SJOKPKUz
         uHn43mrKB4qWijI1d3Ia7YcO5k9vPOGPoz7onAMId0xNVp5kSmYlgOuD9vOfIFQOMkwu
         mFrGrVDejFkRfUppHU2vGlMhnHN+QiIjNfJkC49XNoMJc+nSi4VzkKliJAwrJ7d6qLFa
         ZUYB1kWt3o9L05/bg18sySYiKY18ZINPyFlVh+7IGHpvQyEeBx5LB32Ljh7ip7hN5iac
         KeMg==
X-Gm-Message-State: AOJu0YxTB0O2jy9nI4QX5kEkaLOZlsmwJrKB+xIFclG/NZYm9EJpuBjN
	0/J0up9LaeBmV05n872nz+kyDQ==
X-Google-Smtp-Source: AGHT+IFtc4bd0fdHHEBrIhYWEABY3pxlatfdm3R8BFokjKerArw/9bPnHh1oWdM1qlF1QWVMCGe7sQ==
X-Received: by 2002:a05:600c:2242:b0:3fb:a0fc:1ba1 with SMTP id a2-20020a05600c224200b003fba0fc1ba1mr9209291wmm.35.1696234038095;
        Mon, 02 Oct 2023 01:07:18 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k3-20020a05600c0b4300b003fe1fe56202sm6685642wmr.33.2023.10.02.01.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 01:07:17 -0700 (PDT)
Date: Mon, 2 Oct 2023 11:07:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Lechner <dlechner@baylibre.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev, David Lechner <david@lechnology.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Axel Haslam <ahaslam@baylibre.com>,
	Philip Molloy <pmolloy@baylibre.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 02/27] staging: iio: resolver: ad2s1210: fix use
 before initialization
Message-ID: <1b366292-6e05-421e-914e-6d3457886238@kadam.mountain>
References: <20230929-ad2s1210-mainline-v3-0-fa4364281745@baylibre.com>
 <20230929-ad2s1210-mainline-v3-2-fa4364281745@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230929-ad2s1210-mainline-v3-2-fa4364281745@baylibre.com>

On Fri, Sep 29, 2023 at 12:23:07PM -0500, David Lechner wrote:
> From: David Lechner <david@lechnology.com>
> 
> From: David Lechner <dlechner@baylibre.com>
> 
> This fixes a use before initialization in ad2s1210_probe(). The
> ad2s1210_setup_gpios() function uses st->sdev but it was being called
> before this field was initialized.
> 
> Signed-off-by: David Lechner <dlechner@baylibre.com>
> ---
> 

Fixes: b19e9ad5e2cb ("staging:iio:resolver:ad2s1210 general driver cleanup.")

This would crash the driver right away, on probe.  It's amazing no one
filed a bug report even though the bug is 12 years old.

regards,
dan carpenter

