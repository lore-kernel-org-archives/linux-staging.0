Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7686F4963A6
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119867; cv=none; b=hdVNryt+FqGFZ/dgITfFR2IB296l0Uvmhr9a+ZxTo5PR4OLF9AMpKzpvZ9XrzoEiH5rwub/ZbLB46caf9OwcT5D/cyt7W/NpA7y1ekNmGI1Qr/OMKVyiaOyWn4uc2znRm8O1X8rxSHsk/T4gozPpBH+8q88ZWJU0PPvI9Y6FWtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119867; c=relaxed/simple;
	bh=gajIVJhvyxOd3jK9xKBFrH9cfJIesTrBKvna6qH/ajU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N6OVqyTwV5SnYXt7Fce/WYt04UW8uqaKcRr9CycnZQqvuxG/2c5hm1wD+H3lnYx6uUvz+UHYQvTszdMbHPcbCyLPayw+RGrAcFYYNA77UQk59zTpcxEcqFqbEZLZZfoCueYto6KBQyK9k4/0eip+oAllnbcucWgbwA8lOivh+6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cU05xo/y; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cU05xo/y"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aeb5e85378so5766274e87.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119853; x=1784724653; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uFhJ92cLJkPbY1FDZB5mX70JJ8UHmLfGf6JbembV44w=;
        b=cU05xo/yGzqDqYMyci98eeM/We4AcwpLQ4Aa8Eyjx3ORvwHa87fQKEj4j6mQtiA1Yj
         RSEUTyPz/8JAQqy3NIUfQSKHmrk057669JCgEfcdHcLWzNhSZG1RFAn46NFrWInT7IoM
         A6ffccDdLwd3YUmYJ/hv5PYklgYDTISirgOM+Rl4A1kkiJ0reNhVaAn3efcSF3aG/UfI
         20gRJj/KFZGrqrzQcSa9c/lo12Fvv1wGECsFeW1uivag40sXLUAE7rpoCtaCLgssrBas
         Q4DXOnle6lqsS/bZuD7yMh8eEO/huIpT38JzKlRy9svfgu6sDp4anGZPzMbYRhgouhRo
         Hkmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119853; x=1784724653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uFhJ92cLJkPbY1FDZB5mX70JJ8UHmLfGf6JbembV44w=;
        b=l9TUWGvbg5tR5/J1yE1S0bzgWy2kg6a/vfYsDODlAKGtRJwZEilE6AHM/lQ2iS561D
         fSHw3+ONfF2Wjcwt8qQO5d8L4QNAIAG06aCpiw0sYXuksTEk6y5GwERoqxbsICDepP2h
         bD4TkVj8sZzKHQ0SI1nPGzmUzNkoHXp8K2+mkiXlGVAi8D6N77zgLOzYQCguFbtduQc4
         BhzgSyk/T0oc8XEu9Pg9b7HlZxaAvSk2uWrJ6Bk1N61Fyxtu/EjdnURsYbdvbgJma/Oz
         k1r7RpcGNnu4oj9CZQAzu0IQ9OjKwWpSodcDT4WxTQosdCLqIRDWdjxBYxz5ZQzvZNvd
         Aeyw==
X-Gm-Message-State: AOJu0YxHtC4ntmn7Y5j9a0uLZN+3WkceRBrYi6SSHlt0gHPPkjM8ZnqR
	8KdK3JBxMu25fS/k2x+zz5pf5WV442AFixDAHGaeV+4uLrMN9O4E4beh
