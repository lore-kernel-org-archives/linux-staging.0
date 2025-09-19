Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3122C237D
	for <linux-staging@lists.linux.dev>; Fri, 19 Sep 2025 19:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758311772; cv=none; b=L0o7QsFmsClnhAJ9bYgB1jjmDnCVxRPAZV0GByeWW1BsKF6wJq97y1RljcdhRYAKE7uSlMy2ZEVD15zdO1EwiBwo5j0cEJos/4OyLAjpK0JoMNgL8s8iBEX4YEKlxP3PFKQu2hxtC6rl4R3uH7ydnfvjdHTPLqxcvBSeXBUAbLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758311772; c=relaxed/simple;
	bh=7GfH6C5wiLmUyC6hOllKgwd6MQScZUNtVuMgQL1+B/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LN1b1ukr2W2mPAd9YKQKy3LJkY9J01XZIKQvrggk+w4Hk/LBJ5C7fvl3uBcWovJmcqAgptgD2CIh2baYzlRlsikf+xkITHrQb8Gw4N7e376KB/V4TPA46JyzTrGE5J3dh2jMLLYJrRDfaPH5y9ZkT9zwoKP7ksq3hkooJK9frO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mLjHsxdW; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mLjHsxdW"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-45dfb8e986aso21769935e9.0
        for <linux-staging@lists.linux.dev>; Fri, 19 Sep 2025 12:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758311769; x=1758916569; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+a51exDJ05DQw0D1EKhM9Qzy7OjGvcmwnul5yul+TtA=;
        b=mLjHsxdW8eNjp/pEvOd/Q6hTq2S5r6CxljhFgOFnfHK+xQD8wMX0DY3CTVtb58bzb8
         BmliQK6xQDN8u4syM7mESQP2LYtH5Q3TGLXwwJm/nT8AaDp2fZj4L5NDOaFtrPnY66Wg
         F+bZ8asDYSkTLxF9+9fnq8pa3++muBC/c0XuhQk5UGjqDaNo38Ith07tkEMLNLvyr9Sr
         7VOXHg12/MqcDkkRdn6H35UlUp1n8GQIdRPDtYwuIZ9E9nOj6jHjnR9lsSt249sP0Q9n
         ZyZcU2et10JJEOMgb5Z84B6SGlwIGMV72uEvRj2RK3g4C+xjXjOqTR11/hMrlUBY70ta
         94Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758311769; x=1758916569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+a51exDJ05DQw0D1EKhM9Qzy7OjGvcmwnul5yul+TtA=;
        b=Z6E6gtKIkaUFZFnO6yWVJFW/N73o4Ipr0JC2dlzsRYKidkpUZRx1H+6da8IiplvMzL
         YJgG5N7i/mIattD20ABtaQOlcqjK6g1DyOo6B1Q3ugfKhoadprTpTu224rCNJebDV48W
         uiRdJpwQTuDTUkaZBIjs2+OFHXRSXQoMRI3Bpxm420B5ncjK1HM5DlyIx3vKMTIThHDx
         2Jgc2Vsal/snYs8sGklaamOFCAYYjIjTOufKLuX6Lk2uvcjOi+o5XF8h4JRMPtqIruIi
         1++eB87691gY1NxrSpCBysxMOBvA9EL3t6OcsmpJPZx+V/Z/At8GbMHfUyKW2KzUW8kb
         NKnw==
X-Forwarded-Encrypted: i=1; AJvYcCWkOjhLQq2Wznm9fBZw2/5Fn2VwIFZW2H6NhP7TZNPtKMyPKTWRbRT1fuFaGMPMJgbc03pq4YHe74GJE51o@lists.linux.dev
X-Gm-Message-State: AOJu0Ywsi4tgoG3ameOjPyT4GAdw9b5UVU9YkThoxFuoRLUy+tj3DHIO
	27qSikRvTFyKnMX0PfJfD0N1ZaIYWaO27uGIoAb51EcQVP01ABigpo6E
