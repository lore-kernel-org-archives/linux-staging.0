Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEB28287E
	for <linux-staging@lists.linux.dev>; Sun,  7 Dec 2025 16:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765125829; cv=none; b=ewoqgl3tTC7qzcA1KihkFsPvMYV7kYKAxMvTJAvaREhKwYdOdvqKKCBtDxUOJ9V3/Nn3HgdxY0+GPiJRrevee7wa519nCHZy7B/cKCysWYeqPNq+/u0/GHMf159FB9Nr270bRDpdCvLKH2G89YLUXytryEb6JWKf/XqipL4iyuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765125829; c=relaxed/simple;
	bh=rwhCZkkLw3vwk1TFAStxf9y+lgxkE2sr5YH1FNclkSM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eXAOV2W1CPlTd4Qebur1CshuChtX+6U/l15XKhJfxXX/rwbdp6f1vw5qfuYS70oel7iEQuuTCT3ndwRhGrFZpM1P40sZvKn7VftxwfRNIC0NPYIM6WXbkt7xPEI7fr9JaZMS/EIfWjOS7uUz8etkLw32eA4Jpkwfea4i2mG9IHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GLmijdhp; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GLmijdhp"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7bc0cd6a13aso2032194b3a.0
        for <linux-staging@lists.linux.dev>; Sun, 07 Dec 2025 08:43:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765125827; x=1765730627; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8XX5LTtkJfB9p2MjVfS1613FXxwOAuGBUTWB9MA6u2A=;
        b=GLmijdhpWmo+AX9RxZ5ZRvN9reU32pBDDjdddvFLiTzcDRpQOa2qrMXb46q0ZeKAOi
         mju7bLESG/PUkwmPve2kNIjOE2C9Fp3Ap2mkBk+/twBWPEcPrnZG5u3Z0kGlPx2rme2M
         Z3dBtgL/ruZWBTv1LHop+w9FzMfAPJAQ8sWvXsjIp5SOAjeXB6DYzZTgDoj7Qd5RjWKa
         An4AldxAOwWnq7cavO53Lt6W0CoSGouX6x3xI9Bq01HBNpfEaDGB4WjKSy2AQDV6nWvG
         oalv4eFW2ln+UBlRaLyWQ8puq7WES70UxuBChGZQ1JsxnHqn5aHD7ynm7HaFmT6NvNjo
         svkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765125827; x=1765730627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8XX5LTtkJfB9p2MjVfS1613FXxwOAuGBUTWB9MA6u2A=;
        b=lmJtG+83a88HtYcDLz5oLCPmAwhbxvUWT62R39igk6txpJ2kcNIif4XlfqFGqdfSQ3
         TtaTWVfTDJ9JD5YfaUc63FFla4i+kC7cyUmsNuHqZIupT6Gkti5Mw74AvWI/ubO/3hEs
         5uryOv4GabHxgXVCVUgZnL4zNqqIdPJS+j5kG3/r12mdUIgGoNDyGEPn6ajRCnGl3jZx
         FQOOwVHlZZYxH8xjbdeFpvV87Mn050V9K3TUZq08DRs0ZBQYPX9awC3xZ+js4ByL6g6i
         fCbNX+sGnJj2sOfz1iWIp3ERpXzMOAJeiilJ6kjQyrac/j/5F67ptBk370pI4+621CHK
         bjgA==
X-Gm-Message-State: AOJu0YzgwQEslspQSNqh/1V6zOoNRxT+SyMWF5ygaaVrIGc11TiLV4Xl
	e1sRH+gHKgBFZMjYzgJm7MLUzTkixkxV3Zgo474Rf7ksnxBAewswv6CIaNUgww==
