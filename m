Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17C5371056
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 06:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776406340; cv=none; b=JtFzqTjv7coTBb2j57GQZEJ3t97tmPdbxYvai6qiP3A2eFuSTrowmBEcRAMBzfYsVU8H3iEKk2L4Lb4bcU2U9Kg1cGlt6hiEtNRCdkeRgzkBFiAjaOvWnf5cAbRg4PT64vIMYbL3OQ9FIkDbUEvBAN5IDjT6SB+2RmHniT5XQ18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776406340; c=relaxed/simple;
	bh=LQIdA2y7R70azffM7vEEmPT21jtKvg4tGGwa02Wpxc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kv9lyaQfcb6fhDv2QIZXY4lV6wFBS6+MO9dYGNlEaVN6CH736hevt/Q7VYkXm6iZZuejqWSjSQzSTyiVNvc/Ru7P3dgx5n+ytA6O5tl4+3LJl1bwDoSliSU4cjTLC/QpKooC+9QJKXxZE3AUQVzNegLsGtUp6MRIiY3yrkKE8uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PUsP9QMY; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PUsP9QMY"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-95699e8e26aso72007241.0
        for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 23:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776406338; x=1777011138; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHAr/pp9xx4L0THvS20kiAAKgkB/RVI3w/K0Awkrlc4=;
        b=PUsP9QMYGTRW3dXlwGd3hcT0vNwJrX/VJPqPQuHomqW0ICJz3n018UXNMBKBpINBn2
         xplyZMVY9MvSYo94x8hruDfZ5ATH52qV6kCaiz99xcFjeL68HQ99kJvmljfc9dWlPhzi
         TEdOvEju66Hipei351JgQF0VmDaumpLxRI0qav8ybYoz9WGSCWEPvflRkVcC+yD3dMeb
         hmDhLoSKPnJk6nMl1syZgUYZbK4OZavy/HBQOVGTbkP7t6VECHvOuHs8/NwYJl0tIY3t
         wLB1Wk0EZ3UvTwYGVVg8+i/7wadDxtVluhYZ3uxcxU/VWEot/cqc0aaqDUu3U+D9CiHt
         tY6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776406338; x=1777011138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HHAr/pp9xx4L0THvS20kiAAKgkB/RVI3w/K0Awkrlc4=;
        b=pm4UH4uYfOisPq6a3WGhFkPPNhY9dXvpfPpkQVbamYXEMe4EUzVTLdQefTen5EGscu
         UDo+qDVkE4k6aMEEdDm3qwKFXJ6w4PBhn+G06Dy0q+DnqNdovPaF0+TsOcph4IoYHmJn
         NBbE6WANuWbKZtxwIggHt/D9+esck1mxrWPMYB1oOawEKCNPmOrVG65rZ+3WmiJPkQ3n
         5vo7JD9Q6AwIkjie9CsIJD2fMvbrmajDOd3BsCVHvRTWrizlgm80cesAYHkyW8hDAlAY
         8L95aR7gKyREKdEnBQXCB0SzrkTqgA4CEq0ZB5Dug48o58oh+agqIfVyisjrFAxrZ8/M
         GxtA==
X-Forwarded-Encrypted: i=1; AFNElJ/Wo7qSJ2l93WH22sKzANzBgM86wN/NDgQNHM+UxyUZRQ1e9AtfRlQa9Piq5PE5JQ7NdNyy6sLpR/2mO7Q4@lists.linux.dev
X-Gm-Message-State: AOJu0YzSRQUhgsS35095N3L987ARX89jXERn2+LPgY5RnXiEVX7KKgDE
	iLCKay0P/NmVlhgO2IVtTtdu5IC+7XVANLDefS34a0lKzjU54iDfPSPP
X-Gm-Gg: AeBDieudj986AwtMMYB9qPaatCoZvFuTHkGB6/gjGYCa2NCB7wGB2OZIIyyX3jjmBc5
	3GTyIMUHgC6+0S8Lj5UTzs5xz1OZ+mMO/QdLTxlqOr6B8KyRQhOAZ5aWPou0QjyoG7Fesb8CLHr
	spoVUY8cU+Qv7Dl42Jb3cCFvDgSEYB3Nj0F8pr2zBne9s9ACa9M9QPnpNqkiNdATUJtw/YZArYJ
	j7wJLiTioO9lrvll6jTMvEN6/st8C3tVAqxxEM5CmXfMdTXnzD27hvOZCqdJL1cGvfG0vMovjRv
	ZDidm5JgpqSaKeCRPz/WGsrDhGSaY9vV/ETTHkhNc9gxxuL86/DTr6abGVpMQJw/jjJodA6LVYE
	xXhFGY+zH6g6L42z9UpHEDsdomJGS85LgJFEGZ/ABxXHJ5EIbedbChXKup0GYnhImby0c7Afb8l
	AhQ/QEX5iI3IJd62yAMqih27BvGxdPVfMwjLPL/GVo5aTpS/H4pbKm
X-Received: by 2002:a05:6102:5493:b0:60f:ac13:c99 with SMTP id ada2fe7eead31-616f88b47e4mr465946137.29.1776406337613;
        Thu, 16 Apr 2026 23:12:17 -0700 (PDT)
Received: from localhost.localdomain ([102.244.98.124])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9589093a8bbsm297947241.3.2026.04.16.23.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 23:12:16 -0700 (PDT)
From: Delene Tchio Romuald <delenetchior1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	luka.gejak@linux.dev,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Delene Tchio Romuald <delenetchior1@gmail.com>
Subject: [PATCH v6 2/5] staging: rtl8723bs: fix integer underflow in TKIP MIC verification
Date: Fri, 17 Apr 2026 07:10:45 +0100
Message-ID: <20260417061048.62484-3-delenetchior1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417061048.62484-1-delenetchior1@gmail.com>
References: <20260417061048.62484-1-delenetchior1@gmail.com>
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
v6: unchanged.
v5: unchanged.
v4: add Fixes: tag and Cc: stable (Dan Carpenter); carry
    Luka Gejak's Reviewed-by.
v3: rebased on staging-next; sent as numbered series with
    proper Cc from get_maintainer.pl.
v2: rebased on staging-next (v1 was based on v7.0-rc6 and
    did not apply).

 drivers/staging/rtl8723bs/core/rtw_recv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 8d5d9a6dc4db0..e30617875a69d 100644
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

