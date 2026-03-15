Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2071026CE32
	for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 18:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773598883; cv=none; b=to9pQan4oQWHs4JkzIJTpxDjTHlPRKrhKZFTyq5cjZf03G+UrXqmXaLh3xle9cAbAKNWZk6NfCNDWwtUyhoIs8u+3pibiDCFO3hr19rIgPgYwtpEki8aFcb0AXO1uCaPxprMvks2aZ6syLSS5S5djkaWVkplHpjEFWxU3bGel6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773598883; c=relaxed/simple;
	bh=+G9BxPLMWlZdbbuwP5WfbskysP8kPMKf1+VYrKHNnEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BWo8LkhcRHwux7xvKUjz1W5Bmfh/O8HvDxRxjqvWQLB6tgoap0pfcHGdpFlFo/AceE7I9Tahi8IECFDM9Mb57AZLmS+zyxFW0jZmzELF5Q86EVWuC8jaD7r+XyrAajVa6m/GHjbOVaO78DPxCZUfgdioCXmZS1dJDmofpQ8mDVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hl5pI1NO; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hl5pI1NO"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso33477335e9.2
        for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 11:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773598880; x=1774203680; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NzCLqV+L/stnitiVkEIjw4/HzxboUMGBqtCNLkqpAfI=;
        b=Hl5pI1NOTAbV7D0c4QjL9HF6zehLSmPtXl+KmyEsVJub+u5Pp1kK1giFGyiaV3H19H
         Mek96wym9fUojpYMu6dK6Bg37Hf+4m8Ave6MwKqb5HqR00K+Yg59euk7gSKmQ4ypmt0P
         nLCpgBlTbVUM4RpFlsW0y7L/d9yXpgobzIPNBSeYaKtK98TZVar5dgA+ivJTHolBeaik
         ZCVuVug0cVPvliTByEKA/udnuJnTvZofRsQL0aX7ziricya8y6o3DMAZl8+DKesEiIK5
         oIORO/403gnkDGmT/UOksQMs/gOPh6Y0TonHM26dJzUEC5goAPKqfJUUF+EMPLz3iZX4
         9opQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773598880; x=1774203680;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NzCLqV+L/stnitiVkEIjw4/HzxboUMGBqtCNLkqpAfI=;
        b=BVxVB+BCHKKSSOLYRkjUcDtIc8v8Ry+oKlO8ol70fKJC5zSN+kNcyfMYaTl3LmUgzz
         J9/7/HTA7KrB293DetbpnbeEU//kx6FV8eaHeJSws+ea6dAs4GXMAQWZwg73NKvgJVOJ
         +7vaWY/oL6dynd6WkapngcT0Mtc40wGpz2C6rIaXuUKqNvegwpFJfjFDRbWxVriggcZ9
         /Oe6kTNWo4JLPC5sW6c3qfYFKt0Voo+Szab/TCrS2VNM1gbXl2XFyAQOKfLEVXzIJ7ro
         sgk+bIiO3kM+TMxMseHU+ZqH2aYAmFdVTJvVMd67esxYgBmQvqlOAZfG8ruaVlfwfYSt
         AUCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoLF74IrNSnp++LJT5FK4c+80Gd7eHKeWDkMsciSAQDRt0ay3ArXDLMz9qtnyiivTJXjfnxW3dERvs1/OX@lists.linux.dev
X-Gm-Message-State: AOJu0YyThUF1A5P3Y59Oo2HyYEnJAUTtpxyy6/AaouUGhdFTWCtZ7ckh
	H5eYFbrVc7HDb7ygJ2t4GhT/hKdCNlbo8K7cqFlD6iGxSiLyWCSxjpVj
X-Gm-Gg: ATEYQzz4bX4BgV108WIdhlYVOKlhcjGJ//2TzP3tP4j7+cfjT4DDYq+v/seGyvSTDvs
	CcV3TCVwKRn42hskOo8BGi2iw2o70Zybj0vj4FFY9nEfcrjw9zK2c1yTi4yfNdkylfxrGXemge7
	mIVE33uKhWfUq4Xsg2qSIi75kE/iZpQgnlulK8KIXT8bRjzLKbLsAODuNDtv/1VVReqXG3EUO7l
	83QOaaW2OTQhtyOFEUnK9gBGZ+0doYqIbqLd1CzSe4bBYLVbM/g7IrxpkVWIpNjzQNnQvI417LD
	h8ibkPiG43nbETXqrrWDzexqIaXvvKb4U4vVulRN8n6ucQ7OhokHYSX33gYInRkKEKnw/pCeVvp
	m3irCHA8iBOSExCIbhpbuftSFIuOBJVbLHoTraSzPcZ3KtD95bD5aMYrBNRDC5XwNtPpVRl7tLn
	OdsxlIs3NRWI/6FJ4WITtwyi6+vQ6mmvBF1wBEB1hiXhWWAgxOhVJnl8w=
X-Received: by 2002:a05:600c:8b72:b0:485:3c2d:d02b with SMTP id 5b1f17b1804b1-485566f7a1bmr159928615e9.22.1773598880173;
        Sun, 15 Mar 2026 11:21:20 -0700 (PDT)
Received: from OaroraEtimis.tail60902c.ts.net ([2408:8956:4c20:952e:71d2:7185:4299:35a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557a74266sm69575815e9.17.2026.03.15.11.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 11:21:19 -0700 (PDT)
From: Oarora Etimis <oaroraetimis@gmail.com>
X-Google-Original-From: Oarora Etimis <OaroraEtimis@gmail.com>
To: vireshk@kernel.org,
	gregkh@linuxfoundation.org
Cc: johan@kernel.org,
	elder@kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Oarora Etimis <OaroraEtimis@gmail.com>
Subject: [PATCH] staging: greybus: bootrom: fix potential null pointer dereference
Date: Mon, 16 Mar 2026 02:20:28 +0800
Message-ID: <20260315182028.133028-1-OaroraEtimis@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In gb_bootrom_get_firmware(), the 'fw' pointer could be NULL if the
function jumps to the 'unlock' label. The execution flow continues
into the 'queue_work' block where 'fw->size' is accessed, leading to
a null pointer dereference.

Fix this by adding a NULL check for 'fw' before accessing its members.

Signed-off-by: Oarora Etimis <OaroraEtimis@gmail.com>
---
 drivers/staging/greybus/bootrom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
index 83921d90c322..50c80475d241 100644
--- a/drivers/staging/greybus/bootrom.c
+++ b/drivers/staging/greybus/bootrom.c
@@ -298,7 +298,7 @@ static int gb_bootrom_get_firmware(struct gb_operation *op)
 
 queue_work:
 	/* Refresh timeout */
-	if (!ret && (offset + size == fw->size))
+	if (!ret && fw && (offset + size == fw->size))
 		next_request = NEXT_REQ_READY_TO_BOOT;
 	else
 		next_request = NEXT_REQ_GET_FIRMWARE;
-- 
2.47.3

