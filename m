Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AB0B653
	for <linux-staging@lists.linux.dev>; Sun,  3 Mar 2024 10:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709460357; cv=none; b=BELo3KCswZJPCruGOgd1aKBL1mRsMxTfY74yqg4rRwCOQ4MHo84cbzegChPi336ysAVYvTBArZlu7v+S4U+fx0UYFXw8ZXT+k4SRI+HPCHmG7lG7foEpt8RXED5n3ZljkhehEh3+HPSvUK5oM1YaFdkyqOJuCYagRJIInVtMI74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709460357; c=relaxed/simple;
	bh=OmYET0QB0zeLXSGxbulUqK1HnTbhzf6jYRRsCBroE6k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=balS4jlHC0nd6dmQ0X55ssnVdNMgubv0v04LzQ4xuyQJtY72NpxUa6rF2okr3jSwCwne7SnfXv2qpa/sCW1i3HhRpQIJFggt8sweYNsf4QAObChW+RhQkCXE9WvdGwPJanRIUBWEkzk4qxxoFKUACOR3ZkE0h+iJq9ngbx8dg1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZlhMjQ5R; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZlhMjQ5R"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d094bc2244so49946251fa.1
        for <linux-staging@lists.linux.dev>; Sun, 03 Mar 2024 02:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709460354; x=1710065154; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cH1ky7tDsOuUrQSh4kqJYPWEuylUXg0nuBp9vVXdmio=;
        b=ZlhMjQ5RLkKWPtulHwIrckY63ai7zcy9nftUwgzCI7hGARXr2FaSDkZwaKwIFmB89K
         1pmWEuAek/Uf66a6/HWz5N8ZoPQ6Eo//UFsuLtNO837kKrBCpfPrWo8L/247BwlmwuzG
         /kOdRZDpuIQrW7YpxCy9l69GaKx+JlOA6VXn2t8VeKml4JnvB2oWdX1yOUSFu4URDXcZ
         z34XMy0+YLWJLK5L4QFWAFZBXMgwdl9de1e7G38adP0oc6HA80AoYdUOMPrsnipLSf/9
         bizfZyV1SenUrGOQzrVyMl873m3BGT1JAcuFmzU5U85bj139HnsmhIGC2pkWSEOVBx9o
         pgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709460354; x=1710065154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cH1ky7tDsOuUrQSh4kqJYPWEuylUXg0nuBp9vVXdmio=;
        b=RBqD9eg5hhH8/G4SRwXSwarvquKAFq8kRS6A3umygXOZo5wK/o86iMWBEPKV8HWLFX
         TlyxuW5zhGN1pMZM1SSu/PZe98HsbhMm4bVDj8NNTV8QjG4NIu+W4ChqD/qFg+DSKzRN
         GzL+eYh8C1TwcyxXBKK6FBbhBzXbRPFsYMp8KBvz1GpFokM1DLXI9S4lKAiqS8RVWB17
         xTRhfo73z2/yj2mQUQlZWL07P+r7zy2cnRXClTkergvG0xpwUzmaoOWslwgybuNjg46y
         SFNcPpupohze1GMm7c+qrf09C/sKjiLGKOoRw+uUrlQB10kKFbhbJ1JkgURzwRWgFrsw
         3Xow==
X-Forwarded-Encrypted: i=1; AJvYcCWPr7f/n3lgCLMXLjwVlucORVoACUT/W004mBExFT3UjmPNjTZ+Ao4MHuuiHHL8pHNIxLsAJeX2bGEaptBHsYKtiHsM7gNsa1Ps9vyh7A==
X-Gm-Message-State: AOJu0Yyr+O1/r9DDfM+2YOgBtfKpx2J79fgmXLlZqcC3ffX3lYIaWtnn
	/8qayj6HwB+mDKqDyKJd+bP/PDUUFuOwRdVGjj808d52KaH4dHO7jE0aQ1Jl2CY+8A==
X-Google-Smtp-Source: AGHT+IEZVXinPCiO3KXm0qAAZIfUiLOJMk/yd4ylYi+UQWXvWeEPxY44iceYS8KUIeMWbG2wep2wOw==
X-Received: by 2002:a2e:8e93:0:b0:2d3:7e8e:de23 with SMTP id z19-20020a2e8e93000000b002d37e8ede23mr554596ljk.23.1709460354168;
        Sun, 03 Mar 2024 02:05:54 -0800 (PST)
Received: from localhost.localdomain (c83-255-24-248.bredband.tele2.se. [83.255.24.248])
        by smtp.googlemail.com with ESMTPSA id n5-20020a2e9045000000b002d24306ada3sm1264523ljg.120.2024.03.03.02.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 02:05:53 -0800 (PST)
From: Jonathan Bergh <bergh.jonathan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Jonathan Bergh <bergh.jonathan@gmail.com>
Subject: [PATCH 2/2] staging: vme_user: Add a newline after variable declarations
Date: Sun,  3 Mar 2024 11:05:47 +0100
Message-Id: <20240303100547.153636-2-bergh.jonathan@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240303100547.153636-1-bergh.jonathan@gmail.com>
References: <20240303100547.153636-1-bergh.jonathan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch makes the following change:
 * Adds a newline after the variable declarations as per checkpatch's
   warning

Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>
---
 drivers/staging/vme_user/vme_tsi148.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/vme_user/vme_tsi148.h b/drivers/staging/vme_user/vme_tsi148.h
index 2a92497c5570..a1b8288b101a 100644
--- a/drivers/staging/vme_user/vme_tsi148.h
+++ b/drivers/staging/vme_user/vme_tsi148.h
@@ -34,6 +34,7 @@ struct tsi148_driver {
 	void __iomem *base;	/* Base Address of device registers */
 	wait_queue_head_t dma_queue[2];
 	wait_queue_head_t iack_queue;
+
 	void (*lm_callback[4])(void *);	/* Called in interrupt handler */
 	void *lm_data[4];
 	void *crcsr_kernel;
-- 
2.40.1

