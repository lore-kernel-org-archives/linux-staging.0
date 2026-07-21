Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32A746AA64
	for <linux-staging@lists.linux.dev>; Tue, 21 Jul 2026 18:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784659771; cv=none; b=Hk1K2LMFRxgKLP7cTje32shH4a+iwUsYckhwTjAtYU08WzAYGB2ckHIY/8ZdOKhS0C0hKYB46mbxD4AG/oRWZ7CyIUqH9kufwfmYXwDpIaLjSiUKmnxa+j0sSwE4DaypN8Ge/65GU5oT8VSac2m/V61fU9AE0jzlvCyVhgjdY+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784659771; c=relaxed/simple;
	bh=EF7x05Jus7vw2M6Zs189/09ELm68bdOtbNlQYK3DMBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rMa35ahx3gclDDN8+dRq4ZybHbqCtgzjQ5wOMnXFe2xOiLsJfxtIp/advMY0cfwL0ZfK5erXtaiOcJMvtnLb3Ox7cSKzuOGqbFqhHNSoVFJppjLOUDFv5y+DW8TKx+Tmcg6p3K2SQ3iPyktgfRCMduL/N4yhC/iwNEoGvgoN+lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ob05MpAe; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ob05MpAe"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-738cdd667ceso1606595137.3
        for <linux-staging@lists.linux.dev>; Tue, 21 Jul 2026 11:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784659769; x=1785264569; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iMHI5d9AyTacxam0z1p5qnhCK+J63tJO9FBXrk9zja8=;
        b=Ob05MpAeqRlytAYaqBPwGI0JycM6OD8kfvtAV4q+IFs5V+0Q6CLMnOEA1cRrH/Psqy
         9nJLDf4ouELXVulQOBW9JyQTRwSV47Zb361N5mxj8C/Th+ZDI/mrVX/ThgslSzI8i80J
         LjdscWn2nAKP34FY2bESq5t8bncSAC9sondJqUQAZgL/EJ5HCs7buZebCn332PdIMYrv
         ctmjPhTat4AGrv+R2KpwLiPp6xPH8DeWT14NknrUk76xL0z3hxmCliEV7w8DMY8oUmek
         R8wggJdjVrJTKpEu4ysoGKdjx0TCii2utjQvbT+hcgppR2gPx97X5is7RUdj6SKvl4dU
         ebhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784659769; x=1785264569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iMHI5d9AyTacxam0z1p5qnhCK+J63tJO9FBXrk9zja8=;
        b=U0+xT/czNy5hTvMOwF3arFeiGI2yqNlKL4dT3GPWKh87y+um2gyzy1ZmrH/gwvy2oX
         JpSW9d1VKl/zH8r69Osbas1Tu+FS9bQAsHRV/ffhZFJZWrGTub2iPuv08TYUaHjZ1HBI
         0WIaJvwLJBTpdqUTmg1eQU3Nh0Yi5XrYFBJ4Fzronp4zlTPaYqvOVN2FwwX50HPrSXCy
         HClOshcYOCUIRdSZ+KJnegvbgWx/kt8bcQQTNeT+GWln1YIrYOczVRP4AgsOzWzVS8S9
         72b9r0X4G999Rwr8Z/JuASTPFqQQdVdUJcyEC3YeFKc3K6sVsNwOjpdCD9GVsIL9ecC/
         BV0A==
X-Gm-Message-State: AOJu0YzyAgULLnN0SoAs1mG52X/cestBhnRS9AaNHd7OXZCHLsl+ZX3k
	Qb6baEqRfgvnjPjRcmX6fMHZz6YTHr0zD1zbJK4Dy2gINIPBtXmb8/dz
X-Gm-Gg: AR+sD13agEK6UiygbG8HFIBkFIDXzSxLLn53d/RDi6CEbO4NITR801mfsZXQrx0oqmP
	XuLiofsSiRA/4VNebOwXLQ6Snh+40jXy2tm2AuleDpp42zdhReNhHBxZCbSn71iE50RPJh/yFYi
	UbnmFIjR9ZGvc9EWkeZqUFTgz+GZkJQu55h2gO7all4gGO9xqiYcuNxd+sLlrsghXf3c7ysVtcD
	z7ZmyG8WEiC+vGydiO21cWFfvXSCcG/pl52uD65Lm9zwDNGq8aXBviruj+54bouxv2peHMWuT3n
	uhivIiS96JU9hESYSE5GUVSXeHYzlD9LTGRVDQYRrxsYwLYNVjYIwVdfzJa/sNFSg/HEBdo9M4p
	EFOhBY8hbVoD924+a/82kzkgS0haHmzM0TVOnNWp8xLqKOAdQ1tarAmdqIbKziRqNX8ASUyeLpJ
	gmkGXEYv7JsChGPdFha+A=
X-Received: by 2002:a05:6102:6442:b0:631:23fa:38d7 with SMTP id ada2fe7eead31-74753669f51mr5646548137.14.1784659768554;
        Tue, 21 Jul 2026 11:49:28 -0700 (PDT)
Received: from localhost.localdomain ([2804:2d2c:ef14:c500:a136:52ac:3edf:ebf5])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9774407726dsm156120241.5.2026.07.21.11.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:49:28 -0700 (PDT)
From: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Leonardo Martins Martins <dev.lmmrtns@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove redundant goto in rtw_free_xmitframe()
Date: Tue, 21 Jul 2026 15:37:46 -0300
Message-ID: <20260721183746.80069-1-dev.lmmrtns@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant goto statement and return _SUCCESS directly.

Signed-off-by: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 16e6c9567224..f11fc285ee3a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1740,7 +1740,7 @@ s32 rtw_free_xmitframe(struct xmit_priv *pxmitpriv, struct xmit_frame *pxmitfram
 	struct sk_buff *pndis_pkt = NULL;
 
 	if (!pxmitframe)
-		goto exit;
+		return _SUCCESS;
 
 	if (pxmitframe->pkt) {
 		pndis_pkt = pxmitframe->pkt;
@@ -1773,7 +1773,6 @@ s32 rtw_free_xmitframe(struct xmit_priv *pxmitpriv, struct xmit_frame *pxmitfram
 	if (pndis_pkt)
 		rtw_os_pkt_complete(padapter, pndis_pkt);
 
-exit:
 	return _SUCCESS;
 }
 
-- 
2.47.3

