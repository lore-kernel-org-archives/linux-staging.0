Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7F3363094
	for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 14:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776693969; cv=none; b=Fvz0EbDXLQXIzyyMDtR2sWSuz17erDd1lSuU3UmKjH7hQCr84yzk8Ws20uU5nuhYM+rz5vUA2iNF4++X/KWDuNh13c7R5YB4+JZ7Bmf9/egYqTdtD+c4bSPGgMgEe860lM8ypvrJ+j1p3YTki8t1cEfRaw6yO2dH8wZr21mHq6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776693969; c=relaxed/simple;
	bh=McTgtxXg3SkM7Vh3ExzGVSZIoRrxtuX65qsjp38NkUs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OZ0pTel9fxrpXILQh1POPbNE5aqz8Ngvx/rxqLzxG1Tcu5sZWN240aD8W8yNST3Fa1ECS62550Z4n1jKuoqK6OZWf21uiFEnyw4q8DpGyJvULuwI1/yyM4B9ps2kc9teAOjZ89qQADLcgfGyrf8VvFRmzlEtcgg80PgiGTDfQ4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nFHOAsB0; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nFHOAsB0"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b8d7f22d405so544694366b.0
        for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 07:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776693967; x=1777298767; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GhnsM1qLpNzVnb2Fml7lbOW3GGX5eMcUoHx7q/ECGk=;
        b=nFHOAsB05YqsZzFHxpFIv3bHlzw/iD3wMScSxghpmqaY9Mu8tYvm6tewDGWoUPj0He
         5gFXvTxuISNzfMghRAXrBhiDZcDWdUbbBHd7z9u09bs9mMZbhOFKd5KRO9/yHl479CVU
         NKfTLrWzEWkI7sWprq7WIgAKL7BuBjjicDQYhvzdAVq96kRo9eMfJXKX1FKE8A5QSfef
         M27IGIP8UjB/SKtpF6evVjoJe+7Q7nlKjIzXUTvVZvU/2SFSMbJVsJLmp8DDMdc8eyXq
         FLNKOTYMNzEWciZF5c0VzZgxKTXid83PhdNmilBNNyJGudc2C0lFLCcEwu7fmsPqNdcI
         EudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776693967; x=1777298767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6GhnsM1qLpNzVnb2Fml7lbOW3GGX5eMcUoHx7q/ECGk=;
        b=AoEQRHDHAZpNgRPKP04mnyL/NY8mz72Owvkqk+dubZLxBrYNoLzbUice/QHTIVd/50
         jlsjWoO7m9pCzIzMUYqKiBfsx9GeM8/6gTiGjIoren0ECT0F58n0QC7syxYfSoLJ4RdJ
         kfYsGo0dI3ZhlwxcWVr8n2P7lxgonBT/j8HIXzQcjT9WmcucdhCHiW8gYSLP3jQhSBvl
         1xbZe2kW4eRQL3Ha4yp9Is0jpWwRa2DwdzZlMbVZzP9AuJDyYjnqZ5VgEj8RTKOJqvrx
         wvnlrk2bulZZCsAInbRy6VC6Mhm5QaXXz+JfPCrAN5zJmlcYeyQPGqbK8DB7OWROoBii
         /DQQ==
X-Gm-Message-State: AOJu0YwQzWumXXOL4aI75Se2MJY6CHQKrRSodcZU8PmuVSldbe4u7+rU
	p71k1dQa5DQCvVzK5qmZTsa51SiJefDqlBcDi+SSX7DiztKEO+8uMBvw
X-Gm-Gg: AeBDievf4bcS/MEApgC942TFq/oVFcl1E3ZzNguVycXHGHfWv/7sh7yTruMUKVLeSl8
	ug34nDdQzV2rai/n9M9y/cTFwXGfwbHCm7om0AdHH/P6tfn/49Q3Y4O1vW4oe1Z6/MGhCWwkPx0
	vK0EFQfaj8zF3ehzkTVHCZK59ZZrWai2n9vEcKVYFKU9YNonSLpiUcziUqiS+tWtFkshpZdoMrc
	ZkGPh4Sr5ZCSVllJY29TIxTim9vB4EDQS45SLAt9mluBm/A3cR3XGrtCO1clZM9ZrXroVhNWrXJ
	KCrVe9i8soXUj9E+uuGIBrziuGFA1oehe6F4mMcIHoPwhvldg6okf0UXzcelL/k7vkcMvA0Xgaf
	8HN7ZZa+BbHRh79t1orimy2fkepF+n/jQx8GRQqBJKKCW7UBTqw9G5StyzOyf2IHlpiBo2/rC5n
	BCF3z4l7EQTpk1lKap85wVJsZU8jXQm22l5P9+t2OKHcjBfktbqw8vnJYEktv0wqqk7w7+GnAsL
	NLOco1gPNWXOSmzOG0ny7xUDb/Jvmm3MgRScO4MtDWOIwKQGJFxkEghl8yN8qI6HhMWuUyApRTI
	kvXngpQ+m10DpGZ3StjciLvwDbA=
X-Received: by 2002:a17:907:160d:b0:ba9:2233:1ec with SMTP id a640c23a62f3a-ba92233023amr14668466b.22.1776693966583;
        Mon, 20 Apr 2026 07:06:06 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45121109csm358128966b.6.2026.04.20.07.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 07:06:06 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	Alexandru Hossu <a.hossu@student.tudelft.nl>
Subject: [PATCH 2/2] staging: rtl8723bs: fix OOB read in OnAssocRsp() IE loop
Date: Mon, 20 Apr 2026 16:04:32 +0200
Message-ID: <20260420140432.150431-2-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420140432.150431-1-hossu.alexandru@gmail.com>
References: <20260420140432.150431-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexandru Hossu <a.hossu@student.tudelft.nl>

The IE parsing loop in OnAssocRsp() advances by (pIE->length + 2) each
iteration but only guards on i < pkt_len.  When a malicious AP sends an
AssocResponse whose last IE has only one byte remaining in the frame (the
element_id byte lands at pkt_len-1), the loop reads pIE->length from
pframe[pkt_len], which is one byte past the allocated receive buffer.

Additionally, even when the header bytes are in bounds, pIE->length itself
can extend the data window beyond pkt_len, silently passing a truncated IE
to the handler functions.

Add two guards at the top of the loop body:
  1. Break if fewer than sizeof(*pIE) bytes remain (can't read the header).
  2. Break if the IE's declared data extends past pkt_len.

Signed-off-by: Alexandru Hossu <a.hossu@student.tudelft.nl>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 5f00fe282..9666226a6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1400,7 +1400,11 @@ unsigned int OnAssocRsp(struct adapter *padapter, union recv_frame *precv_frame)
 	/* to handle HT, WMM, rate adaptive, update MAC reg */
 	/* for not to handle the synchronous IO in the tasklet */
 	for (i = (6 + WLAN_HDR_A3_LEN); i < pkt_len;) {
+		if (i + sizeof(*pIE) > pkt_len)
+			break;
 		pIE = (struct ndis_80211_var_ie *)(pframe + i);
+		if (i + sizeof(*pIE) + pIE->length > pkt_len)
+			break;
 
 		switch (pIE->element_id) {
 		case WLAN_EID_VENDOR_SPECIFIC:
-- 
2.53.0

