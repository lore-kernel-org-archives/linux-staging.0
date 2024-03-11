Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975606FAE;
	Mon, 11 Mar 2024 01:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710122189; cv=none; b=gZVxkppRu47yF82fMAqlVTxa/8P+2b/r8wVbfdsmFqAEtkM3jtP9zcRTj1PI29sLFjThKeJaSokOFuCc48CbJlLj71Q7VYKcUSB98XS3vOPScabR/kBVvVkntmZ4gVA1o12lWgTxerv6MgQy1WydgxRbIhmJlaRYrFNUTHlOJb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710122189; c=relaxed/simple;
	bh=AKbql7NWHu5Bs+y6Mdd89AOegrRa1LqYkWl8NzZ4eM8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CXXihPrwDeB8rK4IfQtE/xbtWaSy5Flaqugxm0hMaQALYwkss/OLEKrBH6s1WsQkmqCePpts/kmt6pAcHapOW2fwbCh1NR+xNXz7kbtNeSyHWzLEDRFJJqI9t+kJPchKJTPidUSj/k9pAVna0LYeopG4D0uoIZLhCBoWrYONaYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jsuxd+0d; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jsuxd+0d"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5684073ab38so1902905a12.0;
        Sun, 10 Mar 2024 18:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710122186; x=1710726986; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+bTuT4GcJV2bUJtvfsu8qE4hyL4wZKq/zdnYwHzw0BY=;
        b=Jsuxd+0d4EMuL2b4nQ32iCbj4YJzfbwbTdYJdvSN0JYLrD0VmK27bLAfwXKmZbFEYp
         V+sGjCLH46ib1rtXS8U8U897ynyKT21xbqIYNDqEH6TxShcgg/nDuWirdxrLGelm+UZh
         5PptL0aO0wqPCN1z4JXlyCxtm0wySQSld7+3Nz6xGl8HyoFrBocfQ+lPaiG6SOA8g+Ng
         dFurXeoX/Gcl5xP8kXVpry1PgNQMuvFygsG8WuZVatFwcmguOnK3MTWcADuKmV7r2cwF
         M4XkIzo+OE685CUvtzkEwFclJAQovi32aVFYJnNoyrVgeM1bf/NN0eVaRrQIuCrwWye3
         RnTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710122186; x=1710726986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+bTuT4GcJV2bUJtvfsu8qE4hyL4wZKq/zdnYwHzw0BY=;
        b=uj7NiacMKpOM8QoUt86BjfTUjkslstUNkeu95dWwUVfTqHNLXRSEAwAYcL5YWSeAin
         iTiMU8mfYz2q2WVqBFr7uUbvPQEhHWkwYrHU57YrtFXbjek4XvPd+afaUi6usQETiECD
         tekgD61key+LpETIGUjub7AJRRaLqaFDwRFQf14z7wbIgoKqOsPoUCpUAsiMgfAYHFG9
         RCEw7NCLpdMjMBTJR6M9uY6RQzBKHLFEk/D0qeDffiaMDybP3yE7nmGVo9Y4GS4Uz3b1
         VWi0CsodoxVb88VGo1IAmce+KTW9oi33lFC2hYnU8nBK/b2jYRA7YgtPicmZzekom3jy
         rxAA==
X-Forwarded-Encrypted: i=1; AJvYcCURICVFD1bkXHIkEsMVLRizbnx2qaeA809/36FVPbLCN2GpYi6/k3DdSXTTdXc5pWmd9ZYOCEcjaC0+fV096L8ubEIpXf1biBUSTAtnvXNDI/UZbYzyBtHnPNvEZ6S0mhTY0F4zf+atWQ==
X-Gm-Message-State: AOJu0Yw2leXX/Jzqvs9Tk5pEvLRsnM4yArCC7QO6Xm90LGnCXr4pACXc
	6TUme8+19L0fVp6dO5Tfd1Z+g88MapaTFaW5mmA2ZWNL5JFoL7i6
X-Google-Smtp-Source: AGHT+IEcer20D/cDxl+Wy7ns2CNOoy8r4t3FpiSBER13iS5fSTJVsmzyBsM0hzi6cl80uxpUJI6RZw==
X-Received: by 2002:a50:999d:0:b0:566:abbd:c390 with SMTP id m29-20020a50999d000000b00566abbdc390mr5263075edb.6.1710122185799;
        Sun, 10 Mar 2024 18:56:25 -0700 (PDT)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id cf12-20020a0564020b8c00b005664afd1185sm2406279edb.17.2024.03.10.18.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Mar 2024 18:56:25 -0700 (PDT)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev,
	philipp.g.hortmann@gmail.com
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH] staging: vt6655: Remove unused function from rf.h RFbAL7230SelectChannelPostProcess
Date: Mon, 11 Mar 2024 01:56:01 +0000
Message-Id: <20240311015601.17428-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove RFbAL7230SelectChannelPostProcess as it is dead code.

This patch removes the dead code to improve code cleanliness and reduce
unnecessary complexity in the driver.

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
 drivers/staging/vt6655/rf.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/vt6655/rf.h b/drivers/staging/vt6655/rf.h
index 057860a5e100..3427341e581f 100644
--- a/drivers/staging/vt6655/rf.h
+++ b/drivers/staging/vt6655/rf.h
@@ -68,9 +68,5 @@ bool RFbRawSetPower(struct vnt_private *priv, unsigned char byPwr,
 void RFvRSSITodBm(struct vnt_private *priv, unsigned char byCurrRSSI,
 		  long *pldBm);

-/* {{ RobertYu: 20050104 */
-bool RFbAL7230SelectChannelPostProcess(struct vnt_private *priv, u16 byOldChannel,
-				       u16 byNewChannel);
-/* }} RobertYu */

 #endif /* __RF_H__ */
--
2.25.1

