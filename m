Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D586252F77
	for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 04:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709008927; cv=none; b=qaFr5EBsQAE4iIUFlaS/Oe09WJe1Q7f/C5WDMJWZQT+cppPnfu3u1xjKBqvl3NaR2xiu9/5jezqUEw5k7VjkYUi6UOCSdG5gZ8GgUZP+HJVGsLoQtpPK4zEBm/IrXJGDtryHbVeVSXceQAkd+wn8CgYkDWYlrt8Wf7WHNQteHhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709008927; c=relaxed/simple;
	bh=dq3YV//7M2+aRXQXq2i4NiwbXhCDwSSqmDEdFPEI/LU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K/TPOnJNfGoYFklyyAzj78OVcCfMwl+TEz/1witVyeRUNBFT02LLywhbRJgZ7R3AUqltfA0JKnBtU9iNdH7ir8L96wqHTWwN/1q2UDkcmctTIC58P/H9XIUfy/DchyFHQd4HHmpeiNWg7iO3/zRsphlR2pu3twCTD75mmOoW9Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=iLhoYg/K; arc=none smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="iLhoYg/K"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3bbbc6e51d0so3067989b6e.3
        for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 20:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1709008925; x=1709613725; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSMAHR3ug17T4QZK2rA8IItpS46EcjEzSoVhVSetFZY=;
        b=iLhoYg/K3dXLw+UWdb+YPmlygR8EfAQALE//R3Wy1gECdsyaAieSMK2FvvfJJW63Nv
         6lEwKbQMdX8j9/CHMyBW2JOApRX/vx9R7stStRWY6V1V3LlbBi1dsYsdIomMc67EIY0G
         uUNog6d8AjFuunaraVJVvdJiRV33F68IAj7YC/pnwC8b6y3GjCDUjbI3C9iakKUR8Jnc
         wIK8bdQmIpsZKjZ3Z0Qq2rTyF9NCPupQGERFb3s0LXd0LoaIsdEtqwtGzfi5feektpfy
         V/mTgOEhOcp7h3OGMwfXzUcp7HEXsPVOKojZcqJpP3ApDn4ljhPT1q/flkonwlZfs5sG
         tkqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709008925; x=1709613725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSMAHR3ug17T4QZK2rA8IItpS46EcjEzSoVhVSetFZY=;
        b=S8XcNMwaT8cKAlvBQuYf+dbl4fJkLa0lPq+JubFWLfcPs/U8OtM21KJxbBBX1Q+DZw
         N3S7S0mndl3lPNN/8pPlJ1SzBdNsOVBNq/FoiBQkWvvbhb0iIiBvHeA0EiIk7Xjp/Cqc
         Wf3jwd2dNMOJ1Pt4zr2DcPzigSz0Qv3uX4eJ5Jt6cYfw6f9eoYpNxpuH0iRIf/RMtcpf
         Fnta/a4QhxFM1iiuwXmr6cJO0NfuLtiwRINgjCu9XCmfoO/0B8bPeQLbW1jAi/9qYxaA
         wmOvXQijR6xjLyshbW4QaH7EzBevOiojlFqIwVlmF+XuQ8+dCERIZZAxbmS74/A5VdPU
         7hDQ==
X-Gm-Message-State: AOJu0YzJwTLgtwdwsbt/MW9D5LAf95djgtCI59XH80+lJgDDP3CQZkhq
	8NN/k3nCZ0B2E0JHBTUQFaRnIFhfqduQE7oZwS/84OglOPnDoJqdBLONNBRLn4Y=
X-Google-Smtp-Source: AGHT+IEPZqrpTcBKp/rzy8jYhUX6fj4Cyb90cGQuZN0otY5MFd5Gte5RW9O9W/RZ2JfiIl2CCHcyDw==
X-Received: by 2002:aca:1c15:0:b0:3c1:836d:4def with SMTP id c21-20020aca1c15000000b003c1836d4defmr938380oic.26.1709008924870;
        Mon, 26 Feb 2024 20:42:04 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id e30-20020aa798de000000b006e4ecc3e394sm4899782pfm.79.2024.02.26.20.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 20:42:04 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 03/20] Staging: rtl8192e: Rename function SecIsInPMKIDList()
Date: Mon, 26 Feb 2024 20:41:40 -0800
Message-Id: <20240227044157.407379-4-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240227044157.407379-1-tdavies@darkphysics.net>
References: <20240227044157.407379-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function SecIsInPMKIDList to sec_is_in_pmkid_list to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: no changes
 drivers/staging/rtl8192e/rtllib_softmac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 83f337e27209..607122ab4b00 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -664,7 +664,7 @@ static struct sk_buff *rtllib_pspoll_func(struct rtllib_device *ieee)
 	return skb;
 }
 
-static inline int SecIsInPMKIDList(struct rtllib_device *ieee, u8 *bssid)
+static inline int sec_is_in_pmkid_list(struct rtllib_device *ieee, u8 *bssid)
 {
 	int i = 0;
 
@@ -747,7 +747,7 @@ rtllib_association_req(struct rtllib_network *beacon,
 	if (beacon->BssCcxVerNumber >= 2)
 		cxvernum_ie_len = 5 + 2;
 
-	pmk_cache_idx = SecIsInPMKIDList(ieee, ieee->current_network.bssid);
+	pmk_cache_idx = sec_is_in_pmkid_list(ieee, ieee->current_network.bssid);
 	if (pmk_cache_idx >= 0) {
 		wpa_ie_len += 18;
 		netdev_info(ieee->dev, "[PMK cache]: WPA2 IE length: %x\n",
-- 
2.39.2

