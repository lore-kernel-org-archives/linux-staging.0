Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B88221019C
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 00:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769560827; cv=none; b=H4QpJQuIdb96P0lknzVzIrAOLiC0amFwCZbBwiNlE1F/z2k+n9Gj2xB9K7T/zS+Dv67vO5cl4mnLMiMsq02u+fcIRhJtspV6v9AnUeLFzWRXz0j1zyYeX75cbL53ZzdcGkx+BWt5+VJgWzGjzYQ3iZkeseIO0Pa8+4+/hm2ATXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769560827; c=relaxed/simple;
	bh=MP9dXB0QtlVz5EFY8zq0rqzCjlp6FtqlHmoyAcHdpOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NrKKxsNLhDadDkfC85462aPdI4pKPFhK9k9nYeaNrzYgpqcyDIlnll81OuTvnK9ZbpH0XMpUWP4GN7AkilZ3ZLBqCy9moSmLAh1pN+zuHrV2uOiTdjWNigOXunkFmvn8B8y+4rUTRbNelXv+QuZih7imldaP0rEJlMaJOhTxpUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W3KmCRsh; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W3KmCRsh"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-793fdbb8d3aso56816447b3.3
        for <linux-staging@lists.linux.dev>; Tue, 27 Jan 2026 16:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769560825; x=1770165625; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2li4MWATGVuQb49gIaL2/wEm7/uj/Idq/ACN32Jca5M=;
        b=W3KmCRshoxeI6QDkKJrG3NzZVglgRoc1HhgjScagVHAupTmY9HYJJVmmskwzECLzpF
         0PG+1SLl55SWkutiImjA7z+WAo8A7iF+8lbawkO8EVazXN1UhetaoDu4kDx29mSnPbJx
         bhjCNV8YzQAs8KVXo/6kuIDu3e0bMcccec2h/daCp/NrFi6x9eMH93bV8d0bvijIglFm
         cOnfX4qI4gBrg/e3UpEYVkHauG/oRirGbUn5CK8jgts8el3VegFmkLRI2U/A2Ltk6ZxU
         z/S45KRstN0IEAwGALZ5c6sGJDbwuaqu0fDCbsaPqP4qs6+gw9EuzWi6uADY0NBoGZe5
         2DTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769560825; x=1770165625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2li4MWATGVuQb49gIaL2/wEm7/uj/Idq/ACN32Jca5M=;
        b=b8pdf2kPzH9ZuhprxZk3XNbOCaxg0Zl1Bz/93zdzKFjahrfNdkOV3+wRJ9k4brQ0wc
         JdM4xlfxei0GjcFKSybkaTgyfOZOoy14gzcaP3Ibvu5DUbV9848N8eRbC+mcS0SV05D+
         CH0LDOMntHjWBEXqcIb3L5gQoe8rdWKJ3qQ2FREOJXEFTEXKeGwBIYDxEUnhQubaMCG6
         oDpMD43zhC/U2Nbsx4fyCR8x7oHZlzWIGSoxAjoB3eKpF73jrJSmLJ8qMjLObJseuq8s
         3ZHFt/YkqRoi7weyBgnuM0GNwTKctvbS4YTlrDQGr154h6h3FWv8W+FBeOrPE8X9Y5Zx
         O2gw==
X-Forwarded-Encrypted: i=1; AJvYcCUXGBzLFZwuK0pNcJrp+54BEAIbAe0+fYuMoAKq11hlt/VU5p/q1YL354xpg6iGG+xeBBLx2/5VnRkKXwxH@lists.linux.dev
X-Gm-Message-State: AOJu0YzW4ijSdFn8rZF1yqfnT54MfgbRhIm2+X3Wm6hCBvnSstfnxtBz
	U6nnA7LEbIWFb63PYnO7soT+7KKKoN6HKJliz92nMi6VQ2ibeQP8gaJu
X-Gm-Gg: AZuq6aKmYZpWeN+njx3dDUHaw61VKJP7pdKy0KpEkWJE8yRcN59DVb2PyUOGkMnyzSy
	ms93BVFUc51t277HUHDHV7W4UP4dBlvuoJuxfOABAqPq/iSB1DzzFuuqna4k4zhDsdHbv0K/9v1
	/3fNeberpwEQpouPsHweKFl3lJqSzKzjbfIjfB3+esq/YP63JPIdwYhhxVE8THaNIrg5Ql6FMEY
	oMbOstSQ52YBPM0rbcKEC/+u/iHXB2o0bMjHx/+s1ORt3fEPhS9kDbTFj9qclLr+z/0Px16FH2S
	v/FfRikaexXhysdehhTVUoBOgxYkWvm40/fTG+enNMi+Uqe7RASCS6ZH2INo8dfIkoINqRFwdCB
	LoutxrORI3lG75kFpwRpdcT7AccBJJIM5MbwAGqxhZRxVUCzf8CV6AQsJ8PYGHSaZbCM=
