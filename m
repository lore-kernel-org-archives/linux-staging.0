Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9688185B73
	for <linux-staging@lists.linux.dev>; Sun, 13 Apr 2025 07:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744529577; cv=none; b=YEKzgat1WiTTSiLTAEOszJ80hb8cIgQzvclMKGgXbYtSZpX9QX/UQFL4DIIeAVC7R99I3AFu3NoN98Xa0PAPQlO94TlHsUSqQ54KaTRinRl97WS7uV4kcsJErluHeun7KNE1bPV2M7MPhxadzzvI5Z4tk0H2KgrN5ZhII+EKlsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744529577; c=relaxed/simple;
	bh=pUIA/RXhgilbz1ISOoGK6YAU8jlldGmdEkdoGdAehQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P6mtLPhRdVuiWZ9nq7s+2Ar3py7KaiV34iBwFLcQSABiNUAWVfspJwVk+GEGacOTIxG1P2EcUXn4hmYLpKyMg+qyjp6qRgCilCTtQoaAfjX75N7mBT3TRHHGtH/qIqE79jMoWrDw8H3rHeacKk65RyNz3uGRYO+s2CQIEmXqAfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WkzabdJG; arc=none smtp.client-ip=209.85.222.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WkzabdJG"
Received: by mail-qk1-f196.google.com with SMTP id af79cd13be357-7c54f67db99so433389285a.1
        for <linux-staging@lists.linux.dev>; Sun, 13 Apr 2025 00:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744529575; x=1745134375; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cfqOPU3wDyCgu3vC/mniafYNGRL//NvF+7lZ1K70QeA=;
        b=WkzabdJGz8ZjFYqO6Q7+oUQnQKEoviOxCiuj8inGgnG0P4PKv/ZzuBMn4pzG5fW095
         VxrV9kAJOyeB1chJ0H4nPwXpU3Vv+T6NWA1ejGrllPIsI3FZMqg/0TKNOiZv2quRLboZ
         eAjlMQWx8z+t8kG1tA1cNrC4ynvFMkrOVvgGk0+MfGtDgqcRS3283p8zi4YBOApdvGkT
         AcRujWx/CoouoV3iQiaiUPFDDv779dOyhcM9mfNWob6HH+VmkApuPbhOOoMq17LRwWAm
         Bve0PpKBYUS1VdRWGq9kL9uWYUKIzvGsNubctkNu4JFYh71wIiKj/M1BmnSuk51u17Aj
         i5YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744529575; x=1745134375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfqOPU3wDyCgu3vC/mniafYNGRL//NvF+7lZ1K70QeA=;
        b=tlLe9N1YcXcwPj2rmDZUf9hXrcIIOxDI8q7FLe743e+7R+MT9HfR7o/dV97GL40RfE
         orJYQ+ETL/ZT3wHsEhAZRGnPkR6kmNShJqKw0AwBqfAyzqc7l5qKTnden7LV1IRvD0Ih
         hkr9bScV7JDFHfW0ODqMsOvfDEUG3nIY/rk2UX2X35lRkJga60Fdk71B/HwcyMiZYNh7
         tleBx+CKSHxFh1F4FI5okE5vMQAOa56lE0XZGuR2nLrH9GY+m+sz/IuCzwthv2tq2Nlx
         9KT6R6hkI8NzBwbdSVjaqz91oxdHPMjVVgoBRqkWxROnLQ/eHcpdepwKaLqluOTiEScH
         rEuA==
X-Forwarded-Encrypted: i=1; AJvYcCUVJH/zT0ACCI8yHAr1uIfezqHh7opyL6va4HkQK6FGUHFklrjJ8VeTq7WUQh2LH2Cgn39m5N30JTm1kZdR@lists.linux.dev
X-Gm-Message-State: AOJu0YxG5JqtN4MEdQaQCoe6vQk8kAE/7MUVTjlq4cdYD0aC4/bL0quF
	BprsZW7Ro+iJb+F6HfEAFSl9kcZwuWFbFMr78HmklsoBBPmMVnBQRmOhZq1LTLNCyw==
