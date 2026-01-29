Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1902328F50F
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 13:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769693064; cv=none; b=VXmVcTqqfbot+aUKudadK0vvp2K9P2KVT2Y90Xr4bYTYgI4DgcYviYEARyAaFoa9iSiF4BFGoWcrBd8T1fSJRJtmrZFP0kR4Ei+FkwompZIBr689I7VELlyyBtLp62OqhW8kedW9XU4FYm46Fqfh9WbmD+iIKmF3j+3ZMW61T2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769693064; c=relaxed/simple;
	bh=CoBTJI+JJqaoappzWQvcsHD6mJ/LATRC5Pew2Bil0ms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aRk8bb9mDL5+QvQQNGLi0tVY0STyE5qx7FFpD7ixoOnXRCIGLNbNNDkH+g0Za7wBI9+aFuTPWQMEYnFMcrp/OB5xdxkq4bgIiyvBwAXIShAE18iDLBR1dZJ3D5DodwVuA9tN7BA/qKwx3AHKHbgRb0dY6KWh08m9uB69PMk+GyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ew4X6FH6; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ew4X6FH6"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47ee937ecf2so8162125e9.0
        for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 05:24:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769693061; x=1770297861; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MEq21BVwFHS5FNpeSTGjaMWvoud1JJRBiNNr3IFX3lE=;
        b=Ew4X6FH6n1/sYZu0ZPvFyp4j607ne4l5oMJs2v0ZtUh+CYw1qQBKg7ruEZ/KbJh/D1
         +PlwFvDhNg0x11s5I+NTAGV4BXeRn+ybEuplyQ92q9HMiTzWSo0+zw7xI80OZzksHJ0I
         67bSRRRC4vOTMeWdhDk9TSO/t+d4PF7kPBfDiM557bow5PMKDu3yGM5d7t79tzZbI+7F
         qWvExg6o/Mbu7NQepqma7X5HF4OTytbLtcjQZBtIaUgpQqqk6VqZF9l7QWRCWg0HfyN0
         wTMIL/GhUdD0dJ4MzEdDUKAM9UtJsAoL3XEHZPTzElu4tGN9sIgw45GFDbkKyFRBc8Eu
         MZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769693061; x=1770297861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MEq21BVwFHS5FNpeSTGjaMWvoud1JJRBiNNr3IFX3lE=;
        b=OpFPT3BOsGE+VPibODjzHt9/NX69yB6n+zPT+MtahQgD7G2coq3KgOzEZpcvl5mo3w
         HiMDs8gEUk7dtpfWUMp4FLKo5v++sDv01IRqWOC6QcZOHuFa5c31FMCgC+5dXcuBCZ7s
         GY3lgV9AJMFSEBTB2rNaJk4cMuoCthoottXLmmTksJPDPVXjtFnny0iT0P85tS3iQagl
         MYKDh6BJWykAZqgbLMQ44Zry/VRcve2Gac5bGaczpgV6TR98Fz1BXBx7IfFVY9dM9OtS
         d49WM14oIHFKy/JxnQlBWPs4NaEsSsh63bMYBZ51uiC4VZVYO4KPv0cgXY6tda4ExkZB
         iqbA==
X-Forwarded-Encrypted: i=1; AJvYcCXsVwphVGiWUfP+2s5/StgtRiyia6ckY7AQDCZBPl7RvHc5NX84cKphEAy/YaFAf76NOypQmzFj3Ohe/b7b@lists.linux.dev
X-Gm-Message-State: AOJu0YwP0JIFtfSEV9p4WPiY+rHtOrhT0y/5KV9a0qccesXeGJqg3z6Y
	afK60P0sROll98ezeI72HoL5rS0rSRcDXqXEc5WZX+RwjyyhJRyK+eM=
X-Gm-Gg: AZuq6aJEvpqmVlDDONJSxyk9G/o2n/JEYXGSshRVlZBpMtROZPjbPqetNL0QzFRCyCH
	ehyvf/vdua+ATMFQK/mxGR+bYTgH2WfdWFoOuAGgruV4hOseMKBHBTglxnXLCj1g/uNsCfwgy1Z
	Zy/c66JPJAQ0TpSFAI/HsvDS05oeCduaBqveSCTw3QsW12JMGhhHdQLli5wClcZdMPE5toGy3lb
	y5lZzH1ajEF7hbXUL0SMGHL+u/Vz46/PWm65AO039BHJSx12z8Bk392VLiyNDJNBGV1yrjKbnkR
	SSxfCZzXtDwBwSEwd4UuXKuTtFJ7WnEbVkfZ6YGEVa21QS60v7fqTWQkWacpBNAfuobYYRn2ObV
	CZ5/X1KnzRldkK13EFsdnlpboEgVvCNWwkrAb9i6/vMYJHsJ55UuG3Si8pLlTEFdYu3TZypWGsQ
	ha
X-Received: by 2002:a05:600c:1910:b0:475:ddad:c3a9 with SMTP id 5b1f17b1804b1-480829b1c19mr42090625e9.13.1769693061388;
        Thu, 29 Jan 2026 05:24:21 -0800 (PST)
Received: from LGPC ([31.223.131.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066be7404sm217492315e9.1.2026.01.29.05.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 05:24:20 -0800 (PST)
From: Luka Gejak <lukagejak5@gmail.com>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <lukagejak5@gmail.com>
Subject: [PATCH v2 4/5] staging: rtl8723bs: fix out-of-bounds check in rtw_restruct_wmm_ie
Date: Thu, 29 Jan 2026 14:23:51 +0100
Message-ID: <20260129132352.14615-5-lukagejak5@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129132352.14615-1-lukagejak5@gmail.com>
References: <20260129132352.14615-1-lukagejak5@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a length check before accessing the OUI in WMM
IE to prevent potential out-of-bounds reads.
Use memcmp() for better readability.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")

Signed-off-by: Luka Gejak <lukagejak5@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index c4f58106b3bd..18a70879f78f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -2000,7 +2000,8 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 	while (i < in_len) {
 		ielength = initial_out_len;
 
-		if (in_ie[i] == 0xDD && in_ie[i+2] == 0x00 && in_ie[i+3] == 0x50  && in_ie[i+4] == 0xF2 && in_ie[i+5] == 0x02 && i+5 < in_len) { /* WMM element ID and OUI */
+		if (i + 5 < in_len && in_ie[i] == 0xDD &&
+		!memcmp(&in_ie[i + 2], "\x00\x50\xf2\x02", 4)) {
 			for (j = i; j < i + 9; j++) {
 				out_ie[ielength] = in_ie[j];
 				ielength++;
-- 
2.52.0

