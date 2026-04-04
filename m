Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130321A3157
	for <linux-staging@lists.linux.dev>; Sat,  4 Apr 2026 23:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775346944; cv=none; b=ngfxXFsDBu+ova0tPXBQdFzSA+JamdRfzyjVpy/AZZ41FckJv0XCiGv7fFojX8HSOJTWeEmE2nmeUReKSsqxznO3tanbMlDTeJ6tJFlqgRW5CIjPGylE+bdVx+A9XfVSr4+FYg0VfcqazZVzPI88DQS/LXXGI3Tix8LCJh6Xvbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775346944; c=relaxed/simple;
	bh=EyUYcp2qyvrkMNQ5gO1OaVokxM7EP/0buscgSwGAgTo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LH0HY3xzlJ1LE+CUbik8nIBJtdsMFhPQuMHeG0VbfLFB145/BIWamAsXyKPWUm4UN6uqpkHioRV9AzKAEEOoM0ZaYPXY2Aj2MF5wv0pPAFbjK6yG74O2x8P7m+1NUSqslGRELlA9HSungqnmkWpAKycNSqS9jSl8C8uSrgPhXi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kx0WQv6C; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kx0WQv6C"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-6055a0414d7so921286137.2
        for <linux-staging@lists.linux.dev>; Sat, 04 Apr 2026 16:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775346941; x=1775951741; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2lcWK2ZmstYCPUTW7q2PYzGVzcHD7v4lIlVs5LsX4CQ=;
        b=Kx0WQv6CgZ+fj/912DhM406yjRxywOdOZ0AenJKxGg9tdp4Ny0xOhmwcN1tJL2PYq+
         Fo4+MAo4lRnO8pcmAxjMco+QWoAGOBTbyERGYBzGI2k4vyMdq6/ClPWMOFBBqWi4dlPI
         N3zbAYUWlvEOxfKYoIkiuhatwcixw5q2XFwZeT3pERTwfb8DRdPR8iAhRssf8a0eCnvq
         ZbjuD5pJSogeUrZPYMO9kFCkYA4AqLgpQsdLr9XmEkWHtKwq0nt6gC7tmGvrQWzleIWt
         Kj/REnldrW34QMXgxcg6h7+YTEaFymbjlppb4+zNAl8XS+UHiGipyC02G7dAppvcLTSX
         ZSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775346941; x=1775951741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2lcWK2ZmstYCPUTW7q2PYzGVzcHD7v4lIlVs5LsX4CQ=;
        b=OkqQXjCwZkZXX1icmBFSeqCEnk2r7BbT9ZpBh2B31hDTSAPxCjjzeZB751fXQcjcYL
         YW99SO1O9LivazXzOza72+l8ndxxxst/qNKmJozxeAuicD7te//woGTGqni39mp7jcGa
         WNMglxy9+15NUs2LXaZIzUolH0mLTG0Cd0c2f1awWuc/RABYmqe1LfrrMiMvSHHnET6m
         8QQdLm22kAAOfEa20CsNn7uRfXqkEMqw9YSX9FPzMl0nztWtXHlPiA4GMxZaripm9OkH
         rwYIOzQJY9sXq4TXx1RAoLFzHEQSCzcRL25saM/QuIRAV5PSC0TVjmQt9ytgqRnA3LgN
         0hgA==
X-Gm-Message-State: AOJu0YyjW1GkAl8MMqVc5I2KHRlcEf2Yaj78ZuHJdBzd/HuUchjdr9s9
	/LrAoh3NIk2o0g9w13CgL+R4UPsVadhOWT/FDILuxBpWLOn7joIB4U25iskM4DGm
X-Gm-Gg: AeBDieu2fIKCDXqIti2b+RmVgSy/RKqizk0Ibs0uShLMVQq02H0SC/Ut+xro1+m2Oy+
	fL8soHYA1ILNT7TaXB27tQx5mLMThYZwM20WkndGdPv8uc0X2lbQBqJ7F4jdlOP6xGO2eFibk1K
	nBc7F2e3y8FlDJZyyn0r47kaf+bpuH4gdvHST8w5ti6Li2mcTcPDqN6YcD3nU1HLNbeJAmB/HbA
	VGone+c1fWC8tNAKNcX/TEAwAWAMRf+PLkR7yg2NSO+S5xFP4COD8ahq7O46202jDtzzLEj2P1h
	e2o5NVwIC9Y+hcntaZI+kYjCLABt3ojtyHVmXYArd88TXnhDjFWMqwSK9r6GKICzPst2Znn5lsV
	dPGMx282ShcuVl5zrAdi61sB3OTiuzG9jCgjwpObTOFbsr7/vo6zkyfLc4Dg1tSEk0w2MCv/ZZx
	WA5hxYmHlfIvRQd+1TmyPbwpoQKp1M/8YwHkW/hLn+ask/31mNQo0=
X-Received: by 2002:a05:6102:8557:20b0:605:b96a:a0d4 with SMTP id ada2fe7eead31-605b96ab4d7mr1003426137.27.1775346940957;
        Sat, 04 Apr 2026 16:55:40 -0700 (PDT)
Received: from localhost.localdomain ([102.244.98.15])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fbb1a0d7sm9447301241.13.2026.04.04.16.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 16:55:40 -0700 (PDT)
From: Delene Tchio Romuald <delenetchior1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Delene Tchio Romuald <delenetchior1@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] staging: rtl8723bs: fix integer underflow in TKIP MIC verification
Date: Sun,  5 Apr 2026 00:55:22 +0100
Message-ID: <20260404235522.72483-1-delenetchior1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260404225752.61297-1-delenetchior1@gmail.com>
References: <20260404225752.61297-1-delenetchior1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In recvframe_chkmic(), datalen is computed as:

  datalen = len - hdrlen - iv_len - icv_len - 8;

All operands are unsigned, so if the frame is shorter than the sum of
header, IV, ICV, and MIC lengths, the subtraction wraps to a very
large value. This corrupted datalen is then passed to
rtw_seccalctkipmic() and used as a pointer offset, leading to
out-of-bounds reads on kernel heap memory.

Add a minimum frame length check before the subtraction to prevent
the unsigned integer underflow.

Cc: stable@vger.kernel.org
Signed-off-by: Delene Tchio Romuald <delenetchior1@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index f78194d50..1fc8bcf39 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -390,6 +390,13 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 				mickey = &stainfo->dot11tkiprxmickey.skey[0];
 			}
 
+			/* Ensure the frame is large enough for TKIP MIC verification */
+			if (precvframe->u.hdr.len <= prxattrib->hdrlen +
+			    prxattrib->iv_len + prxattrib->icv_len + 8) {
+				res = _FAIL;
+				goto exit;
+			}
+
 			datalen = precvframe->u.hdr.len - prxattrib->hdrlen - prxattrib->iv_len - prxattrib->icv_len - 8;/* icv_len included the mic code */
 			pframe = precvframe->u.hdr.rx_data;
 			payload = pframe + prxattrib->hdrlen + prxattrib->iv_len;
-- 
2.43.0

