Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9F118C920
	for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 11:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729077142; cv=none; b=mlqSffV8mXitUJHacw3N1pZe/99V6D5tqNLBXbE03fu2KCNKhriqCRlJae0nm/rzlWUUUAmNWvzdQEe78hsIpAIoGt4dZFIkGfqwDoTpp3i3e4K5QKViogsTqDOEVClgFsRBix7CePpo+YDfBjPyI2ZhuT81sfKj4J/q1nZnEn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729077142; c=relaxed/simple;
	bh=tJDFj43ipf5Uv/Yf+NcLjX9Hubv6kqPRi/QDPoCYv/8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eCl0bphd47W0cXhWFWLzk6W8aeOFmffpUv8fEtV4Blj77Jre8zNlgiYuq3bxQz2VJhHr3dpGbltkoW5fShWMiRe+4TeQratDJATwsGSp5GWu7PgdH4s7hL4ntqXsDmN2foaaNADxVBGQDKJg5+9cGkBdEx7b+ikPbobWjElWP/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQmMB/0X; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQmMB/0X"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43118c9a955so54652805e9.3
        for <linux-staging@lists.linux.dev>; Wed, 16 Oct 2024 04:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729077139; x=1729681939; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C5mJJKZNAi94czrmvtDVq1QAVqB2ZLdURQOg9OQoHE8=;
        b=MQmMB/0XzjoR/gJUCqO7VmeBVmQiuLzeRyo1/wNxK7wi6d9Du/1zGgmp97GiZbY2AN
         QBS+joe4Skh+Ys423vAmZb1eQq8nfKxokHVNpumHoRW/2ttIFk5T4CsfY71LXt8ueOfh
         OVMVXUmz4Ay6cbLdnqvUg42b5BP8bvYKFf56VNaaDhANE31Gs5RFAyQDNwzcmJRF0ekW
         svW4B+xO+IXOPh16GKqYkHt+IDeHP01+Dc4sSnwX9fjKekHx5RCDwSOalky7dq2V5q5L
         eyMDDF2CJtGgqJtKJ890RUOa455AI/TLUHGo7sMUBq9bkHip1fRICF9eSieeYHOL6+bM
         /jzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729077139; x=1729681939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C5mJJKZNAi94czrmvtDVq1QAVqB2ZLdURQOg9OQoHE8=;
        b=XLzxPyPjnNl9U47zwQG46yec3Z6JAmz3hPNHAbiu9IBcTMdv/p7ZOR6GD2V7LjdLbU
         gICeoA/x6OXGYF/Uk32anAow9ST8BdSiPfv61DuQtumi5PkaKxyUWRtk6xpxhfsIuaS8
         La3nBF85DP59IseBsVEjWkl3Wevb6iY4RpKmUjffmSnAD+lk9Manhtaezmexomay+Jr0
         ughUQFv1Yg6266uu3DQLkiSoMg0+IhjjhvVhzFe5EY82hEGvH+F92JTkJdPiAwMa4DP4
         4h8ufsUaHQMt/tS5hwD2BpaYhhgkH9zpsOsgAqDPtbka/LShuNyjzV8GcMKpAemzx/A3
         hEVg==
X-Gm-Message-State: AOJu0YwgJCBsQRg05RXnQr3J/W1EKrXElejWPsE7k4K3Nx4Rw2CmFzD4
	f9Medfwum/c4dj6Ft7BjSfNOtM+E0E8JEcwgAct4ckScHwCThhqz
X-Google-Smtp-Source: AGHT+IEYOCdMm4smDFKZ2r4AeJGOc2kiOihy74H3LsXRNJnxpoNTbdwfyNJhlvz+V37VB86pjZMgaw==
X-Received: by 2002:a05:600c:4446:b0:431:508a:1a7b with SMTP id 5b1f17b1804b1-431508a2353mr15713035e9.34.1729077139106;
        Wed, 16 Oct 2024 04:12:19 -0700 (PDT)
Received: from ARL1114-LINUX.. ([196.233.5.237])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43151dfbef4sm14001575e9.17.2024.10.16.04.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 04:12:18 -0700 (PDT)
From: Aymen Khalfa <a.khalfa.1012@gmail.com>
To: gregkh@linuxfoundation.org,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net
Cc: linux-staging@lists.linux.dev,
	Aymen Khalfa <a.khalfa.1012@gmail.com>
Subject: [PATCH] drivers: staging: rtl8723bs: Replace msleep() with usleep_range().
Date: Wed, 16 Oct 2024 13:12:10 +0200
Message-Id: <20241016111210.2469193-1-a.khalfa.1012@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

-Fix checkpatch.pl warning by replacing msleep() with usleep_range() as
recommended in the documentation.

Signed-off-by: Aymen Khalfa <a.khalfa.1012@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index dbfcbac3d855..26e125f556e9 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -429,7 +429,7 @@ s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
 			err = -1;
 			break;
 		}
-		msleep(1);
+		usleep_range(1000, 2000);
 	}
 
 	return err;
@@ -591,7 +591,7 @@ void LPS_Leave_check(struct adapter *padapter)
 		if (jiffies_to_msecs(jiffies - start_time) > 100)
 			break;
 
-		msleep(1);
+		usleep_range(1000, 2000);
 	}
 }
 
-- 
2.34.1

