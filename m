Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706D0330663
	for <linux-staging@lists.linux.dev>; Tue, 13 Jan 2026 10:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768300666; cv=none; b=ql/C3Osm9vs4xEO4J52VDAijhcjZgQQOLCytwlPzDFkDzxIjLxgR9kNF3LLttYdC1mWQYpE4GYB0v2NBuz0WpRe4syN2hUDVlTa/dd4P6F6MHX16c9rnE+ns/rgzs+QdN5qQ7MaCyVh61I0G92AkHrG/eEm8orZ+V+t3RtFUyx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768300666; c=relaxed/simple;
	bh=0kytHVNeJhJC0XXVaCMs5aSv7phmolsyKnR1GsjYMNc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dsnSNmBjIM0sbGP4S0XiKJqpTUBlrSvt6Jl+Rl5mItFD1Ad+RjcL2oH8/NDaIcB8qs2fFVBqRH/7A2djlkR1TP9z4BWnDmE0NtYklL2x9hDhSlFpI2qTBDsgx84mclUPbz7K3MJyuxBY4QDa2HlDPZByhp6lMx73N3TtW5iKW9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T155f1kH; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T155f1kH"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a0f3f74587so54936395ad.2
        for <linux-staging@lists.linux.dev>; Tue, 13 Jan 2026 02:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768300664; x=1768905464; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Oazj4yczN23Rbwqju/OxFHmi/BXkpTACewJYAxvqYXs=;
        b=T155f1kHU5wCP6nevNB64G56wOJHyTcZAaY/Qv0yNWyLrsTlFGAjaaHZgKFZxpwxDW
         KrjCm8tsEizc7SzKdpeDORL4+3SIN4N2jUJ/tlAx8mzO66nLIxyPSNZ4IgN0G5aeOBg3
         FjmiVCz7H4B4Zg1NLKaBRbCm4r7/Ge+xiUmz8Puh4KHcd2zR/YCKdL1+0n99A50q6D93
         /Y/91YQguJ8XJOashLbY+hLdifwpy+2MY9OTnCe1wg2dSJOI3M8kv/GdURdJGSXZ047u
         5vllh4HhimH57Vr31xqqgM/ae2WNYUSaE0bAfpv+OymfCFY6+X2My0SoraQKquFneMSc
         OFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300664; x=1768905464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oazj4yczN23Rbwqju/OxFHmi/BXkpTACewJYAxvqYXs=;
        b=PqMmVak9EYC1Ya9+4GRTLSvdbiadMFE2vSIenUvNRxcYtjtL7NXTlQbtQDbkbS4WdI
         RUyOhkbr/k6R4oBDYzS80l9UcEJeBNmF4FTp62MFNBK/0vCZKjSKpN+8Xi3tVHwEtx9u
         sUVD6B+WZcYUa7JrjSueSnSbOItVoTmwBErxvhwPMkefvloxKHEfOXxMIocFsHwbe+1G
         YktJnAb1lcjR3Ch3+X3bxsBx4EmAiM2F90pP2MxOaAl4S9aivAyfSHQJqj0XAJIqRbx1
         DnCNZTCv7/r5A5Gui5n0P7tZTVdHviLLCtXmtz8gQ3xJM8uUifpbpsokF7Gz34jOAjHI
         lxqQ==
X-Gm-Message-State: AOJu0Yzu8d/fMs74qJmtFD1jhCbndiaPD6F3mF+bfUkNj/dINO7pekgz
	Eu7Z8CJiMgUrb+RrQ7eza6uXictxlXPu2vet/uwleigZ3BYXEbcfcYT6
