Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E98D3AD521
	for <linux-staging@lists.linux.dev>; Fri, 13 Mar 2026 15:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773415789; cv=none; b=Fz/mxXYsF1ESkwQjg07+oRwuOoxR/aQWGMXnH4cEQ8DXP0kqzfdRPOZOxklRZ4AD73/qt7X+kwQCrRZAlEhWCcCQVotN5n4z4CsSfaLgMUS0TnodzQRXpNIf7e78i2fdU1orEaOhomIT90mSJelkg4nwHJyh/nAtSGyySIuueBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773415789; c=relaxed/simple;
	bh=dxfpkQj7eiFeIIDXWNcA4ZUVHh5IwXnuf92aVIsXyic=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IWey18fePH6wQoIu1vu5c9ZkcsJeh5Jx1yukTFZwDQ3eH0trwm/ihSzkG3ww3QEsBsBDRR0LhUDD6FL6A7/8w2cYW1Z5gfj5tiPK0e0EkLmrK7oxcelLWpCPyHhIM/5Vb+90b3uyvtL4bFnwVf55J1xI9e5iHzUi/qLcRNILves=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iRHpZPmr; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iRHpZPmr"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c739e680bebso1030410a12.1
        for <linux-staging@lists.linux.dev>; Fri, 13 Mar 2026 08:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773415787; x=1774020587; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=egzitlphPzbhJMIdezsx6gs1Ho+qeL+qGUKXEWbH8Jw=;
        b=iRHpZPmrWQzSuWIMEbHIOIhbhIlLk5Db+rkDE3QBjYdeJvbfuf9pz9kwLJ5W3APmvu
         mzWgXxhmqPNwuuz6cew342IXY3xXh2Soa/2BHsBMXDUYyLNGdtvKvSDaByFQ/f04yoM+
         L31J2RkaTXY92uqK+vf1JQx2X210LuxQTu6ScWDIMsUKz0DDuSMtgMfV5R2Clz0WlsyE
         udbGtUwAlgne86Z2tnuv+tbiW7mS8r46oCM5rHwW3trWSXWuYjrANSTSs+ws4vOxI5Su
         +zpzfTaHXJxGsqtJ7me+VVtMEfdpPfTeCjOOSQ/LWGeVaHBh4iqRza58Jn+dW2ComWBl
         7dDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773415787; x=1774020587;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egzitlphPzbhJMIdezsx6gs1Ho+qeL+qGUKXEWbH8Jw=;
        b=Q3CH0BbsPzccgAzw+XOXMciv74i+f7P2bf359sYX2vjgU0L+p+M8BD3P6JqEv8Mhj6
         d6tn5n2g8G0P3yzkyxiu0Qu8BbsWmeGU3GQZelLz24VvdneUTPW6+N7EidxccPFlYXDS
         EeoAscInOICFHbXiUsVzSeSJID51r/MxiUDV6Fv7V4LlWEbsYRYTE5b/qM7r5MWCgKzK
         kdLfoSN9tj1/fYMBdbFqwmLlnFl+9MDnEHvS/SL/F+OX5qwjIv0z0DpkGUze1fbxNmrQ
         A6zFV6PxNPBH/brwZPTtLL1rEA/nUxHNR4okAGzPygtG+Qlhkkzy0ZtxbdvKkfQIgyGc
         wpCw==
X-Forwarded-Encrypted: i=1; AJvYcCWpY+8+6NB071qhr6zk6huaY2ogxKNbmA2ZJS3z/qsZKS5KUiP5MuebQS6aY6G9PVc0yAm/F+n4O79H3vje@lists.linux.dev
X-Gm-Message-State: AOJu0YxKvMfIF/YODEr4vdFEgUzvc2TymQovGJct5ogKohttjkr60lQJ
	vWmnpwf1YmLOFZa7i8ReMdoqKs/tMAepRSHZ0zUhyBloT9xEpCEuOX3i
X-Gm-Gg: ATEYQzw/AagyFq6NgiARglod0TTYylO4YlxMagwLTmMypQZrUv3UeTK2LsKmAfP0Mqp
	ZzeY6tUwjLGEtGvU2NNyzTY6PIXFVyNVLbdjZHyga7nzJt9dR1EQ+Uq1cfSyxEdStZ5EcJKkopW
	WKN9/dtilKlUuzwgxYc9I+R7FONYo9AiUdhc99ddn+G+pfT4zgSudCTDWQnInOsDsYGxWndeOcS
	JWo1qdRitV1SRO9BYw73/v2RxBfqDxS30m4biCCRBC3+W4E40e2pUdUvAKwdUiFuHBLQerLPTWY
	BvwuqCIgFr1EoGDzr4shsPbYaRaWzOvBhklznNJPFwFv5sU8ONDaR91zXAGwWMlD2/3+tPc103v
	934l7a8A4m4HFtii/0mtxd2LEOINqPKWbNwdNPELA1t/D+Z74H1/EZyfYp3Nu/rs7w/mZAKtuA9
	FQautahVGjiM65bXibKAnrXBd3hVDcdLoaXGGj2tdVD5A2WBNH/XDbAqRQ5FRD4nA3KUT8cLHw5
	SEt4t2AiOPonUk4b+QPFAkNpuy/u51/7xJGnw==
X-Received: by 2002:a17:90b:1c09:b0:35a:2ed:9b6f with SMTP id 98e67ed59e1d1-35a117df08dmr5949617a91.0.1773415787288;
        Fri, 13 Mar 2026 08:29:47 -0700 (PDT)
Received: from starpt-K55VD.. (2001-b011-7803-1632-43cb-2c60-f383-892a.dynamic-ip6.hinet.net. [2001:b011:7803:1632:43cb:2c60:f383:892a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73ebb64819sm2656785a12.22.2026.03.13.08.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 08:29:46 -0700 (PDT)
From: Lin YuChen <starpt.official@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	starpt.official@gmail.com
Subject: [PATCH 2/2] staging: media: atomisp: use kmalloc_array() for sh_css_blob_info
Date: Fri, 13 Mar 2026 23:29:36 +0800
Message-Id: <20260313152936.14560-1-starpt.official@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the open-coded multiplication in kmalloc() with kmalloc_array()
to provide overflow protection and improve code readability.

Signed-off-by: Lin YuChen <starpt.official@gmail.com>
---
v2:
 - Remove unnecessary parentheses in kmalloc_array() call as suggested
   by Andy Shevchenko.
 drivers/staging/media/atomisp/pci/sh_css_firmware.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_firmware.c b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
index 57ecf5549c23..af12df2f9b09 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_firmware.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_firmware.c
@@ -253,9 +253,9 @@ sh_css_load_firmware(struct device *dev, const char *fw_data,
 	sh_css_num_binaries = file_header->binary_nr;
 	/* Only allocate memory for ISP blob info */
 	if (sh_css_num_binaries > NUM_OF_SPS) {
-		sh_css_blob_info = kmalloc(
-		    (sh_css_num_binaries - NUM_OF_SPS) *
-		    sizeof(*sh_css_blob_info), GFP_KERNEL);
+		sh_css_blob_info =
+			kmalloc_array(sh_css_num_binaries - NUM_OF_SPS,
+				      sizeof(*sh_css_blob_info), GFP_KERNEL);
 		if (!sh_css_blob_info)
 			return -ENOMEM;
 	} else {
-- 
2.34.1

