Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3666648C41F
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119861; cv=none; b=WAMRjfX3WmlW3cW2GgVtKLp8EZ+dP4QXUfB0m/s48BXC5W9KVQvrULW57vtMNlfEvFEISWlbqBQjtouHmO99JqhMc5L0kmoI0wMv8jvSDWb+kG56I1OMiqGoCaxm2FGl7JgG0IgiWPnjT+HPXFin+ASJtPHKY+wkNo+QZyC+HJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119861; c=relaxed/simple;
	bh=cwXX7ms4/umUkHjUjsP25YrhWlK607b1FhhyvAawXiE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=arGmqB25G6gv2dMZb0CMh6suND3XYbKU9crGLWM8eo0LzMhh6Nz9vo8KOY8+UsNknIWdAl8D3ekrFrYeBHGxeHtCRYxaMP3bP2LUzWHJTGgPI34TEsmr2alZT2hpj+JyJMeDKWVn7dqa4j7SGtQ5gSVPc0TouM57C0KBINotXJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHQTZShf; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHQTZShf"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aea0fff535so2260478e87.3
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119850; x=1784724650; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S1IQxcNYl0l/efRSdGK8pGbUYPf2b4AIC2rBtAFJvUI=;
        b=VHQTZShfruMBDawqFr9s+cd3k40ygtOXF/u9EpfVvmFPKnTqm1mURunkJ9D0J+tfAy
         u3kop6e13wvzM2vDP3bcfbhySMog9mM4qppbA8clqcIkkBl3TQTNC24F/CzRbFs7JYX+
         bqdIy4w9qbCV75Sf7k+T6vKTzbQjSAw9Qwl1uzYO4YySoo6Aq3NUwQHX8QaVsk20gSOY
         NktzKoc2g83E3vapPxCIpC8tYCAqkM+E2WxWHDFpLYy0d0gGPXrR9j8PHsfV7rb9mGn7
         SfBoFIJqaAouV1H1lsrD4T239fFcJME3i3JLyJqUSMDU8lBY3n3hRwyAr+Bp8ggZtf+5
         t99A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119850; x=1784724650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S1IQxcNYl0l/efRSdGK8pGbUYPf2b4AIC2rBtAFJvUI=;
        b=MxBUnTT0SBqPMLm3YvoM6qDWIK4QBptOszX9f8EEtLUa+bBvplKrx2SGBw6sKhAsEa
         Fg4pecOWJugfbZdGIyxfxoXgGA5y+E6D9S8k2PP/ffFp0q3QJiwSX8vRabvpzoihgDyc
         glhZ1auGXL1ziRTMoRKol/7tUr7L5cqmSAr0NJf+QiZ267JBfZ80fraqlM9QCOQcWREv
         ySOZNz8Q+WEiT+t9xlJiUS9yYUPb7Lz4qm+iXaFavuXhRxfJ1wB8tuPwkVFnI9uyxZLq
         M/QoC2O1//hhQ4ZwNfkFPlALOPpoMy8s0YNtg7ugm4X95ql60W9zirA1RbXK1zHJftZL
         qqVg==
X-Gm-Message-State: AOJu0YxQMAHVziu7404kpQUor4MiBGnM3V8iVG6a0B7NRzXq6yiFFFEp
	62fC3ct5rHer/VvZM80M/hOxUPr+Lt1CjViZvKCGC/YswgWoBgFWDlPF
X-Gm-Gg: AfdE7cntm7gDRgpYfNO0Rswp20M2y93gh2LiFRBu0Laji10QCD+AtrwXTJKYEQ94xOK
	u0KPxZ7aUHSLxDgss9uvEUBLGGHhKQW+rc2baaRKa7S/nJhwdJacRvlKlaxQu2RXnLskeJzLBU2
	wz2H1jUZab1t2nWrb6ApJjMz658qQ8o/oq6CCm+5l+naTjeay2E4WegGKz1SxsjQ2boZ7aYFt8B
	k6dx//zOJKJ7beiux7WdsyBiOdMQZ/ijODiyb2m14QNLXtkozzbSwiJbZjoMQWiJ5cwOIA3e/LX
	iOupYVRklMargyUbggJqAk06mvRjVrfR6pQSVIjV+rLZ09fxl/z+XPPNS7WqJkM6E+BE3xfeloj
	gwPSs/3xBY6cwIZdzjm1hfozdUtrIYrGoXF9hcWPTG/qorBlgHnSgKJCzKF+n2EwjsFpRO14kv4
	F6hriUIswSSs8YvlAAx/1Qh/d9a9wAX6Min4737O2WqN+X2PpluUjtH62efcc43EbuLXyRJoRFP
	aVq+xALF79XuQ==
X-Received: by 2002:a05:6512:6404:b0:5ae:c8da:6254 with SMTP id 2adb3069b0e04-5b02366709cmr3674216e87.22.1784119849563;
        Wed, 15 Jul 2026 05:50:49 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:49 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 43/61] staging: rtl8723bs: remove hal_init_macaddr wrapper
Date: Wed, 15 Jul 2026 19:48:11 +0700
Message-ID: <20260715124829.90290-44-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the thin wrapper function hal_init_macaddr. Call the underlying
rtw_hal_set_hwreg function directly with the HW_VAR_MAC_ADDR register
argument to eliminate an unnecessary call layer.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c      | 4 ----
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 2 +-
 drivers/staging/rtl8723bs/include/hal_com.h  | 2 +-
 3 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 77b189efa..ca0f7d7ec 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -420,10 +420,6 @@ bool Hal_MappingOutPipe(struct adapter *padapter, u8 NumOutPipe)
 
 }
 
-void hal_init_macaddr(struct adapter *adapter)
-{
-	rtw_hal_set_hwreg(adapter, HW_VAR_MAC_ADDR, adapter->eeprompriv.mac_addr);
-}
 
 void rtw_init_hal_com_default_value(struct adapter *Adapter)
 {
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 767db342c..731ca9276 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -688,7 +688,7 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 
 	/*  Get Rx PHY status in order to report RSSI and others. */
 	_InitDriverInfoSize(padapter, DRVINFO_SZ);
-	hal_init_macaddr(padapter);
+	rtw_hal_set_hwreg(padapter, HW_VAR_MAC_ADDR, padapter->eeprompriv.mac_addr);
 	_InitNetworkType(padapter);
 	_InitWMACSetting(padapter);
 	_InitAdaptiveCtrl(padapter);
diff --git a/drivers/staging/rtl8723bs/include/hal_com.h b/drivers/staging/rtl8723bs/include/hal_com.h
index 7bbf62cfd..a52d8318d 100644
--- a/drivers/staging/rtl8723bs/include/hal_com.h
+++ b/drivers/staging/rtl8723bs/include/hal_com.h
@@ -121,7 +121,7 @@ struct adapter *padapter,
 u8 NumOutPipe
 	);
 
-void hal_init_macaddr(struct adapter *adapter);
+
 
 void rtw_init_hal_com_default_value(struct adapter *Adapter);
 
-- 
2.55.0

