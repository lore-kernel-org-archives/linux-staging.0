Received: from mail-oi2-f12.google.com (mail-oi2-f12.google.com [74.125.231.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B8E3F484C
	for <linux-staging@lists.linux.dev>; Wed, 23 Sep 2026 17:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790184111; cv=none; b=bG0eZ5Hlmk7EcDptPAsj0G8kIhGNqXzuaCPz/WbT/BqBFluKSgWnYCS9S0iFoo04nbxPDrBNE2NBNvgqKi/BiZLCrQvdHO+cYyrryacbi71Swy09RSxfx3hm27GUmezoW8IJ6iSCTT4du82f1p4Sjj/sxAnWHvg4N3RlnCzwsBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790184111; c=relaxed/simple;
	bh=TqkNICbwN1x9KaXxiUdyguV19IIY322QyRf1K7BAAlo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=u7fV+DIxSpc46zTQBY1iyV7nT/Pf+tYxjPh6oC9bgr485I9IRZcl3KDcHW2YoR+X43I9GkUVd4zXsDm6eSe/DEmkLL216ls8r+gGhgTHO7cPy79/7b1xkbN7Mdo6m7FDAN0P9Tdxd+pcwAmFuHtYkpwHHpWfCPKrs9+tHi8Kq0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FkKmA3Vz; arc=none smtp.client-ip=74.125.231.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FkKmA3Vz"
Received: by mail-oi2-f12.google.com with SMTP id 5614622812f47-4bf948737e1so756414b6e.2
        for <linux-staging@lists.linux.dev>; Wed, 23 Sep 2026 10:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790184108; x=1790788908; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/02lLjzL2fnwF7OUXeqY5NnoVSsm4L1xbooI6lvkXrQ=;
        b=FkKmA3Vz09uQK7XBYL+6GXF5hYhNlMczbB0JOVKQRWFGVVqMZjyox2+JGO+lb7Cp/G
         6us5RWH+q80+FcjYc4zp4qcgzQK925sUSH5PqxjsuwB5tEroKa/4wTn86FZF79J7W8oW
         tNpHEvhPMf11UgRvkdKZ9U+9X5nOxrvGeHWutBjNJo2caHmgIcGSuKiRjm3QzOjyDs1/
         EyrTrrrQwp6HCT78fe2v1pnc1oYNgjVIiwSseSlQEjKS6bFx1Gzk/Rbsc/2p33U9K5Fz
         lJ5jbOZX4WYD0OvfCwmXlmr8+Y7gFBaDof6lD7TWUrUzV7tUokieo8/3jdK1nAphOun+
         ttgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790184108; x=1790788908;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/02lLjzL2fnwF7OUXeqY5NnoVSsm4L1xbooI6lvkXrQ=;
        b=kjPwKD5XaprDA9PfZ6jXFHJ9Hjh3YatiVRfEG+M3HqRY6lzexxAd0btNkMU0t5VZXb
         y1FV4h3m5GOFEz7vLrrGxckd551ac7p1Whn0uNkPxup7OZYIbgQD9tlWTInHe+4ZaeiQ
         KeAYxCO8uZ16dHDsed54EAotPf1UWjlPkf9qKzhKWbBtuNedlQDr3027bALT2mEMSQyw
         4c1s3vP0RPUcJ9oO9SVH7v2Dx/t59jPZKxrzyGorz9RIRZAcxURz3PF3JtYo7BrdfILx
         tCM/Mjun/IOukqw2kpkVBWVURWldQWUaS0y6JFLseOjXtM5TMqDq+8/5vmpWSVrLDmhg
         vc7Q==
X-Gm-Message-State: AFuF++k0NVj79X8ZiVr81hEXW3EnmnGOzwCSlFi/j6qMUdBiCnWtG+Jd
	696tTP36xpr/OHDxzUXgU0eWw3iAeup1Wk3gHy9wlw9yZoGC3CK1Nz6o
X-Gm-Gg: AYBFou1IRrDUC19s2AhXA//Ah2vAKvj4dJ/M3AVC/ptTHzPEffDC4idh8OdKNa1GYBd
	xF+YmY904K3Hc6bW76dbhAe1b7U/NnYZsnLPsG9A5wYjT0wBD5iqINlMlJRwPVqJdlYylwKegTo
	opo5COthk5+7mr/xFR3JL6rY8XLDxafP294bCufKGffeGhwKifAfXVSLtKW3EYoaB+LSsF5NKQp
	wyKAQkBK45UWY9b99P4BE4Z9MX3gps2hwfJN8CFvt3q+feYGXVrk/tC73Z92mbIWvKCW2nwAb2G
	C4OTK8yg54/+KKwY4VFR+gRjwzKlwz1V340cg8CGB4KR6KCumbG1kYnjg/YUEjvlVdlIkiIwpOe
	YNLRsqLwIMjNU/sboamNvFAzoFUQTfYKhDUoX/BMsLAiqMsi5c8E9aCF662TTTE0nqjrBXZhDnq
	T6KFjm97ZjTnqUZHlT7cUz0LFkQ7b1NUSUhEvXIGpWfez8eDEw3Gk/WgwGzGcKIkuBi/qOOsqhh
	e5N1UnOemd8aVgv1vT1Qp9HFG5J96vjKJA=
X-Received: by 2002:a05:6808:1a17:b0:4d6:9412:45c6 with SMTP id 5614622812f47-4d694125b11mr1336790b6e.66.1790184108608;
        Wed, 23 Sep 2026 10:21:48 -0700 (PDT)
Received: from Arch ([201.110.78.131])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d5c49e720esm2867839b6e.11.2026.09.23.10.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 10:21:48 -0700 (PDT)
From: =?UTF-8?q?I=C3=B1aki=20Sobera=20Sotomayor?= <inakisobera8@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?I=C3=B1aki=20Sobera=20Sotomayor?= <inakisobera8@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unused NDIS association and auth defines
Date: Wed, 23 Sep 2026 11:20:49 -0600
Message-ID: <20260923172049.1644917-1-inakisobera8@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The NDIS_802_11_AI_REQFI_*, NDIS_802_11_AI_RESFI_* and
NDIS_802_11_AUTH_REQUEST_* macros are leftovers from the original
NDIS-based vendor driver. None of them is referenced anywhere in the
driver, so drop them.

No functional change intended.

Signed-off-by: Iñaki Sobera Sotomayor <inakisobera8@gmail.com>
---
 drivers/staging/rtl8723bs/include/wlan_bssdef.h | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
index 9137057726e..d318c80c3be 100644
--- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
+++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
@@ -78,14 +78,6 @@ enum {
 	Ndis802_11_EncrypteionWAPI
 };
 
-#define NDIS_802_11_AI_REQFI_CAPABILITIES      1
-#define NDIS_802_11_AI_REQFI_LISTENINTERVAL    2
-#define NDIS_802_11_AI_REQFI_CURRENTAPADDRESS  4
-
-#define NDIS_802_11_AI_RESFI_CAPABILITIES      1
-#define NDIS_802_11_AI_RESFI_STATUSCODE        2
-#define NDIS_802_11_AI_RESFI_ASSOCIATIONID     4
-
 /*  Key mapping keys require a BSSID */
 
 struct ndis_802_11_wep {
@@ -95,13 +87,6 @@ struct ndis_802_11_wep {
 	u8 key_material[16];/*  variable length depending on above field */
 };
 
-/*  mask for authentication/integrity fields */
-#define NDIS_802_11_AUTH_REQUEST_AUTH_FIELDS        0x0f
-#define NDIS_802_11_AUTH_REQUEST_REAUTH			0x01
-#define NDIS_802_11_AUTH_REQUEST_KEYUPDATE		0x02
-#define NDIS_802_11_AUTH_REQUEST_PAIRWISE_ERROR		0x06
-#define NDIS_802_11_AUTH_REQUEST_GROUP_ERROR		0x0E
-
 /*  MIC check time, 60 seconds. */
 #define MIC_CHECK_TIME	60000000
 
-- 
2.55.0

