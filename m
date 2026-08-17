Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 286FE471243
	for <linux-staging@lists.linux.dev>; Mon, 17 Aug 2026 21:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787000725; cv=none; b=gGrj8hM9tLkGmo2czWiIgLjxcJ6qWSpwleKe8VOH8YozPOMG5Azm163b82IeIdEU4OncgoIy8MZmYfgFO/hYfkHQQ5GYHrujRaqNZi3T4YMTR+AZORMkyIC+tailukonsHd6LamVIgesb+/4HZttaISj6GmU4HLXH2rLUNNvoz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787000725; c=relaxed/simple;
	bh=DUl6G4wAMFjcPTaW9ivPMUTZ7MV9G+wwjtFPqbQhCo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rb3ANMo3YV/kRnkw0YCtQJ6wbAhnI9nXWMvxLvdzT6EGR8nHZR7XrZqEFSWaMLO3ImTVlGTRMjZRmDXxGMNxHHj3uOTWC1JSXxzUbkdfd/h/NBDVKmSvQCvW37rh0uXZc5uXZv40eT/dmANfVVygMK1tCByMuwGt53qaEc82RM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r2Yyz5ir; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r2Yyz5ir"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3811f512167so5484539a91.3
        for <linux-staging@lists.linux.dev>; Mon, 17 Aug 2026 14:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787000723; x=1787605523; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G1M9b4y+rWHdlzVNQR4PsbXgwGeiCrNuR9ugfADIX8I=;
        b=r2Yyz5irYRljHlxqaFfoHp07ih9J/ir6yTMtcQtzqKUrkNqRci80j/XY6IULCLyuZQ
         44JJQtKGmqUMA+K/w/+c2rml1DyfBgScHzW7DSrdw3ea1S7YE2qKQlklAmO6neuNPfV9
         qz1wGcUj8rhaKS1A6cR6VR0wFgWCACeWXoQSv4qN3KTFZZ+m5pWRDZTiM6QUfDrc8BQf
         u9y9xngC8ApXDpmQUQEyjfdkwuzRNugRIzZg+r9vYHUxayOYO4yQmhW6xl6BB3fspcG5
         8QpTg4VzJ1vzXpCSaoKd2EyIjsDcmLuU9JsYS9ZoUDXzF2iKjIE2nmG6c1wJhuuFiBmy
         Vi3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787000723; x=1787605523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G1M9b4y+rWHdlzVNQR4PsbXgwGeiCrNuR9ugfADIX8I=;
        b=WVuK1bnJIz4AWnW5vKGSgFM90bElLt7Jjch6bJN5fJBxZA3qhXP1Mt7orh9wr2hu3E
         EIvPmWOR+5OQCNPi8nhPRqETgPtHLjE1HQO3/UBPtoBMCOFvbZjslMzeQCH25K0uE/r3
         x8xJYVzkf3DpyYLKgy6j7H8p0jRBXwcxk/0ybnqzW00sChukyNY4PehcYDrv9rtkc5Zf
         +aNIEgEITb5GsERRyyIksZdOcbUSigA2FUVa9p1Znju0rIM346nl+tGDmrbwNY2nbXXa
         0e2TXOmvSdriOaGJ3X604eYgwwQfTaaHX2YUETh2Sl950llSkXq4xn1ezTCSlRPrfoNV
         cojA==
X-Gm-Message-State: AOJu0YyeXvPYJpXjalAosUaf78z3X2i4zzf9PegfeeCBt9igLY0JGD+F
	o6n6/lVdwoVuVVchmx5h2NKdHvpB02K3XO5lX0fVy6GLT/0hdAvQyNs6
X-Gm-Gg: AR+sD136YNOscPUZgcHMYyOhkgReeqLWOClK25uyszQ5WX2SjAR2BtVCd6cdskBx7pb
	86vLUIwb4immsbZdfC/OlaHcTc1p8MiCI/KVuKYy0sGol363A7QdLWqqYdeK8sPWg/Pd9oFCu3u
	3/O4dVdz3FjocsBlBXC+mrQ6Wk9D/nAJyLrAE3YM2ZBtFwUsI7ecNyHZvvev2EMk4Y/v4G7P2G0
	cpK2JcYh+PAjCIlXmZKF0odS9IYAViG3CqVnt0YfkIQwe0ywiLbsDVPNF0dJakJD+rKptRYLrvU
	OYWKCrLToaQ804HXUz+yEW0KKFS2cybtUvBA8bJ1voVUfXzdcQ4dxr+f6ueY9UBnArLkLlUVzCJ
	bsmQYmn5LPUkywiYopatuHOzo6jrVCn65kHWjswL106vNoNcGjUAcB1C0q65GQspsPm3Ypb3ua3
	+PCHvXOG6x2fjmP2EmwdwkR4O+GdxsVIJGXaasr/GxSGvEQ7m0Q/h9CxLq7TyZ+WiREw==
X-Received: by 2002:a17:90b:5645:b0:383:5a16:bd70 with SMTP id 98e67ed59e1d1-3955a7f8e97mr3245586a91.16.1787000723200;
        Mon, 17 Aug 2026 14:05:23 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::6868])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3953202e9ddsm6255713a91.17.2026.08.17.14.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 14:05:22 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>,
	Ivy Lopez <skunkolee@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: define EEPROM_DEFAULT_DIFF as -2 directly
Date: Mon, 17 Aug 2026 15:05:07 -0600
Message-ID: <20260817210507.26168-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260815191030.24989-1-skunkolee@gmail.com>
References: <20260815191030.24989-1-skunkolee@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

EEPROM_DEFAULT_DIFF is defined as the bare integer literal 0xFE
(254) but is only ever assigned into s8 (signed char) fields used
to store signed TX power calibration offsets. The value -2 is the
intended default offset; expressing it as -2 directly instead of
0xFE avoids relying on implicit truncation of an unsigned-looking
hex literal into a signed field.

No functional change.

Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
---
v2: express the value as -2 directly instead of casting 0xFE to s8,
    per Dan Carpenter's suggestion
---
 drivers/staging/rtl8723bs/include/hal_pg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_pg.h b/drivers/staging/rtl8723bs/include/hal_pg.h
index 7cb9c441fc01..83bf5f117e2d 100644
--- a/drivers/staging/rtl8723bs/include/hal_pg.h
+++ b/drivers/staging/rtl8723bs/include/hal_pg.h
@@ -40,7 +40,7 @@
 #define	EEPROM_RF_BT_SETTING_8723B		0xC3
 #define	EEPROM_VERSION_8723B			0xC4
 #define	EEPROM_CustomID_8723B			0xC5
-#define EEPROM_DEFAULT_DIFF			0XFE
+#define EEPROM_DEFAULT_DIFF			-2
 
 /* RTL8723BS */
 #define	EEPROM_MAC_ADDR_8723BS			0x11A
-- 
2.55.0

