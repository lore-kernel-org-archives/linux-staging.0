Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0718B640
	for <linux-staging@lists.linux.dev>; Sat, 20 Jun 2026 05:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781934494; cv=none; b=QMMqubsGaPQU1E3DKSbWjibqVZezGSc/2G8UoqvOdijsr79Ku+qyaq4AKJqXa+FwM2ldGE8mGxzIK5u05c00r+kfw/VKSrUaGhdpoWAFuCT/mzTUdjNCqkYohFuHAl20OFqV8O+dJ/s+zDJss8jupaFQvpMy5GGdKNxv3yefIO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781934494; c=relaxed/simple;
	bh=XjyJT5W1WsG2MyfZ7fnuUwzGcUGg4Y6+iUVCy+1ozYY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l70HOdYuC5C2HJDSjH5B/5oase5G1o3/1qoVTAkI7RdVq/AA6+WPItIJAKCaaJ0XwLRbB1SXxNUQqRpNISouSYS8eh5EEXHRaG+aqM2rN9XrEDb+nfpxnhlwmpHwo8FYLI81yOGYsfSqyFvcJyKNfInW613LceD0NIGhGHPiJv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qKctEmgI; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qKctEmgI"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6974a6e54dbso2468427a12.2
        for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 22:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781934491; x=1782539291; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ed3t8ZxAhZ1D0n+cEn1P+22l2LNZt23J9pURBwnxtfY=;
        b=qKctEmgIO+txxdPvTfQAUh54NwxOLF6agn69shWtECfwLz6+VjZw4Kt6fMd2bj42zr
         k+1kogAGELyg962H/tt3ETxE2MqjoFu0VycbVaKR27zqv5eMnLG29sU5ofkJux2oDWCi
         pQT3PzEGoR1wtDCh2dmF3Pqpj3MWj9CA3NXLD8FZtekrC9DfpLotelZBDrEuu+LbLlVe
         D70UTRsNWrJy7LrdMlYf2HOblb+jwP6yxWTgo0X/yR+NiNNfbcLG/c949iASEO/e0afb
         VVWj5NhkkcBorqChlxAp3cK+rgiP72Hxw5MR88j8zIGXkgwyw5WjhJ6nNUQyoHp3BZA5
         rX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781934491; x=1782539291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ed3t8ZxAhZ1D0n+cEn1P+22l2LNZt23J9pURBwnxtfY=;
        b=VrMhIbpyglRZV/OXtZRzj2WltTp8EKy7poOLdDn3/AHCknGBOkBui/iha7r7lf344R
         U6w/kA2YxFOsabiGn+9241ybcJUm1/JXniBiBM6AYB8GrRAhayYG4zNuMhQhZlS7mRZT
         RRLP4Y+s3OobgXAe3O/nbxb5pA41HDxjxILNH1RbzY1gjwwCAE3yRCtEjbHQOeG5p3Ca
         pKUNEydqAiLEUNevRGl45fDLwOLGslpcUKcZB6jkYN9ki0Hi4E2O44jFey6I7wPuWZfJ
         Uqz2upMtUv2dFPGYxC4l2cMiu5NKUqM3h8uFM207lexPu1wp4GIASi2vNLwBcWEFsFGb
         E6dQ==
X-Forwarded-Encrypted: i=1; AFNElJ912nrasm/99qgXeUW1rB+RpXPECoNAXIfJ/vmRxTe1evN2tl9tHrcRXn1+VNs8bJs524SF7W7m7yhtrPzM@lists.linux.dev
X-Gm-Message-State: AOJu0YyYXdMvkp9IEu3Fdmyng5YRM0H22GT5FdftwGAE3TcReV3Kn9xW
	ldNS7ceUMD7rAVwaDFLpubwdL3CwvGqXrL74jARsEp3+kokh891/pvL3
