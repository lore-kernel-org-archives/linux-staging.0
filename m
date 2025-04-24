Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007DE2918DB
	for <linux-staging@lists.linux.dev>; Thu, 24 Apr 2025 19:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745524604; cv=none; b=BlmKh+NVWO8sgBxZkYM96ugG2/oRE3UlGk98PjA4Gz0WoTp+myflC/6a0+j2Bty+WRm9A64DtpgeU4265LiivQMtVitfmDAfL1W++Zq+xMYnLxNDshqwMyODZiAkFs5iBVX/5NIV9dtsYLFrZZ73BfG9ZeVYcsb1BwWdMdf4Pr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745524604; c=relaxed/simple;
	bh=c4CUo+/JylgmaihWgYUtHXSPoEaVeXvdhre1BrOseBc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VdZyJVGIPylx5HCKWyYC1aTqDaB/qxdORR7woDgKMzGFZBopcGrpOYmDEvgqk1qQhpGIJ90yk143vcZtN/Jz9UnkYJi8PgysWeJ46VTHzY0TumAQASB/BIlGsbT+PxU9YwXtyQhWlBJlmDbKpAp6n/PBDvjD6urGoJLbyzzIf5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+LwBA2M; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+LwBA2M"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfebc343dso9944155e9.2
        for <linux-staging@lists.linux.dev>; Thu, 24 Apr 2025 12:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745524599; x=1746129399; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LNsyCS6OEhFOZzOuI2mbWi5oCCOoIo6/OBcXxx1IRf0=;
        b=B+LwBA2M9EbxRV+N3S2T5d6Mw4MD3sEHlEXpNkiTq/obDFw3DlvuPn34ng5021tXRP
         e7LInFFh8A507fGjr5wU7q343M8LxIYLZB5xZqy8cbpcwoR0zX9OYbamYSUgaDN1E53K
         DgKurQp0Q2Ql9RZgpvtxk2Q40tb7TtOrH6S7fKkujfA3hb+rHtT9P+gIzBu3W5lNyvMT
         Yp/tf3Y7mgO1al4+0HMggY0Nb/EArkPgKY7yZvHqb006W+uTy0U8deKRFFViKcXEItll
         2XaSUXEfkfElfLaIIfcM03sLfEQVnjNDBMuWpWQaDA8lCdlISvdz0lQnuzd2fvuOPCKu
         YtBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745524599; x=1746129399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LNsyCS6OEhFOZzOuI2mbWi5oCCOoIo6/OBcXxx1IRf0=;
        b=A9pBt0yi1U0bJhedt8R+TP8TP5VrMW+lNZY62TNDMsXRA2Qrk5Zox5s62cDORc6Dwe
         yt9Z3uAF8SAjbjeLwcvRYOo/NkrJof71K2m1cwwmO4bu39w67daf/f43kvQfZ4v0touA
         xjXvTUIug8BZ+daOXH/y266Z6iRFO2xLn0PiMqoKdpPihfGPaZqkKBL4KAaVMosV1t9m
         ISO0HZIlZrAubB1hN0VVrTfDoPgwvMFbvUdzIrYk3GLT78T6jGGevfLNWeCW2ae22uWw
         rgAGF64d+or/11s43cZcsQ8uPh/IF+YrJFZDexo1o3zL0VEcOvWgA4XNhxpXrnkIrOab
         zQlA==
X-Forwarded-Encrypted: i=1; AJvYcCWfInUPJsep3oOc+tCZwImCiOeChyQVOtxoWxPzfKj0HnvBjuT9+54xDtIHamLFVuiL+Y6R9kHIn/uyInSa@lists.linux.dev
X-Gm-Message-State: AOJu0YwJVzI35X0RdlCtw0pZHLdip7up3pwuzRmxTeyMn2DKG7TdPqgT
	kWK/SOq+NHL+HG/C/uzQEcOEgWsPgPQ/seIq/Vkbqh7o6tJ22K+5LZfmJg==
X-Gm-Gg: ASbGncu9z1szKmZu3wSr4nfoq9rn/appwiQNvO+SN8hFEYFA5CZZzQfM5ly0pTn78eY
	BQkQp1ZlZfBLHRxQTNTS1rCbt4jOtRfyKZt371XxwOgeRxB9nDf4MUZGihbn5XjZRf/Q02dQAjD
	09NBwtSdvmeCiOz/aR8YYZggMwk1tRuf7zb1VhA8AUWuroepvWG7KlpXzaCcwgPnBdiu9ToJEEG
	bcZlgAlG99LsgVgg+eCmRPk9FcSZpVj7uU8pR5x//pSkGLcvzAg7hM3XzhRb4YYvvpqeNGb6ggk
	ObJPzjPW1cQmGv/0LRf0efGJpcYceHbh4AkZNw==
X-Google-Smtp-Source: AGHT+IHFi0zUQkJRZ2PdmOlKL/x6paZBuwZj4y+qAl3g29wVN+gHx6m2fnhq9wVmqRu3TlUGrX43iw==
X-Received: by 2002:a05:600c:3496:b0:43b:cc42:c54f with SMTP id 5b1f17b1804b1-4409bd18487mr40086235e9.14.1745524599090;
        Thu, 24 Apr 2025 12:56:39 -0700 (PDT)
Received: from pc.. ([196.96.160.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d8842sm32385865e9.31.2025.04.24.12.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 12:56:38 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: gregkh@linuxfoundation.org
Cc: julia.lawall@inria.fr,
	karanja99erick@gmail.com,
	philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] staging: rtl8723bs: Replace manual mutex handling with scoped_guard()
Date: Thu, 24 Apr 2025 22:56:25 +0300
Message-ID: <aad62e2a06ae0a24c07a83649fd6025718849f78.1745523325.git.karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745523325.git.karanja99erick@gmail.com>
References: <cover.1745523325.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace explicit calls to `mutex_lock()` and `mutex_unlock()` with
a `scoped_guard` block to manage locking automatically.
This refactoring improves code safety and clarity by ensuring the mutex
is always released, even if an early return is later added.

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 946511793c08..d018d8e0bf4d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1404,17 +1404,15 @@ static void rtw_lps_change_dtim_hdl(struct adapter *padapter, u8 dtim)
 	if (hal_btcoex_IsBtControlLps(padapter))
 		return;
 
-	mutex_lock(&pwrpriv->lock);
+	scoped_guard(mutex, &pwrpriv->lock) {
+		pwrpriv->dtim = dtim;
 
-	pwrpriv->dtim = dtim;
+		if (pwrpriv->fw_current_in_ps_mode && (pwrpriv->pwr_mode > PS_MODE_ACTIVE)) {
+			u8 ps_mode = pwrpriv->pwr_mode;
 
-	if (pwrpriv->fw_current_in_ps_mode && (pwrpriv->pwr_mode > PS_MODE_ACTIVE)) {
-		u8 ps_mode = pwrpriv->pwr_mode;
-
-		rtw_hal_set_hwreg(padapter, HW_VAR_H2C_FW_PWRMODE, (u8 *)(&ps_mode));
+			rtw_hal_set_hwreg(padapter, HW_VAR_H2C_FW_PWRMODE, (u8 *)(&ps_mode));
+		}
 	}
-
-	mutex_unlock(&pwrpriv->lock);
 }
 
 static void rtw_dm_ra_mask_hdl(struct adapter *padapter, struct sta_info *psta)
-- 
2.43.0

