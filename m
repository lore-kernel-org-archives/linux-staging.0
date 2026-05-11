Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568A43B27E7
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 07:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778486235; cv=none; b=NV5/58cPaJJ+zi6UFmywKujByt89GRJXKYuWqyVEMgJL1Kp0TjUUIXHGeEkR77CxJDEMT169vfvLnAT1oBmWThVU1j92dyG3DFyDvZ6m269v7VYWz+crP5Dx6uqXuoLcfFEcMkWfBgS+BEnv2ifafp3kscwedVZo/SWXr8BoCW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778486235; c=relaxed/simple;
	bh=5tE0GOVLrGSjSF4pzDo39n9OGzcvcJHv0jbL+/WYiHg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uqto2mi6zmYOM7s3xVYgev+w8OFwupn1gO5ZLh0XFjnl25rr8mPdCi0LbXNI+Gy/HPDhQkTp2dPbb6h8NkPa7o/RqS8xlWd+VSbuwVZH5V4ji1wTPqwgrv5AefbkhHySa6XuL/NzH+kRwvbCODfFzWJM0F+nZoRNjTlbJA5+EM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OUDFw+RN; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OUDFw+RN"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a40cfab24dso4373073e87.2
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 00:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778486218; x=1779091018; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qchx3HN7YL+M44R8uQqurgzb095DKu09pJm2E4OfZHI=;
        b=OUDFw+RNRBphQCA01PXt6Y2Kpp+m79RLEMN59RY4V/x8BINKLG1H+gcLxWaTr01kPH
         bz6fGOnVPkTw3eIMAhPQLDPv7QXABS/yJp02izklm7zT6SVTYq+TQ3wjOJhj9aS7CAM0
         DH2O5a3sy1lbghhBj1YGtdmr1rz9z35usYVvUAgGedeUKHs7s9dk3PZElF3pyqyafBjJ
         U1H2CQ/bBTE64b+iraXXkBOOiK1zUeCaedxUuRD4h+cCRQ4Gv7c84RQx4RIRdQqMteWQ
         0wme/flqSNQN6kRzdywUFPgTP4EpmLPp0hHCLtxvXv8NYihAbT7G9GIe80kzOJoZC7cr
         74ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778486218; x=1779091018;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qchx3HN7YL+M44R8uQqurgzb095DKu09pJm2E4OfZHI=;
        b=SG+lCZt3hkIKUFcOiuHOv+GiCvuIl9XeKuFncl0j0fpOxhhDYJ+Rfr809BASN0E749
         Tq4msZqAvEsJ+HwiOxLqByROEKFDprufCRJSLGV5vXBDgTGUqnsgpK5Id+S2ok8AvexB
         xYhKy8ZdvBbMq8XZPzVD8xiP8uvWSHhLtLZuVy7Rka6pcj3k3LKUu4BE2spyTaGPfjVr
         wkI9ZcCcO69Izlq2QABnRL4vWOthl1ogSLgoYEsKM2bP+q2P7loyH76PNufGdEGHJ5j5
         mgf1VBGkUdNLQ15AdLzBYTM/i/WSWhMlc37CRpsPQ0+vzOoLj3jD95fPFXVbniTLl69i
         vuYA==
X-Gm-Message-State: AOJu0YzuJI7IAJsd9+hvw/ZJ39SHsqpjoDyKTHoY5+XjDy+LX634ZuPk
	jcATm+vXCAfmc/qwJHFVRGANb9kf4bF6/6rgavgIPOPhtD5USBFSfawU
X-Gm-Gg: Acq92OFuqMRSvVJ2RhCKPoOyyd3bUX4EAlegVCXrpPlhLOhyS/uOE9Xz5U6/3C2BIU7
	cGZxkVqkyRJcLxrW+8HYvwyll1stOhyGKgb4Annwy2jGxa6FjHms9l8QgHhDxpgBrHEmWzh07Co
	0lH8NImZq+EJ5ckrC5VcWl1fZdvy/z66RfdD5l8u8i3MBnHfRPn2con8xl7edtuDhKHG3s56ZOe
	RCPFwCx2mOBxZv+SN8l7DqdDwPWsEaT9d+oOv1ywRD9cKLnmcpDjqFLvQcUAEmAITlFmogw0ocK
	rPy+FuTBhLcjEaBqVfXQJbp5JWN/VlfjJOn44PPP46ttMhdTlI2zO0XLT/a4Lx4VYLEKFL3Glxn
	UStDHC//ytqD4d1TZDQgE6jmezmGPU2bDIYXw/KyCyJLk+kYpCCJ54xVezGtpju+Ub5c8jBrgzf
	zNT6B5fOH0hKruLD4bMlVLf+205c4aeNBDB90=
X-Received: by 2002:a05:6512:b20:b0:5a3:fe60:471c with SMTP id 2adb3069b0e04-5a8a94a8fcfmr3726347e87.16.1778486217800;
        Mon, 11 May 2026 00:56:57 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d487sm2433861e87.24.2026.05.11.00.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:56:57 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 1/4] staging: rtl8723bs: remove unused SysIntrMask from struct hal_com_data
Date: Mon, 11 May 2026 10:55:28 +0300
Message-ID: <20260511075651.11637-2-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511075651.11637-1-nikolayof23@gmail.com>
References: <20260511075651.11637-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This field is set to 0 once, and its use becomes optional. Remove it to
clean up dead code.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_ops.c     | 4 +---
 drivers/staging/rtl8723bs/include/hal_data.h | 1 -
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index 5d74913be573..0c0c243c46eb 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -592,8 +592,6 @@ void InitSysInterrupt8723BSdio(struct adapter *adapter)
 	struct hal_com_data *haldata;
 
 	haldata = GET_HAL_DATA(adapter);
-
-	haldata->SysIntrMask = (0);
 }
 
 /*
@@ -616,7 +614,7 @@ void rtw_sdio_enable_interrupt(struct adapter *adapter)
 
 	/*  Update current system IMR settings */
 	tmp = rtw_read32(adapter, REG_HSIMR);
-	rtw_write32(adapter, REG_HSIMR, tmp | haldata->SysIntrMask);
+	rtw_write32(adapter, REG_HSIMR, tmp);
 
 	/*  */
 	/*  <Roger_Notes> There are some C2H CMDs have been sent before system interrupt is enabled, e.g., C2H, CPWM. */
diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index 876b3666aa1c..22c2bac3b80c 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h
+++ b/drivers/staging/rtl8723bs/include/hal_data.h
@@ -389,7 +389,6 @@ struct hal_com_data {
 
 	/*  Interrupt related register information. */
 	u32 		SysIntrStatus;
-	u32 		SysIntrMask;
 
 	/* Chip version information */
 	bool chip_normal;	/* true - normal chip, false - test chip */
-- 
2.54.0

