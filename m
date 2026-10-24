Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792827464;
	b=42cpS1Z3mhQW2cHxDSEHiZYzbz9Qkn8goahouHNh+O4mw98PzRpZVV6y+e3RsDINTI7T
	 3/sgrEhlIEXFTkHmCnUbQOUZtLlASzE16b+zbUijo6GXFXEPXgh+0YlqpBSn5C8E0pqZn
	 O5FX6gqZSpac3ElSthORr8bKUhUQOiaiLN/f8fOYmHtQsxZuXXyPy609p9PEw7dPwa90E
	 Ss9Ml8cCMj/iv277cBFg556aaYGOMYZ049GxTBE1BjRaZSHi4Nq4X3cmGw9ipw7qZcg7F
	 M8jw94iyDzCIE5BmzbOrijcXQAVRMxFxYE61jmFdyLbyyKU2ZkTiP1l9dQCFZb5TCaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792827464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tc1XY534B8TE5CFUGmLcAlz66NS2raVPHqc7qDFoaz8=;
	b=1CVMst34maJ5tInyWZGakErKA0kCFfT2QynDZC7JKo4I73ziz7tTV7cFGvOyq48f2QBt
	 3FHc0s761qBBaf8SaMEQdz/2PkE0gyzEoChkDFtQWnZqgADi3mW4ASE/UJWbc21+kePJI
	 hmnDPegv7glckvzENm9viTyr+4Ja8neRXr8I9D8Ke3Cu+13xCvAzOmdFlEEPdldgb+bpo
	 KmrLyhzltyOKzziHL7ACsQ0KOU85dvGr/6sdQImH/pOQnuemaT/cAZ2BWdjJaziK/jlxS
	 zQztyJPudB+SLzsBWXqD1WLRohJGhIFJouNPSrhPHvmtoL64rLjXimNzei+u2s84XsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m3gnq0Np;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7DA606A31B
	for <linux-staging@lists.linux.dev>; Sat, 24 Oct 2026 07:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF7DA606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m3gnq0Np
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-36661f953e4so2744337eec.1
        for <linux-staging@lists.linux.dev>; Sat, 24 Oct 2026 00:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792827463; x=1793432263; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tc1XY534B8TE5CFUGmLcAlz66NS2raVPHqc7qDFoaz8=;
        b=m3gnq0NpkJUQxOQFBCpYhkkC+qFSeo6e+N83Cz0QGaRaFhv5MEFxsbqRq9Y9cerGVv
         G+4OscMtqRoCmBCbFR0bsVTRjqD+NF4adFIqO1Y3VV6gIUpml5OSWAkYHBFT6YZukvNN
         XnE77h2yjaowwuJ/Kl1D95bW/UFYUe11riIIBe4i0G/ECFJr7hui5LlOb4nqS1h1yQEj
         dcpqytFxGvkJ3K0BDZiC/ra5ZupnlGu95O9PaG7DTFOL6h24nVSNlzx+GdURqbWl/4co
         rohk2W7X3HRcKBSwvJnjEtK8dMZ0+8b2OQ5RTNkbusbvid21uMBmMUXLZ71YHdc5NS/v
         UeHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792827463; x=1793432263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tc1XY534B8TE5CFUGmLcAlz66NS2raVPHqc7qDFoaz8=;
        b=HNgFtRTfzrEwdh1PU8u2dHv4rnQX1WTcfxstIBrwJ0jOhdSepLaM6jHpmKR3n1+wC1
         T4F5yXvzJd1p9xKpWkczrTVIBL2WXJ5kP6ENgHS5UiWUbSNuOQO9/qGMi/yowGR8yuzU
         ePfhXPpSx0Eyj7FDgIQZcSSMt+WsHt7Aqxp/wOa2S2prOozhMEnsAeYkGjdaTeHwOauW
         6WlEgqiXz/gqhUuv4fMHJeI/W1B3bYgOfFXtO/9A9xVL21Dys0KGHoQUMHX9doty6OEI
         5s2yfXkqrO85oO0JUoq2t8q7nrRzQnkGFqHRi2u4odom15/4ItZkv3G9s3ZqYe5E5+um
         nHNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzuldKQDYwRr9B0Kz7dyai6VRcJri4BvmtfhUTzv7whRVwvfe67aBRKyrUKUWJWib6agMS7AUJ5eIqBba3U@lists.linux.dev
X-Gm-Message-State: AFq9FYKFslayxwHxhqdTBnFjuZWkJgKxm/Pu8MS3IfYXrh1sOI71n9Cw
	3TnnJ2Xmlt6TpNO6bK9SnJY56mS75xXZy8VVHH+rrQ2k97mOXwi9g40F
X-Gm-Gg: AYBFou2cKoS0kQnNZzNsrYXx5OaL5NHhjrdTVuAPG4gBXRpTuROcH9ZLkWQuqkV96ui
	ykkpRNOBcRptevwdBhbTYmB9alJWg/b9KI7iHoXpokkgIrEkFX1W7T9ntu/lJgBkPYhSbFtdyR7
	Z4kWTo7OabE94WnGLIhnZRYZ41iJgwGbnhc0vVPWuSTrjTj/57UaleoWkJn1ofNhds7uveZ/80O
	MiKaOAzSNk7j37B28rXJ5qUyuQRiIciHh6jgqc+J3kYY1vmhVQTncO4WNPUVFijIpxZX1rqreXs
	iNIFsoRaeqKi9ldftk51NQcancUfmhVh1EicBmcL94DhhVx9tc083gzpCRJLdm/gErpnyiMxZ+s
	dUeZGsN8Ip0SHpnVRQXn2wgOPXC9qzOXBIfKlHGjxMHSnkxV2132d1qqTecyCCCsoKFdpdZ8kMZ
	+HbMjWvgn1WZiLzGvGoPtbzys9eucf90M17uD2lvtX3VhawimqRslT83zK1EG9TVqoOJqLDqZsw
	cnnWGH+ehUMIYTu91TczK0G6y7TDEcyrg6CVlOw1TtiDc3uFnDl8ky+LZnXgD3yHAx/DBVjaiPH
	QuxIwHPWxD0O2Kp/rS+y
