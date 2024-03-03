Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8471F1EF12
	for <linux-staging@lists.linux.dev>; Sun,  3 Mar 2024 17:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709487831; cv=none; b=XHNq/mUrM981NIIu/J1I+5DEWqi5FNvqJmSbkaI6COJkv78OudxFA9JILTpQBIz3qEuWvUar47huA2qm2wbV/HolBbecfA+WL2rEGfb88/Ti+PGtEeFY3qwK8EMMmws2rqedKJ0ISdR7pnvMFqJHtItrFkKUj4xv2xcUpLaRTZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709487831; c=relaxed/simple;
	bh=L6AN0E4vGHx9xbJg/hV9yVtcPtwHBRAxegj9VErPY1U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jHgoVBK7OgZwo9B6bRRiuHxCfnIMR7zmbmMOLcj9kerQMSmRacKoST9LokuK8jfI69/euKt81brXrNElFtcSSWGPziHK9fYvfJ2i5BtOMu2FB0hs6Bh5VpXdYC2510r/bupSGvlYPn0dBiHv+TZf3UdwAaKWv5Cz73PscEEn11I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ji677C2G; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ji677C2G"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-564647bcdbfso4410571a12.2
        for <linux-staging@lists.linux.dev>; Sun, 03 Mar 2024 09:43:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709487828; x=1710092628; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kEhyV4w+BuKmLXD3XNkF6phhykSHbp1w6rk3DbPRezw=;
        b=Ji677C2GuJYmDIePXu0mUGMo58o8tPv8ZUfD4IgRkSt4ENPtuQPSf6jmxHNdP/F/M9
         0YlW0aGkjDQzqU1dbr1MUKz8Rozb3JhXHdlIsPqWH1Bapyx+qlmBJUyHvHeu7LHXGBXI
         Hmy+lLhu1aNAA0vhWFjHshCdyjE5y0v4Z2XsKMwBSqXQEl48o24Mb+ffcYVwkN8lGMXg
         fPe137gDc0TZstsl9q1uVh//KqaUuSh/whTND/N59bV9Afp4OAUVrTarK7rZIGIRhdMK
         +AITCNA/S9Ggn3b0NDU5AqS/5+jydnZ8FQmFjSR9r3b0lJKFSSHG64ggUmygiT2Hr3FE
         P15w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709487828; x=1710092628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kEhyV4w+BuKmLXD3XNkF6phhykSHbp1w6rk3DbPRezw=;
        b=UwlT5NJFN82HeESG1M5RVw+N9kHnfoBrEjHIEtaslTy3IHFmq/7MUNChUu9luhk1Re
         fIVZwq1hf04MTrUCrsxMGTIp+gpxkhXa9eFVLitR5S8bimqPX6iAhQSmoyRnF5nlx1mP
         NKx+Lm+Vyqk+pNT9a1AYWresGFGpXY0XmzGDFOHm8rtpLczuHGIty4G+c0JVumteG7iX
         piq1V2hrBKpPKHuilobmzcnTYEtOmwpFcaC6SfS8Hz4jnIXiDsFzUiNY3zNxFa48Zviz
         oqx2Xguhaj4X3Fmichq7i4XN86maZi0Z3A4Cx0oIfnJK9dbK0jYlUNkUo2VZHxUXqB/2
         xHIw==
X-Forwarded-Encrypted: i=1; AJvYcCVtbMuxS7zVMup2AEBnj4aBfs3bkVh/CJJG0MJGmtx1bISaDvsx/AzNXHXcsqyi6zl3R2YoNwQuVmem7jwzYBt161d54JruYHhS26X6wg==
X-Gm-Message-State: AOJu0Yz1ont1LCpozbi8px/KGhg0GB3JH7+VfYy7us7Z+AiWCTSRYzQd
	WyGSgvHkII8LgX6mtPZ7ttGT/dtCWArrZxhEHlJj0fatMTypJtzq
X-Google-Smtp-Source: AGHT+IHCP/OldVzFqVTBh06Axr4D3Rsc3Fbf/WP4fo/eMnxk7nkaEqPUgqLeGanSo9YBgWBPfFKpKQ==
X-Received: by 2002:a17:906:3941:b0:a3f:ce8:1234 with SMTP id g1-20020a170906394100b00a3f0ce81234mr4795521eje.68.1709487827537;
        Sun, 03 Mar 2024 09:43:47 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id yk1-20020a17090770c100b00a42f4678c95sm3884384ejb.59.2024.03.03.09.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 09:43:47 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: forest@alittletooquiet.net,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	inux-kernel@vger.kernel.org
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH] staging: vt6655: Match parenthesis alignment
Date: Sun,  3 Mar 2024 07:10:56 +0000
Message-Id: <20240303071056.12799-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct parameter alignment in bool card_update_tsf()

This patch aligns the parameters with the opening parenthesis for better
readability and adherence to coding style guidelines.

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
 drivers/staging/vt6655/card.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vt6655/card.c b/drivers/staging/vt6655/card.c
index 77662056c52c..2fb2b1da9136 100644
--- a/drivers/staging/vt6655/card.c
+++ b/drivers/staging/vt6655/card.c
@@ -288,7 +288,7 @@ bool card_set_phy_parameter(struct vnt_private *priv, u8 bb_type)
  * Return Value: none
  */
 bool card_update_tsf(struct vnt_private *priv, unsigned char rx_rate,
-		    u64 bss_timestamp)
+		     u64 bss_timestamp)
 {
 	u64 local_tsf;
 	u64 tsf_offset = 0;
-- 
2.25.1

