Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D532517E00E
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 00:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744850742; cv=none; b=t8mNS4gp05c/AgW6x+cMe+Cd9sJsrhkB3oXFoB+qExgZdp9+dSEyjyDV7Zve81Fmt5oaMrVztmWFn6u1jm3SbH2uoEXvo+HZhtXdRSzaEF9bhCrSQZnZtnZ3zmpqurY91u9w7XFFUOzhZbVczap/nIOkR258JVwQAwl2kPL5WPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744850742; c=relaxed/simple;
	bh=rObqEDHrBe/jAWMZ0h4xesD6j8eo5/oyrdSAY1bb5QU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KFkcpS+InU8vUNSht9S/QmgTQEYhfx8XwvydSYx06rxUSr4mprSiGK0WSMSOnb7htirxVbvEvSt17tZdu6lZgO2sxR3zXi+gj+FgHDBtQ4flnnutd1z20+rf/U0pU1ALN5/jggRqBCbd1RdSM3W3pSCUNBF7u8/8Kx+acqA1Kxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=fUE+sRDs; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="fUE+sRDs"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2295d78b45cso3833635ad.0
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 17:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744850740; x=1745455540; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xbx6JupUwv+LRM3RBwYRlbHNbCFfGcJo2p6nMmB6hME=;
        b=fUE+sRDsRx486DnFHpNb6uCYHa+Daq63kIxAPufUDxYK64YGyuCl0Mdu1ZFyHx6UZt
         tDSqQOxt09l9cUP5pwuDwLtRSvglt/Ia8xE8faqRjSIbtiPPFdEREnlfatc/Evnn/i5G
         C2YARHLnrbkuXFqn4sz61eHmZgjwL3QmmSeMotBg59vawEMVrzKYCOhTd7hwY2o8O7a6
         w2tkpeM3qC0w5/q6KFKfX099L/CSq1u4DITRW1jLqWawVaZ/r1iteOwGhP5Ncj/i29AT
         l/8LvwhU2bBkMY33dtejmjbjC+n3V6x7elxcu2CduvKb/Y9D/Kzpbf6J7Bb1jk7fueXR
         1dpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744850740; x=1745455540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xbx6JupUwv+LRM3RBwYRlbHNbCFfGcJo2p6nMmB6hME=;
        b=J/00vGdbF+BIS9Vxb7xXXI2U5VVTA4EHxr+NqVH8qTgxBO3I3V3qfbR38za0yzS+S8
         cByg7e9oAiovL0CqoSuf80LRrt7eVQUTheGyZl4GURoeOdFGPcHY3M9efmcdFu/OKfzm
         kTkbKjs0JelZBOhvpTZBtTzIM6TefpNftgjBzscIkbvdd/GbWoAaAde/bWkqv7C26lDs
         kqAY4zsNjVhXuLaG3kPFsRqD9Qy7YEMIP9QWfEya44w2HFpgSEXtln2Tx6j0fimlQYaB
         vBAXCybWQlmNzV7tqlVaz7Bdu3PfwXCfGm0hX3Dp5Ilu9GX+tn6pX9KnAXbhabnQuGrN
         GmIA==
X-Gm-Message-State: AOJu0YwqabC13Lg3lOZQEw8EQDGwnqFyfWh9jIQUyqWwkj+uckpFiuxN
	OoiH4CWwXc3vr57q5DUP2LnuFUa4NT/UtKsv62+XJn0SL09F0R7hIsTA+UosBA==
X-Gm-Gg: ASbGncsOClzPqoBhIMbafx3MoCglgP3XQJwDWftPlvkB7ehg0QrfayiojXsScMvghHO
	Y13CsTFhR2+Fpr3Hp5roEWAn5/Eo8ldv2DnCPNqGdByA9mWH4CeYNnPZ3I3yDgfh+tDvBUUWHNB
	wfgjuMQM+r7ibn8wPnn12i3zI/PAzBi83WR1lnjMFKo34elucpllStqlw38WsQWZIMLYMO0gp1r
	oJvdJedGNET75awJqC+Fto+OESfA3DK5z4rY/oulu/2CdA7OE2ZQcPqX9aNS2VBvQ2zioWHM/TL
	XecwFHsIW2Wrz27dMQUPhpOxyo3JsA279a7hieGLoImcs1SDyYeWiJijxuhgSvbc1n7KA/uC6Dj
	hhpl8HQ==
