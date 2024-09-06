Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3C713AA38
	for <linux-staging@lists.linux.dev>; Fri,  6 Sep 2024 14:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725631840; cv=none; b=UM1H++MeVoi7iVnoLB5L26koqF1qy9FWKYtBR46a0BM9iu8A4MKRCn3/4NNXagF03KqjI/SbE+65OqW/M9PnqtgBQNTM3LiH9IDLaN3X/s5F/A1mVJxs+DZTl5nRHAsuTIeZqMiRZzBogpOGwGiZSh9+nL1mnVJ24wup+FzXI/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725631840; c=relaxed/simple;
	bh=Jkg3+i0mTY4FdI4toZ9e/r/mwam+fDR7fNlJ60pKIDQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D1T5V57ieyFcG5UAWiSQ1l7d/7YgYJ3ghB1OvwFAVDRj/dW2j0PgNOSgDCUfZSoQxcDv1d6HdUJKdIdsuXNZ8iT2a5ZWkpkQ46OVVWQ/LjwkoyYUXzH9mqCIwIBVptTaDKshusGkzgK0OuPKcEGcOJrlCkFPmr9EQwHw8GaRDkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NouNAMGN; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NouNAMGN"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71829963767so116857b3a.1
        for <linux-staging@lists.linux.dev>; Fri, 06 Sep 2024 07:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725631838; x=1726236638; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tpwGePaDBp0uVaEd/rbAQsUfTJ3bw9Qu1GLMpYo60uQ=;
        b=NouNAMGNzhAiHGm21huBGoNyBVa3V7+OaePbZr5qygDtjswgz4nWOkVS1dNm8+cayv
         TAmhjvjtB7W55dnmV5ad0MCZnf/7CUzgS+Ppq+QNdnU5pE/Ga4WyNVYod9Ch0a86YJx7
         t2p83eTQzeSXJs79cX5/lujVgR/k+RQA4kEW7i5lbJQoxOox/DaL87gqpHZZHbLWQUOs
         3TVfqTL5HuIZa0ekhFUzB2lf2602X9itiksGOXH0sQ+ORbPRJiQRnEhQvABet30e6xoz
         R2ggSiR/WceQq9d1RfwdlM2JC8HiWWBbfy3Zc7UsGJCdv7vpNZ+PCV32zq4z5LPRLEpK
         59Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725631838; x=1726236638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tpwGePaDBp0uVaEd/rbAQsUfTJ3bw9Qu1GLMpYo60uQ=;
        b=J4QhvYGRO0ri5Rn5cLX35ulGcpo4MYmqCQhske1Eg6cQe2LqMdz2i0ZTe02ig3O0NA
         l3x+1rYlJlaSdNJEcUg+UrwjVRhSaHgBp0jhRtnlJSSWX4RPhlnAf1+WfiNGwoudIOyL
         OnxcHj98rHXsaecH4Wkpa04CwuPRi162yMA7tuHsfcPMqtnKLtZilFBhb8tUjMtyFGcY
         zsO9Umz0lMWVcrATyCLWTZp/EtefrwbwK5isugeQ2Gh2AiMkFf+I2EPmcZcebzeYFQDw
         Rbtn0AC/SIWEeG/PC/jNUO2P6bGSq6Qs7fpf4gjNuzu/QulBAZa732TU3t4rKb6Teu2W
         EKew==
X-Forwarded-Encrypted: i=1; AJvYcCXuXzXuCEg0mHoEJwarfa9PV8JJYxL50apMg4b61WpwbT42m90JUf2i3WwCBgkl8LOohHkqVPKLcQExdUCP@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0Mgw0PM9UZndh8VoRQD/bKisS08KBFcIvyA5GoXXB2OqQgJeA
	uFehPNfqszXB7xJ6y9uxIm3QF/+KgUDUQHVsNNTA3+MqSPTC7L7z
X-Google-Smtp-Source: AGHT+IHJQZY0Niird7SJgtEDlzL9MuvLmJBzy22Ncjys8umvt8oEcLcJzQ7d9ALDctEaLcf4kz+xmw==
X-Received: by 2002:a05:6a20:158b:b0:1c4:bb9f:c564 with SMTP id adf61e73a8af0-1cf1ceefa59mr1490912637.0.1725631838339;
        Fri, 06 Sep 2024 07:10:38 -0700 (PDT)
Received: from ubuntukernelserver.. ([49.236.212.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-718d6e78801sm1289976b3a.133.2024.09.06.07.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Sep 2024 07:10:38 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: include: Fix spelling mistake in rtw_xmit.h
Date: Fri,  6 Sep 2024 19:55:24 +0545
Message-Id: <20240906141024.10021-1-topofeverest8848@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes spelling mistake to increase code readability
and searching.

Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_xmit.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
index a3b4310caddf..544468f57692 100644
--- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
@@ -15,7 +15,7 @@
 
 #define XMITBUF_ALIGN_SZ 512
 
-/*  xmit extension buff defination */
+/*  xmit extension buff definition */
 #define MAX_XMIT_EXTBUF_SZ	(1536)
 #define NR_XMIT_EXTBUFF	(32)
 
-- 
2.34.1

