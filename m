Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C34259CA4
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151845; cv=none; b=NLDK8wZM+SSp6aRYrV7TmzGAK0JYBEKWfDFNqCwtOq15M11I3E2mHKFE0GJjszz1E7/vwo+wta3mNMvMeUysCAyU8NN8h3yYrxAXObrhwvP5Q69wbXokorZms64MRCwYMgr1+2/MvlH6vE/cscCuEwDIMDJeKRAU6ZEjucyV8vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151845; c=relaxed/simple;
	bh=EDe/v+ceS3a7mNmvmw5sWy6oiSYKVkUiKcSfABJrvLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HSoSjJcSxFyQOHDl989SXtQVBgNwIkcdwb0gLmVJfQ7CSZOTpDDjGSJy4nGfEUlKA8lpmfmEk0IXVOTGIiJdZ73/9uQZnW4GWjzizHrVK/QLgvXTHgg9MbRBHAQxIFbbi318AzSu25lJlACzndNgSUwuyQKeikBg41rbdPevdOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=BLIRoGwn; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="BLIRoGwn"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3031354f134so4666547a91.3
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:37:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151843; x=1744756643; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HafV7m212oxhd9ZR4mr+TfwYqRBb6sb8NYg6QNI6i1I=;
        b=BLIRoGwnYCj3h6pFKu41oRsxQS+UpFf0HFhtE4vk9V7T4TB2ksadOeAxW5Us/vqI9a
         jciom+V/bUKeP/trZdoldQmkRGVmG2BKE3mBfx3lqy7nhJPHcqMPlwkosaKvIpfPSLGo
         1/OKoxIGcoO83HMCeXoL1wTeDq2gBweQ5M4iWElpq/e1YUrV83ibUyA0aUdWvHyzIBlF
         5sbSREMyUc0315c1lmtxsRuLm/OQSFWWZSOJK2i+YfNl5AXv+uXdTzr7bN3ZTONo683C
         sc+q7NBwoWY8HH/a0mQiMCVg52kPsudYDxYW7zlqb/dY0nQ0sbxTKP16WZ/1oC9s077v
         W46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151843; x=1744756643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HafV7m212oxhd9ZR4mr+TfwYqRBb6sb8NYg6QNI6i1I=;
        b=Mi508T9c09zpay4b/G1cb1XNp986EP7NU1CgSSY1QfVcI6fq9qQy9Pp0r1Kaj/13mX
         RO825P5gM502IIq44wg+ZOwu71krP+xtrmexL8nMxakU54pGlxSZwu3F9OmMO0DGF5GN
         tZaSto7vhk1P+tGpPkdS7R5xzxnBw4rZE5+ZF1DT5hxbKW6LlTsIRpIUKQbDuoaCuNM1
         zbkjayhZWlb6Y95aiqigjcj9C0dfqD2oaqz6Lpolrq1O+gireAuTnm1eJ8XaCYbt4iSO
         wfmtsjzF7fcX4RRPcSBigXQYEODa0vK90rR76BjiOczGIO8mVcPze4GtuhyXIEKtayOd
         BCYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoLK0/nUpfcEwdCZanpQhlLqQSHKXJdui0qcw7qCWZs+jW0bTwC8Vdf6gQm5xdjXSvFMpe7t4kiEMWyein@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9y9IEBkxP5zlGKtHxv2L1WCXdKrJ8RxZ63+pHpq7R8wx8COZ8
	oeVDBdUM8qXJPqPRZ81RnarSMyhcxTg/IIPIZEs/hBsWRN9kbQboxjV9LWccIw==
X-Gm-Gg: ASbGnctfr0g5uroo7JvLxMsacHQ9wBS3qMu3pByJcQSPmtQdmoyWvuYOhRPn5wjfP0R
	RBDXW5HCXPhqk9nklXdJZEcrsTfO6EPsm+OHFPjGXpuMx+99EwDOYh3+W+yPgDLSgMyeaTaUMQn
	qpVK6CUmXn/nFoNwSYGXwJge+7uBTVeUSp2tYp/KUmCI+IsMTzweXg+JnT2Eu4NNOxx+CUrOdY9
	CgXMGsPTPt/OolrGaT+IkpCUZSgRy07+wVBgWuyz4SLVmgOcA3Tj/BAhmbM3NKhW2UCv/+TGYvk
	Qm1eRHZChG7gvWxdIup9A70dzbUkJvlfhhihAaw1RHzL/2uXAbMPV4KYKzGLzS5ZIvsTn+tMlbX
	wh/7RgNXJI0ux5OFHVV14
X-Google-Smtp-Source: AGHT+IG8o+6R23mHGAHJzEyRzY5w9h+Av8Ahw5BDr+ZVDin1/+zjf4sgEVTD8dOoEDFUTBUNzC5pkw==
X-Received: by 2002:a17:90b:2d0d:b0:2f9:c144:9d13 with SMTP id 98e67ed59e1d1-306dbc29f06mr1214429a91.24.1744151843610;
        Tue, 08 Apr 2025 15:37:23 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865e5d7sm105919855ad.124.2025.04.08.15.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:37:23 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 18/18] staging: gpib: Removing typedef gpib_board_config
Date: Tue,  8 Apr 2025 22:36:58 +0000
Message-ID: <20250408223659.187109-19-matchstick@neverthere.org>
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

Removing gpib_interface_t to adhere to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/gpib_types.h | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
index 1c641f17bdeb..0253ef2c94a3 100644
--- a/drivers/staging/gpib/include/gpib_types.h
+++ b/drivers/staging/gpib/include/gpib_types.h
@@ -23,7 +23,6 @@
 #include <linux/interrupt.h>
 
 struct gpib_board;
-typedef struct gpib_board_config gpib_board_config_t;
 
 /* config parameters that are only used by driver attach functions */
 struct gpib_board_config {
@@ -55,7 +54,7 @@ struct gpib_interface {
 	/* name of board */
 	char *name;
 	/* attach() initializes board and allocates resources */
-	int (*attach)(struct gpib_board *board, const gpib_board_config_t *config);
+	int (*attach)(struct gpib_board *board, const struct gpib_board_config *config);
 	/* detach() shuts down board and frees resources */
 	void (*detach)(struct gpib_board *board);
 	/* read() should read at most 'length' bytes from the bus into
@@ -291,7 +290,7 @@ struct gpib_board {
 	struct gpib_pseudo_irq pseudo_irq;
 	/* error dong autopoll */
 	atomic_t stuck_srq;
-	gpib_board_config_t config;
+	struct gpib_board_config config;
 	/* Flag that indicates whether board is system controller of the bus */
 	unsigned master : 1;
 	/* individual status bit */
-- 
2.43.0

