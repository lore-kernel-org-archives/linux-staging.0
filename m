Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD69D39A073
	for <linux-staging@lists.linux.dev>; Sun, 13 Sep 2026 08:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789289657; cv=none; b=unjpEJjn8OoBVq+kyGVfXG/mZApRe1NKYWfEPatmywl9JsRTliRMree45DcGec3VUTbvcy0Y1CO6CjLs2FU1380lJnS0lY+E2zEyGQ0b+mlkwHgHNw6u/XmzhVm6BXMNUgK8s1xVS0kFEyOiFerkka2RS0CjQLDuHt9t3+z0Uzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789289657; c=relaxed/simple;
	bh=VVdY4uLEM+PSjSa4BxpP6hRuJzxXf0AWV+5KTiKJqRw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PkoQdBZzPZhq+WhV68VbJLsYg8ivu8hprb30CJCBwSF4v6ePf4SVG2VvTSZNfMUV1MgubtClX17WkJL+DUqAPUa5GVvRegbth8+qBDs5Gs6OJv0LnvHPh4MNMWRi4hSDLf8WtEWB1FFQdvbCQ7n4+jSWzy9npFv0XdkBBObdONQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ne8ozHiI; arc=none smtp.client-ip=74.125.225.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ne8ozHiI"
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-49b92ccb8e0so5885425e9.1
        for <linux-staging@lists.linux.dev>; Sun, 13 Sep 2026 01:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789289653; x=1789894453; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3+XuV3zRF3c0btBQBa2v8yLmcPdVUtoareQ/mmTC3Tw=;
        b=ne8ozHiI9uy2uVM6bc5hmiCwMz4o4deHpt503/J+PJD/t4EN7YcGNVd+EA7BtAG+8r
         xPbirKW5dqkqUr4A8b/S57tHuihpFqoSkXZk62ptLcgAqdcceUvY1iJHvjsGOAD8H1t2
         qJpMUb17OxBPD9j7J5eGMxL5VazU5mR4AefURr0FuQvpS9y+1/Wr7fJWQHBhECLW4u01
         cFskeHmo6GL+7Hr51rhlbaPCSF1vF/iND4AUX8J6jiRaCZcoYTBTEpx3Qoei3Gl4NghR
         x+PCB6MWE1qXI/J3Fbiwvthvnl3+7WyDMVWP0yJWyWfd0ZV6XkJkMp/rNiNJ1hlWS3cS
         RLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789289653; x=1789894453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3+XuV3zRF3c0btBQBa2v8yLmcPdVUtoareQ/mmTC3Tw=;
        b=CK3Nf3Hp3Gz5d+jngLmnDbiEU4O6ic4+cPesHqA21rliEkNaSi7LW/C9jfKPphurSu
         dvzw8sTI7rpnkhRUgzke9uRdWkRv8W8az1O/y5XCALFRsiAvxZ+uDWwMq4QWa6noulqm
         VRuL401oh4nrNh1XqnXKXVt+7kEM+kA5yxUXnpj+T4Lmdwn5WS2Nc3RZ+hmuQG3IlUZC
         hod6Jnv3CdYTUWDM5iC5UUCDrguZt+l8jpzTxbb6JthZLLQbrhfbAnTwGyMfNdn/SEpp
         HzBXLoxy+ce4EjecQmk/KkKv7vx5h2C1+O558lmOsWi3w5SCDO37MpewR6HZWIYuZr2b
         yBDg==
X-Forwarded-Encrypted: i=1; AKwUvBwgHl0dwH/u2WS9KbOGboVP8M0sasPj5hIzc2xVDlxArIEadJ1Yc5tZBeSQfjq+6PQCg+SZ1BphejWuoPi9@lists.linux.dev
X-Gm-Message-State: AFuF++lbRyn7Gj1pMfizkyLieNudVgnPL6ZjsoH5zV4589aFrUbEAM73
	gIzt4NpLL1TsoEnocrSdUJ7Wy7IdwNAIPKSkIWs00Al9Ybd5ZjhdsvFi
