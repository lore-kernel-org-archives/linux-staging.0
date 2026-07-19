Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC45B390990
	for <linux-staging@lists.linux.dev>; Sun, 19 Jul 2026 14:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784470185; cv=none; b=nAZaTf5E3a34f2ga3oS0Gvksa+WDfcXtuN9XWrpH9wtWadHyMnXSnGkz0vXGs08dK6Zu6YAhtqkgnlK76wliCzDBHszSrv99UTzAeNMz9xxPfPqeR/ZpNe6NR355GbyZNNG8ppCY6WNC/exUy2WYuvsSaOtObB6Wn2MwbOH2wEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784470185; c=relaxed/simple;
	bh=JT5pBunVOED5YNd5Y/C35r+p54dGIHbbwJ/3rtqdFAc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iWLKFvM9nB3UcEOkB6WzJfIznFFhtyO+IW5FaqyNb7XHEqP/rYG4BkMxzKqLV+WtkJyraAcTkD5wCkuBrMcAgRhxzGHNfRAazW63bOs9+wAn+5Fl3HqwdRN3wy1Ma8fEJoN9hpFJNnxwiZx+auxCzjkYiCOe6Ca2O+sT574Qvr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qhn01n9K; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qhn01n9K"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c96b08cdd1cso6092920a12.0
        for <linux-staging@lists.linux.dev>; Sun, 19 Jul 2026 07:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784470183; x=1785074983; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BvODTp626G7ayt7G642HB6l/p2dvUiPvXuiviwmOFoA=;
        b=qhn01n9KIL6Fgt0UKmzT/PLiskjK70q8r2IJ5Ylpguq7jZ0Oe7z40cMPMQgG4EaRTc
         vTF2qJBeHQ4E8jHFbUOSm6ZO6joOVom0HtwaZLY6lukR7BLAj+4sih12PyNbOnE89ruv
         g8JClALOWWSsMwPdWYEj1lchqg827VfrvFYCOJUxvlhnsF8C125GJNPpZi1bdVRZsUag
         l0eRRvo2sdc6y92bZ9vK/YUE6Q2ZyuDBGYZGlEawHaZKuAFmuhk3VSRp9LskDnIRcbbY
         vXxgPxImAAVEg1MxgncRchSOROcanFJcQTTLeQ1YRwyusVWqyMPlcW7GytdHbL9t0cIv
         ZsZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784470183; x=1785074983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BvODTp626G7ayt7G642HB6l/p2dvUiPvXuiviwmOFoA=;
        b=fFP/kWIM376ZTxoQRQnfNS7usChEvYctkg2142dcvPxt0O9T8CPu38O5YZuBFnAHM/
         1vEuCiK3YyttQXuwzXf8h5mnl1ypYecP29tcsPwQaWS3/voC9oRa6GczezXIBiZnmmYd
         WzreS+RpEQYfbyLc2OAsisTHa91J4mihTUrZX02Q7rRA0va7pwanLGKpAaLPZWWQGQZu
         Bn2f2Y7HA3HwOkHIxrFpy7kB40tIcXAWOjSjtyc0fzcpiTpSbzoLrtV4BP5IEJdo0XJd
         wUWafppD3SP3+hBrPxniTol86IHobbmq+jLiPZySneIn+ut6atB/30QxTVrvAPgIQQUK
         6NHw==
X-Forwarded-Encrypted: i=1; AHgh+Rq/9K3GuY/tx3jQOCgn/WbrG9a2Ft73TnI7rHJGq707Mmw2W+iQvxE9GxUfcT8ggD24k3zx5rHgkpqZGWp4@lists.linux.dev
X-Gm-Message-State: AOJu0YzDZPz6vFMkCIB07T4A2VJMZ3o3WWnFIavgMbQlTNfe3tbjUaw5
	Mv1Ur7v3YPpw0qV8izdXg/coGesGr+ND6aQhxBTI931iTKM/WQ3iUMouRWVpKa+U
X-Gm-Gg: AfdE7cn8lF4Z0B4mmyAvFb0/na4GYzKUKIrOe85clpGH2UIHQmSv1m4q56+/N1qq4Zl
	JeolXolkt4z56ezNF+/JvXNddussyaTu+DFLmG66/FtHmfh8RkR8aoUxtyv1Q9RwKRBEPH58fQa
	dP6AEaeQFDDCBWAuLGa/JN6rY/SMR6kP6JYSmTH5CA30hywyj/+7uodpRMfOxXe2yk0eJc9YWUz
	X4HJRLm/Bp6hxVd59+t6yn0J+LUPSbEKyS0bfai8lGBR4Phgri7L3MIV3GD7WOyUgBX8ZWhX+do
	nbg5YfONgOSoFS87uwHum6JkkN19D9E/NTzaIOPAmJgxSv5mMp1xcXtLuBRyaMHivOf2HsBNyQm
	qMJoLx0sVySdzgJmwbt718Jk7MhWjYenk8LNI0hD32bWRK9hr+bxcCZcntImm22roww1o/dqlQV
	B4srJDYQ/XWBx0qJTjLkdbiu+G
X-Received: by 2002:a05:6a21:7d06:b0:3bf:e24e:3afe with SMTP id adf61e73a8af0-3c3ad949d5dmr11182254637.43.1784470183117;
        Sun, 19 Jul 2026 07:09:43 -0700 (PDT)
Received: from UbuntuOS.. ([49.34.211.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20bf96sm26738331eec.28.2026.07.19.07.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:09:42 -0700 (PDT)
From: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Prajval Chaudhary <prajvalchaudhari733@gmail.com>
Subject: [PATCH 2/2] staging: media: atomisp: Mark pad_w and pad_h as const constants
Date: Sun, 19 Jul 2026 19:33:50 +0530
Message-Id: <20260719140350.8266-3-prajvalchaudhari733@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260719140350.8266-1-prajvalchaudhari733@gmail.com>
References: <20260719140350.8266-1-prajvalchaudhari733@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that the user-facing module parameters for pad_w and pad_h
have been removed, these variables are strictly internal driver
configurations. Mark them as const to prevent accidental runtime
modification and allow compiler optimization.

This completes the internal cleanup follow-up resulting from
addressing the driver's module parameter TODO item.

Signed-off-by: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_common.h | 6 ++----
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c   | 4 ++--
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_common.h b/drivers/staging/media/atomisp/pci/atomisp_common.h
index a2462fc306fb..aa230c3708dd 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_common.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_common.h
@@ -20,10 +20,8 @@
 
 #include "ia_css.h"
 
-extern int dbg_level;
-extern int dbg_func;
-extern int pad_w;
-extern int pad_h;
+extern const int pad_w;
+extern const int pad_h;
 
 /* Minimum padding requirements for ISP2400 (BYT) */
 #define ISP2400_MIN_PAD_W		12
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 5c2f5996a03f..5ca7e79fd1e5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -53,9 +53,9 @@
  * output res, and isp output res. however since we do not have this yet,
  * the chosen solution is the next best thing.
  */
-int pad_w = 16;
+const int pad_w = 16;
 
-int pad_h = 16;
+const int pad_h = 16;
 
 /*
  * FIXME: this is a hack to make easier to support ISP2401 variant.
-- 
2.34.1

