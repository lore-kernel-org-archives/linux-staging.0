Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62783B6C14
	for <linux-staging@lists.linux.dev>; Thu, 30 Jul 2026 10:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785407883; cv=none; b=WkWuUdIDpjCz8h6en45uqkWUvSv3AvNRP2V/GSChib7A7AAsPsi/o1Jmga2pdkSCJHDr4AV0ETFHIQ7VL9A0A9MEx1rWO8fDl/KEDVJHgHsu2ewRG48qT2hdy7hRjNgGeqOV52+jXR5e1Cp4h4qZaIHestwKbFdsjpgbiP8yDak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785407883; c=relaxed/simple;
	bh=C+XIta/PnXbHgq5uX591/FuJJN/cSTbjopEz3wI5Rjw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Nsz32p9HrUuqqh+FEF4SR+Wk6R2tMxXaJoF0kBGCyZx23kAnVF+vSBucCQd5V2KZaaTIBz/HOvsux7NMobwseImMcxhEuoRBB/MZCrW2/4HLDa9QBO3lD1FELKw9P/EjCnEp+c1PAjChFWJyw+b4KhK0lXML/QMRpdem/etedoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jrNa9N1W; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jrNa9N1W"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso1772928a91.1
        for <linux-staging@lists.linux.dev>; Thu, 30 Jul 2026 03:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785407882; x=1786012682; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MXK6Swv7vBgoQF3j9El0Te9ljuWn43Xnd3oqzZNewrA=;
        b=jrNa9N1Wz2004SAXAMnVV5G4LmBFH7K4lMO5u644h2mdqtJPB36mg+jZDvfKy6XcIn
         lizsWWuGhli0yG853OikuQRue24AXenvcMA/v0/3L8tmg3LnwY7WbachC+xjtnlBFr05
         5FLblS10fD9wG5ZYdBmRCL6sj+u+3S6cvZXloIPkqsZYwzLzZXnUz38Qu6mTWvCtiSv6
         fQkQrnHHg5jVOkaWj6lh6PRR6cMNbE0uU9YJVcH+98sRf1qrFd3erHm6aFpY3ObFvDYj
         xcUJF17Fg+l89WiLOKI8p62ocwgIHonrjXIwcUjZMmY2URIc+lgiGh6vz9M1gqRHl+j1
         DIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785407882; x=1786012682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MXK6Swv7vBgoQF3j9El0Te9ljuWn43Xnd3oqzZNewrA=;
        b=d2l10jvqPPD/BZHVCh5V3+1mK7HxOgy9ookifn/NoKoO8twT3f7iKZbdFDp5EY8CG9
         4zi0KLv2osMk3Jsu37d3GkCTRL08P4SNnk8MqAW4k4BmMkqjMrnQIHOp+W6Lf9hBGwWA
         kZRAEcjVdYmpirRh+rACUM7N//SOttEjGA9j8yLSWB8NuvCwIvWvD5B9ImCFxpKn6siE
         nxPjPXhU7u9D0a0ZxbDWxXFCJWpTSdDIzO1Rgq+dpbnA1dwNq+BPHs6m8QcKYTq8Ufu3
         kZtWqvmrrnmGolQTh8G+wTgWBdO+GYREaWMu0/wBd3Oevzho3Q4eH0wdWFQgczJkEFf0
         88vw==
X-Forwarded-Encrypted: i=1; AHgh+RpCfwyp05rQI8zsBXetVCNZ6/8IKwuwH4hwCINFdyLBs7eqVc2yhk8zJ/A9Ai0o58KndTRV+MWn/oBJo7Gp@lists.linux.dev
X-Gm-Message-State: AOJu0Yzz40r3O43Q9BnbMeLx9CK6Mk8L8jUcAn822nZuMtLCoo6a4ZF4
	lZcq6T8AELH2Z++j7YDe0BO7BYBE4XsTfoFC9Yq1GUo71TrcnC0+Ekp1
X-Gm-Gg: AR+sD10zpCZz9J23oYmyPaBvA0h70YFuNFliVNOU/2OokuXW1kAtUliUgNqPbfh2w0O
	+HGl+Gaxp2D4L5laCjAdG1U1bkqhPcmZDWj2fS1QPqCHIL/lZFUe77cNG4MHXByvIhg//L0lAE+
	m/eaRln+BIch+I98vYdQYRi0PGQp3CF2KIU15uCjsN0xaDENojxdiSBCjOtzzWmLHa0nYgx7H51
	ZohultAdvlOOFcGXTJqoqMCGLPHQqB6KCEhVjLXdYPlVRNsAc+3PPQ428aquspbixJ1X7nnSfQL
	/hvLWHzCDgPCniPH5urTX9ZoDFNZ1nqm/dpjuDdqGoYWo9oavxNdHKlf1hk3V4Dks+jhMgsJhph
	U4GZkqK3l4n17fSpF3u1QbxpdSutCPAXUGqx3FQq7gZpit+Y/29Wu/VmvfFQSqL+JIbqJEgYdfX
	NMSA2LkTFo4/5bis+6qvaoHJOMhEn2+ctYaT/OS1w7yt6/TFeBiDEuQO8EPbIbw/3ZFqHAqop3Z
	/uPzOo2LSg/sWyZ
X-Received: by 2002:a17:90b:6c4:b0:380:a568:cc4e with SMTP id 98e67ed59e1d1-38f9bd632b4mr1766643a91.9.1785407881826;
        Thu, 30 Jul 2026 03:38:01 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f9b42d176sm837532a91.4.2026.07.30.03.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 03:38:01 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: staging/ipu7: fix async notifier UAF on probe error path
Date: Thu, 30 Jul 2026 17:37:54 +0700
Message-Id: <20260730103754.1480367-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

isys_register_devices() registers the V4L2 async notifier via
isys_notifier_init(). If a subsequent probe step such as
isys_fw_log_init() fails, isys_probe() jumps to the out_cleanup label
which only calls isys_unregister_devices(). That helper tears down the
video devices, subdevices, V4L2 device and media device, but never
unregisters or cleans up the async notifier.

As a result the notifier stays chained in the global notifier_list while
the enclosing struct ipu7_isys is freed by devres, leading to list
corruption and a use-after-free the next time the list is walked.

The remove path already does the right thing by calling
isys_notifier_cleanup() before isys_unregister_devices(). Mirror that on
the probe error path so the notifier is unregistered and cleaned up
before the device is torn down.

Fixes: a516d36bdc3d ("media: staging/ipu7: add IPU7 input system device driver")
Cc: stable@vger.kernel.org
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/staging/media/ipu7/ipu7-isys.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/ipu7/ipu7-isys.c b/drivers/staging/media/ipu7/ipu7-isys.c
index cb2f49f3e0fa..bf262c01a2b8 100644
--- a/drivers/staging/media/ipu7/ipu7-isys.c
+++ b/drivers/staging/media/ipu7/ipu7-isys.c
@@ -773,6 +773,7 @@ static int isys_probe(struct auxiliary_device *auxdev,
 	return 0;
 
 out_cleanup:
+	isys_notifier_cleanup(isys);
 	isys_unregister_devices(isys);
 out_cleanup_fw:
 	ipu7_fw_isys_release(isys);
-- 
2.25.1

