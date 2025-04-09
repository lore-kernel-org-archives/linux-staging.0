Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8781DC991
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 05:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178350; cv=none; b=QOCMk6W3fhsI1N67SWfuM+1PsTJvddVVVIxacYnXBYytibpZxo8NVBf6oj2YOenRqHclK7tGCb2iyfq3v2W/bItWzIBZPbz+YICAOjIryPvZcHf3cJM6LMmTN5GTOcZ8TaL3M0QnXvqk5fSzBrHCkiG0AQhs/dZM91m1sp2BMww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178350; c=relaxed/simple;
	bh=2uVTnlkfRmi7jviGiaYvu7bTwwElCVFfDlGVzZ9llzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DrdBxB0LavkrTh9S2Iy/Z2eqAuYl3F4tBO7GEYqbuqn5G21MBUQ7PL3rNsjykVzAwtENOwMyRh0nU69fczUKvY6/xaV3e7Ndaa8LO/nvtqseEzf6Pzo8D840LSmu0szmt0Ip0lA/VTCNGITPWLTCkJNovBrEwFKbda/Nv7wy8Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=S65URVVU; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="S65URVVU"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-aee79a0f192so4059869a12.3
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 22:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178348; x=1744783148; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wceHmgn6IqtL2iSeZHYJ/lyHWDm317e8g7Wc7VP6PSY=;
        b=S65URVVU7VU21UrEwU0HPSwOVHRpCJoF9g+JQopmpJG9goYkQvHaahrVC2EyUVYvtI
         OIorMhThPRJXLc1KALa5oTABov24PNfXCN0o19oesSY4gCNuTbulkXcbohuV/xRmTbDG
         H351GZiQfLGKJatK9Yp6H2z3rfH99tgI2QquuwAIpSMxoRSBEn8ruYCOEY0Wu4mjGCUh
         7X1XHQ39kQHvZv54sUnpEKAFBnilg4KceFAOKZEnQ1mT+SE50Dww0pxs3DY8oBR2ENC+
         rVj4TjqCSHeUCIJ8xa6NCiHw2XssLEKwLZcXm9YTaOiJx7xM1iZwjtVesYWOxZOU6aVy
         kbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178348; x=1744783148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wceHmgn6IqtL2iSeZHYJ/lyHWDm317e8g7Wc7VP6PSY=;
        b=JStVqqZNsuXFHkfCAWLWlHiotAKZ6u2oQvykpsAtY2OyakQ2df72wF2SIcK4xOKr23
         IBXgczrQVB09EEJAqm+vb6qh+TWSNQ3v1C7HStjrE8+5HT8FvzvZ6+DjIVCvzydysuU6
         tMhdWSiorSq90p6Ppu7/nsq8xfnK9Adnt8UBYd+5dF6UF0yebyTRUUFI2u66BAfG2Wsz
         qF2bKFaCFYx2mmlKJrkc7TLcfpb+bBaTjpOkQj9SWiH+TBVCGR9rySKCEYKww7+nrLTF
         jaES6O8vFXYtVvu0VT+Wa4JTlfLAhSQJnIDAaNBmjwpGwBM9eeQX5tuzXIYZIYcX+8dr
         U+XQ==
X-Gm-Message-State: AOJu0YwjagEQ/N5pqCCt4DxvhyiHIse8euRc9UlKeFd9gzjTSRW+RbaD
	U/I1naZX7KkYU0A8vRQRKxyYuoT0cevMpIbPGAPkBtPQRO/r/VmyKbh3zWX6Tg==
X-Gm-Gg: ASbGncsj1EngjojYBdJS8EHGT4YDeWM3PKyR1ZWb4x9BEZQh6wICwrKawCX2gvxauVz
	TomcxQtZvA0MncyzJOdeg8+XpzffRL17mhI476u0YOfmZQROauOr6VOwRJBriPGdQXxdsefR/gW
	NI6xeG3Bg+/3gHFgZvJ2Bq9J9Fx/AvB4zaB0KWAkl+3o0r+OXlzGDN2jfm292uY/0ULO5P+RQnw
	nCFnl1jN/PwjzI3HcNAPgvXa2/AHbW/2Aqr/7+Eo7dSUqtNSu7Al8jukqna3oS2Y6oaePj5Uxjq
	pujGkpNRiEo9iaSZV6cwX7v2OvQ/IlNBTuWmzC3TcNgLPaztBCvt0lmfSA/sYxSUPlfd/W/P3y+
	EiS3heQ==
