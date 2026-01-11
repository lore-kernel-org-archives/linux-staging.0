Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C6822301
	for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 18:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768154807; cv=none; b=erH8ucfJrPoYM56YP7OsjyqM7Q0IQtW+HQrl4f4P2vr8iLXTdwBDqEilMIzTsWe6An4hS33go9HCwnOONwiq8vZ1QvxXJU6h9nuZRSshqqyKuptp0q0qySV7WhX3NFjYe/GuO1Rrt2grHOONiG+e2L+qZijVtCjObUCEMWYauFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768154807; c=relaxed/simple;
	bh=FDy6DiIUtdj3HazIJHrGjFR6nGpMmHKZl/UdYEKiJSE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BtCjfcx0xjl9swD/TFh2K0/BTCJ2/t434jvQPUjtwQ8Kkz2QbBVxodMqXDYKSL9zuigLbrujG6mu7nzwpdtmM1wZ0LTcE/9/RJw2IRtkvqRGHhcg1tdYKCXtj48FYB2LCv4QjPvWLuxUcPZSzpsG8x2CuIwjcH2O29CvEdLVvr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vh2LjUAO; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vh2LjUAO"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-81f42a49437so264841b3a.0
        for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 10:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768154806; x=1768759606; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sfG+4C/4nUvYvetsovlctcQX7Cc0vxQvTyUECITJ4mc=;
        b=Vh2LjUAOV7DIUWpMtHJp5Qn9u46iAMiCSr3Nm9NQjYxfnvFMWACt4cIlbSV+xnyZv+
         TJAgFWg5OAuqUFsy8Wj8rxLSluvzE67MNm3x/KGbBeXoluBRwzuK8mcv+nSfT6QBuiA1
         TR+Ny8DNut2C/Bj1Or0uttuQCu/0xK4GSp4e0Vu7XksbcWgjsX3PzlIP/LuImMje6EIS
         xJsba/Fu3+gKTqc9lp6m46YOHsB9kE+FlYM3iHdNhsDrQESmowL0kLj2Tla4jVjbuIm1
         4af1/8Su9kIBLFZH9lWhngoajiyCvVTYNZESLgXoxgB34ZZqZoiz6WpDtA67QbXmxPUa
         f6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768154806; x=1768759606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sfG+4C/4nUvYvetsovlctcQX7Cc0vxQvTyUECITJ4mc=;
        b=goc+bBUfOPxQEcg+ZHilKNwcQe62xOwL3vSeMKRz4d3bJiyg5EjKH8bddYQaRiN/xx
         ZX4FGd3z6xp/dLwc37j2NH6DGeMC5fUJ7HrSiz/C+KBOsG/FDVIOBnqsWExv6jTKyLvD
         fFDIKgnXFvD+mJJaw6w1CC8nCTnlb9JlFW8wUfYhx8oO2jBiiHGGbqQQiOYGb8jhkZ3O
         kX5jQoSZY41XrsgkqF5NFBdpS3hYLLfd3iPGdX3Q+pxYkdlIQybdttVoN6VTGWN887xg
         FlPQDCGh1XQmao9tgWiSt5VVbkjDT9MCYGsqEIsiUeEi+Z3SDGXZjYPCE8khin4s8oXn
         dPBw==
X-Gm-Message-State: AOJu0Ywi7xKbhhsfgTLQOAMpHr/ASIlEbjNToAU5yFDlC4cmQdB6ZI1Z
	HILcpvYddLmwTz6q1GBPxwErPinOtfCHplsyuRvoiLc3Y5f7+X41xCrH
X-Gm-Gg: AY/fxX6A8ZDcy9zn3poo4FcDBWmjqLyXZuMmn7vIq4IRduBO50JIiUKKCbCFtbQy0aw
	FVcbyTiXOv40MZLHZyn3t6sc2LEYJZzo12Gfqf9x2Bs0fAWL9dq3eWZw5azFt5wgkjZKninCGoi
	RiaX7ZVYfm45c+ShfdYFsgPMfpVQCNhE5vIciddDMy0CjMK9m4gFgzsrAJyqGwTK/7Jx7zyk9mb
	CAL2XMlh8egqnSK8Vxj2DlPRZQ0bANZrdIuDtzTRu6eAef0dm1UTZrD38otndwWsyDsLmBlFi4r
	c26NrElFE7z7GTjcSP5jI2eRva/W2l7XLOlFlqRfyubdGK1QTdBvh688H3OihWgtDk2D8x6tzoP
	Q7tWkBM/HwTN8eq2PgvoXGo94jE9K1AuJvVxQQHE0NkefV77GGFOB3lLEDbJrNdEzSNx14CN2R4
	QLAT6wOcQG
X-Google-Smtp-Source: AGHT+IFtA18blBIi2dpVQ48ZjkidDMw9k6G0knM4Dw5qZO12I3PJD9STkdMSaqrchwd7FBu+DfKeFg==
X-Received: by 2002:a05:6a20:a128:b0:35f:68d:430e with SMTP id adf61e73a8af0-3898f8f45bemr13925297637.9.1768154805457;
        Sun, 11 Jan 2026 10:06:45 -0800 (PST)
Received: from cong ([112.197.171.165])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f6b064243sm6172937a91.2.2026.01.11.10.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 10:06:44 -0800 (PST)
From: Vo Thanh Cong <thanhcongvo079@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	anac.amplar@gmail.com,
	Vo Thanh Cong <thanhcongvo079@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary else after break
Date: Mon, 12 Jan 2026 01:06:35 +0700
Message-ID: <20260111180635.198615-1-thanhcongvo079@gmail.com>
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
 .../staging/rtl8723bs/os_dep/sdio_ops_linux.c | 30 +++++++++----------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
index 5dc00e9117ae..87444d36c502 100644
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
@@ -295,14 +295,12 @@ void sd_write32(struct intf_hdl *pintfhdl, u32 addr, u32 v, s32 *err)
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
+			if ((-ESHUTDOWN == *err) || (-ENODEV == *err))
+				padapter->bSurpriseRemoved = true;
+			if (rtw_inc_and_chk_continual_io_error(psdiodev) == true) {
+				padapter->bSurpriseRemoved = true;
+				break;
 			}
 		}
 	}
-- 
2.52.0

