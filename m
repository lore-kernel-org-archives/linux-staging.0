Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991EC36AB54
	for <linux-staging@lists.linux.dev>; Mon, 10 Aug 2026 21:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786395628; cv=none; b=O8JeqGkm3gIvjs+peRQ4gT1lZF7TBt+PO9q3gBaZSr/+3puLJ3/fLcpjA0lXB85KrZG3jIvw6atzqp/Lz3pPZYPIT3AngWyyhkQ3akVpIof81LS3aceJe0pJDNwP4Pfq2ufJgeBEhKNc3g+WmBGbZlcSuxGtsZljMZuoj96XYqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786395628; c=relaxed/simple;
	bh=IPu+DETqWyfTUwElrhlqMmCmAKmcCyWXBR6Se67xOPQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LyAmJrwa1QwhvFuCXxtmivHwoOfxODyoYVRXbsm2vfYqTBiWSTSb/flyoQPwFCiPq5CNB0uDryEMffbtWhTpWodym1m98gwI0f9qN4hoxHzcFwxI1K2F148phA9jz9LG8bVTSmbZvb7dA2joDW23yPPHjnqU85BZ4W+wEaqpgQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QScbCGY3; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QScbCGY3"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4997581cdc1so771565e9.3
        for <linux-staging@lists.linux.dev>; Mon, 10 Aug 2026 14:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786395626; x=1787000426; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tewcAROaFdRUG3aTGPfPB4pUojmTJWaf6EzP67kr6k0=;
        b=QScbCGY3/L+DImGb1VzvPmMM16fl/LIVIESX+KDxwXqO32tXDjYF2mqpbbqpP5MA+e
         qkuCO6dw62Du7KUartNR817AlWMR8dfixuFoEPoEMSnJMeXoowGxMG7VMfWfxz9VME9y
         55HPp/NMnZ5dPGP9/IxIrAFd8g0g7hVCacLAZLA+I6yIKKesXXLWmIOZTUASdOtT6Uv+
         1iPu4bSaRvaBW+kCweVIhqhHozI5gIWk0wLLp5OUBgX75G1Pt8yv7KfB5C0hzaDi2XrR
         E3AGh9FZW6skQqjTDra+uWSRrYk4px2u4A8MzFIA0y/yScXSoPbSxEau6mA6bonDHEWS
         gnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786395626; x=1787000426;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tewcAROaFdRUG3aTGPfPB4pUojmTJWaf6EzP67kr6k0=;
        b=pdtqhmuW/933AJs1dTfuEe7jCOHuBgdrnkQiVNfCTBFb0u/X5l5oBq3obWx2D1//Li
         gTtqYtS0Bctszbkt+2UBzNjyw5IAelPZ7t5MnmcycMcN8KipCOkTVrKI7secJa/68Nfe
         nRJ4F6gVUZbqLLV5RKd2TEB48Y81VR8CKpy0sP3fR3JyGXsJoKHv7boo4g5tE1A345yR
         SUlMt5+UNtJdDwjS43gm4k80qlnXXO2DUzdBnDsvZLdSBlZmiBPJWZDcb+h4Q2q1pCHv
         bCvNzLuxxESDMSwfc9P6LHgQ6Eqz1ZhQ/GxeWc5fOhxStqworK+JZz3LY6vevP5kBJhm
         yniQ==
X-Gm-Message-State: AOJu0Yz4nXFSlX7E0PIv6981AU60R4KvzhHkD+cdBrLCdwbyCOQnwizy
	lqnmyjLuh1YSAb4rA7z8ziL4qQ0YGwUoROFWU/41j1oE1PoB8ySR8+h7
X-Gm-Gg: AR+sD10o8M0LeSaxE8aygZoZMIYM174e9rkDoqrsAlOW2pPDTuS5uQX0zx/5jg4JAju
	C0hUKsNN+vav5bGTMc67CtCyLIqZmp1Ec3rY/sGw4iOPSQFl0Gow6FDy+6SWQkfP3ipWyLXbRRg
	eVI+/zuYJ65MBkTIpDpGh/ZACYXxuolCbfq/H2kqDR51RfPxUdR/iX1S7jLkLVBpsO4P1C9Y69j
	HoHLeNeJtxtekGBDokM52s2ykOxZAtH9oib2XDLjrXlyB8Hfu4ubrzrV4UpMiq9hvdOCrQVC+zA
	i6sc3vnblRcK8XF4wOVPrPIkStvJziZoEZAlKQ56MC00DdnhBcN2/3pjwZfqm960mReCsi24ovu
	fYKwCnzL3VjOqbaKcAW37MpKj7MwOJ/NC6gFgyEsqA7hmnqwQt7ImdXAtMN4Ka4o+EAqLjSZ3SZ
	SB28mNSV+BJOGf6mfNmQdnMdz31HPn/qFh/DtIk/Hoj0WUm6c8TBKVSBDnj1s1kpIbZlxE5BAV7
	QYF
X-Received: by 2002:a05:600c:1553:b0:495:3da3:beb with SMTP id 5b1f17b1804b1-4995e0d0182mr316906805e9.10.1786395625797;
        Mon, 10 Aug 2026 14:00:25 -0700 (PDT)
Received: from linux.example.dom ([41.103.139.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995bdbe02esm217788465e9.1.2026.08.10.14.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 14:00:25 -0700 (PDT)
From: Souag-Ahmed-El-fatih <souagahmedelfatih@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Souag-Ahmed-El-fatih <souagahmedelfatih@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix comparison to true in dequeue_xmitframes_to_sleeping_queue
Date: Mon, 10 Aug 2026 22:59:33 +0100
Message-ID: <20260810215933.10343-1-souagahmedelfatih@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace "if (true == ret)" with "if (ret)" as flagged by
checkpatch.pl. This follows standard kernel style and avoids
the error-prone Yoda-style boolean comparison.

Signed-off-by: Souag-Ahmed-El-fatih <souagahmedelfatih@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 444966c0d..0aa59a5d2 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -2170,7 +2170,7 @@ static void dequeue_xmitframes_to_sleeping_queue(struct adapter *padapter, struc
 
 		ret = xmitframe_enqueue_for_sleeping_sta(padapter, pxmitframe);
 
-		if (true == ret) {
+		if (ret) {
 			ptxservq = rtw_get_sta_pending(padapter, psta, pattrib->priority, (u8 *)(&ac_index));
 
 			ptxservq->qcnt--;
-- 
2.47.3

