Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E60A326945
	for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 15:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782140734; cv=none; b=trsPTscMM1vr/j++Z/uLim/mTA101CImFpJZyKDV+wQI+8Vyqy+ZWM0S9hwgs+CCtMQPUTe2pk03S+UUrORbcdL3pn5jCrecjtUF/de7wW5tEb9lBJkoDk7atnPl4O9zqYyRxSQVRgmHIlchQKaQlhUwEoOyXP1m/1QIImtiFSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782140734; c=relaxed/simple;
	bh=ikcqpOvl5IQ1bOkrSs4EAPqGyxNCiKOfgIfVMejmauk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hd8M5bNRspMpOeHuWvztArvlGOfiUdpzBkfDRTSB4A38PyVU34faYQeUmqLH2xEYbQXr7TUHBKUhEwY1jE+O1ORbbxjqxAwGEdyCVCDlehkItJipzFIEvSVYzfuzSpPiSqGVslriC2zSzBRb9IxvoFTndvGfwd5UVacnKR1pgOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Px6FtLTR; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Px6FtLTR"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8452a597afcso2537315b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 08:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782140732; x=1782745532; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=znlvhEDVWgk86nX3HQBgnFoFqXFA2zVuL0AKn/CCZps=;
        b=Px6FtLTRt7FZaWBJERdCggX0x94P2G6yIs7dZrSveff8cJ7GebBWm+VyFn+tCb0Beu
         oNTF0K6tJlbG17m6p/lR5qqXE7ks5O5IdG67146xXd42vutxFKCiIxgeX1OTJ64twdsm
         vMmLcEZsBH89tBn6nzw4iNw6XPtzOTXZkj/afjgSUbm4Z5WVc6fCFbGRdjf6AEkfZQRT
         a14FwEJvg4HKyU2iKUJCR3g7JY/a0kAHI/hvvuc8L8RF8+JhzDaKvmMAeXVeqg98BOW0
         7FtbMQ2lQzs22I2sMDxlkqA3GG+mqTbfaODU6uKsRspETu+dza7LerYrB8ILdqId2KEo
         o/3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782140732; x=1782745532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=znlvhEDVWgk86nX3HQBgnFoFqXFA2zVuL0AKn/CCZps=;
        b=s47PeAgh2HMCXqJrdDgfbntb2KxtpnxWT//Lyqo1sVxYr/RuKqlUnJQ3uyurMoCYQ+
         qY4MNpH/DNP7pER3bLBGjvjDyzeuW8hDTWKPVbrXBSb8UivzmK+B2x+ZvAFZzpyKlBTc
         tuWcHSTWUdNWorT0tqmZ67omJ4PlxwmsQ/Zk1U2nSnNphK80TtthP3lEwpHbx6Xlih7w
         SDjmdc6OsXmCAWPGQ9wKg2NhlG6UipwafihDjosPyizrHAiw+hUN3RnxG6yECOZPCWqH
         ih9pVkA7O2B8SGSfwMPPHOt9oD4TxPnQu6Suxof27vrKSVOUfOehp4ajqxRc4LpMDmGy
         Z+XQ==
X-Forwarded-Encrypted: i=1; AFNElJ99q/OXo3YV4HdLuLq+uqBhn9kpYwGpkDwVzw/3BcL4Cz9Nz5oHJCgwhFeh/AVyQDVx58JxxvWZGjPPwudu@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1hUSxPw0Ngk9kSQLZQQIYdBGJBc3WcWBdhOz6pz9nIh8+Bofs
	g+QDq/X85lSwkLGIz03t3Jmctvs4ieJwp/VVeWgbp5xDPzEz2O82GyfT
X-Gm-Gg: AfdE7cmuc9oJMObr9N04yfgeVqtHkJ2JOSFlnjQqgKUAllJoc4YwJzHt/MkXfNSHOQv
	hEod80L5u4WmURToMAwfWILm3JasErwNvl44/vo1I3Ahk8acjDZU9XkKMpS/3phqz9W4jlqVP5V
	H3+ByR/XQIU8utqFvl4iMnBNFWU90VOzGqG7L+KAufNYZvckseBWnlT/uPCdTqhVkxdIeyEE4ze
	Efmuu7GFfIMuD0J8M5uaoWW0icmV7eKrd8TC8TC+fx1XOuScTkFRJ3Nb0tyv1IE2lnGOPudjgPa
	1RwGgYOgv112e/hylofMZgLpA4rVIbC/2Jlwq8qwG++suQKtjwhRMTLw59cylCmKQd0jDNxKJI+
	xJIDg598rqqCD4V/lBx9yii9yFcoHh/C5zWJO9Anv5EU/mNZU+MrOE+Lo3QDQ3i7U1zIMrs2c48
	ALgWh4bAuz0+P/5zsHcRBg9s7OA3JXNi+HJ9qZLoZZtUTTXnr07+V7G96BSTs6DgVSdEqVr1Pgc
	quupomp
X-Received: by 2002:a05:6a00:4b07:b0:845:3fea:966 with SMTP id d2e1a72fcca58-84562479216mr10935861b3a.15.1782140732319;
        Mon, 22 Jun 2026 08:05:32 -0700 (PDT)
Received: from localhost.localdomain ([115.99.236.201])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ea22c7sm7751544b3a.44.2026.06.22.08.05.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 Jun 2026 08:05:31 -0700 (PDT)
From: Mani Bharadwaj <manibharadwajcr@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Mani Bharadwaj <manibharadwajcr@gmail.com>
Subject: [PATCH v2] staging: atomisp: anr: move trailing statement to its own line
Date: Mon, 22 Jun 2026 20:35:24 +0530
Message-ID: <20260622150524.31133-1-manibharadwajcr@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the return statement in ia_css_anr_dump() to its own line
to fix the following checkpatch error:

  ERROR: trailing statements should be on next line

No functional change.

Changes in v2:
- Resend with proper formatting via git-send-email.
  The earlier submission had formatting issues due to a
  misconfigured mail client.

Signed-off-by: Mani Bharadwaj <manibharadwajcr@gmail.com>
---
 .../atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c      | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
index 899d56623..fd50a20ac 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/anr/anr_1.0/ia_css_anr.host.c
@@ -36,7 +36,8 @@ ia_css_anr_dump(
     const struct sh_css_isp_anr_params *anr,
     unsigned int level)
 {
-	if (!anr) return;
+	if (!anr)
+		return;
 	ia_css_debug_dtrace(level, "Advance Noise Reduction:\n");
 	ia_css_debug_dtrace(level, "\t%-32s = %d\n",
 			    "anr_threshold", anr->threshold);
-- 
2.54.0

