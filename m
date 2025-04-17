Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1197C1D7E50
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 00:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744850751; cv=none; b=VaR530B2yIHkSTXOkPr3pG302Wu9OGxTb1G92cTIFx1sh6e/N/gUbtFfY28bUe3uhbsgpeiqIWWgU9Gy6RAMD2bZCqeJhj++fAT1mA0vcFF1y8YKP0FU2BA7zbxn1eSjzZjPiJGMJs46A6GcPEOoiSBl/etYjVhWB4B73Vk/TKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744850751; c=relaxed/simple;
	bh=dINICUlUQwKCLuaYFcvZQj0ckrAk0FXSLsUGERu4iAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N/tEDVTJINPdCnxMM9iFnjGVw836Vkj/mo8jdDk/g4dO4Ky6kAwjkFq4W/JyVptIbihFnSDdX3V9R4qgDiW/7DZsvsSk/z4b2T521emt2ghxHoos5tORX+Quh4lSHnakNE68G9IpUQdfS3j5HnjX/mdbFM+95tfUJCVuM7FtF2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=WKvZYoO2; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="WKvZYoO2"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-223fd89d036so2893355ad.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 17:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744850749; x=1745455549; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QHmTXYndf5bH9FTsR78jW+NBjJBfXqdxCg1p2ihtcws=;
        b=WKvZYoO2Rx+0u82ElFwGOiEBkCVzXhvHLKPBNHHCOm864zNfTQ47Vgf+xg6r/sLGmp
         +aZpA8sIcCRx4NCjn7Jzt1HhpCmLOrTNd4k0kJkvPm8NrRslOKbLbdxgSTV0Mp6iRwbk
         J+x4w4iR8Soa1KKD/iTzMX/gMXgHQ6oKUolAZ9RQzAJ1l2xX0i4eQiJKLCOjvtr4IBTa
         1pCcWPiPMr/eZAIDihXymA832MZDDiHzLMEQowXfVFrZ+z8NvYU9xpZX6UbSJbqLiroW
         89Jb+FTjq1DNuhLPr+XdoCsgfBw9fCEKHeJE1SqT+M9FXiY7dHmDcAPVxKIkRj7RcvqR
         YlmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744850749; x=1745455549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QHmTXYndf5bH9FTsR78jW+NBjJBfXqdxCg1p2ihtcws=;
        b=Qhfyhh1GivfcRylWHqlZqDtvs2cBEMIsc3DOdikmEYjI83UGho9BHvV8XRiwfawBI3
         7D58hfPGm42bvNJEKkVpgzoI1vLxJQMYYYBW+ZGtea5VcUoYkLKokW24ilBuBjofAmnu
         CTOcbkZ3CDmsHa3xspRhU0C+nrGp238MooVD11afSFJpOzGXRpJdYcCsbH4IoqRxRRLQ
         C1C8XWp5r+BsTbvjauUFzfvCbabjVITFQmIfHzmxVy2V7VRzVWdngLLt0XW6StwUFkTm
         5OAr4YxlpdxAteoVO5HScfSiIf+NF00gXPKHtowVotQfyKnN5ZZF6rBOrK0NnPPA6OE1
         aQJg==
X-Gm-Message-State: AOJu0YxUd0UxdgLIX++dw1yT6+OcKZKeaeQkWIuQ+pw3xdx7CtPGfS70
	iqW33dzlXyvqPqELKqGqAVDLZHkpUjY8+0yU8DpyV63c6ceFjtgl1sWzyrCZdg==
X-Gm-Gg: ASbGncvwHCcG6RqXd3cnG1CsEmHOLnxsXuMNxnRQjNjgRRNHgI2OdAPaY/EXzbxYWdN
	inu0OdEexpB4+WQiqQ9e5oW8dk51YuvihKp2Ar/FVMFTvZ/oXFwNZhPcd8QKi2cPaBmr5CcevsO
	sdtTtEtpDc6ItoIrWg8xfXsf0WdS+25EfgeKQrqIJ8JbdVbCZqS7z0k/EtYRyhI0JGk7uIolvq2
	4uHssYQzooCx8B9fhpSv6uetrKFfB0wWbCvLdNHuX6aVUia5cRnvslpXbf1IjZj8wivNOSYxRbb
	X2f/M5FMNKRlotpX/eMhKAxDAJKvsD6DowWCJluyK+hbE37R3CZz02/gFX6qRztfWYz2YZu1lo+
	RytpznA==
