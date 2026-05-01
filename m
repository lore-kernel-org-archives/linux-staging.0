Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A0E421895
	for <linux-staging@lists.linux.dev>; Fri,  1 May 2026 20:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777667550; cv=none; b=NnAcb/IwCqagNz9eE4HpkbQZDsp6zkS0mHV6gh2s59cniPwfvdLzgRqhmr5EQLK90OtEOjDSrXKiMn38QbvQTahKwJr0B1O00GACDK8gJjhfa9w+LeK+A0KVd1eY9xmUeupxRIAnNWP6eWB+WmfXTN971/Q6IdCoRWd7ZJ0aB9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777667550; c=relaxed/simple;
	bh=RPkXopeiwZu3zJzpuzwtDA1E3pGT3BoQCZi9e2ZiupI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D8VIKJu3u2fUqZ2Cr6ja36EDpPyK2cE2b5I59RpQGw7Qv1zjf00GOejZFRdXrT8T/K6/JKWpBM1s+pBvYtG29NlHnOFwia08dFMumtepF2pOEbRIaDKNFvRK76nO/PXlzODGqcK6RQnSHjaVLLqHdmPV0tDjn1uOj/RNfqFxvdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hp2g8Xzx; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hp2g8Xzx"
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-364eef1891dso624180a91.1
        for <linux-staging@lists.linux.dev>; Fri, 01 May 2026 13:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777667549; x=1778272349; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p2FKOJ6C65SqZTIfoVHQEBY09L9ztvjzUSptQvvu780=;
        b=Hp2g8XzxWF2eX2Awqz4qYiUH1tp+5GRreP9wLB4J91vsBDzjCSy/qQnrunFpZcTEw7
         WSIUBQY78H2YXILGXOJdOszX1l26HeiaHDS11wSTJpu/5pw91/oKtrmuifq20vn9eri0
         BbMxm6ZA+vKACRlRNEQ6EUmiYdbSSyaTWTmneLt1cLEZK2FeVQAH6YrqzudjG7lBZiTc
         858tSyNKlPYNwA++Ocyb2sE/NP58/nU4gsWwV8Qa3i9my+0zRNxxz2hl+6v/LgZS11RN
         2mtKoaPg70zTefJboPZ1Y9tc54wPYILXVq51sYxxy2GqBNQUZiuboorVPTCtRoQYDhxB
         8BKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777667549; x=1778272349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p2FKOJ6C65SqZTIfoVHQEBY09L9ztvjzUSptQvvu780=;
        b=lajEIDNpTsjjvZRfQCrdQjxKPasWTEDb6SXNUQkXyBhJIXa8V2TWUeMkMT1HWjjnk/
         3lB9rA4DF0SiQA1a0qenruLyBa2PEZdECPy4WdyXub8hme++/Kx17ntW6V3i8nl+Pa+S
         QefY/u/93QhglPr18SiuJWfWYSj+qKVUPG7N8kzjOhd0ltwXVxWxn+4bRb8Ph95vOG8p
         UusZs9wZQh7x7Jx+Z8S2k6uGiTKGn3vKvmmnvk77RuN6Mah5AUmJsUtvecuSm6lfbAYO
         fXzgTSXVnnpE4Mjv6pDL7O+BspQcsYFeKjiCeh7N4iyMyiIP1eE+IQWFDxF3wHylLU60
         A+2Q==
X-Forwarded-Encrypted: i=1; AFNElJ8OwNwYuH8Goe1C1uGf1GmaQUDkpyenKp+fsBbwk6qG3yuyjjwHenQC4Hy2qlw3YYE/QyAJZ+JYi1qHHGh6@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5OblLbVe1he/XgYHpWGsk61LzSRUDmjJnsMISJu0m28ggxoK/
	vs82KSPtf3DpaFB3FPUYqaykZ9V7VXSJlAi8rgbsSWmg+3xDc4PNsM2E
X-Gm-Gg: AeBDiev0KYxdy7lPou1bYQsVRBqs/NAcisgeG9PtPPCQoqaj8TwRtHA4uhjWA2Ulmx0
	tOJY7XsqQgxxqeOOVQCtb7j1wl5VszVoQe9z8oj0wYJ73jHAfS9Tx+eKyuVRRZcXJXZHzhYkTha
	HUXrzMxo+Lb0iVE1VTGDjt62d9VqBw7ZqyLsAoq8pO1Oroqwn5IgzM68bqVC1gK4f0pjMx7azGi
	JBhAv/0QohXYYtTBafk62meRGbSDJLNCIV+ORqk4+qXbIOVgKk4dBHQjySkOZPanI6XSSkR6WXh
	dstQuxKArGu4muqN1cqhN5+28pdyicDhWzrjjYWe8GPLtKsxb/x/4J77ccgOfHGCPzNk7MJioCl
	SBD6jtgW/rpgrU9Rpnf15HTjK567qv5magp6PqNzUV58Do+rKIG55lzzkt7DGsjNYM0L7ovMhRV
	hY3S1S4VUfuBSJ+X65ZuZBVJz2hvIh8lly1ITBfdGFDwc7cBZI0JE=
X-Received: by 2002:a17:90b:4ec5:b0:35f:bfdd:f5a1 with SMTP id 98e67ed59e1d1-3650ce00998mr676557a91.13.1777667549203;
        Fri, 01 May 2026 13:32:29 -0700 (PDT)
Received: from horstaufmental.lan ([159.192.179.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364f47f1f67sm1306071a91.4.2026.05.01.13.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 13:32:28 -0700 (PDT)
From: Siwanan Bungtong <horstaufmental@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	straube.linux@gmail.com,
	ignacio.pena87@gmail.com,
	Siwanan Bungtong <horstaufmental@gmail.com>
Subject: [PATCH 2/2] staging: rtl8723bs: add braces to if/else arms in HalBtc8723b1Ant.c
Date: Sat,  2 May 2026 03:31:21 +0700
Message-ID: <20260501203121.227992-3-horstaufmental@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260501203121.227992-1-horstaufmental@gmail.com>
References: <20260501203121.227992-1-horstaufmental@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing braces to if/else statements to comply with kernel
coding style and improve readability.

No functional changes.

Signed-off-by: Siwanan Bungtong <horstaufmental@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index b3e34f97cfc6..9bef096164fa 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -1485,12 +1485,13 @@ static void halbtc8723b1ant_PsTdmaCheckForPowerSaveState(
 	if (lpsMode) {	/*  already under LPS state */
 		if (bNewPsState) {
 			/*  keep state under LPS, do nothing. */
-		} else /*  will leave LPS state, turn off psTdma first */
+		} else { /*  will leave LPS state, turn off psTdma first */
 			halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, false, 0);
+		}
 	} else {						/*  NO PS state */
-		if (bNewPsState) /*  will enter LPS state, turn off psTdma first */
+		if (bNewPsState) { /*  will enter LPS state, turn off psTdma first */
 			halbtc8723b1ant_PsTdma(pBtCoexist, NORMAL_EXEC, false, 0);
-		else {
+		} else {
 			/*  keep state under NO PS state, do nothing. */
 		}
 	}
-- 
2.53.0

