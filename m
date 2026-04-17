Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6379D2F5A12
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 03:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776394978; cv=none; b=m/xpr/7sjQqI1wage9Thpxbs3YvRAttrouox09rbyoG7gebY+cl7/KRcsy1+tp0bMIjPkS6Mndg4PtTKp8bvUSVc8AZj1gyRd4EwOdWFKIzrYyPDD9Akq0HLYRfvOh548UaSAc8DxomzyaZvIJb4/4nSZ24kYVxHjaPAsUPAb54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776394978; c=relaxed/simple;
	bh=gjYu/2ofJyGBRiCJbFCjes1+fHC4+IquDZRUtme0YS0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IRpTbPNm6cJ1Tss/soUQd0TQkYSJSkHi6+g6NrZ/X0J5bQIeAg2z8IhpdbPbqY642sWmha09oSsJisFfiHR0jGEH2yGG0MZspap7GWwdYSTpGDk9YlEyMJ49iK6Zh1R3pVt6bfTYtX27sA8RhhpptOH+oDf8sySn0EtGJtaPTUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VoDOXtmw; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VoDOXtmw"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56d89f35940so69507e0c.2
        for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 20:02:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776394973; x=1776999773; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXJlWBy5EhJS9h5WNvEWvOfpNAQjbgOfXUdi7AOiHOE=;
        b=VoDOXtmw6UabkbZQ4mshki6zzvjVS1bCUcZJIUei0Gcm5QtV2P+2mHni7iXMeUpMRP
         hO2BbPz2h21lj3xSSynqBdjOFDjqUgQ+2eDKB56ITZal7z8DKPq7+kCD16TaGYhVNKcq
         84CHMnNt7CBijXP6QpJWT8fGU/NvlZnKpMpAV934LJhYUuQ0AKe1v2GG0DhxVeU/B/KZ
         Ut+QU7QVJ3/hkMRAlBiKnSNpWsLa6nWdm3+BZg9TMdfrfhtK1UhCMwPCTB3xtOY1RdwI
         ClmyNAERFPss7RxWcSkvZmEalHH0VzNbmSxatkHNQMPcgg54+NX3B2MgC46sQ3ESQbX9
         myPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776394973; x=1776999773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SXJlWBy5EhJS9h5WNvEWvOfpNAQjbgOfXUdi7AOiHOE=;
        b=Ggl8TfWhr+IAiorYtsosc/beTJg3RsSPUlQ8Q5UYnqoJPER0VK1NPWCbjhhMIv0oeL
         zc09MgiH8iZlsCTnRSiDUVNy6QHU4kTOzXJ0vI6jefD4NOu+pI3BENQOFStdsxcHuiUd
         YyUU22nKER9/WYfUB/sBttixcaHxzvpwOXuUXfze+mFqminEMbP4A5qAy0bfrCXaEg0V
         Zc4p1aweI03hGwnFmwsiQcX0ENXDrVVdaqtCsxPxfTRin1L3g93NrX+a50aWIjOzyRny
         XQDQkAVyzzThLwruJvy42+vku0Cp1OtURahu602R6i7wQp3ZnIPxV7YRVd1no1oe0n5+
         Dl/w==
X-Forwarded-Encrypted: i=1; AFNElJ+GyaL39ypCGM8Rs8qEaZXDnfFknxIfYfG6KpCP97SLFq3Wf1+f6A/+RrjSp0cQa4E/0BjQNj6LzacKMKhg@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/P24kQryki/e54h4KIjkAAN77OI2NkYX6kK1XR9Uga+Es36Hn
	CfM6F66AlzBn8t6RMHN4OxH1b38kbc6U+OkDslpHbPPwzRywoAcYaRSCWNAlhAfY
