Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C4226E706
	for <linux-staging@lists.linux.dev>; Mon, 22 Dec 2025 21:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766439385; cv=none; b=qxKEVkr7Hl54NmyMxH3bbHWXBXo2xSYK9FO7C2XdZe/h6zrUO8sqGg6mUzHSi7oVx6ItxPgT8ObFytEPNFaM0CKYV9F7PNWZkRszjKPlDyZ3aWknS5DEpTIKakoxah7Fl2//VmvoKkaq8tB+TCow7PJwBVJcMI4UE5WFJIUrXrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766439385; c=relaxed/simple;
	bh=+aO1nHw0u0H7LCyPZHpp9cxAULIRhL/XD8YfAVS1lR8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M+tpt1UD64QitBTgUtZBpQnp+E0vqehxTCRNW4vW16IvTbeBE2tg8kEezoBouucGOjZLpRNf8Sx0M1dm+VY5oMYs/2YNez+N2I+Gr8bivJQpQ21pq7rjSfTTKkPLtqddgfryfNVXMuYkmo7l7we/rzc/sH8O8QKGskrZfyvW6ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Al9jUXd9; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Al9jUXd9"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-37a2dcc52aeso45955121fa.0
        for <linux-staging@lists.linux.dev>; Mon, 22 Dec 2025 13:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766439381; x=1767044181; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MDVP8ktXX6v9h5r3tnP7Ag0OfaCUAbOv1reWBdGDyaU=;
        b=Al9jUXd93jrzYpKvWT41yxcJPJmLywOMgwkQqHh3egHwFFloYE/VHWYktD85fgdDuF
         fJ7FBCI5ujoPNiG6NGjS28VXF8BMwCsc2gyw9LLZmp9RBdxicAZM6Z1ciYOvohid8An/
         5elZLGAQ7Dqhx2aN3tl7BnOwjlQEW2r+mRRzIyz39ff4U9/gUUJ+gMQQb5K/S63OKdEd
         F1ljCExZLQfrsVygpSOO2Q2SreTdRfPohYs293cd++AottOrvb4jUNOQRv3SVk/6z+It
         dxmaUnR5RuTOTcOF+DC7Fu/bnL8IHNyh4z4W522+AyJQKviQ28OmXSFWg/mDKX5fr2z6
         7zzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766439381; x=1767044181;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MDVP8ktXX6v9h5r3tnP7Ag0OfaCUAbOv1reWBdGDyaU=;
        b=AQu44clSCQYPd23o5ZhnHMjIZw3Oti5DXStGRqrA6Jktvq5ubyqXAPi1DS8G0wr/x5
         nggBSFVRddJO60Nyl3oHPUYQXkTC4d0s1IAcPK9X9WCKYYJ7cXP163iNcLu+SaFed9aa
         jXYCCmq1QHtZmGP59x0JKiVgiLnhSyC81tw9vx168zTu+HOhQigmBSVae4TVO0iA0gVK
         fh5fXjAuEEHtvuxkFKTw7O/r7lcls1BnkRDv4hzOu0uvgr8YThdokxvBNxjrP3d8oXgS
         hJrVsEECLYnnPuOUK1kLdU4lH495WqxOgP1fFYV5VlpYbE78vss95YmKuasNUyHdWf29
         5Upg==
X-Gm-Message-State: AOJu0YzCbv7P/qJQDUxuWvMQAwEQTU7tA2UzAuSuE8koikku8763ZVZv
	zDDbY2b8CgXNCBUq36Hm+zOOgb2gKJtzU1C+bNQYz3fwp+Lv8t3OTcAc
X-Gm-Gg: AY/fxX63R7/o3q1LokvUeE31cShTLWzVqBsKWsQcxBFjr0OVZuCgBXaUEGvrqTWrV3e
	oPc0PzsOFbpgPQ+Ca3Wj4vZfD95JdS6AmMqSeyC9tc+Yo3+fMf+pXNQVKT9+/J0pZ9wcwIQ023l
	bg6bcSfhjoZc+E6RRLd5DnJDUKlwWf1gsAI5JFGwMjc2aziXJd40Wo6Xxs9TwCY2Rvv550FaU1m
	EwnVEc6rg/DEF5RHPut2WHg+l133vJl2FWChgrbtJzCRP2XwxzCBfTGRWc2nr5etiOfysWswjBU
	d3BE8CgL38bcMQ2EvI6ForrxPZAP5euZYLwRRnRRcrsHNMvFID27kHU8G2VMp1DqpU5m1MaHypl
	szzEbw95YJvadBoFgz1zNoVnL8ZencIu2QVP7oA7tByHVOGGNgsjuTYPA9pyKPZj40VvYQUxjUw
	3qqmkqBXMoWxlG64Yu7kWvVhA6tciAl6zzgihHqTugHoaWQrGgEQ==
X-Google-Smtp-Source: AGHT+IHNIMK8Mvwrd6C8KAwm50bKhP9v9SeWgnxh9CiELKJrrF62bkLpPlBzhwE+rrS+7xW8G6nbRg==
X-Received: by 2002:a2e:be28:0:b0:36a:925e:cf3c with SMTP id 38308e7fff4ca-38121671f61mr38615381fa.31.1766439381284;
        Mon, 22 Dec 2025 13:36:21 -0800 (PST)
Received: from yantra.. (dsl-trebng21-58c187-236.dhcp.inet.fi. [88.193.135.236])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3812267981dsm30389321fa.40.2025.12.22.13.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 13:36:20 -0800 (PST)
From: Rupesh Majhi <zoone.rupert@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rupesh Majhi <zoone.rupert@gmail.com>
Subject: [PATCH] staging: rtl8723bs: rename shortGIrate to short_gi_rate
Date: Mon, 22 Dec 2025 23:35:56 +0200
Message-ID: <20251222213556.36070-1-zoone.rupert@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the CamelCase variable 'shortGIrate' to 'short_gi_rate'
to comply with Linux kernel coding sytle guidelines.

Issue found by checkpatch.

Signed-off-by: Rupesh Majhi <zoone.rupert@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 57c83f332e74..054e2c2eab02 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1024,7 +1024,7 @@ void hal_notch_filter_8723b(struct adapter *adapter, bool enable)
 void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
 {
 	u32 mask, rate_bitmap;
-	u8 shortGIrate = false;
+	u8 short_gi_rate = false;
 	struct sta_info *psta;
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
 	struct dm_priv *pdmpriv = &pHalData->dmpriv;
@@ -1038,7 +1038,7 @@ void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
 	if (!psta)
 		return;
 
-	shortGIrate = query_ra_short_GI(psta);
+	short_gi_rate = query_ra_short_GI(psta);
 
 	mask = psta->ra_mask;
 
@@ -1051,7 +1051,7 @@ void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
 	mask &= ~rate_bitmap;
 
 	if (pHalData->fw_ractrl) {
-		rtl8723b_set_FwMacIdConfig_cmd(padapter, mac_id, psta->raid, psta->bw_mode, shortGIrate, mask);
+		rtl8723b_set_FwMacIdConfig_cmd(padapter, mac_id, psta->raid, psta->bw_mode, short_gi_rate, mask);
 	}
 
 	/* set correct initial date rate for each mac_id */
-- 
2.43.0

