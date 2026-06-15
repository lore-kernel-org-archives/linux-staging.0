Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACD0331EC0
	for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 10:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781518776; cv=pass; b=tAoIxzTO7HEso1fUQ14WaIXfhro7UrUmk1D+bMi+SpkZuxrgqQXcSTCOulKa/ohBJPaTkhg4+f7GsYk2oX8Ol8O/cwmD6mQSS8v1m8/X2qhvgreGnrF9PaSP3G0kX4qZ5zl43tRhIaFAUg1RGS3ZsZGRJSpVthxRfLeiPfpeQVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781518776; c=relaxed/simple;
	bh=5p5y0u0+RhuWJIfLWQKgNya+WX5HjUfyMDbDnrM2yUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iUhAcTccEMFGVYlBFhGg9W3nJLcNnjjbEf6L1ThBtuu/qPtDY7Ucl6kXwkjJjNKH1TCkG5iT5YseHpoZDIAlnakqqQ38A/bFg6BbiW6iTyNBXCOFYJX9voYw4zUyaziFquaFxFOwe4nMyLR87dibTBq2hRn5qVYuFH9hf1vTSsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=Dhlb+tIX; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="Dhlb+tIX"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6603246b66dso3211340d50.1
        for <linux-staging@lists.linux.dev>; Mon, 15 Jun 2026 03:19:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781518773; cv=none;
        d=google.com; s=arc-20240605;
        b=TM21WoRpfbHisN6hhLLdYrRyplLUixzmEz60aPJRb+IGOVhPbpH6hvB8ZVNyGGxl5a
         IHwKGgxaGPTqs3OhcgJW7yHEQz29Hh08/uBjpdOWfr0JRXtDISE5ImV+kUyZV6qmm5iw
         E6ZDtvsRtRlAyk/oNBZE1mqs9yZ6pbKJFbjxAYnqwvGc3r69WDdTy6ehEHOnlUtCicDB
         D1ZE060uEmNNZAIlBqP5jk6hRod9RXND4wIHGZ5KKtoqcxzrqKgifFggQ6H1JRw0IJlm
         +tScmIkhUXyPS+sLtXCfoe2BqmY+LUq0+Z7X9FqkNCJh17bfaircOfqNiYiLZ2CZl/IO
         iM0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2d6EV/iVbdH06m+t9/NqN6KnbaQ59FzktQ3dFfEKRzU=;
        fh=CTHNWwn2QbzlaUOH00NDTpOIM+z5kzoWnMGpGBGpHGs=;
        b=CtOQmcEsVqVYidI6S1kBOT+rg/MPVlykDe+Hcug7jpO+1suyiSp1tmpti+zfPSRdBu
         L1CBVgxwNyyumn7mvG+O9S82R65Ujc880xaYJMNdPi3xdJSyx0s/shz9v7Lj+PZRyhIe
         jR0W2BgD2a6hIoXgTGLP3oiH/rzl6hAYgwOqeqCs2pygB1Ar73yzr9gBZXuBvR6ggQc4
         gNiw16hnHlC/k8B5nTWOH8OnZHfS9m1DUVh4HauJVDcxffEPN3Vvjcwp9uL3JxCno8uy
         va0J1hJa/bry80jxJU0VxW8AY92jA7t0ApyWKToKHBwpf3jX10FLPhCfT12dkFSiLyh7
         LnHw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1781518773; x=1782123573; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2d6EV/iVbdH06m+t9/NqN6KnbaQ59FzktQ3dFfEKRzU=;
        b=Dhlb+tIXVS9izvVOLfDmt0+C9MPb3mjp/USZa3hX5NdrTb2T4PBjd+t1Yv4GEDXXn2
         kPw1qZFaHn1Lk9e1fEL1qrtNlGcVz9zrq+fxMHjENcRQHWluMsScvxub5foIkgcO+SGX
         /CRj0QjDpa1RKsVKjL9A28HJgjrlFyDhZZucH0YTaWLhDToSg2EDeEYkgKg45vQcQYqE
         yUcobX0MU9Zqnf+NrWA28p7Cmgh/cY7oe65joAVOBPNlxHsSHmVQeB9WNYZi2fAKpDRm
         kuud67MOL6bROmYSQ4ubNQg4+4S08Q3KYsSF3bvBMkFBPBpt0ha/KEnSpDrQ8xPvq6o4
         n20Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781518773; x=1782123573;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2d6EV/iVbdH06m+t9/NqN6KnbaQ59FzktQ3dFfEKRzU=;
        b=Q4zeZQEokCU/skXYA4QAF866BcGs35z5CUX8K9ve2QMwIJ4UNhYuQ8ndNZFetKTsi0
         IkrRhh8nQ5/jqOaRQ0QlX+FJa3zjTraREnKX72cVm0SApU8vPPaxuRqvo0YosSmBgc7K
         mZ1zGzLomI3nf2tm5LN7RvOD4J4W/yqSjYRswOfr+nSpHREd6oDUIDIexXIFUXSocy3X
         kFlyFLWwnn+QwTdAvC2nycmW0PkqqcOu7kYOzy4tGBTBVl1uGV/XMvIZXfugJrIJHU9K
         wvkGP7ggN/rt4jNlABJBJinJEFHpi5PeVpEa5byfBbPueTJXthIPrgx2WYue7QK+lQmw
         5k3g==
