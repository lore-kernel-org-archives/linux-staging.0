Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D5C3DAADD
	for <linux-staging@lists.linux.dev>; Fri, 28 Aug 2026 16:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933725; cv=none; b=mV1p23H9w5em9Y4pkhvKTxGmKd0yHjR10VYie1Qkt7WupkqasBow+WHlZNWUbhVoEqwvjAtxypFcB96vDFACK4Clg4cXpOJ3JLHX4sAx5yejkmtICMxDwCA9NBAlbpUQJ9krCT05Ftadj0e4VAO3ra0HW0IHR0ALUoGXejh91Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933725; c=relaxed/simple;
	bh=lqjQ+w4LmrSC2rxWGQiBGYQWVk3GIrLSHHgwOec02E4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oY9/RBPn9qblwgMhjBdXkvQWN9hUAiGWrl1VyrCIxB17g7ikmT5XEUYg78yL8v4FP+RTDXr4V0zfZYBwABEIkXeU9O4xVzAqh8ClQSCRjjWm9FSzDVVvHdZ+Jl/QsLbb19FTUtD/zs7vgbCQrQ4GRMB1hhTWf03lL/C8ABeoUdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HE3ycbA9; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HE3ycbA9"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47f633e6058so751679f8f.0
        for <linux-staging@lists.linux.dev>; Fri, 28 Aug 2026 09:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933722; x=1788538522; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vflBT2anqt8KmrCKKgDiK1zs1+RPR9HYzjd6nQjWsXE=;
        b=HE3ycbA9LoWnS6WU1enA6IqQIl5IbOhj6i9B2oUmbezLv8WwJDCZX8xVCPdPWJKetn
         EGQePNp1ENX/Z6lsQx4OCTpJxo6bJ+m7oBJfiIet45N3GQpVI0kiL/lCLAStUvWLBjQj
         E+O4zN4ZpLg5OpipSrkUTVmrIox7BPlodIQ8FQUZOLuBlB0Hnzs7hiDmWNJuscBuDq9T
         9hUHuZCmjEo69MB1ThlP11dXa/h2uXCSwhifjN2JDGLzd3F7oY2bDlxMCQBoLBWMrtL9
         j7iwtIV5Ks1xEYE5F7P7Jyb98KQ4wSdzjXNkNHZ2S0TLpR63PxKuii/4nKXbCMmzV8XI
         p1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933722; x=1788538522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vflBT2anqt8KmrCKKgDiK1zs1+RPR9HYzjd6nQjWsXE=;
        b=SBWoLGeKqP8p/ZdzsFyX8//K81NclV1KgESdNKea1Q0Yf+xPcEeRrDSPlQNZUU7A/C
         jfhV1NKzDXDJiLVrsBmKGIJeG1EPkqtiWEtp8EyR1+2a+saRWXD5dnsCcfaeG60LKIOh
         ufPfkT3MM7G4ki+iUGQymhFUsI24sErLWDE+pJsHwNa2TEikDITRvZITLWPLR5dP6zzP
         xEJ7r/zO5cdDt7VRh5LDRaY4OXYi8gsDuIIdxdV9pOGuoAxaqIQ1PfGoS/j4DGdv9zzY
         OIS7mKNWXtmWy3PuolEcpLcHOW+mjINv+Jg/khtinwCkKqkamwAhFd6tF9biSuIIx822
         I9hQ==
X-Forwarded-Encrypted: i=1; AHgh+RqkwW2UEIt2VqJHL3YgVs++9FJcT86VEZ+Cg/+yUYI1GH0Y6lM9hPZaMNjUT02XjGYYFxLPgH2rNmOL8pOT@lists.linux.dev
X-Gm-Message-State: AFuF++kDnxO0/aIKEzTRmutUyN4LA5c2dzrpaVqb0tPlaCOpjy8/hyXV
	Dnv6J/X055hxzuyfuEHtXxJsTJSwieA+yLr7NJG9FdMNlG3WiQrpXPti
