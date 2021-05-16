Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2CD71
	for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 12:31:03 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id m190so2818870pga.2
        for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 05:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ds28R/7vwYP+GELrd+7TuWueNiMvgRdKm3879jAJ7HQ=;
        b=rEEgJv5BYec+b4lztI67bvFhhdOJx/o7DPkxi3xSciQzsPHrMn7o7fdMnNvwZ7ZGAY
         WOCJQR8xqdqDU+w5jG33FtR4jxlFzAvXKEHglc6zohI8xClEiFjlyagVZpSeF3EuZd/M
         RFfLX8BO3wTOTtsex+R+YwFHDxlma+esLgVVM6LYF5wSp76JVQ2Vl8+YCgAw5TimZeON
         F/JN1+TBCdpClM2bh1NNJmuLeRchwIC9JwFztRQUNXQa8fRcr1uHgPO6uZ9KQsrYFO5g
         t8tYngE8YzZQbtdGeNoKAatV9bc5RCKloez+XkmVBUcY6w7NkLZmScQMcdsY/TDc4KBT
         MZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ds28R/7vwYP+GELrd+7TuWueNiMvgRdKm3879jAJ7HQ=;
        b=QhMmmh/KSNjc0MK4HZFBVYT33sgw5f8RWzIFExO8K/yxaGOeTHVHUDCMFGrAoekoio
         jCXufRqCaZmVNn5CBrIFGNpRwmO3O5lzLoM1p0uc8Qzj1nldyv9/EnS60HvC/j5UItzJ
         VVAAmsNdCHC9etFytJvVo2KroTN0ONqxjRIQmHjUu+YFGkw1mi3SVce59mZYikXyiYNh
         OkTAzoa7ZGmUeUqTozsl/CRwjGBzPjI/wQH3NE8XKz1YuL/FN6n0VjtQyNOnec+amXRf
         EUYXO/kjKzTJChXmy/7KuK3sSUQGMPvVFg4C7lduInk0zxP4gQRF6kpWUqvxwh1dS+M1
         FP0g==
X-Gm-Message-State: AOAM530Muz31e002G518y2SjHMgxs880W3iZOIiYXwwYBsFbxLehDEHX
	zxa1tdX9w+5ogkksRW8vC58=
X-Google-Smtp-Source: ABdhPJyUnk4tZhpoLh6hARcUhy8fFfv9TcSYa1G973qaWL3zCQrGzeEq+CvnQUB7zeVaCqBWLeFviw==
X-Received: by 2002:a62:7652:0:b029:2d9:4602:7292 with SMTP id r79-20020a6276520000b02902d946027292mr6031215pfc.52.1621168263632;
        Sun, 16 May 2021 05:31:03 -0700 (PDT)
Received: from localhost.localdomain ([111.223.96.126])
        by smtp.gmail.com with ESMTPSA id k186sm8004318pgk.82.2021.05.16.05.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 05:31:03 -0700 (PDT)
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
Subject: [PATCH 5/7] Staging: rtl8723bs: add missing blank line in HalBtc8723b1Ant.c
Date: Sun, 16 May 2021 08:29:25 -0400
Message-Id: <20210516122927.1132356-6-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516122927.1132356-1-desmondcheongzx@gmail.com>
References: <20210516122927.1132356-1-desmondcheongzx@gmail.com>
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

