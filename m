Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A26D37CD2F
	for <linux-staging@lists.linux.dev>; Sat,  5 Sep 2026 12:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788612283; cv=none; b=BQ8F0ifyF+bD6zgncAj+rT+SkfJROtAVJ6dI4JoEbemTYpaMd/N3UMpQbOMjP0JkIs4Cp812CktdzDJklRsKZyXh8huX0nuiKYGpTtSqPDScwWu3rZliGizol6F4+7s6/GPdIJ47ny8ZTz7qAjsk/XM9bx8X+e4OyA1eribAtnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788612283; c=relaxed/simple;
	bh=6f5p//qeeEhJiLT6hla2lNz47zEGEWS2WmSvXXHcHig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OVHkC3BDCV9b1zlT8XCcJ+wMwMoV5Mh4Zcfoc7USwgdBB13IRNmwIKmBR2ynFOfUmCkc0Qr4sQELNKJsd6WzPizMNCuhcIbfMr95uLIy99NN9RUpcu5VBcg6ZD621Utdkmv90ZwjogEYyjz6bz4hqkzpkhVhy1YKtmxB98xj450=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fkb+9Z9J; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fkb+9Z9J"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cc891373e0so20864805ad.2
        for <linux-staging@lists.linux.dev>; Sat, 05 Sep 2026 05:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788612280; x=1789217080; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=fkb+9Z9JvuLXrfKG3wDkGdClje+jE5RAs0/LA3oxxLWFhRGUxbLnyWCssy2lkF1NUo
         6GqZkI3DfbPByYaeB9ahYs/JLKvrzA8fElBKZvvyavPeyZatUQ6RhdhtF06BEJy0wpJh
         7vz/gq8DNxmMOxPUnO5/jdoBIR6Rx2MooIoD3/2L8y1Cxn4JcEmcD7h+fG0H+fG5ZvRz
         xZ9lINQ0eRk8NU2DlLf/OEyLlzqykOKipMiILIMCm1whkjTouZttmJLZGPRmVyQ+OQla
         2BoQJNfG7xueBUoKVBK2UiMh6gBw8J2qDm+TgeorTnSa3a2CITX6BHRLbDI51VVtV5k7
         x6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788612280; x=1789217080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=YMmKMaS7R6cYRVMceGqsOGXD6V3sQvTbVcO5uwQv4dqKp0JiXVHLmbB1ZSqB1n1fA5
         t0niQuDK+R0mr5vFifn0qV91SFM1917kZFvHcF7qfYr/tEKrQF066j2oKeRAg3d44AdO
         5dYyotalwlCZZFm8OV0AcPVrs1J6e1HhpQxowdv+xzBWZyYcghlv0RZK6PnGjTswwowo
         oKE+aojBMSAzv7LXlR2oeCPEnDkxYPbjkE2FcZntGOLPOH7UerUYUhQmi0CJpc8qQ71u
         zqT6XyTBW3tSjf2YpZ/mfRzAnGh/XCqLMHK284MFblPQoTHhsD6gyQcuehgxTexuFT+6
         dP2Q==
X-Forwarded-Encrypted: i=1; AKwUvByaZCDyS8wvgKHvt+d2DsTINUq+1F02e759VXUK7H4JXU5JcMS4pzoCjLrqs02JorHCILdMVSebAfnhJ0CJ@lists.linux.dev
X-Gm-Message-State: AFuF++nJRW97VIIHq4uXbHGpW9LsNr7aGzV8NKanuOtp9VukZiENW26n
	9sDqW7WOR1q5ByXkjJ+RWz2YPdwA5DQHhyz0n4K2UVkwVYOJkkA6zoMu
X-Gm-Gg: AYBFou0nwNgkdnUG8k5AtrFmYruwcAI4jvzXWpzGV9mQYWb777gItjv/oXoK0dgfQcn
	3bZKY4yUJyC3Pf4tV9b65ghY1dj5Yxe6hQWPWQ+nTTCQB8pYhg+QBXLtY8BvMzXHU+T0oqLs2++
	94i32ukxTAnIl95olh+hsstcVrXBaqBw1icjrieVwXg4KSBlkZtDsDLicaoNboVl+rGxWoqCyNS
	4wCXXVfMjZXHKG014u0wfAsXeWjMFcuQgKlEZFbAzJxMAN+LZnQXcFyrye/d/ECeQ2W2azpGysf
	oHD/xuHwqOkce6rF6IRXqXaGr+hPb6SOFhpLVX9EW/XOsLOAVaW2ZU4DuX1pW1dz2UOtqgcRxpG
	iI/duXSXGz1dULn4Mg0VnglC2br84EMibs3Eh4n3rpgXE5SHyiYs5Q21XmOw/fWdGn5MBn4WJCJ
	Ipzr0xzkztzQpmVhO6T2XzRtv84xs1j6aHhhjIo85oxw0IXUGO6BOa4lTPaoooFmZc1L0AoblDi
	v9i95I9YqJhLLv+Ux74UbMTubY4xwZV
X-Received: by 2002:a17:902:e805:b0:2db:3b35:1ac6 with SMTP id d9443c01a7336-2db3b351c2emr5928535ad.5.1788612279984;
        Sat, 05 Sep 2026 05:44:39 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3346ea43377sm11740417eec.3.2026.09.05.05.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 05:44:39 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: gregkh@linuxfoundation.org
Cc: torvalds@linux-foundation.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux-clk@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v7 1/3] interconnect: mediatek: fix Makefile typo for mt8196
Date: Sat,  5 Sep 2026 09:44:32 -0300
Message-ID: <20260905124434.6163-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct a copy-paste typo in the MediaTek interconnect Makefile that
mapped mt8196.o to CONFIG_INTERCONNECT_MTK_MT8195 instead of MT8196.

Assisted-by: OpenCode AI
Signed-off-by: Breno Rodrigues Alves <breno3011alves@gmail.com>
---
 drivers/interconnect/mediatek/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/interconnect/mediatek/Makefile b/drivers/interconnect/mediatek/Makefile
index 6bd656668..64170ab16 100644
--- a/drivers/interconnect/mediatek/Makefile
+++ b/drivers/interconnect/mediatek/Makefile
@@ -3,4 +3,4 @@
 obj-$(CONFIG_INTERCONNECT_MTK_DVFSRC_EMI) += icc-emi.o
 obj-$(CONFIG_INTERCONNECT_MTK_MT8183) += mt8183.o
 obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8195.o
-obj-$(CONFIG_INTERCONNECT_MTK_MT8195) += mt8196.o
+obj-$(CONFIG_INTERCONNECT_MTK_MT8196) += mt8196.o
-- 
2.43.0