X-Gm-Gg: ASbGncsJFOogXyvOwPbeIZTZBMtrvrjzT80EtlgSWg8sYotSCN9mo17B4HorOGJN6u3
	cJpvf9szi+ZipGMuwvscDwXBif7JLa0oVc1GFFY/R6lXzc7+x7h5vwoTayAkdOJDBAmi6FkOMUX
	/Z+2dlpBDvhQU/6gjJTXUTMa+KHidytYRch39t28j7VFUsbqvyRR8N4Jv7PcBoXDqrI80LGXY53
	1vnSpSx0bVDFJrzxfoe/WqX8UdnVU679okRCBlVSPhqKzsw5O++vHTf+7457nxIYPfeDyqp0mUK
	hSR9apS1JQgVFsn/7eo3BT1HkMmj3PBbKpn/YjYZZSSfKcPTLAoOZvRHag5Gb3pjUHxrjGunOsn
	dp7UU/kTe1xfNwqeHL6lm2XA+hxFN0xod6Q==
X-Google-Smtp-Source: AGHT+IGte2N8cUwiNYbPkgL94/w5J6QjZCyi/RHDhOuWcPDSkkP1WjlhIAYT29jvQk7VakWFiZj0jw==
X-Received: by 2002:a05:600c:c4b8:b0:45f:27de:cd22 with SMTP id 5b1f17b1804b1-467ea004619mr46781525e9.17.1758311768940;
        Fri, 19 Sep 2025 12:56:08 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:c207:b600:978:f6fa:583e:b091])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f162726bsm97025485e9.7.2025.09.19.12.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 12:56:08 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: [PATCH 1/6] staging: axis-fifo: add compatible strings for v4.2 and v4.3
Date: Fri, 19 Sep 2025 22:53:55 +0300
Message-ID: <20250919195400.3180039-1-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver is compatible with both v4.2 and v4.3 versions of the Xilinx
AXI4-Stream FIFO, so add compatible strings for them.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c   | 4 +++-
 drivers/staging/axis-fifo/axis-fifo.txt | 5 ++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index e8aa632e0a31..bab2002628df 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -770,6 +770,8 @@ static void axis_fifo_remove(struct platform_device *pdev)
 
 static const struct of_device_id axis_fifo_of_match[] = {
 	{ .compatible = "xlnx,axi-fifo-mm-s-4.1", },
+	{ .compatible = "xlnx,axi-fifo-mm-s-4.2", },
+	{ .compatible = "xlnx,axi-fifo-mm-s-4.3", },
 	{},
 };
 MODULE_DEVICE_TABLE(of, axis_fifo_of_match);
@@ -812,4 +814,4 @@ module_exit(axis_fifo_exit);
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Jacob Feder <jacobsfeder@gmail.com>");
-MODULE_DESCRIPTION("Xilinx AXI-Stream FIFO v4.1 IP core driver");
+MODULE_DESCRIPTION("Xilinx AXI-Stream FIFO IP core driver");
diff --git a/drivers/staging/axis-fifo/axis-fifo.txt b/drivers/staging/axis-fifo/axis-fifo.txt
index 5828e1b8e822..413b81a53202 100644
--- a/drivers/staging/axis-fifo/axis-fifo.txt
+++ b/drivers/staging/axis-fifo/axis-fifo.txt
@@ -14,7 +14,10 @@ AXI4-Lite interface. DOES NOT support:
 	- AXI4 (non-lite)
 
 Required properties:
-- compatible: Should be "xlnx,axi-fifo-mm-s-4.1"
+- compatible: Should be one of:
+    "xlnx,axi-fifo-mm-s-4.1"
+    "xlnx,axi-fifo-mm-s-4.2"
+    "xlnx,axi-fifo-mm-s-4.3"
 - interrupt-names: Should be "interrupt"
 - interrupt-parent: Should be <&intc>
 - interrupts: Should contain interrupts lines.
-- 
2.50.0

