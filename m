Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A052327A3
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 00:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773016855; cv=none; b=C1zm3SQE5fwquojd7GpqPNyyrDkCw0q/gUhiokjFV9e1XauHxDIfqs4XxuBNu+sFFfewLBBJ9EycTmKToTdazaOS94QKZkWHVz7OPh1jfpIurfR9lbLL+HVG5774T4jsc+8Pv9jnXriQ4ZwMsNLjlG8mnRwua4za2qHTrlh/XAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773016855; c=relaxed/simple;
	bh=34QI3yJOgIfkFPQlA51hTiaTQBdiTlHA/4P7Ax04Sj0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WVe/7vGKOGaJNMD6gl0PmLdXxu/XKvXKwlVG1uUTa6IMy+j3JLvlhFQozUmnuQ5VHB4O3SNphJbXOfa3UMLaLCM2NUaRDiLLHhnD4RhExBjVdj1svA02WGrgu5s9Noc6T1YrNaXtejycaFhPhegs/LIbgtgqsh28aCFqSdJikkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efuEE5fp; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efuEE5fp"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-56afafef7aeso3075099e0c.3
        for <linux-staging@lists.linux.dev>; Sun, 08 Mar 2026 17:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773016853; x=1773621653; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s3LGqnttdpwE8kLrpPKQKPPaUewopBmv22A5dXb2bMo=;
        b=efuEE5fpLR86frGez9eniEUpF7baZzk7AB+yIbVxFgVRHJcVBk0nAcSjhmnjS0OT6t
         nX1XwS09BblZsYa/sX6e9O4ZOcRjojAnaR8GjIydYepyYW8bhSY5Ub0vK3ACxx1Z+BR9
         aUJONqwO2hzoSEYEJmjGkvWfds9QegTBs8asQQsf+tOZ25fANNzrlS9AEJQSVbEbDHqN
         wHo9N0Ud/sZf7vRyc9iokXniVdqWzK6afTTQGsN5AwGS3B16eEyA+ESfBhlLrJ9UUeLw
         4RbrLvkgcJ5PVLlfRpB98xqY2lJ3/yzagHCR0JhPcgZA9NLGU9SBU58jsUeepUITO9+P
         17RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773016853; x=1773621653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3LGqnttdpwE8kLrpPKQKPPaUewopBmv22A5dXb2bMo=;
        b=CVEZZW5DZ4p6G1SOBIELNZCwq4dnRI+f7Jeis+cLFRNyhClWxcSLYsTGg2XU/ZznzC
         Oilv2FPxOP3r9K33CVfsb0WBdjo+Ck+/E0Jf5hIbt8GkO/94vpAiU74MbwZMFGvutWRy
         yHvMqUZLenEGopi+k7nHv7YP8YUZGvqY+sScj3mJW52RtL+a1hOZaaq2QDS47uT/ZIIU
         DpVVdcOesGx3Wpo9qF++AFV6q8GQhv/b1292CJphA1M/NZL+1kMDb1WyfxN/FKqPIL1V
         l3vOpkvYUxqVBhl1c+wS5tM1gXBZxoYJk/nxGTSlQaSgZyQn8pPKrIeHc/K71NVOBSCs
         NXXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrb6KQWtKFB2klLM9Af8gC/ZLZ3tvPVPCpDNetaHkrB3QxV/WvACv/HDw3pojKcecvnRdHVkt23GVbq1md@lists.linux.dev
X-Gm-Message-State: AOJu0YxuAwz5mOQpAnYwAFfgADD1IPDGotM86VKPjB463GnwGkWbN4pv
	kL2lsA5Ke3jxtxK1gLUMqw/4tNR6U1xlvSBX3cAOplGjjTyMBO0Er4jN
X-Gm-Gg: ATEYQzwcZRDmAmz3xRqEGO2Jtn1shfn6ZD0rzuRrtN3687BbXLTf9HG3guugx2m0TvH
	M7DMMCGrTL5Ziutm5vl0zLY5h9kYsJ6pUQnMUYlOVOYJ1ez6rkdCHW+cPmnR9qUxxHjMVsCoTJO
	QtNOjgKA+FsTmzQCzKdQ8jBW8JnKLTBYaCFyRWndiEWiSl7p5f1dUlf8Cl2PRiX8C8CxjoeIm6t
	CDeNc226vf2g8siZodkFap9Gudxjc3Hm7OWdzBE5wxn87WW1qQKSslMJrNXAW7YZ9e3/u9s9ppu
	exKVlnwaxcZ8/zed2M3HdcbEaxrCJJcsqVptWZKoHoE854vs/mzr50qQniOxyZA3Q0GqVSe8Uny
	r3XkgiwuZo5glyk7H+VVxtDC00q3A9E8Bxozfismyedh7wXHXF758i8+FZYcLA7Qyb8CKBZU6i/
	GwEMaF4CUjVE84mA==
X-Received: by 2002:a05:6122:d8e:b0:563:618f:b7da with SMTP id 71dfb90a1353d-56b07f486e1mr4237788e0c.19.1773016853579;
        Sun, 08 Mar 2026 17:40:53 -0700 (PDT)
Received: from horus ([138.97.160.237])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b09b6ac44sm8926121e0c.19.2026.03.08.17.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 17:40:53 -0700 (PDT)
From: sluisr <luistermc789@gmail.com>
X-Google-Original-From: sluisr <contact@sluisr.com>
To: gregkh@linuxfoundation.org
Cc: david.laight.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sluisr <contact@sluisr.com>
Subject: [PATCH] staging: rtl8723bs: replace msleep with usleep_range
Date: Sun,  8 Mar 2026 18:40:50 -0600
Message-ID: <20260309004050.19339-1-contact@sluisr.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch addresses the checkpatch.pl warnings:
WARNING: msleep < 20ms can sleep for up to 20ms; see function description of msleep().

It is recommended to use usleep_range for delays less than 20ms.

Signed-off-by: sluisr <contact@sluisr.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c      | 2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index abb84f8ae..f6293f049 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -214,7 +214,7 @@ void _rtw_free_evt_priv(struct	evt_priv *pevtpriv)
 {
 	_cancel_workitem_sync(&pevtpriv->c2h_wk);
 	while (pevtpriv->c2h_wk_alive)
-		msleep(10);
+		usleep_range(10000, 11000);
 
 	while (!rtw_cbuf_empty(pevtpriv->c2h_queue)) {
 		void *c2h = rtw_cbuf_pop(pevtpriv->c2h_queue);
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index b1f20aa81..7ac013519 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -5833,7 +5833,7 @@ u8 chk_bmc_sleepq_hdl(struct adapter *padapter, unsigned char *pbuf)
 		return H2C_SUCCESS;
 
 	if ((pstapriv->tim_bitmap & BIT(0)) && (psta_bmc->sleepq_len > 0)) {
-		msleep(10);/*  10ms, ATIM(HIQ) Windows */
+		usleep_range(10000, 11000);/*  10ms, ATIM(HIQ) Windows */
 
 		/* spin_lock_bh(&psta_bmc->sleep_q.lock); */
 		spin_lock_bh(&pxmitpriv->lock);
diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index 1c9e02732..ad6c375ba 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -420,7 +420,7 @@ s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
 			err = -1;
 			break;
 		}
-		msleep(1);
+		usleep_range(1000, 2000);
 	}
 
 	return err;
-- 
2.53.0

