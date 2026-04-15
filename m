Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7756C3195E4
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 18:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776279343; cv=none; b=RAKLe1pnQ76JCAAFw4EF3QEL29hL+hOnhcJdVlIAAp9tdh7RL/8/7W5Bbfl+zJbhmu30ZijlKYQ98tIidvzMpDRm1VlC9z/YafEAI9vSEqA4o4xZ6uYFRfhA2/7g6cXlB1voTTXsf+WVJpZrLAG2CRCCZQNdi4tiYBJKfUZ7REY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776279343; c=relaxed/simple;
	bh=kee6pbbq1bKjVuBAwdRzjCmNWCqmGfS5nrlDM8rV3Cc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fSeH/pZNapH7Z0PjWoHC7ea2uZTkOYESvPxMh7eyuql7fgKKWcGVALNENn60QFhfrVy6HiStZ7TNwhB7s3poPgSUvGqR+lipAl5XBfqzDa+pbR2dG0ykv+dukk8hMU89fZUJELGW8nye0o1I0h5dqgxBbAMgCDFsH3vWKuHYVGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tg4Fvw84; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tg4Fvw84"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56f8c77ca6aso617901e0c.2
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 11:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776279341; x=1776884141; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+PR/aM2xSbHpLOL6UFAg/lfaAMBhnbURgd6cWiN+HY=;
        b=Tg4Fvw84Twhcg4SeAhsYK0bLVMhqUpGiLYyaNRF7/u3qpsyiIC0AiVTFUGxf0gmi0T
         FfWWyEUlO0TlLMvN2/+eA9vSzAQrbHHUBdmZpb8/waIG2JdptDKrQmdZhB3OFF+0rMAh
         OMXuIsiKrPQZmxS7e2+zty7yVptODIBFHhlCOBFK+Vcp8kWmVY9U94BazHem9lZQ+EzG
         d5XUnEQLtleri6+/pYOhQUYCyRD4kHuyGk3Ba437sowh2D4Dk2VkKd3ux6PWGsaDjx/Z
         +LTwLT5oMkipu5otVsE1ObU1TXBGt4387e3OUiFS/3lADJXlGn3UUmRCsLFA33KHVpdp
         3xnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776279341; x=1776884141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T+PR/aM2xSbHpLOL6UFAg/lfaAMBhnbURgd6cWiN+HY=;
        b=hQQxWNcLE/Hv6oCfchXPUeVm3SCHlQwMAA/5aQzx1lc7JwsFhQK4/i3S3C+gyHujWQ
         QfhWIjavwJIgaGY4ZEPFub1nC7FEy7VsSP81+TmOPNfffWE/1t8yhw11/2ynEFxW/jBG
         5g8jbHd7AI1R+yl38vKzkZ7cbZeK0TETseWi8v42UXEpBHzrmsj/EFEBxVHqQuxE5CTf
         aKww2ry13JQab+JXuZMSw6ttnclGEO5KmipKpqUxgEh4KlhzNR1ESsM0V/NrvFUt5+F5
         00s/Dk/dHLV/YQY3lKWWyJQ7XBC8MLyUwRdad2lPfW8cs0Cyfe4dIeGXMamCqZHyrWGO
         1z1Q==
X-Forwarded-Encrypted: i=1; AFNElJ93B8ExESRnGaUBWqL6w3CcBO1eii0cb3Hji9cF6LuhbADgqvYmRNWqLPVR708yf+EAWo684PTvGVdz+PZh@lists.linux.dev
X-Gm-Message-State: AOJu0YxHl+eQnEgfPuJKeLnOg/ijcV5VKTnedy5U4FGb3SvcZDXAwELO
	8tlbKRt+WMIDSXffokFIt3PTKKjb92WPvAeO2Id0lKdKNkFcU9GrKqL9
X-Gm-Gg: AeBDievl/y2RwWoPQMrzmI6PTu70kmRgY8NXN10sb2IlD50ZWiTFzEcyQYyXwIdr4qg
	TsM91ES4nQBPV4QyGZOwaDj5+tprayR13kuzHDUJsJSrC7d8243FUATbP6FVXHeuxKKx3Ljj6tu
	xsaNcYajl0wvkeHznTcCAenSCaKM04fJ8jE3OvZu4G/VR223y+0LfhCeS58UWrfe4stwS4PXa8z
	H6bVTUH0WHOAc4W64JY4GutszCjl4bo7q58eYYDXSmHvFyQRaDsgKsKZOOFo2wT9ByHbtfxWiEx
	1qG+g0UN0XSlMeot4msYFGVGPxIBdpTdedr2XlzpEjtZ/M9lOmZIhfcAteJ0HCDxrsU3LTl4FkF
	ZlGe4m6NP4EFNOJeD5buwQCoWA/tY6BsZBKhTcD4wvlVRTADy4q7e93RUtoWKlxjiBfwwO7Xw1h
	6EyfFtvVgvWJtlKbtD17mrK31QkLmhRA6OujxexrMR82RyyuEbe9wX
X-Received: by 2002:a05:6122:1b8c:b0:56f:1f3a:a7c8 with SMTP id 71dfb90a1353d-56f3b9eac7dmr11469912e0c.0.1776279341518;
        Wed, 15 Apr 2026 11:55:41 -0700 (PDT)
Received: from localhost.localdomain ([102.244.98.233])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56f89feb56esm1647484e0c.15.2026.04.15.11.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 11:55:41 -0700 (PDT)
From: Delene Tchio Romuald <delenetchior1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	error27@gmail.com,
	luka.gejak@linux.dev,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Delene Tchio Romuald <delenetchior1@gmail.com>
Subject: [PATCH v4 2/5] staging: rtl8723bs: fix integer underflow in TKIP MIC verification
Date: Wed, 15 Apr 2026 19:54:58 +0100
Message-ID: <20260415185501.440492-3-delenetchior1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260415185501.440492-1-delenetchior1@gmail.com>
References: <20260415185501.440492-1-delenetchior1@gmail.com>
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
v4: add Fixes: tag and Cc: stable (Dan Carpenter); carry Luka Gejak's
    Reviewed-by.
v3: rebased on staging-next; sent as numbered series with proper
    Cc from get_maintainer.pl.
v2: rebased on staging-next (v1 was based on v7.0-rc6 and did not
    apply).

 drivers/staging/rtl8723bs/core/rtw_recv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index a739c2bada2a1..00b69571bbb83 100644
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

