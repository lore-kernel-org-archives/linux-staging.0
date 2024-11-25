Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E430616EB4C
	for <linux-staging@lists.linux.dev>; Mon, 25 Nov 2024 22:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732575216; cv=none; b=H3xedsvU+YKBsaR0x+G1ShN5la93uM+NXzvRUadU2aisb8RsimEpGHKqr1ENa+ePaf5gGCt71LtYK8KSs/vzrzrqs/aAAdDIC4PrQrDg/xStNcbXRVxHq+0PznMfqfNgKEABfAHLx+AAvNYxjuStxDzjGFNAg8bvwMifgfSrbnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732575216; c=relaxed/simple;
	bh=z8d6Z5DoxDAN9pjge71M9GbAXIHRYZWcfYoQdcMTatw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JFh2ct9f5wOrG4VR9qw6XbaqdAhXtzH3NB9NWUdkQv+WPm3jWJdfDYjpinJIYrEK7T91vL9r4/kBqvYU/Y+Vfy46SKyn+WxXAr+xO/aH9bJAXJk7dol8YDZBheChUyNAqCv7E+eNkgiZNmZ8nSWS13ECEVSYIZnOMJuONkOO5xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=En8wB3dl; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="En8wB3dl"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-724e14b90cfso2995925b3a.2
        for <linux-staging@lists.linux.dev>; Mon, 25 Nov 2024 14:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732575214; x=1733180014; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sf0UnYlMfG0Zaof4x8glKBufQrY/Z6YuQPrhM1VLm6E=;
        b=En8wB3dlawAh2DGkXPWSOU/5tw2W0p6uSPtl7BWeDfPVutwuCsmelJx2vPaovENFWU
         ivofQ6CjqUXeQR4gUeRVhj7hvvZJh3juhCsHNpVET7CAt5UspNV9AxW0+c1CVFGLm9Al
         DQgBvTodeKwSL8c6zDdEv3PH865IWgjnXdlfkJngwQjL+dIVieKRGXobfdjl80O3uGAr
         VDSSmx9fGEQorT929UHg/tZrBE2xzZ6pbvIAAal9ExfZpwtUkCi11w2u/i3fVH4kul8S
         9/AwQf/a298uuLx8gXt9ovGxqcXLsGo0v0DrcCkTKF0gVARTFLZMmWx99BaYZzXGMopE
         oHUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732575214; x=1733180014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sf0UnYlMfG0Zaof4x8glKBufQrY/Z6YuQPrhM1VLm6E=;
        b=Cj9TzaT0c+iZUUfyMGXN4d3IOTP+Xaa5NEGCynzrFhsY75pvxTqbhQnr+EVvMoA8h/
         kK4Bv7sUo1pBu8bQrUVM+5J1/NJmsKxAvP0W+Jhcl0M1KFzunAX7JTpbsxzHxi8a9G/N
         OoshYkTvVXfwxqVt8nPf27i8sDR6AU5/bKsqlp6BqEwrvR3+ztcHUfnQ6u4jIuKavDiw
         vz2Q4MDrIasIgqDAWgaSxFMvMpNa1olfN1uG/gqkOwjlVLzTBx/Skod5nAK3Zq2aWDrx
         QzHNjy3USraSiW74PLCoFYR3In1zfW8BovwPRNahDHvkaD/gRHohdrK2SClRU+FG03a4
         w/iA==
X-Forwarded-Encrypted: i=1; AJvYcCW9baDpTzu9vKaROddV2MXVCMHly80rNOlKNGtxsIRUvoiL76YwNYtY6zzKdPC9SnGYg24hbC1Ep2dpcSci@lists.linux.dev
X-Gm-Message-State: AOJu0YzMB8B8RdoulSdrLoD93fL11wTvbmv18w9+cqeQYXMqJsjXAPK4
	NdSnXNVSGm3Do+Wa3IkEdBvSKZVA5KJi/Ywby4NkMr2FuUxAD/i+
X-Gm-Gg: ASbGncvOQbqUXJ1afC17rzj9LyXuCpa6twwthRL64C6c0L6Ke5+zqRTJMGIWs/6+eop
	iLa5+hvrT2q4isIcHtQYKodT3bn/scuZdxcgwyl3JEM60UXitJz9CeNGH3iUaRfMw6Rfgl+6pFO
	/iwzm+frEm8R3rFO964qCSfNTEURBh9WEs0yxxc/s2e9HafDH++NQolBEuueVS9/kuvHtPddoFM
	ngZ7dVKBnV+DfIVG3GXonVCHioWMBehkryT5U+EPqyHilHzG5/v8UtYUgklB974sEZvwi27oA==
