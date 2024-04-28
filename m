Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9CB52F6D
	for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 23:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714345282; cv=none; b=XaaQ6fkPfWrDzXFHHTjbGnfM3seforo4y2vpiU4yRHfvM6YR72GPv5/gZ/FSzzqrPq5wUx646hbFIYp+9NLgLE9PCLEJKw2pr8uYMvtiZJLJgJmTBb+zgAsX0GE8ldEqCxct7tk1/vAWf4u/+eEQapjV6fLnu2Xds6WxghwIhGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714345282; c=relaxed/simple;
	bh=qQ/St9MRrbQlh6XGE4IiWOWataPu4BlfqsA8KBonyIo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OkU73vd7tXgIb5edA/j3JwMVlpI9rOKLG7oHbMDLTxGrZIogAdueOHVt5aAozea3p4mLv4qq6PiLPy5o95D2mBbCkCfd1NKfWLA4FVrAdOAcFJJ+ndwWPOHyIeiJ8BbaqjsD59LnaduSvkjd1ZK/lA2y5TnNNGpw4ymOas/Tq6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=GSAC4P0B; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="GSAC4P0B"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2a559928f46so2569894a91.0
        for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 16:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1714345280; x=1714950080; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S5O7LSPqO38x2yv5lso6jMT1krZ5OoXK26jYFy9ODQw=;
        b=GSAC4P0B/OmtRFWXM5XRTIFThXawFLT39Al9ZVYs2Ge1eg351evZxHDtrMc7pI0YoW
         RvCPjmp+COFH8CrW1o0B1wGjQZxis+oRGw/lWGh6CPfNF2WmLQ0JfA7gRv9LfGD8KVlS
         lJrPU8ffLnTIYzn+GaySA4IntTllmlVmtYaCyEnGCvXz5nKIRh2exuBOMUF2TWc68IEw
         a9rdcnW7ImzXIoLSbDouzX3jGz6z6NPYPx2Qlhn+Om69JBGdgic8c9uwfGRB9ouwliR9
         AAz5wGsxA7nauLp6mvOH909WU86oHJjwbWVy8Lh1Oza93Mee4gP0kbyu8ogoiYbCNwoN
         7d9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714345280; x=1714950080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S5O7LSPqO38x2yv5lso6jMT1krZ5OoXK26jYFy9ODQw=;
        b=s8WWd/FM3Djx09C6+ZGiTZXeCC/q/PEoLt3eCdethGpvsgZtTkL6Vh2DTVOOQANjHR
         NgKK6a/1H4iV8XDmxAlZJeeHM/6IwvcExVGw/Tt4EUGklyIX5jcHrvQ+0HV4K2UXGfIt
         bneVqMhUWNH/FHwGdFV/OvZArcB06P690aDdVssp7mhqIUA/fSy8aJSNUBZliHfaasm1
         s4vUYYCLu9RO8OZEriM2peb3ZxONq1SCwd2Mp+YZ3HHtGJLtibuhq4dIdoDbpZeqwGsK
         ut+BzaW+q3pyA9lilOxB3Y249hKoS4j8AW0lGIBXyJFg+Tf/RzKloGDpyv90hSv88v8/
         PdgA==
X-Gm-Message-State: AOJu0YzWB97ZgxhBjQZFHiXQySuZD47CgHwwykJnZJ68L05Mjs4ym5z5
	96fMEoqjsp5xovu3yEmHXzv8RbaGNfJUUUr0QZ5Huh8yogAKPtYaos+sZKtOsDk=
X-Google-Smtp-Source: AGHT+IE19aETjg/TUkXMV9BW0joAUugxtoa/9FmjHpAkcgbl4skRlfGuH+B4ItWRJsYj7gzaAisRjw==
X-Received: by 2002:a17:90a:de93:b0:2a2:f25c:c250 with SMTP id n19-20020a17090ade9300b002a2f25cc250mr8624814pjv.11.1714345280503;
        Sun, 28 Apr 2024 16:01:20 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id o16-20020a17090aac1000b002a27132ac02sm17860864pjq.2.2024.04.28.16.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 16:01:20 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 17/18] Staging: rtl8192e: Rename variable ExtHTCapInfo
Date: Sun, 28 Apr 2024 16:01:05 -0700
Message-Id: <20240428230106.6548-18-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240428230106.6548-1-tdavies@darkphysics.net>
References: <20240428230106.6548-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable ExtHTCapInfo to ext_ht_cap_info
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     | 2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index 5cea0d8ee544..c1446081956d 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -45,7 +45,7 @@ struct ht_capab_ele {
 
 	u8	MCS[16];
 
-	u16	ExtHTCapInfo;
+	u16	ext_ht_cap_info;
 
 	u8	TxBFCap[4];
 
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 85f52d09304d..963d69680049 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -283,7 +283,7 @@ void ht_construct_capability_element(struct rtllib_device *ieee, u8 *pos_ht_cap,
 	}
 
 	memcpy(cap_ele->MCS, ieee->reg_dot11ht_oper_rate_set, 16);
-	memset(&cap_ele->ExtHTCapInfo, 0, 2);
+	memset(&cap_ele->ext_ht_cap_info, 0, 2);
 	memset(cap_ele->TxBFCap, 0, 4);
 
 	cap_ele->ASCap = 0;
-- 
2.30.2

