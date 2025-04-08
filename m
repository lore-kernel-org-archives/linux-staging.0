Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFAC17A312
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151826; cv=none; b=CBbN1h42kDvk9UT7+9CDGRhAE0hT8LkxY0uPRan17qdKONKD5ll0nKlvaTMuaThaapgDnlHq15fmyANuoKUAUqVbhhncO8EFEJko6eS0cYyW21i/mh25r/vT/qJvhqdyu46zPy2v1YugcLCEfLOj7XYDIL36MDMf9AzPeSt4MZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151826; c=relaxed/simple;
	bh=LOomkHuTmEbqkD9S71jgpPwKhCrIEWuwQa+giNptrIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g/KB+HCyKZcljMoMblEuXiAj27COuF4QGLvHMxXG7XaLhzIelv+mYqi8CnsMfnR1PGRcUxqXOhTpgXYzoxLbyA8jf9xhHI4nJOANzwQ+B+CCHwSy39P44HKVXmtXBPm71+EAuZR7BhPdKcq8WFJpojLZphbfRE+KMpDZA1WkvLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=LwXYBbLc; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="LwXYBbLc"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-224191d92e4so58260885ad.3
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151824; x=1744756624; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AP2PXK6Ju2JXIsqif6BfWbW1iCsIHOY8pmyx9+/+GvM=;
        b=LwXYBbLc9zjg2AA8Dv2MQoOjU2H72EP1/4bEtX2r15vA8178hxsnGuxvKMsirEK47B
         MYaOMf6RTK4QWDoVRSsPE2TFI34+EPxUfKdgh6btBRZ+LQ6MOmDGXDAJy5lumrQi94VZ
         Qd0SnOEmB79KHb1zhUTd0MCyQ/tcI8R7UdU1L76yg8Si0ObvtPdfrsLlSIqzVbQneYMX
         FLiWnp7pu0KdAcfno+7CQp3zfA7ZwIEMwuRKcPPt4XaewVfRm2sZr8sQ0NCEQwakq8Bf
         aCpFOdO4/am+lefTs7TnbOLQybYXBMBzaOgk2wWTFCj+ux3e7W1+N3+9pTK1maIdwPjN
         o6aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151824; x=1744756624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AP2PXK6Ju2JXIsqif6BfWbW1iCsIHOY8pmyx9+/+GvM=;
        b=Z1p9Jkal2/UPp+Lt4pffQ0/Ihbq1D+MmRH3c/LakFLCT1j/hoONzRDOIb5adtetvsz
         Y/4x5xeXrC66EJOAsuTclnePI6djluSH9IlSFZvJfDyISUL3neQ1SDxUL1atubbNjKwl
         hKGTyeQPJFPH+5DjQ5fMqDbUmMrg4CBH/mWC4eLe1OV0idQWBaLBuMefYok5Nx8Ivb7n
         G8p4ff4patXW9Su0OFkwWv07HR8a57V5DWoD6z4IxMDUitjnD4eCJKT8Kuzk4qMd1wCL
         DVh8GTW0kIi3310r2z1Fz9F+ZCLdBrvtSkgrYg9rbYeOHIpDceSdyEkgpY8fRIWmda6V
         tPCg==
X-Forwarded-Encrypted: i=1; AJvYcCVdHDFO4OgpT+U8bmzRrN/mFcCJ4Y+LmZFRYzd5OhNnM7H7kWofqgr5QJidTITUDnXyhIlEfJZDc3IM0DJI@lists.linux.dev
X-Gm-Message-State: AOJu0Yxw1kH122Ds9L8KXB/iUGUr2RvsB1CwrkYuxzoBEzZGgycF0Eon
	BMzge4NJ7OTOVnZ0Y03sIFBFsMEMlkjZHeiHZSUUiKh9PwG1CKriQ7QNVjVQwvCIQnUUpTnDIaU
	=
X-Gm-Gg: ASbGncvgno4ywGXEOJjBxxNDfmh+Q9WLcIhoEm525JBy5AQh+bAwkiWDrmYTquW6r6W
	jlO/UHFeqLfr4n87CpA5TkFrcKUNKX9V2bOKCbfEiqYsHxDFyNswQpspGkRmjGY6gy8b3BIc/lG
	z23o/CKY2fXJVmDHVeG7uHsxVBv4Q1mb5OnhiTrtoF5Lq7lstjUBpi+Jx9a87nM+xQZlJzaQOmG
	QuL7FMdlKz0O7iZfRfTI7eOsi2eEz7hDDy+5yHxfCICOM0QC0YsqWfGPHex3o1DKsVq2uVYdc+H
	vXGIrM1zwMPt6mmvVUtOnnHefnQRCaB5+10gllbiOc+TkybN4MnzBTqS7YEzjUFdBUc8NMXl0LP
	zSXy3fHv9umpbdBiaOg43
X-Google-Smtp-Source: AGHT+IGKvEnsdRS5hL6YZmLxvku7FG2molMRR7QZI4ydjjytO0nD6yliVmHOsuIfTe6xa6XFkMqxLw==
X-Received: by 2002:a17:902:ebc7:b0:21f:4c8b:c514 with SMTP id d9443c01a7336-22ac400e787mr5352735ad.45.1744151824093;
        Tue, 08 Apr 2025 15:37:04 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-229785c0223sm106106375ad.73.2025.04.08.15.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:37:03 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 01/18] staing: gpib: struct typing for gpib_board_config
Date: Tue,  8 Apr 2025 22:36:41 +0000
Message-ID: <20250408223659.187109-2-matchstick@neverthere.org>
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

Using Linux code style for gpib_board_config struct in .h to allow drivers to
migrate.

Adhering to Linux code style.

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Reported by CheckPatch

WARNING: do not add new typedefs

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/gpib_types.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index a5c21ac6affc..1c641f17bdeb 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -23,9 +23,10 @@
 #include <linux/interrupt.h>
 
 struct gpib_board;
+typedef struct gpib_board_config gpib_board_config_t;
 
 /* config parameters that are only used by driver attach functions */
-typedef struct {
+struct gpib_board_config {
 	/* firmware blob */
 	void *init_data;
 	int init_data_length;
@@ -48,7 +49,7 @@ typedef struct {
 	char *device_path;
 	/* serial number of hardware to attach */
 	char *serial_number;
-} gpib_board_config_t;
+};
 
 struct gpib_interface {
 	/* name of board */
-- 
2.43.0

