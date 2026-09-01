Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088084A0918
	for <linux-staging@lists.linux.dev>; Tue,  1 Sep 2026 19:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289496; cv=none; b=ViGBQmPY3og9ett/YpUSGeGgaFbbceo8s/2VK5o1vqB2Q96FpSfGD695xEmTWPnCCYGrgL9qvvm6N6tDwlzRYNRiK+rdk4iv6s3KCoPU2op2fW63UYRYNkAy68+quB/9eifa40Kg92VwD81CiNq4QsRduhZ0ozJKrCy/KGB74hI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289496; c=relaxed/simple;
	bh=fnLuAuk4DdEaA7jml3VwGJrscDjqw5zgrKIhfNOResY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WvjfPZlfbK1+9FFHlmgW0VVrWHc4AtVZxMQtoUqZEcMjCdPEgpqXYDzLEiWPHVtSnOpFhoid73gkWwBbXBy3Vk2R0aCLldchJWvgUWfxLIdRNy3AXFT0fBRQHjw8jfauyaLeTHyAZh+HAnmjWs8U5wFsQFoxqKwGkelVMVxHmK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JIBqTk3h; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JIBqTk3h"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso1154415e9.3
        for <linux-staging@lists.linux.dev>; Tue, 01 Sep 2026 12:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289492; x=1788894292; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KqTr/x5yNF9r4lu6CVzssQgLLUaZ7eL+KNzZNSw0R0g=;
        b=JIBqTk3hgheUBJWuY/xMSUe4LmGjYZ8UPXgFTAB5qicdo3Wm1Hzo1duNbqXwJpt8h3
         NcqxPwjFfJksBIXUt0teqSiGyEmRw2iRwsDC35+Y+WQErSbXAS7dvifHVKXG5Zz6TuCH
         f7onOs4qFJp3uaiFB/iloet+AjXoEjrgplTpoxdPQccI0CwTRQjS5v7AStu/VRNetHq2
         w8abqjPplzaxu4T340Cv8ScyaPpCmGd5ZnKeHBxSqyzFFe8dd4fv/mXYuuOUpKokdfpx
         oA+ypHR5edMWU+A283kcA2n4koI/8DlTpGn2Lv35NkU3MgyacGABXIQE0wW6G0LgaeKM
         mhhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289492; x=1788894292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KqTr/x5yNF9r4lu6CVzssQgLLUaZ7eL+KNzZNSw0R0g=;
        b=NPK7xbLh2+fDBevjC2CNvZIP9GUD8mpYfdaVPQqlhp20727f9p5J+gerYZnKIYcrVI
         yP29/xnQBFMCygobY0mnSQZS66Zl4rZ7Ovfp9CdA3AM8Icr4aVxmdiWbJ8Aw2EePrn4g
         LZ8fWkuM308UME8w5NPrI/vdu/Ck47AFZ61YbHJtjs15fPIobwfIZ2YGB8htt73SrWnr
         LOqwREbEM4y4rzEBnbXlczR0lXl1hbSrjdCs0AVUifgeBx6bixE09ju5D48mTWyq5I3W
         a32Lo2AT8mf+Tge8L2AfDMEhYrJmQzTEIkW6yMbPnM7E3kPEzhvj/kL4UDnpa+iXnQ9d
         /Chg==
X-Forwarded-Encrypted: i=1; AHgh+Rp4qCN+pygO5Hep6rAmbbRcIwh8KbpXBmxo23K+mf8jXb5dWVxE9N2H0ZdVPF6rdH3n1l2wNQ1u6E9BMhAM@lists.linux.dev
X-Gm-Message-State: AFuF++mb0Axn8bmANHvB88lZXj4lmumLJOO93iMslT6gvqrU4ynxFet4
	fC7tM5CuabY9m0/KeYNDATh0ufvRNQdWVq2A26fRP6ZXPfSlWmA00eMc6kcHNK0VtuVzHw==
X-Gm-Gg: AR+sD13Wfp4+fIgDU59uLqy/Muao3LqhyNGcFCe3MGSwhlEojI28a5zVe+mzrRaAjyd
	imXpfPFshTOHT7eHEroLU8QnwNuw7lWXJrTkkulBThEJZahjaXwkCY4od+3d3mcvQRoFnvh/Y5s
	ToZRnP7tz/KZ0zHjg0JMKAo9ex6UrksH32hKoPUfEWlhJHzb5sOFAXBdIOPLDxDiQV6vlb/+FQ/
	VcFEdPoutCOvVB4Xb1uqDZ8qN1z7cSagDb+FduDsr9d6LAhyBqHBUS5Tfik9HMJD1pzDelLSiyD
	KjJrXYhSr/jXT8q/gJ7NLcMcsYE3uPOH3cenDVjt6r6RG8seey6BvQD2StH1+ynb8EqBZfgm9wX
	uXc4D/B32okNW0aRRdXbSQv3DpcNMi2C+Kcs8gzl4tZe3L9+lJ0cpR9QcGPQtc9C7RQEpsJZhY0
	yMuuO3wpPchqi7k3PIPBdhjRRqKeMdA8kUEJUn5HKlcMbZfor+TepRLJohaQflVfB6Z8hpoNsCy
	TsIMmP19FZ/HmgY5Q4h1Ymmrjk9ZJ6K8ipgPepXYA==
X-Received: by 2002:a05:600c:4f92:b0:49b:90cc:3c87 with SMTP id 5b1f17b1804b1-49b91c487b2mr573053315e9.13.1788289491923;
        Tue, 01 Sep 2026 12:04:51 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:04:51 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 06/16] media: intel: ipu-bridge: Add Yoga Book camera sensors
Date: Tue,  1 Sep 2026 21:04:28 +0200
Message-ID: <d76e894ab0bff5604856d7f165da1c4ac7055a36.1788286339.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Book YB1-X91 uses INT3477 for its OV8858 rear sensor and
OVTI2740 for its OV2740 front sensor. Add link frequencies consumed by
the sensor drivers when the IPU bridge constructs software endpoints.

This supplies endpoint data only; it does not establish that either
sensor can stream on the Yoga Book hardware.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 1bb3a3e98d6b..47317c423fad 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -65,6 +65,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("INT33F0", 1, 384000000),
 	/* Omnivision OV2740 */
 	IPU_SENSOR_CONFIG("INT3474", 1, 180000000),
+	/* Omnivision OV8858 */
+	IPU_SENSOR_CONFIG("INT3477", 1, 360000000),
 	/* Omnivision OV5670 */
 	IPU_SENSOR_CONFIG("INT3479", 1, 422400000),
 	/* Omnivision OV8865 */
@@ -93,6 +95,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
 	/* Omnivision OV2680 */
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
+	/* Omnivision OV2740 */
+	IPU_SENSOR_CONFIG("OVTI2740", 1, 360000000),
 	/* Omnivision OV5675 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
 	/* Omnivision OV8856 */
-- 
2.53.0