X-Gm-Gg: AfdE7cmif/hvHQJ1IbB8Dj9Pokgt5i5sM7rsDL6MpPqKEeYnRn7OUl56BXckl4Dd1nR
	PUANiWOn1lCXBqslmribIcCWjVvIHdi1boxHn5y60003ID8mHkXn+eMoN/oSAhVzhbhrS4VowWE
	jwGgVly05iBk0JOtgFrju5LXaBGQynjByfYjwSo0dF3qSo/XBKZdcHX5EyCaenPWiTKnHUxt3PM
	0446T4ZFJVpObghGaZWhTeHInvikb8UVVu/EbnRBVk2OsYxnIJKmV96OPFovu84Ecs+MauxTbKf
	O7DwytxelbxZGPs3Pww6E4xOgufJDYj4zcfbSooMaxIqPtecpnYeh+NYpH6t2Bab/ODaHRABkiQ
	a45kT/k4IEJ75puMkLM2fDi9P5dHqXAH2nuzIeNipaPcYERyRiJ4p3NxE6oyU
X-Received: by 2002:a05:6402:5243:b0:697:64ba:bb9b with SMTP id 4fb4d7f45d1cf-69764babcf3mr2494576a12.17.1781934491202;
        Fri, 19 Jun 2026 22:48:11 -0700 (PDT)
Received: from adr.. ([2a00:7c80:0:3a8::14])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977be498e4sm353440a12.20.2026.06.19.22.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 22:48:10 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
To: mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
Subject: [PATCH] media: av7110: refactor deeply nested PTS loops
Date: Sat, 20 Jun 2026 02:46:54 -0300
Message-ID: <20260620054654.122464-1-andrem.33333@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Extract the deeply nested loops handling PTS flags in the MPEG-1
block into a separate helper function `av7110_ipack_m1_pts()`.

This fixes a checkpatch warning regarding too many leading tabs and
improves code readability without changing the underlying parser logic.

Signed-off-by: André Moreira <andrem.33333@gmail.com>
---
 drivers/staging/media/av7110/av7110_ipack.c | 35 +++++++++++----------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110_ipack.c b/drivers/staging/media/av7110/av7110_ipack.c
index 4be6e225f08e8..a3e69a737e97d 100644
--- a/drivers/staging/media/av7110/av7110_ipack.c
+++ b/drivers/staging/media/av7110/av7110_ipack.c
@@ -136,6 +136,22 @@ static void write_ipack(struct ipack *p, const u8 *data, int count)
 	}
 }
 
+static int av7110_ipack_m1_pts(struct ipack *p, const u8 *buf,
+			       int c, int count, int max_which)
+{
+	while (c < count && p->which < max_which) {
+		if (p->which < 7)
+			p->pts[p->which - 2] = buf[c];
+
+		write_ipack(p, buf + c, 1);
+		c++;
+		p->found++;
+		p->which++;
+		p->hlength++;
+	}
+	return c;
+}
+
 int av7110_ipack_instant_repack(const u8 *buf, int count, struct ipack *p)
 {
 	int l;
@@ -335,26 +351,11 @@ int av7110_ipack_instant_repack(const u8 *buf, int count, struct ipack *p)
 				return count;
 			if (p->which > 2) {
 				if ((p->flag2 & PTS_DTS_FLAGS) == PTS_ONLY) {
-					while (c < count && p->which < 7) {
-						p->pts[p->which - 2] = buf[c];
-						write_ipack(p, buf + c, 1);
-						c++;
-						p->found++;
-						p->which++;
-						p->hlength++;
-					}
+					c = av7110_ipack_m1_pts(p, buf, c, count, 7);
 					if (c == count)
 						return count;
 				} else if ((p->flag2 & PTS_DTS_FLAGS) == PTS_DTS) {
-					while (c < count && p->which < 12) {
-						if (p->which < 7)
-							p->pts[p->which - 2] = buf[c];
-						write_ipack(p, buf + c, 1);
-						c++;
-						p->found++;
-						p->which++;
-						p->hlength++;
-					}
+					c = av7110_ipack_m1_pts(p, buf, c, count, 12);
 					if (c == count)
 						return count;
 				}
-- 
2.43.0

