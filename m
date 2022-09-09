Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A03E7E3
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 10:02:51 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id 29so1751028edv.2
        for <linux-staging@lists.linux.dev>; Fri, 09 Sep 2022 03:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=hBi6URYQVALsidcKkcUoMZ1IBEdBqMnHoDB4zpq2Y7A=;
        b=ooDa6X5vfxP5or0F4KBQQRtcZF4fzs1yqDVmdGSQMjEDXm/bG505Jca0ykvpZC+jPL
         0vDMaGQ/wV9h7cMr/kh1bCp1JVlYWrVcInkYkMIKiwQYrSru+FdkseyeMCCIqw/EE0da
         2tgCHjOx8IYDhwSR7Cal9cfO5FPOqKaYmqnZD8p9GYgnKQnwvRAoR1UKqAkRdBtCUvRy
         5uLahULH7nZeF4JFPJVZjCEyBFknbRxeI4YIn7+fxCTyDLWedlXQr2eH+NM01hnGIhD9
         v79YptS22gSP8YhLbv2bXgxR7UZ/apjb1ci4BIKHuCzYBJZPEdbmJl2ieAbffpw+30FC
         eIwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=hBi6URYQVALsidcKkcUoMZ1IBEdBqMnHoDB4zpq2Y7A=;
        b=GeLS7vsBDlQFznAgvU9yhtoZ8xEdRRpJwA36/58iC67FK+jLmXwzMe51tob6ejEZkT
         g3YTakD/4YIN0EjcsOLe5NSbJAiQmv2kx33kw7YopSIxIh2FZh4DmUvhZOeEg3C7Bvtf
         lElAjeGGjUxWgdU9dqgbQtFVSgmh9jRe+A5Wbi0Fs4cK7sJroTnmCZ6QRih7Q8tL7b3G
         F6VxZDW3DO+QFFpGtS1wYFL377VLkyK79WH6MZnlcVmmDAB09/rJp4ZVmHvrWWBGEq7Q
         eIFGK+ImV7Rtte8hDq7qcVNg187QfJHHxwPJrr39p849S1Df8esClEwWPpAmfn+7hQSj
         gdWg==
X-Gm-Message-State: ACgBeo3EoHChmpPeZm8z4lYAhxfP+MB+wx+/XQNU44Wyy28MLFQPVPPv
	zlMS7NY0WBVQn/nyz90+54GvtJub4Qw=
X-Google-Smtp-Source: AA6agR5pPbK+i9DZShzjF/D9c2lvDycE2adpZZEtrJIEzs2gJYGcLWVIdXJYtAGLC8fQzuoW7qW+cQ==
X-Received: by 2002:a05:6402:138f:b0:43d:8ed5:c841 with SMTP id b15-20020a056402138f00b0043d8ed5c841mr10840252edv.27.1662717769266;
        Fri, 09 Sep 2022 03:02:49 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6b.dynamic.kabel-deutschland.de. [95.90.187.107])
        by smtp.gmail.com with ESMTPSA id se28-20020a170906ce5c00b00730b3bdd8d7sm38199ejb.179.2022.09.09.03.02.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 03:02:48 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: make c2h_evt_read() static
Date: Fri,  9 Sep 2022 12:02:32 +0200
Message-Id: <20220909100232.8305-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function c2h_evt_read() is only used in rtw_cmd.c.
Make it static.

This addresses the TODO item:
* Remove the HAL layer and migrate its functionality into the relevant
  parts of the driver.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c    | 60 +++++++++++++++++++++
 drivers/staging/r8188eu/hal/hal_com.c     | 63 -----------------------
 drivers/staging/r8188eu/include/hal_com.h |  2 -
 3 files changed, 60 insertions(+), 65 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 4be83807405c..ca1f2cc52470 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -1277,6 +1277,66 @@ u8 rtw_c2h_wk_cmd(struct adapter *padapter, u8 *c2h_evt)
 	return res;
 }
 