X-Gm-Gg: AeBDietJpMZo1KjYu9T55flfj5oJKzyw0DX9ygxSwDsOzuAzE6nlGi/mPvJfRUjpcE/
	YqaozmJ68vFmmGEnUmHlUogUFGRylDiGYyF9I6+n3m08Sm4tTn3Lmyihfnwke8jXxrGKQqPROtE
	EcZlu00G4WyrCaT4Acvembqp249u62nUAI5DxtOlVoZjjdo9Bs8wGKm5u32QYX7EN9Ws8o9vSoD
	bjAhplcATUAB/CncJjXiI3W4iij4wpta9f8ze8pQevWkg1cqBWss1iVBbUwAX1sji9HG8kdORpX
	gkk41+C31RJCCO4BIxVuAgCGJxlTYStTHy4f7ebzlJI0hfP+S0ZI2/Ghs33f8w1eMyNxlM7qX0I
	wjXPZO5zsDVJbY+6/U+nV4BjgGVkuFkUuF8avwzCvo4K1nmY29m+0QapnCh4ReDGdEtBYltHSvu
	CLFuEBvl5EEJR9PA+Z9UFCoeAp8u9JkabZ3Og80r3/q40tLbbXVSo3
X-Received: by 2002:a05:6123:14b:b0:56a:f576:cfca with SMTP id 71dfb90a1353d-56fa57d82ccmr569595e0c.2.1776394973122;
        Thu, 16 Apr 2026 20:02:53 -0700 (PDT)
Received: from localhost.localdomain ([102.244.98.124])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56fa93275f4sm131275e0c.13.2026.04.16.20.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 20:02:52 -0700 (PDT)
From: Delene Tchio Romuald <delenetchior1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	luka.gejak@linux.dev,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Delene Tchio Romuald <delenetchior1@gmail.com>
Subject: [PATCH v5 2/5] staging: rtl8723bs: fix integer underflow in TKIP MIC verification
Date: Fri, 17 Apr 2026 04:01:07 +0100
Message-ID: <20260417030110.42991-3-delenetchior1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417030110.42991-1-delenetchior1@gmail.com>
References: <20260417030110.42991-1-delenetchior1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In recvframe_chkmic(), the payload length is computed as:

    datalen = precvframe->u.hdr.len - prxattrib->hdrlen
              - prxattrib->iv_len - prxattrib->icv_len - 8;

All operands are unsigned. If the receive frame is shorter than the
sum of the header, IV, ICV and MIC sizes, this subtraction wraps
around and datalen becomes a huge unsigned value. That value is then
passed to rtw_secmicappend(), which reads past the end of the
receive buffer and can leak kernel memory or trigger a crash.

An attacker within WiFi radio range can exploit this by sending a
crafted short TKIP-encrypted frame. No authentication is required.

Validate that the frame is large enough for the TKIP MIC
computation before the subtraction.

Found by reviewing length arithmetic in the TKIP receive path.
Not tested on hardware.

Fixes: 554c0a3abf216 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Reviewed-by: Luka Gejak <luka.gejak@linux.dev>
Signed-off-by: Delene Tchio Romuald <delenetchior1@gmail.com>
---
v5: unchanged; carry Luka Gejak's Reviewed-by.
v4: add Fixes: tag and Cc: stable (Dan Carpenter); carry
    Luka Gejak's Reviewed-by.
v3: rebased on staging-next; sent as numbered series with
    proper Cc from get_maintainer.pl.
v2: rebased on staging-next (v1 was based on v7.0-rc6 and did
    not apply).

 drivers/staging/rtl8723bs/core/rtw_recv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 52d029c28ab1f..40884788a30d6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -390,6 +390,13 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 				mickey = &stainfo->dot11tkiprxmickey.skey[0];
 			}
 
+			/* Ensure the frame is large enough for TKIP MIC verification */
+			if (precvframe->u.hdr.len <= prxattrib->hdrlen +
+			    prxattrib->iv_len + prxattrib->icv_len + 8) {
+				res = _FAIL;
+				goto exit;
+			}
+
 			datalen = precvframe->u.hdr.len - prxattrib->hdrlen - prxattrib->iv_len - prxattrib->icv_len - 8;/* icv_len included the mic code */
 			pframe = precvframe->u.hdr.rx_data;
 			payload = pframe + prxattrib->hdrlen + prxattrib->iv_len;
-- 
2.43.0