X-Gm-Gg: AYBFou2Ios+Rpn7C+nKQac+kvEQ47GudZ1mtcXwCC1/EIryDk4MbG8SqMkt9ki5O2UV
	3v5ciyAQwrNE94962Y0b89HYzbVNKrR2X8M2oeALaD7O9z4W7BaxiXytP0fRSJtwtI5WxIUlqVb
	e+wzzvZUAzJ6Z1xLcD0CdhngwsEqs/iiOk87Q0f5/4Xp589981gEoxRtQ4C4HzEIwilcyGx9dkC
	GlvUPRqTHefMIncN29wMWFIpT8LdeBMuiNLofTYfXYe/foK7L9OTz63F/sid71ZSTMBBtoRASt2
	+h9xurGjAXU61JUwFGNDs38TNlcvCB/D4+5Zp9vAByYK4UX4kV2G/+5s3oN/Zez7a6rsQ7GuDXK
	lqoG8GtHelzHWKD/3d3CHV8vjwDw07cHUZ7SLxKllnc8hZqaQNUDo6eVTUUs6qUhEnrd1Y32baT
	zy9qi2C9I3vnFYz8LoGciRp8yYrswjj7E5eex9qTAy832c/RhFCbYlovDBoGpSUVpijsWQ1Lr+z
	xWetQC61sCM8gTRhFA=
X-Received: by 2002:a05:600c:1385:b0:49c:fc6e:a3d5 with SMTP id 5b1f17b1804b1-49e619bfebcmr113344775e9.20.1789289652755;
        Sun, 13 Sep 2026 01:54:12 -0700 (PDT)
Received: from DESKTOP-M0MLFVC.localdomain ([165.99.41.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32e7f5sm18228489f8f.9.2026.09.13.01.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 01:54:12 -0700 (PDT)
From: Shehryar Ahmad <shehryar.amd@gmail.com>
To: jic23@kernel.org
Cc: nuno.sa@analog.com,
	Michael.Hennerich@analog.com,
	dlechner@baylibre.com,
	andy@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	gregkh@linuxfoundation.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	Shehryar Ahmad <shehryar.amd@gmail.com>
Subject: [PATCH v2 6/6] dt-bindings: iio: accel: adi,adis16201: add adis16203 compatible
Date: Sun, 13 Sep 2026 13:53:07 +0500
Message-ID: <20260913085307.13846-7-shehryar.amd@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260913085307.13846-1-shehryar.amd@gmail.com>
References: <20260913085307.13846-1-shehryar.amd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ADIS16203 has the same external interface as the already documented
ADIS16201/ADIS16209, for the properties covered by this binding
(compatible/reg, the DIO-based interrupt pin, and VDD supply), verified
by datasheets Table 5, Pin Function Descriptions, in the respective
Analog Devices datasheets. Some Auxiliary pins differ (e.g. adis16209
marks a few pins DNC where adis16201/adis16203 use them as AUX COM), but
these are not represented in this binding.  Add adis16203 to the
existing enum rather than creating a separate file.

Signed-off-by: Shehryar Ahmad <shehryar.amd@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/iio/accel/adi,adis16201.yaml        | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adis16201.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adis16201.yaml
index b6ba7ad1a..3ce5fb1be 100644
--- a/Documentation/devicetree/bindings/iio/accel/adi,adis16201.yaml
+++ b/Documentation/devicetree/bindings/iio/accel/adi,adis16201.yaml
@@ -4,21 +4,23 @@
 $id: http://devicetree.org/schemas/iio/accel/adi,adis16201.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: ADIS16201 Dual Axis Inclinometer and similar
+title: ADIS16201 Inclinometer and similar
 
 maintainers:
   - Jonathan Cameron <Jonathan.Cameron@huawei.com>
 
 description: |
-  Two similar parts from external interface point of view.
+  Three similar parts from external interface point of view.
   SPI interface.
     https://www.analog.com/en/products/adis16201.html
+    https://www.analog.com/en/products/adis16203.html
     https://www.analog.com/en/products/adis16209.html
 
 properties:
   compatible:
     enum:
       - adi,adis16201
+      - adi,adis16203
       - adi,adis16209
 
   reg:
-- 
2.43.0

