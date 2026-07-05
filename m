Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D6E36E494
	for <linux-staging@lists.linux.dev>; Sun,  5 Jul 2026 08:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783240681; cv=none; b=dMYQmYvE4ymVdNbBQmUaE5BFMMafuMRX2n1APfqVAzZQGwT2+mtyDADwMOnB3yrhFRPNAJEqcHiLLuN/Q90t0mzj9i+f88K5D31ecX37UrN76u7B8GQ61kK+zv8yzMAjsy+cJUaCq+mMFEJtyeygApJ+tEcAVw+WvA4XZbAi/4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783240681; c=relaxed/simple;
	bh=FWStzNzzoqin1OAnJ0zrB9eAB2zSYan1vY+VHCRtXtA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BkeJZ9Dl/KdQjWdS5sDLeiPGpxNjEOs9lGPxhAmkn9LSl/pvMo8VNuIyplyezy7gBQDYh+jC9iXhNIi9/frApqab4099Zl9KooykIibSfx2eAu6ZZsUaXzeXtm+2TC0FztURMkbPgPPkHA6fOoSW7IKTXGdNC9iLdxDUrxod2C8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+76SL0V; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+76SL0V"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493c2b3dc8bso13341895e9.2
        for <linux-staging@lists.linux.dev>; Sun, 05 Jul 2026 01:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783240678; x=1783845478; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NCeRx3IpN883b1sEFt+WQXfqyIGgh1IRjE9cdjhBJQs=;
        b=V+76SL0VIq4PzVzArpyNE97oQDYNhS8BH1Wyqmnk5QRE7NcMscEj14CG4gv9DSeSGB
         CUfW5Lh1IXEKn24Elu8dSDyNZ7M2JFWkEOKGooDMsZzpA0NDNyiush014adHMaRNa4Ro
         LP6I4GOodGOwVltXik9iVEZMFObqSXTj9K1msC3p/bapVdSm0BN4Vj4JoaqQ+ZNX/bd0
         EzuYulH61JeZoVRER4DZMJLLsloXuM9auFVmm1FveTriX+vrcmjpsoG+bCDzS6S9bPKV
         1zSejxxJxCgAgF/HbuVPr76B5YjTEGO4f4RzwTufHlaldK7vclE/qJ46yfOyV7ajADW6
         I4UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783240678; x=1783845478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NCeRx3IpN883b1sEFt+WQXfqyIGgh1IRjE9cdjhBJQs=;
        b=cpegMnW361rA7IgzzcRPJWrpZy/jXMmOC6GYAj44FMkPgsoKLGnYU4+kmnQ4dgdrUr
         KQP2bDgUq4pq7Xpmra+owfPajY3R2N4lCEkmjz17w8/IGUVn2GQ+x3xLhN7ahltpGTM0
         OxyMgAIcS0NzphW6klmh0woTcuKOtyj7OWGafGuJdhqQ6lzsxxa67Ps5Th78vyFvTTFB
         DHEd1zLBsfkILWZNDGQqOmWRmI1Ow8VH1WoVMdqC1l/HeYI7vL9w7aqHIbEyy5HWIWL6
         dQwKuQytCMxTmoBxOpTDUsbbsIge6MT7UjexlIRZ7NubHfaJkrWGbnEsj0QU+yrlcg5e
         mtYQ==
X-Gm-Message-State: AOJu0Yx51Ws3JYO+9MkPV/Wi9Tj3JPP3lyw3KNbxzai2on47fTSYzbmc
	1EYi2Q9KV06a1qRbhyFRLj5KhRMjEqD8G4AlU07o/Kubc/W4SCoxVt2B