X-Google-Smtp-Source: AGHT+IFIhXnuW04WLdiWT4GUokoi4V5x2Z+gh4XvDhUkaTS4AbtEARWJsMxnN3G1skpWl9beNEtZbQ==
X-Received: by 2002:a17:90b:2e4e:b0:2ff:6e72:b8e2 with SMTP id 98e67ed59e1d1-306dbc2e945mr2581540a91.31.1744178348479;
        Tue, 08 Apr 2025 22:59:08 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd10c40dsm664351a91.5.2025.04.08.22.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:08 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 02/21] staging: gpib: Using struct gpib_read_write_ioctl
Date: Wed,  9 Apr 2025 05:58:44 +0000
Message-ID: <20250409055903.321438-3-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409055903.321438-1-matchstick@neverthere.org>
References: <20250409055903.321438-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for 'struct gpib_read_write_ioctl' to remove typedef.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c  |  6 +++---
 drivers/staging/gpib/uapi/gpib_ioctl.h | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index e12a9e56d808..02ead46453a7 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -865,7 +865,7 @@ static int board_type_ioctl(struct gpib_file_private *file_priv,
 static int read_ioctl(struct gpib_file_private *file_priv, struct gpib_board *board,
 		      unsigned long arg)
 {
-	read_write_ioctl_t read_cmd;
+	struct gpib_read_write_ioctl read_cmd;
 	u8 __user *userbuf;
 	unsigned long remain;
 	int end_flag = 0;
@@ -940,7 +940,7 @@ static int read_ioctl(struct gpib_file_private *file_priv, struct gpib_board *bo
 static int command_ioctl(struct gpib_file_private *file_priv,
 			 struct gpib_board *board, unsigned long arg)
 {
-	read_write_ioctl_t cmd;
+	struct gpib_read_write_ioctl cmd;
 	u8 __user *userbuf;
 	unsigned long remain;
 	int retval;
@@ -1024,7 +1024,7 @@ static int command_ioctl(struct gpib_file_private *file_priv,
 static int write_ioctl(struct gpib_file_private *file_priv, struct gpib_board *board,
 		       unsigned long arg)
 {
-	read_write_ioctl_t write_cmd;
+	struct gpib_read_write_ioctl write_cmd;
 	u8 __user *userbuf;
 	unsigned long remain;
 	int retval = 0;
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index 4ddcbc2a81b0..15c924efe5bc 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -17,13 +17,13 @@ struct gpib_board_type_ioctl {
 };
 
 /* argument for read/write/command ioctls */
-typedef struct {
+struct gpib_read_write_ioctl {
 	uint64_t buffer_ptr;
 	unsigned int requested_transfer_count;
 	unsigned int completed_transfer_count;
 	int end; /* end flag return for reads, end io suppression request for cmd*/
 	int handle;
-} read_write_ioctl_t;
+};
 
 typedef struct {
 	unsigned int handle;
@@ -121,9 +121,9 @@ typedef struct {
 
 /* Standard functions. */
 enum gpib_ioctl {
-	IBRD = _IOWR(GPIB_CODE, 100, read_write_ioctl_t),
-	IBWRT = _IOWR(GPIB_CODE, 101, read_write_ioctl_t),
-	IBCMD = _IOWR(GPIB_CODE, 102, read_write_ioctl_t),
+	IBRD = _IOWR(GPIB_CODE, 100, struct gpib_read_write_ioctl),
+	IBWRT = _IOWR(GPIB_CODE, 101, struct gpib_read_write_ioctl),
+	IBCMD = _IOWR(GPIB_CODE, 102, struct gpib_read_write_ioctl),
 	IBOPENDEV = _IOWR(GPIB_CODE, 3, open_dev_ioctl_t),
 	IBCLOSEDEV = _IOW(GPIB_CODE, 4, close_dev_ioctl_t),
 	IBWAIT = _IOWR(GPIB_CODE, 5, wait_ioctl_t),
-- 
2.43.0