X-Google-Smtp-Source: AGHT+IF0YXGqSmFJvRIqGI65Tnqvm7pmkcoFE5ShlFAH+CCj95TpqtmaCBWbFEaDM18PVqURmIb43w==
X-Received: by 2002:a17:902:cecf:b0:223:fabd:4f76 with SMTP id d9443c01a7336-22c35917410mr54024025ad.30.1744850740114;
        Wed, 16 Apr 2025 17:45:40 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fcc04dsm20952405ad.200.2025.04.16.17.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:45:39 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 02/14] staging: gpib: gpib_user: u8 over uint8_t
Date: Thu, 17 Apr 2025 00:45:21 +0000
Message-ID: <20250417004533.86765-3-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417004533.86765-1-matchstick@neverthere.org>
References: <20250417004533.86765-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reported by checkpatch.pl.

CHECK: Prefer kernel type 'u8' over 'uint8_t'

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/uapi/gpib_user.h | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/gpib/uapi/gpib_user.h b/drivers/staging/gpib/uapi/gpib_user.h
index 58b996a8bd7f..eaf7399a164a 100644
--- a/drivers/staging/gpib/uapi/gpib_user.h
+++ b/drivers/staging/gpib/uapi/gpib_user.h
@@ -166,24 +166,24 @@ static inline unsigned int gpib_address_restrict(unsigned int addr)
 	return addr;
 }
 
-static inline uint8_t MLA(unsigned int addr)
+static inline __u8 MLA(unsigned int addr)
 {
 	return gpib_address_restrict(addr) | LAD;
 }
 
-static inline uint8_t MTA(unsigned int addr)
+static inline __u8 MTA(unsigned int addr)
 {
 	return gpib_address_restrict(addr) | TAD;
 }
 
-static inline uint8_t MSA(unsigned int addr)
+static inline __u8 MSA(unsigned int addr)
 {
 	return gpib_address_restrict(addr) | SAD;
 }
 
-static inline uint8_t PPE_byte(unsigned int dio_line, int sense)
+static inline __u8 PPE_byte(unsigned int dio_line, int sense)
 {
-	uint8_t cmd;
+	__u8 cmd;
 
 	cmd = PPE;
 	if (sense)
@@ -192,7 +192,7 @@ static inline uint8_t PPE_byte(unsigned int dio_line, int sense)
 	return cmd;
 }
 
-static inline uint8_t CFGn(unsigned int meters)
+static inline __u8 CFGn(unsigned int meters)
 {
 	return 0x6 | (meters & 0xf);
 }
@@ -202,37 +202,37 @@ enum {
 	gpib_command_mask = 0x7f,
 };
 
-static inline int is_PPE(uint8_t command)
+static inline int is_PPE(__u8 command)
 {
 	return (command & 0x70) == 0x60;
 }
 
-static inline int is_PPD(uint8_t command)
+static inline int is_PPD(__u8 command)
 {
 	return (command & 0x70) == 0x70;
 }
 
-static inline int in_addressed_command_group(uint8_t command)
+static inline int in_addressed_command_group(__u8 command)
 {
 	return (command & 0x70) == 0x0;
 }
 
-static inline int in_universal_command_group(uint8_t command)
+static inline int in_universal_command_group(__u8 command)
 {
 	return (command & 0x70) == 0x10;
 }
 
-static inline int in_listen_address_group(uint8_t command)
+static inline int in_listen_address_group(__u8 command)
 {
 	return (command & 0x60) == 0x20;
 }
 
-static inline int in_talk_address_group(uint8_t command)
+static inline int in_talk_address_group(__u8 command)
 {
 	return (command & 0x60) == 0x40;
 }
 
-static inline int in_primary_command_group(uint8_t command)
+static inline int in_primary_command_group(__u8 command)
 {
 	return in_addressed_command_group(command) ||
 		in_universal_command_group(command) ||
-- 
2.43.0

