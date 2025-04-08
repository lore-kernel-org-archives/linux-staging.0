Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70B9259C92
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151845; cv=none; b=fnwJc6FWS+r6y0S3QM+8IQjnVD1ULaGurCXBkFiGCJ7P1obsv5gSHNXar4CCl+jOoE9YvN3kYDXhJXrj42JpzqpgBO7Q21GPzvtkKeAfTea/TIr8IW3+PSNxUZOQ/QE9vgHQSL7W8U6UmVa65dK8dEADyD8iq4fm698CuzeiJXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151845; c=relaxed/simple;
	bh=oA4pyrX24y1bCy2gqUioXPrzN6EHIu1R3/OUBiH3obw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PQ8s+t8nogG3xtVfnNl4h8O/a8KqOm0zj41uAvDOnqZ7lsNZpwJOxl9NJp0hCeP8LAqZ4kp+AK+TsHixZsjxyWrGr3PgxHezra+hElSMGva8UL9ZOLa2+TmdJHVz+LL01LPvVe2fCg57to6DmYr1+TJQFYH3Je9LDyhHqPbRGUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=hZGgMP3O; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="hZGgMP3O"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-72bccda48cbso3515770a34.1
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151843; x=1744756643; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48CnxiwOG1VbFBlXoNHKj2YQK9a79sPTwkYUOXtTir0=;
        b=hZGgMP3O65sKiXcTh7Jg7XCEHsf2h15SvR80CMLZC0ocVEIVnRqpA83DwnrogtNtzf
         upS33+ZYvmb4UVP9T4aLOOjzAlOkxQkDYyO7nPRhgRZuBxTBCEIB65eefsiNc3c7pnNk
         vd4biNkMquHeFGmTyOOBppOw5ps9xR444gAsh1wXz5GEyhdaJOYJVNUuPcMkVwVURonf
         RQTFIONZsE4VHjtDD+cmdy5Dve15d1LFjPWG5zAIeQ3TQTlC03KoLfVLiz0zyXOAR+vB
         FIDWbH6i7pcDFwAfhSC7yiwfu3x3kefPRm60leB4FzXE5uJbbGpk6LJTl/RiAPWcHbjD
         q1dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151843; x=1744756643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=48CnxiwOG1VbFBlXoNHKj2YQK9a79sPTwkYUOXtTir0=;
        b=fotv3YDy+8Y3zidyXFHctxhZt/lVnvN9wzxyXgLC8Fcd1FDRrHx48zzBhPaLMTGn6X
         u9YUcJMh9CA8XSOk3Y4K3xOHubkUQzR5XCoCzHoOudKLukXGXKFoXffHYtbwbw2mv7LU
         DCJByxCd4y0HlTPiAV8+oFu7b+T6thmd5qZcJR/AddPZ5Oej4V1mHQnjSfeCEKltlnwy
         6i+Mq3d7d6t0IgXcghL4AwIJ1IJcLeXO4Ra2maiEcU0FhvSopOLnGCOAZGY/En2WqNcX
         /jzrUWWYJ6Ew4HvLlnu+0Ms7o/SrrER7j6ebpaHw7FdibK3i7lVj3KHpdK4KMuom8TXW
         H6fg==
X-Forwarded-Encrypted: i=1; AJvYcCXSU24DgygDCBKy3G3KwjS8Sp03MZxPlLhcm0Z9Cha1ghlcdA3RIFYcMQ63qU6QwhgVVTwxWpXxMF3wygMa@lists.linux.dev
X-Gm-Message-State: AOJu0YxwV9WyR0JaIhpIi07/Lp9eaMx6iIsVLAMDTYKMZV62AYv8Jy1Y
	zDtimvT4cYOFQ3aMyLJIX7JOq4BGYeu2owSBikuiyfQPHJM2H6klLtTB3t0wOfbF51EyY5Bkjuw
	=
X-Gm-Gg: ASbGnctks4n36HZHBhe1K4phDQhtYW7/0ghuf7e/M3OUi8oIdUuIJZPECLaEfIJjDCi
	hWYLGYEOFPMr718MxUmObsfI39fJLI8fpHOsAFtgeI3GAs4URenFf4PZANuQ6S7dIfhThbUgufq
	ifpIStdtBCDH2AL72xYts3FL+sZ+eXwVEayQqYPnDLMLbNVsk9xceRvbi3N5ysJnBcD8HCKF6qk
	tPjECYKEwA3unNKxOsY0pmzMgo7TOSm2ebSeIpWHENhv/Jd42I7ssL2s0ahuImFJklokK+Yg4Sx
	qSQkMWHtm7qhTm1Y9LF6OBMnAdJ1O/H1vL27cqvkVJUfOhNLEf5jtgydsmWo/D5HLIYtsnlgJ6b
	EtltiF89FrA==
