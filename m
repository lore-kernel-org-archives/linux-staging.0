Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257C238553D
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 18:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774894664; cv=none; b=ewvqUlzkdsdJFjA9pdy9jgFC0wacDcP7dAllVpOOw66eLUpIxaz+jMnyJaPcAclduDPt/6FOIWoUVrucA6N/N8WjmGTggZ2gqIWCVn2TC0xhYeLWHmoVgVNejPjThSyDbNlmwOhiu/Q0mra3ZeON3yZaZHrcctIgK+hAZ3e9odU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774894664; c=relaxed/simple;
	bh=v5TwC4wVPLBMn+PJai0mOiveMJJJtBoH0VbaQ85em6k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uQihYMGjh+B4JjiheUnXpgWEXrJ/PMpicrrFTyBtoeK0xSKauEr9zwetZzJKVKZNm6qIKh4Yo8WCqYe6HgpmYojrZlxv2WlQFL/eQStnb63Ey6462MCyFKNm3QBYMOTOm4GPHeJDPgqRo5SQ1D2fs511UxZ3bzlh9jXhELOsr68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NyXRP06K; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NyXRP06K"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-827270d50d4so4319738b3a.3
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 11:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774894662; x=1775499462; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gtow8N65d/BtaUdMdcH6YJ/Rpa4A5Q8aZEpXNaY0IMQ=;
        b=NyXRP06Kee30UBAWMLAAxPJOJzxJ5+lhBFXRKdmDtJTWGm0pP7RnxboRF1TGgOQ8gs
         ZqVwdXM5wTVArBPcWFkAm/ouqMrmN8ZSho6R9R23Z/DKqmzq+OoQFvF36jQPl1Nfmreg
         J8+vNkMAFIEHYvHDHl8//61O8gZQIb3EBv3cqhhZ8bonLkAFCrdXcmGyk2lJ/TXa6WZ4
         UyQu1WY9Qdp12iG/dGcBZrd0NQKcvlL0d4XZHRZgualUkanlAld3DI+N1lGi/AqL1VmM
         8p7OFU6N1ff1rkmFDB5HeYKjaKG3x1IgF35SgXBWIFeCji7rexnlilDhwuYG7weWAk56
         LYWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774894662; x=1775499462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gtow8N65d/BtaUdMdcH6YJ/Rpa4A5Q8aZEpXNaY0IMQ=;
        b=ee7C3I/ImFXvcF5qBsvYgUnCZ5vVBVLU9iqrd0NInDXjOjbOtgle83NfAUgrwVJama
         OaJKc2CPaj9IXPfFzGo8no1SgJgP3Z2oVVNYcLzQ5CgThVyMwLfjvQk9xWTj7Rrz6A7e
         Bo0XhuvyimJl1RExeUgXEZ1AkBzENUrUuEBLEUS/mBrNDgCndbN/vPFxjEMF7b/ZZt5G
         sEw8xx2tJ/YAL0lWLcychWoPCzDFtHgPMXdilSDkgpFokdokYK42HYRHyEDEA3d689Cb
         h304njSW7krxWFww6/BooFq+JaTB5Lnq1qAzeyN+ShhER/H0RKLUfeBtxEeLQGbxAwUJ
         N1mg==
X-Forwarded-Encrypted: i=1; AJvYcCVXdLtYML52JJ9+318f9aoiA70y/W2GhUrvLnWbgrFlVbD4VzNci4SAv22FCaT1dMbJqsL5s8gCfdxdSbv9@lists.linux.dev
X-Gm-Message-State: AOJu0YzxD+MnmMbO0oZ3CzV7s2lvhAp8aMb51sfZmGwjcqaR6LHambNL
	UKjSEce3/mIOQyeYNInnGh1RjeFCZfPfhVbkpK3erdEJ2VoA83udK0yI
X-Gm-Gg: ATEYQzykm30695CbDhGh/ZucN/p4SeRni3A+teQEqxsKjKcbd1kzg3lzv/pg/ol8JGL
	N8y1Vwa9qND52LNc8ub1Z9O7b1myQJ6JURAASrJjopIny8/45iXOR4oj3Zrgs3OPkeEGP3dqcdD
	Ms3WgMc+sFrZyGgEPQAntPWEdrgcpbQjRVXoAGn5RPFPJT2mPXlbFnxpqFGZX+oamAuFKVUquLl
	zPDfJQq4fQ/Ssf1u2C6n77XAiFKngSYWtoeY8oorgSERXtGxpgtjI84kpi5ymnvB8bPdiUXFOQz
	HaEVkDdMU9jB/swnTUs+iNWhdMozjPdhbCQ7vBWcgVo4xEPpydCSkpRlJORIAqsQPvcL629sBJE
	hfVQWRn17tTz5cwC/Ll48eTlRUSmyVWTOly0am+yqBSh7/YmvFYgJkQiCyosJVp3Y6+btdDlQyw
	xPtjzWCaUWVZc+WTQu5M2YeQ/RkRPjaQxBdZcXuxjR
X-Received: by 2002:a05:6a00:1488:b0:82a:805a:7e2 with SMTP id d2e1a72fcca58-82c959d534cmr12982518b3a.9.1774894662502;
        Mon, 30 Mar 2026 11:17:42 -0700 (PDT)
Received: from Mahmudul.. ([2400:c600:545e:6508:42eb:3d78:89be:591b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca85d4d90sm10099966b3a.36.2026.03.30.11.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 11:17:42 -0700 (PDT)
From: "Md. Mahmudul Hasan Mabud" <mdmahmudulhasan1511@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Md. Mahmudul Hasan Mabud" <mdmahmudulhasan1511@gmail.com>
Subject: [PATCH v3 1/4] staging: iio: adc: ad7816: redefine mode constants to start from 0
Date: Tue, 31 Mar 2026 00:17:07 +0600
Message-Id: <20260330181710.23258-2-mdmahmudulhasan1511@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260330181710.23258-1-mdmahmudulhasan1511@gmail.com>
References: <20260330181710.23258-1-mdmahmudulhasan1511@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Redefine AD7816_FULL and AD7816_PD constants to start from 0 instead
of 1. This change is necessary to use these constants as direct
indices for the mode string array and to align with standard
indexing in modern sysfs helpers.

Signed-off-by: Md. Mahmudul Hasan Mabud <mdmahmudulhasan1511@gmail.com>
---
 drivers/staging/iio/adc/ad7816.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
index 172acf135..5acfceb90 100644
--- a/drivers/staging/iio/adc/ad7816.c
+++ b/drivers/staging/iio/adc/ad7816.c
@@ -22,8 +22,8 @@
 /*
  * AD7816 config masks
  */
-#define AD7816_FULL			0x1
-#define AD7816_PD			0x2
+#define AD7816_FULL			0
+#define AD7816_PD			1
 #define AD7816_CS_MASK			0x7
 #define AD7816_CS_MAX			0x4
 
-- 
2.34.1

