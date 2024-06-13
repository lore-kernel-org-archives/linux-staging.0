Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99D113A24B
	for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 20:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718309789; cv=none; b=A1QDv39bXML3KqaSRJ1AOhI3oHxmyasMqx29ah953SJ3dQyDlFK/bia6TvHvQF9uubgZB7A9IzpNPJzo3pYeb0FK9c2irREofxUcIoRfkmXbEkLK42WK8OwDnQu0p8W8WT1bL3zTjySYQs7fVmWXosru5xzoAP8x7To88GXWizc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718309789; c=relaxed/simple;
	bh=viq19hhLwhgCawmtWkzUKxe8/CYDTKmX+TRGv9BSlT4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S8KVK91j7SSLv0rx2UCDqy2LO+wNh72MbtnICsTY2SvYrpYDr5+I4T90JeULkzjKEnI7hKBtVS3TZNJDeGIPvHY1EP6FlR2uisNYQvvnI5l5h5HxE8aE4lqtSiDjLPpSQH9YdI+yXOe/b6/g8WQmoedBJGPJuygNBMA6AQiF4NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C0oAaXGP; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C0oAaXGP"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4218008c613so11649865e9.2
        for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 13:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718309786; x=1718914586; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4BpMyOlWJiT/+4vsN8G1skGb7QkBQSrOKk0zqDdotM=;
        b=C0oAaXGPRhEi0mGI4OYSAb4WkTHfnFGXf4IwoAhl8J7NbnRCUdWxLFy6TTpo0adg70
         zC8jrwtTmMoXfd6QsshE9+N8r1XQG/7PrnjV8C8ptdgw7bqjfz89iWn2ur3VKDl/ibyc
         sgyGGT3kugCdUwCOqd963uoIHfZdg1l7lDl2/OJQIfGF3ervQ5H18050R26H24nzdkHq
         I8Sl1rlEG3Mxe8AZMsdTd5fCyUe0oIhRYclVfJ6kPoeVfdfMMXev3C0S128tcTvFGaqM
         KfrBNASWnOqDs1PrqjRwNVLutPUicRqByxlkQdoBkZNT2ZBjkjYvsEz4qyPP9fkUgtV/
         EUVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718309786; x=1718914586;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e4BpMyOlWJiT/+4vsN8G1skGb7QkBQSrOKk0zqDdotM=;
        b=qa9knnkBkIaRmpG5Baqzl/ey95PlMhOhnj1XIpkdfsSQuXdas7SDn4MNVe0tngjic4
         n6B2Ya8Qd63LuT6yeSxfOZEgXKbXLA0I+++bM8qSLlYiBusreRDNK1p4ZdasbFW9p+Vb
         E2Y7xDOzgdf80Gzdi5UwAfQAHnmn6lUHxSmti8DCxrUBicBwYkmyifGAw0EfsrXmR/Fe
         UzJJYv+/6Qp9ikQh1qhPzDEx98E8szw1dyugQmzSJBsDbKTRhcpIsH2fLATOiKFzhQjl
         GG6l6tBB5TKGlbb6h2ilWICeXF6Lji63pVVRYoxsP8C2HDeuGT02NI5FOgyRUFljruOE
         nzNA==
X-Forwarded-Encrypted: i=1; AJvYcCWRNnhgZVbe18SFc8stQBNnjnnQtx37+K1CoHspvjqMsQ2/ge+QTKj9dnE9qcz9tfowB1nOcTs5vrNQACntAxUIGPCzrbrTjH13QfDnjg==
X-Gm-Message-State: AOJu0YzmSsaR1EWVACLs3x7Rm82GemN9ldwht+bYo0CesULEZmJm7//3
	Bze25XW+2ke4H5LHKlzhB8SeFkNhXP6Eg7MKjgGGsAvFnEgA2G0fJARzp3chjzs=
X-Google-Smtp-Source: AGHT+IEfZkHaUm8w5/W/JDiY44eGJXmWO4V+N6Yz80XCAZ8giPgNP5uPGmxrNceLtJs0hPoiG3YBJQ==
X-Received: by 2002:a05:600c:4f84:b0:422:683b:df34 with SMTP id 5b1f17b1804b1-4230484eed9mr6907895e9.28.1718309785690;
        Thu, 13 Jun 2024 13:16:25 -0700 (PDT)
Received: from localhost.localdomain ([31.120.167.14])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874de618sm73817195e9.37.2024.06.13.13.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 13:16:24 -0700 (PDT)
From: Teddy Engel <engel.teddy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Teddy Engel <engel.teddy@gmail.com>
Subject: [PATCH v2 2/5] staging: rtl8192e: Remove unused struct phy_ofdm_rx_status_rxsc
Date: Thu, 13 Jun 2024 21:15:08 +0100
Message-Id: <ef5ffc1063323f6c1f22ab75f3b5ff01982c3061.1718309120.git.engel.teddy@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1718309120.git.engel.teddy@gmail.com>
References: <cover.1718309120.git.engel.teddy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused struct declaration.

Signed-off-by: Teddy Engel <engel.teddy@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8190P_def.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h b/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
index 486397d7db84..d87bace0a19b 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
+++ b/drivers/staging/rtl8192e/rtl8192e/r8190P_def.h
@@ -136,13 +136,6 @@ struct tx_fwinfo_8190pci {
 	u32			PacketID:13;
 };
 
-struct phy_ofdm_rx_status_rxsc_sgien_exintfflag {
-	u8			reserved:4;
-	u8			rxsc:2;
-	u8			sgi_en:1;
-	u8			ex_intf_flag:1;
-};
-
 struct phy_sts_ofdm_819xpci {
 	u8	trsw_gain_X[4];
 	u8	pwdb_all;
-- 
2.39.2

