Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED38971
	for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 09:02:46 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id x7so50644201wrw.10
        for <linux-staging@lists.linux.dev>; Sat, 24 Apr 2021 02:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pW8S2qDA8lfJoWNaoF5GHjJlm4hypdByKozOq82+4Nk=;
        b=SBSurnZsbLdTwh3Ik2x6C1ah1gSig3IKceI8bKVqqbxHLCUH+g4pxQIl+iHZCLtEsI
         rO9XC+RDbTVS2B0wkBaxfsUSIJnuyRpsvf6wTV+ScS67XQtfSDb1hnQA696kn8mfwvuM
         tHU38+mI8bGxfrTVtp5fw8fJymjFrcarZk1/GJKM4q0R1nSqGQKcS47GQu6jQTxkZbUn
         qOd7XmhqOeuvCb04FqFMOR9BYcdc+hQyVUOxgPutyFft5gRpOdEui+PGUKWesCHNE+7b
         Q34YsR+iwNMhNSWeXAm7tXFnHkyidcDn/p8mjZ7sJIuArIsJ06UGL1mKs+BWeRkCGYUE
         gaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pW8S2qDA8lfJoWNaoF5GHjJlm4hypdByKozOq82+4Nk=;
        b=M9oPNo4+yf179uXFukPRXUqtMlxbeeEPBoIs85FXMScDf+HT4D5g59vqo6aXxJ0+HN
         pSaZHCXNQIkBZP6EGFPF6t1crsVQws139M1PNpRiTUvZNgwFahzZR93gXOtVffOv2RXJ
         CHdxpJeCwAyWDD+WOMzlCce6+xoyKtqfIdouWIQa/5Ag/U97yAWaaYxWU+FTXH4SHDdO
         86At/dNVW9GYMry/kZ2l24ylNEhuemJTa6jhNIUDhhrvdOQTh4ur6HHAMY6v/qiYM3W7
         shyHAhMDdEzj27h7C2Uw9rgGLqTPkssa7NFhtNR5ngpxb5rzXodBBiZegTzQqzcNZ/yJ
         1kdg==
X-Gm-Message-State: AOAM532utSYIMt0zeEnGCQHj5MeK5Mglv7MVPWlO9bYOy2OHWAv+uDau
	a1tRethCLgRihWCef/T/kf4=
X-Google-Smtp-Source: ABdhPJxQbafWckPtQgjy159SW4/6uCWXNerGBr/tk93gOH60fYTRZsb2zKuIZwjjHfiIZdkT4yLZuQ==
X-Received: by 2002:adf:fb07:: with SMTP id c7mr9804836wrr.88.1619254965683;
        Sat, 24 Apr 2021 02:02:45 -0700 (PDT)
Received: from agape ([5.171.80.252])
        by smtp.gmail.com with ESMTPSA id n16sm1587426wrp.50.2021.04.24.02.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Apr 2021 02:02:45 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/50] staging: rtl8723bs: remove unused mac_reg_dump() function argument
Date: Sat, 24 Apr 2021 11:01:49 +0200
Message-Id: <2ae03ee765c861d1fd4237af7b8d11a918be0d76.1619254603.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619254603.git.fabioaiuto83@gmail.com>
References: <cover.1619254603.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused function argument void *sel from mac_reg_dump.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_debug.c     | 2 +-
 drivers/staging/rtl8723bs/include/rtw_debug.h  | 2 +-
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_debug.c b/drivers/staging/rtl8723bs/core/rtw_debug.c
index 0e13a226e9be..ad3cdbe45e55 100644
--- a/drivers/staging/rtl8723bs/core/rtw_debug.c
+++ b/drivers/staging/rtl8723bs/core/rtw_debug.c
@@ -26,7 +26,7 @@ static void dump_4_regs(struct adapter *adapter, int offset)
 		   i, reg[0], reg[1], reg[2], reg[3]);
 }
 
-void mac_reg_dump(void *sel, struct adapter *adapter)
+void mac_reg_dump(struct adapter *adapter)
 {
 	int i;
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index fdd5933a3d5a..eabc21d2b689 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -148,7 +148,7 @@
 
 #endif /* defined(_dbgdump) */
 
-void mac_reg_dump(void *sel, struct adapter *adapter);
+void mac_reg_dump(struct adapter *adapter);
 void bb_reg_dump(void *sel, struct adapter *adapter);
 void rf_reg_dump(void *sel, struct adapter *adapter);
 
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index e98e5388d5c7..7951c362d664 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -2734,7 +2734,7 @@ static int rtw_dbg_port(struct net_device *dev,
 				case 0xdd:/* registers dump , 0 for mac reg, 1 for bb reg, 2 for rf reg */
 					{
 						if (extra_arg == 0)
-							mac_reg_dump(RTW_DBGDUMP, padapter);
+							mac_reg_dump(padapter);
 						else if (extra_arg == 1)
 							bb_reg_dump(RTW_DBGDUMP, padapter);
 						else if (extra_arg == 2)
-- 
2.20.1

