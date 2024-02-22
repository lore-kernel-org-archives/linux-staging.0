Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E2D45BEB
	for <linux-staging@lists.linux.dev>; Thu, 22 Feb 2024 11:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708601272; cv=none; b=YRdiepiNu6Zw3dsDx7717aLVJHOfgR8/JpVWJpLFTb0ASvRykosfRoU6KQ/4atEdXJqgZAXFzj0PktrOuJD3pV3JEJJReyArWZOSaBEiqLUwieKVapTSCgxb0RaNfZDatzoCXTCSgae/c+SLESNGtX42sMLogApKgxwBpLFipIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708601272; c=relaxed/simple;
	bh=ODk9fkgS7BYWU+Gg1SjEmAFub5dXjOyUVZ3wrCXNqm4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uCGkvnglzICfRZbf9wFuA0tD5oD3CBOiTYxeMNKkTpMFSqavc7o9GB72ODiXTioNoZ0E/wGM5VnBYMQ2Z9+z9oudBeqp42KWoYiuk/Ovx20bdEnaIW0kqbHNVQ9a6LU2HEruDQnfx0O9qGf7j9N/i4RWDyConM8SlsXNzJvARjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dd/xL/i0; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dd/xL/i0"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5654621d62dso406242a12.3
        for <linux-staging@lists.linux.dev>; Thu, 22 Feb 2024 03:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708601269; x=1709206069; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VmUhYWRsoRWZAmukiCSIuLg/ZdC/ToO+ch53EbnA+RQ=;
        b=dd/xL/i08a1UbLTV8cfCmR3k/KycG/HfAd22Sf9OviJ8JCU580Zv21ThayUwpcRekE
         PNiZAB/Ms6i/5HSA+9rZJ+mZvi6j/Eduh40oMKMd/GiWkU8B2USszcMMyIPVeXr34HfX
         c9DbZ9945uTj9yYWBQPHL/1uy5EQK7c42zIiXaDSbTxlyjPZNbPzmG8Ad421rklQ/YAr
         cymlIEwTS7DtVLZoDkio58IKprk13ufc+XdCpkVxOaQza9ex6Zv88700oufYaGHRO4kp
         nTIeslQA/woqj3h6XZ8pm5f2UtbIul3oiugdNv5xtuTmmPZGc7qfktedOE+7DpKs8Bew
         UbiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708601269; x=1709206069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VmUhYWRsoRWZAmukiCSIuLg/ZdC/ToO+ch53EbnA+RQ=;
        b=A/Z3LRVf39oXMKInYQM6RuukUUJfA+j4ofnsMz5IjtKbLIYBvPun4VBdokEIhW2ZNm
         sa7AnYlAqawhscVsilAdrNJWZOY65HpUjv98lyj+OT0u6DeHV0har9OfzAJ2BGrJqXDB
         rpUHSke4Gr5yoPPcWMUyq0uDp4afVtg/J+5eI1UiszCyeIczbf0Bd1PT4BNp/K/Mt1c3
         rIhpzWWghtfxLmFxmblZE6ebiqkKKwFbuK6jbclJIjmIBL55pOeMrIzLvQn+ndAg00lT
         S4mbrxrsoZYf33pV6vYRff44RgpncuIzVpTeMsX5sltoPv+ntUPL0yEZ92cn58MqBPvh
         dM2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWKzCu6UeUlOLgS90IqUThAj+XeOYKFR7CdGdMyV38r0whdGKhLg1/s7LwRsfqgv2XklebVQY6xlQfAl6vxienpj3DyZ/v1LYY9BIbacg==
X-Gm-Message-State: AOJu0YxdeGWtXsp+LIzQ9LzXUJ3QrAChdkIHUcZB/DOKQ0ODtP+TkcDA
	Os+4yzBbLacKsLwx4JfgBp8F6VmG36OsedS7PT9Q8UCQhInlQYAn
X-Google-Smtp-Source: AGHT+IHtW0GuD91XcYaSU2gDY7bBfM1JJRyLzzy+8Cf5O8JnYufLlLQ+MkUMvOXSphsUGbj5JQLpVA==
X-Received: by 2002:a05:6402:22ef:b0:565:3907:be45 with SMTP id dn15-20020a05640222ef00b005653907be45mr1149547edb.37.1708601269376;
        Thu, 22 Feb 2024 03:27:49 -0800 (PST)
