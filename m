Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4998E71
	for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 12:29:50 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id n23so12702160wms.2
        for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 05:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6pwu5pM4dbgTBood6EBI5joCOsJM78eFvHusKdHfshs=;
        b=ZnOJGE8ArpO1GaWP0LkeNuk4rynlhsarhSQ01m+IMB1CC2hcPB3h4ObVyYIBFa9p8m
         Yj1QIChEDjRoTZQtsz5UjhDYZNx/8OdKReV4s67W8AP8npZnlpii6a9LiKZ7K+h231CK
         8IpF8b6Jyz5IuvF85j1XqpGQABbJ77uNYAVMlrDPdE9b/jBji0pa1JA/bmFkaC9Dnvl9
         6NTrT9ALTXFy+WQrjtKIuhqsojRPe+EtHwcZq0PPpVfFXJST6aC/wmjZT33n+WwwFPYg
         Ml+ekpzYHf0Ts60Zf8x5kJ+P/QDuLc6gqfQYnGetMIz+VInP0sYFbm8b86m8UaL6tIMr
         DlMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6pwu5pM4dbgTBood6EBI5joCOsJM78eFvHusKdHfshs=;
        b=bYoo+6Dt21FTovrxH/Bz8NB5QMaq1OoyC467a4tMwJR3+dRr05Q4W8Xs/b6drWeCuz
         riLBmmqoRnQ86hwbKIc6qQLhtgJYr+WO1wc2jII2d7JH8q2g5D6cciCkFPbJe9Y57G2V
         qsFhvuoORyLIElOzmeu/gXhmftH+kBtF/A0GMdKWCJl67EbMIcgmb2kmbMHsbNauV5xD
         pHr5eRn97K7f/cgJ1HqBZrHCY2uLhZ/muw+VtynFXwdeEqlkmoRQqw5x/zcNjs7EDVMQ
         DpSfxLWNG2kLp0pSEb+xMUmGCdBi/t9jeXiq3zlaJRT7/Ana4+EWgZNu1/d9qPr/4037
         XVSQ==
X-Gm-Message-State: AOAM530VIbl5cj6U3i+3IE07htbSoqdbxqGXUwKm9r18qJ58thZvvouB
	CFhpuU2qZLCfWuD+qRIFcWU=
X-Google-Smtp-Source: ABdhPJwGtgHVIsXOJT/MqW4dRSV4kspSNqZVARxdRy2wuBYoLBAbuvpEVp2vremtJtEC5MHGh4o8ag==
X-Received: by 2002:a05:600c:4642:: with SMTP id n2mr4227501wmo.101.1624364988954;
        Tue, 22 Jun 2021 05:29:48 -0700 (PDT)
Received: from agape ([5.171.73.108])
        by smtp.gmail.com with ESMTPSA id m6sm25945938wrw.9.2021.06.22.05.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 05:29:48 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/17] staging: rtl8723bs: remove unused enum items related to channel bonding
Date: Tue, 22 Jun 2021 14:29:28 +0200
Message-Id: <aee2c78ea50a0bc24c114853500bd44c358745aa.1624364582.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1624364582.git.fabioaiuto83@gmail.com>
References: <cover.1624364582.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused enum items related to channel bonding.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_rf.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_rf.h b/drivers/staging/rtl8723bs/include/rtw_rf.h
index 98bc274e5e81..550471637315 100644
--- a/drivers/staging/rtl8723bs/include/rtw_rf.h
+++ b/drivers/staging/rtl8723bs/include/rtw_rf.h
@@ -98,14 +98,6 @@ enum {
 	VHT_DATA_SC_DONOT_CARE = 0,
 	VHT_DATA_SC_20_UPPER_OF_80MHZ = 1,
 	VHT_DATA_SC_20_LOWER_OF_80MHZ = 2,
-	VHT_DATA_SC_20_UPPERST_OF_80MHZ = 3,
-	VHT_DATA_SC_20_LOWEST_OF_80MHZ = 4,
-	VHT_DATA_SC_20_RECV1 = 5,
-	VHT_DATA_SC_20_RECV2 = 6,
-	VHT_DATA_SC_20_RECV3 = 7,
-	VHT_DATA_SC_20_RECV4 = 8,
-	VHT_DATA_SC_40_UPPER_OF_80MHZ = 9,
-	VHT_DATA_SC_40_LOWER_OF_80MHZ = 10,
 };
 
 /* 2007/11/15 MH Define different RF type. */
-- 
2.20.1