X-Received: by 2002:a05:7301:1694:b0:368:da6c:4fb6 with SMTP id 5a478bee46e88-369e84ba936mr2974905eec.18.1792827462776;
        Sat, 24 Oct 2026 00:37:42 -0700 (PDT)
Received: from himanshubakshi ([2401:4900:1c9b:1c1b:d646:355d:1105:8655])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d93663sm5294951eec.13.2026.10.24.00.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 00:37:42 -0700 (PDT)
From: himanshu bakshi <himanshu.bakshi478@gmail.com>
To: sudipm.mukherjee@gmail.com
Cc: teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Subject: [PATCH] staging: sm750fb: clean up PLL calculation code
Date: Sat, 24 Oct 2026 13:05:49 +0530
Message-ID: <20261024073549.29531-1-himanshu.bakshi478@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>

Improve the PLL calculation function's documentation and
readability.

Simplify candidate selection by skipping candidates that do
not improve the frequency error, and defer updating the PLL
parameters until the best candidate has been selected.

Signed-off-by: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
---
 drivers/staging/sm750fb/ddk750_chip.c | 84 +++++++++++++++++----------
 1 file changed, 54 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_chip.c b/drivers/staging/sm750fb/ddk750_chip.c
index aa78d0bc1..74ce320b6 100644
--- a/drivers/staging/sm750fb/ddk750_chip.c
+++ b/drivers/staging/sm750fb/ddk750_chip.c
@@ -269,21 +269,18 @@ int ddk750_init_hw(struct initchip_param *p_init_param)
 }
 
 /*
- * monk liu @ 4/6/2011:
- *	re-write the calculatePLL function of ddk750.
- *	the original version function does not use
- *	some mathematics tricks and shortcut
- *	when it doing the calculation of the best N,M,D combination
- *	I think this version gives a little upgrade in speed
+ * Calculate the PLL parameters that produce the clock frequency
+ * closest to the requested frequency.
  *
- * 750 pll clock formular:
- * Request Clock = (Input Clock * M )/(N * X)
+ * The SM750 PLL uses the following formula:
  *
- * Input Clock = 14318181 hz
- * X = 2 power D
- * D ={0,1,2,3,4,5,6}
- * M = {1,...,255}
- * N = {2,...,15}
+ *     request_clock = (input_clock * M) / (N * 2^D)
+ *
+ * M ranges from 1 to 255, N from 2 to 15, and D from 0 to 6.
+ * The selected parameters minimize the difference between the
+ * resulting clock frequency and the requested frequency.
+ *
+ * Original implementation by Monk Liu @ 4/6/2011.
  */
 unsigned int sm750_calc_pll_value(unsigned int request_orig,
 				  struct pll_value *pll)
@@ -293,12 +290,15 @@ unsigned int sm750_calc_pll_value(unsigned int request_orig,
 	 * N located in 2,15 and M located in 1,255
 	 */
 	int N, M, X, d;
+	unsigned long N_best, M_best, POD_best, OD_best;
+	unsigned int diff;
 	int mini_diff;
 	unsigned int RN, quo, rem, fl_quo;
 	unsigned int input, request;
 	unsigned int tmp_clock, ret;
 	const int max_OD = 3;
 	int max_d = 6;
+	bool found_best = false;
 
 	if (sm750_get_chip_type() == SM750LE) {
 		/*
@@ -335,26 +335,50 @@ unsigned int sm750_calc_pll_value(unsigned int request_orig,
 			X = BIT(d);
 			M = quo * X;
 			M += fl_quo * X / 10000;
+
 			/* round step */
-			M += (fl_quo * X % 10000) > 5000 ? 1 : 0;
-			if (M < 256 && M > 0) {
-				unsigned int diff;
-
-				tmp_clock = pll->input_freq * M / N / X;
-				diff = abs(tmp_clock - request_orig);
-				if (diff < mini_diff) {
-					pll->M = M;
-					pll->N = N;
-					pll->POD = 0;
-					if (d > max_OD)
-						pll->POD = d - max_OD;
-					pll->OD = d - pll->POD;
-					mini_diff = diff;
-					ret = tmp_clock;
-				}
-			}
+			if ((fl_quo * X % 10000) > 5000)
+				M++;
+
+			/* Reject M values outside the supported range. */
+			if (M >= 256 || M <= 0)
+				continue;
+
+			/* Calculate the resulting clock frequency. */
+			tmp_clock = pll->input_freq * M / N / X;
+			diff = abs(tmp_clock - request_orig);
+
+			/*
+			 * Skip candidates that do not
+			 * improve the frequency error.
+			 */
+			if (diff >= mini_diff)
+				continue;
+
+			/* Update the best PLL parameters. */
+			M_best = M;
+			N_best = N;
+			POD_best = 0;
+
+			if (d > max_OD)
+				POD_best = d - max_OD;
+
+			OD_best = d - POD_best;
+			mini_diff = diff;
+			ret = tmp_clock;
+
+			found_best = true;
 		}
 	}
+
+	/* Apply the best PLL parameters if a valid candidate was found. */
+	if (found_best) {
+		pll->M = M_best;
+		pll->N = N_best;
+		pll->POD = POD_best;
+		pll->OD = OD_best;
+	}
+
 	return ret;
 }
 
-- 
2.56.0