X-Gm-Gg: AfdE7cmTuY+yDizJOoV3Ggcrtn+OY7cYvG+pQk9pWo1IOMHt91iQD74Yv6UNR+Nhe9Y
	NRFr0RxSMt6sNWemxycmoPkfPN0G2BDw6uxGWhTHLhvdM4HYWQCndrfglEOTV+k81JbeWBGqBqc
	8LwGxGwY3Q8dmDeHALhdWHLL7j1SMmCg1n0rLe+S2EuS5v3aUgZp4Bnf0xYZ8chgonzDDlv80py
	LwKBIcdskuVf3wC4wvxc30tPhLmNO0/E0cpbIYwW4XCxBMWCOZl1LiVgX+DQrImVV7CozVdULLy
	LLgv1hvSivSmWV0EqpgUAPHDCwLVm2Mr2rq3xEpfY4c/Cg6CvhmI1+r74nbvVD7+T7Zz4soNvM9
	LonZgzeurFijzgVxzFeZ6AFqwuns5l36lJU57MqHoo3dbZD9rRkl2ZdkmK0Wr9OhBUg7tNtnEYt
	YPn3jFM6G2pPzY8Faih7lUMm8=
X-Received: by 2002:a05:600c:6986:b0:493:b8d9:f28b with SMTP id 5b1f17b1804b1-493d11f05aemr63717445e9.23.1783240678328;
        Sun, 05 Jul 2026 01:37:58 -0700 (PDT)
Received: from pastramanslaptop ([2a02:6680:110e:4ea6:d28d:d58:b547:b02f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637bc21sm481525805e9.7.2026.07.05.01.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:37:57 -0700 (PDT)
From: pastraman <pastraman1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	pastraman <pastraman1@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: rename bLinkInfoDump to snake_case
Date: Sun,  5 Jul 2026 11:34:24 +0300
Message-ID: <20260705083424.9606-1-pastraman1@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <his-message-id>
References: <his-message-id>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename bLinkInfoDump to link_info_dump to follow the kernel coding
style, which discourages CamelCase and Hungarian notation. Issue
reported by checkpatch.pl.

Signed-off-by: pastraman <pastraman1@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
 drivers/staging/rtl8723bs/include/drv_types.h | 2 +-
 drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index a86d6f97cf02..607771a0af21 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -4780,7 +4780,7 @@ void _linked_info_dump(struct adapter *padapter)
 	int UndecoratedSmoothedPWDB;
 	struct dvobj_priv *pdvobj = adapter_to_dvobj(padapter);
 
-	if (padapter->bLinkInfoDump) {
+	if (padapter->link_info_dump) {
 		if ((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE)
 			rtw_hal_get_def_var(padapter,
 					    HAL_DEF_UNDERCORATEDSMOOTHEDPWDB,
diff --git a/drivers/staging/rtl8723bs/include/drv_types.h b/drivers/staging/rtl8723bs/include/drv_types.h
index 552d0c5fa47f..7b61be9dfea0 100644
--- a/drivers/staging/rtl8723bs/include/drv_types.h
+++ b/drivers/staging/rtl8723bs/include/drv_types.h
@@ -344,7 +344,7 @@ struct adapter {
 
 	u8 bFWReady;
 	u8 bBTFWReady;
-	u8 bLinkInfoDump;
+	u8 link_info_dump;
 	u8 bRxRSSIDisplay;
 	/* 	Added by Albert 2012/10/26 */
 	/* 	The driver will show up the desired channel number when this flag is 1. */
diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index f31196f54b3e..10c84a887140 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -555,7 +555,7 @@ static void rtw_init_default_value(struct adapter *padapter)
 	/* misc. */
 	RTW_ENABLE_FUNC(padapter, DF_RX_BIT);
 	RTW_ENABLE_FUNC(padapter, DF_TX_BIT);
-	padapter->bLinkInfoDump = 0;
+	padapter->link_info_dump = 0;
 	padapter->bNotifyChannelChange = 0;
 
 	/* for debug purpose */
@@ -613,7 +613,7 @@ void rtw_reset_drv_sw(struct adapter *padapter)
 
 	RTW_ENABLE_FUNC(padapter, DF_RX_BIT);
 	RTW_ENABLE_FUNC(padapter, DF_TX_BIT);
-	padapter->bLinkInfoDump = 0;
+	padapter->link_info_dump = 0;
 
 	padapter->xmitpriv.tx_pkts = 0;
 	padapter->recvpriv.rx_pkts = 0;
-- 
2.54.0

