Received: from mail-dl1-f65.google.com (mail-dl1-f65.google.com [74.125.82.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F94374E60
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 03:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778555106; cv=none; b=KdQ9dBGPHW/NruBQv/WSzMvepb8TkR9LKgVXIGWDaLihYiRgXmOvUPEXsJRQGLr2495JpWYqZrA07+rUgzB/GtxOwScsVUJRWVYFmBqbBcIuXzUNTeUs7dHiKdGdIZx0hAsAZ5rSePwQDxFRjbA6f11oQ5cqiAqvbkOoWT2UBI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778555106; c=relaxed/simple;
	bh=6RssfQ9fqaQKnWyUvEg4cF+yE8dQdz/JKxfZmnJL5g0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tdqoFChV11ekxVA2SAW9ay7APbaJqIqEEhs2prH+npX1iGtZGiym/G9YGiuNYzOAl+SDVjY0IHlIniuIubOzOiLWz/doprPAGcnDoFAZ5S4ZilPF8I7Masn92hjlRihwX97LNGdL/n9O6T0B5FtjkG1Ur8lr2uzgISQGURieI1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jaFz6z8G; arc=none smtp.client-ip=74.125.82.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jaFz6z8G"
Received: by mail-dl1-f65.google.com with SMTP id a92af1059eb24-132830d8281so2671161c88.1
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 20:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778555103; x=1779159903; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96eBVfPO2WsqijNQU6Am2kTwmNePUyhezZIteLHJWPw=;
        b=jaFz6z8GAwRUCh+Dz6HeJ5fNtDo4/ngfhhsCO5uvac5xld2BMd2fKwTtWQ+Qsq2VBo
         1hkyG0pGdjDlJ8D0CErxsS1ah3WqA6Qm43AcjiiYmpzAG3xHmc8zlNrk19YQo4/+Fn+k
         JtA71Ei1pRIgLX38MUtCNHl50IE+DUgsdZwFfK/H/UEM8UhJ4liyrM5n38FTi+3/5xJh
         GMhyA5tC00sMbur7Xtqa2O2nfhkpr07DNGYoSF4YRUh0RBX8SMKH3NsCqtOriDwm57mk
         ietp3hJ2P/bmEX1rvuyWANwn0ah3CPn5cNaRt1ITmS/OEDmhrHG1uG9P1S7WBTAfNe4w
         rgSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778555103; x=1779159903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=96eBVfPO2WsqijNQU6Am2kTwmNePUyhezZIteLHJWPw=;
        b=dAK2hB2HDID2a+rtAH142IdsHEEMTNlhRe8+ibsnMWggVw+VV14Il/LbZUJWgfcyod
         NgDoFTsZLnex6m78/l9SVHacmkMhGsDbP5ydsx9TKElmIqiXhzjsZnKlunlPLW6v6Q/y
         u49A/WXYRXpT+YaeoCqRKqIat7PRVmi2fQ3Yxeb16pFPaq2hsMtR7D4rwcWxlYQT6pqh
         7aikF6lyI+EoApqh/8VO7LEInadZpCXaybUvm3OVxIfti7ZY+jYpIW8YFEhZ5x4UD5IA
         em0hMCxKBV22SgH/5kzGPHJRkcgXIO6+jf9b7+moCexHX86WnvLeCVtepn5ygSE3Aw1k
         nAKQ==
X-Forwarded-Encrypted: i=1; AFNElJ8vHavAX4IE/luQcDn5n1sgZXBfhHDiEHUVSaP8Jn3i8+vZhRJ49VrlyjwXeIN24Kcok1TQiAu1v3DfK9gR@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6XktTG3EydOFho13cJSEybbTU7Wnk3vyH8vggKxGAGDnow675
	f2Q4Yp8ebi7PQSBZRSrqRk5bPD4dQ0XiCyjOO8AEMw9a4dCHIGIxIzjAo+ghpnBs
X-Gm-Gg: Acq92OEe6fmjd6u51kKlk7TWsfzqZ2vJMK5ka1aBr1qqFhaFMLX0m9x2ceEw5kHEWod
	y7Uc8rGgsET/hpfPXdsKPFEP99zkNq+DD9w5aMNXjtdRKZWrVVzsFOPBvZJH14T/M6lU2Gv1Vcd
	EfctNzzXWXs0cUldnMjWIgss05f61Caq6Z/WoCbduc9q9U1GlLh015n3z3q3mEGQDBDt6VKZ9N0
	YB/oOJHPjd4351y91UhUMJYEG6ga+LYEi1/VkCPngZCIU/wScfXpi1J+uNpsIynMbKZb7gc+Shh
	Ohtr+ZU7dFmH6yHQk3KwJx7reLbxsgD0hViSA42+QD4NCnO6Hmx3Uo+Dn+iJmtFPYZULwH4z3K4
	O42tBpuXKeGOdbLDAhUjGq7BQ0ZR8OXrdCV8fXcWFeG2995P52gs3HR46GAzaRZZnujbwf0g+86
	w8SAd8crNQ8wn515aMMnAGCjENxuBcnVB1qnsOrOWa+7ZbC6IjjX/f/vg=
X-Received: by 2002:a05:7301:2b07:b0:2ea:3370:6e51 with SMTP id 5a478bee46e88-2f85bb7309bmr8550296eec.4.1778555102562;
        Mon, 11 May 2026 20:05:02 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e381c9sm15858223eec.26.2026.05.11.20.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 20:05:01 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH 1/2] staging: rtl8723bs: simplify LPS_RF_ON_check control flow
Date: Tue, 12 May 2026 03:04:44 +0000
Message-Id: <20260512030445.6360-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260512030445.6360-1-dennylin0707@gmail.com>
References: <20260512030445.6360-1-dennylin0707@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace err + break pattern with direct returns to simplify
the control flow and improve readability.

No functional change intended.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 24 ++++++++------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index ca1cb58fc801..7f297f2d2ff4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -389,35 +389,29 @@ void rtw_set_ps_mode(struct adapter *padapter, u8 ps_mode,
 
 /*
  * Return:
- *0:	Leave OK
- *-1:	Timeout
- *-2:	Other error
+ * 0:    Leave OK
+ * -1:   Timeout
+ * -2:   Other error
  */
 s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
 {
 	unsigned long start_time;
 	u8 bAwake = false;
-	s32 err = 0;
 
 	start_time = jiffies;
 	while (1) {
 		rtw_hal_get_hwreg(padapter, HW_VAR_FWLPS_RF_ON, &bAwake);
 		if (bAwake)
-			break;
+			return 0;
 
-		if (padapter->bSurpriseRemoved) {
-			err = -2;
-			break;
-		}
+		if (padapter->bSurpriseRemoved)
+			return -2;
+
+		if (jiffies_to_msecs(jiffies - start_time) > delay_ms)
+			return -1;
 
-		if (jiffies_to_msecs(jiffies - start_time) > delay_ms) {
-			err = -1;
-			break;
-		}
 		msleep(1);
 	}
-
-	return err;
 }
 
 /* Description: Enter the leisure power save mode. */
-- 
2.34.1

