Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAC617A2EA
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 06:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772088777; cv=none; b=ZxP9mODESl2NsUvh8+xmKWs9pFUMwNEfMbuzZpUl6Icl37no2W/RE1yRZpF7bQr4e5VHuG0R1K3Ww73FipX8yJk0AYHm0Jqm64GTYxsKKvu3j/9I8iQba7j+NKswZeg0SY2OuKENtt94/gLLvj7OR74XyCVBqM/X+wo0PjL6wXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772088777; c=relaxed/simple;
	bh=A3ujZpmQs+m++f5ofNQ4Y+YI4G4P0xBHQLKl0ao/X0E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Iur96VtY8QCUYD+TcqxkEZlLA2xGdTASNwBv38PZIfO7gcUu9um1xqrdOoXiZsKfsgpLxTicEdhUqSm9nD9huXBNljJB7t0cKxSASxaonVQG74h+QiQgmwEGs2ckzlIw+EbJLbEOtS7yb8LMigg+dCQAA4wzUa+jDNMve+Ah3Zs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QwBJ4COu; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QwBJ4COu"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ad617d5b80so3019675ad.1
        for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 22:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772088776; x=1772693576; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gf17pvZ1NyScQyL5xRBCKEFufheAGb1+DVddT1v2qng=;
        b=QwBJ4COuTmUtEfHNfV12EffajEmJhc8Qv6BwxBkv6HIEnB0b4b0vmG0g3e4cnLCy4c
         xHlnP3lVv/sJrY27ZlU7v65d1DEcCLgxf/kxwC+1Vdes5HN+sQgID3yP0MIIqrv6SFsV
         GYKwUOJdu1nceTKiHdTmSre63pCuRjigK88XUeQzPHv79WZWGgV7qpjmiLPIxNbr14mO
         6kxjfVBXSVcBrmNgJE5cwRooJ05gCWbXd68J1nQC+wxQ7EKbTj8zrI2vakhXYuKtar+Z
         jFH3P4KF6yEEBne8uKoh6hDyBCR+rZuChSiISBhBFWHMh8qrAtMA6F5kI9AVzsIePcxg
         pB5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772088776; x=1772693576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gf17pvZ1NyScQyL5xRBCKEFufheAGb1+DVddT1v2qng=;
        b=fxnyzb4+Ywevwa2OCEuAnTF64y3xVRiIZ5EFxkXxw08nd6qmMaEYUvcwMGha6ZtIZs
         RYOmDidE+MrEx4PuVsoKP7n95LvM5pZeQDJ278UwGcjKjrMs/4p7BYoK+ihU15x60esR
         i10oqAFZDdeO2C2f3anQxriedbs6XGwLQnffBJSD4a9AM0GNOWGG6lXaAkMGXJMw2GrO
         5XliV7glN6xS0Ehh3JsQ3ZVeWxzyfvGEm0gRtIskwG8M9LUwi1TU54VRDI2kwSITdZWS
         sfS7vCM3/rRaZXZWTsNHzTyjANRKxwkQlWRRlaBMcjM1jsBb2A5EoupBJYeuLqOAm22r
         Z51A==
X-Forwarded-Encrypted: i=1; AJvYcCWQGW+5Z5gzE0wNY6K2mxwd2k7t3SjYpsvt5VBnsiKpAtHeiSLaXIuFCPzmTveyd/mr27HyNqyDFJMFt/Yy@lists.linux.dev
X-Gm-Message-State: AOJu0Yz2Auc6CLJmdx0RZI0p2hiwW7i4ReJ6fNjgqmvzhdo+0pOBUoEr
	xnCNYQIB/XudE5oNooxj7gFQc2DqUAUQp9FXl/KVnyZaeYj2L1E87arM
X-Gm-Gg: ATEYQzwVkb2/7UUm+g4AUdH9GNS9NiUSJKX8/VbbBcILFYYDTvKo+rZt1O8A29vc1Ks
	rydaYGszHktZnKsEv68Bn/GU+PFwLB/lrXRdLa5Zie/f8RXaWTiAYBpC9xZIGBqNS6K92IpDxHq
	rdgObyyAPVEfdfQVDRMHS5HXXD3/dPPe5U0FNaMfxXHlQrc3TxOM40P0ZxNTwn6eMLq/K5Je4MF
	yT2dn46i/tZVXI3eayXuVaI9HXJmziU9McmGYCX8BB0qg/svPPPumGsDE32mzc3ZAxtwtShRbwy
	t1KIMv3xlnzqcG+wNCGhwnspF4gjXoZLarSWakNjigygj8iOEX7u+MFOjwEE4OO2AABJRLADxrJ
	H+jXPiUiiQxT8vNI25cOKeri/ACiLKYHK9Yh1sYi26gvIUDe5I6X4iOrN2mFNIYWwcnEttjNB+n
	EEq92Pliik388PngvhHz3CB5/m+h1dnca5K7YPHBQAoY31
X-Received: by 2002:a17:903:984:b0:2ad:bdf6:6405 with SMTP id d9443c01a7336-2adbdf664d2mr63896525ad.32.1772088776187;
        Wed, 25 Feb 2026 22:52:56 -0800 (PST)
Received: from fedora ([2409:40e5:11e8:25ba:c234:5daa:9801:9675])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5c1976sm13490575ad.22.2026.02.25.22.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 22:52:55 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: hvaibhav.linux@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH] staging: greybus: arche-platform: Use sysfs_emit instead of sprintf
Date: Thu, 26 Feb 2026 12:22:39 +0530
Message-ID: <20260226065239.11698-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor sprintf to sysfs_emit in the show function of the arche platform
driver. This follows the standard kernel practice of using sysfs_emit for
sysfs attributes, ensuring consistent output formatting and newline
handling.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 drivers/staging/greybus/arche-platform.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index f669a7e2eb11..de5de59ea8ab 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -374,15 +374,15 @@ static ssize_t state_show(struct device *dev,
 
 	switch (arche_pdata->state) {
 	case ARCHE_PLATFORM_STATE_OFF:
-		return sprintf(buf, "off\n");
+		return sysfs_emit(buf, "off\n");
 	case ARCHE_PLATFORM_STATE_ACTIVE:
-		return sprintf(buf, "active\n");
+		return sysfs_emit(buf, "active\n");
 	case ARCHE_PLATFORM_STATE_STANDBY:
-		return sprintf(buf, "standby\n");
+		return sysfs_emit(buf, "standby\n");
 	case ARCHE_PLATFORM_STATE_FW_FLASHING:
-		return sprintf(buf, "fw_flashing\n");
+		return sysfs_emit(buf, "fw_flashing\n");
 	default:
-		return sprintf(buf, "unknown state\n");
+		return sysfs_emit(buf, "unknown state\n");
 	}
 }
 
-- 
2.53.0

