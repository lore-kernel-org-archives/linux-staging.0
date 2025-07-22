Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D3F2D323D
	for <linux-staging@lists.linux.dev>; Tue, 22 Jul 2025 07:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753170091; cv=none; b=TpA5hVqTl0D2/o2KsoEr7/p0MK7DlcEFTfKoQXBRk79HZ+Tc5ZABnvI1ixGeHzNkbSGi4uWJBX9lG5/aKTRJ8PbsgmL/dHNZc+4RAQ8M+Ae7AdwBpuIWL6TRiuyCoDIF2vX2ENa1u0D3yUP586ClzjZ633vsxV55okYCY+8U2x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753170091; c=relaxed/simple;
	bh=LAFzkfsjMSCq3mQX3QMycHLyMEh/8g9K5shOKKAytmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kq5UmBt4JAiQZWu2tprtzuK0H93bZm2JcZzEUxkp7LPMxOxpvaYbFcs3OF8zFatAVV1QirwBxTqXwNLbPGSFTli/Bpf30NXuQhyvlp7X2hA4zVC2/6LzlSNZlCCzhwDRF6iEqX8GxHNZrN7tk+JQOTX0FD0yWQLx9RyBpJCYro0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WcfFoWaS; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WcfFoWaS"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60702d77c60so10097305a12.3
        for <linux-staging@lists.linux.dev>; Tue, 22 Jul 2025 00:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753170088; x=1753774888; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZNogBY7S57ztBtcwsWdypdOXKto1q8N8tm4BSbYJAQ=;
        b=WcfFoWaSYcy9QNbj5LUAXHdSfZl7O+56KdOs3zeoLvg7n3F/li3wSywM+GsneF0dxg
         Zlu95Tho/sQde5NosihMQPk6SaxuD/vd5tPQxwUpv6dZJx96IVUMjeERj+PazdDedsje
         MZShb4b6CY/Ise64WZ35WqHdFzW8j7Hme5JhaIzw3HaciXWzIqV7g6WSzXC40D5SN/aO
         QDLBCiJVwl0LNKsmk6m7+pea9ulc/5kQXSouDWuB+iGwKiDpl1TjSPlCFSiK6KaYh3Ph
         JM60JHdUDu1EqV0imvuEeYytXvqI8SSP9aP5Yecehx8KQ5oWVJhPZJiJxEq0TK3vQ0TA
         mG3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753170088; x=1753774888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gZNogBY7S57ztBtcwsWdypdOXKto1q8N8tm4BSbYJAQ=;
        b=LSrIVB0rpHYuJOTfCLeFxrRrFbyr4vOULgo8lrSJFa4crNufokSnCrQfDoIKMAb0yb
         UsRZ300PfucKWNx77MjgYw/8iC8gNHP9hXJHfFj3OPr3+OZJ2if61lsfmg4zko4H6qXL
         oEzWg/qi1eSDh5XOWpIsG0efQmH+Mx5AAieYgszDRu/K3ry+Kma6s2S+S1hU/uWlxW5d
         3QD3RpqlgS/WoUV6KJqrUvA0jDDehdt3C6oz65SeFTs2LIFW1S0nvfOk9UNETfL01Egu
         K0YdNaeU4rsuJ6p71F3vuFfdz6L7ZvswxAkF/548f0ktISBYcAy+PgNDjBvdN2p4f9no
         69Hg==
X-Forwarded-Encrypted: i=1; AJvYcCVDQRi6mgUbWjglbN4ErXfQLQ4rxrXipvYmtVWMAR4sU5ddb0IWq5eG9R3S8/Tliar5nSofrb/0kj51irJe@lists.linux.dev
X-Gm-Message-State: AOJu0YyCjN7avraGlo15WYLshxBpEGQIEDSao6yYcEJNDuNKDCYw8cxb
	Rpg75nnO9odEeM9R99qU6M1EKldCzrQrQarj3q1M7BC6REV2AmW3vE1b
X-Gm-Gg: ASbGncvsQBldpy5/TBSr6BDYEPHT+i/jgRNJ/dPkM8db6LzwMX/voUVGO8MyYSD2VfH
	RyxtTAHbv/GSnTMsDpsrS9HQPKViwL/YKKk4c5iCaq9y4bKJM9CG/egvo2Y8CjWUvPxtnCbdQeP
	EuTTxpi5y+nRDXgN7HnwhZA3xIJkMv1kAXcFEuugsNxVa9I7LJkKuJSjq8f11pUc1I2JAu2Lkv3
	ZeHLOXr7gI860LpBvXYaF7umezRdQl5vTHcXMuJWNUE+3tTooDzOX4KncWpPKwMU6n6LNm4rg5w
	aPRg4nMcvG+Z3wCPFEZ3zSRjdf/7EUMVledIgsmYRq+DIOsboc8B4iGM/3oubnSkmHLnk5yxyzJ
	4qBv7/T+PJJUrTuRnkW9opsQ=
X-Google-Smtp-Source: AGHT+IFW90x0hbLkyLT3UYkJcBiH0wEay939st4w3DBG/C7BPZnwEOkPFBURA4+AnF45CuVZdakffg==
X-Received: by 2002:a17:906:68d2:b0:ae0:da2f:dcf3 with SMTP id a640c23a62f3a-ae9c9be2d5dmr2050002366b.59.1753170087837;
        Tue, 22 Jul 2025 00:41:27 -0700 (PDT)
Received: from tumbleweed ([95.90.185.15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c79d6c6sm821224666b.32.2025.07.22.00.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 00:41:27 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 6/7] staging: rtl8723bs: dm_CheckStatistics is empty
Date: Tue, 22 Jul 2025 09:41:14 +0200
Message-ID: <20250722074115.35044-7-straube.linux@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250722074115.35044-1-straube.linux@gmail.com>
References: <20250722074115.35044-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function dm_CheckStatistics is empty, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_dm.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
index d1c875cf8e6d..928226679ab4 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_dm.c
@@ -12,9 +12,6 @@
 
 /*  Global var */
 
-static void dm_CheckStatistics(struct adapter *Adapter)
-{
-}
 /*  */
 /*  functions */
 /*  */
@@ -144,10 +141,6 @@ void rtl8723b_HalDmWatchDog(struct adapter *Adapter)
 		(hw_init_completed == true) &&
 		((!fw_current_in_ps_mode) && bFwPSAwake)
 	) {
-		/*  */
-		/*  Calculate Tx/Rx statistics. */
-		/*  */
-		dm_CheckStatistics(Adapter);
 		rtw_hal_check_rxfifo_full(Adapter);
 	}
 
-- 
2.50.1

