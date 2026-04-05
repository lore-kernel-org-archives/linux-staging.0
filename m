Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D4A33F394
	for <linux-staging@lists.linux.dev>; Sun,  5 Apr 2026 10:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775384254; cv=none; b=QHDyPR7aD3CBocuFkB1yWifi5F765yIrqkHSvoTJCy/EXEeie/uY0RHnW24TotLQAs9FRuZCmn1HdwhX7naJVDeLnzbIDRgoT1dhtESE3t7iCTSykhxC+OYVdu/cvhMmzSYM7h4id4WizVd5sAbWN4h/ZRYHy2f1+B1AFcfUD1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775384254; c=relaxed/simple;
	bh=NxncsbAdSLuMbc17VvMAI5fr/no/7/aP8bRKwl8YQsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LbLaoqFPXEdKjTDnU9Ed48MtPCWKYjJHg370MKIHc9ts1HQ0W1gqBEDMOYnA2JbXb1stbp4AikalYXwZo/R+3smfsYxYr0lGxuKHna1W1dNafpQm6Dv0zYOyI+jpl9YOheRg+lPLTQIJCyNi54YrL2k9mQhPoz2sWz7m7puV4MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jq/GDvHJ; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jq/GDvHJ"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-605159dd396so998671137.3
        for <linux-staging@lists.linux.dev>; Sun, 05 Apr 2026 03:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775384252; x=1775989052; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQU2SsMReRl0oD9GLJmwgm8l81dSwTvpulsnX1IecM0=;
        b=jq/GDvHJbwIKyQQ8mj6vcTHyWsBUt9A5ZV0JHDLongkb8c9ZOc1otVae/eKuzBLisM
         0oY+AxXx+qn34iQ4DPTkwuJWw1G1y712AqYnLaqMAnlCyn1KauPkdLooNjs0ke5Ow3ma
         R3xKMDmqB6sAI4fju/b5KSJHY1bEb422fZDSCQ0CrObxdgoqSv22UjfjZHbsvzjVai9n
         flTazn//FHVRZyWOXyCv4Ax+hvxTL48/1yc7SeAV02qSLpNw4Bo8bKI7a6CAVcS3TOEn
         Nzpu7HtawHEgwFnHj2ZCXPWxoG6SqUD2DYShUU0JKL8Od5SsNA7OWufKtAp7MrARAgfj
         lkyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775384252; x=1775989052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aQU2SsMReRl0oD9GLJmwgm8l81dSwTvpulsnX1IecM0=;
        b=ai6D71epxBEQ/AuJU9RkWUOFupwZEzT3dfnLrKvxy/GoGWGLuSLkxzwh0agniXHI2s
         3yffNEgkBlsUjJFO1W/1axoifbpl6uolssnXWRGGlPyHBa7b3SM6jjX8hez0+lm/Odpz
         ZJ/8c0h1bSjnfvYSo5npZx0L5+yMmB/pWndhOzMSnlV5jTc4n+2RNQYgEZKX1q+6LYIs
         WW2MWAqA34Xg61I26tqFp3XeT/MbkE/rJ4Pv0YZiXi1cge2NdBRcH907Tx2gs4jDHhH4
         9afePUH7YFYffH190n2tnFZvsIQSZWIsfYf0QkUJzsGwIj6VgwxRTXt24g1/9TmLikn5
         8KCw==
X-Forwarded-Encrypted: i=1; AJvYcCWBIWG2CgMeNLfv3L1tEXd3/Cu+mLmoQKzqJRNRbL4nk+ocdzJJ2aMzq6s4Dv5C4HzWW4q1okUqHqxygZnm@lists.linux.dev
X-Gm-Message-State: AOJu0YxpsIIZpItDDMjUP9cwooHY1xtuD53lZ8fV1ZWepXGg1xf7oODz
	JMYdMrTZz5rBZLYGGWqK9DxpRTxdrboMu50EXG28RKCrXADi0GsEF7GT
X-Gm-Gg: AeBDievgtvmlU4ZTH5nJZ1DNFkstpFtWLvjVfe4AfRKYKxsfQEdVsE/il7CRh/vV8ev
	D7ZMOKXjrvv4uu0UMK7De8lyxuvRlUAH9xB/Z6Cyl6ALD1ZRUl5cxJVwHSbJhByjNdpQ/LDo0hG
	ueYV8Cad+chkDbFjrDMNK35pCmSUXv26GRrtfQVHGS68JtwhvjorYhS+lt/5ll/nJ72I2HJHhkg
	9xi3oQ9yqpESznYP5Cd0DQ6s6l8e3V/KVLTZET0o0b/k/2zf+8Ho/w57pzP1+ozPWA9yA19g5Fi
	QcAdc9anF7RnwvYcvj+qr7MXL0ByJjrJoEdklVgsmWEplys78XiiJosYpJm4ml7uV0NhDqEhR2G
	YSHVxH5zJZNyQguo5sUTbsWWdxfJvEfG6hX27TDywKNfaSx+2iEENsdSSXBJHqwtnqs/8tgZpdA
	5d3itfhpTng4TYBZz+T4IxF5KCXpRwnwF4aPipjQMf
X-Received: by 2002:a05:6102:5cc1:b0:602:a651:11d7 with SMTP id ada2fe7eead31-605a4ca8866mr3198854137.7.1775384252101;
        Sun, 05 Apr 2026 03:17:32 -0700 (PDT)
Received: from localhost.localdomain ([102.244.98.15])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-953fb897b8dsm10473385241.7.2026.04.05.03.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 03:17:31 -0700 (PDT)
From: Delene Tchio Romuald <delenetchior1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Ethan Tidmore <ethantidmore06@gmail.com>,
	Sam Daly <sam@samdaly.ie>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Delene Tchio Romuald <delenetchior1@gmail.com>
Subject: [PATCH v3 2/5] staging: rtl8723bs: fix integer underflow in TKIP MIC verification
Date: Sun,  5 Apr 2026 11:15:45 +0100
Message-ID: <20260405101548.124829-3-delenetchior1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260405101548.124829-1-delenetchior1@gmail.com>
References: <20260405101548.124829-1-delenetchior1@gmail.com>
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

Found by reviewing memory operations in the driver.
Not tested on hardware.

Signed-off-by: Delene Tchio Romuald <delenetchior1@gmail.com>
---
v3:
 - Rebased on staging-next
 - Sent as numbered series with proper Cc from get_maintainer.pl
v2:
 - Rebased on staging-next (v1 did not apply due to whitespace changes)

 drivers/staging/rtl8723bs/core/rtw_recv.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 717e0594d983a..11ae99e53b86a 100644
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