X-Gm-Gg: AfdE7cmrD/rwQNqaUlqbPR9Yb4sPaEIlb84WiT3Wip6KvwuYB4gFsgXzgr9seH41H0w
	ZDXka5YFyIItjBPvZqN88NDraz2Ph7Xt8KTR/dTlQQQK6d7XJ0V739TPTSAv4wiRoQ+UuAEypRI
	DBsRTUcW8YsJoZxaYzCv/NsD7Q/QI6xQl7t9PxjTr/mjcLmBTTr40oLVUYbiZGbq5IhSV67b8C6
	XCbFVtEALAK53FWE+mzJd1QRoiZ3vkaNCWF/2HjnxmR038Y9FpTzWts3XTVYYU2QqrsGivNB1FW
	HqSnNE/eTUOWXPtR5XrsUbju9NycPDrtDvnzbC/RSTQaKZtql8/Bu198fqFPkrfXNcYLGs+XH/S
	BpmaOvb4wvt3KYUU7xQj8LuByUNmvTM5NSl9YjB424UE3npYtRVErKoH1PtIPf6xZgO4eo/1ffg
	7Wr3L6q9DxDgcyR2KgFfBNrU/Io0319sK8ndsUDj4SBO8MabUuZBm8WcXHpCsvzHc6GdlwP0wM3
	1GaHTK4lZwlKQ==
X-Received: by 2002:ac2:5692:0:b0:5b0:1df9:2aee with SMTP id 2adb3069b0e04-5b159b6b3fbmr1478662e87.22.1784119853140;
        Wed, 15 Jul 2026 05:50:53 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:52 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 47/61] staging: rtl8723bs: clean up phy power conversion function
Date: Wed, 15 Jul 2026 19:48:15 +0700
Message-ID: <20260715124829.90290-48-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix indentation, function signature placement, and variable declarations
in phy_ConvertTxPowerByRateInDbmToRelativeValues. Replace sizeof() loops
with ARRAY_SIZE() for better safety and consistency with kernel style.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 .../staging/rtl8723bs/hal/hal_com_phycfg.c    | 20 ++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index b16456d5b..21b9d1c82 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -367,20 +367,22 @@ void PHY_StoreTxPowerByRate(
 	}
 }
 
-static void
-phy_ConvertTxPowerByRateInDbmToRelativeValues(
-struct adapter *padapter
-	)
+static void phy_ConvertTxPowerByRateInDbmToRelativeValues(struct adapter *padapter)
 {
-	u8	base = 0, i = 0, value = 0, path = 0;
+	u8 base = 0;
+	u8 i = 0;
+	u8 value = 0;
+	u8 path = 0;
 	u8	cckRates[4] = {
 		MGN_1M, MGN_2M, MGN_5_5M, MGN_11M
 	};
 	u8	ofdmRates[8] = {
-		MGN_6M, MGN_9M, MGN_12M, MGN_18M, MGN_24M, MGN_36M, MGN_48M, MGN_54M
+		MGN_6M, MGN_9M, MGN_12M, MGN_18M,
+		MGN_24M, MGN_36M, MGN_48M, MGN_54M
 	};
 	u8 mcs0_7Rates[8] = {
-		MGN_MCS0, MGN_MCS1, MGN_MCS2, MGN_MCS3, MGN_MCS4, MGN_MCS5, MGN_MCS6, MGN_MCS7
+		MGN_MCS0, MGN_MCS1, MGN_MCS2, MGN_MCS3,
+		MGN_MCS4, MGN_MCS5, MGN_MCS6, MGN_MCS7
 	};
 	for (path = RF_PATH_A; path < RF_PATH_MAX; ++path) {
 		/*  CCK */
@@ -392,14 +394,14 @@ struct adapter *padapter
 
 		/*  OFDM */
 		base = PHY_GetTxPowerByRate(padapter, path, MGN_54M);
-		for (i = 0; i < sizeof(ofdmRates); ++i) {
+		for (i = 0; i < ARRAY_SIZE(ofdmRates); ++i) {
 			value = PHY_GetTxPowerByRate(padapter, path, ofdmRates[i]);
 			PHY_SetTxPowerByRate(padapter, path, ofdmRates[i], value - base);
 		}
 
 		/*  HT MCS0~7 */
 		base = PHY_GetTxPowerByRate(padapter, path, MGN_MCS7);
-		for (i = 0; i < sizeof(mcs0_7Rates); ++i) {
+		for (i = 0; i < ARRAY_SIZE(mcs0_7Rates); ++i) {
 			value = PHY_GetTxPowerByRate(padapter, path, mcs0_7Rates[i]);
 			PHY_SetTxPowerByRate(padapter, path, mcs0_7Rates[i], value - base);
 		}
-- 
2.55.0

