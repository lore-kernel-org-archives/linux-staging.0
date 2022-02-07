Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBB32F2C
	for <linux-staging@lists.linux.dev>; Mon,  7 Feb 2022 23:56:53 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id g15-20020a9d6b0f000000b005a062b0dc12so12065134otp.4
        for <linux-staging@lists.linux.dev>; Mon, 07 Feb 2022 15:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RM60N0Rjf5a1UzUDohM/hVHwY147yFPqeTn24GmliwE=;
        b=ZfQHzR4lezRx9GD+vjJ10flGdwmXe+MNNuOGxKMK6/5aDP0mnZ5V3Qj66+QY4KWkay
         jCvVdr+WHrt2D4v55tW3SdLvlFAs03r4SD8k6VpDpuXEGJgO2XmxgbD47gFFzmy5rd9j
         9qwaQZ/znUULqh5PTElNJ9ySf185m8u30Wq3DCXhYQVOprof0ks1udTtaCjfHdx5qwYz
         srvz4I53b+jXFbQB7S996k3awzx0H3Mt8Qr/sGghUXc9WUkIdonqenWgC6DKuhuwi7yg
         6eqAU/6KmCbAu2k+TX2shwIXvTqvMRQRYAJQsklEQo4Gz3IwMRikoYIUQIciSRf5/HaL
         Rz1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RM60N0Rjf5a1UzUDohM/hVHwY147yFPqeTn24GmliwE=;
        b=uRfiL+ZtaDMZudcpeWELADcZ5tqeADI5IhA9j7rTK73Pd9OUYK6a+bbOhARXHHhxDE
         ow2C0/BBodRbJs2ndafb3n2svk6gq/GxmjkWWEt2jSJqtEJYWhnZ+98byfjgQCJVSjhN
         4sKkBz9qum6umb+uaI2WEZgAgRPQlL8M+UR2PhRRKuI82NTOSknYvnWt3tPtCYxFn3qt
         RZ4oKqx/A1z5YKFIouhnsHcZSZ6bBEZ95KeqXLgKUIbGjwSC472j1vpER5KY5yeRKKtg
         zNifXSr9TUTYySBJkVEJAgPLDsaAkmBKFwlZPGOy0UpqcgyAJ07gafU6AI8fKaHBuCH6
         f7Mw==
X-Gm-Message-State: AOAM533k6yXlGW+oVBkBfWzyznJIRbtcgzimN56tUrdKsMH6nie18uSh
	RTH0H4xSky6pvBBpoBItzzM=
X-Google-Smtp-Source: ABdhPJwGwnxCoyQKJmjQfarqUsvKouiqLlNdaWqGRnQr2hyJ/c17gDhzWz73HyIalUuaQy2yoQzK1A==
X-Received: by 2002:a05:6830:918:: with SMTP id v24mr873883ott.246.1644278213093;
        Mon, 07 Feb 2022 15:56:53 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:4cd8:12bf:4134:806a:5a4a:2a88])
        by smtp.gmail.com with ESMTPSA id 1sm3829020oab.16.2022.02.07.15.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 15:56:52 -0800 (PST)
From: Leonardo Araujo <leonardo.aa88@gmail.com>
To: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Leonardo Araujo <leonardo.aa88@gmail.com>
Subject: [PATCH] Staging: r8188eu: core: Concatenated strings should use spaces between elements
Date: Mon,  7 Feb 2022 20:56:43 -0300
Message-Id: <20220207235643.29768-1-leonardo.aa88@gmail.com>
X-Mailer: git-send-email 2.29.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the following checkpatch.pl warning:

CHECK: Concatenated strings should use spaces between elements

Signed-off-by: Leonardo Araujo <leonardo.aa88@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ap.c b/drivers/staging/r8188eu/core/rtw_ap.c
index c7803144355a..30f5ad4e7ca7 100644
--- a/drivers/staging/r8188eu/core/rtw_ap.c
+++ b/drivers/staging/r8188eu/core/rtw_ap.c
@@ -1093,7 +1093,7 @@ int rtw_sta_flush(struct adapter *padapter)
 	struct mlme_ext_info	*pmlmeinfo = &pmlmeext->mlmext_info;
 	u8 bc_addr[ETH_ALEN] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
 
-	DBG_88E(FUNC_NDEV_FMT"\n", FUNC_NDEV_ARG(padapter->pnetdev));
+	DBG_88E(FUNC_NDEV_FMT "\n", FUNC_NDEV_ARG(padapter->pnetdev));
 
 	if ((pmlmeinfo->state & 0x03) != WIFI_FW_AP_STATE)
 		return ret;
-- 
2.29.0