X-Google-Smtp-Source: AGHT+IHPTH0aVJf2SFTOfQ/+2jgplaOyqlz3jX+/P6YUgcDzTZb1h4bhyPQfRMIO4wKu5X84qgqA/w==
X-Received: by 2002:a05:6a00:2d10:b0:71e:2a0:b0d0 with SMTP id d2e1a72fcca58-724df645b70mr18260344b3a.13.1732575214183;
        Mon, 25 Nov 2024 14:53:34 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:4c64:81ec:7409:107a:a63b:a3da])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724dea69e96sm6977544b3a.73.2024.11.25.14.53.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 14:53:33 -0800 (PST)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: rtl8723bs: fix broken code when cflag is used
Date: Mon, 25 Nov 2024 19:45:04 -0300
Message-ID: <20241125225308.8702-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When using an extra cflag, DBG_RX_SIGNAL_DISPLAY_RAW_DATA,
hal_com.c file doesn't compile.

Fixes: ec57f8641fbc ("staging: rtl8723bs: Rework 'struct _ODM_Phy_Status_Info_' coding style.")
Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
As noticed at [1], hal_com.c is not compiling with -DDBG_RX_SIGNAL_DISPLAY_RAW_DATA due
the changes at [2] (a few statements were not replaced with the new struct).
A little discussion was made at [1] too about how useful this cflag was or if
the code under the cflag should be deleted. I think there is no harm to keep those things 
as is since we can easily fix the error and someone might be interested in using that
to further debug the driver.
Tks and regards.

[1] https://lore.kernel.org/linux-staging/f61d8272-4af3-40d6-a333-e7731c3fc5ae@stanley.mountain/T/#mffa281a89e67c609db9b125878d5b8d090776812
[2] "staging: rtl8723bs: Rework 'struct _ODM_Phy_Status_Info_' coding style.", commit ec57f8641fbca07bbb61a75bd4760fd7aef86860
---
Changelog
v2: add missing commit msg and fixes tag;
v1: https://lore.kernel.org/linux-staging/2024112500-authentic-primarily-b5da@gregkh/T/#mea4fba3775a1015f345dfe322854c55db0cddf43
---
 drivers/staging/rtl8723bs/hal/hal_com.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 95fb38283c58..63bf6f034f61 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -906,7 +906,7 @@ void rtw_store_phy_info(struct adapter *padapter, union recv_frame *prframe)
 	struct hal_com_data *pHalData =  GET_HAL_DATA(padapter);
 	struct rx_pkt_attrib *pattrib = &prframe->u.hdr.attrib;
 
-	struct odm_phy_info *pPhyInfo  = (PODM_PHY_INFO_T)(&pattrib->phy_info);
+	struct odm_phy_info *pPhyInfo  = (struct odm_phy_info *)(&pattrib->phy_info);
 	struct rx_raw_rssi *psample_pkt_rssi = &padapter->recvpriv.raw_rssi_info;
 
 	psample_pkt_rssi->data_rate = pattrib->data_rate;
@@ -919,8 +919,8 @@ void rtw_store_phy_info(struct adapter *padapter, union recv_frame *prframe)
 		psample_pkt_rssi->mimo_signal_strength[rf_path] = pPhyInfo->rx_mimo_signal_strength[rf_path];
 		psample_pkt_rssi->mimo_signal_quality[rf_path] = pPhyInfo->rx_mimo_signal_quality[rf_path];
 		if (!isCCKrate) {
-			psample_pkt_rssi->ofdm_pwr[rf_path] = pPhyInfo->RxPwr[rf_path];
-			psample_pkt_rssi->ofdm_snr[rf_path] = pPhyInfo->RxSNR[rf_path];
+			psample_pkt_rssi->ofdm_pwr[rf_path] = pPhyInfo->rx_pwr[rf_path];
+			psample_pkt_rssi->ofdm_snr[rf_path] = pPhyInfo->rx_snr[rf_path];
 		}
 	}
 }
-- 
2.47.0

