Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F41A7082D
	for <linux-staging@lists.linux.dev>; Thu, 18 Jun 2026 22:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781823344; cv=none; b=rzmvFvMHzguTp9KJNrhqH8tMAPj2LnA6wCc2xPvVU8rRAOn07xbEuR2UtNWxRIi36ja93FP63/vSuIeWNqWmDyAM+oNcWbAQF1j1WqYaCGUZI70bEIx+2gJf4u9BAhm3QpMWH0R1e4Zvp2W2RmG5sUwHbAbKQU/1lswd7MOJ0Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781823344; c=relaxed/simple;
	bh=zLXdyLw1XOAnatgR7S5PHqT8tUVuEMM15V6VyGAZsx0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VAdkajqt3ToCu4/jDxxRc+iFXlppgvmyEqkgn9SPWkqbeQCw4/jIa2b6FsVTHujOO50/98Tinq/Z5c++rvyS5IQOam8s6spq56xWrZRmdFGngzptqDtwI5OfMqplsjJfN7gbW5fiBv8lgAo7YN2XB/lqbWBsHm3UByyWjwYAG3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BVisoOjc; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BVisoOjc"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-695defc333cso2300430a12.2
        for <linux-staging@lists.linux.dev>; Thu, 18 Jun 2026 15:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781823341; x=1782428141; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cIOlPYY7i9SrvQFAWiGZaAzcCwmN/sikWQcEDVMU4Z8=;
        b=BVisoOjcG7Ns9s8GmYHTW/l5YtP/Ah4TsOXdT82X/nnwioa4lcBkvS/2RjZCw+pIwr
         7hEFwFKKt2G+q3UjWYVBVuiUyEDes+jnZsQPfOO1m2X5WtydlC2eYPLKhkgmtjHOUptW
         JmCv8DW03bZjnsVdhIS9EJZD3tCH1IpAVZAtuKNFSDZQSLKUx5fGQu3e3EuXcR7n1Gp3
         PXC5sSg6A5KUUOhc2Ds22X8WrCyxyR2HcIidK727i7pwaeXrxku6f78wA8VrvYhmlq+J
         B9Rocrxl1o6GU/1ITlf0Y70IX7Toi6osxjGj6tX60uZ0bzXpMOudYsnNp6SPAVp4+E6B
         xdPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781823341; x=1782428141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cIOlPYY7i9SrvQFAWiGZaAzcCwmN/sikWQcEDVMU4Z8=;
        b=ottNIP8wJlf6XVotLHTvGscqT7blzTBifrWB/6MGFIRsu/VOY45dMg2a4Kj+ZnFTcX
         nKada9n8mwAg23ahdAz6QeezVsd7odenxkh+ZWyvIPszISEOrMGJkms8KRgMqyG/K4Mb
         isOZtynMeEo5rkHxQavYA/I6URlU1YFOoHM8rXafNaV095NgmU2brdSH13tKJz62Zg9U
         XW2Hr/KqP84R3Q7Y69yjcmL4QFAtYXmOoCxZomwHRzD4pqMgIwL/sDlv+sn9HPG0rkeH
         W/yM9W5GXMrqoG9T2+v5/AeBV7QUQK0Um0gnEam5SnUKuBcOaLBond1BC67Pco4FaefC
         OfBw==
X-Gm-Message-State: AOJu0YzcBqp6/7pnzc9DyxkuWVc/ssvJIGPhckz8LYejA9l2jejkU0k8
	ah+Ievc/7oTnyiWFXvaZPP3WiwIFf538Uquty9djhDGyUqj2LnzcAeitJni7ynB9ISp2ymxPKuQ
	=
X-Gm-Gg: AfdE7cnuiR4OyC+u5KP/pvG2ms5nPv+RYHA9ZiDfrj9rjzWcsOscuF0MTECZsRMlJUx
	zJzxWcxnh1oBnmDIPeFbbF9Nx7ZpzSm2ifJWqw85UcBRZPJE6G3vr2Usaf3cpgVV1wd/mugpJm9
	3yMB0wE8BdKplZDa0nRbwqi3u9tswywYqsu+4bmUbVf98Dk06OibgUnBmU5bAfW3aYvOf/U+SmG
	nRwCEFeBwtp+Yia7wExQysIXDZIIEUvEF0Qc9OLcyPOPyMifB+845rZTL8LGsNfh32IKEWN4dIo
	xkXy/JKlVcn27mp02YMkqKZzFJb5sp/JWvRo0DxVIFoIBt/Gokp7LD+wJsyXIT4KjDJ24r6vFtB
	2WrPSoixiRQ3CuKTLqzX8ZlcXmU2YkcXu17rCunffX2JQTAni1j+o7M5Z7QWE
X-Received: by 2002:a17:907:9447:b0:bec:c237:4ec1 with SMTP id a640c23a62f3a-c097ae2782amr51780566b.13.1781823341173;
        Thu, 18 Jun 2026 15:55:41 -0700 (PDT)
Received: from adr.. ([2a00:7c80:0:3a7::13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0a8490dffdsm12755666b.24.2026.06.18.15.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 15:55:40 -0700 (PDT)
From: Andrezinrc <andrem.33333@gmail.com>
To: linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Andrezinrc <andrem.33333@gmail.com>
Subject: [PATCH] staging: rtl8723bs: replace msleep with usleep_range in rtw_pwrctrl.c
Date: Thu, 18 Jun 2026 19:54:14 -0300
Message-ID: <20260618225414.14210-1-andrem.33333@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The checkpatch.pl tool complains about using msleep() for delays
under 20ms, as it can sleep for longer than intended. Replace the
msleep(1) calls with usleep_range(1000, 2000) to provide more
accurate timing and clean up the style warnings.

Signed-off-by: Andrezinrc <andrem.33333@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_pwrctrl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
index f074ea6e0..cdbdcb7bd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
+++ b/drivers/staging/rtl8723bs/core/rtw_pwrctrl.c
@@ -414,7 +414,7 @@ s32 LPS_RF_ON_check(struct adapter *padapter, u32 delay_ms)
 			err = -1;
 			break;
 		}
-		msleep(1);
+		usleep_range(1000, 2000);
 	}
 
 	return err;
@@ -567,7 +567,7 @@ void LPS_Leave_check(struct adapter *padapter)
 		if (jiffies_to_msecs(jiffies - start_time) > 100)
 			break;
 
-		msleep(1);
+		usleep_range(1000, 2000);
 	}
 }
 
-- 
2.43.0

