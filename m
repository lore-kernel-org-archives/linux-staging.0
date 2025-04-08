Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3A025A354
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151130; cv=none; b=TVih//e1f/IW1osrbnG4cExmkVKz1cU452qRD8EY6GHHHoT8MM6qy8hPz4PNXGnmDWESRDtbM8fIfNvbEUa79BZZ4thmuhRt2g6KA+ypaw4NmFsEPOt++QiKhh7fy3I0VUDTMvBUexK98DHCrmn8N+YU8RbV2+3gcS+haly0BQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151130; c=relaxed/simple;
	bh=/JUAqAmra1E7oPDlGlfnYHBsae3aHwZcq3xJ5pyOY0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hNRLPDXR/sM9FvpTr9eldWGc19tR/rTqellXRqUI2MOrEVg6BpgQ1JcgS0JRVFWpGDnbDc4uUg8LxZU2F5gb6fg9k3LU9OLAv97KZcpMpJXIHKByKIN56WJgKWgy0DbOb8kTAsGqN+L9W95G9PYE++HnGxjX4czrIwbC/GP2iSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=Zg390UOl; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="Zg390UOl"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-739be717eddso4812242b3a.2
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151128; x=1744755928; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jy+kPEqBIyOomigqq8ELaZaIXgSLvhQ1H1rYxS1Gxp4=;
        b=Zg390UOlfJIrtFQ0PJrqyRSNlLw5GFsj3MJMmQNCMF8SbpVNeLZ6HiY0Bp84YN9vAM
         oB8+FKiW1MQ7phvRpA5Fug3j5LHhR0yRlKjyPyxEbpEXhtQB7h6BDppXgdvIf+AWPZma
         6uUG6yys4EKMh5aod0rz0amZOPGGo461BJWihtQG9Y0mIRcvg71Cl1MJndKdRXnYlMkS
         xrfBgeL60iOMg75LGVNGRJWWhLPwoXQkz7meoqhtTJXVyo70vJ54FJLxXjfhrXoLeYRO
         FMWJYsqYKaWlFdpyt6Cu0ewDtvj6URayjEpEwLEeUutMFWW4J2dte32tah2e+FWNG9bH
         3NRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151128; x=1744755928;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jy+kPEqBIyOomigqq8ELaZaIXgSLvhQ1H1rYxS1Gxp4=;
        b=mY4D0NoFGPK5pJZO4/H1OEzpJQY58CnrCe79ySWCb1eIbEvguJLyHHuWwY1w9OfLdu
         03Ofc8ZDKwyjSnrwp9Sl8yrA7rwY0IjH0XgV1kv8tohohyBkc/kZ4Ql6HzpPbTnNlJ6o
         183IV2a13mQBnD+mwlZy9iVelmCxKyfd868Y3m5QMrZVVOhAwDzIC2sDfjgbMrKJgXlQ
         ojdBPgfiMADGOSXg/pHVK14aAQWxBMdQV2i/vgMRfAcjQyBp+Irx+5B08qvVcDThofl5
         kN0nPfNmTRp009qda5fgMTWEpVtTPQKg/ze/Jo8izaCUen4vHFPZOz5XRqDLpyn73P5R
         tI9A==
X-Forwarded-Encrypted: i=1; AJvYcCWIbPXkv947LN9yAHSaKvpn0+6U9T1UYlkfs3ZYeAt0NW4r4TO9gcDG8swBR6yKxo6Dc+XGH/XZiluhDxPb@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6+qs9YYQ9glbF6FAiCkeurdlf/QfrhW2Ffw7D42VZTV5Gpab+
	g2v+qNkYLrtCNuQgMGBJKyDPCB9XEVsPWL1Gb/GgSDVvrZCxciXcWwUVgJiMMA==
X-Gm-Gg: ASbGnctS6AYZTblSKOFeFeJwW1hHUgwaCt1qje+bdbeqontHuzqDb0hTgn+7093/Ijc
	73iSiViUL2EHBdmMzngclUenVHRooJnrKPI9P8Oe3SNMRkgoe3A5qgbUi9cPKFrDgEWRLsZUxkN
	7VqTDVlAVhIkf0Ur4CpEi8vcI4+c66DlshVLDCUauFsLktQgZp8Bt6jYrMdNnJiNzCCh/YCv3bN
	/PPqh6ovFKLJ3yZU7iKeB9SLN0qVNIYqVoNxHHu2BXGl4dpLQRrIjjj/5E4HonHU4l56ianWF7D
	GJn7BjY27it9l2GdQXLjzaN8Tz04UzuMH0rH4ZRm2V8yk6avKIiVaZBfUy0gG3ihZd2UN28jgKl
	AQDTtqrQGnw==
X-Google-Smtp-Source: AGHT+IGYcDiGfn//VUp80eK8CC0HS5yxbKQ4gMtbUnVfAKbMWSzcyk8g2p+esNPfkcUEnZ/yPM4+eQ==
X-Received: by 2002:a05:6a21:350d:b0:1f5:75a9:5257 with SMTP id adf61e73a8af0-20159195c99mr930918637.13.1744151128164;
        Tue, 08 Apr 2025 15:25:28 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc2cfbc9sm9615527a12.9.2025.04.08.15.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:25:27 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 16/18] staging: gpib: pc2: struct gpib_interface
Date: Tue,  8 Apr 2025 22:25:02 +0000
Message-ID: <20250408222504.186992-17-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222504.186992-1-matchstick@neverthere.org>
References: <20250408222504.186992-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/pc2/pc2_gpib.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/pc2/pc2_gpib.c b/drivers/staging/gpib/pc2/pc2_gpib.c
index 5ff1d52c14e3..b0b19e2d4782 100644
--- a/drivers/staging/gpib/pc2/pc2_gpib.c
+++ b/drivers/staging/gpib/pc2/pc2_gpib.c
@@ -518,7 +518,7 @@ static void pc2_2a_detach(struct gpib_board *board)
 	pc2a_common_detach(board, pc2_2a_iosize);
 }
 
-static gpib_interface_t pc2_interface = {
+static struct gpib_interface pc2_interface = {
 	.name =	"pcII",
 	.attach =	pc2_attach,
 	.detach =	pc2_detach,
@@ -546,7 +546,7 @@ static gpib_interface_t pc2_interface = {
 	.return_to_local = pc2_return_to_local,
 };
 
-static gpib_interface_t pc2a_interface = {
+static struct gpib_interface pc2a_interface = {
 	.name =	"pcIIa",
 	.attach =	pc2a_attach,
 	.detach =	pc2a_detach,
@@ -574,7 +574,7 @@ static gpib_interface_t pc2a_interface = {
 	.return_to_local = pc2_return_to_local,
 };
 
-static gpib_interface_t pc2a_cb7210_interface = {
+static struct gpib_interface pc2a_cb7210_interface = {
 	.name =	"pcIIa_cb7210",
 	.attach =	pc2a_cb7210_attach,
 	.detach =	pc2a_detach,
@@ -602,7 +602,7 @@ static gpib_interface_t pc2a_cb7210_interface = {
 	.return_to_local = pc2_return_to_local,
 };
 
-static gpib_interface_t pc2_2a_interface = {
+static struct gpib_interface pc2_2a_interface = {
 	.name =	"pcII_IIa",
 	.attach =	pc2_2a_attach,
 	.detach =	pc2_2a_detach,
-- 
2.43.0