X-Forwarded-Encrypted: i=1; AFNElJ8wZfoSvApKHlX80UinmsLp82kqn3L/uCmFFXYeRtkzag5WPa/e0Z8TyVgWTeEHLC0yMnuVUd2byhqocXpa@lists.linux.dev
X-Gm-Message-State: AOJu0YxL6sFiGjA5t00BIAO/olmrieRTLFBahhkpgmh046ebkuR+ckhs
	XttSn6d7uN6psC4F2SQE5HKKaT+X4ymfws8zzRSKjC+FUEln3WcjCu877iBStBzEzYiNHos6Xln
	loL6CsaJcIJT4wV1pMKJpMWCthPC7VxV2xf0fcz7RGA==
X-Gm-Gg: Acq92OEoFOw+oN3k6dB7KmmMlp4qndA+cT1F0+XrNxYPOCUY2i2wBjKeAVpUtvoJHf+
	WzGCnzZcAuM3OMudKnqyd/dMoM691d0TSfMVa4o6vi6NkWrZFx51BFRrmdX90HFIQOXNI/oTcN2
	0RZjHoEka9Pp/J4bKavitHp4ivtdjS+IiDBrYDM0D5tIzLOXJ3tWzvfv7WlRQfD17IR7Ao3ZD86
	pTERC1c0zTplIpFjJo9zmKIn7cPwdqMehEiB6pPI7jvkXJQ3ffig8ELErvckTVc5vnc3FCi0sZU
	bE7OSxjIjuUiKoPAISq+8opdu/671RL8R7aduah2WRpbPj08/GXnB0xwD1vEFv7V6GTecjjjJeV
	uabL7WoPBUoW3kjhy+63v+S0A
X-Received: by 2002:a05:690e:c47:b0:660:4538:232f with SMTP id
 956f58d0204a3-662783aa254mr13745133d50.62.1781518772753; Mon, 15 Jun 2026
 03:19:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260605074944.666654-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20260605074944.666654-1-sakari.ailus@linux.intel.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 15 Jun 2026 11:19:16 +0100
X-Gm-Features: AVVi8Cftq6ajCcdbL3MMw9RgGJHb8u04VBtntzAGnwe90W4udPRxBnryN7Y-_QM
Message-ID: <CAPY8ntAg8O_D9CG66u3Nw1F=3UiagdMGMapJo94mHok9ymbcpw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] MAINTAINERS: Camera sensor and Intel IPU driver changes
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Lixu Zhang <lixu.zhang@intel.com>, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Bingbu Cao <bingbu.cao@amd.com>, 
	David Heidelberg <david@ixit.cz>, Richard Acayan <mailingradian@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Jun 2026 at 08:49, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> From: Dave Hansen <dave.hansen@linux.intel.com>
