Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7DD1C7B6F
	for <linux-staging@lists.linux.dev>; Tue, 27 Aug 2024 16:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724776157; cv=none; b=F+MmFPMNTXgPnGaKnUID6jvt8GI1lHqiGdA//NL7bi90f1Zx+kyppritsStozOe2cFGr7pRTEK4EXIDeFhb5Hp/gVsawbU3RZzqmmAQlAp28xLPiJdTuFGNNr3zmavtrd8zdJZmFAK7BWfS6ps/fqTVoVH2rE+ewbqjK1Y8YXCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724776157; c=relaxed/simple;
	bh=6d068J4OaSCdSOeFPpLuLxMTQDuS4GBYgsQPHIGhxO8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=DHYNkI+twK7wC7yDizPBsGA/nMNgYMKbRpyhVA9RQJ/42zT7LFUlF0UUVyZDiWB9TVr+jjrfQkszbQOKwYVw59oE9bQWYgxaV8dsFhgU9Xm+psDiobhhYUgnnjBnq+zOCyvs8YhtGVyw7LNHflz/STftmucrh9ZokJVijt3GFyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+HKW4hL; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+HKW4hL"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2d3e44b4613so4185243a91.3
        for <linux-staging@lists.linux.dev>; Tue, 27 Aug 2024 09:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724776155; x=1725380955; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0LFAKdbhGymRn4n9Kj8H7SNpVd+huYYcGY/vR4eAu2Q=;
        b=X+HKW4hLE/lFJAwCkBRMbt3bgpiSV10WUFcJt6q/2iJRYHz6/wmOQikaLZoYRUFVNz
         WLVvemkC7dFtMglscNr0RB7Oe/R5GFaz59r/ttSzkhrj4f0E4bmX4WC3JQGLb34DSEBt
         ur4X/tF5xci2zkP48OKsSzU7pi8CHrHU/NsBPxuTP/eD0WgIdTkeHb9kMY7OUijf73Fq
         IVcN1PKzq5NszDPtBzykMOzf/GURvlubLMgl8UcL6nY+2bngzYq/c4dwjAx3AmKLEGu2
         BHsi3uQ0lSA1GjN+/n65gRQUEEHVogeVPlOEPsYih0Y1m+1l8hTuoTHH9iJx/3bPQrz2
         Fo3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724776155; x=1725380955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0LFAKdbhGymRn4n9Kj8H7SNpVd+huYYcGY/vR4eAu2Q=;
        b=aRQbTY7DU7kQ9AbnsuOkNPTVCmYSDWfQGZdfaf0TWiH1OXqdqHDg6bfxqqNwS2SBWm
         kVttPY43E51B3Gh9bRTCCFDr9Zc7UNEDo0o311L0XOfY+9U7DzGGnuvYXn67cETVYl6l
         Uvh3xPOwIcipF/TTByx7EVJlf6ZNF7FXf7TO2AMChJuL9iiGVTwjs1jCj1mcYWaJNJDo
         vVf4tOnNaR5/FhYwcvOZe19jOKNu6NFXPgFVrmeDDIXF2jPgN3KGdastJZstbd1ByWS9
         1vOfIGGEp4VjtBvuLrtkJrdZuYI4iMfctoqLKaaS30tM3Uc6T9h2a/FpkzpNc0kTY2LG
         dXzA==
X-Forwarded-Encrypted: i=1; AJvYcCXFcKR7h/vUIOYC0G6D4PuuQUMvPkBxE1/UJAD3Y5+jIbBdGn0T/oky9zo+FIoAiT3I/B5Mxx4zK5eY2lwQ@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8fLZpdOs6bfeYE08XCHrPfm87e6XNS647oRXWLQQpRWA+vPrU
	PeYflhZgHfzuDSV6rk5zV5QJKssHePtAvMhknrjsMjgGCr+XuGrI
X-Google-Smtp-Source: AGHT+IE4k6E1T8Yb1Tym/BNPCZsdNWhG92Mcx/Y1eLA04sVUFeUXaEfXhlebiy0kbLo1JdeN79n6Hg==
X-Received: by 2002:a17:90b:4f83:b0:2c9:80fd:a111 with SMTP id 98e67ed59e1d1-2d646bf2bd3mr13588417a91.18.1724776155246;
        Tue, 27 Aug 2024 09:29:15 -0700 (PDT)
Received: from localhost.localdomain ([2804:16d8:ec10:100:8c4e:d5a2:795b:a46e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d61391a783sm12535548a91.14.2024.08.27.09.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 09:29:14 -0700 (PDT)
From: Nilo Alexandre <n1lux.comp@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v2] staging: rtl8192e: Fix alignment parenthesis
Date: Tue, 27 Aug 2024 13:29:10 -0300
Message-ID: <20240827162910.15459-1-n1lux.comp@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix alignment parenthesis in _rtl92e_read_eeprom_info

CHECK: Alignment should match open parenthesis

---
Changes in v2:
    - Using tabs instead of spaces

Signed-off-by: Nilo Alexandre <n1lux.comp@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index b767dc00100aa..2d17d8e8898e7 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -322,7 +322,7 @@ static void _rtl92e_read_eeprom_info(struct net_device *dev)
 		if (priv->epromtype == EEPROM_93C46) {
 			if (!priv->autoload_fail_flag) {
 				usValue = rtl92e_eeprom_read(dev,
-					                     EEPROM_TxPwDiff_CrystalCap >> 1);
+								EEPROM_TxPwDiff_CrystalCap >> 1);
 				priv->eeprom_ant_pwr_diff = usValue & 0x0fff;
 				priv->eeprom_crystal_cap = (usValue & 0xf000)
 							 >> 12;
-- 
2.46.0

