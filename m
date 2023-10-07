Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A00B5235
	for <linux-staging@lists.linux.dev>; Sat,  7 Oct 2023 20:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=marliere.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=marliere.net header.i=@marliere.net header.b="nkSQrXCY"
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-7a2a3fb0713so128820839f.1
        for <linux-staging@lists.linux.dev>; Sat, 07 Oct 2023 13:06:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696709168; x=1697313968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:dkim-signature:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zNlD1s/5Qv8LvOzp0cT+qMBzDmfWHxl8/xBRMHgFQGc=;
        b=ehBDQPtWxCmQXB1i7JO2SlFyp3/aWEz3zKlebaUheK9UFp0S2x6bqIWJTZ/YU6NLZP
         UsWfQI8abuCXP6GQ8HCFNQ4NfiQoJA0cRaARcVwGfDz3flTgN4Bt2F5zwZb/jWvSx4Jy
         XKCF5O2BfcD+E/MfgycnGyAlRjn2jzq1t2NRu0GfxoTp2mDXGXGrLjp22xW0+jV8G+nE
         2eHTkPCogtcu49/V85++LptNztOQ4CioYCzpdoIE0gwbiGU0ZzpuJxgpJDJ7lxe6Dkz6
         jdWcRAjJmpGkETkz7en/TBODxTlVfY1dsl/2wxd9B12QQsh1M0hYAlUBB1mLJxREAy51
         u7Mg==
X-Gm-Message-State: AOJu0YxUyipv9v4ijvXr+MMWv3bTw/HxqCvzxzRDM4uyQ06onGqp1kF1
	if507QlDOAhj7t4DnTSmkO0=
X-Google-Smtp-Source: AGHT+IG2wf6mgobZ2IOixaCTrcl3zW9YZbaOfG0cI8m3grNo8XccXE19/FQlBmnU1OO4gAk3FQ/gRg==
X-Received: by 2002:a05:6602:54:b0:783:4bc6:636e with SMTP id z20-20020a056602005400b007834bc6636emr11401205ioz.21.1696709168170;
        Sat, 07 Oct 2023 13:06:08 -0700 (PDT)
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id gj12-20020a0566386a0c00b0043193e32c78sm1106734jab.152.2023.10.07.13.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Oct 2023 13:06:07 -0700 (PDT)
From: "Ricardo B. Marliere" <ricardo@marliere.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2023; t=1696709166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zNlD1s/5Qv8LvOzp0cT+qMBzDmfWHxl8/xBRMHgFQGc=;
	b=nkSQrXCY5vVbqS6btuYu/JipccFgDJ7nsyFtTYPE0Ffxa7OF5HPKZO91zA3DcU6yWTiHPv
	Nr+KtmGt56HhXXRizuDQxOzfVNGguPFskpIeZzh6ZnpanJZ1twbWz2DQXa6Pl8KwqNtlGA
	AYsRDqMY7JOvTOm6SQOGF4bmtFGjZFBqtcnxUGZ7ybPcwI/4b2TtCrW8+gDQDlY8WdzNxW
	30w5/AdtEpNe1wFw9MYy9pGPNb3HM69K2BVXDqXKOvgHSOHkYTQ8PMxyAriBatLtfJxqtd
	idiCs7KvGnX6GNrMz8eSJ8C8vD9nJ7pJ/idgkOeTGdXWzdSjovyGTxd4XbgwLQ==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tomasz Figa <tfiga@chromium.org>,
	Yong Zhi <yong.zhi@intel.com>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	"Ricardo B. Marliere" <ricardo@marliere.net>
Subject: [PATCH] staging: media: ipu3: remove ftrace-like logging
Date: Sat,  7 Oct 2023 17:05:42 -0300
Message-Id: <20231007200541.126325-1-ricardo@marliere.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the following checkpatch.pl warnings in ipu3.c:

WARNING: Unnecessary ftrace-like logging - prefer using ftrace
+       dev_dbg(dev, "enter %s\n", __func__);

WARNING: Unnecessary ftrace-like logging - prefer using ftrace
+       dev_dbg(dev, "leave %s\n", __func__);

WARNING: Unnecessary ftrace-like logging - prefer using ftrace
+       dev_dbg(dev, "enter %s\n", __func__);

WARNING: Unnecessary ftrace-like logging - prefer using ftrace
+       dev_dbg(dev, "leave %s\n", __func__);

Fixes: 7fc7af649ca7 ("media: staging/intel-ipu3: Add imgu top level pci device driver")
Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
---
 drivers/staging/media/ipu3/ipu3.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/media/ipu3/ipu3.c b/drivers/staging/media/ipu3/ipu3.c
index 0c453b37f8c4..18ca22c3018a 100644
--- a/drivers/staging/media/ipu3/ipu3.c
+++ b/drivers/staging/media/ipu3/ipu3.c
@@ -762,7 +762,6 @@ static int __maybe_unused imgu_suspend(struct device *dev)
 	struct pci_dev *pci_dev = to_pci_dev(dev);
 	struct imgu_device *imgu = pci_get_drvdata(pci_dev);
 
-	dev_dbg(dev, "enter %s\n", __func__);
 	imgu->suspend_in_stream = imgu_css_is_streaming(&imgu->css);
 	if (!imgu->suspend_in_stream)
 		goto out;
@@ -783,7 +782,6 @@ static int __maybe_unused imgu_suspend(struct device *dev)
 	imgu_powerdown(imgu);
 	pm_runtime_force_suspend(dev);
 out:
-	dev_dbg(dev, "leave %s\n", __func__);
 	return 0;
 }
 
@@ -793,8 +791,6 @@ static int __maybe_unused imgu_resume(struct device *dev)
 	int r = 0;
 	unsigned int pipe;
 
-	dev_dbg(dev, "enter %s\n", __func__);
-
 	if (!imgu->suspend_in_stream)
 		goto out;
 
@@ -821,8 +817,6 @@ static int __maybe_unused imgu_resume(struct device *dev)
 	}
 
 out:
-	dev_dbg(dev, "leave %s\n", __func__);
-
 	return r;
 }
 
-- 
2.40.1

