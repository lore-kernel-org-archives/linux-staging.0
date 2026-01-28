Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E3D21A457
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 14:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769609341; cv=none; b=qrNsLN6iMe4V3BiRyoGnmZxsguePuRlhMfnSVfRjFFQTRYonhOkHaXKwFA46UPvRs6krUd7RYtyf8PuHBFxTL2r5WznaZJdOzDg8mUWkiHYcX7l2QFzAo4UJk/RuCyAdLwNceOESEzm4RXuFGhJ5/wTEySjQ2pQlSeZBejqW5fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769609341; c=relaxed/simple;
	bh=SJCpCSq3FqlX95u2sBnnu0Mtb6/2Df8CC2chPasHVH8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nNLitN3Y0IRND0VaKZQT/0OIenxO+olyVD3qLmg2aVl7ZmPT+aUfCo13tB+4+d4REPL+QKt41ZVN+DiS0/qPen04xvmYS/mtJ0vR61xEUWjULpVmWY8P8jpJUWhPnhJ5QUtzHqCCN2Rx/nK1dwXGN5qw9JYYITEk6XcQmtoDFb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d78KmYv+; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d78KmYv+"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82318b640beso3018892b3a.0
        for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 06:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769609340; x=1770214140; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0UboJ63LtcZ77ZQp3GiXhx2JgM+P9ZD2N90y/HehnAU=;
        b=d78KmYv+sb18LlBKa3BWVKRYXFsC2fHD7mLgjj4QWlMHpAonusmdUJQ/+iTkO3tMtE
         QbjOTzxPoypF70dp5lrkXPuydDP+Hkwk7VYiueRrFij9Hf9A+sNrepJ5JFG8pOXrsbHO
         EgTHpQ0j0pjGCiT2jC8qOEHedKtfUQOgKL0ctToeQAhq+rSmdyLCNlU2TsgKy0IkYtJ8
         gPCIHkl6n5S5dGUIUZuYz71+n4qLsKZw7yqb4ISg8wXzVoRKerLilP9w4H5ClRP90rcv
         uJk3TBIPe52IXxyKprpxlGVg4LrYuojfw6P2tCZtdnlQlffKWY/9KtoSMt4msZL8HSzB
         QwMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769609340; x=1770214140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0UboJ63LtcZ77ZQp3GiXhx2JgM+P9ZD2N90y/HehnAU=;
        b=v75STgjpxMSveCiyPLpNk745+qO5k10W/RsHIz6o9VVUr4h7FB0ZwZqqGbpN8ayiW9
         6Ty11+FAeZzIJ4SjiXMZztffPS6ZIld9Xk6Tnz+I6dC2CC9b/oF3JKdcpgqlH+q9jF/7
         94tE/YlEs+UZfCib7+r9eKNJooITjPrMtSq4wJ8GDPhD5KFlELorTITX1kZiE2u5vatF
         hi7V8BovV8uAHuEWktbIRmQXwmsAFw+vliknp1HLaQCTddCusxyfhWKtgDv4fNyGYMwR
         eUUI2A+HoEGrNH6Z/pewTYaECUJV9TOF+Ppvbr57udUaPobtcSrhxeZxDgb203Xa/TlL
         +uJw==
X-Forwarded-Encrypted: i=1; AJvYcCVuFi7IbHshyNQV3HZQ5QpsQlM/KdHOolF4tDjkf+AX75hSuILmtjlvmYQmKgq0WCCVroPcA/sle970Cbxz@lists.linux.dev
X-Gm-Message-State: AOJu0Yxfh1Ui7rU+Bv0QgO+s0AUzgewezK0LIp4b7UFGWuFq6oNrHMNi
	rE787RDoxSbekBjs8XmtOPCs0qSfLTi7aV+4YKC2JmF1ICx6salkDIL2
X-Gm-Gg: AZuq6aLflpl5mVJNcaIuwQL+X1zd+SK45i9TVL5Kq6oAN95jUeeczvxS3UQ7KgPI4Nb
	5l71naiQoyhdhQnjZkXZzt7lNdZgfUyze2RzUUeyxuoQemi5xZbexOylUgmenIqUttL5DnuPI0H
	+lj8xDZhV1Br5VAnr5h9VknpP7GBBtVOyoxDC7oRTMOnGNfUOHhZpC88A825PElgeXJtpZ/0+kc
	2/5Rsxgm3wCFnE+nzm1MiIJYGdnN0mHBvZmrqb4YUElsM11RpjDvLw3YgKVABZsnXIKuIsZ+CUp
	5ABqtBoPNZ0JJ4hWFAsocUwMXz0zHHDJMlmn4Fm08pVvKQYOgUxwyNV2IFh8ChcaghHM5xCizjJ
	6fmfbUwWPzVfACg29TuRDCUM69oh3rK1oXXjw4zpFcr0rf68qStZoRyY4xP//v62jXWqmHKK+ZG
	LH+ony6SJnExQ5IVRIbO9o3V9zlw==
X-Received: by 2002:a05:6a21:790:b0:38d:efcb:2e99 with SMTP id adf61e73a8af0-38ec62ddf2cmr4704070637.22.1769609339439;
        Wed, 28 Jan 2026 06:08:59 -0800 (PST)
Received: from localhost.localdomain ([58.231.102.222])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642b0b4c07sm2456786a12.36.2026.01.28.06.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 06:08:58 -0800 (PST)
From: ChanSoo Shin <csshin9928@gmail.com>
To: andy@kernel.org
Cc: gregkh@linuxfoundation.org,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	ChanSoo Shin <csshin9928@gmail.com>
Subject: [PATCH v4] fbtft: Improve damage_range to mark only changed rows Instead of marking the entire display as dirty, calculate start_row and end_row based on off/len and mark only those rows. This improves performance for partial framebuffer updates.
Date: Wed, 28 Jan 2026 23:08:44 +0900
Message-ID: <20260128140844.949262-1-csshin9928@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: ChanSoo Shin <csshin9928@gmail.com>
---
 drivers/staging/fbtft/fbtft-core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 8a5ccc8ae0a1..0fbdfdaaa94d 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -415,8 +415,11 @@ static void fbtft_ops_damage_range(struct fb_info *info, off_t off, size_t len)
 {
 	struct fbtft_par *par = info->par;
 
-	/* TODO: only mark changed area update all for now */
-	par->fbtftops.mkdirty(info, -1, 0);
+	__u32 width = info->var.xres;
+	__u32 start_row = off / width;
+	__u32 end_row = (off + len - 1) / width;
+
+	par->fbtftops.mkdirty(info, start_row, end_row);
 }
 
 static void fbtft_ops_damage_area(struct fb_info *info, u32 x, u32 y, u32 width, u32 height)
-- 
2.52.0

