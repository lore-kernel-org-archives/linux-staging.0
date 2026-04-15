Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DC0332906
	for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 18:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776279349; cv=none; b=B8Qs4cCaqmqK4r2We6+1GCnE1FBwF45l1qiVag07kA1mO3sY9wrWWFzkP05J6xOD61QtV/RWiCreJrxmi/nZPgskSVAQ9VAiLBfk7CGPjz1/S2yrAV5sx9JgflbRQ+B5TXg5wneZKjz8GMSapMblLdRJnB7kpp4iJeNhCzT90mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776279349; c=relaxed/simple;
	bh=Fd2F7C28NBMqNA7NBSvFz00bwpJ9oafZoR1UGpaikho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DczHsrnEFRNB7j7JtBoUJA6I0qAbYfGXETphP0pBp41QbTgua8PvrJsqgaZ/nhtEfYLOuLSXVEe+qunoyzRfSdu0gzBPih/zoHaguNw+zUFQpoR1JT7mpvvEZnwp8lQ9SAcUm3/H2QLNdJruzRgiqVYQ28qkocgMi5JvmLFxSKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XCt0dNst; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XCt0dNst"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56d933b555cso2719130e0c.0
        for <linux-staging@lists.linux.dev>; Wed, 15 Apr 2026 11:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776279347; x=1776884147; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6YWqAx6Tf+rAcS8XG7Epy7pp0WO11keOg96xigh14Ss=;
        b=XCt0dNstDJo8Fgs/oD5YXX+UOQeg/6NYigFy/VXapr/f5vVejorF3oM56XM74ZBYD/
         4ez8N34QpfD9RXOA492GqYnl+xpoUYGblEI0949pXSVoAEpBJ5aUQMUddfxcVcwOA7pt
         LPE8Bc7W6nKIbORU5MtQmAhKW+LXDHsvzUuqRT/L0SgLgEh8IB7FBs9Fs4cmDdobKgPg
         6Z7ynUD2FUU+14gHJ9DCSNRJYnWKJmHoq0kc7gdSZ8GP/6Zo184cDZbC2uDhGdo1riK5
         Uj/JXObU6uf8IWmrnn37lhds1dcjYWARo0KMc6nzsRtcJ+HkTtoTRHb/GBum7OGBxr5y
         u9Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776279347; x=1776884147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6YWqAx6Tf+rAcS8XG7Epy7pp0WO11keOg96xigh14Ss=;
        b=DKF99hJ4Obob72cJAoZWDEQ9QmIEJojppw9al6JrdNa3Q2g+QDfqNqanwJpMnPx9v1
         KZzp+YxdxMKd/WeEqEvT0io1b0jN5TPVuOkBm3qIfiQN8DsV24e5iRTJwSAmFQA5uXF0
         5yAK6dTzUlhyLLqj5aWlGCZtAC14eilagpfi9jlWlgZ+okJvUDiOU6R/97E2xAnJiQfJ
         ixF09Qd5+DjGkDC5vj/tTHvrXD8fx7mCgL+nq6nvIhYJUMEVlr2u30hR9ynThqz7hd8Y
         IZZ3n0fNZSQ6ug5aJIlLULzcgvSOeLSDkduqh0qaYOyh1UgP10JsIsqctkhEI5IggpUt
         7GkQ==
X-Forwarded-Encrypted: i=1; AFNElJ964547lId400g5VM9/zz1TTFP3xqgks4nHIR7NKUp763wKt/R1Egedtd08X/Y7RAwxSOYdmWFZFOETSiDy@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1/O50Gqs/+KamBgJOzhzKUvWPscIqPpA9RGsbk6G8l6LhL8va
	Utlqh1lgq0vP51Qdkhd3iyX2offQK5fxcXG6TCVs6g+3cRMvw3fqUc7r
