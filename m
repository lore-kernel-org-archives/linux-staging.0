Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C37257AC7
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151837; cv=none; b=DoXQc3iJKYy+xAauz8hdmSzCyK7G7icu8ihPsBWTQQbEcs8qLXp+/KVEQ/7MaC/1SMQF5G0aKp7IjK1k2pVtODQnG8MQwxUHW8n/L+M3+tzKqirW8qM8//U3uYU1YTYAhB92vMfZ81E74mL1Wcbfz0D3NFmFBJO5caz9Xf7KBBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151837; c=relaxed/simple;
	bh=3gUtVacJwPKBgpo4kagQdtl4FHHCzSx2FeviI3WLXV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ui2Ova+Kup9DHzUlNgndLMDVrWJ8375MtpOVjfcrfQCmBT/I9nzFXDfHNMNwCpa0PR4EQCrH6/6bZnc3ifXAV2R+3PxiAl602KjBpCiu1Ts2pv0uIzdKB9beBRt19Wnx2b7pOGBBCpc/Ilg5kJedWEBm2Zk1FJ7xYuN35uBuxiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=OQQ6qxKq; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="OQQ6qxKq"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-739525d4e12so5552099b3a.3
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151835; x=1744756635; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0HA0A/F9wdD3qtvPDerH40ZSpT7NQGhe4df1MFgMzz4=;
        b=OQQ6qxKq9hlSI9DPtZtwnUr9Gr+i00lHdSOpijG7MUcVjl+VhWqI4uiv1PDlvpZnuS
         kL7C+oTB5d42ygJUAGYOpmOuXbJYOkb89ceq/7o8xMRjLo93xR7im4k7qgf9HpvX4TSc
         hO86jkTdZSrcnUEDgIoBdSRU25PiG7GqzEOrlKlD1j0rCppiu5Twnyb9VsV8PcEYct6S
         PvvGFvV5bSAIwWKOdrk/thumrnB5LN4BjUIhBaTWn1g5uVOxU+rqhIXr/ybxrELHlPOJ
         +wpC0Fw8VtcIZaLH0r79gLBB4FzQ8J4hFjsYrPsWuzjB7EfC8vV8bHITpGReGUhZh7TS
         uC9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151835; x=1744756635;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0HA0A/F9wdD3qtvPDerH40ZSpT7NQGhe4df1MFgMzz4=;
        b=r1VKfYQx63clUXvTlkfMOTwW7pYOqiDtfvHmw7MZdfdNrPXmFkBwrki7kWCdR/0980
         ZqFPMDA/kTyBlp7lUf30qfPaDofsR4ilVaw0HZErjtsugea41WEEx4ummooDXzu/mH0o
         bLyEoVlNm005iCNFtkwvxa7K1bnWdbtGE4fM/h8+QO/0IKUVTQkitytdKuF9JkzuRnxr
         aWPm0WHgZ1rd5OzR0wr7e0KjELFcW4Tp81uXn0s/gH0qi8onN6dEEmell7deReVzHzkO
         wjz5tEYQJJ3aiedV7wcUIw5KBn1v2i2BDPH6WsXje568/Q66A8NSzeRkwylseZy5ihBH
         nM4g==
X-Forwarded-Encrypted: i=1; AJvYcCVlFdaoOsc0QRRl5wO/Y5EunHp1/enVUIAESw9cZ6VZ/8fcttcULzw3lQ7whlZ/jqd03ITWUIuJ4qLCa3Nv@lists.linux.dev
X-Gm-Message-State: AOJu0YzGKSDkHP4rWOS0HXWDl56yeabmfafObQ1bKhqAi/Ka3iK6oM66
	iJqU1IqG2OPFKG9ScHI8WQiazhHxLcKEvwMaH3rKW2j/RZOpnJ4zwpSIArxa0Q==
X-Gm-Gg: ASbGnctNzv3YNlnJ08qVY3Cavn1qOmObOOb3Tub0+HoVD3AIO4sVCu1BHQJUDv4Rju+
	tIZD9ohEyEp5e78fo7PQLUJF4Zs49Vz8nJEt19iUiSImHE7sxUH8z0maA3fAYXqOQ5W3y/hY3y1
	mbgVyLzrOsNo5CeCL/pb3fumUiytp/w+eXjBhkTmMLqqKyWUbgdFzX1onmSdGoiahLi7hBbUvQ5
	llIO8IC0tQjnmfrfP6Eo9YvyhBgR+3xQuvVrAHsz0ebyoCv1i5jb//fRoQ4D3F2oYYn/xbVdryh
	X0nhgRA8De5+/tln4dK48sNGo4jodUXNJ8HrgWCJVaFW0tTkWrN1/REvK0+LAISJMppnno7Wr3B
	Vj5Vb06gtfQ==
X-Google-Smtp-Source: AGHT+IEDi/FjKYvlTIxDwvfbDp3AA+CHNnv8e0pqSC+FVoN7hv3SGTobPGucbuwf9xOEIMYmPPYxig==
X-Received: by 2002:a05:6a20:6f90:b0:1f3:3690:bf32 with SMTP id adf61e73a8af0-20159190bd2mr954354637.18.1744151835638;
        Tue, 08 Apr 2025 15:37:15 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc2cffffsm9592187a12.13.2025.04.08.15.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:37:15 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 11/18] staging: gpib: hp_82341: struct gpib_board_config
Date: Tue,  8 Apr 2025 22:36:51 +0000
Message-ID: <20250408223659.187109-12-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408223659.187109-1-matchstick@neverthere.org>
References: <20250408223659.187109-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_board_config

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/hp_82341/hp_82341.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/hp_82341/hp_82341.c b/drivers/staging/gpib/hp_82341/hp_82341.c
index 775103d744ba..f2306245ce4c 100644
--- a/drivers/staging/gpib/hp_82341/hp_82341.c
+++ b/drivers/staging/gpib/hp_82341/hp_82341.c
@@ -250,7 +250,7 @@ static int hp_82341_accel_write(struct gpib_board *board, uint8_t *buffer, size_
 	return 0;
 }
 
-static int hp_82341_attach(struct gpib_board *board, const gpib_board_config_t *config);
+static int hp_82341_attach(struct gpib_board *board, const struct gpib_board_config *config);
 
 static void hp_82341_detach(struct gpib_board *board);
 
@@ -619,7 +619,8 @@ static int hp_82341_load_firmware_array(struct hp_82341_priv *hp_priv,
 	return 0;
 }
 
-static int hp_82341_load_firmware(struct hp_82341_priv *hp_priv, const gpib_board_config_t *config)
+static int hp_82341_load_firmware(struct hp_82341_priv *hp_priv,
+				  const struct gpib_board_config *config)
 {
 	if (config->init_data_length == 0) {
 		if (xilinx_done(hp_priv))
@@ -686,7 +687,7 @@ static int clear_xilinx(struct hp_82341_priv *hp_priv)
 	return 0;
 }
 
-static int hp_82341_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int hp_82341_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	struct hp_82341_priv *hp_priv;
 	struct tms9914_priv *tms_priv;
-- 
2.43.0

