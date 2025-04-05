Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A7C1EF368;
	Sat,  5 Apr 2025 13:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743858239; cv=none; b=kAaikA6LglpIJbOZf0aBZ76pNrDZCxvp8vs+wxHHrBHl8e7muC+tcvsizYIAQQ3Lnwhw9NjPmS2xBF4Fdg6bPxRKD2YKZN2fTtt5U7MmoCnOILMYzKOq7QPoMK3velKHCfZQ6YoHKU7qlllt570OO1PNke9B7Mmlujq+XBQesvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743858239; c=relaxed/simple;
	bh=+7dT3tL82Twj4medpCe66/0q0Wl1ZErhjrtaxQu867M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i54lLmspTadSAUGd6dJsindT7rNSWrqHsehumSW/madS/ebdLikjG3FzfghEw26KhrPZ6hjNKKxGVixG6LohirVzE6t7jwpIY9fqXilyvki3FRSceBc8h7EaZXn3oPXJgtuAjLOtilePX0F2k7LqmRImBeLYGZOK3paIwCmkUuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z7tTJ2Um; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7tTJ2Um"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso26896265e9.1;
        Sat, 05 Apr 2025 06:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743858236; x=1744463036; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p4QDk5t1ncy92IlUqUOHalwkPhSsIRI8ajRfXHeyssg=;
        b=Z7tTJ2Um1zaO9P+2GkGu1pHuN4nzWsFC/ZNfwb2TMcQBs/uAL79KsOtMcS5lmyWTsq
         4JHGsU/MsqflBCH+p9gWb45Em5+YXNwoxPjW+i4W9+aLBdnrzaYd6mRpPMxLnnw92xdt
         8dC0F2YIwanA+FmNBJPycMp2wD9u7GBNYfuxIF5IgOWvZP3fdmQipBZ+VQJ8SIikoIb9
         4uQhdxEdaLV7+XBjgT42+Up4h0fC5aXQkVhdgmnFxwutZOBFTlhvjyZ4/fcflYnh/QgZ
         yKcTlAbhM+VXhTbdjHOhLOslgMRYHImNfYR6S7bYhQZt7UEvs6B3xyKkY/8yhChC2OUH
         SG7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743858236; x=1744463036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p4QDk5t1ncy92IlUqUOHalwkPhSsIRI8ajRfXHeyssg=;
        b=vOd1rMTKD1aOSSiaoxVKlS8NGBMjpAVs3sTVz0OW1Zcwgpe8/G4+nmtdk4/dXSg1vc
         TdJzPSjggYJACFAEVVqvV2atKaNclFLrZPv43S3IdrqGx8/UavW7DvO5Ggm/RQeYbwOa
         gchEbgCJhjKOlLqnnZD95ZSCK6WykZuZNPsKqEBSXEb4Wa8+y7XlQnHzYurtld1A3yXt
         pUzrzLFe1WqEuJl/r93m/kI7VWajP1lFCEyLeFkgzVrcxotgrYINxH7KXnwgubjcGFs4
         BJbztXr1Dn0uo1Bzsq5z8QlPq1qwmNgvE2z7Hxf4W42mP6ssKRrMT/6sb3sBpvAFGnT1
         2wqA==
X-Forwarded-Encrypted: i=1; AJvYcCVpFc5bKaLVc1UZS/YSA3J5O18KkuL/wPo2+8jD1NPBsKkr0i/+SGXBfrsRqdQlhjFx3ygE8zJgf7f+N5bU@lists.linux.dev
X-Gm-Message-State: AOJu0YzIU1uBcq6yS8yauNLlUgn1BddGX1uvNlUAXQqgelSmTmnuGaaP
	GUWmJTTuJVAPhm0VuFtvdYxyoFGTrCrGEfaW0QrV8UkWvyL2ed0GJzCfvzREdN4=
