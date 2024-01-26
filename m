Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58595677F
	for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 22:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706308310; cv=none; b=UCORNbzIKFcVSBZcLOZds9YrPKqLUxGpXlRScwVqojzc3MMyyvRCsQpsReyQFiwwtZmLAiV0he1AjmG1u/OHA4WPIMABNlqwOddotZ27HSQ20aXn+Smm7EG2144DwnLdSI8zo/AHzm46DuXka8L+/CYKdsdW2xzSshAxiDZLgs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706308310; c=relaxed/simple;
	bh=d221A9DTsel1sj0jdwOENIOIP1uW0+yzlQJlionfmy8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G2zaRuNMkY0YtpAZCpibZAUh9XpSigYflEymvL9FWqxSYjFsxHcvX8XhWo2Ynq/0D0Ov7/dk3aHJQrIIxGDvNBRa5r0GM30mdNyrS6Eo1eX6RD4R8JrQr80+ntyoL8QiIaw2EZmiQVj7p2HLQYnpLWzlR8M5TtKlNIBResk3yJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=QUHZlYkp; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="QUHZlYkp"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1d74045c463so6871005ad.3
        for <linux-staging@lists.linux.dev>; Fri, 26 Jan 2024 14:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1706308307; x=1706913107; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Awp+sOMd2zTDY3BhxjyMABNSYZC/s1kfFh3Ae2mRiGM=;
        b=QUHZlYkpYsgJljsaAw0iqSX9YtVqfA+pumhQ0JQC8Cl+wOS69aESMlV8Ep9KqJjLZj
         njnkXQoxWdBu50m535PrfKrlbmCd7TxycpRWZELRcxieGsQaq8UQ6abnYR/YWVIn0kzN
         Gnw3VB0Tggsl5PC9I9vWOanZWnxudmFBsGVLzZPAFoCSYT455TP+n3xjWVCfhxdaXWwk
         SMLqmWTBssAJzifLdxPXdkWU8T9tymoTqSI3vPt0MyarIUffLUDle92EXmdEHdgsTlFL
         n3YQ/oE9eENyJ8nQ0kAf1bi4i0rQD1WCVx2YRn6S6cyt2K+JOAa7Fbi9EjYoOd7VOBiZ
         xIUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706308307; x=1706913107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Awp+sOMd2zTDY3BhxjyMABNSYZC/s1kfFh3Ae2mRiGM=;
        b=DxG3KnXCMv2wnFfxBX6z/opJ92VUuTPxxl5P9CznODKxnItbT0eIiLvga0CqsZSobl
         j1xXF3mHa7SbmKvbOGHXD4Y66zeFPKfgfPVt4s2mtAMdU+pdfnLqn+zYRGh13QwbKEYz
         QW2KSnwyTOqxT0yiu/n3I6HTeV+W4IF+XsX2/F/XkyBcoawpsEH90zK7QL3lHmYcDnvU
         +YK6V9AX3kAyql+OyNGUNCXfWzswUUdGXFYPiRw6FnXIfYa09AFKSoxORrH2TlswxO7h
         TWUWteTlngknezRnyN/Rc3PpgkSsZkWimIx3+dqfo6QsaNvH5ZcfQuZosi7aaBIVysnh
         X6cg==
X-Gm-Message-State: AOJu0YzCOmTDxakUfx9fw+uRinEDUhUadsn34BDezT1wtvoHMtjAaHdY
	Oi2/cmPfnkLHk8UFf0aeJ330ExXt0+xruZa1zjkaB1sDFdhVI39Oax1QzCeFSwg=
X-Google-Smtp-Source: AGHT+IHza2+Xz+W74yxBCYOqYs7ax1jHiGRhJAxELgNshUZ1N7dFgyadhuxJiaLjFulhdHjLnPwImg==
X-Received: by 2002:a17:902:c382:b0:1d7:126:5691 with SMTP id g2-20020a170902c38200b001d701265691mr436608plg.73.1706308307108;
        Fri, 26 Jan 2024 14:31:47 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id n1-20020a170902d0c100b001d8a8f431b7sm737909pln.300.2024.01.26.14.31.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 14:31:46 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v2 12/18] Staging: rtl8192e: Fixup if statement broken across multiple lines.
Date: Fri, 26 Jan 2024 14:31:00 -0800
Message-Id: <20240126223106.986093-13-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240126223106.986093-1-tdavies@darkphysics.net>
References: <20240126223106.986093-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Join broken lines across if statement to fix checkpatch warning:
Lines should not end with a '('

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
v2: No changes.
 drivers/staging/rtl8192e/rtllib_softmac.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 538689fb5580..ab41632def7a 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -1736,10 +1736,8 @@ rtllib_rx_deauth(struct rtllib_device *ieee, struct sk_buff *skb)
 		ieee->link_detect_info.busy_traffic = false;
 		rtllib_disassociate(ieee);
 		remove_peer_ts(ieee, header->addr2);
-		if (!(ieee->rtllib_ap_sec_type(ieee) &
-		    (SEC_ALG_CCMP | SEC_ALG_TKIP)))
-			schedule_delayed_work(
-				       &ieee->associate_procedure_wq, 5);
+		if (!(ieee->rtllib_ap_sec_type(ieee) & (SEC_ALG_CCMP | SEC_ALG_TKIP)))
+			schedule_delayed_work(&ieee->associate_procedure_wq, 5);
 	}
 	return 0;
 }
-- 
2.39.2

