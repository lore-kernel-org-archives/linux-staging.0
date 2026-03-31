Received: from mail-dl1-f68.google.com (mail-dl1-f68.google.com [74.125.82.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F40A436B07E
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 05:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774933705; cv=none; b=pdNU9IRP8zu/3z4IASjTEVn+NOliDoV509Rk5YLZuFVyMD7V6LRVH7PJSMsT7o2Rw7aAUnipFClkelondecs5URGrH883eTGDX/7/Rtf6t+tr6LtHpN5mn1iG5k3X4uDj/NEjV4fIFADtloPoyej0dEjIFuVxtMqGTFO8t2h/lA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774933705; c=relaxed/simple;
	bh=LXEuqItetIyC36SRGyr01AJ1CujZsWBrwlP6yxLTRqM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gJvHN0Gj+Aem6oh/H5FHAhjaf3r+xuZSvUn4XVQV/724pdgrFttHK4PbYCTWd7Z+ItVU6o8rMCQRMbj9VPiMfLnp0mccDbvyVXrnGnL18WJFuLAgilc0C2l0wuLjl8QonRyarHSJtXbjpO9/3D5szCmThtIhCf9a+sv8gcyW4HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jeGJZ7sB; arc=none smtp.client-ip=74.125.82.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jeGJZ7sB"
Received: by mail-dl1-f68.google.com with SMTP id a92af1059eb24-12732e6a123so49257c88.1
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 22:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774933703; x=1775538503; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GajVOgXFeznoULOZxEt/ReDxJPJQFCuRah3mOyfADoQ=;
        b=jeGJZ7sBa1Z6Pw40s0hEmwXzIJNkwXbXpyKdcfjjjiKv4k94Z6yvR8dd/5am1yXNlp
         1PWc4iLSsGabq+TW2tnbiBp9shvQ8ikcFHmyWgtBDjFrFPU3tUuKTXsv7AXVjieQR85V
         MbWSzb9rh0K7NGP3p8ja36u6jvbjFpXpoUJvO1t7JkMGPahzdXHiQ59s/8vHiwEH4h9C
         X72NC8eGChsvPoM3Wir+9mIFPbq/vZ7b5p/uos9FtmVFGnpjyaIbZ/Bd53x6kXSO4n0a
         uv/JHP7tc1WbtMpaSFlbeNSLPNNZGlYzbrYuhKSfJ6KmkIbuXeDzoD3EoInv+fMV6aNI
         R5yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774933703; x=1775538503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GajVOgXFeznoULOZxEt/ReDxJPJQFCuRah3mOyfADoQ=;
        b=ZSkqEfRKUFOtjOcLCgt7quzdKjc1MKPbVv0Y1CkAG9oFBHMc11WexfWQ3QcclvpEJq
         58MpeljmvIMOJJdqMsOBkmIaPiQabfH5dxpyfn4I8ASJ7kIo7oa3wpQAz5WP7xB2G0IX
         ablA3qyvMfvzAn+wACOTeQCGjM7leaEdcUD7r1dE675HiyeX3HW9SrvM0Q/q3ydY2KH2
         +ZyFiM9/3uxf8P1Ma0CUpF8+BGclrpqGNnn4h6tcv4bdnsa0qNTtSxAsNFGFNhi6kVMF
         hWrCFZuFHce/D+GKf6PpqIXra4Q1MPZyuj2nD3GiYyggDDEkvwac57KhEAY5XFoMZuPW
         H9CQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQaF+IYcM1bDitzho+s1gsobTkPqLqyPqweiwHVSz3T7CeK4qq5lJ62/3gidAPimbw5Hy4RMx3cPMPNuZG@lists.linux.dev
X-Gm-Message-State: AOJu0Yzz68rQK3Yg2Zh9YrikBEfiBil187OwLQI+OpX2A4HtyVWn8vzE
	xXL4AUvxSomGc2UR8/fvpmgYboFqKjdOQzg854qAL6xyfzBilxj8NOuj
X-Gm-Gg: ATEYQzwE7dRjx2+5lOESDomqmg2Fb1Z4OtVfJ4Qc+jATdF+OhyzfSKrOtyB96t48vw0
	7I+PO18DH+/JLH2viE+BXyhtp+4fQB/mCteLKgg8BkJ6H7XN/+xtsv4M5ns+K3GuxyFY1/P3RrV
	DtGZD0NU1GXeKyuMeWD3uLIEzHHL8HxVJ8ItTVAh0szRDJCR4kRRvHosLi1LUSItBi2Q8ihpixL
	uB2Uv9bCYIeIoEku/B8L4t53tPK/I0k4YgwCNTGTDPniXKvpprjPi7Y5dV4cIMnshmoBN33CMU3
	DOoQS3yy7V7A42yjcQTwuPpnM/jMPlvVqX40ptwwLapRUqENfWT1Iqa5UKXpXT9wWQaFKNTc5HE
	ICMFTFPM+6qK6R26zk69fvXqUhbdHaTSHlmbU98mhJsU3c81Gf9dyrutZ8vmO6AtHjUUjHkVKbx
	uA2G05iIq2zRBT2kJQNdotlh2cvTl4czuSH5zjApUQ/w8jd9IpSbKGMVAzah6hojSYaA==
X-Received: by 2002:a05:7022:1a83:b0:123:348d:8576 with SMTP id a92af1059eb24-12ab28a1df7mr8751727c88.6.1774933702964;
        Mon, 30 Mar 2026 22:08:22 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c4aac86esm9214883eec.12.2026.03.30.22.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 22:08:22 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] staging: sm750fb: constify static char pointer arrays
Date: Tue, 31 Mar 2026 05:07:38 +0000
Message-Id: <20260331050738.1547-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The static const char * arrays 'g_fbmode' and 'fix_id' should be
defined as 'static const char * const' to make the pointer arrays
themselves constant. This allows the compiler to place them in the
read-only data section.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 9a42a08c8..b0bdfaeca 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -33,7 +33,7 @@
 static int g_hwcursor = 1;
 static int g_noaccel;
 static int g_nomtrr;
-static const char *g_fbmode[] = {NULL, NULL};
+static const char * const g_fbmode[] = {NULL, NULL};
 static const char *g_def_fbmode = "1024x768-32@60";
 static char *g_settings;
 static int g_dualview;
@@ -728,7 +728,7 @@ static int lynxfb_set_fbinfo(struct fb_info *info, int index)
 		lynx750_ext, NULL, vesa_modes,
 	};
 	int cdb[] = {ARRAY_SIZE(lynx750_ext), 0, VESA_MODEDB_SIZE};
-	static const char *fix_id[2] = {
+	static const char * const fix_id[2] = {
 		"sm750_fb1", "sm750_fb2",
 	};
 
-- 
2.34.1