X-Received: by 2002:a05:690c:dc9:b0:794:2c3d:7947 with SMTP id 00721157ae682-7947ac1857amr33107487b3.38.1769560825272;
        Tue, 27 Jan 2026 16:40:25 -0800 (PST)
Received: from tux ([2601:7c0:c37c:4c00::9944])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-794827625d3sm4791867b3.11.2026.01.27.16.40.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 16:40:24 -0800 (PST)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH v2 2/4] staging: rtl8723bs: remove dead RX FIFO  overflow logic
Date: Tue, 27 Jan 2026 18:40:06 -0600
Message-ID: <20260128004009.51095-3-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128004009.51095-1-ethantidmore06@gmail.com>
References: <20260128004009.51095-1-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function rtw_hal_check_rxfifo_full() populates debug variables in
struct debug_priv that are never read. These variables (dbg_rx_fifo_*)
are write-only and the function itself is a skeletal implementation.

Additionally, remove a redundant hw_init_completed check in the caller
rtl8723b_HalDmWatchDog(), as it is already covered by a guard clause.

Removing this dead code saves unnecessary I/O cycles and cleans up
the driver's internal debug structures.

Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com.c     | 19 -------------------
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c |  7 -------
 drivers/staging/rtl8723bs/include/hal_com.h |  1 -
 3 files changed, 27 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 70b5b289f9cb..fae251c332d3 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -780,25 +780,6 @@ bool GetU1ByteIntegerFromStringInDecimal(char *Str, u8 *pInt)
 	return true;
 }
 
-void rtw_hal_check_rxfifo_full(struct adapter *adapter)
-{
-	struct dvobj_priv *psdpriv = adapter->dvobj;
-	struct debug_priv *pdbgpriv = &psdpriv->drv_dbg;
-	int save_cnt = false;
-
-	/* switch counter to RX fifo */
-	rtw_write8(adapter, REG_RXERR_RPT+3, rtw_read8(adapter, REG_RXERR_RPT+3)|0xf0);
-	save_cnt = true;
-	/* todo: other chips */
-
-	if (save_cnt) {
-		/* rtw_write8(adapter, REG_RXERR_RPT+3, rtw_read8(adapter, REG_RXERR_RPT+3)|0xa0); */
-		pdbgpriv->dbg_rx_fifo_last_overflow = pdbgpriv->dbg_rx_fifo_curr_overflow;
-		pdbgpriv->dbg_rx_fifo_curr_overflow = rtw_read16(adapter, REG_RXERR_RPT);
-		pdbgpriv->dbg_rx_fifo_diff_overflow = pdbgpriv->dbg_rx_fifo_curr_overflow-pdbgpriv->dbg_rx_fifo_last_overflow;
-	}
-}
-
 static u32 Array_kfreemap[] = {
 	0xf8, 0xe,
 	0xf6, 0xc,
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
index 928226679ab4..3e1ec33fe829 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
@@ -137,13 +137,6 @@ void rtl8723b_HalDmWatchDog(struct adapter *Adapter)
 	fw_current_in_ps_mode = adapter_to_pwrctl(Adapter)->fw_current_in_ps_mode;
 	rtw_hal_get_hwreg(Adapter, HW_VAR_FWLPS_RF_ON, (u8 *)(&bFwPSAwake));
 
-	if (
-		(hw_init_completed == true) &&
-		((!fw_current_in_ps_mode) && bFwPSAwake)
-	) {
-		rtw_hal_check_rxfifo_full(Adapter);
-	}
-
 	/* ODM */
 	if (hw_init_completed == true) {
 		u8 bLinked = false;
diff --git a/drivers/staging/rtl8723bs/include/hal_com.h b/drivers/staging/rtl8723bs/include/hal_com.h
index 74d6c892c401..24e7fd8ee4dc 100644
--- a/drivers/staging/rtl8723bs/include/hal_com.h
+++ b/drivers/staging/rtl8723bs/include/hal_com.h
@@ -136,7 +136,6 @@ void rtw_hal_update_sta_rate_mask(struct adapter *padapter, struct sta_info *pst
 
 void SetHwReg(struct adapter *padapter, u8 variable, u8 *val);
 void GetHwReg(struct adapter *padapter, u8 variable, u8 *val);
-void rtw_hal_check_rxfifo_full(struct adapter *adapter);
 
 u8 GetHalDefVar(struct adapter *adapter, enum hal_def_variable variable,
 		void *value);
-- 
2.52.0