Received: from localhost.localdomain ([95.90.186.51])
        by smtp.gmail.com with ESMTPSA id ck8-20020a0564021c0800b0056452477a5esm4338524edb.24.2024.02.22.03.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 03:27:49 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/3] staging: rtl8192e: rename enum members to upper case
Date: Thu, 22 Feb 2024 12:27:23 +0100
Message-ID: <20240222112723.18428-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240222112723.18428-1-straube.linux@gmail.com>
References: <20240222112723.18428-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enum members are usually named all upper case. Rename the members of
the enum fsync_state to improve readability and follow the common kernel
coding style.

Default_Fsync -> DEFAULT_FSYNC
HW_Fsync -> HW_FSYNC
SW_Fsync -> SW_FSYNC

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 26 +++++++++++-----------
 drivers/staging/rtl8192e/rtllib.h          |  6 ++---
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 4b622ad4c534..bf695b61ca8b 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -1523,7 +1523,7 @@ static void _rtl92e_dm_init_fsync(struct net_device *dev)
 	priv->rtllib->fsync_multiple_timeinterval = 3;
 	priv->rtllib->fsync_firstdiff_ratethreshold = 100;
 	priv->rtllib->fsync_seconddiff_ratethreshold = 200;
-	priv->rtllib->fsync_state = Default_Fsync;
+	priv->rtllib->fsync_state = DEFAULT_FSYNC;
 
 	timer_setup(&priv->fsync_timer, _rtl92e_dm_fsync_timer_callback, 0);
 }
@@ -1716,28 +1716,28 @@ static void _rtl92e_dm_check_fsync(struct net_device *dev)
 	    priv->rtllib->ht_info->iot_peer == HT_IOT_PEER_BROADCOM) {
 		if (priv->rtllib->bfsync_enable == 0) {
 			switch (priv->rtllib->fsync_state) {
-			case Default_Fsync:
+			case DEFAULT_FSYNC:
 				_rtl92e_dm_start_hw_fsync(dev);
-				priv->rtllib->fsync_state = HW_Fsync;
+				priv->rtllib->fsync_state = HW_FSYNC;
 				break;
-			case SW_Fsync:
+			case SW_FSYNC:
 				_rtl92e_dm_end_sw_fsync(dev);
 				_rtl92e_dm_start_hw_fsync(dev);
-				priv->rtllib->fsync_state = HW_Fsync;
+				priv->rtllib->fsync_state = HW_FSYNC;
 				break;
 			default:
 				break;
 			}
 		} else {
 			switch (priv->rtllib->fsync_state) {
-			case Default_Fsync:
+			case DEFAULT_FSYNC:
 				_rtl92e_dm_start_sw_fsync(dev);
-				priv->rtllib->fsync_state = SW_Fsync;
+				priv->rtllib->fsync_state = SW_FSYNC;
 				break;
-			case HW_Fsync:
+			case HW_FSYNC:
 				_rtl92e_dm_end_hw_fsync(dev);
 				_rtl92e_dm_start_sw_fsync(dev);
-				priv->rtllib->fsync_state = SW_Fsync;
+				priv->rtllib->fsync_state = SW_FSYNC;
 				break;
 			default:
 				break;
@@ -1750,13 +1750,13 @@ static void _rtl92e_dm_check_fsync(struct net_device *dev)
 		}
 	} else {
 		switch (priv->rtllib->fsync_state) {
-		case HW_Fsync:
+		case HW_FSYNC:
 			_rtl92e_dm_end_hw_fsync(dev);
-			priv->rtllib->fsync_state = Default_Fsync;
+			priv->rtllib->fsync_state = DEFAULT_FSYNC;
 			break;
-		case SW_Fsync:
+		case SW_FSYNC:
 			_rtl92e_dm_end_sw_fsync(dev);
-			priv->rtllib->fsync_state = Default_Fsync;
+			priv->rtllib->fsync_state = DEFAULT_FSYNC;
 			break;
 		default:
 			break;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index c18169725452..ac6c52b58894 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1031,9 +1031,9 @@ struct rx_reorder_entry {
 };
 
 enum fsync_state {
-	Default_Fsync,
-	HW_Fsync,
-	SW_Fsync
+	DEFAULT_FSYNC,
+	HW_FSYNC,
+	SW_FSYNC
 };
 
 enum ips_callback_function {
-- 
2.43.1

