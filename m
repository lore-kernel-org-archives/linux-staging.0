Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AABF378D68
	for <linux-staging@lists.linux.dev>; Tue, 20 Jan 2026 07:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768892862; cv=none; b=KhG+1rYRvy63L5YH23UO5PUQP28thzUap4YCabvfWyAZ5HvGYCBTUYRG6EcLp4BWxcYXtONgu3gjDfNYse+qJ50D3D+5evwWDJ9JkWR3ueHtQ8QH4AlnIMN+/bra6qbbPUG+kiKYP5BCcvPKhY9NTHEjTDhJ4/NS4iH/GbJs+Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768892862; c=relaxed/simple;
	bh=BtPqIWtvvPVFLKqFNlHu3U6A9wSVK0q178nHuVI2pX4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FI3GTK5cmLTX5eHoQ3zduSGdaAWK4mgKVDHyPRfZ18A0nz9iPyxh/qwDiB5reUAsYCAGFuQ/rc+hNx6ZpmlxJ7vomgkbhL1FaKZRRF5puik6xDLribQgw+NWgHm2NSRwSf/Ft02FLhP57TSjIVBSInLA6TYJjbD9J+1eMJL20Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OS0kxFI3; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OS0kxFI3"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-81f4ba336b4so4587974b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 19 Jan 2026 23:07:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768892853; x=1769497653; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=88ZZfs+VwIaEPE43UcSjRcHLNlhjCgiSFB+N0mWSaTI=;
        b=OS0kxFI3eSnkuuSA8LzDO5PqI5dMoiufQEOC1KrZZe9dkykKvyCh2DM3EHuRgTEMTB
         fgnog0cZjWIQKYu/a2tBpPC4Nqb3+qZg2HM7ZSRqWsdTs3Utvsd8DCukFYmzjn1l0YaP
         f3mKHirzBuKCh5bDvAAFXYwZuPH+syFvv62KL+FOLnkCerzvUXRvH6RL7y7aobXsWTQc
         yHMRZPtTFoPrDZgU+Q449vprzjcO789iaeSK7KHNz8KfT1LZc5YuPspgvfPYaaHOvq1j
         qZnn9gJ6wTc8Y9sqTFxcmojvfnLP1nz9G8fNxkSQ1gHKwCuEEIY5b/tuav5gfz5sSHF7
         esFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768892853; x=1769497653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88ZZfs+VwIaEPE43UcSjRcHLNlhjCgiSFB+N0mWSaTI=;
        b=LJ9erPHy2p5QuQP6hbYvSYeSCGzjkRBo/cU31FlRfG9WIrrs3MITpUQLNXFF+TiZ9+
         52qjN8tFaeHEex4FZ5AIZ//MzQqkrId+/f31eh0EWjUtM+Tdv0qC/XAWDavziaCGvVlu
         4XLwsoCtXCgSdQWUlKIg8hD75KD5zNjG40wKxwr/uTruQV8s99q1EO85JaBYWe6oY9MK
         Av7ImbK42ZZO0mqVRAPbo+uiokJJEE7karfmWZiTcv3FtLnpTU9jnQS793LrY2X6jGqG
         gnKj3CPhoybJGK0pFfKoizT1ZLD4ot78viTz5LasPOxZeQOyBoNprdQiYQX0kzOmHVv4
         shzA==
X-Forwarded-Encrypted: i=1; AJvYcCX03SdKCA9hY18rmbqVHcsVvDqcgdhKb6m+Xhwl/5jIhHSMpwmP+w0cCAjVT2RmGRC5IQq4Wozk/tqY/pH6@lists.linux.dev
X-Gm-Message-State: AOJu0YwgfQVkrHBL0skV5f1SZRHfe/MiTxip88EjTx9C1V5IrpPnLGx5
	uLnlzO3XWeKonIhHSCT5rQ71SqM176BRgKiRZcKzlfjyz66kWod6IXVp
X-Gm-Gg: AZuq6aJTtJwG/At2Ci4FWTrPCTDLUrDxat0+aqUbFdr522XBtJU8ywFeEugLyTo3PAp
	0nlX9EFW5yMs3rDZHsPg3asRN2PP9I47IHKD6dJHK8NqqbWReT/lBTQ+wHLzYy+UI9v6R5c8tIi
	0hO1QRq7KcHvbcUwJr7FAnioMfEl1qut/M8RDaIWJbNDYLMVMN2UppMy8GRNbmjizPKyPF16noQ
	p/TIDH0F/vwoqM7F2PU4OjI5v18ewqg2RRh/JOSYksHL16y9Mm34Xv0t94cB7mJftCGl2bqYR7q
	mjcIOJOfxKgR/MYbkSQnmIAKxZuN++pjMX7tMCBVifA11u6K8gWg5xuNHszWTcJSqD1p5LHQGdK
	t3dZaaVdxASFpqkOIvGOM2MBKwZue2HfpWAFYL4Cy+y0nwzttTIlFDgJGYfXSbgKlxhqtx4jXnU
	jUHbO0La4q7quDX3bZIAY=
X-Received: by 2002:a05:6a00:9194:b0:81f:de60:39b0 with SMTP id d2e1a72fcca58-81fde603a83mr2463464b3a.13.1768892852919;
        Mon, 19 Jan 2026 23:07:32 -0800 (PST)
Received: from localhost.localdomain ([58.29.79.238])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81fa12784ffsm10974779b3a.40.2026.01.19.23.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 23:07:32 -0800 (PST)
From: Lee Yongjun <jun85566@gmail.com>
To: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lee Yongjun <jun85566@gmail.com>
Subject: [PATCH] staging: greybus: audio: Limit scope of jack-related variables
Date: Tue, 20 Jan 2026 16:07:01 +0900
Message-Id: <20260120070701.3689-1-jun85566@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move jack-related variable declarations inside the CONFIG_SND_JACK
conditional block.

These variables are only used when CONFIG_SND_JACK is enabled, so
limiting their scope improves code clarity and avoids unused variable
warnings when the option is disabled.

No functional changes intended.

Signed-off-by: Lee Yongjun <jun85566@gmail.com>
---
 drivers/staging/greybus/audio_codec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index 444c53b4e08d..f752d5fbd685 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -935,8 +935,6 @@ static void gbaudio_codec_cleanup(struct gbaudio_module_info *module)
 void gbaudio_unregister_module(struct gbaudio_module_info *module)
 {
 	struct snd_soc_component *comp = gbcodec->component;
-	struct gbaudio_jack *jack, *n;
-	int mask;
 
 	dev_dbg(comp->dev, "Unregister %s module\n", module->name);
 
@@ -948,6 +946,8 @@ void gbaudio_unregister_module(struct gbaudio_module_info *module)
 	mutex_unlock(&gbcodec->lock);
 
 #ifdef CONFIG_SND_JACK
+	struct gbaudio_jack *jack, *n;
+	int mask;
 	/* free jack devices for this module jack_list */
 	list_for_each_entry_safe(jack, n, &module->jack_list, list) {
 		if (jack == &module->headset)
-- 
2.34.1

