Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA4C15098E
	for <linux-staging@lists.linux.dev>; Tue, 17 Sep 2024 05:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726551124; cv=none; b=nlU/e1e9p6FivxD4Ylfy3NneEGMOEo8YaQlpK/O2JBg9623bU5qCDpd4wCGPfMA1l4HbRFYA0VaZPDHoN0OjDmX3n2B0sZi26PZmhtrGiXemyFpK4g+2Zdn0D8c4eL0Dlgh+ojc0hmpqu1mIc+qDNBVaJpUovAUERqVXC+kSyYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726551124; c=relaxed/simple;
	bh=Gpn2H8LHNdXdTOmFy7tNJ6iSxJpv8TCjLYoJz1IYxB0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nyicKLvGHXPgq/s4R73+Xhf20+JYQ2dfpg+I8UHH+xEPXWA09ZjZ71a19ZbLhgopM+ttnvBClsZZ/arZACKXSwrh7Vcv7dqnpXxWGzHVlgNb0dShtxWxUv2RYF3HTkO+HrdmdyY4TtRAwuINlighEtxaj6uB7ntT0Rhb8dTW3eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=V7dfbsWD; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="V7dfbsWD"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-718e9c8bd83so4398890b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 16 Sep 2024 22:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1726551122; x=1727155922; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/aNmWGHy2dB2dhTqpwQodFKxIg7+IWGmSsCtZxhNag=;
        b=V7dfbsWDaqMxT+7okUOQpLAAFcN1BMmkYrBvVLOJyi0J3jU9fYbj+Hq9TrTMnXVkWc
         VsRFHda7jSxzpHkod6f0xFkfKmCKfi13FPJrRBICilxLr/XNq/D0JkPoVB2HOIgdIF73
         zPAzcb9R6b9c7veCxcXjW8INVXpKoh+UfMqu0jCL+weebYDxIt5lunhC6YzAxNaeWaly
         nrmSVETLoUt7YP7FW42nzrargV3JnVD8WN6o7IQWL9HQyiMvlLr+ogkKiP7SVPXEDHMs
         dHidLrutt0ih8CgazytmfYF9PsIhZM0gpE6uo2Cb3y0j2Hry5/kurpyDkDHbpJxD4SVf
         CIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726551122; x=1727155922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/aNmWGHy2dB2dhTqpwQodFKxIg7+IWGmSsCtZxhNag=;
        b=I+q+0OUfktf8BBCZv0w9lpeyiiJoemug2otNVkfJLHc4NmtRTmxnU64+4to2a9GqtM
         0qGdANkIzgFqr8HEz798meCMWqGa5zphM3QXMDE66nO9eoPc6/e6cLvSrd0qheehvni8
         HXdKKCvAlCGerOnhiWUzruiShgDcKU7/TvJK7KpSx/G3HUwaOobb61+vHGMVxA5cYWTb
         9WbsmVLujLX7BWX4nAw0PbNnWoYflhfHo0W4XaeSaTzvr7QCuBf86EqdJPGTM4VMwASb
         bwqsjKfndq6G2MKHPKipjWPbdsHE5ExT9lYr20SutCZmZmY5SOzFmhHTfT3kemPVkeaW
         5GIw==
X-Gm-Message-State: AOJu0Yymb4Hv7eXghtD9wVtMGhochkk+dwZAilJyuiWcMNoQ9ZHHPBpO
	kPaOEjwWDEUimRLZx/Mn89PrH8j9kH+Y+7EkbHL8YtU6PLIYnzA3FnlU/iggFMg=
X-Google-Smtp-Source: AGHT+IHG4o+lsuxq37psiM1fmskoMo4VtXlyrhsBp2Q1ne+m8rOJmTs7umneHzv9t9X+7R9ETx6FXg==
X-Received: by 2002:a05:6a00:b011:b0:717:83bc:6df3 with SMTP id d2e1a72fcca58-71907f55c44mr34251595b3a.11.1726551122001;
        Mon, 16 Sep 2024 22:32:02 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db498e0607sm4392328a12.8.2024.09.16.22.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 22:32:01 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 09/18] Staging: rtl8192e: Rename variable bFirstMPDU
Date: Mon, 16 Sep 2024 22:31:43 -0700
Message-Id: <20240917053152.575553-10-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240917053152.575553-1-tdavies@darkphysics.net>
References: <20240917053152.575553-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bFirstMPDU to first_mpdu
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c   | 2 +-
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 003343e75f0c..87a370a4b2db 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1651,7 +1651,7 @@ bool rtl92e_get_rx_stats(struct net_device *dev, struct rtllib_rx_stats *stats,
 	_rtl92e_update_received_rate_histogram_stats(dev, stats);
 
 	stats->bIsAMPDU = (pDrvInfo->PartAggr == 1);
-	stats->bFirstMPDU = (pDrvInfo->PartAggr == 1) &&
+	stats->first_mpdu = (pDrvInfo->PartAggr == 1) &&
 			    (pDrvInfo->FirstAGGR == 1);
 
 	stats->time_stamp_low = pDrvInfo->TSFL;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index 32dcccd58b9a..64be0415fe0e 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -1483,7 +1483,7 @@ void rtl92e_copy_mpdu_stats(struct rtllib_rx_stats *psrc_stats,
 			    struct rtllib_rx_stats *ptarget_stats)
 {
 	ptarget_stats->bIsAMPDU = psrc_stats->bIsAMPDU;
-	ptarget_stats->bFirstMPDU = psrc_stats->bFirstMPDU;
+	ptarget_stats->first_mpdu = psrc_stats->first_mpdu;
 }
 
 static void _rtl92e_rx_normal(struct net_device *dev)
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 5db03fe9269d..ca8f39f8e9ea 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -477,7 +477,7 @@ struct rtllib_rx_stats {
 	u8    rx_drv_info_size;
 	u8    rx_buf_shift;
 	bool  bIsAMPDU;
-	bool  bFirstMPDU;
+	bool  first_mpdu;
 	bool  contain_htc;
 	u32   RxPWDBAll;
 	u8    RxMIMOSignalStrength[2];
-- 
2.30.2