X-Gm-Gg: ASbGncvZYq3NUfSKhEWa8Wvc5ZdzASZoxeT8sF2tHOjD22xMjb5dDo8o7QJGwWbvbxG
	ZcR+w4KPheMxT6uVcDkBDZWDBfqjlm1h3pjxzI6Smq0c5oydvvMQF8ekPgs2nMDf/4fCApBYMry
	7NkPCOrlwQ6Ekq8Xys7VwJUlFXFscrMualyz66hmD9qk4AbswwcAR4djN+Ans9wLxuaXfrpCAQ8
	gKcjjpAPzSyiz/cei4Qm9wxEYwEYe1E+/ZkQogd+vtNc77eKeO/fNNphslHafAgSiVFepVneuDm
	BSVooWTr6OufEJ+6fmr/5XnGow==
X-Google-Smtp-Source: AGHT+IFZSIThJAHBaljJXxy3PJ/DYBCGCmV6gC6qirDfrgNj2dih7G6GpjFk0tQXaIzgS1BwdpPKWg==
X-Received: by 2002:a05:6000:2908:b0:39c:1257:cc25 with SMTP id ffacd0b85a97d-39cba98bbc7mr5544209f8f.56.1743858236019;
        Sat, 05 Apr 2025 06:03:56 -0700 (PDT)
Received: from parrot ([105.112.71.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30226f2bsm6912512f8f.96.2025.04.05.06.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 06:03:55 -0700 (PDT)
From: Richard Akintola <princerichard17a@gmail.com>
To: outreachy@lists.linux.dev
Cc: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Akintola <princerichard17a@gmail.com>
Subject: [PATCH 4/8] staging: sm750fb: change sii164GetChipString to snake_case
Date: Sat,  5 Apr 2025 14:00:55 +0100
Message-Id: <08eb6104c7b82aea32796163421a7e795d3d8964.1743857160.git.princerichard17a@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1743857160.git.princerichard17a@gmail.com>
References: <cover.1743857160.git.princerichard17a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change camelCase function name sii164GetChipString to sii164_get_chip_string
to conform to kernel code styles as reported by checkpatch.pl

CHECK: Avoid camelCase: <sii164GetChipString>

Signed-off-by: Richard Akintola <princerichard17a@gmail.com>
---
 drivers/staging/sm750fb/ddk750_dvi.c    | 2 +-
 drivers/staging/sm750fb/ddk750_sii164.c | 4 ++--
 drivers/staging/sm750fb/ddk750_sii164.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index bb7538682b7d..c12df1f9fb00 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -19,7 +19,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 		.get_device_id = sii164_get_device_id,
 #ifdef SII164_FULL_FUNCTIONS
 		.reset_chip = sii164_reset_chip,
-		.get_chip_string = sii164GetChipString,
+		.get_chip_string = sii164_get_chip_string,
 		.set_power = sii164_set_power,
 		.enable_hot_plug_detection = sii164EnableHotPlugDetection,
 		.is_connected = sii164IsConnected,
diff --git a/drivers/staging/sm750fb/ddk750_sii164.c b/drivers/staging/sm750fb/ddk750_sii164.c
index b96f9369fab4..d0b80b86a4d7 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.c
+++ b/drivers/staging/sm750fb/ddk750_sii164.c
@@ -261,13 +261,13 @@ void sii164_reset_chip(void)
 }
 
 /*
- * sii164GetChipString
+ * sii164_get_chip_string
  *      This function returns a char string name of the current DVI Controller
  *      chip.
  *
  *      It's convenient for application need to display the chip name.
  */
-char *sii164GetChipString(void)
+char *sii164_get_chip_string(void)
 {
 	return gDviCtrlChipName;
 }
diff --git a/drivers/staging/sm750fb/ddk750_sii164.h b/drivers/staging/sm750fb/ddk750_sii164.h
index 45a90489c95c..c15cd6a5d53b 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.h
+++ b/drivers/staging/sm750fb/ddk750_sii164.h
@@ -32,7 +32,7 @@ unsigned short sii164_get_device_id(void);
 
 #ifdef SII164_FULL_FUNCTIONS
 void sii164_reset_chip(void);
-char *sii164GetChipString(void);
+char *sii164_get_chip_string(void);
 void sii164_set_power(unsigned char powerUp);
 void sii164EnableHotPlugDetection(unsigned char enableHotPlug);
 unsigned char sii164IsConnected(void);
-- 
2.39.5

