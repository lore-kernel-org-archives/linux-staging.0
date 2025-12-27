Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0885B26FDAC
	for <linux-staging@lists.linux.dev>; Sat, 27 Dec 2025 21:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766870882; cv=none; b=jbgJeaFRoxqC4FNKI6SYJBxG5Ulo/eve4SNgS8aU9pfr98fDodcKYpSut3IMj80tVH1o8fW6O9ZLV1OvVrXP2ZjmkHlFYkQBxiLkgiTq0jI+H8wImJZ9dAqTUIC4TGHBFLI69fktbogaC7VJ3qATq6vzcxutBEhBfGX7NhRpUIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766870882; c=relaxed/simple;
	bh=59zdEjr5TrXrwsvQXlBgOPttb/akXiL2Ix0jAbX32W4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ha3336qI65WZTnNX5dbtwKT2aF0dUE6FWMXvBB7CA/nMmFPa1MHHsPmoIKMgisyptNw+1WS3UW4YynByG5VX5Pzvrfo8hAboeEXCSG9rG6Dbiiqud9ybf82q0sBOA19GppTHzaqg3P35aDw3XuCx5ardzRTs8vF8SDTevDg0i84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Br3cDtwD; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Br3cDtwD"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso77774505e9.3
        for <linux-staging@lists.linux.dev>; Sat, 27 Dec 2025 13:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766870878; x=1767475678; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mLC/mheGqWIIdxujteSiNRA+HJK138X2+Evna0CZcpI=;
        b=Br3cDtwD87YyeQxU80ZnhHrzp7JZpjeuyRmFed5oOSJP3j7T7BFHB8nUb2kfWHXMLe
         F37xyPQRcWnR8ehk7e+KW9eOPanOj5FXJdg3uWLDZ1uaulY594cCwMM2GvsyiuFpqT5C
         XBFn5TNbTfMCmeEw8h2EB5t5KKDj2H0wR26raIx2Rh11J5GfJ6BjU21g33DF4tqPjX7v
         0VzsPG7rPDguNVKR9T5woL97DPOrTpa+SHAsQbQIPnP7Hvz/CyWx3E5i83LjekZ9JRro
         5QRGEyMokJUkn6OmcFQ1r+jyhEz6Rh9YprQDG74bRuQW5FzHCtMROkUMYvHD4XpWTVDu
         wVvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766870878; x=1767475678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mLC/mheGqWIIdxujteSiNRA+HJK138X2+Evna0CZcpI=;
        b=KMsm3IJdYUp7Nl/DI9X4dCCPkI76NM5CjgwlnA4xTpQt6f4AbsVLbn/YOg4dHTwJPP
         Fm434pqEGrhPYNKAPH460tt33rvSeCTanPovGWui33eDxGrp58WToXTZjzKtEOPu/Ccl
         WKJzYwWeSuE5drzaSy8/pvdr8Tk5YAQSB+0WoDNflD4tYoqjiFustfN5pdJyspBpl1Eo
         IsrrnS35gPr6JhKr4JMr512c+wW045WOBxGCErScNhjZxg85rMisxMFJEWmP55WMcDQ7
         nhl5C6vxqcSFUmfy3sgyD3P8yXvsPr1YkBaiefEoKxrU7qIKL9eaeVZgxaIIr+qRLd2B
         q2yA==
X-Forwarded-Encrypted: i=1; AJvYcCVsUgZxSkMtgOqKW0Y3qPXpXKszUUlg0gwR8kntMwzCoPtgfkywx0U6w+oyFD7fUcwl8Y43IaSeDrPghlEg@lists.linux.dev
X-Gm-Message-State: AOJu0YwFpgAYk+lhipC2uJerekRxDQLvzAtcdHh1OFo2YlMg+GpDcpLX
	z4pDqK6At3osnMfCUKQyXikUFlzM79YJVRcmt/0LVRPF3J+Bt7t1qan2Kku+uQ==
X-Gm-Gg: AY/fxX5q9Za+a4v+/fcqmTnl/Z5ndKXywFjXWKgLFf8Km9dkt+JmcsUikJpSIJDuasd
	DVj/lB/XfRlraVtY/X6OjeJF+nQsbxbTOKt3tnZEHRjK9A0odgTLA2+vj01k/TFwCzh8NinIpsV
	Jo523NCErwKIg1JLcp/T5/KperpoHknkMGz9vQaWzL3esbYnD2uI60ah6cKk0atIr/itt+V+pQz
	S70155vXLwQU+Nnz35KfilkNbNV02NJClaQ09Hi4O7Zorc4TxSeVcofOWu8CCrz2LRyG1OM+Yyl
	I/kBHyJoMEBC6X1O2DYmd4/ufVxVccyaQPBSOB1n2BcrxEIHf3zxP6K+QfPc7bbzNvLvSgMP7cK
	c+iodM3nDBe1/zwnPjr2nq011iF4YERGIKcXcWlKy8RHCrnV4ZyjTixg2VWDpLvN4stfRzUO6Jd
	cqqLeFNK9B/apY+JFpcJUq
X-Google-Smtp-Source: AGHT+IES5YHD5pBMcblrc7t/IzAi59XT2La/IZGiUzlQQk67yrBSnojG2zWzt5dJLZ0Xiwmp4tZJRw==
X-Received: by 2002:a05:600c:1394:b0:47d:3ead:7440 with SMTP id 5b1f17b1804b1-47d3ed097f8mr146503725e9.32.1766870877899;
        Sat, 27 Dec 2025 13:27:57 -0800 (PST)