X-Gm-Gg: AY/fxX6hnnsHIoTf6UO6fwIRFF1YGn6E7vg8sFlDbJ/vpWDOShtLX0zQx4ezY4HaJPU
	7ON/LVDsF49giHGRDurL8JLTVDIZ5gkyrFXcpJ/JH+KP4ZONB/4Rs8MUVzQNQpOHTE6fHy5/GBQ
	1x83c6YkAH1lwCm0fQuEH+9ZcZPecNECNR7cuocAXTaSTb1zhtHgJQqPzv9ouJK+h8Tz4VXbMKg
	iVvvPHZaU8JMCabQ1ATLcwpvno0o7tpuiGo9dX1sKtHtsolLBGYcs4nAN1iZRedK5efYD173oRl
	JD2P9V1mHRE5ZqRADFVAr2TA2zBp/JVTKI0N7+JmnV//fJD5BJ1mecziqX5X4Q1Hopubokc6BmI
	kGwDRD/UwusOiPZ1VOh8SqeDZ5zhZfRBtk9tLTBslSklrHByornb3m6p0VB+rLFuhwifb3/T6B+
	eCGy5pAUkX
X-Google-Smtp-Source: AGHT+IFbNiOPutKZbCPk2Ib2s2FH0lOFtSTWKU0X5Jb8z683ODPBb559/5ZycXNLmLbC0VM9Gi7LRg==
X-Received: by 2002:a17:902:ce0a:b0:298:4ee2:19f3 with SMTP id d9443c01a7336-2a3ee4edf11mr218273755ad.49.1768300664221;
        Tue, 13 Jan 2026 02:37:44 -0800 (PST)
Received: from cong ([112.197.171.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c48d77sm195748505ad.41.2026.01.13.02.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:37:43 -0800 (PST)
From: Vo Thanh Cong <thanhcongvo079@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	anac.amplar@gmail.com,
	Vo Thanh Cong <thanhcongvo079@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: remove unnecessary else after break
Date: Tue, 13 Jan 2026 17:37:38 +0700
Message-ID: <20260113103738.207570-1-thanhcongvo079@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the checkpatch.pl warning:
"WARNING: else is not generally useful after a break or return"

In sdio_ops_linux.c, the else blocks after break statements are
redundant. Removing them reduces indentation level and improves
code readability.

Signed-off-by: Vo Thanh Cong <thanhcongvo079@gmail.com>
---
v2
	- Add a blank line after the break statement to improve readability
    as suggested by Greg Kroah-Hartman.
 .../staging/rtl8723bs/os_dep/sdio_ops_linux.c | 32 +++++++++----------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
index 5dc00e9117ae..3ea9fdfa14f8 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
@@ -219,14 +219,14 @@ u32 sd_read32(struct intf_hdl *pintfhdl, u32 addr, s32 *err)
 			if (*err == 0) {
 				rtw_reset_continual_io_error(psdiodev);
 				break;
-			} else {
-				if ((-ESHUTDOWN == *err) || (-ENODEV == *err))
-					padapter->bSurpriseRemoved = true;
-
-				if (rtw_inc_and_chk_continual_io_error(psdiodev) == true) {
-					padapter->bSurpriseRemoved = true;
-					break;
-				}
+			}
+
+			if ((-ESHUTDOWN == *err) || (-ENODEV == *err))
+				padapter->bSurpriseRemoved = true;
+
+			if (rtw_inc_and_chk_continual_io_error(psdiodev) == true) {
+				padapter->bSurpriseRemoved = true;
+				break;
 			}
 		}
 	}
@@ -295,14 +295,14 @@ void sd_write32(struct intf_hdl *pintfhdl, u32 addr, u32 v, s32 *err)
 			if (*err == 0) {
 				rtw_reset_continual_io_error(psdiodev);
 				break;
-			} else {
-				if ((-ESHUTDOWN == *err) || (-ENODEV == *err))
-					padapter->bSurpriseRemoved = true;
-
-				if (rtw_inc_and_chk_continual_io_error(psdiodev) == true) {
-					padapter->bSurpriseRemoved = true;
-					break;
-				}
+			}
+
+			if ((-ESHUTDOWN == *err) || (-ENODEV == *err))
+				padapter->bSurpriseRemoved = true;
+
+			if (rtw_inc_and_chk_continual_io_error(psdiodev) == true) {
+				padapter->bSurpriseRemoved = true;
+				break;
 			}
 		}
 	}
-- 
2.52.0

