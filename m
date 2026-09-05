Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18EB738DC7C
	for <linux-staging@lists.linux.dev>; Sat,  5 Sep 2026 14:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788616893; cv=none; b=tbwGH01wI98GH93i3xhCFWIQogocAfIM7wtfbMqZLv22hl0b9BaM3jWjWO8YFitsVf+J6aEkyKz02y6elZBZyKL2y5HGmMY0HsUtZAsrXNldG4HRnJnMq6AJ89oRw5XhcCEmwB7yI9/TjVmzj4ycNG0SJXDiGDIsv7tKlGCeNR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788616893; c=relaxed/simple;
	bh=6f5p//qeeEhJiLT6hla2lNz47zEGEWS2WmSvXXHcHig=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GZHusiE1puBTyvjMVYDnP6YvHkOLsYiimIWHDab9Lc2NgzUDewXJaQOW4pyADPk1T/ZgsxQCAqxurDJo+Tozu/7tJEMOyCEGm4Zq4adIKt8s2umcLSiCbKxMGKLNAsj2s/Vde4Dfdz5gbUdgAqJ8YbOXol8+dNHHMOvyZj8VWtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bQb+sSKd; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bQb+sSKd"
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5c2ae02f69eso1909726e0c.2
        for <linux-staging@lists.linux.dev>; Sat, 05 Sep 2026 07:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788616883; x=1789221683; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=bQb+sSKdQfpw0lXdxfrSbkvYWZHva+2+ZmDP5Pa8CtkztpQT4WPcsIlg53IDT/oVYc
         d4IxwyudDdpxHMq6Ykyz1XcDWvaR12sVXwxHD1xkNryTdArz0yMiIWA83cG8KFGtf7A1
         EGoxqk44S6B3+AF2s5FnGtdWWI8haNsKoCAakyhTSuUqfDjdU8mSB7+hoPsIHcidxhpn
         +dqRxJtqExnKvwc0CgvVGL0B3FJRfuOKFWQV4hBa4Ho+i4PlTWrLRjOs6IbFM+TkmArA
         Ho9QEWSDml3g1YXXrk+AdtrUo/ei+DDZ1A9/0Qd2Icmg/H45HmFE+Oqof3k76HItF4gZ
         gq0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788616883; x=1789221683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sCkeW/rlDEZbQRwhNQlqYVSLXnulFlxF+aDVtk4kLrI=;
        b=QWNod/xQhoeGwnl0k79AQx0NK1HuXOeiXmKdDE3kVtqnUFafXFLFnPYuwdVHAdDaG0
         H8Jek1yMea6E9hHu9NECc1fVY4PX2V/l9bKPhLungySaUL7dGkidQJL3b2vYGSKnzS1k
         nG93X48MH06hMGhKur4cgk/GuKUxZHsXaU4O+r3ANa7nPDuCLiLUy32qzBmY3vCUjNUR
         uB6hhu0PsgFj6KlL4sNnj98b0vDUJcd3vsyJ+ZjJVcktTTmq/7D6OYIBGVfLviSHT7pj
         ggufz4Y1AlTdwc9RvKnFo8mYLFZ470Lf/er6XbZNyFj6y6ZEpX3vfEp8LR6ukgKwVCfM
         z5ew==
X-Forwarded-Encrypted: i=1; AKwUvBxpGAz7GeQ4Sat7uDtCeFrs/Q41tXhor/yBOsSmi+wxRa2plxaMt/cbTOJOawl8SB2TDDCi/+I69LyE+oii@lists.linux.dev
X-Gm-Message-State: AFuF++kkdbkCxg0EqHuxKeggZ8OqWQKvvXc6TEW5QYi3Rt4UAC3m5nc2
	O9zzL+/xGGWt9S+iYrmnPy7nbAl4YRS3SNU57bB0Y8Rpx7QFiiKyTqwv
X-Gm-Gg: AYBFou0huxfCCPP+jLMNhXcSBZqVYoQYuheV0IacMeKGOq+ttZqBisB+W1CrTQwPROW
	psHVrB0wZrrgT1ZoSHpDBNztuSnyZchN488ICSHE1J/5jk8MPF0no/Zg4977MbLKuwxJuLQrpnT
	nO8A5/tziSbor3EEF6r2U5Eh7hU+ZdhtwoglSQBS8BPl+H2pBnwprlSImu9ZEHGWAmsNGsEmFGL
	Dsd/QXiDj0lWzuYogjtRObrHxVTOrcR+ZyQxilnq6GASjuUr2depsxxRqDXIOG5DqN6yRk4/tbA
	M/V1pQtufobFMLavknZjTbufq+vJS/zuk91XBfoQErJdYvFDQdkt4NRm+c48OJuyUHaZK7onAyt
	fWW7AJ3OKIbtegC+i5udFi8SInqPAMMEs7ZZaqPMb9TjHdeEDsObyteQHl85PMqh4cYMXdA1I1D
	Gf1x02ngIRRDx399vQ0fCDQCxXzIrXXtaBugKoC4/TImJTx4urQj/AAnXIsr7pgw/xqfzCcXz3O
	I8mgFJ+ixiNlGTbdE9rR8Nz7xZWIjE4
X-Received: by 2002:a05:6102:1484:b0:785:1d9c:633c with SMTP id ada2fe7eead31-78a4a8436b7mr5213627137.7.1788616882765;
        Sat, 05 Sep 2026 07:01:22 -0700 (PDT)
Received: from Biostar-A520MT.. ([187.94.13.245])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ee4d743sm3706877241.9.2026.09.05.07.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 07:01:20 -0700 (PDT)
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
Subject: [PATCH v11 1/3] interconnect: mediatek: fix Makefile typo for mt8196
Date: Sat,  5 Sep 2026 11:01:11 -0300
Message-ID: <20260905140113.21638-1-breno3011alves@gmail.com>
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