X-Gm-Gg: AR+sD12Dq/+QHL7m9so0q92V56364yFsOm4cqjr7pE0UYlJCHCYec1q2Qh7ebnGErb0
	i3toGBdmiGRY/XXeytAJrlbjryYRlgMUCP/LXt7eFXBQeecKsaCzFV9+OgYGW6G+wLMysTAbFYd
	DucS7Pct9eU9GGB8JeRoVXg/jSv5Zzy9ckgY9H4RRw0gP4Xq8s/FlVYV8Idx4Zr5gRKQhCWnmC2
	cRT+WvattU4ke0hy5U/uJbW+2HjNvig0hqhBUwPRqqySJ/NNjQ2eekrdFOHVM9swaPlPdeWaamb
	5CBOtMlgEgfbyH+u9Xt4G/HLjrqt3LEaGL0owEIdsfMnVsR0ER04AfWKe/ucHMw/88dwnN19zi/
	xfRmXpfQZmo1EFntYG+94EbNzCvoguOi8MqE/ev5QQ42s+9k7Lo3x0wjRSpkHbf5szqUzWudpb9
	6qEjshTOhH0HuYeNg4EUB5NvFFGmOxv0G8H8P2NYy9D+4pg4XtXTxYN+WVNfWJ/Fam8hXR7MRII
	zhMDU+wjIMHLDSqyprI6uNh49OrnbQo1Q9wHPHznpS4mOjSFjwJ
X-Received: by 2002:a05:6000:2589:b0:47d:eedb:ee62 with SMTP id ffacd0b85a97d-482f79e0b63mr14136116f8f.14.1787933721654;
        Fri, 28 Aug 2026 09:15:21 -0700 (PDT)
Received: from 1Z10 ([78.213.5.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f45sm7629739f8f.7.2026.08.28.09.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:15:21 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v4 09/15] media: intel: ipu-bridge: allow sensor-specific link frequencies
Date: Fri, 28 Aug 2026 18:14:51 +0200
Message-ID: <2c2803b500ed244e59a98506c97eccc4f422cf7f.1787933456.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787933456.git.mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A bridge-specific firmware parser may have more accurate link-frequency
information than the generic ACPI hardware-ID table. Let it store link
frequencies in the per-sensor bridge data and prefer those values when
constructing the endpoint software node.

Existing bridges continue to use the hardware-ID table when no
sensor-specific frequencies are supplied.

Link: https://lore.kernel.org/linux-media/apFzAc5XfV9gQpXS@kekkonen.localdomain/
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 drivers/media/pci/intel/ipu-bridge.c | 15 ++++++++++-----
 include/media/ipu-bridge.h           |  2 ++
 2 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 47317c423fad..5730a95767a2 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -520,11 +520,16 @@ static void ipu_bridge_create_fwnode_properties(
 					sensor->prop_names.remote_endpoint,
 					sensor->local_ref);
 
-	if (cfg->nr_link_freqs > 0)
-		sensor->ep_properties[3] = PROPERTY_ENTRY_U64_ARRAY_LEN(
-			sensor->prop_names.link_frequencies,
-			cfg->link_freqs,
-			cfg->nr_link_freqs);
+	if (sensor->nr_link_freqs > 0)
+		sensor->ep_properties[3] =
+			PROPERTY_ENTRY_U64_ARRAY_LEN(names->link_frequencies,
+						     sensor->link_freqs,
+						     sensor->nr_link_freqs);
+	else if (cfg->nr_link_freqs > 0)
+		sensor->ep_properties[3] =
+			PROPERTY_ENTRY_U64_ARRAY_LEN(names->link_frequencies,
+						     cfg->link_freqs,
+						     cfg->nr_link_freqs);
 
 	sensor->ipu_properties[0] = PROPERTY_ENTRY_U32_ARRAY_LEN(
 					sensor->prop_names.data_lanes,
diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
index 16fac765456e..2290a92361fe 100644
--- a/include/media/ipu-bridge.h
+++ b/include/media/ipu-bridge.h
@@ -135,10 +135,12 @@ struct ipu_sensor {
 
 	u8 link;
 	u8 lanes;
+	u8 nr_link_freqs;
 	u32 mclkspeed;
 	u32 rotation;
 	enum v4l2_fwnode_orientation orientation;
 	const char *vcm_type;
+	u64 link_freqs[MAX_NUM_LINK_FREQS];
 
 	struct ipu_property_names prop_names;
 	struct property_entry ep_properties[5];
-- 
2.53.0

