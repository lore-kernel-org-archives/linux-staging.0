Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D00334C1F
	for <linux-staging@lists.linux.dev>; Sun, 24 May 2026 09:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779616800; cv=none; b=aGfP9JelCjjcykeg77+yP2kzXhI+JCy6b+BdYRfHKfxYKSUVoh/d80KoHZ31v53mWtWu5RwORLqPqlcbPn7AZ5jp+Rbdcu9PX9OaP5iarjyBvEST3ENiOriq1bZyFl3ejhYrhbrMDWMMgMtAA01muU6JnB1zp3YD+cLa6TxQJxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779616800; c=relaxed/simple;
	bh=OQIwJ4K2Eou5bl8rsdkYChQqYTrB7BTw6Gv3SqdesE8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YNIPECByUfVL3moJ5Jkw0mXhtrHsxYr7ZqWKs83wLDkDOpxRveDxxTA+HRQjCvWx7IU4Ia46iVIXRy2db6Z1w+5Dz/0U+XDvylxgxo4DeJvW47n63/USldlhQNqOXnsxM0WrteNstpGLthzxCvgYcHm8WoyE8g1yK2MMNgvjw90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HHU8FhFV; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HHU8FhFV"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2ba3e3c4f87so90766185ad.3
        for <linux-staging@lists.linux.dev>; Sun, 24 May 2026 02:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779616798; x=1780221598; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3e/PdFlcNwYZsGHYrND6SmzgLRhxVfs+0SDnDk7j+7Y=;
        b=HHU8FhFVSp7DeQ/Qijpx5rWSDWb+aAXEjEIG8sG8lfp8VkBsiz7GI+NY+yY7ddZO7E
         xahzX+4/a9Cn2w9OfeBYkrgYHu6QTqb/LiQFWT/U9HChoApLo95htkLewGmOrD4Rhjej
         sGOeQYa32Bhk8gTdFzOPFnN7EIFq+XmwHYYT0h1nvJp18AajWe4yvdw6EgxmG3iNz3Aa
         ec8zwSZK4TSTmiarwsCav+15SJe4HLE49TsC+7NwabUSE0BXOg3FJJJ0Pe586AMGUWho
         RivF7p+cGPtf3U/pPP+RPdq/unozUKn5hPR1Utu7yteoSRGFVIOVur2rYZ6gpzaumfj/
         XhOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779616798; x=1780221598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3e/PdFlcNwYZsGHYrND6SmzgLRhxVfs+0SDnDk7j+7Y=;
        b=Ul027gy4GNDDOKJ181asGjbSmgE/72qYhSphzDvMEidACRiZK0Dup9q2SotXo0SS3i
         0u9Npo3gYAvcJYgBqgK8SvKISBv4Hg9BMtVU+XdnJQTnKNDokWSCOdmkkzUDbSNb2hjM
         y9yPhzO3x3C2y6+HzmdewnAjrZBoK+sM+6W3Lz1vDjVENfHNzGHfH+QMCx3n61JQzyOz
         kU5Q3T1jyihTR2h+mHscOTao3AGIyzN3PYFIAkNVre6nMzwXXPxvvbf9leJeOwlq5r71
         fSklo6JQhlI7tWYnbqlSn4ixXjJ/SyLN6OfVeIteU12O2pIwIaVqKd37H9YjLFS4qa6n
         eDPQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Q0cOGBm8DDrc9AAlmEFdHvk890dwFqcjVeOcTp6AumZ5TQUpG0LMWX5nLQamBGV15jfaFl4WHAs23BzdO@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+2kUrnfRVQwC2hrP0FFAw96q/fNYmo5MMnl7bfSNAt5g72Csk
	Plgg51UFU69kUe1dVO5JqLCzH0V5i/rgsvUKfMQZ+GqzX0yj2veVvvk1
X-Gm-Gg: Acq92OFJbP2FRFokD6NqFDHC0BEbwY0mWoNFxmy3u3rWkC3RmLtnqEF7VS/94kpbyMA
	du1B4cR2eaCg1hQlkvxnd6aAX9N8MY1f+XCiKUUU50BuLCLAYiD+Yw8u7308lzKJXkhQv3wRPRI
	rWcE+imHJdlhdBY9DgJV/3qHSwdRD3MraL/IfE+YuvnhTfxF5CgKTuP25LD6LBKwF5fcZ0P4czf
	fQPy91TZSz42zOuBccoHyWVcKsa85kfeafT0SMjqdC1ZF7nvjPqQaUA6gMwqPH8CU5uHTLUgDKK
	3fdh7l9DIWlLmQyOLtZR7G5iArr0n+DCfRB3VLm1AjVDZvcoTs5USUWQWwC8I6RFFO7zH5WQgBe
	qSA5TTJPGkykqk31AjXolQ1L1lJOEcDHZhGlgKQlKMtUgidrwGSziR+uRDa1ZoyrK9wQNpms6TC
	lsPzXfBxwHwr2f1K+Yyg2WHAcc7gTQHm0tDNmOxhG3lPZ9sqr5Vg==
X-Received: by 2002:a17:903:24c:b0:2b9:fb0b:b727 with SMTP id d9443c01a7336-2beb0675f69mr108762415ad.39.1779616798410;
        Sun, 24 May 2026 02:59:58 -0700 (PDT)
Received: from fedora ([49.37.171.99])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb569592dsm64033365ad.16.2026.05.24.02.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 02:59:58 -0700 (PDT)
From: Praveen Jayaprakash Pattar <praveen.pattar2022@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ethantidmore06@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Praveen Jayaprakash Pattar <praveen.pattar2022@gmail.com>
Subject: [PATCH] staging: rtl8723bs: hal: Fix block comment style in hal_com_phycfg.c
Date: Sun, 24 May 2026 15:29:49 +0530
Message-ID: <20260524095949.20819-1-praveen.pattar2022@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix improper block comment alignment where '*' on each line had two
spaces instead of one before it. Kernel coding style requires a single
space before '*' on each line of a block comment to align with the
opening '/*'.

Detected by checkpatch.pl with --strict flag.

Signed-off-by: Praveen Jayaprakash Pattar <praveen.pattar2022@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index bdd595a99b98..9f513eb92ff8 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -407,9 +407,9 @@ struct adapter *padapter
 }
 
 /*
-  * This function must be called if the value in the PHY_REG_PG.txt(or header)
-  * is exact dBm values
-  */
+ * This function must be called if the value in the PHY_REG_PG.txt(or header)
+ * is exact dBm values
+ */
 void PHY_TxPowerByRateConfiguration(struct adapter *padapter)
 {
 	phy_StoreTxPowerByRateBase(padapter);
-- 
2.54.0

