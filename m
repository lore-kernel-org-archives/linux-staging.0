Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FA421AF4E2
	for <linux-staging@lists.linux.dev>; Thu, 24 Oct 2024 22:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729810522; cv=none; b=nLcDY55DELGwtKvxDX5Go3jFWbh+LGAkYG4l8FESVVuJzDEsRl48lUSuQA8RE609yQ9vT/w0NPou1mWqcfnoDgVfMRFE+MdcRu8gGGxJ6soX/YudFHxzPKHEwsBoMnGbvX1JshYbRmg5SflZuobTA2XoGFmCI3+Ikoul6dvfAeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729810522; c=relaxed/simple;
	bh=2t0NQJ4i0sajNkNmezauDEuozrVUAiF615VNOMCaVno=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RzTnP1KlmYfRz86qDrObUzwtVFIngOA4AdmnwGqLgjYwKtLuo+MN7UCZM/FMQWdVS1n2kFYZUVCjgUwOw6Sy5mv2djFVIV8t3tSZFXxaQFdfB4Qda0fonzLzk5bDm7hQWJCx75BNH7XXWS6QR/Vregf1fI21nRTMxOv5uhEse/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yt8nOY6l; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yt8nOY6l"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7ed9c16f687so983546a12.0
        for <linux-staging@lists.linux.dev>; Thu, 24 Oct 2024 15:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729810519; x=1730415319; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1BZ5yIebvbjCx11gbUEaKqEHQYCWzk/WEOkgc2gej4o=;
        b=Yt8nOY6lxRaESAqi80bBzqEO/hfyly7qQ0ub5cNPShDhU1g04xk6X8OUH3ysZq1gG2
         0UND0rJ5P3iC6Qz8Y8Mt+wgdeCjXORbRpufSDGxusNKt7y2oypvzMlJFfV7Eyenk/lvl
         RosM+TGZLRpnXklNL8jX18peFs+iqXFewD17LEvg3j7TjNGUM1s8QQVpTe3ioLUfldYu
         BcTynm9UTzBX1ooO6/t55sjyKMl8YYSCoKmlgpwxeWdPrCHDiPoOiKtZYcCZ0ZwZxnNL
         /rU0W0PZ1M4REM4vi/XI40fBGRCT1xTxX8upPwbGFuRslkSOvUfyqWE7Fsl8FB6BKMUr
         V7SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729810519; x=1730415319;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1BZ5yIebvbjCx11gbUEaKqEHQYCWzk/WEOkgc2gej4o=;
        b=HH7C24hXHbBjnXlWF8slT9r2PVW3gkxj1P+BB3OPVTPvisssDE+eIMxNrLdQFWWbTL
         hNBkgMZuYiy4F+OU1i1opyQSvXtR2Yp/u9+KD5NYKhaUlH9DfhHyoP03yW02nR5vXmF0
         lDQn++SAqMSGRYyIb9Rb8oT31lvHTNY8rO+bj+AYlgUE2X5krNWAIzekFDwKYuU+4omR
         jYRViP+NIKA8Dbo8bTSvzt5zCAJZ0FIAphMg1cy+jd95UPrqzi0CjJ01po902WxfL6U1
         tZ3RKtPmgMe2kR2zt7Ab2Tcjcqzd7pS6HhudjPmX2RcOsEODx6ErBzJEaCBS75ebfr39
         P/FQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiZ4sTxj2RBuRflZRPrDKZluyt8TOiooDhRLcfYlCqzaFZurcifPmVa4qTWJiy8/wrYnXaNj8OaypYMNYZ@lists.linux.dev
X-Gm-Message-State: AOJu0YwmrVWjY8SfVAFw/7xWT3S8xETAIliWCrX1L77umIVtH3/6dLn8
	aIN6jteDw5s6bTEJDcnjheT/siBS0LpdvfQeAgdHJ8/fP954XNxU2QPCnQ==