Received: from ws-linux01 ([86.124.200.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d19346d33sm471531835e9.3.2025.12.27.13.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 13:27:57 -0800 (PST)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 9/9] staging: axis-fifo: Clean up register and mask definitions
Date: Sat, 27 Dec 2025 23:26:40 +0200
Message-ID: <20251227212640.3321310-9-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251227212640.3321310-1-ovidiu.panait.oss@gmail.com>
References: <20251227212640.3321310-1-ovidiu.panait.oss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improve readability and consistency of hardware register definitions:
- Remove unnecessary leading zeros from register offset values
- Use BIT() macro for single-bit interrupt mask definitions
- Align values and comments for better readability

No functional change.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 52 +++++++++++++--------------
 1 file changed, 25 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index adb2e872e692..63221dfa5698 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -35,33 +35,31 @@
 
 #define AXIS_FIFO_DEBUG_REG_NAME_MAX_LEN	4
 
-#define XLLF_ISR_OFFSET  0x00000000  /* Interrupt Status */
-#define XLLF_IER_OFFSET  0x00000004  /* Interrupt Enable */
-
-#define XLLF_TDFR_OFFSET 0x00000008  /* Transmit Reset */
-#define XLLF_TDFV_OFFSET 0x0000000c  /* Transmit Vacancy */
-#define XLLF_TDFD_OFFSET 0x00000010  /* Transmit Data */
-#define XLLF_TLR_OFFSET  0x00000014  /* Transmit Length */
-
-#define XLLF_RDFR_OFFSET 0x00000018  /* Receive Reset */
-#define XLLF_RDFO_OFFSET 0x0000001c  /* Receive Occupancy */
-#define XLLF_RDFD_OFFSET 0x00000020  /* Receive Data */
-#define XLLF_RLR_OFFSET  0x00000024  /* Receive Length */
-#define XLLF_SRR_OFFSET  0x00000028  /* Local Link Reset */
-#define XLLF_TDR_OFFSET  0x0000002C  /* Transmit Destination */
-#define XLLF_RDR_OFFSET  0x00000030  /* Receive Destination */
-
-#define XLLF_RDFR_RESET_MASK        0x000000a5 /* receive reset value */
-#define XLLF_TDFR_RESET_MASK        0x000000a5 /* Transmit reset value */
-#define XLLF_SRR_RESET_MASK         0x000000a5 /* Local Link reset value */
-
-#define XLLF_INT_RPURE_MASK       0x80000000 /* Receive under-read */
-#define XLLF_INT_RPORE_MASK       0x40000000 /* Receive over-read */
-#define XLLF_INT_RPUE_MASK        0x20000000 /* Receive underrun (empty) */
-#define XLLF_INT_TPOE_MASK        0x10000000 /* Transmit overrun */
-#define XLLF_INT_TC_MASK          0x08000000 /* Transmit complete */
-#define XLLF_INT_RC_MASK          0x04000000 /* Receive complete */
-#define XLLF_INT_TSE_MASK         0x02000000 /* Transmit length mismatch */
+#define XLLF_ISR_OFFSET		0x00 /* Interrupt Status */
+#define XLLF_IER_OFFSET		0x04 /* Interrupt Enable */
+#define XLLF_TDFR_OFFSET	0x08 /* Transmit Reset */
+#define XLLF_TDFV_OFFSET	0x0c /* Transmit Vacancy */
+#define XLLF_TDFD_OFFSET	0x10 /* Transmit Data */
+#define XLLF_TLR_OFFSET		0x14 /* Transmit Length */
+#define XLLF_RDFR_OFFSET	0x18 /* Receive Reset */
+#define XLLF_RDFO_OFFSET	0x1c /* Receive Occupancy */
+#define XLLF_RDFD_OFFSET	0x20 /* Receive Data */
+#define XLLF_RLR_OFFSET		0x24 /* Receive Length */
+#define XLLF_SRR_OFFSET		0x28 /* Local Link Reset */
+#define XLLF_TDR_OFFSET		0x2C /* Transmit Destination */
+#define XLLF_RDR_OFFSET		0x30 /* Receive Destination */
+
+#define XLLF_RDFR_RESET_MASK	0xa5 /* Receive reset value */
+#define XLLF_TDFR_RESET_MASK	0xa5 /* Transmit reset value */
+#define XLLF_SRR_RESET_MASK	0xa5 /* Local Link reset value */
+
+#define XLLF_INT_RPURE_MASK	BIT(31) /* Receive under-read */
+#define XLLF_INT_RPORE_MASK	BIT(30) /* Receive over-read */
+#define XLLF_INT_RPUE_MASK	BIT(29) /* Receive underrun (empty) */
+#define XLLF_INT_TPOE_MASK	BIT(28) /* Transmit overrun */
+#define XLLF_INT_TC_MASK	BIT(27) /* Transmit complete */
+#define XLLF_INT_RC_MASK	BIT(26) /* Receive complete */
+#define XLLF_INT_TSE_MASK	BIT(25) /* Transmit length mismatch */
 
 #define XLLF_INT_CLEAR_ALL	GENMASK(31, 0)
 
-- 
2.51.0

