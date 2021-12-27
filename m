Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8278A2C82
	for <linux-staging@lists.linux.dev>; Mon, 27 Dec 2021 10:43:25 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id v10-20020a05600c214a00b00345e59928eeso4197059wml.0
        for <linux-staging@lists.linux.dev>; Mon, 27 Dec 2021 02:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6D1iaBgXOAkMH79XbQmEXP2lg5qLQCLAwgOT3lAeyto=;
        b=jVLvQO/SkxwSpmG2aYr+vTlUlNYWzDiK8cbDvVIMs/ifRD/i2BmYE9rFPu5ximZqG5
         7p0fllhwni7cE6XGcp46ssIipffO6Ji+5BzpzyyE49Gxik7fna7WnodGaA7HUiIOUrCj
         KH3I1dPmJ3ROYEi7hP6hhlZjVjr3Mdiq+lSyptO8CHvGAIa+qQTQhpdfsIcDt+2NsHdp
         RNrnxgWPs6HgOs59tpRznxDKDTL5CMkBFww0AN75UsT0a2pJN3dzDWttf0/BUMa9AGyS
         xAdxMEjb6lxmm98ohwbVroKcGUPI5Wuxf/1URtckLVFyCQaqKmv61Cfc8dQa94m2l68M
         IBbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6D1iaBgXOAkMH79XbQmEXP2lg5qLQCLAwgOT3lAeyto=;
        b=PmD/GT/07eUlPGGjAUXGeamPg+ZHDf0DZ8sI290UDWvow1HzwI3DBa/fJZPnvnXQEr
         zK5giTcJMmSHhjCUdEhu2mjIsCcED2xjYEj34rriitmCwRYhXni00qeoZfBf4C0tyI8N
         mUzdRApGTGynBeeFDNxm6gtFYJwG92ifflziFjniw2ZqWPWDI+E+GOn88YVzuN7yHwOJ
         E2raEfYnFRHgi1/vVpxX1y7RaVqgvX12fOGDX7VPsk1OHlcZr9Uz1otwCwzmemv0A6FS
         UHdryxQ/iobGItnHZCj0pky7jiRVH4Kszcyzl58zpHFvSWX4Ih2dDoqyujmcpGAKiecs
         651Q==
X-Gm-Message-State: AOAM532fcgE9AIiN0Z5Hd4R3bjFBcep3obDVYMwbN/A6vIDwGegjD8HU
	hJOxjzWcZHOmmTEYGaY6+ts=
X-Google-Smtp-Source: ABdhPJxhedIKRHvaF6GcsvxZqnYw0kYidOc1LXXNsn+OGSOKPv04pzC935HNvh57x5N694hQ3DiXrA==
X-Received: by 2002:a7b:c3c5:: with SMTP id t5mr1403286wmj.168.1640601803924;
        Mon, 27 Dec 2021 02:43:23 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::abe6])
        by smtp.gmail.com with ESMTPSA id w17sm16089205wmc.14.2021.12.27.02.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 02:43:23 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: r8188eu: remove unused enum odm_h2c_cmd
Date: Mon, 27 Dec 2021 11:43:12 +0100
Message-Id: <20211227104312.13163-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The enum odm_h2c_cmd is not used in this driver. Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/odm_interface.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/r8188eu/include/odm_interface.h b/drivers/staging/r8188eu/include/odm_interface.h
index 64c29c1da19d..e27ba77577a7 100644
--- a/drivers/staging/r8188eu/include/odm_interface.h
+++ b/drivers/staging/r8188eu/include/odm_interface.h
@@ -4,13 +4,6 @@
 #ifndef	__ODM_INTERFACE_H__
 #define __ODM_INTERFACE_H__
 
-enum odm_h2c_cmd {
-	ODM_H2C_RSSI_REPORT = 0,
-	ODM_H2C_PSD_RESULT= 1,
-	ODM_H2C_PathDiv = 2,
-	ODM_MAX_H2CCMD
-};
-
 /*  2012/02/17 MH For non-MP compile pass only. Linux does not support workitem. */
 /*  Suggest HW team to use thread instead of workitem. Windows also support the feature. */
 typedef void (*RT_WORKITEM_CALL_BACK)(void *pContext);
-- 
2.34.1

