Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDED2773DE
	for <linux-staging@lists.linux.dev>; Tue,  9 Jun 2026 01:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780967895; cv=none; b=N5kU/IRicvoDsSob7PdUVpINQZ/3hKTl7G0ZwwZrpj2vqsZn5UpRhlKenT+Wo+yvcMW4IOdpBEuB4gM87/OdusH+JvovoMDN83DGiQswe+M8k2O6naNueXpvAKLhCf9ww1o4UIBXeQ1kIvkMTCa4fYjLpRzKrLiUSDm/5z2xDQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780967895; c=relaxed/simple;
	bh=RFha6jfVWUCB4v8q6yii0Xy33+yTSsEdHGCnRuiCPxo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CzY/0QPpDu9yXOcOp8gyGrS1f3zYk6Bk880qLMF9eWjqHUmxrEuYO1cDXW1W3cmBGg/8gstd9q9H8eydjpEaXTmB+GNn49ILUQvyDKbreVfeUkXrrtWAvbViftAHRF6xWIVHGvvSLd0izQf9tz9/M62SZ0df+arQ6gFwldjVjJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MzlEtMap; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MzlEtMap"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8423b08b293so2117122b3a.3
        for <linux-staging@lists.linux.dev>; Mon, 08 Jun 2026 18:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780967894; x=1781572694; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1hCrO2Avcbp9+uaFM2AbILaNhKUQvSHPAv3c0qthXT4=;
        b=MzlEtMapG8+0oMqFUsQUsbhDaUVnORabcpbbokd18ddGHweVEyP5dyt1d8trxIFefU
         lARpZAyKIrUmlEHfgZW2rpL2Gbc7ZaMb7zUXFWjrjRL2hSU5NyZ3+dl1Lx9jsRalAxiF
         89o8f+euoDaMmwIzBJ3QHCBzJ8rdYdakZlH5DFNK69oJMVAu6a7E0NCSslARcq+fMUNa
         vvClhJFp6QvJ/nWcQRwdhtJpDuCws47jCOuoJmX0ZmTbmGuHHQGA0pi199lTQEUQaD1S
         X+fYvKQq5/XeliRIKd5zmuBY52tx/mbb6TZIJctgvLIP1d6T0x6XVrkM76chiEvMVaCH
         k7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780967894; x=1781572694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1hCrO2Avcbp9+uaFM2AbILaNhKUQvSHPAv3c0qthXT4=;
        b=hpVezlQXN9WdmQwYfeUcfBEoc4LxarsUodhp1ahgNBdoegFUUvj7U3gHoZhYHfFxBp
         cOa1hYto1z//yoUSCGMqyPlqftbiJ5Vdh+Q/o1Igs4J2awzp9pYZfsHL59STBYouwnCJ
         5d6htQoiKc9VgnXE664FE+spo3FyIrlHMqmCY/koOBEfHsb6EUxyVcpR76H6ZLjJdjbk
         IAz5QQUzwkBDt9YywHa/Nmks+ozOCWjufpY/3hzqrHJdinI60r1be7xPOIDWw/kZ5uh7
         SPTkBBdAdLRQb1nw4FE7WFZJlBkHejw7JMZnJZ+PyF/0b3iZPf+WOsdThu/CfIPAWKvC
         rtpg==
X-Forwarded-Encrypted: i=1; AFNElJ8cRpFpUwcPKitlRnWFUjduwdolRIIx9fGNXUMX3Dg/pY/gOhuhHpdJfQKOX+aJerMtZC4y3gDRtnZWXXmG@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0IVtSDJOC29K7SUZxdEucwLLwZ+nbQxC31mPrXECyRNNKmq0i
	zcnXT52UzTFB/ixS3Y4h3bjvztNbTEMyjzgQ51+dyF3b582JJ6zspQXe
X-Gm-Gg: Acq92OGnoxw8BrVD4XM8AURDF9DfJkjObfv/3tqu3YpDNCya8bkDR0TCHlJQ8cKEs/d
	1alPU4pbKUyWJ7kO0mfrBXQSRGm4WD6KZteKE4Sg6/L9Kh7J7kdBbIhJ7NmPLoDbUq65Likk5UI
	3L6fNfIaEpXj3I3gtLyVnHNQ/1ZaWLfec9hF13ZNcmFNqDvgVS1sUTbLy/nRBig1TSHWSyQxTnZ
	JuY4nADg9Fkj8yrOU8Flf5YMYm+NGyk460eu07vSqhwWOKnaY/J3qF53nNZpVcYaKjO6lKjOSpk
	n1UupPFXqF3fgVxezN4Lpqxsm1iQI5qbkbL33zpm7AgkLhYVKoiy7R79TXvFCbdoOuyyJ/9bMj0
	VzK4LFZUQHN03yK/Ff8nuWMgkRA087BH6pt0ifcFvpV8bGEwJqvZ12xhez+x+aHMdf48vlQB/MD
	8Ft/INH44riL5E7QyXIKtd3Q+/otGsabzpa+YY
X-Received: by 2002:a05:6a00:88e:b0:841:dcb5:e6f2 with SMTP id d2e1a72fcca58-842b1065829mr18026265b3a.23.1780967893821;
        Mon, 08 Jun 2026 18:18:13 -0700 (PDT)
Received: from localhost.localdomain ([2604:3d08:2474:4800::9e30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828d6bc5sm18329180b3a.43.2026.06.08.18.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 18:18:13 -0700 (PDT)
From: Brock Haftner <brockhaftner@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	outreachy@lists.linux.dev
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Brock Haftner <brockhaftner@gmail.com>
Subject: [PATCH] staging: sm750fb: make g_fbmode array const
Date: Mon,  8 Jun 2026 18:17:36 -0700
Message-ID: <20260609011736.17401-1-brockhaftner@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The g_fbmode array is a static array of constant strings, but the pointer
array itself is not marked as const. Fix the checkpatch.pl warning by
adding the const modifier to the array declaration.

Signed-off-by: Brock Haftner <brockhaftner@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 89c811e0806c..8f533f3b1b42 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -21,7 +21,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel __ro_after_init;
 static int g_nomtrr __ro_after_init;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char * const g_fbmode[] = {NULL, NULL};
 static const char *g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview __ro_after_init;
-- 
2.54.0