X-Google-Smtp-Source: AGHT+IE7laCrDlkJfZ2SLpK5B8rdk0gdRJBXS0kMSGA9v+TVbdwQ5sHhRHKe4IAEWaIN+FjdabLoGw==
X-Received: by 2002:a17:902:f686:b0:224:256e:5e3f with SMTP id d9443c01a7336-22ac29bc2b8mr9927275ad.25.1744151832207;
        Tue, 08 Apr 2025 15:37:12 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297866e132sm106704155ad.177.2025.04.08.15.37.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:37:12 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 08/18] staging: gpib: fmh: struct gpib_board_config
Date: Tue,  8 Apr 2025 22:36:48 +0000
Message-ID: <20250408223659.187109-9-matchstick@neverthere.org>
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
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c | 27 ++++++++++++++----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
index b2c379ce4c88..30fbf1065de2 100644
--- a/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
+++ b/drivers/staging/gpib/fmh_gpib/fmh_gpib.c
@@ -32,13 +32,15 @@ MODULE_DESCRIPTION("GPIB Driver for fmh_gpib_core");
 MODULE_AUTHOR("Frank Mori Hess <fmh6jj@gmail.com>");
 
 static irqreturn_t fmh_gpib_interrupt(int irq, void *arg);
-static int fmh_gpib_attach_holdoff_all(struct gpib_board *board, const gpib_board_config_t *config);
-static int fmh_gpib_attach_holdoff_end(struct gpib_board *board, const gpib_board_config_t *config);
+static int fmh_gpib_attach_holdoff_all(struct gpib_board *board,
+				       const struct gpib_board_config *config);
+static int fmh_gpib_attach_holdoff_end(struct gpib_board *board,
+				       const struct gpib_board_config *config);
 static void fmh_gpib_detach(struct gpib_board *board);
 static int fmh_gpib_pci_attach_holdoff_all(struct gpib_board *board,
-					   const gpib_board_config_t *config);
+					   const struct gpib_board_config *config);
 static int fmh_gpib_pci_attach_holdoff_end(struct gpib_board *board,
-					   const gpib_board_config_t *config);
+					   const struct gpib_board_config *config);
 static void fmh_gpib_pci_detach(struct gpib_board *board);
 static int fmh_gpib_config_dma(struct gpib_board *board, int output);
 static irqreturn_t fmh_gpib_internal_interrupt(struct gpib_board *board);
@@ -1335,7 +1337,7 @@ static int fmh_gpib_init(struct fmh_priv *e_priv, struct gpib_board *board, int
 /* Match callback for driver_find_device */
 static int fmh_gpib_device_match(struct device *dev, const void *data)
 {
-	const gpib_board_config_t *config = data;
+	const struct gpib_board_config *config = data;
 
 	if (dev_get_drvdata(dev))
 		return 0;
@@ -1351,7 +1353,7 @@ static int fmh_gpib_device_match(struct device *dev, const void *data)
 	return 1;
 }
 
-static int fmh_gpib_attach_impl(struct gpib_board *board, const gpib_board_config_t *config,
+static int fmh_gpib_attach_impl(struct gpib_board *board, const struct gpib_board_config *config,
 				unsigned int handshake_mode, int acquire_dma)
 {
 	struct fmh_priv *e_priv;
@@ -1454,12 +1456,12 @@ static int fmh_gpib_attach_impl(struct gpib_board *board, const gpib_board_confi
 	return fmh_gpib_init(e_priv, board, handshake_mode);
 }
 
-int fmh_gpib_attach_holdoff_all(struct gpib_board *board, const gpib_board_config_t *config)
+int fmh_gpib_attach_holdoff_all(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	return fmh_gpib_attach_impl(board, config, HR_HLDA, 0);
 }
 
-int fmh_gpib_attach_holdoff_end(struct gpib_board *board, const gpib_board_config_t *config)
+int fmh_gpib_attach_holdoff_end(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	return fmh_gpib_attach_impl(board, config, HR_HLDE, 1);
 }
@@ -1497,7 +1499,8 @@ void fmh_gpib_detach(struct gpib_board *board)
 	fmh_gpib_generic_detach(board);
 }
 
-static int fmh_gpib_pci_attach_impl(struct gpib_board *board, const gpib_board_config_t *config,
+static int fmh_gpib_pci_attach_impl(struct gpib_board *board,
+				    const struct gpib_board_config *config,
 				    unsigned int handshake_mode)
 {
 	struct fmh_priv *e_priv;
@@ -1570,12 +1573,14 @@ static int fmh_gpib_pci_attach_impl(struct gpib_board *board, const gpib_board_c
 	return fmh_gpib_init(e_priv, board, handshake_mode);
 }
 
-int fmh_gpib_pci_attach_holdoff_all(struct gpib_board *board, const gpib_board_config_t *config)
+int fmh_gpib_pci_attach_holdoff_all(struct gpib_board *board,
+				    const struct gpib_board_config *config)
 {
 	return fmh_gpib_pci_attach_impl(board, config, HR_HLDA);
 }
 
-int fmh_gpib_pci_attach_holdoff_end(struct gpib_board *board, const gpib_board_config_t *config)
+int fmh_gpib_pci_attach_holdoff_end(struct gpib_board *board,
+				    const struct gpib_board_config *config)
 {
 	int retval;
 	struct fmh_priv *e_priv;
-- 
2.43.0