X-Google-Smtp-Source: AGHT+IG1CnmN3xWtfp10BtAmupCLlIyz4ArIS6I2qnftlZ9Ec0JzjDaUHnRwh+56tHnosG0rMeW9oQ==
X-Received: by 2002:a05:6a20:d80c:b0:1d9:2723:64a6 with SMTP id adf61e73a8af0-1d978b2c40amr8713015637.21.1729810518754;
        Thu, 24 Oct 2024 15:55:18 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:81ec:bf51:a58d:54e:ca72])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eaeabbca78sm9170227a12.58.2024.10.24.15.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 15:55:18 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: dan.carpenter@linaro.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	philipp.g.hortmann@gmail.com,
	rodrigo.gobbi.7@gmail.com,
	~lkcamp/patches@lists.sr.ht
Subject: staging: rtl8723bs: change remaining printk to proper api
Date: Thu, 24 Oct 2024 19:55:12 -0300
Message-Id: <20241024225512.7464-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <f61d8272-4af3-40d6-a333-e7731c3fc5ae@stanley.mountain>
References: <f61d8272-4af3-40d6-a333-e7731c3fc5ae@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

First, tks for the answer, Dan.

> little broken with -DDBG_RX_SIGNAL_DISPLAY_RAW_DATA, maybe we can 
> fix that in a next patch. 
> How is it broken?

make -j<> ./drivers/staging/rtl8723bs/r8723bs.ko EXTRA_CFLAGS="-DDBG_RX_SIGNAL_DISPLAY_RAW_DATA"

drivers/staging/rtl8723bs/hal/hal_com.c: In function ‘rtw_store_phy_info’:
drivers/staging/rtl8723bs/hal/hal_com.c:927:43: error: ‘PODM_PHY_INFO_T’ undeclared (first use in this function)
  927 |         struct odm_phy_info *pPhyInfo  = (PODM_PHY_INFO_T)(&pattrib->phy_info);
      |                                           ^~~~~~~~~~~~~~~
drivers/staging/rtl8723bs/hal/hal_com.c:927:43: note: each undeclared identifier is reported only once for each function it appears in
drivers/staging/rtl8723bs/hal/hal_com.c:940:73: error: ‘struct odm_phy_info’ has no member named ‘RxPwr’; did you mean ‘rx_pwr’?
  940 |                         psample_pkt_rssi->ofdm_pwr[rf_path] = pPhyInfo->RxPwr[rf_path];
      |                                                                         ^~~~~
      |                                                                         rx_pwr
drivers/staging/rtl8723bs/hal/hal_com.c:941:71: error: ‘struct odm_phy_info’ has no member named ‘RxSNR’
  941 |                         psample_pkt_rssi->ofdm_snr[rf_path] = pPhyInfo->RxSNR[rf_path];

Actually it's not exaclty in the same line of pr_debug/netdev_dbg replacement. Do you think
we can do the replacement at:

> +			pr_debug(", rx_ofdm_pwr:%d(dBm), rx_ofdm_snr:%d(dB)\n",...

regardless of this build errors? I mean, fixing it here in this patch
would not be related to the purpose of this simple patch.

> Just delete this line.
Ok.

> -		printk(KERN_CRIT "%s: sdio_claim_irq FAIL(%d)!\n", __func__, err);
> +		pr_crit("%s: sdio_claim_irq FAIL(%d)!\n", __func__, err);
>                ^^^^^^^?

Originally, I didn't replace this because at dvobj of sdio_alloc_irq(struct dvobj_priv *dvobj)  
there are two adapter fields:

struct dvobj_priv {
	struct adapter *if1; /* PRIMARY_ADAPTER */
...
	struct adapter *padapters;
...
}

Checking the "counter part" function of sdio_alloc_irq(), the sdio_free_irq() (which is not used), 
the if1 (primary) is used for debug purpose:

netdev_err(dvobj->if1->pnetdev...

And checking the initialization path, if1 should be ok at this point.
But since I can't test this, do you suggest to replace anyway?

Tks and regards.
