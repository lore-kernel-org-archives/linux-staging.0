Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCB2C2D6
	for <linux-staging@lists.linux.dev>; Sun, 26 May 2024 11:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716722448; cv=none; b=DVhvHOkbBAvLWRnjDpsksQc2v6+3lmNov/KeKiQaLqBBSdvpSc1IOOiiCNFXrhdkGFYiZFgAlivvQAX3EulWJAwvV5iKgEbieildcpn5vVXJfuMUE3/siRo/EdFpOEw56zpaTLq9y8n0hRKVu2Pze0INx2brU/VrqftugEL2qgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716722448; c=relaxed/simple;
	bh=PNXgIt3Wa5nCdip+L1XbGJL1MjVLgBWcHtWc57wozJw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uWS+Bj/d4UQ/HUS7JUVKt65UOUnuWSW4ktZEo1OAMO0fNmPIGT5C5ghysQdcuH1lCK05bDtaJVHTuHFjmnYSCE/hePZf0r8qA5DYK60r9qydbyGWNIfFN4N68Pbst4boD2SxF9R0f493pRMO+Rd12rZc4pd4FOphh6cTX8RuX1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aQPPCrvC; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aQPPCrvC"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a5a5c930cf6so1430560266b.0
        for <linux-staging@lists.linux.dev>; Sun, 26 May 2024 04:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716722445; x=1717327245; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NMeY3O7seoqjcUFeqW+QpBJu4jLGTaciPn8DhAqDpcw=;
        b=aQPPCrvCiTbZWp6LGw8nyW8ro9UqgFA0RBGpz1+Z1mVHNts5QfiUUhGVuJkn3pxwYC
         iEJOT+gigADKNGt+qyhZUXTZ5b2KtnOIdrP+GIMUe8Copxb8vMLMI2q88xHKfXrRcNXF
         TFqFWiIJKWs4vesUG91+D+JNhT+eWcqU5hK7bEAKqZYh4RewcCI1hYWr08VhN5T65/40
         ukGn0Q8i1NGnAQDO7zMRGtvQoccN/ZkSe5VSgWPAd8uRzpAjx10ulHG3YHs74v1d+ViE
         1xJx+gd6sF+kikz4PEp8wP4LY7Dwwuuw+7q1RmtIUqqhoqQLQu0cZQx2NumCyAW28awF
         kTAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716722445; x=1717327245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NMeY3O7seoqjcUFeqW+QpBJu4jLGTaciPn8DhAqDpcw=;
        b=ZMqo/L4j7geqSVsezTEODvyuSBEN2KmD27XRrlwSUEf3zhggKuSm3wsVDPQd6yMXdZ
         NdWh+9Yb6OataVsUp9cE19LC4NkcV3+QFOogwsbMRq7eivLeouroG3QO4kgeXEZhTuoo
         qGAHf2IaIZr0hPB3mSayIFKrcBeNyHlXPNMNGwKPzoC9+wNEdXvZ0oJIpKvFPPCW7Vmx
         DcUJA5L05hSTTU2LUnibMVBzXGgKT0OC3XD2kjcpgrKqst6IAJPNzuzrxBXR5zNyJmnD
         cGS8BpIlg6xammg1QJNCEW9rCVQFHsb5RamhtO0xFm/a5LdC1nXfo71PC3qLfPipS8uu
         UsbQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5lrP7KLrmVOuUUCoeFvrd4weWIRzjBQNdakgTKYe70CtRDdPXYfGKrakVDwdLvfr2VwA8KndnJma8ivRWZlICie1XFurR0ObUn29CuA==
X-Gm-Message-State: AOJu0YwV81bdGOosA/hqiWLHwogoo+BVw30DkKKB7R0lombrIo7Z/7BG
	2LlrBmH7ZF0nYIEjjFUZltmrMehXrBhjc8DkBZYCaVkVObKxTK5x
X-Google-Smtp-Source: AGHT+IFD/6dFxk1qtUrHDVrEqJ7xiBgSakazac4QIdCJw84Y9ymI0JHD5eii0l03scgu6UvGCxsJnA==
X-Received: by 2002:a17:906:c59:b0:a5a:5b8b:d14 with SMTP id a640c23a62f3a-a62649c0862mr447888266b.40.1716722445282;
        Sun, 26 May 2024 04:20:45 -0700 (PDT)
Received: from localhost.localdomain (ip-77-25-34-87.web.vodafone.de. [77.25.34.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc8e534sm373983366b.170.2024.05.26.04.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 May 2024 04:20:45 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/3] staging: rtl8192e: remove dead code
Date: Sun, 26 May 2024 13:19:28 +0200
Message-ID: <20240526111928.14574-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240526111928.14574-1-straube.linux@gmail.com>
References: <20240526111928.14574-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove two else-if arms that do nothing.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 5392d2daf870..4e03eb100175 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -1370,9 +1370,6 @@ static void _rtl92e_dm_rx_path_sel_byrssi(struct net_device *dev)
 					tmp_sec_rssi = cur_rf_rssi;
 					sec_rssi_index = i;
 				}
-			} else if ((cur_rf_rssi < tmp_sec_rssi) &&
-					(cur_rf_rssi > tmp_min_rssi)) {
-				;
 			} else if (cur_rf_rssi == tmp_min_rssi) {
 				if (tmp_sec_rssi == tmp_min_rssi) {
 					tmp_min_rssi = cur_rf_rssi;
@@ -1426,9 +1423,6 @@ static void _rtl92e_dm_rx_path_sel_byrssi(struct net_device *dev)
 						tmp_cck_sec_pwdb = cur_cck_pwdb;
 						cck_rx_ver2_sec_index = i;
 					}
-				} else if ((cur_cck_pwdb < tmp_cck_sec_pwdb) &&
-						(cur_cck_pwdb > tmp_cck_min_pwdb)) {
-					;
 				} else if (cur_cck_pwdb == tmp_cck_min_pwdb) {
 					if (tmp_cck_sec_pwdb == tmp_cck_min_pwdb)
 						tmp_cck_min_pwdb = cur_cck_pwdb;
-- 
2.45.1

