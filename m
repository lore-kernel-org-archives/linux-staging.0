Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0C73F7864
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 12:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777379153; cv=none; b=mm6oRGvlI6R0XcTVVIYfnAKvF/N08xMm9i+sGHfrKNqDJPEj5fjAf3Nk9bzxkIGVFRodRCBzrrb4KaSUPMc2GOfu0wxKOl8BXcSoIS/KQCrcL5YVvkSob1iJKDxzhpIu38MAp//pNvKkHIxF7UZD+QDaJMgDk/RMZ/We0STdGQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777379153; c=relaxed/simple;
	bh=994kbwGbzpDI84gth2ZWFQ/DUkneewtg68w15z/+1pQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=L/tievu31/QGeRNOzk2APZ462ALzaOPsVcVHsFMBDWIwwOzMb9iRe4fsDq3J93p9o8FfWmh0sWTExvfho9uIpocfCoK24jGRM9Y+KTpcYmzbBmhh94V/aH1zIiUHFR8wvmyj0oj++3D6IzKWp/NWvtIgn4Z+YN8dycfWtcDH4D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CenkZ66H; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CenkZ66H"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d7645adbdso6219805f8f.1
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 05:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777379145; x=1777983945; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ub97SYxvfTtcUCthywwbD21zacNvXcOjmgIC6pDl4ug=;
        b=CenkZ66HJVfkRfBrFBF2IS2OFfHgPA7OFgm/7jROYfCCYDIAodA5LnZw1Meah7/2u/
         z0SBkoTUqmbRiJyFfrhaFMcx5C9sMvTBygymk2UWYYF9JXn+Zy4u4GclPRf5ANt3EdkU
         /OvSDYxJue5fEqarn/djlhD27G8apFufbleG3bKmZeDN2bgRmqcuAEzieIKds7fX7wqF
         Pz9LiWaKcDEkbZiX6pmGlQb0ArOawKTNV0C6RkxWL7Xa6v2BZpBvnWwx7irsJLgB4Uth
         Y4fn9uxinwKur7B6rdAwqXxvceeZMNqHka8JCUV7iVA2q3TsPPY0RKWPuWi+t+pc8SVb
         IzPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777379145; x=1777983945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ub97SYxvfTtcUCthywwbD21zacNvXcOjmgIC6pDl4ug=;
        b=meAdM6apb0w/tvEa60OWBlcXmgcmhhEz2+BrvGoX8tGfwBrL1/iX7rir7Fkmd5wUN+
         55yFtlvodMgH70DFYRP7OgNB3RjHkVzXGoVCdX6JgkFi3QmDwH6oyxERivIXI5lpRfU6
         xG4KdEGBLnV/cmsvOj11EtfWzPCiDVXquL3OBeZwpQdioV+eHhuuNg74uSm09jVqXLzZ
         vZsGyR+qgeIk2P3NwFYilSsaiN325nZHVXkKj38XmFoGhw07glca8AwlZ/qffkIbrQiO
         pnqf/FCPIFtntjSKliIGM8hZorRBpBnQJDV6xv1KmpE8dchscrEOBuXdpu6zkjOHuSSU
         Ejsw==
X-Forwarded-Encrypted: i=1; AFNElJ9V3gLIMgH2vKZr4WJzw7oYB//0byD0h4rIIWNP2DrF7lS5pLdbCDtHBAsqhjuPUO0tXK+IJnuQDDuDPgo7@lists.linux.dev
X-Gm-Message-State: AOJu0YybH98oXqxZfF8x9eIqlotmZYhMuEI21mND7dt5thteyhLmcTVQ
	ZrV/qS0T8clEdoZFp2/2frlIFd0IXSrklUsreIqYvMOi5/N/ykH3qsFv
X-Gm-Gg: AeBDievKxr3b40oKdZvsm0ueWu8ae1VgKV8Wm5wZUxv6YBHO38jpZyXBUEc7ZKW7fZD
	QK5LlSxpnGAvNOshcfPIePzoaes4Rh+PggsBmzrUU35aUdvtEorZfdKoSsvmfx9yT9YZiqKPoJO
	Bv/apBGo+7nBVcr/G0n6gZHa5TnESjhN/u0eHpT139Pmot/+txnEwSJliUnKCMr7IHzS4pKlYty
	z0xUTrjVhSK2uR6LiBfWvcclCKpSiKLx9gBTxUxVcTVO5/EBuVTUPUs9NUrTD1j396JzJeYJuW+
	3LK8gsbPbDqXKSHcNdx628kHgsCfVb6OlrR6myqPbvnYIs7oWbAUEC9FmRwp0xfXgOwT8XpkiV6
	j4BuQDS0QNWG9jzq6SH/BupKl7HryfzUdX4QZapg7u2v1hfJek51sjZI4qblFAzwQYzfi5KkLfD
	NNP2JXYUa3nOLvC8FolKmDzkzCKmheX3yZ4DgU+z7kZBitcj/7JeRRC6zZVTvvGIvIr62faiqCo
	/I9vuXPH8D5uWwkcGCSmSxRbhfwovX1H2Kz8g==
X-Received: by 2002:adf:ffd0:0:b0:43d:7d24:b506 with SMTP id ffacd0b85a97d-44649ba19d0mr3593290f8f.38.1777379145171;
        Tue, 28 Apr 2026 05:25:45 -0700 (PDT)
Received: from ubuntu.nomadic.bris.ac.uk (eduroam-wireless-pat4.nomadic.bris.ac.uk. [137.222.229.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463d02f6a1sm6140083f8f.13.2026.04.28.05.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 05:25:44 -0700 (PDT)
From: Ilai Levin <levinilai972@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ilai Levin <levinilai972@gmail.com>
Subject: [PATCH] staging: sm750fb: fix const pointer array declaration
Date: Tue, 28 Apr 2026 12:25:01 +0000
Message-Id: <20260428122501.100696-1-levinilai972@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

g_fbmode should be declared as 'static const char * const' to prevent
the pointer array itself from being modified.

Signed-off-by: Ilai Levin <levinilai972@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 9f3e3d37e..a618b4a69 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -33,7 +33,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel;
 static int g_nomtrr;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char *  const g_fbmode[] = {NULL, NULL};
 static const char *g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview;
-- 
2.34.1