X-Gm-Gg: ASbGnct0kCV0/DJdo7bX+fw2Y21GSZcmCZIjGkaM7M2BCyj+mCozdfNWBhL5aY3PnDn
	DBZMY1xcWXBWYGnoVzcnfHwDghzzwv1cTemmdMjtkUQtaDMw2YnUOAiUNzt7PmcEvF0gXeGMCKH
	B8PjFAXwgtBcQFotcA1ASq00TidvS4fCVmmvTanV76W/THSxqfHIUZYoi0Whcr7RFq+AAD6XycQ
	mabQasS6ZI+VmHe1rW/LkGD5hxLmV0i/CBZBNrXHHeUCbeK1AiUSv983Kw6fjD8AZQx9rNkD9gk
	F8UlZQmW3eOXTcvcSjUF0XGuKZihnD8dUtByi1i2dF+TF++QOEIBMnAaiRgrakKsFaHf+dktGvK
	Wb2cVx50k0tZlkz80uLJmf8wDp019pxaCYzolY7O0EbrnIIFNGi/QkDod+LQ9DIijSg5pmyZ6bF
	T9tfL1SSft+N7kBitg1XyDh4VnZCtivnC0
X-Google-Smtp-Source: AGHT+IHdH4XmI4hIo+FBoZVrnL+XFoqAh/bKrwaFHBEmbsavQyJYthDHroScXtzp+fiOHdBWvkM02w==
X-Received: by 2002:a05:6a00:62c9:b0:7ae:b13f:37c2 with SMTP id d2e1a72fcca58-7e205c0d557mr8076285b3a.10.1765125827341;
        Sun, 07 Dec 2025 08:43:47 -0800 (PST)
Received: from localhost.localdomain ([38.224.232.243])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7e29fb94567sm10625779b3a.15.2025.12.07.08.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Dec 2025 08:43:47 -0800 (PST)
From: Dharanitharan R <dharanitharan725@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dharanitharan R <dharanitharan725@gmail.com>,
	David Laight <david.laight.linux@gmail.com>
Subject: [PATCH v2] staging: vme_user: simplify bus number allocation using ffz()
Date: Sun,  7 Dec 2025 16:43:17 +0000
Message-ID: <20251207164317.4835-1-dharanitharan725@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

David Laight pointed out that the loop in vme_register_bridge()
is effectively searching for the first zero bit in vme_bus_numbers.

Replace the manual loop with ffz() and use BIT(n) for consistency.

Suggested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Dharanitharan R <dharanitharan725@gmail.com>
---
 drivers/staging/vme_user/vme.c | 15 +++++++++++++----------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index 2095de72596a..45381e677475 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -1765,16 +1765,19 @@ int vme_register_bridge(struct vme_bridge *bridge)
 	int ret = -1;
 
 	mutex_lock(&vme_buses_lock);
-	for (i = 0; i < sizeof(vme_bus_numbers) * 8; i++){
-		if ((vme_bus_numbers & (1 << i)) == 0) {
-			vme_bus_numbers |= (1 << i);
-			bridge->num = i;
-			INIT_LIST_HEAD(&bridge->devices);
-			list_add_tail(&bridge->bus_list, &vme_bus_list);
-			ret = 0;
-			break;
-		}
+	
+	/* Find the first clear bit */
+	i = ffz(vme_bus_numbers);
+
+	/* Ensure we have a free slot */
+	if (i < BITS_PER_LONG) {
+		vme_bus_numbers |= BIT(i);
+        bridge->num = i;
+        INIT_LIST_HEAD(&bridge->devices);
+        list_add_tail(&bridge->bus_list, &vme_bus_list);
+        ret = 0;
+	}
 	mutex_unlock(&vme_buses_lock);
 
 	return ret;
@@ -1787,7 +1790,7 @@ void vme_unregister_bridge(struct vme_bridge *bridge)
 	struct vme_dev *tmp;
 
 	mutex_lock(&vme_buses_lock);
-	vme_bus_numbers &= ~(1 << bridge->num);
+	vme_bus_numbers &= ~BIT(bridge->num);
 	list_for_each_entry_safe(vdev, tmp, &bridge->devices, bridge_list) {
 		list_del(&vdev->drv_list);
 		list_del(&vdev->bridge_list);
-- 
2.43.0

