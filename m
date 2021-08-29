Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3803FC4
	for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 09:25:26 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id d6so16800707edt.7
        for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 02:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P8cOJwuF63B3kAPlXYd6oasS8yb7CPWzUAASpmG5Xb8=;
        b=gVCHHH9NHciA1B34T3gAuRPrjTuX53cpRqJEQgM9Gq4LNYSxOwO3j/T9ho1b0YDBgv
         +0dAkztcE4mzaQ7RL3R3+B1L8gCjNsx/C6pb23oETbXXCOpPoS1RziijwIrKUKvmg/Ln
         yKS+7/eGdq0AN6ulT8KIOFWiKIQiKNARa+QY+QEcRbpLdZ8kFE3A19jO2QgtjfHmAWfR
         zcURkAU7yfJmylqmvxk1WiScTlIBf5QTJ6g4zeZw5MEP0yhG+HeJtXmWWjrzxrWu/40T
         qJpDMzp+olz3hntqiWFpMOHY9uwVXzoCohCXwmdhfdGv3RyQH0GKUHdS4tJhbmXM/7il
         JVow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P8cOJwuF63B3kAPlXYd6oasS8yb7CPWzUAASpmG5Xb8=;
        b=P9+LgevBN4w2qpcSTJmWQSl5aJyZb54lO2fRaCS3Dy7IlOotHArckVZssMsfWeH+Bb
         bWbn6KNMEdyXJf9z5xp0tvDQW1VwOWfYsPgmxv9Rqp4CHY5+B3W5aJ7wYO6bNQ/TJcp4
         nrYuFeoHn3yzr7+WbNL/f0uHR3RqgRgyuo3WDjyGpb/X3EixicwK7MhjXyHwUgakvRXN
         nEAkgO+GRTVA7+fEykmE+g4fMc7Pu3U9SDAwJ+PVjlJvW+MfK3s7sh+qIO/lRRYHlVaS
         sHxWTZW1rzyoIcje4fdimTzLEfgjk/m8XsFV8c4eh/1XKX8gvXRb01qgt2X7dgmq6jG/
         wiCA==
X-Gm-Message-State: AOAM531o6hjlEJA6WueKm2CIycEf6xArJ6YeM7d/egwIuNUtUEm6D2XY
	NSHn9eu2XDU0QTeyrPYS1ag=
X-Google-Smtp-Source: ABdhPJxmrLnlHUJtXbMWShP+34rlN/WFLyCROTsnVKZ/ornQblLCWR2/QTS4xi+YKkbUHQSNfPDZvQ==
X-Received: by 2002:aa7:c60e:: with SMTP id h14mr8450755edq.43.1630229125231;
        Sun, 29 Aug 2021 02:25:25 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::16fa])
        by smtp.gmail.com with ESMTPSA id d23sm5814414edt.39.2021.08.29.02.25.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 02:25:24 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/6] staging: r8188eu: remove CAM_empty_entry()
Date: Sun, 29 Aug 2021 11:25:00 +0200
Message-Id: <20210829092502.3658-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210829092502.3658-1-straube.linux@gmail.com>
References: <20210829092502.3658-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function CAM_empty_entry() is unused, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_wlan_util.c   | 5 -----
 drivers/staging/r8188eu/include/rtw_mlme_ext.h | 1 -
 2 files changed, 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index bc10a08d01e6..ddc84f6b74e2 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -427,11 +427,6 @@ unsigned int decide_wait_for_beacon_timeout(unsigned int bcn_interval)
 		return bcn_interval << 2;
 }
 
-void CAM_empty_entry(struct adapter *Adapter, u8 ucIndex)
-{
-	rtw_hal_set_hwreg(Adapter, HW_VAR_CAM_EMPTY_ENTRY, (u8 *)(&ucIndex));
-}
-
 void invalidate_cam_all(struct adapter *padapter)
 {
 	rtw_hal_set_hwreg(padapter, HW_VAR_CAM_INVALID_ALL, NULL);
diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index c6b17da73c5f..01f770d02e5f 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -462,7 +462,6 @@ void write_cam(struct adapter *padapter, u8 entry, u16 ctrl, u8 *mac, u8 *key);
 void clear_cam_entry(struct adapter *padapter, u8 entry);
 
 void invalidate_cam_all(struct adapter *padapter);
-void CAM_empty_entry(struct adapter * Adapter, u8 ucIndex);
 
 int allocate_fw_sta_entry(struct adapter *padapter);
 void flush_all_cam_entry(struct adapter *padapter);
-- 
2.32.0

