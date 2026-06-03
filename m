Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B6E3D8137
	for <linux-staging@lists.linux.dev>; Wed,  3 Jun 2026 17:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780507644; cv=none; b=KiDVz3BNJa5ZyJ81mK52r5KxlroGMM/xuD6u8sBhQzdhw4c6HRleNgtF+6HumIcW8CSqz/jy+dX2FH864eQV/ouWiaZpfJx7KZPk5lGq0TGppQXOYkGwEcVva8LHWw5MCFMiJAPmbFaDSmcOQnrFo5KiRsnSJJmWLxFQj0kzM0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780507644; c=relaxed/simple;
	bh=XJnN3IJEPMnuuR0TWIy5xm6lOuk/qpZrAXCAVMAtVak=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KOzKKM0+XTuEy6tCAseSx0w4D5k7A7uyTKjGv8DXA/TFJV2MqQZJlXdFqTwgOQpvUUNj982IXFin4r9g27IHqfF8iu8CdO374YazBwm1ic72Ax2K8W/FTtI4AQZQg7/ktND7rhpgDjrVDLnYTQexQNNfJok3VNk7wTXF5AjsEyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eZ+Z/VU4; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eZ+Z/VU4"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49050ff7cbdso121725335e9.2
        for <linux-staging@lists.linux.dev>; Wed, 03 Jun 2026 10:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780507642; x=1781112442; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3np8yYap9dWe0XOqPz/xryRXiNxJeQ3f/xq0zHbsCnY=;
        b=eZ+Z/VU4v4IeL9SUc7bpO5R+4nnmP5EHuDB7pQP4bime5dltRE/MpkMpnlNUVtabQF
         S2qyHhU3MGWf802/aaI8jpVNaHW50PiDRkL66IWaEQJw+t6eusBkPazCSxiGqRosbi8g
         hWvvs9PWlAmcRpehk8H8BSSEC1HL+rhVoo5XmA/E8UgB9Ul7zw3pPDRDv9AFQCysxlKv
         OEg1lK7jZnr+BHyWcL4Vj4RYc8nJAYHciA0nw3b9s7auqjQeveYJwvhIKNz1p1xAiXmb
         kBS7BKdJnfYtRrDobdzQD7Q2ZveaHnIxieT51P5D22K0k/II7Ov11FG9LqyOAtWV0beX
         MdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780507642; x=1781112442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3np8yYap9dWe0XOqPz/xryRXiNxJeQ3f/xq0zHbsCnY=;
        b=rmbPnczmsq0z7ZqhTNgyIRCFPwJFlUznRZY2usYx2PzzDpuyBXlP8bijeAgEAg7Lol
         ax3/USk4A8TDt+EslW8mnMHRF2yznM9aAlMEZCS950Xiirs+omvI8zHsb/tAtP5Vzfqj
         OqRv578XxFBMuEP6R2Vz/RY336JPC2rsJqwOT/4tpbK845MsfhVzkaNpNVtn2w9+iSf6
         bUoOyLsLInxvXdln2/yGU/6jW3PO7nw7gbK5sJ5QDvuuSNbzZjjwKbHwiVXHSGL5ucYs
         sTv1E7vtWB9nPAZJqisKShlTgmX4OnVnwJ9LO1WjzjyxsK1v+w4+9ikERdjKbVT0xlKY
         r1TA==
X-Gm-Message-State: AOJu0YzKqUmElRVI3UmEkqT5QStNKnsBtLcJ4SCCgGQIdFylrzA/RzJg
	c8yP3tg9i6Dr60RjBnBS2KO68Um2gu/XEmyC+QXJM1LIBWSzvv0J2WvpRz3KdkXez+U=
X-Gm-Gg: Acq92OHsNcE8fQ6KCPc3qqY20nwjVysO9ol/Wt2utALZnb2Q4nQ5LYETFx+aXzZ3QAy
	MVNzKVaLDJSKeUoezgAJgmtTPY8pbbb7vxlX3qC4d3XoFT7YgDL2cb513TTtd3pRacg33UoCnW+
	mQOQ5hZAlgjUb/BRTS0ARL44q792O1pdmJ7shvS5QQwUvkeB66R+INJyOz/6BHdcsNA7KAfcOnR
	ya+4pO1agQc27pJ1dm2EO0ti8eVH04y296iSgxK+nA7ne5eIqXJfuEjFSdEwVCJLNBLbcqk8Qhw
	/Ko9qTo1kgbWTOyTZvV3MX/59fvg+Ban9+Rt612brbV0EjLsSaZnPZpiweaxlzw4nfx/o/xmbEP
	yknnmDe53Pbe2ZAZvVEvrHQataoqOfgmrFtrgVlaK8WDPsO6+EoT+ZFefo2Cnik4tSHnwTzubpk
	B3CZfGLOOUouR9qfOssbio+N5Y8C9YgbjxC8qJz8kv5nHVMgN0mqQyfIxQ5dL+mvCJxzBsc9hit
	6aV4urZGHE=
X-Received: by 2002:a05:600c:4e87:b0:490:b58b:a8cc with SMTP id 5b1f17b1804b1-490b5ed0535mr73287505e9.29.1780507641111;
        Wed, 03 Jun 2026 10:27:21 -0700 (PDT)
Received: from MSI.lan (uch71-h01-176-129-204-49.dsl.sta.abo.bbox.fr. [176.129.204.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3fd663sm6558395e9.10.2026.06.03.10.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 10:27:20 -0700 (PDT)
From: Dorian Catric <dorian.catric@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	marvin24@gmx.de,
	error27@gmail.com,
	Dorian Catric <dorian.catric@gmail.com>
Subject: [PATCH 2/2] staging: nvec: remove extra space in enum declaration
Date: Wed,  3 Jun 2026 19:27:19 +0200
Message-Id: <20260603172719.398-2-dorian.catric@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260603172719.398-1-dorian.catric@gmail.com>
References: <20260603172719.398-1-dorian.catric@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove extra space in 'enum nvec_msg_category  {' declaration.

Signed-off-by: Dorian Catric <dorian.catric@gmail.com>
---
 drivers/staging/nvec/nvec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 66d9c3c162179..001201f281fdd 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -57,7 +57,7 @@
  * @NVEC_MSG_RX: The message is an incoming message (from EC)
  * @NVEC_MSG_TX: The message is an outgoing message (to EC)
  */
-enum nvec_msg_category  {
+enum nvec_msg_category {
 	NVEC_MSG_RX,
 	NVEC_MSG_TX,
 };
-- 
2.34.1

