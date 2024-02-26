Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8D01F94B
	for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 03:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708919805; cv=none; b=JP6giEGLI2fEGrgBpFrMYARSUon6WOg1bq9XTkcwdkq4XsDuBE/QYwvY0b4MXzc/jJwW2KRHzCU0VStH+c+rLOUP0GVspt7iJvYtM4PU+mnANMTYUccMPbbJsm7Rpbj98Sbhe8DueOGi3PCRUY2CUN6b6FBbuB3+m6lNTrUkMSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708919805; c=relaxed/simple;
	bh=lY6LEt+VlaNFkPSMPKLNDUAWoJIQyD3uckL91txfO0w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oSgHcYISfGFtNE/H5VSiYj6dM2mudFVo9TxOG7z8biGG61e2/Sk8ADFUi7me7QsCFHy30m/h29UX5EjHrdU9rnxS4QMptjceHwavmOwrau+bM2Kb+TQGkhpGSDUaW6RcEUlGGAPsER3V3iqBbL5EkYP8I/FfMi/1/xSNrsr5z0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=iWxm5Wox; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="iWxm5Wox"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1dc98892850so6624245ad.0
        for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 19:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1708919803; x=1709524603; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dHL7kvJVXgjGfJYrabpYDmkLoWmPK0wOdeTjteAaFF8=;
        b=iWxm5Wox74w6lpGXmojFrLxp57WAZSlqkcPclz1MLY3O06Cla56ecjBb0o4fe0FuO5
         dqhDl3sFyDY6vR1+fGKkXghWirTQBbMTxJ0wimqr4IlsfcWm4ootkQk6tc0SLimcfUyx
         smPrB9GAyr3ugt5QDZLl/zU60GfyBwanwwEShX8fIW41R5oiPHDra/3+UMbgc4940RPr
         FqYCrJcPAerUs3/wn/vHPyN0R0vxSBs7lci/FvF+kWV5m20JyDhZJy04BhM1csx8Lhqu
         a4WxWNUMHzvH+1SMZXq9YwMv068bDsH+2+avVS6rSrPXd95pS0Ws/itecelnlfdUu/c7
         Nu5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708919803; x=1709524603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dHL7kvJVXgjGfJYrabpYDmkLoWmPK0wOdeTjteAaFF8=;
        b=t87RWLvdxFQN6Wx7yz1U4jtUFZXYdXjbiedbA0I56ti7SIrxfD5Z0lzDqkkPq9DCMD
         +vSnoefJW9RVOIunFLoa1c8eJ4g2I3EedWH2+bbVWcRr3PFytkvwIVE2fOFARIlkObus
         5UM6xAy3CnQuRL1it0oRJP7V0ZBtd3dfw5mw91clPDLJvwMIYcEwgxbMGULnyLXJUenB
         HSZMMDOzCkFLoU/x/vW65cAQ/8C2ebG9UWpQJ6vEdjnmIvuEyinfSCRd0thcGw7sGwHQ
         qOO4Uqk5N9xZY/2AmnqfUwMcqlTyfw2ICiHG2xtxjniNxkr3edaItQXA7AVxWMchbST3
         Mrew==
X-Gm-Message-State: AOJu0YzJPe13gxMn6wOQQLFYpm2+xG4/H+GmnV9F+Ssca+Tr35ppQ9yY
	L5eLH4D23p8VXHZvnoQ8zmry3XCil7RQLBo8rFNSNzhUet+QmQaYgou0vjOHp2E=
X-Google-Smtp-Source: AGHT+IEqb1L/zyrtKFIOXiLdBnw2yqUtWy8GMDkrbBKSoRpmL0n98rphHHx3+CtMW25sj5DkYDl89g==
X-Received: by 2002:a17:902:e5cf:b0:1db:7c5e:f07c with SMTP id u15-20020a170902e5cf00b001db7c5ef07cmr8802969plf.66.1708919803225;
        Sun, 25 Feb 2024 19:56:43 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id kh5-20020a170903064500b001d8a93fa5b1sm2897615plb.131.2024.02.25.19.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 19:56:42 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 17/20] Staging: rtl8192e: Rename varoable asSta
Date: Sun, 25 Feb 2024 19:56:21 -0800
Message-Id: <20240226035624.370443-18-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240226035624.370443-1-tdavies@darkphysics.net>
References: <20240226035624.370443-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable asSta to addr as it references bssid addr,
and fixes checkpatch warning Avoid CamelCase,

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index bc08018185ca..644e2dffd185 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -2238,14 +2238,14 @@ u8 rtllib_ap_sec_type(struct rtllib_device *ieee)
 }
 
 static void rtllib_mlme_disassociate_request(struct rtllib_device *rtllib,
-					     u8 *asSta, u8 rsn)
+					     u8 *addr, u8 rsn)
 {
 	u8 i;
 	u8	op_mode;
 
-	remove_peer_ts(rtllib, asSta);
+	remove_peer_ts(rtllib, addr);
 
-	if (memcmp(rtllib->current_network.bssid, asSta, 6) == 0) {
+	if (memcmp(rtllib->current_network.bssid, addr, 6) == 0) {
 		rtllib->link_state = MAC80211_NOLINK;
 
 		for (i = 0; i < 6; i++)
-- 
2.39.2