X-Gm-Gg: ASbGncvIeD/vE/o1TsQ6ZfhM4OjrGsXOi848dCk1JHOlhr3RUorIuzudJk4NBQ6ugAc
	CoYm/aAb/78bV9xc/WdpvgJ20NBMqWwYDdEuroAjA7J2EYMcq+ZFX5P1smQ+UBtjp/tkivVG7jS
	/aAW9aRoSUYPYaUZ8rhXJjPZzeX4isiFA8caTqvpWpY8GqikTidf4xmDexmSncjm06/JEuxo1+s
	rlsVkcqhRB7ax92J+feY+h0mdrd8D0noo/PsSIHwS3RHgLv760KOXMKGQ7BAZHsgubA58UpZ/pk
	ZVPpmFEUa1SWZruCaI0261jGAuDSxaC6KtR6+WPXlA2Y07lESAz6x4jCs2ctQKryGACjgq+OILD
	xU1ccm5DDwCA/qqD6Lw==
X-Google-Smtp-Source: AGHT+IHh7do8k/l7nY7jzUed4eBmOzqjrZqSgir0AaDpT5VzCL16gYZxnsXjqi/syQ2mjP7YJ3yIqQ==
X-Received: by 2002:a05:620a:4515:b0:7c5:6b46:e1ee with SMTP id af79cd13be357-7c7a764cb6bmr1771180085a.4.1744529574458;
        Sun, 13 Apr 2025 00:32:54 -0700 (PDT)
Received: from UbuntuDev.. (syn-074-067-077-020.res.spectrum.com. [74.67.77.20])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796eb0b58csm52142401cf.2.2025.04.13.00.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 00:32:54 -0700 (PDT)
From: Ganesh Kumar Pittala <ganeshkpittala@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	hvaibhav.linux@gmail.com,
	vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	rmfrfs@gmail.com,
	pure.logic@nexus-software.ie,
	ganeshkpittala@gmail.com
Subject: [PATCH v2 4/4] staging: greybus: split gb_audio_gb_get_topology into helper functions
Date: Sun, 13 Apr 2025 07:32:20 +0000
Message-ID: <20250413073220.15931-5-ganeshkpittala@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250413073220.15931-1-ganeshkpittala@gmail.com>
References: <20250413073220.15931-1-ganeshkpittala@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch addresses the TODO in gb_audio_gb_get_topology() by
splitting its logic into two smaller internal helper functions:
  - gb_audio_get_topology_size()
  - gb_audio_read_topology()

This improves modularity and readability while preserving the
original behavior and interface.

Signed-off-by: Ganesh Kumar Pittala <ganeshkpittala@gmail.com>
---
 drivers/staging/greybus/audio_gb.c | 36 +++++++++++++++++++++++-------
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
index 9d8994fdb41a..92cfd1a6fc10 100644
--- a/drivers/staging/greybus/audio_gb.c
+++ b/drivers/staging/greybus/audio_gb.c
@@ -8,21 +8,28 @@
 #include <linux/greybus.h>
 #include "audio_codec.h"
 
-/* TODO: Split into separate calls */
-int gb_audio_gb_get_topology(struct gb_connection *connection,
-			     struct gb_audio_topology **topology)
+static int gb_audio_gb_get_topology_size(struct gb_connection *connection,
+					 u16 *size)
 {
-	struct gb_audio_get_topology_size_response size_resp;
-	struct gb_audio_topology *topo;
-	u16 size;
+	struct gb_audio_get_topology_size_response resp;
 	int ret;
 
 	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
-				NULL, 0, &size_resp, sizeof(size_resp));
+				NULL, 0, &resp, sizeof(resp));
 	if (ret)
 		return ret;
 
-	size = le16_to_cpu(size_resp.size);
+	*size = le16_to_cpu(resp.size);
+	return 0;
+}
+
+static int gb_audio_gb_read_topology(struct gb_connection *connection,
+				     struct gb_audio_topology **topology,
+				     u16 size)
+{
+	struct gb_audio_topology *topo;
+	int ret;
+
 	if (size < sizeof(*topo))
 		return -ENODATA;
 
@@ -41,6 +48,19 @@ int gb_audio_gb_get_topology(struct gb_connection *connection,
 
 	return 0;
 }
+
+int gb_audio_gb_get_topology(struct gb_connection *connection,
+			     struct gb_audio_topology **topology)
+{
+	u16 size;
+	int ret;
+
+	ret = gb_audio_gb_get_topology_size(connection, &size);
+	if (ret)
+		return ret;
+
+	return gb_audio_gb_read_topology(connection, topology, size);
+}
 EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology);
 
 int gb_audio_gb_get_control(struct gb_connection *connection,
-- 
2.43.0

