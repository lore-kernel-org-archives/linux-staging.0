Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD0432A3DA
	for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 01:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775785353; cv=none; b=tx1umrM7pmTh5Z65xbgNIwOqlMlN3rxKJL1E0FVgByunjLisX37eWNAff5FomANqW/rbHilp72tVoN8WOqVLuMU5f3euK3idekGARA2Nxo7dTH2leQmmmYVNPs3pupg7P+qPB0vy+iep87kDKzNDnIODkypOhWHvMiLiLojRaNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775785353; c=relaxed/simple;
	bh=s9jApD0lfF3vt6RYTCzIWo7CH7oRAkr4mqoTU57xPvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZxufAq9A62Um6jPm43S/OTbyEiAEG1xoHn/U5rkz4K+dB9CjCO5ggFektn+arkqlR3UO1RKJrKUvuaMvz2/2gbAc6zSGdZFcukOogFvpjm0wgZ9Ecvx/0aPU4aGx7NlRH82ubGSvKS1SVbR1dNbL8W86JKBNdv6h3b8SOiV3woo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SnLKBC3c; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SnLKBC3c"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-356337f058aso1137290a91.2
        for <linux-staging@lists.linux.dev>; Thu, 09 Apr 2026 18:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775785352; x=1776390152; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vaoRd4mR0vmNsDr3UZXlc4hkIyu2gtCwDoTyFky+mvY=;
        b=SnLKBC3cYmglf6wLuKwqT9rffORJTuRddpED33nFio0r2z7oIIiFpxTyvu3FzVv7uP
         nQ55cmpp+jN/EWS3CBwuEY15H8etmcj5sBkjqdjn93/sDdojSRFpwnv2NKiom3vOdK70
         rjim02M5gqTQfPvcPZcamtGFn/Ky6J8XEmOnlMOpgD8NaKAceud934LUBhjs1IjhmEYN
         S//0Dvi5AOZ4GFOMcAdpKFefCqtckGJaKezb1PVxXVM3Bf/M+NA++eYQfGxi+lZOhP09
         K8nPvZbB+8UihW3zrAet96YCdeHQ3xykF+fbbON3z7wg0TO7M5VLBEkW8KGLA02w9zvW
         cJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775785352; x=1776390152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vaoRd4mR0vmNsDr3UZXlc4hkIyu2gtCwDoTyFky+mvY=;
        b=Xbxo0m6nSc4hpr7yU4in2+uYF4NLAlCazsID8QdSgj2IYic7jugGdqC85Qpg8qBbv5
         nih9+mtypmlUv5Jh1++v8wzPVWT//FkKRYWo1gtRaB1netMrkdkP1t4+GMRNG/PKhmF3
         t8RKuqsnllHcs8/4Sg7WWx/oFclqiMLEIJh3P8ptsawrWm8AD+sz4D9ErIPPnNMlEDVn
         +V204ie3eFF+YNG/CB6l/aj32gQtlzunTMGLcfRmniLZK7FALnlsQ1XQTbk3aF0+i2/N
         KREL0sJIEookfYON1Cn/w0JIqjW17rxcxM104XoiLXqzUM3tdQ4sUplGrIYinKD/ykUh
         OlAw==
X-Gm-Message-State: AOJu0YwDrxEfgYkupG0Ss3PqBOXfoz+h0KxSoLlj9IfzPClPadU0P/qv
	8EHS2KajTP8B4PochgDXFP5hBT1gqrCuYTIfdusef3YZ/EykaV7RYmdp
X-Gm-Gg: AeBDiet0lQXgDZSMCPvNf5gHbV4Ak1IQYoPMXbyTG/wZy9+0+vn4ldB+UYS3ZZ5qtu5
	S+/WiaNMug7NaW8zUCgeQelPQJvas3UIivht4AlL+F76gjXnbKcQLLXcj/srSfce0MBBVlX7fD1
	US1qGFhE4YztWUIDY3GjwHens/KgcNcPeoZDPEWy7xmu9PmAmMlj8OFCy2fQaj9LTSuWITwQIya
	wRw/l+dqhdobYYCdYSe8cYKAllGzoaJPM2Q4WWb2yOjaexc1w8IhMTa7Uq+jXl+8xFWLwNupI/y
	RMJc7pn2nrOg9G59sJ3ezXO08zXfoqvUNdZTjO/+utUTzXq9ROEsC7h7ERcgVWuQh42w+FESTpC
	n6YBJg3uhAaH2DqlHPVDF+xpNS2G4BzUo0f8qGAVb6/moA/EOQ/Ynry26n83Rg62lahQQrKhydE
	UpJ2nHpZWP0PGhHhoi6efvN+FKkHot0Z/ESGOsgdpZkVdEcU/MSIW5AA==
X-Received: by 2002:a17:90b:3f0f:b0:35d:99c2:8e6f with SMTP id 98e67ed59e1d1-35e42831fc2mr1219450a91.20.1775785351946;
        Thu, 09 Apr 2026 18:42:31 -0700 (PDT)
Received: from localhost (as040201.dynamic.ppp.asahi-net.or.jp. [150.9.40.201])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-35e4131d1desm1119686a91.9.2026.04.09.18.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 18:42:31 -0700 (PDT)
From: osjin83@gmail.com
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	osjin83@gmail.com
Subject: [PATCH v3 3/4] staging: rtl8723bs: wrap long lines in rtl8723b_phycfg.c
Date: Fri, 10 Apr 2026 10:42:13 +0900
Message-ID: <20260410014214.10684-4-osjin83@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260410014214.10684-1-osjin83@gmail.com>
References: <20260410014214.10684-1-osjin83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jinemon Tama <osjin83@gmail.com>

Wrap lines that exceed the 100-column limit in rtl8723b_phycfg.c to
resolve checkpatch.pl warnings. Arguments are aligned with the open
parenthesis where appropriate to maintain readability.

Signed-off-by: Jinemon Tama <osjin83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
index 09893a43f54f..52007dfc70b9 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_phycfg.c
@@ -395,7 +395,8 @@ int PHY_BBConfig8723B(struct adapter *Adapter)
 
 	PHY_SetRFReg(Adapter, RF_PATH_A, 0x1, 0xfffff, 0x780);
 
-	rtw_write8(Adapter, REG_SYS_FUNC_EN, FEN_PPLL | FEN_PCIEA | FEN_DIO_PCIE | FEN_BB_GLB_RSTn | FEN_BBRSTB);
+	rtw_write8(Adapter, REG_SYS_FUNC_EN,
+		   FEN_PPLL | FEN_PCIEA | FEN_DIO_PCIE | FEN_BB_GLB_RSTn | FEN_BBRSTB);
 
 	rtw_write8(Adapter, REG_AFE_XTAL_CTRL + 1, 0x80);
 
-- 
2.53.0

