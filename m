Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08FE72
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 18:25:30 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id bt14so14998687ejb.3
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 11:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vh8+u22pNgFmmQDYhuLqazbVUqiifTDWeSKfb70Q1zQ=;
        b=O7iaNXjAyAdSfQOeZ235n6Iwh7TV8emA5/xwuHfKB+9Z6AOtgzxpSCa5tz26CSpbLc
         3ws8oRW6+1CUHyPnWMEzTQM2i0vDMjw9JnzTlE7HNf4c7KDk842H5U+sO9YrpRzNe0ln
         Wv0xind7WJ/ngmOENF84ClD4vombWRezezq6p5/r1Ao/zhiuuVYmSH8kviqUCn4UHRlL
         pOzdLQzmNx7TPxZMnch8G2tMwFKI1DQhpO5hWZOTXHA4ATOGDDTBCKWmDI63K5oxZaoh
         ncwAAIhgIH1M4kFIdc0DlJCOnp3ZtgvHUBRgc7/xiyCspGpkZSiAiok6b/7sonv8OtC/
         vOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vh8+u22pNgFmmQDYhuLqazbVUqiifTDWeSKfb70Q1zQ=;
        b=WWd8J1G3yy4es9GMShiPq+yeXA3N5K89KIdVgiZP4KauNge43dGFKtaSEVylQcaiFv
         61O/5YrwRfWBSBLPBpHCmx+J4R64YAQFSuMOMrueK81+vBdzQH0guubVxjDUTX9syIj4
         iQknLmc4BhmyGo1tiNahZuWWXwBl43xbwW4KdMOVUHqqKPJ7BOnzC9kyS2qwFgy9Tbll
         FhFcAWvIKt90cJwbx09RvzCFT3IV2d3NXFamIKID09i6kBtFiuC2/VazdwUUctkdD+uh
         sk+/MvnxX2fh8zROaGuTMLt45jlHinGfxTN9fSAQ8BIXkN4gyCfvsUrxP7/H2/ObvCkO
         1M3g==
X-Gm-Message-State: AOAM530uWQWTMtKzOXZm9og2LTb5877BeJ5WKT/BVL0F79Dh2VFz7aVt
	DVrfx7jqVMWVdSamW7h5KyE=
X-Google-Smtp-Source: ABdhPJzr3lLkgvFVvAE1uTKJKGgTgdFJse9iVERPnG0aDKOIYUHHOx8IUVero7+FYU7YUT7JDcbqyw==
X-Received: by 2002:a17:906:7d83:: with SMTP id v3mr14811979ejo.216.1630952729435;
        Mon, 06 Sep 2021 11:25:29 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id s25sm4284492ejq.17.2021.09.06.11.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 11:25:29 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 38/40] staging: r8188eu: remove unused function rtl8188e_clone_haldata()
Date: Mon,  6 Sep 2021 20:24:36 +0200
Message-Id: <20210906182438.5417-39-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906182438.5417-1-straube.linux@gmail.com>
References: <20210906182438.5417-1-straube.linux@gmail.com>
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

