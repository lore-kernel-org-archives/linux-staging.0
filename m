Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CCC132AABC
	for <linux-staging@lists.linux.dev>; Sat,  4 Apr 2026 11:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775303327; cv=none; b=GShWlwkBTwxUsTTlI8qg6F0zxuDL+nZrjW0GKjPUxs8jSmr7jN1PC6CR/vHzLyjZX9r4NPTW6JdeeorqSA8OR2j9GQd5Z+7Fejr+IBp2N9jNxZsnTZcAlog8ERUSaIRidPQLtpYfwkZLsa7wXpGZv3qEuMmqiFZ4XSvZqOggrqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775303327; c=relaxed/simple;
	bh=BDifA5c2RFJUGiNQn8ZWtnUM0h5Z1lBr70IR4yqPRS8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AeFq8FMSu28Xbb+4cVcKDQxJczp/JNmrUTSt9cIioxCmUUpWJmJkn15+X7AWfwtBci6m+wB/Uhfc1RyyeUC5LqxL79v3kfJVCtSFzeRQg1Sw9Ou74gIzcOcGmssc9QX4w5RWTSMheMnyLtCoMFNy7sVqiOLvtCGBzG3lF0uWylc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EhXP8mvI; arc=none smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EhXP8mvI"
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-1273349c56bso3214413c88.0
        for <linux-staging@lists.linux.dev>; Sat, 04 Apr 2026 04:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775303325; x=1775908125; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Yjzv2X8oQtjfk2HKBIUwmo2lZuUMCre/Ugsri2fbJc=;
        b=EhXP8mvI6JI+tihiNiWK/K7JK0fM7oL3CZ0M34s/N4XpTz80+3BNDWIuLpgi4callS
         MxBeYfbUKWrrir3ipYSuJcaeEkullz2Oo1SC3suWgoqhEXYfOC8N1NQICp/YoNoKlX3z
         QpQAjCETSF1tIvzLaCBX/ucQpzd4EAeWn4DgCd3fdF4IkeGQUquoLpprd0ln4MKAD4tw
         W+n/Xeaym415z4WtjDlV9ZFRpi7FHmt9KyhAI1DNVkZSypPH8Gln09EtVhrn6w/ILvfh
         9nGklL6Vgur2Scy73Y3JNaz2tnpVHzJPFx4ZR2lUP1IxhG3pPXCYHkRXAsnQ9FXIxUTx
         9v6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775303325; x=1775908125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Yjzv2X8oQtjfk2HKBIUwmo2lZuUMCre/Ugsri2fbJc=;
        b=GMcCKH5IkbtldE60ptG68oDVnUwPTan/nE3sNHtToojtoYQC2CrJUOGjbE71VFm/5G
         6WyAMHurJF5F2sdhJnGWjsV1lx0vtQZYbhKPj23+Q42UYl2fvnkpMFcIVs/DYyLc8tN3
         x9/1TfW4QeEDj+ph+S/Gj+oiYUlKW/zJLzeMLRjOu9j6BI5r+rSJ5DX3gZF7iH9pQa5i
         36Db7a7l+jkVwpAJzg7+uFQGu9Dl2X6BBd+X302ebbIXrYG+QSyVkEg8fDzvJ+ltvcDS
         K01YnPlq4Xc3lBedO0z4lhYscs9GRMQ43McXSbx2bfflDFYV5icpeDU0AFeM3q9o+iMX
         vl7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUozkGX99DLfwiF2Buu1x6TTqYv1GmFi0LSfUnNwtQmcDcLlE0Jm4L2dDKJqN2bJmBzC4GHbJ7j/pnnT0yX@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/+S8vgOUx+1nQOxuoOImzlGaM6yaw/c238lDTX5vrHko0CtPI
	UgE1bwZrTZCV6p22Cnw42k6XgXspZSpp/7gpYz6qRdLY4v5wlc/KfvUN
X-Gm-Gg: AeBDiesuR+VF03YC/+t7PAxvqUxq3+w38Rj6EnHfsifuaWUFWCWlK/xz5U+ZDUkqNAz
	581vEnn9s+4kiumaosH/4MLYvnFdKCh3f+qb5+N+sG66Hx2Fc9PF8ZQybMMAa1/xOvpkjHyT0ql
	NBoXRto97eUYnwX7FWS++m5rkH26mhPUqcx4eQ8PukKrYlDKVHiK4ZZXOiqI1pjoLMNAyy+x1JH
	kjwiF4Qm6RlAZ9UfgD3fQU9QLgpOQVPZ+VfKA621agScZJaLKwZJcJ6Aucv/ldNrjuo3mjJptrA
	aEboCwqySYyL8uZRBP8/o1pOb6uAQP3m70wWqw3kFHKEEvenf46DkTnKq4O4N4OcoLcIYYBVKaq
	fvAWukcEn5ZX5rs0RYt2pu7bhEWsZ9h2Nadbdy/9eIZc1Z3CH2IVKOENWjmKE9CHXtHHRJIFsyI
	S0cfvthidaulG/qiTPB1dRUCu8Tpw0eW1uZLzylZi4ipeVefN5EZX3bWM=
X-Received: by 2002:a05:7022:6713:b0:128:d3de:c9e0 with SMTP id a92af1059eb24-12bfb75e341mr2667566c88.26.1775303325176;
        Sat, 04 Apr 2026 04:48:45 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c05a7beffsm842785c88.15.2026.04.04.04.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 04:48:44 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove redundant returns in rtw_mlme_ext.c
Date: Sat,  4 Apr 2026 11:48:02 +0000
Message-Id: <20260404114802.11242-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant return statements at the end of void functions
in rtw_mlme_ext.c.

No functional change.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index dad1d95bc325..335f5b2c96f0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -2417,9 +2417,6 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 
 
 	dump_mgntframe(padapter, pmgntframe);
-
-	return;
-
 }
 
 static int _issue_probereq(struct adapter *padapter,
@@ -3877,9 +3874,6 @@ void site_survey(struct adapter *padapter)
 			issue_action_BSSCoexistPacket(padapter);
 		}
 	}
-
-	return;
-
 }
 
 /* collect bss info from Beacon and Probe request/response frames. */
@@ -4414,9 +4408,6 @@ void report_survey_event(struct adapter *padapter, union recv_frame *precv_frame
 	rtw_enqueue_cmd(pcmdpriv, pcmd_obj);
 
 	pmlmeext->sitesurvey_res.bss_cnt++;
-
-	return;
-
 }
 
 void report_surveydone_event(struct adapter *padapter)
@@ -4458,9 +4449,6 @@ void report_surveydone_event(struct adapter *padapter)
 	psurveydone_evt->bss_cnt = pmlmeext->sitesurvey_res.bss_cnt;
 
 	rtw_enqueue_cmd(pcmdpriv, pcmd_obj);
-
-	return;
-
 }
 
 void report_join_res(struct adapter *padapter, int res)
@@ -4549,9 +4537,6 @@ void report_wmm_edca_update(struct adapter *padapter)
 	pwmm_event->wmm = 0;
 
 	rtw_enqueue_cmd(pcmdpriv, pcmd_obj);
-
-	return;
-
 }
 
 void report_del_sta_event(struct adapter *padapter, unsigned char *MacAddr, unsigned short reason)
-- 
2.34.1

