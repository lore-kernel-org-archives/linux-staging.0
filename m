Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0BD1EB2C
	for <linux-staging@lists.linux.dev>; Sun,  3 Mar 2024 18:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709490738; cv=none; b=F2zM0DmotihEFtmXmEEFhGGYT0s2ltbdtEV6NDm5s6+ohih/v4APsJ2iwqVt/bfvp03ZtJGBrxejs5Dnu0liIhWwBKSVPDcTlhux3mJ6x0tE8O1XvT86BeZHtVfLZHYmhRDNQq5+XHJTr/dAI/nVEG5eGL6bwWZrVI6/2P8Ra34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709490738; c=relaxed/simple;
	bh=JbcHgxSVM3+rrRr/K0MLYJgiuOZURxq2+IRsXZH/yfI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OQ6/AbiatMte7rxfurRDFjrnqst5A+2xLM1KAZZJC4wnxloIYcQthwV72QUTxYsFqo02BWbxv1gHnBcHylbYcH/lDaRjKgt7//WIF3airt1MTeTU1W4VHuGyiqVh9wtDgGNzA+4LzCRq3P6s36PNMM4gmI7xQCiY61fPph3CIFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVM4K6ml; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVM4K6ml"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a4499ef8b5aso217697066b.0
        for <linux-staging@lists.linux.dev>; Sun, 03 Mar 2024 10:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709490735; x=1710095535; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H494abnvL8/eshjC7Zcxu6U9tFRdL/mSRfEIdabXX8M=;
        b=TVM4K6mlMM5F1wDupH5ctbbGJV9s5AZCvuC6W7X3rNbu65lp/POlzzK8LwU9MAZJTy
         MYaWxXjWEkkAbymxfzXGDgKq5knW8z541vwD02Km3OanRTK7NMDv/5bkdegGmbW2JAcf
         9P0JDYyl64GEOd5Ydd6M17WKfqxp/QMH1TAlLDJZRJwLl2ZXCwOjOXZGGzpyo/2P9R5u
         oEejfi0rCLW3f+AHiYwFf6pcRAvNw1KXosazZzDjU3RlmsgVB+Nm9ra4YDlTg48cwfAw
         moxQg0JMT1cLTV6Ky0jS8gUP2IO6QtOIyfz6qSG1W0IB6/UNVTk9BcOjkXzLgCTn8EFd
         NupA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709490735; x=1710095535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H494abnvL8/eshjC7Zcxu6U9tFRdL/mSRfEIdabXX8M=;
        b=QnXCgV2aoi3MY8Sc2K70K8VGMezvEKJPdB3l6xPBBSK99wkF8Pm/z0wnWv01+XKlI3
         1rBOpTjGW0gkT4oSxuvVtV59cVODgzbf5ZsULfbTJOjioAuq1kr5Ke5v+zkNoEEQglEi
         cXBhqV/bCEcQXhaxU6yAH2Oq4Pk4rEwF+KTMqfxzABWfWL8MndVTAoVx1j+VuF/SkwZw
         BOWK9aXAVlZjRqmtRIBXWuU3cnoTXZLb7Kg+Gb9Y3P/1HyvvMAhzVEUvAGt6sGQO62os
         vQwW441G7F5YqkHKT4tUe7odDdFvlLS5jwGhHDAiB1jePyJZ/Xoxml5+qGgj++hP5qAy
         NBHg==
X-Forwarded-Encrypted: i=1; AJvYcCWSkqIl2pOf3NxZfbkOPIZ6f1c31jt+tCGXT9mZ/C2PHy7L+7ec61+Z50bd5VlukRr11PQjsvtDh85d4Bqcgvj0JC+EcwH5MafIkHZ14g==
X-Gm-Message-State: AOJu0YxTXi22OVbMoytcfJ3JcHATMYGkDYiLufdDnWokhc7WnaXMn1H7
	mFw6o1/bk+juQw2kmuJaBjZyRKlp5AqHBHeA2T+Wm80ytrf9tAPxnsEmvP8LP5qFCQ==
X-Google-Smtp-Source: AGHT+IGg5n54SA0JT5JrlI/0i9+rnOOB8Gph4WkE1PnXGrUSNJlZnYeECWzZgNzjtrayO3QuYT/x4Q==
X-Received: by 2002:a17:906:80d3:b0:a45:1321:b450 with SMTP id a19-20020a17090680d300b00a451321b450mr1541595ejx.33.1709490734851;
        Sun, 03 Mar 2024 10:32:14 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id vo10-20020a170907a80a00b00a3d9a94b13fsm3922043ejc.136.2024.03.03.10.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 10:32:14 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH] staging: vt6655: Match parenthesis alignment
Date: Sun,  3 Mar 2024 07:59:36 +0000
Message-Id: <20240303075936.16296-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct parameter alignment in bool card_set_beacon_period().

This patch aligns the beacon_interval parameter with the opening parenthesis.
This change improves code readability and maintains consistency with coding
style guidelines.

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
 drivers/staging/vt6655/card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 94784b5c0402..3f807d898607 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -321,7 +321,7 @@ bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,
  * Return Value: true if succeed; otherwise false
  */
 bool card_set_beacon_period(struct vnt_private *priv,
-			  unsigned short beacon_interval)
+			    unsigned short beacon_interval)
 {
 	u64 next_tbtt;
 
-- 
2.25.1

