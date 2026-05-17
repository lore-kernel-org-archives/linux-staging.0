Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7339A10F1
	for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 14:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779028695; cv=none; b=TekNp82mOuWqpOCJVptpF4LkeXKrLq0ohY5fzAAi2+GM5KC0I2U3s/iWVtpJZ2zL+/lDIbX0GiwHtfuTfCCmSLXoImkgZfsL7y2wNa9fzelsdYXmUo+RniDxuzWUFNn+EnaquC3EUZ1/ed6rXzMEcPxMOuqjJSPFAjD74d5y+lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779028695; c=relaxed/simple;
	bh=glthZY+TeF3WuDE6JLbfWI0WRcyhTMVu3WnPkFcL84Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qlvp+rx2jTAmGox3Sq7/YFU9toBv2sA+o7/+Ww2TYvCnGXt2XvQa6OFDpyWwFmH2JgMtynIkhqLNqhLPvqubhgVfUvegAtoZqUPkQYnNJWchIvLZsLRWdOPALW/P6x8Wy8Rk2RSKdQxp/67AmoLKS4lYwn1xJfSZDKWYRlLNdm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nxbk3it/; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nxbk3it/"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-836ed29d1e5so509666b3a.2
        for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 07:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779028693; x=1779633493; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WvQX8UThyFEgL4GFs7G4uznBl9OAkQJ/lHz8YrXfXY0=;
        b=Nxbk3it/Esz6m6S5EVj3EQMtpQzvNop1FMk1qatqk1kCOXBkTKCV10+5EXZ5fPiP2a
         CoB+Qkfdr5wjfwnI0R3kLYSb2BIlymD6sylJQlVla4jYEp4z3klc2RYbZ/bNRHZwMJM3
         T64yk7WOdD6NE4b8PnRo2Aw1+eLfbdj870wxVSEaWiUhcU0ms9qVM0Ge642lnoQa/WS7
         Gg/TUOm9ucxfwl1aA6Klnpy0I6LTFcQTefRD+tVIthmteymC62dl0yf2UA2Ry+875fZI
         CFkXvK64SYux7WokBw7tENyM1PVMjzD5nTjrWzNaoem8KNeG4EhHR2Mv4KK4fn390NJK
         8BFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779028693; x=1779633493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WvQX8UThyFEgL4GFs7G4uznBl9OAkQJ/lHz8YrXfXY0=;
        b=sCGlksr2rQmbpPSG+6Pe3sf2oVsIdZvfMR08wJMz5d6ZpgNECY84MqyuFJJmF6cpCu
         i8Dctkd5FxZpL7WqLia1PfwHXm6c987rKtTJjMxp4VZRMxi/WEPAk1EJAS5nQCt9HSiu
         LS2P/PtBd5m8tAOvj4Gsi1F+E7RHcl9jL/266P48Om9c0cIiUjYTQNw525bGTtgHkz2R
         cc74OhApb6is64Y3tpJGLrc3BdOdtwWdijrzUoNTIB2aZY1Xe0uvbxS1WnXMgRfF8Nql
         Qlxhje8Rv2r7JBfSWiKYTkZ49L3glCmcr7GwFHx9jzDtrF+KxqSzEOJ+HIjf8nu1fIHv
         roKw==
X-Gm-Message-State: AOJu0YxhNG3n5Vj69czkVApsqptAxhu0tmpeAMEd/HqqpytOhCtWKW1d
	l5yVbYb2uI1EMTLCSomWTziv0Saaf7CrymGM1RWhCMF2VtrmeRJpe8rS17ias22M
X-Gm-Gg: Acq92OH590qdD2r2liGqoJLQHMXJ/mdf6dqBxmt23lin8WMJegzeAOWwD5ahGaV66a8
	Gnmkv2Cmay4RCn5ITyxWr6yLNRyMu+9D02rzckGyBBERYMmR6rRMgSg3XNHSQsnp7p2oIaYsww8
	mb5N5C2rINAWPkxUqA4dxRsKSDc8NLArxlictOlj2r/VJ05mp5nY+ZI/8kjztd8xa4TlpRN2AbW
	PYxX7cG2+u8iFR/52uOvtgYcA2TQEvY8VpVgH7AA8e6IJixV/xAJBqL/ImpPdf7/XbZscqMkqiL
	XuEDPt+KC30WTOsKl1EdRgDpYP5QUpUmgjF4AzTzK/TQbnN7fgLbh02EtvZPHpKzvkYZgTpmm2w
	dUCEVrKB7gLxcghXBljFTytYjBs7omE21J5AzZTkunGo8Of6ALJNwR29CfoKscfW9BCGwufpnZ/
	dnI6/ttG/U8A7AbMMbvlknfov5bjhIXtlzgtoNhFimGp7o5NSRw9B1pH7VL1vZOMY6IByESbIKo
	n0=
X-Received: by 2002:a05:6a20:6a0a:b0:398:787c:d2e4 with SMTP id adf61e73a8af0-3b22e7536c1mr12623083637.17.1779028693399;
        Sun, 17 May 2026 07:38:13 -0700 (PDT)
Received: from localhost.localdomain ([115.242.226.50])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f196647aasm11036887b3a.5.2026.05.17.07.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 07:38:12 -0700 (PDT)
From: Moksh Panicker <mokshpanicker.7@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Moksh Panicker <mokshpanicker.7@gmail.com>
Subject: [PATCH 1/4] staging: rtl8723bs: reformat rtw_efuse_read_1_byte() signature
Date: Sun, 17 May 2026 14:37:20 +0000
Message-Id: <20260517143723.13281-2-mokshpanicker.7@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260517143723.13281-1-mokshpanicker.7@gmail.com>
References: <20260517143723.13281-1-mokshpanicker.7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reformat multi-line function signature to a single line to fix
line length and coding style warnings from checkpatch.pl.

Signed-off-by: Moksh Panicker <mokshpanicker.7@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 803a608b74fa..987d05816c5c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -41,10 +41,7 @@ rtw_efuse_calculate_word_counts(u8 word_en)
  * 09/23/2008	MHC		Copy from WMAC.
  *
  */
-u8
-rtw_efuse_read_1_byte(
-struct adapter *Adapter,
-u16		Address)
+u8 rtw_efuse_read_1_byte(struct adapter *Adapter, u16 Address)
 {
 	u8 Bytetemp = {0x00};
 	u8 temp = {0x00};
-- 
2.34.1