>
> Tian Shu Qiu and Bingbu Cao are maintainers and reviewers of a bunch of
> media drivers (7 and 9 respectively). Bingbu's e-mail address has changed
> and Tian Shu's is bouncing.
>
> Update Bingbu's e-mail address, remove Bingbu as a maintainer from Intel
> specific drivers and and remove Tian Shu as maintainer. Also add Dave
> Stevenson as a maintainer and David Heidelberg as a reviewer for the
> imx355 driver.
>
> Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Yong Zhi <yong.zhi@intel.com>
> Cc: Dan Scally <dan.scally@ideasonboard.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Lixu Zhang <lixu.zhang@intel.com>
> Cc: linux-media@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-staging@lists.linux.dev
> Co-developed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> ---
>  MAINTAINERS | 29 ++++++++++++-----------------
>  1 file changed, 12 insertions(+), 17 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index efbf808063e5..64478875cd78 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3882,8 +3882,8 @@ F:        Documentation/devicetree/bindings/leds/ams,as3668.yaml
>  F:     drivers/leds/leds-as3668.c
>
>  ASAHI KASEI AK7375 LENS VOICE COIL DRIVER
> -M:     Tianshu Qiu <tian.shu.qiu@intel.com>
>  L:     linux-media@vger.kernel.org
> +M:     Sakari Ailus <sakari.ailus@linux.intel.com>
>  S:     Maintained
>  T:     git git://linuxtv.org/media.git
>  F:     Documentation/devicetree/bindings/media/i2c/asahi-kasei,ak7375.yaml
> @@ -13042,9 +13042,7 @@ F:      drivers/iommu/intel/
>  INTEL IPU3 CSI-2 CIO2 DRIVER
>  M:     Yong Zhi <yong.zhi@intel.com>
>  M:     Sakari Ailus <sakari.ailus@linux.intel.com>
> -M:     Bingbu Cao <bingbu.cao@intel.com>
>  M:     Dan Scally <dan.scally@ideasonboard.com>
> -R:     Tianshu Qiu <tian.shu.qiu@intel.com>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  T:     git git://linuxtv.org/media.git
> @@ -13053,8 +13051,6 @@ F:      drivers/media/pci/intel/ipu3/
>
>  INTEL IPU3 CSI-2 IMGU DRIVER
>  M:     Sakari Ailus <sakari.ailus@linux.intel.com>
> -R:     Bingbu Cao <bingbu.cao@intel.com>
> -R:     Tianshu Qiu <tian.shu.qiu@intel.com>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  F:     Documentation/admin-guide/media/ipu3.rst
> @@ -13064,8 +13060,6 @@ F:      drivers/staging/media/ipu3/
>
>  INTEL IPU6 INPUT SYSTEM DRIVER
>  M:     Sakari Ailus <sakari.ailus@linux.intel.com>
> -M:     Bingbu Cao <bingbu.cao@intel.com>
> -R:     Tianshu Qiu <tian.shu.qiu@intel.com>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  T:     git git://linuxtv.org/media.git
> @@ -13074,7 +13068,6 @@ F:      drivers/media/pci/intel/ipu6/
>
>  INTEL IPU7 INPUT SYSTEM DRIVER
>  M:     Sakari Ailus <sakari.ailus@linux.intel.com>
> -R:     Bingbu Cao <bingbu.cao@intel.com>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  T:     git git://linuxtv.org/media.git
> @@ -13376,7 +13369,6 @@ F:      drivers/net/wireless/intel/iwlwifi/
>
>  INTEL VISION SENSING CONTROLLER DRIVER
>  M:     Sakari Ailus <sakari.ailus@linux.intel.com>
> -R:     Bingbu Cao <bingbu.cao@intel.com>
>  R:     Lixu Zhang <lixu.zhang@intel.com>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
> @@ -19657,7 +19649,8 @@ F:      Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
>  F:     drivers/media/i2c/os05b10.c
>
>  OMNIVISION OV01A10 SENSOR DRIVER
> -M:     Bingbu Cao <bingbu.cao@intel.com>
> +M:     Bingbu Cao <bingbu.cao@amd.com>
> +M:     Sakari Ailus <sakari.ailus@linux.intel.com>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  T:     git git://linuxtv.org/media.git
> @@ -19750,9 +19743,8 @@ F:      Documentation/devicetree/bindings/media/i2c/ovti,ov2735.yaml
>  F:     drivers/media/i2c/ov2735.c
>
>  OMNIVISION OV2740 SENSOR DRIVER
> -M:     Tianshu Qiu <tian.shu.qiu@intel.com>
> -R:     Sakari Ailus <sakari.ailus@linux.intel.com>
> -R:     Bingbu Cao <bingbu.cao@intel.com>
> +M:     Sakari Ailus <sakari.ailus@linux.intel.com>
> +R:     Bingbu Cao <bingbu.cao@amd.com>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  T:     git git://linuxtv.org/media.git
> @@ -19894,9 +19886,9 @@ F:      Documentation/devicetree/bindings/media/i2c/ovti,ov9650.txt
>  F:     drivers/media/i2c/ov9650.c
>
>  OMNIVISION OV9734 SENSOR DRIVER
> -M:     Tianshu Qiu <tian.shu.qiu@intel.com>
> -R:     Bingbu Cao <bingbu.cao@intel.com>
>  L:     linux-media@vger.kernel.org
> +M:     Sakari Ailus <sakari.ailus@linux.intel.com>
> +R:     Bingbu Cao <bingbu.cao@amd.com>
>  S:     Maintained
>  T:     git git://linuxtv.org/media.git
>  F:     drivers/media/i2c/ov9734.c
> @@ -24912,7 +24904,8 @@ F:      Documentation/devicetree/bindings/media/i2c/sony,imx296.yaml
>  F:     drivers/media/i2c/imx296.c
>
>  SONY IMX319 SENSOR DRIVER
> -M:     Bingbu Cao <bingbu.cao@intel.com>
> +M:     Bingbu Cao <bingbu.cao@amd.com>
> +M:     Sakari Ailus <sakari.ailus@linux.intel.com>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  T:     git git://linuxtv.org/media.git
> @@ -24934,7 +24927,9 @@ F:      Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
>  F:     drivers/media/i2c/imx335.c
>
>  SONY IMX355 SENSOR DRIVER
> -M:     Tianshu Qiu <tian.shu.qiu@intel.com>
> +M:     Sakari Ailus <sakari.ailus@linux.intel.com>
> +M:     Dave Stevenson <dave.stevenson@raspberrypi.com>
> +R:     David Heidelberg <david@ixit.cz>
>  L:     linux-media@vger.kernel.org
>  S:     Maintained
>  T:     git git://linuxtv.org/media.git
> --
> 2.47.3
>