X-Gm-Gg: AeBDieuodBRU7AIEA4oJmZooI8a82dSMNpjkuxcd6xj+cJTXa4rTbmOw29RyzwoV8+u
	QoNXktA6bCEuzJaTAOZoxguCni4+/u1g47ulpy2MrnBbZ5g/GAs65PwpeSVkqLTMg22Zu0o7stc
	w0HFeN2KzQqmcSBqBZqasOQNuwZPSB+etL4dRlZkswnYHd/oA2j43liTGTm7k2fvCit2aeQGwLI
	VvEMtqg5o/rOHE/YKy6blNr5UYBQeS+cFrMHAQVblpIcfT055rAnSoeQlaIU94XeVYIg//ObUJk
	oVVO281P3K/Oc+kt5NkYF09nltsc3TRyPpsLDW4XND4Xgf92BRt+c3CzGYARyEVZX+sw4Yp+/9X
	jJr0634j7PfrRrJ0tZJblG0aKiwu1iUy4GWrn5mrYP8GESifmd8YW/jUVQNxVt38fIhEfwCMbre
	JGfxTv0qpo9+1SwvNSaVnvAeUdQJ2IOJ2gdIyuQlaQZ+UUMOmZfjT/
X-Received: by 2002:a05:6122:8483:b0:56f:6add:9041 with SMTP id 71dfb90a1353d-56f6adda1bbmr4615042e0c.11.1776279347467;
        Wed, 15 Apr 2026 11:55:47 -0700 (PDT)
Received: from localhost.localdomain ([102.244.98.233])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56f89feb56esm1647484e0c.15.2026.04.15.11.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 11:55:47 -0700 (PDT)
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
Subject: [PATCH v4 3/5] staging: rtl8723bs: fix out-of-bounds read in portctrl()
Date: Wed, 15 Apr 2026 19:54:59 +0100
Message-ID: <20260415185501.440492-4-delenetchior1@gmail.com>
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

In portctrl(), when 802.1X port control is enabled and a non-EAPOL
frame is received, the ether_type is read from the LLC header
without verifying that the frame actually contains enough bytes to
hold the MAC header, IV and the LLC header plus two bytes of
ether_type. For sufficiently short frames, the memcpy() that loads
be_tmp reads past the end of the receive buffer.

An attacker within WiFi radio range can exploit this by sending a
crafted short frame. No authentication is required.

Validate the frame length before dereferencing the LLC header; drop
the frame if it is too short.

Found by reviewing length validation in the receive path.
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

 drivers/staging/rtl8723bs/core/rtw_recv.c | 28 +++++++++++++++--------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 00b69571bbb83..c0a1c2ab710ee 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -539,17 +539,25 @@ static union recv_frame *portctrl(struct adapter *adapter, union recv_frame *pre
 
 			prtnframe = precv_frame;
 
-			/* get ether_type */
-			ptr = ptr + pfhdr->attrib.hdrlen + pfhdr->attrib.iv_len + LLC_HEADER_LENGTH;
-			memcpy(&be_tmp, ptr, 2);
-			ether_type = ntohs(be_tmp);
-
-			if (ether_type == eapol_type)
-				prtnframe = precv_frame;
-			else {
-				/* free this frame */
-				rtw_free_recvframe(precv_frame, &adapter->recvpriv.free_recv_queue);
+			/* Ensure frame has LLC header and ether_type */
+			if (pfhdr->len < pattrib->hdrlen +
+			    pattrib->iv_len + LLC_HEADER_LENGTH + 2) {
+				rtw_free_recvframe(precv_frame,
+						   &adapter->recvpriv.free_recv_queue);
 				prtnframe = NULL;
+			} else {
+				/* get ether_type */
+				ptr += pattrib->hdrlen +
+				       pattrib->iv_len +
+				       LLC_HEADER_LENGTH;
+				memcpy(&be_tmp, ptr, 2);
+				ether_type = ntohs(be_tmp);
+
+				if (ether_type != eapol_type) {
+					rtw_free_recvframe(precv_frame,
+							   &adapter->recvpriv.free_recv_queue);
+					prtnframe = NULL;
+				}
 			}
 		} else {
 			/* allowed */
-- 
2.43.0

