Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5A52CA6
	for <linux-staging@lists.linux.dev>; Sun,  2 Jan 2022 13:12:03 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id k18so28167065wrg.11
        for <linux-staging@lists.linux.dev>; Sun, 02 Jan 2022 05:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e0RmU1onou/oXu8qErkvtzvaLVPz9cKYalSq2uccEnw=;
        b=Iif4LtfYaj2R8L187cwcc8mJKqWADbYQ0er2Kz/7nS4YysG7566z1HMvxetM6HmcBz
         D5z/SjwUW9GWCKKvkU3hWJRcDa7sxon48mALh2J/C+PfmDDFjjhP10+S2lW4xCw6+9la
         ouRv7YoIEwOtcWLIzzr4+e8wR2vcgh0Lkfn8TpdRO2AlqEmcFs1WmtQl0D9JenBoTo2a
         7IfpXpxDt1jAYTFcJM+kI4BtSrZP6i758R1UyYVSpR7dI47wuthrtWucjdNmyoIVZKCv
         PomsbqVVmLFs+Xsy3bULiAc9/uQRPbfrDt7K/c5F+zNm8USJ2SnJ3snE4IPEB3a15dhm
         MnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e0RmU1onou/oXu8qErkvtzvaLVPz9cKYalSq2uccEnw=;
        b=AhPunaK04gLiec/N43uWtN4s0TLrv9vawJStRCjc9bFnzWXH4Ss3MD3hUduDBDDFD/
         cKr16mMhtxGRgijaLpJX0MeXrggxX+hPbRvQ0Om7B5nB2pUDwG3xYIwwVmBYjXfdp29b
         vyW3rIcp3OBtaUpn4nirSuII4QWNZdxh8MfV4N/Li9Za9xCAUvbAZgdZ27d0g2s6uMPm
         /0SltZlZ24LfxgI4WeoL4J88OHafLbN+qdKne0lFZcwlhv2xGJGtX0T/Bf+2BBIx6xm8
         2Sij3FYW89bmrgQ8Bl8NBRQTo0XgQ7yiM+Mp7sIQ9KHyPMe5yy3O1/3C9WAC9wlmB37Y
         D4Nw==
X-Gm-Message-State: AOAM530ZeL8V0nSZRxsOUvkiWth3Ezfgrx/gwB7j/UC1ikGsjf+sASMh
	27GFW51Pe2ijn4Nw0w9EdzI=
X-Google-Smtp-Source: ABdhPJzxgQ5I0QdRMGMxE/tM6sU6iKdNJGwWiRJwnYL2aVBoSMC9dzUW1TLRxcus1lF734f9LAgSMA==
X-Received: by 2002:a5d:6244:: with SMTP id m4mr35184446wrv.186.1641129121642;
        Sun, 02 Jan 2022 05:12:01 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id m35sm65640044wms.1.2022.01.02.05.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jan 2022 05:12:01 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 11/11] staging: r8188eu: remove unused defines from rtw_eeprom.h
Date: Sun,  2 Jan 2022 14:11:41 +0100
Message-Id: <20220102131141.12310-12-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220102131141.12310-1-straube.linux@gmail.com>
References: <20220102131141.12310-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused defines from rtw_eeprom.h.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/rtw_eeprom.h | 26 --------------------
 1 file changed, 26 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_eeprom.h b/drivers/staging/r8188eu/include/rtw_eeprom.h
index 22c2eddd5e75..3e8d3bb48903 100644
--- a/drivers/staging/r8188eu/include/rtw_eeprom.h
+++ b/drivers/staging/r8188eu/include/rtw_eeprom.h
@@ -7,33 +7,7 @@
 #include "osdep_service.h"
 #include "drv_types.h"
 
-#define	RTL8712_EEPROM_ID		0x8712
-
 #define	HWSET_MAX_SIZE_512		512
-#define	EEPROM_MAX_SIZE			HWSET_MAX_SIZE_512
-
-#define	CLOCK_RATE			50	/* 100us */
-
-/*  EEPROM opcodes */
-#define EEPROM_READ_OPCODE		06
-#define EEPROM_WRITE_OPCODE		05
-#define EEPROM_ERASE_OPCODE		07
-#define EEPROM_EWEN_OPCODE		19      /*  Erase/write enable */
-#define EEPROM_EWDS_OPCODE		16      /*  Erase/write disable */
-
-#define	EEPROM_CID_DEFAULT		0x0
-#define	EEPROM_CID_ALPHA		0x1
-#define	EEPROM_CID_Senao		0x3
-#define	EEPROM_CID_NetCore		0x5
-#define	EEPROM_CID_CAMEO		0X8
-#define	EEPROM_CID_SITECOM		0x9
-#define	EEPROM_CID_COREGA		0xB
-#define	EEPROM_CID_EDIMAX_BELK		0xC
-#define	EEPROM_CID_SERCOMM_BELK		0xE
-#define	EEPROM_CID_CAMEO1		0xF
-#define	EEPROM_CID_WNC_COREGA		0x12
-#define	EEPROM_CID_CLEVO		0x13
-#define	EEPROM_CID_WHQL			0xFE
 
 struct eeprom_priv {
 	u8		bautoload_fail_flag;
-- 
2.34.1

