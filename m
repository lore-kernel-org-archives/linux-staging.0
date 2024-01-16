Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30158494
	for <linux-staging@lists.linux.dev>; Tue, 16 Jan 2024 05:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DUEWwVaQ"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-2045bedb806so8724768fac.3
        for <linux-staging@lists.linux.dev>; Mon, 15 Jan 2024 21:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705383532; x=1705988332; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7yUFUU66f8Pu7tZiWG2Vaq0nR6vJICcLg6Vq70eDraI=;
        b=DUEWwVaQ5IHiMNKz2Dw4cffvO8KICR5ALKeCVmz+nOpaOm5LKJqI8rQnOxomgOj5+I
         kD5c6liuoqJ1+Q+SyaeTyTiJ7RDtO5jpJ5bJWc9dukMEOh4T243cyld1IM8lguI3h2Ca
         5cV/eltXc1LyPBrVi1vXJmrb5d4oFCBACQzVpfoMJAmdaQQhZWwDyRSKs00oH1QGwETQ
         Bn9SaOJoZG6Y1Ssi7F3brrP/conZ4Z1CDH1wOGz3CV6IJmxLkdnurnw3Z3h1g4FA4kRX
         TGqXhG8BGwmClqem81S/n7JKrkaRHIizEvNjHoDaGQvV058vWqGRlKUf16QZGXGNo9EN
         L3rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705383532; x=1705988332;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7yUFUU66f8Pu7tZiWG2Vaq0nR6vJICcLg6Vq70eDraI=;
        b=tazcprhI2YcrUXZ2gf99RE8Zo0r5Txoq/3vnwx9mH6yz+HpM9uXB0CEvm5RhmCJkrA
         14LI5Vop+ZGuK4tRr27RM5hYzfuBYoccpFst5l4oH24f9fUpnvPoN1JkWzMcFDDA0gF4
         7aynTPeIv5u2FTnq1lRV3gn5U9F7fMT+cPUGdnNzNfOK+/MdO4T1K6NhhYxTROIx0PFY
         Q3QBmfwS//4Z5bPeRD3sqPXd0GW7g4j8nrGyyU4qqM583d8913+g+uC52zSU5PvAJYvp
         QWOxZA6FkkIA1hkeMNaL36Gi1iWNxzhwzeFcBaztHp6r/QHRG+ClTgmOriESLQ0LLNuw
         QBbA==
X-Gm-Message-State: AOJu0YyY1gbpfLlOg8LCH1nNBypqST2VR77M+ZtcaXXbUifUTGu3VZ+N
	iBYUnDJN0mwkY4AmOn6voRGej9/B9sF94w==
X-Google-Smtp-Source: AGHT+IEfDKhikqk0PQDjlpmEeKuxVyvTuSVywSGF6JHipf9nnyT0gOg1FuJ6LMT4BnZJjbrWRG40Jg==
X-Received: by 2002:a05:6870:414b:b0:205:ccc5:2740 with SMTP id r11-20020a056870414b00b00205ccc52740mr10523146oad.10.1705383532496;
        Mon, 15 Jan 2024 21:38:52 -0800 (PST)
Received: from localhost ([122.172.81.83])
        by smtp.gmail.com with ESMTPSA id n9-20020a6563c9000000b005c21c23180bsm7951734pgv.76.2024.01.15.21.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 21:38:51 -0800 (PST)
Date: Tue, 16 Jan 2024 11:08:49 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-spi@vger.kernel.org, kernel@pengutronix.de,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 26/33] staging: greybus: spi: Follow renaming of SPI
 "master" to "controller"
Message-ID: <20240116053849.ymahw5hzwmtsqglh@vireshk-i7>
References: <cover.1705348269.git.u.kleine-koenig@pengutronix.de>
 <188f907d08d4a57d1058f01bc4939f209a4c8e43.1705348270.git.u.kleine-koenig@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <188f907d08d4a57d1058f01bc4939f209a4c8e43.1705348270.git.u.kleine-koenig@pengutronix.de>

On 15-01-24, 21:13, Uwe Kleine-König wrote:
> In commit 8caab75fd2c2 ("spi: Generalize SPI "master" to "controller"")
> some functions and struct members were renamed. To not break all drivers
> compatibility macros were provided.
> 
> To be able to remove these compatibility macros push the renaming into
> this driver.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/staging/greybus/spilib.c | 66 ++++++++++++++++----------------
>  1 file changed, 33 insertions(+), 33 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
