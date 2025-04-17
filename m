Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFE21F4199
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 00:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849984; cv=none; b=fnAo8oVhznFg2sPY8rs0RrgcH8AVFjIdYbX9CfmKlipSoajRwzjxDE5H6ziTxS+2afj7oszs2kZ5KpYmRvYKriKdwht3cWZpF7j/uMasyyJSjQXPZtfV2KHfVl29sxE50NOY9VvA1LjWZ/zc1hHY0o71zRBdDoWl+JukfKX/zsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849984; c=relaxed/simple;
	bh=WAFOP7FyG+vCwxVgewc75RXOWLLjybT3cMXA9lWbBzc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SSQ8q1YhOygDeyUAsj3HTEXXIxHvjFSrEBcJEwhNOG8vqKqV8CAPdZPJpnI1xzoOcDaBtobKsGIi2SD2zU1hnRog8YwI18+buqRR8QUgJjBR+XhC4AWy0DbSyrRj0DRgJ0cjwenWpZNqS90XrJkIml4iHZFeFe+l6n88Q8DgutY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=HobVpD53; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="HobVpD53"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7398d65476eso202410b3a.1
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 17:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744849983; x=1745454783; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kcINWBx+JwvnujHkG7lIpftC3Iv5jwrdue9kd5WGFkA=;
        b=HobVpD53Vb+Fmcnxzi31ctoiaoNHRWe0apaim0/WbVslgwHIYHBx3pyfrqburEs2vb
         BrtbuXtECquEJROc9k8Bngm74FTJYkn3wUX7vDiAMbtrAscRd7hOLc7VnBls7tCIpSvl
         GYGg9d0AXe6zlSdoN9nk9rFYlDzp8yUYE9eOX2p3kQ3m7nUyBGtk/6zvu+er69/5oSCZ
         2gJ26dgPlqfTsHmmCq+oBXuUGL7SjE5g6UrmQ7tJxNLRZUK7DwLHvvkJhJu05elvwmDZ
         RszR7AuWkjQxB61z6GXokzUzqXJIsmDghDchZCfSIS+Zz2x17Ccl+RhL+8ltgMTp2iK4
         YSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849983; x=1745454783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kcINWBx+JwvnujHkG7lIpftC3Iv5jwrdue9kd5WGFkA=;
        b=qRWuCrLYUmFe/Aw62Lo/5BGKDP8++r+HVRmAkqJzGveirEcJQrWpt7fKFPhBPgYUqC
         KQb26c6zn2zT7dXGNMxEvQQawMOzknGbqBSUOJ5qEcUNC/0LJgwKg7ZkT+n6AtpfoNK3
         6H6piOxSHPZf7Y7imVauDwj5k0MZCkc0YlCmbSKggFpzEZxFLeHJmYNQI6cYT/el7R1H
         OgzpI7xlFWjxIUh2Db6eSeslLQnA45xdBLZqS8cWKgsNhhj8WA4TgHh8iuup36GROKHb
         xESSE23PU9hQFBzMUlCCMxUfQvj9OBcop2gJeAcCrDYLMmYNG6a4E3z5RxDRjz/JK3bY
         Elew==
X-Gm-Message-State: AOJu0YwrR6l3NVNUlEc4tnA0LdpBhtH449GA5fn9zO1nqKJf+G8WlsOp
	3pAU7XYeoNO1r9OyCLunqhL8tkDvclxOhuorOF+Ra95joOpHXout4kjINestxQ==
X-Gm-Gg: ASbGncsqR9N5f/x41IB+jMosI0mEJiG59ZYzbcFJInAEQva6wbGdH41MbB9e8zlilF3
	YpTOEACmdQYq5Qg2kQf/EAk00ZbM+9NHAkhY8ToR+qDKdp5BRvhjB5SmHY2Qr8BAqIVCY6yB6jF
	dKDP0flry/V11cJx+4WH8PKtcy6kljVS1wnRQjzy44x6+t5akh5RRGfyszaxpbLqmp4iCShcpzk
	uv0A2lHgx/yn+3fV1U4fw1acpHLKxEt/zjih0Pkf4IrYXgg/LDGMbdNVCeHyNh/ziFIsvwOwyFe
	iJa5PUx6fBQJrzFIspAcRQIhmuVTPIv9MHEVJb2HIUMeWuC8rXWYkz/zjEDfj/hW/p0phiSMFvE
	y5keQrw==
X-Google-Smtp-Source: AGHT+IETqPQKTuoHKPU4diTn2V4OLI8GtL8u97Jm+3G8+M29+dG0rIaU6tVcrb5wpmPS8S0aopOucg==
X-Received: by 2002:a05:6a00:2e9d:b0:736:3ea8:4813 with SMTP id d2e1a72fcca58-73cf28f5917mr1082328b3a.2.1744849982712;
        Wed, 16 Apr 2025 17:33:02 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230dd71sm11050075b3a.128.2025.04.16.17.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:33:02 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v3 12/18] staging: gpib: gpibP: struct gpib_interface
Date: Thu, 17 Apr 2025 00:32:40 +0000
Message-ID: <20250417003246.84445-13-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417003246.84445-1-matchstick@neverthere.org>
References: <20250417003246.84445-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/include/gpibP.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/include/gpibP.h b/drivers/staging/gpib/include/gpibP.h
index 3e21bb1a4297..6461b330a3c3 100644
--- a/drivers/staging/gpib/include/gpibP.h
+++ b/drivers/staging/gpib/include/gpibP.h
@@ -18,8 +18,8 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 
-int gpib_register_driver(gpib_interface_t *interface, struct module *mod);
-void gpib_unregister_driver(gpib_interface_t *interface);
+int gpib_register_driver(struct gpib_interface *interface, struct module *mod);
+void gpib_unregister_driver(struct gpib_interface *interface);
 struct pci_dev *gpib_pci_get_device(const struct gpib_board_config *config, unsigned int vendor_id,
 				    unsigned int device_id, struct pci_dev *from);
 struct pci_dev *gpib_pci_get_subsys(const struct gpib_board_config *config, unsigned int vendor_id,
-- 
2.43.0

