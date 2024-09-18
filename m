Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99828132105
	for <linux-staging@lists.linux.dev>; Wed, 18 Sep 2024 08:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726647820; cv=none; b=XogXx7FrrraOcEkVINHEy6fvDrX4+VUNE03zmiD4MQnTERhFljVc3oQbeXSj7EDc4shGyu1XtNk7TrmsZNQW3dEqCmVYG7SnPLIXxMOWwVCC6esOIAom7ciXEsH/+7TuRzt1uWbfNTqEkDU0DVf9u9rMAgNohQ+0OGp1xKPi9ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726647820; c=relaxed/simple;
	bh=/5IEvTBleS798AvFcvG7Ej9WDr2fyFzyFv8KBzmwEGU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UsgSICspSXWIIOAoTkjz2QZmDMt/BuB7+pzjxws5kA8gWCJi1LHz5gq+TxCY6+zUGdQTEN4X24t4PsoWMiK7eXqMNZKIsF1dhnp8cN7XmWFEKp9FakyhHSwG5QK3/KQXgdkgsga7XEEpYJ1D/yv2b3Z6X6c2/q0crBhIbaS4xok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everestkc.com.np; spf=none smtp.mailfrom=everestkc.com.np; dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b=jMPsZ47D; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=everestkc.com.np
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=everestkc-com-np.20230601.gappssmtp.com header.i=@everestkc-com-np.20230601.gappssmtp.com header.b="jMPsZ47D"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20551eeba95so49088705ad.2
        for <linux-staging@lists.linux.dev>; Wed, 18 Sep 2024 01:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everestkc-com-np.20230601.gappssmtp.com; s=20230601; t=1726647818; x=1727252618; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cj7vh/y2frqTNpX+KgUh7EaoShQEplhQ97z3yW6WbXM=;
        b=jMPsZ47DwbU1MbfobXa4ar/lPIGy5nPZeNyP4tn1x1lQTTZ7yXDbQ0KY19UGO9aCdJ
         FwSCCsXIo/Ayt0aNj3da18/GFpi9cbd7nsWWzW7OawDRrwnrWffjgQqKo+gq0oTqQVYz
         dsQNgTaiAH2XgE/09iQh2n61MltWggZShXZ/xeFfmqybU42YZpfPqqqNpvRc211JK8mu
         lsNlgGd+wyULPdiY5DPZ/BXI6oRwk0Eo7z56hZICsEEbr6PGaQvDBYXw7X3kkOLioI4S
         oapdtn2YFTqBjTdIb8Ye6PKrDUq1um5P1bQGEMdPOElxFwHcbJrKwOTnmY6AIx2WUDBM
         T/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726647818; x=1727252618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cj7vh/y2frqTNpX+KgUh7EaoShQEplhQ97z3yW6WbXM=;
        b=Hg81PQ+3UV43wuBfTqX8fQ83CFHMMZjkKN28yh9OeT7gXPZ4HjFFSLh7KZccwuV02P
         5WrUF1T9YQabVMBd9Y08FdFla5bLa31j4A4jpPUhGA7UVeIIv3W6ROehsye4Y1sGnqPH
         aYyO+sHWD7aCGBLmBPXUcf3n4/FC3s8Dh/HUgz93kAQi37XbYQdZKlh/6nYKv324OV1a
         rV18u3TdsbEREpgs2efVB7Ivu2rhBWy4VIvxtIFR4SPvQALgUOmwK4cvjxSD3VOJbILe
         DAf9dMfrh7hCJz3oco3zorVDD9SF5c1pJ7ZyEDETL3mCmrNOO3Wlv8+eRTbpvAGFXnuT
         lYSA==
X-Forwarded-Encrypted: i=1; AJvYcCU7841j/T+/oprsVyNyBfLNvR9WpRSIxx/qlpAifnscze3cagpSEqbvL3EFif/sV7xiV2Rz0jdDJZMckM+0@lists.linux.dev
X-Gm-Message-State: AOJu0YwF3nldEoueEdxgH0OzjGO1YUlc5/zpnj91j5qrT3aGrMxUg7ud
	ehiVUcEEjmN5LARyZs3ODNA49Ca6/M1Z37BIMLJVdxLuJptx+gip/MLQzfS+Uts=
X-Google-Smtp-Source: AGHT+IFaAkemKhufsn5sv7mN7nbCZYrjjcBHtJybEdesp7vxkC4JwTzE7RKsrSsGTBsVs3JkFcM0mQ==
X-Received: by 2002:a17:902:e852:b0:203:a14d:ed0 with SMTP id d9443c01a7336-20781b42d61mr325351095ad.11.1726647817574;
        Wed, 18 Sep 2024 01:23:37 -0700 (PDT)
Received: from localhost.localdomain ([132.178.238.28])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-207946d2a86sm60680715ad.171.2024.09.18.01.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 01:23:37 -0700 (PDT)
From: "Everest K.C." <everestkc@everestkc.com.np>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Cc: "Everest K.C." <everestkc@everestkc.com.np>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: atomisp: hmm_bo: Fix spelling errors in hmm_bo.h
Date: Wed, 18 Sep 2024 02:21:11 -0600
Message-ID: <20240918082203.4941-1-everestkc@everestkc.com.np>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed spelling errors reported by codespell in
drivers/staging/media/atomisp/include/hmm/hmm_bo.h
as follows:
        increse --> increase
	decrese --> decrease

Signed-off-by: Everest K.C. <everestkc@everestkc.com.np>
---
 drivers/staging/media/atomisp/include/hmm/hmm_bo.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
index b4c03e0ca9c0..6d3c74156345 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm_bo.h
@@ -159,12 +159,12 @@ void hmm_bo_device_exit(struct hmm_bo_device *bdev);
 int hmm_bo_device_inited(struct hmm_bo_device *bdev);
 
 /*
- * increse buffer object reference.
+ * increase buffer object reference.
  */
 void hmm_bo_ref(struct hmm_buffer_object *bo);
 
 /*
- * decrese buffer object reference. if reference reaches 0,
+ * decrease buffer object reference. if reference reaches 0,
  * release function of the buffer object will be called.
  *
  * this call is also used to release hmm_buffer_object or its
-- 
2.43.0

