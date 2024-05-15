Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DEC4AECA
	for <linux-staging@lists.linux.dev>; Wed, 15 May 2024 04:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715748766; cv=none; b=XX/14mdm5bEWnfh/yBK4yuot0vaBoJU0DztY7g6lPLQiHGZHyoJu317oFTcNAqLqYx/I6AvuLu2Uajrzk2t8yb6dF3S9Op/kIJ08b0Parmv7SaKWVdZHiSMDiJQFARi4gFo3FeAUeeiw3Spln6u9h/Edqv+a4uJdZwtZTqaKmao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715748766; c=relaxed/simple;
	bh=pZUnpdAFnAe4C3QJi8PJJ34AzyytuNkvi1fP4KzRYf0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VSvIj4FYeeE4w+OiaWw75eTQIyaOu5DZdbb5jIKuaLFGCjPfa2WEEw3zJfaUn3PuEZ159b5gh5fd61E6f/Llo/aDWZm3B3aPiJc5V0vdaRLNqFwD2sxRikmuESLlGHj7dE9GFmNxJUBRQufRirVtoMcuwXxJYk35WnZd699sdJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=aV+HmnSi; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="aV+HmnSi"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6f447260f9dso5096157b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 14 May 2024 21:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1715748764; x=1716353564; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrSwXoVqq+/2DYEvpPVjb0pEsc1j46P8FG1c7fjndug=;
        b=aV+HmnSidCUKOGMgEvAG+c9PNZ2IQPv8qqOsztoyjM1fsZ4sx0ke0AwOidpnvG63f+
         TnebnRXsNc3OO+1F27n3DrfZM8qTBvAkPonx58Yze+47+nS55ck0UerJ2YNqmklEP/6T
         7OgLG+BoqKQoeTcEjHBf8PskRyh/9slVlx2sDGeGaL6yU732pWgKfTML2G/aRs9gqNOe
         /lobnBHWm/4atUxkuD5p/5dLdS1rh1has6jRXf9hqpypXG17FAfLTMTmTmJZulu5Qjzj
         ioraIcSk5ZcJYcchXieGBR9bBzZY7BamsaVeDIUgjI+GdZt4x61/7amUVEdn5sjzXYr6
         Pubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715748764; x=1716353564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mrSwXoVqq+/2DYEvpPVjb0pEsc1j46P8FG1c7fjndug=;
        b=ZSy5mkjEDmdXdBQ2JsCTEP1WXvhYl82yBRiPNgboW6Q1rXG07Fyy61ZG3DzrEbEW8x
         3/IPqWfovhnsN/exSDQIbjREk7DykkStCx37A8Dsn6eitx4LhQ8aHkKugR9yISqAgWmE
         32Zc0iRXxyn9AVnBXkx303arUcLXQ+Nez04ifhVY4rHCtYD16W1k9FOXQk9OYJHZZt53
         V7ZfcuuZPyHItbvlxTbXEaEKkFf98MoWKMY3UTC31MidhAk5tcT4OwO5oE+A7Ifpyge0
         A3gHdUAkYPSChi7M1euQRFHdz2h9jVegyvjkLRtbKO12V56nrx9Wcaip37HrA/mjlByi
         EBiQ==
X-Gm-Message-State: AOJu0YyiXSrs47vzq2Jvy8p1CAIPLgBcujUnQxX/7nNrm08vj/VnrsTp
	fjMVW4jqaF0OWD5nsTvPd6IQC147tjYFukkSHopW/XGV136vXDcRzBggYHWW1HI=
X-Google-Smtp-Source: AGHT+IHhY7medMDp5omGt2f6yWLWkN6YEbtG/+AOAtQmJU+daxsryOOOQG6Os2MQmpqKPFdhB6vbNQ==
X-Received: by 2002:a05:6a00:1701:b0:6f4:b4a2:ab3b with SMTP id d2e1a72fcca58-6f4e0348597mr16852708b3a.24.1715748764558;
        Tue, 14 May 2024 21:52:44 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a827fdsm10135035b3a.60.2024.05.14.21.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 21:52:44 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 14/31] Staging: rtl8192e: Rename variable Decrypted
Date: Tue, 14 May 2024 21:52:11 -0700
Message-Id: <20240515045228.35928-15-tdavies@darkphysics.net>
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

Rename variable Decrypted to decrypted
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 drivers/staging/rtl8192e/rtllib_rx.c           | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index fdf8fc66939d..1901a319316b 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -1646,7 +1646,7 @@ bool rtl92e_get_rx_stats(struct net_device *dev, struct rtllib_rx_stats *stats,
 
 	stats->RxDrvInfoSize = pdesc->RxDrvInfoSize;
 	stats->RxBufShift = (pdesc->Shift) & 0x03;
-	stats->Decrypted = !pdesc->SWDec;
+	stats->decrypted = !pdesc->SWDec;
 
 	pDrvInfo = (struct rx_fwinfo *)(skb->data + stats->RxBufShift);
 
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 996662a06e3f..f69f4ca39fd5 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -481,7 +481,7 @@ struct rtllib_rx_stats {
 	u16 bHwError:1;
 	u16 bCRC:1;
 	u16 bICV:1;
-	u16 Decrypted:1;
+	u16 decrypted:1;
 	u32 time_stamp_low;
 	u32 time_stamp_high;
 
diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 4c8cfa40927c..3afce436a5d8 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1025,7 +1025,7 @@ static int rtllib_rx_decrypt(struct rtllib_device *ieee, struct sk_buff *skb,
 	sc = le16_to_cpu(hdr->seq_ctrl);
 	frag = WLAN_GET_SEQ_FRAG(sc);
 
-	if ((!rx_stats->Decrypted))
+	if ((!rx_stats->decrypted))
 		ieee->need_sw_enc = 1;
 	else
 		ieee->need_sw_enc = 0;
-- 
2.30.2

