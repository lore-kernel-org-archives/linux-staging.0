Received: from mail-yw1-f195.google.com (mail-yw1-f195.google.com [209.85.128.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D20F8388394
	for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 11:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779534955; cv=none; b=fjv5D2POGbF4M/CQveSXcc+jT0fyHlKYbhHZgz/0lwmpaW6UggGrpEnK1h1Qzlwlp/N4OFa7aJEIOFfz1A7tSEOKRkwnTIqfK7mAJkISP1lSpixFPMtFpcBsyP4nyj1eFATDkXuk/Zz0YAC73HeIuIVxKKAM7y7yKHObkfnzUgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779534955; c=relaxed/simple;
	bh=3M9ITOOfKizUcZDviJIXMUOFBBOxO2x05gJvobaCncA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XSe+NdNw+ATV3arf7PunRhxceOPjDPZnTNNvI4cEkUphetSI+t/4SVzXhZy9/ZECbnpHahxhrZpxkbgOfsH0htqwKRAzQ6+hYAeO4QmYAajVrd3PF6UfI1Ua2qXZ88QJj0MD3WxFfUPz89QgSKkM6zAkkgjEHCex15VJZOiyLrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=klUhY/HK; arc=none smtp.client-ip=209.85.128.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="klUhY/HK"
Received: by mail-yw1-f195.google.com with SMTP id 00721157ae682-7c58e6eb2c8so80530847b3.1
        for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 04:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779534953; x=1780139753; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0IO4ACdWIMGeQQmW6pB7nrumG5uOpk88q4f2nui1XeM=;
        b=klUhY/HKjhgv2rzOmt1X+nncAU4zKT6jFz7FerDeDjMm7NZD3KLQgUs6hkM2g70I7d
         0nE3qL6wXGVBViiVIxncctOj2hCnkQpb+FzgPfxsANYWZGHnX2xtr8TLjO7cNcADFnbY
         WsavGM4sxuxwtMOeg6QoQ3V5A291N8iQNhAgb4H2g+JOUqQnfcDb24mGKdhK7aNXbsw0
         Lx0AGSXwdzvEQFSBNjQzp3rISr3+APgZ7mRaTWoTLacmBel1O+hjFuDpM5Dpajnx0El0
         GeHAH0pT82D8D44p4RWf75JfqymQZ25ivwLX01i2WhAdkBXVHEXNgi+C+bqaHG1ok+nS
         8OSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779534953; x=1780139753;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IO4ACdWIMGeQQmW6pB7nrumG5uOpk88q4f2nui1XeM=;
        b=knYYzlK/DfoA6SREWbn5f+iMVzwbftpJrJJPths4r9CEC1Meo7KZ2ce5uyK6c1iVJk
         DtCaienvGCyJ3paWAMgq/saV0dVXo+iJv+DDZ/VKTRfBbymaa6ITxcJplkXllIaEwlig
         9jt25CSep51i5bJNWEzL55Jk16W9Neoc2zPzJvSkr7rsvqHox/mo8ZfAGMhxxha9GI5g
         pSoxvSsQ3qJbUU+PlJvu+S4jGlhdyxEzh1axr+r4aURNMxBkIQAkwUniLzVD1um4mGFV
         R/SqZZxPX+dpKKlopxCxAEN11sVNtmAPaMMewgHQ2OGGf9YUUKLQnLfHItd2JPbvPI7X
         6piQ==
X-Forwarded-Encrypted: i=1; AFNElJ+6yhVro3thREslQaxQ2E0fuWeZuqZLywTshD5TouTMeEsUfDlD8sRcLkiGYuxvtCZHiGJCGqr9WIVv/IVQ@lists.linux.dev
X-Gm-Message-State: AOJu0YyNIMrc4YV0R1jcwfShS/syp/DKFol2AM/2to5tYlg8MRncg3IQ
	dr3bgyOGAh0MQKmyxIvB3O9FSuOF9m3i008l14QKK37yfrkMMP/U/rqt
X-Gm-Gg: Acq92OHcgvAldZ+LctiMcz0KtKIxKSIOp6bIVKmo5yJ6oskOmPLGrcXRR9LZYqdmbwZ
	/ic/wYhcHqOgLZU8B0nSfXMhcrHYrUs3lmV4lgKV59Fw/2T4siduDgEU6qkNAIkMJ6p0EsjW+Lg
	nRNwQtegN6HxmM9ejn+0HX9Kh+KHDjhYEPqCnS674H1wsggzphVvvsovIw+WMcZfZ60J4npICLZ
	hky60Hk2+kkmJwIl17rnYYoemoqEPOKME9ZdVbjB533qN7kYKXSNEB6Apc/IAQ9s+4ItiuA0nBp
	hZBvpyYfJeGgSpmhEp2QTf73Tc9NTditWZUaIQl4DTkUTsN5iVm0fMNupWrt3KwftQ6kXeAUj/1
	KIhNgEVftCAr7baj3thv+fkGnZlORIjpmOVfIy7Xw19EdGjEZX5u+0EkqQYD3Iy9P0yyLX1b8lu
	QyFahOxvyqNV27qMw5SZQyDJpM8obw1Qmahkx3
X-Received: by 2002:a05:690c:45c2:b0:7bd:8cb2:4fa4 with SMTP id 00721157ae682-7d3377ad464mr86695227b3.39.1779534952804;
        Sat, 23 May 2026 04:15:52 -0700 (PDT)
Received: from localhost.localdomain ([24.151.11.212])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7d38c838e71sm20152217b3.46.2026.05.23.04.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 04:15:52 -0700 (PDT)
From: Marlon Trujillo <marl0rd1080@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: media: atomisp: fix typo in rx.c
Date: Sat, 23 May 2026 07:15:11 -0400
Message-ID: <20260523111511.865-1-marl0rd1080@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling mistake: inptu -> input

Signed-off-by: Marlon Trujillo <marl0rd1080@gmail.com>
---
 drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
index 9cfb8bc97e24..ce7035ce8606 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isys/src/rx.c
@@ -55,7 +55,7 @@ void ia_css_isys_rx_enable_all_interrupts(enum mipi_port_id port)
  * */
 enum mipi_port_id ia_css_isys_port_to_mipi_port(enum mipi_port_id api_port)
 {
-	/* In this module the validity of the inptu variable should
+	/* In this module the validity of the input variable should
 	 * have been checked already, so we do not check for erroneous
 	 * values. */
 	enum mipi_port_id port = MIPI_PORT0_ID;
-- 
2.47.3

