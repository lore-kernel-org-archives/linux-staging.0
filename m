Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECFFA23779
	for <linux-staging@lists.linux.dev>; Mon, 13 Nov 2023 19:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="FA2CHrkC"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-565334377d0so3766287a12.2
        for <linux-staging@lists.linux.dev>; Mon, 13 Nov 2023 11:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1699905176; x=1700509976; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENLdxhSBNg8SuBVApZdY1dC55L+cF5EgmlEgQ0l3pHA=;
        b=FA2CHrkC6R+fn95F2FxXpgkFPhlR2BR7N3QQPKI5jJwKT/pJK4GK3HkYorkQnTQTLj
         nh0IMDexdO5f05twM0XBGG4Y2LWBCYwpSWELF5mNaMp2xFVPRigl54YwwihlRfA7N3wc
         VoEFmPm72j5vT6AYuIM42GBjBcziH16MmN75L8XeMQq+ey354thfD6cjy6J9slABlg8/
         89L/f5IXFNLSUCUgDnty3L+U5dEWr+IjKGvd9aoK5XSIuu6aEPKhW/l/o8dKjj3OmKub
         xu3k0tNpPHcgn6WLdDg3zcZW2ep61hDwgfosrU1naOP94P748SEjB+vIW1hKPwRhVuQk
         a66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699905176; x=1700509976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ENLdxhSBNg8SuBVApZdY1dC55L+cF5EgmlEgQ0l3pHA=;
        b=Jd2IN50LFZ8ZvnELWXyJHXtWKGRJIPxLxI06gkZQAHiLfatbIlmH4YWX6KV1+n9Gtp
         LfKY0x08ml3L2+pKrgdw4nJ0iok508XuhS8uV8cVkGzCFC99CjszLay3/EeXcjbZfOhN
         Mm4hawIoclZsSR/JbtaJufmC53LQvlp9gvrrGQTAUzRDaI59lr76pFo6mjqYJAxDy3di
         Bl5ba2HkU5UiGTIt3SWAiN+fcS8n40PRUN5GuJ4M2EI0tJxBQAG6yDtFVlBdeC0QD85L
         ZdFys+N+nUiS0Ng6Pf0nSMRQ+kWLC3QEXh5img1AS6lj8JInwG0NnyJ74Q9cucmQUClq
         jw0w==
X-Gm-Message-State: AOJu0YxYlDrLSoGwucmwAxcR2TxuTUY/Ri1yirhE21zveoO19UAuI3hS
	smvxBWcEuDMi6LnBb0WGmWbtug==
X-Google-Smtp-Source: AGHT+IE3RbDYuZkrueUm6r3KpdLcuEAtVYjitEdyMsjoi2L+H/t40Z2To2M7tJtBGaYaGMDqlQGuZA==
X-Received: by 2002:a17:903:2448:b0:1cc:be6b:80fa with SMTP id l8-20020a170903244800b001ccbe6b80famr315322pls.12.1699905176423;
        Mon, 13 Nov 2023 11:52:56 -0800 (PST)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id t7-20020a170902bc4700b001c9d968563csm4395815plz.79.2023.11.13.11.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 11:52:56 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 7/7] Staging: rtl8192e: Rename variable bDisable_AddBa
Date: Mon, 13 Nov 2023 11:59:10 -0800
Message-ID: <20231113195910.8423-8-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231113195910.8423-1-tdavies@darkphysics.net>
References: <20231113195910.8423-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bDisable_AddBa to disable_add_ba to fix
checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 2 +-
 drivers/staging/rtl8192e/rtl819x_TS.h     | 2 +-
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 2 +-
 drivers/staging/rtl8192e/rtllib_tx.c      | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 3502f27342e3..b52b42ac0fc4 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -382,7 +382,7 @@ int rtllib_rx_ADDBARsp(struct rtllib_device *ieee, struct sk_buff *skb)
 		activate_ba_entry(pAdmittedBA, *pBaTimeoutVal);
 	} else {
 		ts->add_ba_req_delayed = true;
-		ts->bDisable_AddBa = true;
+		ts->disable_add_ba = true;
 		reason_code = DELBA_REASON_END_BA;
 		goto OnADDBARsp_Reject;
 	}
diff --git a/drivers/staging/rtl8192e/rtl819x_TS.h b/drivers/staging/rtl8192e/rtl819x_TS.h
index 289314de1193..742f575ea637 100644
--- a/drivers/staging/rtl8192e/rtl819x_TS.h
+++ b/drivers/staging/rtl8192e/rtl819x_TS.h
@@ -30,7 +30,7 @@ struct tx_ts_record {
 	u8				add_ba_req_in_progress;
 	u8				add_ba_req_delayed;
 	u8				using_ba;
-	u8				bDisable_AddBa;
+	u8				disable_add_ba;
 	struct timer_list		TsAddBaTimer;
 	u8				num;
 };
diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index 867889dc4fb6..41c1e768348a 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -104,7 +104,7 @@ static void ResetTxTsEntry(struct tx_ts_record *ts)
 	ts->add_ba_req_in_progress = false;
 	ts->add_ba_req_delayed = false;
 	ts->using_ba = false;
-	ts->bDisable_AddBa = false;
+	ts->disable_add_ba = false;
 	rtllib_reset_ba_entry(&ts->TxAdmittedBARecord);
 	rtllib_reset_ba_entry(&ts->TxPendingBARecord);
 }
diff --git a/drivers/staging/rtl8192e/rtllib_tx.c b/drivers/staging/rtl8192e/rtllib_tx.c
index cee3b8855c0e..1da098f5b84c 100644
--- a/drivers/staging/rtl8192e/rtllib_tx.c
+++ b/drivers/staging/rtl8192e/rtllib_tx.c
@@ -300,7 +300,7 @@ static void rtllib_tx_query_agg_cap(struct rtllib_device *ieee,
 				;
 			} else if (tcb_desc->bdhcp == 1) {
 				;
-			} else if (!pTxTs->bDisable_AddBa) {
+			} else if (!pTxTs->disable_add_ba) {
 				TsStartAddBaProcess(ieee, pTxTs);
 			}
 			goto FORCED_AGG_SETTING;
-- 
2.39.2

