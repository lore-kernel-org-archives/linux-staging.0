Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72B82F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:45:06 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id e7so82838511edu.10
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ge3P0WNdYY2EQIE5X7at+1ZyKJ0Q7vBILrEN41L9FQE=;
        b=BypFmereVEcLcMqhVCWFrGj+x295WiPf9AZ/WGDCvLLdPgeUeJNn0Mzj0cDRpWwme7
         CEypNEWsDvNIYebXW1RA7O33k7Wvffimj46NFMQgY6ukdHe3cNZFc0FUnXibrTZe0Cwr
         CVFeZgjr04Z2q6n31MPIQr5RYiXnzkivFgHFDbOokwpYHCPg3Xez4uDD6/8j07mMXvyj
         crKgTKh+kbNnPEm+U1m5S3sNfBkjSjlijgt9XTiiX+ix4Ayjg5RdJQZLcSsSIKkt8qwu
         C1D1KIbKnVDiq/kA45DzMVOkyvfxRtFC3GeKAcFfx2GtZncz3KP9N9HAQJkcx3K3wnlb
         dH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ge3P0WNdYY2EQIE5X7at+1ZyKJ0Q7vBILrEN41L9FQE=;
        b=RQUooXKl5uGXSVKLbxXBMVXw+TtVSiaH6lwks1iPkFCeGfUMk6Qr1OA5fiw43NBDTx
         daIcUuP4JfvaZtsZ0r9WMxP0Ymzbsqt4fo8LtTSQ+btqUjzyXEDO9cloDBBfzpN3AaNk
         CKskoeEIyWrbTxUvONlL0idgMU1DBBk2gCBQwQyaBRSqbHXz4WALTlFGjMRRZMdBx6zl
         1nJiPxckwc6edD/MuXb95joH8q3z2uf0kW5V4BXJdGfoscRxD02ZKCtQvpcARcpmbioU
         DA8vgZ23HzX6HFUlAYrzUPEOSqYHOJCIz3HTe0ao4TxrN4e36CV+b1CWIWYNp5Yz3Ifr
         S3ow==
X-Gm-Message-State: AOAM5313Yx4TfMcTrBrsUeBZLKgi2BZ93N8WOdRjOpqXsmHuw8Y1+vUg
	1we1tKTqlZIjxEgiIEi2Z+E=
X-Google-Smtp-Source: ABdhPJxkDFc2AI+0XKPQuItfPN7FciugkKCOoI0R6fp80xyF2z6IQMijI5vOcHzJWNEdM8XX8F8tgQ==
X-Received: by 2002:aa7:c7d5:: with SMTP id o21mr6491360eds.166.1619793905279;
        Fri, 30 Apr 2021 07:45:05 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id p21sm1508769edw.18.2021.04.30.07.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:45:04 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 34/43] staging: rtl8723bs: remove obsolete debug macros
Date: Fri, 30 Apr 2021 16:44:04 +0200
Message-Id: <a2fad07a6c1c625333c02f59ae4d8cf3e08ec779.1619793406.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619793405.git.fabioaiuto83@gmail.com>
References: <cover.1619793405.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove obsolete debug macros.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
index c4616a69425d..db9d8a529877 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
+++ b/drivers/staging/rtl8723bs/hal/HalBtcOutSrc.h
@@ -78,22 +78,6 @@ enum {
 	BTC_CHIP_MAX
 };
 
-/*  following is for BTC_MSG_INTERFACE */
-#define INTF_INIT	BIT0
-#define INTF_NOTIFY	BIT2
-
-/*  following is for BTC_ALGORITHM */
-#define ALGO_BT_RSSI_STATE				BIT0
-#define ALGO_WIFI_RSSI_STATE			BIT1
-#define ALGO_BT_MONITOR					BIT2
-#define ALGO_TRACE						BIT3
-#define ALGO_TRACE_FW					BIT4
-#define ALGO_TRACE_FW_DETAIL			BIT5
-#define ALGO_TRACE_FW_EXEC				BIT6
-#define ALGO_TRACE_SW					BIT7
-#define ALGO_TRACE_SW_DETAIL			BIT8
-#define ALGO_TRACE_SW_EXEC				BIT9
-
 /*  following is for wifi link status */
 #define WIFI_STA_CONNECTED				BIT0
 #define WIFI_AP_CONNECTED				BIT1
-- 
2.20.1

