Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F9930BF70
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 21:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772401714; cv=none; b=ERY8RIIQ7LlpXABT6HhDvog7kf7ueXnUYHdkX4fqOh27k9R/Iq5H6hjW1OeNDWg9dFmFidzLYXKeBsvzrj7612awCtw1Mu0T6Aia4JwW+OYEcNegsvnJiMe9zxzGrGgKZiuHPI8TIGWYpnRSskMm84GCTSxBvecHH6fMZTCleSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772401714; c=relaxed/simple;
	bh=cRtvTBylwa3clkeBz99C4xLhvzo2QLhCy1n0JBwvT9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SNPOlLMtvK4XUFE/YA3VoRWhLdenteaNKiX//+teDXOTARJnas7FlM/Bf9nBk3pQ0jXz52eLSaycS6MjyB0QuhjNqHdeRWNtn9NhGum4TqNApoIvatWmvMmCQCyAmogwnUB8gecUaG0wBjNae2XY6tY4bNxanpRTJfZNAnK/vtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K8i5QcOG; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K8i5QcOG"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-8ca01dc7d40so406231885a.1
        for <linux-staging@lists.linux.dev>; Sun, 01 Mar 2026 13:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772401712; x=1773006512; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/JolxxQiAh4mHRHzhg1cF1co3PwUeZkcbrnVGJTYMI0=;
        b=K8i5QcOGP2uRlsROmZQKZ6kBmAacbcGGGEc/3Osvj4M44wPXkACbZR08hf6Hhp0bVT
         rEwfkqAJSmKxlpD71xdYEpvL8dlLtceLHSrJX6aA22iCPSK2rOZvDwUYR28uskO+kQup
         /r6wZwfrroL9dE6RaJafoxL2/I8KNaXlN7eU5AFLIpLdkUmyFWPC6jcNCRK4T9cBumjQ
         wNTCEZmDK8e/psvst9qce3092LfAOweNVRmX1c7H96UzSjFUG53iDJy2ztsJzPFZEm6N
         6XX6jyAdTMp1uuqWLbEOaNhy0Z8u74vgmnPKhbyGKFBp5Bp36tEXzcdRS4vSMbOr18U5
         aPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772401712; x=1773006512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/JolxxQiAh4mHRHzhg1cF1co3PwUeZkcbrnVGJTYMI0=;
        b=KsVQRaffFcIS6e/szWIEJGpN3sb59Ah6ZNeYG7EuHQdBQ2nAc3zTCF1qSDlX6m10/5
         skNzxfdlVoo5AGUAVUFyBOrrxCqXnmEeAqQSPGowHdA2FUTQPXwI3cFY3tK34lL+di3/
         O2s2zXnDQAxyVYk4By/+rrvBorFpLAAt4YU4aCYum6BwRm90B3kybIwr8e59IvGrFE6w
         RBF5jUiF9GX1S/UoOzDl0l0glK6zJZoHX+jq0RukBua8GZk96cGDrhms0BwKstTIjseQ
         YBxAKhKJMg7dqYB70x6lQ40skJnHTldnkm2JB4dsWNSPZObSP1D3PQZM6vsoG6i0Xahg
         OWVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNznvLjM1bNSJ/gLGZ4AWiVnXJUv4xArFb+hjsbRKYmZ/fC5RPWf3CfXckBNICjbMMzILKY8G8x4u48YfH@lists.linux.dev
X-Gm-Message-State: AOJu0YwQduGG9MsPHDXyA3Qk1Fc0aWrrvjkgwIuOmEqAR+K/VrHZVWi9
	fuhxNLhBLHpV60dA8ARaUGQr3vhovBmWlfXhf8vpmhTn+1uXN956GuU2
X-Gm-Gg: ATEYQzxng1E0U3owR8gmp3k2zt3RsyCn4/dA5nFyAvzSsBgpbiPMZqccsVZKQX9Oj5y
	1YeM58AzIivd7YfvzGvzoAtFNwkRjrfRIYJbnawdSwwnbVjqvPrnUkN5etnWxMPxPERiBfQkoku
	F/7Tw9BEoZy+K8JrCQDKlGbEb2ThmQ0xBcbIvQR+JsfpnewK+uAJ7QcpGgICOiqsp+p3itBChQf
	BLaETN+iMkaDrM06QuNY0wbiDWZy+G922uH0KviyCxzkisIs9cGwIJGtMQ9kHE32OAq0s30gFwe
	VJYwPxsgd0eSJjPLzxTQyFjtrwN2dbAYOJlz3g1gbw3/2Qt5JeR+s009lHXOIQ9HdKc4gLclwML
	dYzpGpN6FgjZgpYbA/mpOf3tjP4PMdm/G4I0p/cUjUVrBQ0ZQeqFTfcvfn4FDRjEzFUZlrudTLO
	5b/BEjmWUm23CWDiJDcekFrpJVyuVay8czseHAd0JrwFLWYOryZuw8iOkowuYol66F318UbSR65
	4ajHbS2e105QGs=
X-Received: by 2002:a05:620a:40c4:b0:8c9:f996:81f2 with SMTP id af79cd13be357-8cbc8e55bf9mr1188803985a.17.1772401711695;
        Sun, 01 Mar 2026 13:48:31 -0800 (PST)
Received: from instance-20260207-1316.vcn12250046.oraclevcn.com ([150.136.248.187])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf6f948dsm1006700085a.30.2026.03.01.13.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 13:48:31 -0800 (PST)
From: Josh Law <hlcj1234567@gmail.com>
X-Google-Original-From: Josh Law <objecting@objecting.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: Gabriel Shahrouzi <gshahrouzi@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH v2 08/10] staging: axis-fifo: use lowercase hex constant for consistency
Date: Sun,  1 Mar 2026 21:48:13 +0000
Message-ID: <20260301214815.2628942-8-objecting@objecting.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260301214815.2628942-1-objecting@objecting.org>
References: <20260301214815.2628942-1-objecting@objecting.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Josh Law <objecting@objecting.org>

All other register offset defines use lowercase hex digits. Change
0x2C to 0x2c for XLLF_TDR_OFFSET to match the rest of the file.

Signed-off-by: Josh Law <objecting@objecting.org>
---
 drivers/staging/axis-fifo/axis-fifo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index d5533235cefc..e154139831ea 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -46,7 +46,7 @@
 #define XLLF_RDFD_OFFSET	0x20 /* Receive Data */
 #define XLLF_RLR_OFFSET		0x24 /* Receive Length */
 #define XLLF_SRR_OFFSET		0x28 /* Local Link Reset */
-#define XLLF_TDR_OFFSET		0x2C /* Transmit Destination */
+#define XLLF_TDR_OFFSET		0x2c /* Transmit Destination */
 #define XLLF_RDR_OFFSET		0x30 /* Receive Destination */
 
 #define XLLF_RDFR_RESET_MASK	0xa5 /* Receive reset value */
-- 
2.43.0

