Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C16B339708
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 17:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777309659; cv=none; b=gHsMiQz3VunFTY/BJLyXA5qhBUc0I1sumV2/p8/fU4hXUNuU1lf4XN+1aD0uEMQnQh3kqZHSBCNYu9Y/9oTpC1RhGAyJVgbbMERY0oSkrENsPHngiISVtyFPK2P+FL3VljYYmjl1I+HlDqjY4rmjzOYwfjQ3TI0NPRqPiI8hkQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777309659; c=relaxed/simple;
	bh=2BBIVyuBfJT/9Pa5JyxKH2ni54xydMVjGCoT+247qyE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TXJF4HACH7iSwxsb8wMjk9p+clDTLcKingLGAFkocwIGpw95w7n5SrWHjnCezdTP5tZpjl686Om9jMKzIanCGoQet6xOlatXD3ExEGw2nOG4McGUPGhoSsPRcQ1hhuSnpJRVMeooUdxN044PyEkt7ghxDWSum5/rqDMNwMcQW+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C36fv9F2; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C36fv9F2"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c795f441ff7so7255938a12.2
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 10:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777309657; x=1777914457; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ERRqVYI8CFxrsUDJfV7VsWlDQmS0mSXaXFgBL1Geb4k=;
        b=C36fv9F2I89QoMvr6nCMT2jvm0zpjcgjBiK5qfrokj6sT1GTm2yazatn1C2bdIaIbB
         3yJkb0N4Pqr2ajj7VEX4e+xLVklsHPGbIvmkWdXls0/VHaR5wqqA2tDm169CrR5vubkV
         CxzTJb1zreG/HTaBWiKLRfygJhI/5COwoJW7TJCger4N+e0mYSgdMk4jcetshRySXU9b
         jEG2taFyyS90l1l6YFTp3zmO7mJ3CvUqBKD2JmHJJmBeiMaiVapPW5/R9EGI1VlUZvVW
         fgy6S2oNxYiWik3kbggay37JAknLD3Qg2+sD181wFSUNdN/DoO1z3Vj9jtjBzXJNgH8V
         jBtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777309657; x=1777914457;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ERRqVYI8CFxrsUDJfV7VsWlDQmS0mSXaXFgBL1Geb4k=;
        b=jGkAuB4D76x40GZJjUy0OHIgWQUgAz9EuCcRhqRbQS7gfCPh/pit/PzTdXpZ3mKStw
         rSzrdQantfG3VSfuQBN7Bp1AzDzq036gM6I3zNCH5mQae5IyN0OoEY7kKvgYJPdnILni
         ZUVLr5xJ7pAh6xXrsGqYSs6c9Wta7xcxBp8vIYaeVJn5pmZEpmexIMpu79t97piDVSz/
         U5qEG2+xcWjP8r7fJtYE39nurPRHdZXkxPNEy7w1h+JSupzsmeZcfKOobYMrVW0PRtNq
         eaVQYhFE9iDygS8Qe4kFicsF5SQcVktCzFRE8maLznkjgQmC4EYr4jg8Nrih2VcShpCV
         rPqg==
X-Forwarded-Encrypted: i=1; AFNElJ9GADKkm9XSyUApKcDZ006ye5fdPzyZiWNobS3XeLaiTAEKErAYaokJqy1aKgg8SQ8+wlYXtB2DZNqP4vAQ@lists.linux.dev
X-Gm-Message-State: AOJu0YyyOfBM9vf3wNh75NhPi/XWECAv1CmnuAfiecVgcJ/X89kHPDVt
	YBY6fsNzV+VOSIvV3i+ZWrh7i/gjrKtmSev7WfyTL6oKJb1TKcDPViv1
X-Gm-Gg: AeBDiet3SDsqsiYd5QTaFeqhCR98zPEInqIrHWCSe383tRutQCTQ3/ZCgqtzz91uWp9
	PzZpTqp4+xiWEwCikQbfDhAhQl0IeOkGZGu/WToSxdAA9u07qOuSi3Er+LhzlK9fwEZQcMd/BdB
	jmxtsJqdb2MaVEPz4imVrIGx7RXmRjrPGq/lSHj/OJtuloRx8OLYYfD6GHsi+w+FEQ3IFjM4u4o
	mJA2IBnAXzfQvH1mraUASr82OA2swzD5VivCtXfWnf74n5GwGla1zNjEEB9QfP5a3Fyi3q0zSQO
	tDu5n5XOAW4FpskZrrjYJbFb4I+Hyr3nRcd3/hV36igp44iEAzKVNPz3T21DbLaibMbf4PHctrA
	8D156ndqqsOfM77yU+3NKrew+doELJhijo/6gVNqvDLd7s72NklwIs2UAYwYUyUp0JoU4J1hp1w
	5Q2x2Y/ZhXj1/17uW3jkmdQI/P/8MT063ErZM3dY1XE/nOsjikmlY8BcnWPzNOqUOwfnssZDptC
	HHcHQ7AhIpDXU8l6zHAsKDu+zP8pD3C
X-Received: by 2002:a05:6a20:6a09:b0:39b:ba95:b127 with SMTP id adf61e73a8af0-3a398c117f6mr307416637.4.1777309657446;
        Mon, 27 Apr 2026 10:07:37 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.114.98])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec04448sm39497551b3a.55.2026.04.27.10.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:07:36 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	s.hauer@pengutronix.de
Cc: Frank.Li@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Subject: [PATCH] staging: media: imx: remove unnecessary braces from single statement if block
Date: Mon, 27 Apr 2026 22:36:33 +0530
Message-ID: <20260427170634.23072-1-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove braces from a single statement if block to
follow kernel coding style and improve readability.

No functional change.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
 drivers/staging/media/imx/imx-media-of.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-of.c b/drivers/staging/media/imx/imx-media-of.c
index bb28daa4d713..7413551052ae 100644
--- a/drivers/staging/media/imx/imx-media-of.c
+++ b/drivers/staging/media/imx/imx-media-of.c
@@ -57,9 +57,8 @@ int imx_media_add_of_subdevs(struct imx_media_dev *imxmd,
 		of_node_put(csi_np);
 		if (ret) {
 			/* unavailable or already added is not an error */
-			if (ret == -ENODEV || ret == -EEXIST) {
+			if (ret == -ENODEV || ret == -EEXIST)
 				continue;
-			}
 
 			/* other error, can't continue */
 			return ret;
-- 
2.43.0

