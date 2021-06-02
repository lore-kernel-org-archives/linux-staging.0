Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ACF572
	for <linux-staging@lists.linux.dev>; Wed,  2 Jun 2021 16:03:40 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id u7so1342718plq.4
        for <linux-staging@lists.linux.dev>; Wed, 02 Jun 2021 09:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VpuA/7oLq4UEnVc4i14SbU6FY6IGX2Ds0P5xLrnP6MQ=;
        b=b1zwPRNHAckpnbPEFF1zZ5XnE4ONYVpzSlgziJzblDRIHeKZDJAZYMj0XZf+SLMKfI
         GsLNTwTgcPio9fAtA8qnLtAcqYPlx6yNu0LmYnne6v98zhXXGQkYTnPGHTHPplJeL5Hp
         1gTmbGc9xv39z2Xpw1AV3pWrhDzNQ5G4mDH5mI63ANhItu14JGvpeWcb3LuhOLyz0C8R
         CCg41pVQMvyj//sHkqlmJE4sScrvNW3tdf4b1gBsdmi0NOLDXanRIjPvpUvfYeqIm9E4
         j/PS0FlrA5zGwggZKco5F8KCfFIqRm1sPjaGTS2Y84da7W8v6jAIpmMu3ER8wJYrVXBY
         yDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VpuA/7oLq4UEnVc4i14SbU6FY6IGX2Ds0P5xLrnP6MQ=;
        b=d8QKumiKxi4dFbLsOX4gV+B3/yLElmJGJZJaMYuFgPkxrAcg0UOnUbmGbgK7S0R63T
         MsSsoWF8H4dVJAsFFUdsKQWxUMQDaQ15LXJ6ifTf8vCUdfhxBKQro2PQV+3EhY0sRrxZ
         G2JbB/xpkQMKNykKu7Zoc0y1CEvtmOkS19Dpw3TKudZ2KUAR7p0EZKKsir7Bq6OHKDL4
         fedwgbFpOn0fMw360ds0aQ1RjgFaU+pzqO/jDnSmVrUzhPL9u4XQxnNmVxvc9yNLaWui
         vnlxMu5+OSkL/1UA3+5TTT6rikdfPgwVvHjbai/3tT/FWZmakWDSHX8st/1YwBYZOzH6
         fpWA==
X-Gm-Message-State: AOAM531Le+wksRuY5eVXEZ72UuKqWVTpb111iJ9Ej4jAg8J0l5+uaK75
	Qk7unJCWlMDFGA51Y4+euVQ=
X-Google-Smtp-Source: ABdhPJzKNynNhIu8RHjcCvOwPltTdjpU5YPsnVZkvT9iXrAralrXzbFoUXEn1KuYyZLgQsDSTmhx0Q==
X-Received: by 2002:a17:90b:4d82:: with SMTP id oj2mr31057179pjb.61.1622649819956;
        Wed, 02 Jun 2021 09:03:39 -0700 (PDT)
Received: from localhost.localdomain ([183.82.156.71])
        by smtp.googlemail.com with ESMTPSA id h20sm105332pfq.83.2021.06.02.09.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 09:03:39 -0700 (PDT)
From: Manikishan Ghantasala <manikishanghantasala@gmail.com>
To: 
Cc: manikishanghantasala@gmail.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8192u: fix coding-style issues in r8192U_hw.h
Date: Wed,  2 Jun 2021 21:33:31 +0530
Message-Id: <20210602160333.62163-1-manikishanghantasala@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

staging: rtl8192u: r8192U_hw.h: Clear the coding-style issue

"Macros with complex values should be enclosed in parentheses"
by enclosing values in parantheses.
Modified spacing around "|" and removed a space before tab.

Signed-off-by: Manikishan Ghantasala <manikishanghantasala@gmail.com>
---
 drivers/staging/rtl8192u/r8192U_hw.h | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8192u/r8192U_hw.h b/drivers/staging/rtl8192u/r8192U_hw.h
index 8d3a592f1c35..27c96493006a 100644
--- a/drivers/staging/rtl8192u/r8192U_hw.h
+++ b/drivers/staging/rtl8192u/r8192U_hw.h
@@ -88,7 +88,7 @@ enum _RTL8192Usb_HW {
 #define RX_FIFO_THRESHOLD_MASK (BIT(13) | BIT(14) | BIT(15))
 #define RX_FIFO_THRESHOLD_SHIFT 13
 #define RX_FIFO_THRESHOLD_NONE 7
-#define MAX_RX_DMA_MASK 	(BIT(8) | BIT(9) | BIT(10))
+#define MAX_RX_DMA_MASK	(BIT(8) | BIT(9) | BIT(10))
 #define RCR_MXDMA_OFFSET	8
 #define RCR_FIFO_OFFSET		13
 #define RCR_ONLYERLPKT		BIT(31)			// Early Receiving based on Packet Size.
@@ -221,14 +221,13 @@ enum _RTL8192Usb_HW {
 #define	RATR_MCS14		0x04000000
 #define	RATR_MCS15		0x08000000
 // ALL CCK Rate
-#define RATE_ALL_CCK		RATR_1M|RATR_2M|RATR_55M|RATR_11M
-#define RATE_ALL_OFDM_AG	RATR_6M|RATR_9M|RATR_12M|RATR_18M|RATR_24M\
-							|RATR_36M|RATR_48M|RATR_54M
-#define RATE_ALL_OFDM_1SS	RATR_MCS0|RATR_MCS1|RATR_MCS2|RATR_MCS3 | \
-							RATR_MCS4|RATR_MCS5|RATR_MCS6|RATR_MCS7
-#define RATE_ALL_OFDM_2SS	RATR_MCS8|RATR_MCS9	|RATR_MCS10|RATR_MCS11| \
-							RATR_MCS12|RATR_MCS13|RATR_MCS14|RATR_MCS15
-
+#define RATE_ALL_CCK		(RATR_1M | RATR_2M | RATR_55M | RATR_11M)
+#define RATE_ALL_OFDM_AG	(RATR_6M | RATR_9M | RATR_12M | RATR_18M |\
+				 RATR_24M | RATR_36M | RATR_48M | RATR_54M)
+#define RATE_ALL_OFDM_1SS	(RATR_MCS0 | RATR_MCS1 | RATR_MCS2 | RATR_MCS3 |\
+				 RATR_MCS4 | RATR_MCS5 | RATR_MCS6 | RATR_MCS7)
+#define RATE_ALL_OFDM_2SS	(RATR_MCS8 | RATR_MCS9 | RATR_MCS10 | RATR_MCS11 |\
+				 RATR_MCS12 | RATR_MCS13 | RATR_MCS14 | RATR_MCS15)
 	EPROM_CMD		= 0xfe58,
 #define Cmd9346CR_9356SEL	BIT(4)
 #define EPROM_CMD_OPERATING_MODE_SHIFT 6
-- 
2.25.1

