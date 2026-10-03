Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4805132B104
	for <linux-staging@lists.linux.dev>; Sat,  3 Oct 2026 13:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791034718; cv=none; b=kSn9Deb4XMxEQbs/u/ftodmGFNucd4m92vOQ47Rf78dP3jDatrvqvMsLp5tHnvr+AjXuGgsHVb1v0ba7roX8n5akFvf9Whsq2lZGvxymW330VPdspuKC38cE5UizvMn10bFf3of5u+cpofrq3R0Si+uUeVQ6NY8Yo9JsD5rQQXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791034718; c=relaxed/simple;
	bh=6t8szqv+cgOR2LepzEjwhKfqvCQH6+03QGldEt6Fqro=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EkcV4YinlBwz1kxrGip1lPBoQPiHvKyW4rn/rakchVE/hfPedA6+Kmt/n9ThekayHL+R0RGAXYFE6LWxEVLqI4L1iC3vekGF0qxMmZE0r8n4Ika8xUuv6IViXSsSwfcT8+AN04hFvCrZXxUM7SBxjcxJa6DIbrWq0aVnZzNlYlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gOwePInX; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gOwePInX"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48bbb06e746so158789f8f.3
        for <linux-staging@lists.linux.dev>; Sat, 03 Oct 2026 06:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791034715; x=1791639515; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=htPw245OkpLIxTp5M5AuLv4RbZXenRfNZx+me5i+YVI=;
        b=gOwePInXGJUxWstOxFRjfUl8Kn2X+vsu1/ZGH4Yn7JPRnASMmsSqRLrwTaJZBhOq4I
         3KsE8PxzaunrqB/th7SwsZFwqEJdpWAk6jt0XgwkSEGr8fkt0rrwcX6flLCWbM2g/uG1
         o2tiAXSJwk7TxySrBGGSUtCAhtMijKAPzXVql3pKSPMM4/anBN/YJMC9aqoHdGRhYHDG
         2OWFjEUWelU+MUhp8UqHo/62/zo+saVtIlSVWVa5CRoQ5eTUaKlBgut9Y4vyw18+JY1w
         LtXIyGkaTBcsZ8ZwJ4gb5HFXmhiDVJidz0XXT5jEivwMGtSP89EjYNPDpHq91U1329LQ
         8rKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791034715; x=1791639515;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=htPw245OkpLIxTp5M5AuLv4RbZXenRfNZx+me5i+YVI=;
        b=b0bqDKHuNVszzsT78lFQCqh+IAbNN3zpNKaSw4hD36dGnPxpV7h41TPC0JnoYVond7
         s3Uy/FdKNtjbTs8bAQNbRYUZss6MSdHt+efvhxMkbf2Em7a2mZD2kWFmhXmyfEQHaKub
         BpZct5/OFcJqUguEoL2BtWqZa85KHQjsjhmQsm1XXT4mYMH4YIO24UvWKI9OCHtCY43E
         dkaBTKkwcrMWAuZA1NTo1JQVMNFqpNguZQQwyyZDaEcK3x5MJXLmKaoEW9OT57MkKXcR
         vGBaUzozXZQxI05Z6q9YXbT31pfuEbAej2ovs6IP46R8lE8tVsYc9NFI68jlfq0up+jy
         PFCQ==
X-Gm-Message-State: AFuF++nLGed9vNyk0hTrhlg24YKUMFUWzdIpwFh+tofGHzYWmwseYFK6
	ljY6skQcNqOU5RgpZ2ulnpMMSYdny8KHvnBuNR/6xrB9eclr6jIAJaDM
X-Gm-Gg: AYBFou1qlq0AutiLBsNtUYpy6W5mqN8gkQTpLjkrrWvlp0gHH2/SkwdSARV9gS2yHeO
	EsJvE3L+tF6ZtZfMAjvzVVSVDzpaw9ag5B9llQyV6uUFbdmtqH9v5Fdu00Cw3xVrd9AtiI6wRON
	dAp1lT+pJol25wikn9iifc4HZtvhDYwUGIY6OQPXtlOCRQTfr5AIKS8ga4zozWoNYqGt6rE0mp6
	rwCnS37otG74qpmQl54p/ZV/EO2usAdp9nN3LJCqvyYowogu/FK8RoWa8U6OEtk7FiWX8bVZv58
	nskeFBGnWyLUONv0ev3dHXYYM77pwb9JamAqbRLFBfC4vpGYHCMbqivRbbYAvbt3T0e7fWqD/Kk
	JYik+oWFHBtp/PwafanAb5da+ZZzd9VrdNhcHNpsmAkoQHm3fFsqHNNojvdVWAXsCZt/jJbkIbT
	XpWQIYZ1tz9gxjO3fNO217o4G3KkxMi70PR13DmZ8NGHzBrzMglh6TaQrs3WscwHd5ABorDRr0/
	2SHtXdbEh5HuFEslJ5YBD1VCJMuIpPALCIqWxO43G4=
X-Received: by 2002:a05:600d:82e6:b0:4a1:6c48:c789 with SMTP id 5b1f17b1804b1-4a16c48c849mr15339205e9.2.1791034715346;
        Sat, 03 Oct 2026 06:38:35 -0700 (PDT)
Received: from fedora.netbird.cloud ([2a06:5904:28f:7600:961a:ef3c:e30a:fb0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a02770e8f2sm151914015e9.6.2026.10.03.06.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 06:38:34 -0700 (PDT)
From: Luca Hernandez <lucay202@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Luca Hernandez <lucay202@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: remove unused driver_stopped pointer from HAL
Date: Sat,  3 Oct 2026 14:38:07 +0100
Message-ID: <20261003133807.27676-1-lucay202@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the unused driver_stopped pointer field from struct dm_odm_t and
clear out its dead assignment loop block inside ODM_CmnInfoHook(). This
eliminates completely dead weight from the driver's HAL layer codebase.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Luca Hernandez <lucay202@gmail.com>

---
v2: Completely remove the dead field and case block instead of simply
    fixing the CamelCase naming layout, as suggested by Greg.
---
 drivers/staging/rtl8723bs/hal/odm.c | 4 ----
 drivers/staging/rtl8723bs/hal/odm.h | 1 -
 2 files changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index f3989fa33d9f..7f9e8ad4a752 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -772,10 +772,6 @@ void ODM_CmnInfoHook(struct dm_odm_t *pDM_Odm, enum odm_cmninfo_e CmnInfo, void
 		pDM_Odm->pOnePathCCA = pValue;
 		break;
 
-	case ODM_CMNINFO_DRV_STOP:
-		pDM_Odm->pbDriverStopped =  pValue;
-		break;
-
 	case ODM_CMNINFO_PNP_IN:
 		pDM_Odm->pbDriverIsGoingToPnpSetPowerSleep =  pValue;
 		break;
diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index 3532f0d79363..e8563ad6ada8 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -848,7 +848,6 @@ struct dm_odm_t { /* DM_Out_Source_Dynamic_Mechanism_Structure */
 
 	/* common */
 
-	bool *pbDriverStopped;
 	bool *pbDriverIsGoingToPnpSetPowerSleep;
 	bool *pinit_adpt_in_progress;
 
-- 
2.55.0