+/* C2H event format:
+ * Field    TRIGGER      CONTENT     CMD_SEQ    CMD_LEN    CMD_ID
+ * BITS     [127:120]    [119:16]    [15:8]     [7:4]      [3:0]
+ */
+static s32 c2h_evt_read(struct adapter *adapter, u8 *buf)
+{
+	s32 ret = _FAIL;
+	struct c2h_evt_hdr *c2h_evt;
+	int i;
+	u8 trigger;
+
+	if (!buf)
+		goto exit;
+
+	ret = rtw_read8(adapter, REG_C2HEVT_CLEAR, &trigger);
+	if (ret)
+		return _FAIL;
+
+	if (trigger == C2H_EVT_HOST_CLOSE)
+		goto exit; /* Not ready */
+	else if (trigger != C2H_EVT_FW_CLOSE)
+		goto clear_evt; /* Not a valid value */
+
+	c2h_evt = (struct c2h_evt_hdr *)buf;
+
+	memset(c2h_evt, 0, 16);
+
+	ret = rtw_read8(adapter, REG_C2HEVT_MSG_NORMAL, buf);
+	if (ret) {
+		ret = _FAIL;
+		goto clear_evt;
+	}
+
+	ret = rtw_read8(adapter, REG_C2HEVT_MSG_NORMAL + 1, buf + 1);
+	if (ret) {
+		ret = _FAIL;
+		goto clear_evt;
+	}
+	/* Read the content */
+	for (i = 0; i < c2h_evt->plen; i++) {
+		ret = rtw_read8(adapter, REG_C2HEVT_MSG_NORMAL +
+				sizeof(*c2h_evt) + i, c2h_evt->payload + i);
+		if (ret) {
+			ret = _FAIL;
+			goto clear_evt;
+		}
+	}
+
+	ret = _SUCCESS;
+
+clear_evt:
+	/* Clear event to notify FW we have read the command.
+	 * If this field isn't clear, the FW won't update the next
+	 * command message.
+	 */
+	rtw_write8(adapter, REG_C2HEVT_CLEAR, C2H_EVT_HOST_CLOSE);
+exit:
+	return ret;
+}
+
 static void c2h_evt_hdl(struct adapter *adapter, struct c2h_evt_hdr *c2h_evt, c2h_id_filter filter)
 {
 	u8 buf[16];
diff --git a/drivers/staging/r8188eu/hal/hal_com.c b/drivers/staging/r8188eu/hal/hal_com.c
index 8416a65ba47b..33967eb3c0d0 100644
--- a/drivers/staging/r8188eu/hal/hal_com.c
+++ b/drivers/staging/r8188eu/hal/hal_com.c
@@ -137,66 +137,3 @@ void HalSetBrateCfg(struct adapter *adapt, u8 *brates, u16 *rate_cfg)
 		}
 	}
 }
-
-/*
-* C2H event format:
-* Field	 TRIGGER		CONTENT	   CMD_SEQ	CMD_LEN		 CMD_ID
-* BITS	 [127:120]	[119:16]      [15:8]		  [7:4]		   [3:0]
-*/
-
-s32 c2h_evt_read(struct adapter *adapter, u8 *buf)
-{
-	s32 ret = _FAIL;
-	struct c2h_evt_hdr *c2h_evt;
-	int i;
-	u8 trigger;
-
-	if (!buf)
-		goto exit;
-
-	ret = rtw_read8(adapter, REG_C2HEVT_CLEAR, &trigger);
-	if (ret)
-		return _FAIL;
-
-	if (trigger == C2H_EVT_HOST_CLOSE)
-		goto exit; /* Not ready */
-	else if (trigger != C2H_EVT_FW_CLOSE)
-		goto clear_evt; /* Not a valid value */
-
-	c2h_evt = (struct c2h_evt_hdr *)buf;
-
-	memset(c2h_evt, 0, 16);
-
-	ret = rtw_read8(adapter, REG_C2HEVT_MSG_NORMAL, buf);
-	if (ret) {
-		ret = _FAIL;
-		goto clear_evt;
-	}
-
-	ret = rtw_read8(adapter, REG_C2HEVT_MSG_NORMAL + 1, buf + 1);
-	if (ret) {
-		ret = _FAIL;
-		goto clear_evt;
-	}
-	/* Read the content */
-	for (i = 0; i < c2h_evt->plen; i++) {
-		ret = rtw_read8(adapter, REG_C2HEVT_MSG_NORMAL +
-						sizeof(*c2h_evt) + i, c2h_evt->payload + i);
-		if (ret) {
-			ret = _FAIL;
-			goto clear_evt;
-		}
-	}
-
-	ret = _SUCCESS;
-
-clear_evt:
-	/*
-	* Clear event to notify FW we have read the command.
-	* If this field isn't clear, the FW won't update the next
-	* command message.
-	*/
-	rtw_write8(adapter, REG_C2HEVT_CLEAR, C2H_EVT_HOST_CLOSE);
-exit:
-	return ret;
-}
diff --git a/drivers/staging/r8188eu/include/hal_com.h b/drivers/staging/r8188eu/include/hal_com.h
index e8007295cd79..cd3f845e146a 100644
--- a/drivers/staging/r8188eu/include/hal_com.h
+++ b/drivers/staging/r8188eu/include/hal_com.h
@@ -143,6 +143,4 @@ u8 MRateToHwRate(u8 rate);
 
 void HalSetBrateCfg(struct adapter *Adapter, u8 *mBratesOS, u16 *pBrateCfg);
 
-s32 c2h_evt_read(struct adapter *adapter, u8 *buf);
-
 #endif /* __HAL_COMMON_H__ */
-- 
2.37.3

