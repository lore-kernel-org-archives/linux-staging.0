Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BE7374F7
	for <linux-staging@lists.linux.dev>; Thu, 29 Feb 2024 02:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709174619; cv=none; b=pZrikT/Gkc6uNa+dhfqn/P3rjlAFUGNwSCWTYL4OYlx4XZRrwK/zaG3QCP0KYm1r8QbXyhMTAFlnUZAjyLpEPjr3w66voM2AMigcvda1ac4lJZ5raz47PrfUSXWaq9CJIayUzdsS6DymvYVeG3pD/WjPpVgnsFswan+hjFFA8DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709174619; c=relaxed/simple;
	bh=4I+zA2OHqdaTai+sBYLEWhHGVtuBmrKy4YAOKKQRL/s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KEsycAkafAWNXmlRAl6w38D+F9FVVJiGkci6wGOxNhqOn5EXR01fXLvPfJADykyKJKub0GDbZ2nUsml6yqGXEpdL0t18ih8j9l/OZo5H7SDxBHKnTDyVDzpLKBQ+z1gUIgHOjDuqFPkYtvGqw675pnEMiFSkg4aaPNwhvHpYzE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=cDmS4opY; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="cDmS4opY"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3bb9d54575cso249701b6e.2
        for <linux-staging@lists.linux.dev>; Wed, 28 Feb 2024 18:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1709174616; x=1709779416; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t9egZkWmt+2eeqbBOMS0LFoFIMdDQ6t+XNJEpny2uS4=;
        b=cDmS4opYYj8RvD0iKXTruCM7+Ah4Z8YbuEK1TJONsde8iDhM97z5CuqNvoB5SPwDGa
         iZU5cmbKKspGs7hEUJuylFMpFVx3rgiigsF1skE+bbcEvd/fTuBlq1qfM9lP16Cv6u1j
         TSKt/Uz4qZSalzJIZEUp1GM1GARjVbR597v+gHLW0y9iMnWSDlYyoREybZ00GwUE3Ib+
         V0XyIQdhaLlKgKyb2H+LmFhqBhC0EeTOIrjomMEYaq8RVTbCpvHcnKq6tgfHmaay+G4s
         zh9S2LmBqMRFvlTBXBMHAg+5OCrAFsWWO9LOVofQ/+zfm41in96kKe89bPr+2eZgP1LW
         6VCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709174616; x=1709779416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t9egZkWmt+2eeqbBOMS0LFoFIMdDQ6t+XNJEpny2uS4=;
        b=UL2nv/5WY18XCNgVV6kxwOBAv4wrJQQqQUz6+aDTbco5XNQuJ079MRsKBFprwTAvZ1
         2X2VBSqAIguf/xZ0NSkD2cbnoVdDk3UP2fbxiydk2ccUsDAUB4PeUqiqf2ul4oNL5Nn8
         XJdNwYlVkWxX32g0FXiHeTWoUgu7+PjUCpjTQ5uZwl4PKZOwjZEYUDZcfxnpN2W/kRvS
         r0oEnb/FhMR4nHKMP+VMYp1HzvNnBfuq1XZSINCU2Dzl/bH2bhroNYx/pJKulKHwEaLv
         nIuYkh1NhhNbLxu1tvZ784UCDlqjpSrKQpxhA9idDmp9A5S2/yKle3gwPffatYRfVfX9
         L+6A==
X-Gm-Message-State: AOJu0YyCu40TDOIzOwXqL6excb2wpNXj/T3JyvDnoGJYYXuH9opxLSxr
	MAz/9zPpGwOraML5BLONcnZGgLEggUVDKoxKJ2CUpI7t8vxuk40MJ05+EAlEDwg=
X-Google-Smtp-Source: AGHT+IHIbAPIDs71tFfyDPKjn9ApcIM6xi3nbM6oU0uYbTPHLkzfl7xSSt1LzulqUUWZ2S6mAbAJlQ==
X-Received: by 2002:a05:6808:1302:b0:3c1:c36e:9ed2 with SMTP id y2-20020a056808130200b003c1c36e9ed2mr934199oiv.36.1709174616381;
        Wed, 28 Feb 2024 18:43:36 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id u23-20020aa78497000000b006e5092fb3efsm141504pfn.159.2024.02.28.18.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 18:43:36 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 4/8] Staging: rtl8192e: Rename function rtllib_send_ADDBARsp()
Date: Wed, 28 Feb 2024 18:43:21 -0800
Message-Id: <20240229024325.453374-5-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240229024325.453374-1-tdavies@darkphysics.net>
References: <20240229024325.453374-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function rtllib_send_ADDBARsp to rtllib_send_add_ba_rsp
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: no changes
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 1aa57f654b82..c0006daa75ec 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -186,8 +186,8 @@ static void rtllib_send_add_ba_req(struct rtllib_device *ieee, u8 *dst,
 		netdev_dbg(ieee->dev, "Failed to generate ADDBAReq packet.\n");
 }
 
-static void rtllib_send_ADDBARsp(struct rtllib_device *ieee, u8 *dst,
-				 struct ba_record *ba, u16 status_code)
+static void rtllib_send_add_ba_rsp(struct rtllib_device *ieee, u8 *dst,
+				   struct ba_record *ba, u16 status_code)
 {
 	struct sk_buff *skb;
 
@@ -283,7 +283,7 @@ int rtllib_rx_add_ba_req(struct rtllib_device *ieee, struct sk_buff *skb)
 		ba->ba_param_set.field.buffer_size = 32;
 
 	activate_ba_entry(ba, 0);
-	rtllib_send_ADDBARsp(ieee, dst, ba, ADDBA_STATUS_SUCCESS);
+	rtllib_send_add_ba_rsp(ieee, dst, ba, ADDBA_STATUS_SUCCESS);
 
 	return 0;
 
@@ -295,7 +295,7 @@ int rtllib_rx_add_ba_req(struct rtllib_device *ieee, struct sk_buff *skb)
 		BA.ba_timeout_value = *ba_timeout_value;
 		BA.dialog_token = *dialog_token;
 		BA.ba_param_set.field.ba_policy = BA_POLICY_IMMEDIATE;
-		rtllib_send_ADDBARsp(ieee, dst, &BA, rc);
+		rtllib_send_add_ba_rsp(ieee, dst, &BA, rc);
 		return 0;
 	}
 }
-- 
2.39.2