X-Google-Smtp-Source: AGHT+IH3MhM2hoTiTH/u/6kjUD6KKHoQAem6f3XGNiye6KYVHV/o9gvD0bLkEkhVvZBAs7yhcOL7Lw==
X-Received: by 2002:a17:902:e54b:b0:224:18bb:44c2 with SMTP id d9443c01a7336-22c358c616amr40273245ad.6.1744850749436;
        Wed, 16 Apr 2025 17:45:49 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33faa307sm20904095ad.136.2025.04.16.17.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:45:49 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v2 10/14] staging: gpib: ni_usb: u8 over uint8_t
Date: Thu, 17 Apr 2025 00:45:29 +0000
Message-ID: <20250417004533.86765-11-matchstick@neverthere.org>
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
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index a3d517efca08..d5b281fa8b37 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -589,7 +589,7 @@ static int ni_usb_write_registers(struct ni_usb_priv *ni_priv,
 }
 
 // interface functions
-static int ni_usb_read(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int ni_usb_read(struct gpib_board *board, u8 *buffer, size_t length,
 		       int *end, size_t *bytes_read)
 {
 	int retval, parse_retval;
@@ -720,7 +720,7 @@ static int ni_usb_read(struct gpib_board *board, uint8_t *buffer, size_t length,
 	return retval;
 }
 
-static int ni_usb_write(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int ni_usb_write(struct gpib_board *board, u8 *buffer, size_t length,
 			int send_eoi, size_t *bytes_written)
 {
 	int retval;
@@ -824,7 +824,7 @@ static int ni_usb_write(struct gpib_board *board, uint8_t *buffer, size_t length
 	return retval;
 }
 
-static int ni_usb_command_chunk(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int ni_usb_command_chunk(struct gpib_board *board, u8 *buffer, size_t length,
 				size_t *command_bytes_written)
 {
 	int retval;
@@ -918,7 +918,7 @@ static int ni_usb_command_chunk(struct gpib_board *board, uint8_t *buffer, size_
 	return 0;
 }
 
-static int ni_usb_command(struct gpib_board *board, uint8_t *buffer, size_t length,
+static int ni_usb_command(struct gpib_board *board, u8 *buffer, size_t length,
 			  size_t *bytes_written)
 {
 	size_t count;
@@ -1182,7 +1182,7 @@ static void ni_usb_remote_enable(struct gpib_board *board, int enable)
 	return;// 0;
 }
 
-static int ni_usb_enable_eos(struct gpib_board *board, uint8_t eos_byte, int compare_8_bits)
+static int ni_usb_enable_eos(struct gpib_board *board, u8 eos_byte, int compare_8_bits)
 {
 	struct ni_usb_priv *ni_priv = board->private_data;
 
@@ -1341,7 +1341,7 @@ static int ni_usb_secondary_address(struct gpib_board *board, unsigned int addre
 	return 0;
 }
 
-static int ni_usb_parallel_poll(struct gpib_board *board, uint8_t *result)
+static int ni_usb_parallel_poll(struct gpib_board *board, u8 *result)
 {
 	int retval;
 	struct ni_usb_priv *ni_priv = board->private_data;
@@ -1396,7 +1396,7 @@ static int ni_usb_parallel_poll(struct gpib_board *board, uint8_t *result)
 	return retval;
 }
 
-static void ni_usb_parallel_poll_configure(struct gpib_board *board, uint8_t config)
+static void ni_usb_parallel_poll_configure(struct gpib_board *board, u8 config)
 {
 	int retval;
 	struct ni_usb_priv *ni_priv = board->private_data;
@@ -1474,7 +1474,7 @@ static void ni_usb_serial_poll_response(struct gpib_board *board, u8 status)
 	return;// 0;
 }
 
-static uint8_t ni_usb_serial_poll_status(struct gpib_board *board)
+static u8 ni_usb_serial_poll_status(struct gpib_board *board)
 {
 	return 0;
 }
-- 
2.43.0

