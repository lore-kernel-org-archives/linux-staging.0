Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF3F2915
	for <linux-staging@lists.linux.dev>; Tue, 13 Jun 2023 09:59:36 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f8d5262dc8so1207385e9.0
        for <linux-staging@lists.linux.dev>; Tue, 13 Jun 2023 02:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686650375; x=1689242375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZlUoGmD+Nfi7K2nHm0LGWuLWSwRbzH1OWwMGWxNfqrM=;
        b=OwZMBzxmZi8GYXKYUFBPh7/x5iWEMT13GxKzuI5U9ZCQOEGQweYPFbetgB/yeF2eo+
         JPjG8t8VtY4e0bz+v7fKE8y2oDOmPygXuZIj0eKQkQyCh0msrqb0VE9iElMVzjno/Od/
         U+St9XrDfAm6BCcvEfdpe1JnkpYuLLk3dDCly87ImNh45wEzNJfvaKjP8h3GgL4F2iWa
         4BpS9XmjSmz8Tlp2+h3AMgeX82VmR2Q7jUmWIE5S1GQdVJJYF7OimRsO3g4BkbjYHnna
         axAL+h31Wuxzd2cyr2wOEPfbd9eSss92evfNGp0mHoXhYI2EAYIoIHhdloEytxVaK3bC
         A0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686650375; x=1689242375;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlUoGmD+Nfi7K2nHm0LGWuLWSwRbzH1OWwMGWxNfqrM=;
        b=V2DqKC7WAU0RqRvqszOxXpCNsv4/mfYgfP6AvWj7E/TXulPH+N9q31xSomZbGGf3A8
         QlqQ26nJ/OfsFc+9pyqBzJX0fORzAMIK8DXNAFAcCSag1ypam0kwDH+Gs2U/2/o+ESWL
         UORwk3hJ4u+9wBBcXJOW/opgdf/2R1P/FYTJGZM3KAeNjieBG0muAD+O/SWPTCDl/1oY
         HHfs+Y7bPK6wGb58Um6UtKwFn+J8pn6bKG0GrHXnFciqaQ5tfmnCBZkz8qqZ6+vbbnmq
         X+/q/nq/2oX4d638jBcW7yYNGWBSy2kF5s6keDHvy+BaqoGGLin9q69mFRbFJ6EDJlA2
         Urqg==
X-Gm-Message-State: AC+VfDzDPm3CZnV4mNAPOU+WzztiazMzZ7fKKCjK5Pgh8q5KenY9W4MQ
	1nGorfGU0XLocHQifdwueOEnIQ==
X-Google-Smtp-Source: ACHHUZ48AjkEKc9KR3ij8G3kZiakHkZ+tjQ0KaSTDHC4QnSEoudDWbftA4K3pG4bxUF8hqmHpSPFXA==
X-Received: by 2002:a1c:750a:0:b0:3f7:3634:e21b with SMTP id o10-20020a1c750a000000b003f73634e21bmr9945985wmc.2.1686650375078;
        Tue, 13 Jun 2023 02:59:35 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b14-20020a056000054e00b0030c2e3c7fb3sm14717409wrf.101.2023.06.13.02.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 02:59:33 -0700 (PDT)
Date: Tue, 13 Jun 2023 12:59:29 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Juerg Haefliger <juerg.haefliger@canonical.com>
Cc: gregkh@linuxfoundation.org, jbrunet@baylibre.com, khilman@baylibre.com,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, martin.blumenstingl@googlemail.com,
	mchehab@kernel.org, narmstrong@baylibre.com
Subject: Re: [PATCH v2 resend] media: meson: vdec: Add MODULE_FIRMWARE macro
Message-ID: <293fbb78-26df-4328-8a1b-047fdfc9153e@kadam.mountain>
References: <20220818064810.17856-1-juerg.haefliger@canonical.com>
 <20230126153258.1558471-1-juerg.haefliger@canonical.com>
 <20230613115018.562c843f@gollum>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230613115018.562c843f@gollum>

On Tue, Jun 13, 2023 at 11:50:18AM +0200, Juerg Haefliger wrote:
> Ping
> 

You CC'd almost a hundred different mailing lists but you left out the
one that matters.  Resend and CC linux-media@vger.kernel.org

The linux-media maintainers work off patchwork so they'll never see this
patch as is.

regards,
dan carpenter

