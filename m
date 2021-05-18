Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026996D0F
	for <linux-staging@lists.linux.dev>; Tue, 18 May 2021 04:44:02 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id 22so6117956pfv.11
        for <linux-staging@lists.linux.dev>; Mon, 17 May 2021 21:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ds28R/7vwYP+GELrd+7TuWueNiMvgRdKm3879jAJ7HQ=;
        b=M8lRvzvdKFwL0qKWqAeZktmJWVupxq33Q7hgy4nUnWPLh0PPzcs52zIHQo3f5R7j8K
         CM1BHYe23PsIG2UmsKQL/MFejxBcpB+OR4UYWmDUbZ5XRRE7WLSIDoNIJkAG9S9blxwG
         n85pGCXxLff+A+7lfVLg+7oRSZeBEo1mc0+cstI7kQCDW3Qs9fSZWhaGEXJUH2I2h2sC
         AGOxlgqz5BC29EemmLcrGekUH8M7xUV7CwnlneXic47UzbMhM036q2CssbN+bAmp0GnE
         /EdLyjNqoOyLpK1/Gh50VEQ1E1sYwjiEyK2eSeC99nzZHb9hPPWb6Ek9yl9ACUlxSVcJ
         q/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ds28R/7vwYP+GELrd+7TuWueNiMvgRdKm3879jAJ7HQ=;
        b=lWaz1w0WB+YnqMQ5/gxgl0yJ6+KMEmaVxep9RKg2/vEtLzalbC4JZ+ZDw9VtsldfRA
         WNHHdVNs6QNW+9MLtEnLpyrKD6UuRuBn3skU2LH1AtiYGLMTlh+7i12C56xlgJuj4NrA
         mnF3bewUovFJrY/xVh+WVwrQ9Pi9tBdQFjt1d/8oAG8x1PY9dYuXr0IYBzvpQpvfvqv0
         FPSNfMkEUO8MAt2AzayXa0h6SldU9fvUmAx2+cRDtBREHXACyjzoOuzPgUKltJa7DIun
         wPUHdpHEq9SOv6flUOCdUHu3kTbEy3MaTwvdWJ8p98nQewCDk4gf5zEzWnzvFP40wjdd
         0tBw==
X-Gm-Message-State: AOAM532c0e6qWX4rxoy+cUcgo8AUoKBR14z2mHhGKptwoELqLdsGohzp
	5iloN6h0hVmxVqCpu53v+7E=
X-Google-Smtp-Source: ABdhPJxneK2BJTKruRRi+uIH4AUvHRRkbP9aci+ZVV3w7z6Qfpt7pAVSBnuhoSWv6/Qs7/jcm1HrjA==
X-Received: by 2002:a63:1224:: with SMTP id h36mr3138445pgl.296.1621313042678;
        Mon, 17 May 2021 21:44:02 -0700 (PDT)
Received: from localhost.localdomain ([203.126.139.7])
        by smtp.gmail.com with ESMTPSA id t15sm357538pjh.0.2021.05.17.21.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 21:44:02 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: gregkh@linuxfoundation.org,
	marcocesati@gmail.com,
	dan.carpenter@oracle.com,
	fabioaiuto83@gmail.com,
	fmdefrancesco@gmail.com,
	eantoranz@gmail.com,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v2 5/7] Staging: rtl8723bs: add missing blank line in HalBtc8723b1Ant.c
Date: Tue, 18 May 2021 00:41:17 -0400
Message-Id: <20210518044119.2960494-6-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518044119.2960494-1-desmondcheongzx@gmail.com>
References: <20210518044119.2960494-1-desmondcheongzx@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit fixes the following checkpatch.pl warning:

WARNING: Missing a blank line after declarations
+	struct btc_bt_link_info *pBtLinkInfo = &pBtCoexist->btLinkInfo;
+	halbtc8723b1ant_BtRssiState(2, 28, 0);

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index 97831d04959b..cf36a7de4735 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -1664,6 +1664,7 @@ static void halbtc8723b1ant_ActionWifiConnectedBtAclBusy(
 )
 {
 	struct btc_bt_link_info *pBtLinkInfo = &pBtCoexist->btLinkInfo;
+
 	halbtc8723b1ant_BtRssiState(2, 28, 0);
 
 	if ((pCoexSta->lowPriorityRx >= 1000) && (pCoexSta->lowPriorityRx != 65535))
-- 
2.25.1

