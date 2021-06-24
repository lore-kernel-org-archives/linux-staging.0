Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5834D70
	for <linux-staging@lists.linux.dev>; Thu, 24 Jun 2021 08:07:17 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id a5-20020a7bc1c50000b02901e3bbe0939bso3031172wmj.0
        for <linux-staging@lists.linux.dev>; Thu, 24 Jun 2021 01:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=bQUxqYvEQbwrTWwOlp2uFZwQKid1HyK+PsBGEywKHpY=;
        b=g6764K3VIcCw92DYKTdMZuBHRgJ72tPzvbRx1mXxynnKxSX0ZOL/65BNZDSUJpTh5B
         ahvO8Kn2ie7YcNnKfdK9B1fUVZIOgcTVuaiJunJarY4AG+iP3fIDjzHBNfw0AeE8lA3h
         w9aLIh8v24GhWDVOVJUkgPG9WnJHKyueyTvMjZg3Ra9WfkhEwmTsaJxPsBCGm3mdN7QK
         lLCEh+1ihXvlpbmVaeVmLethjuHjqrAd0kEaIDE76t1BQH+yLORTShklKl3DHbOa9H1v
         5TEe3mH/tWOaNJgxcauZXQY9lAexoWY6HcNRmtBY2IsSmsdGqjWLVkDM20T8qGkccUfr
         PEjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=bQUxqYvEQbwrTWwOlp2uFZwQKid1HyK+PsBGEywKHpY=;
        b=ahSACiFotllbzy3I9vDsicRpmO92tKsQsb12Q/bvD4TeJr+z/b9MQiQFUaquRm8f99
         M2MXlNHS1l7mtybiL6N1qqzQm566c8J0NCnYKkvPfM+tNoc5nWVm7vXkq8KKcJ6lJkfE
         WyhEOgiL8dCefpzXFPboGmE7/EKrHmH5L7mYHAtTEfivenxVtNK1bovMwlSD6O3PRQIY
         b9e1ZqP/VJN3KWoo2wpA8oqQomsHXZioxGcFkoKY/PTCnQm+s6I15zlSy3jDggo8RuCz
         aruxjqeykDQKqu8iEujkpJF5PAqzcC9lkgKL0be39DunuECvKenWFj3valzkOPnXuzM+
         HAEg==
X-Gm-Message-State: AOAM5334gUnfuOXwNqz4TKTXO+5Zob1q8Yz8kEIzvXGaC5+q+GvtP/c3
	luaJJLJafZwAMyX6Au2BQBHLoQ==
X-Google-Smtp-Source: ABdhPJwsOTnSwpzVm8hMKH9H6prTnCOoRYe7RmNEfVUVOEm1yvJUlMngkwEynAChqq727y+Stp+d5Q==
X-Received: by 2002:a1c:2601:: with SMTP id m1mr2810880wmm.185.1624522035835;
        Thu, 24 Jun 2021 01:07:15 -0700 (PDT)
Received: from dell (92.40.180.82.threembb.co.uk. [92.40.180.82])
        by smtp.gmail.com with ESMTPSA id g15sm2309146wri.75.2021.06.24.01.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 01:07:15 -0700 (PDT)
Date: Thu, 24 Jun 2021 09:07:12 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxarm@huawei.com,
	mauro.chehab@huawei.com, Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v6 6/8] mfd: hi6421-spmi-pmic: move driver from staging
Message-ID: <YNQ9MPXTamQL46uT@dell>
References: <cover.1624442566.git.mchehab+huawei@kernel.org>
 <1ad2cbbd182d18ba2cae716fb5f1497b1cabbdbe.1624442566.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1ad2cbbd182d18ba2cae716fb5f1497b1cabbdbe.1624442566.git.mchehab+huawei@kernel.org>

On Wed, 23 Jun 2021, Mauro Carvalho Chehab wrote:

> This driver is ready for mainstream. So, move it out of staging.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  .../mfd}/hisilicon,hi6421-spmi-pmic.yaml      |  0
>  MAINTAINERS                                   |  7 +++++++
>  drivers/mfd/Kconfig                           | 16 ++++++++++++++++
>  drivers/mfd/Makefile                          |  1 +
>  .../hikey9xx => mfd}/hi6421-spmi-pmic.c       |  0

I can't review a hidden patch.

Please re-submit without '-M'.

TIA

>  drivers/staging/Kconfig                       |  2 --
>  drivers/staging/Makefile                      |  1 -
>  drivers/staging/hikey9xx/Kconfig              | 19 -------------------
>  drivers/staging/hikey9xx/Makefile             |  3 ---
>  drivers/staging/hikey9xx/TODO                 |  5 -----
>  10 files changed, 24 insertions(+), 30 deletions(-)
>  rename {drivers/staging/hikey9xx => Documentation/devicetree/bindings/mfd}/hisilicon,hi6421-spmi-pmic.yaml (100%)
>  rename drivers/{staging/hikey9xx => mfd}/hi6421-spmi-pmic.c (100%)
>  delete mode 100644 drivers/staging/hikey9xx/Kconfig
>  delete mode 100644 drivers/staging/hikey9xx/Makefile
>  delete mode 100644 drivers/staging/hikey9xx/TODO

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
