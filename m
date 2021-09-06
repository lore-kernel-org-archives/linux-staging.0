Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDACA3FD5
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 18:54:31 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id e21so15019060ejz.12
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 11:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vh8+u22pNgFmmQDYhuLqazbVUqiifTDWeSKfb70Q1zQ=;
        b=LNdzJzddMn24GyNR1FVqSJ3QHORwEHzxwAHPDi52yMvhBDilz6Ss+vGO0GLCQRoesq
         FVTaLrFJZXs9v2Ms8EvmzNW6lth6Ncfex59B3t37qbJO56/blu1pqsZUwepONDN9CTCB
         6a01Wj/1AEl0ZMpeKqlc2xn0xEZtBWa/5FLo8S0HYDhdk0vTdt3pA6qfxpUePEa5vaOY
         39avMS1E/upFRbq1YPJzIYyUHbbbZyo4PlS8vP5vCFd6svCox5gtcm9UF5Om7OFOXU00
         8pvku694quC1CYnkBxHUBKT1EMU4JevTuIfwFcpAgYECSGmLF3Ys8t2Df9tcvaeRB8eF
         1vyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vh8+u22pNgFmmQDYhuLqazbVUqiifTDWeSKfb70Q1zQ=;
        b=TL+ZkAQvkT16On+wQgoApTkvuDosszFBBzcK1eq1yV6YZBe5XmlHqhFhTcz+D1layT
         M6pL59npIxtPIDH/RICZcEpM8xEsS6sIgdELmsdYDlnBqG4eaU2NxZ2ndVySFNXcamcK
         pnUFibuwqCXtER6ZoIhtUU25IwVl1Y+rG0xAeq1PnDI+AM+OoJ8k9bjaAC/XpvqAuTBi
         inLrioT1kzysdPFm6YZElpkhbc82mvE/StN70swCGZM6DJNdJS8U2oMznR+rjRXkdhab
         bHhbjozrDwD1Uu0z1rNy9sAPDvqHyXy7vCVE8ObF0WpnAyPiQTG0tJtBGl+kkx/iUPMN
         jzxw==
X-Gm-Message-State: AOAM530eOLDDWRGHXE+0jVx3JkxZZagNVRnRxjLK+bVE37EPpvvRskHv
	KJFSnkaL/YnAOpU2hFzNt1I=
X-Google-Smtp-Source: ABdhPJzx/Kt8tgEmR5LYzWvqrw8nIa84yfuuCBdma4lDuuE14PVPxAR5+Ai5KrSOE8cCYfnZbze+cw==
X-Received: by 2002:a17:906:c9c2:: with SMTP id hk2mr15318173ejb.328.1630954470478;
        Mon, 06 Sep 2021 11:54:30 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id kk2sm4329128ejc.114.2021.09.06.11.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 11:54:30 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 38/40] staging: r8188eu: remove unused function rtl8188e_clone_haldata()
Date: Mon,  6 Sep 2021 20:53:25 +0200
Message-Id: <20210906185327.10326-39-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906185327.10326-1-straube.linux@gmail.com>
References: <20210906185327.10326-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused function rtl8188e_clone_haldata().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_hal_init.c | 5 -----
 drivers/staging/r8188eu/include/rtl8188e_hal.h  | 2 --
 2 files changed, 7 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
index 22750cd40d45..760ca114a7cc 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_hal_init.c
@@ -1741,11 +1741,6 @@ void rtl8188e_SetHalODMVar(struct adapter *Adapter, enum hal_odm_variable eVaria
 	}
 }
 
-void rtl8188e_clone_haldata(struct adapter *dst_adapter, struct adapter *src_adapter)
-{
-	memcpy(dst_adapter->HalData, src_adapter->HalData, dst_adapter->hal_data_sz);
-}
-
 void hal_notch_filter_8188e(struct adapter *adapter, bool enable)
 {
 	if (enable) {
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index 40bc00a9b23b..13217789d495 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -438,8 +438,6 @@ void rtl8188e_set_hal_ops(struct hal_ops *pHalFunc);
 
 void rtl8188e_read_chip_version(struct adapter *padapter);
 
-void rtl8188e_clone_haldata(struct adapter *dst, struct adapter *src);
-
 void rtw_IOL_cmd_tx_pkt_buf_dump(struct adapter  *Adapter, int len);
 s32 rtl8188e_iol_efuse_patch(struct adapter *padapter);
 void rtw_cancel_all_timer(struct adapter *padapter);
-- 
2.33.0

