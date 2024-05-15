Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FB63A1DC
	for <linux-staging@lists.linux.dev>; Wed, 15 May 2024 04:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715748760; cv=none; b=KH65kZhINmiSTRZkP5Gf1K6oBdpj5v3EovA7bnSId+Hr0YTgGRcz2oWWwm8tE3pjCOM2siwQalFfgR1CVUjePPYaZTZFhwqLi/iltEAUKO1NZrLRwPHvOPdXylsFHQe9Tjd8r49pJvalEr9XrCDcLV6KuxVV3nIAn/mH6mdVdDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715748760; c=relaxed/simple;
	bh=M1i5JBTKlNnw4whqC38Y2pbLHdg0Zlv9LjifcLqh63I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jbdlzNTQNKCpFtJX8OuQ8LcWcU+9xDLzWbyrlYErKZjpdu9I0mWP305lS7SAk+8F9tGuDXyYU8u/UAebHM8M7PoCa2Qe2RAPyFQ7VrrxuXiS+ZtI68JA49SvjLqt0DUtyt/naGe8YGufn6q0aDPetQpFayr1dsIAA6JqEycs/ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=ZgAd15Od; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="ZgAd15Od"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3c9936cb7a8so3018423b6e.2
        for <linux-staging@lists.linux.dev>; Tue, 14 May 2024 21:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1715748758; x=1716353558; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UpFlgt+m9Kz07NZXk8W/VHWKrgS7n4msDSGzYUnX+ns=;
        b=ZgAd15Odhr9AgRvteAToVVOKu/jqGSBbjRqo+zchBoav0o/AyxkaX1+nm7NH0VSesp
         RwSyhJbeF6WU9bcBKK2zqrtYQKwwXkqULvoN6LdZlewCz8G2SGQApxD8zgbhTzmay3bq
         Ps65e8N7XOG35eZl0OzMoSmDAgLSIf6VgoPkaH2ODztvvuVGwrUivFmOzFLO5V1yWvTb
         G9TacQ+3v7FLxxye8p3xLh/QQuBhV+x+5nPqQXiyv7WftZ3VLWSViUBP5er/GaiTTSPE
         ePlZ4FRGHxFGKtdFeVqHG9AoyhUFb3RaQcS4Dk/k9irsZoWY8tM+r+QXX2K4kOpEHigB
         yNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715748758; x=1716353558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UpFlgt+m9Kz07NZXk8W/VHWKrgS7n4msDSGzYUnX+ns=;
        b=odbCY1GrxaGPIXoCA74uTn0C/4ZA1B55bNmQmw3JvX6QlxvrvXSaMvAm/jcjOS5exw
         KgsU5E542fe9qtJydbe5d+Rc3wg7HD3kZOWhQRJPSYi8kA0xkqHb3iqd76becDW32RE0
         Bzpy1IOqKTrdmjWMQwMlzG9z95CVWUqDdom0OfwSlojghbMnBp9yYQUQsUgfpY0SuErn
         a6LflO2sMpXixkOJQ1sDyPm2ZgtQXVK24fhS9B8CBif6ac2MbTjuK5Q3syauEZNuh/jv
         LTZ6d8+pJJJTopyBa0WvViPtupyUVphMqQq5AqWyLexDFBIvrjiNNYdJBlucEGmmPlPA
         xn3A==
X-Gm-Message-State: AOJu0YxNYdBOftWzQXIMBIFx6GnxtJ42hzKvEV4IedrxtR/16Z0c9pqa
	dyBbUdDDEPzpKjSASaiq6iyFpHGJrdpLZ+JFquAlyiY97KYTX8gReXbDncDL9e8=
X-Google-Smtp-Source: AGHT+IEy1CDCsDrqestxfvP2fDjq92ZAOn9EMoRVQIJUC1nXX9nNjFTbjLmuZ9aRwgAsI9uvqcEJgw==
X-Received: by 2002:a05:6808:86:b0:3c9:6987:1799 with SMTP id 5614622812f47-3c9970cf876mr14095003b6e.55.1715748757877;
        Tue, 14 May 2024 21:52:37 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a827fdsm10135035b3a.60.2024.05.14.21.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 21:52:37 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 05/31] Staging: rtl8192e: Rename variable bContainHTC
Date: Tue, 14 May 2024 21:52:02 -0700
Message-Id: <20240515045228.35928-6-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240515045228.35928-1-tdavies@darkphysics.net>
References: <20240515045228.35928-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bContainHTC to contain_htc
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h    | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 40ec29434d68..ce0cd1f557c3 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -489,7 +489,7 @@ struct rtllib_rx_stats {
 	u8    RxBufShift;
 	bool  bIsAMPDU;
 	bool  bFirstMPDU;
-	bool  bContainHTC;
+	bool  contain_htc;
 	u32   RxPWDBAll;
 	u8    RxMIMOSignalStrength[4];
 	s8    RxMIMOSignalQuality[2];
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index d4dbf8052c30..4e7c491c0aaf 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -743,7 +743,7 @@ static u8 parse_subframe(struct rtllib_device *ieee, struct sk_buff *skb,
 
 	if (RTLLIB_QOS_HAS_SEQ(fc))
 		LLCOffset += 2;
-	if (rx_stats->bContainHTC)
+	if (rx_stats->contain_htc)
 		LLCOffset += sHTCLng;
 
 	ChkLength = LLCOffset;
@@ -862,7 +862,7 @@ static size_t rtllib_rx_get_hdrlen(struct rtllib_device *ieee,
 			netdev_info(ieee->dev, "%s: find HTCControl!\n",
 				    __func__);
 		hdrlen += 4;
-		rx_stats->bContainHTC = true;
+		rx_stats->contain_htc = true;
 	}
 
 	return hdrlen;
-- 
2.30.2

