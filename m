Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C383A6B9A
	for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 07:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779692446; cv=none; b=RZkQNmMM0kef6WS5Byyq9Tb1/5IEW0OX9ZXlqgHeZVDoXpcy/NzvbDgv/o/DGAkS3/qn2Q9bjekn0tzqMOLfKNhbz2kbiAkJYKO4p84HWXJOeNxGDQ6S5cwTfL/eUR90BjznhrqqqNeQoB5UhrEm9T9H4MBOTBI+TYnpSh8cvpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779692446; c=relaxed/simple;
	bh=VXIjhjPckNErU7/AaNVZ2hvuoEuFMt8smC/jwDXTgtc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ql/HoDrj72JhRxi90WO1vIWzZvikYwOi64K4p2Gi8iNG6lbVtGuqLj487m3vnAhpIClx1GQMJNWO40uq72rZIr7x2kg7wX4xprxVCwM+i5UD/x8R+i/qPsH4z1qCOfqrVt6x10mD/l2afh62/Z2XyGFzHzyGLrv3YlC8XU+QRIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ROjfeSQD; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ROjfeSQD"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-36900945df5so4625767a91.0
        for <linux-staging@lists.linux.dev>; Mon, 25 May 2026 00:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779692441; x=1780297241; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gWx+svYt/ODeSXxEOHpEfFlOryrSauWW8Ay+Nmv22Ds=;
        b=ROjfeSQDFZPtrZPZegAl5UrBI/1vEsxtADBFb/Og7FbpwxONSOwzbAL9u0TVjL+rxj
         6pr5/mT+GN2lW8tVwg4fWgMEBThG6PXyBWSuwYXc32tUpChDuITclz3H7qhh8xpiv/jY
         OpAMlxAZ24OSuYuArrAocB0Y41khMY+AvMePcuTR8WtiWkOGRg1JXksWk6aCUCXHDh4Y
         Tc3qWQNkqjgd99MFQq61ge+HWIuAXf6ZFnPZE2vIbn+kAb2VcERGSv5JTIxj1fiETgB7
         bjyIANvXuN5URcsJoaSCEJHJHKbcIuUafH8zTW48EIIIWhrvKwK492a1JYfSjF8r6tFP
         LkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779692441; x=1780297241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWx+svYt/ODeSXxEOHpEfFlOryrSauWW8Ay+Nmv22Ds=;
        b=btftBf+8t3OM+FL2S3TZ2qL9p6UD9/cmK1Smf5k1nCsn0fh4qBQCVvkzBFy5ruU2uk
         X0pUrWEmW3oYg+0GtK/xGF+dh5lAjxyHU8Po5ifJAcgvrdR0OJcD5pKKqw/Jtv6m8GZE
         VHakab2BeBc5/CavfG+VvG7Um3n0GDjPDdnL4XsN2sESi/XmYgLWrnkXYXlsbBEM+nfT
         nsuy0RmTlX8rCxiI0QWuRF5jJVFrE/cfbZOtKPiryDs32Tm+poLRJ+oywIugjoTrLvR7
         b25IQGl1pNMuv02UrDcpkzXSzmOiwrNHBY6psdhmy2Yfd1+30FU6ypI47A2PqWwacV27
         jFKA==
X-Gm-Message-State: AOJu0Yx64pZUV7qTuMOluSOaLxZE/1MFe4tdgaQr/o8v0MPlVOOe1snm
	7FJJOWs8cFG8U5EnhQOtTt6rnhR28eCGcQeiV8d9wwNklA1hIBDbFLtt
X-Gm-Gg: Acq92OHCmek69A/SAEo3aNANjkuPVLubmlxv6z10Pmshe7D+wy8XxnM7SWd8U0iZiHf
	qTm/exso3X1+BLFdP9exhdfM3Tf9U3nfpnVacULx8mjjYvjhU/jLqp5zF/8bDqbq3KpLZSpx9R7
	b1JqSILbxItiBNeBK6yo2AhnfEYK17vY9bHihw48ONx9bj+buua8OSHsNyNhBDUbvmW+zl7bs8z
	qHWOXv+C8DwzpO4WZES/641wqy4C7uFrSQG3S+6iW6LcwaKn1aN6FJ0leEdrnTN4tWXj2m/VfCd
	iTHDIsOBH2kMSLMgSB9kuEnPlOqFCgCOgmx06DpCJEIy4Wh4WweLPM2j8cDbVlb3ff1P+sH21nE
	51oC6t8rkjMnOn+9968iWuWnyAzfWW3C22PrOKifVT0KxZ0IjcIK9Wbvf0pKXYeP8/vWhkUm5Z2
	fnXR2zC6UdEZbJKTUf4A==
X-Received: by 2002:a17:902:da84:b0:2be:b09e:721f with SMTP id d9443c01a7336-2beb09e7439mr150048035ad.31.1779692440427;
        Mon, 25 May 2026 00:00:40 -0700 (PDT)
Received: from grand ([2401:4900:1c2b:7e61:dbc5:96cc:845d:a2d7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b387dsm87392435ad.50.2026.05.25.00.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 00:00:39 -0700 (PDT)
From: Anirban Bose <boses156@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Anirban Bose <boses156@gmail.com>
Subject: [PATCH] staging: rtl8723bs: rename camelcase variable bDumpRxPkt
Date: Mon, 25 May 2026 12:29:35 +0530
Message-ID: <20260525065935.130736-1-boses156@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the local variable 'bDumpRxPkt' to 'dump_rx_pkt' in
validate_recv_frame() to resolve a checkpatch.pl CamelCase warning.

Signed-off-by: Anirban Bose <boses156@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 86c5e2c4e7dd..808f67b61f77 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1447,7 +1447,7 @@ static signed int validate_recv_frame(struct adapter *adapter, union recv_frame
 	u8 type;
 	u8 subtype;
 	signed int retval = _SUCCESS;
-	u8 bDumpRxPkt;
+	u8 dump_rx_pkt;
 
 	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
 
@@ -1473,7 +1473,7 @@ static signed int validate_recv_frame(struct adapter *adapter, union recv_frame
 	pattrib->mdata = GetMData(ptr);
 	pattrib->privacy = GetPrivacy(ptr);
 	pattrib->order = GetOrder(ptr);
-	rtw_hal_get_def_var(adapter, HAL_DEF_DBG_DUMP_RXPKT, &(bDumpRxPkt));
+	rtw_hal_get_def_var(adapter, HAL_DEF_DBG_DUMP_RXPKT, &(dump_rx_pkt));
 
 	switch (type) {
 	case WIFI_MGT_TYPE: /* mgnt */
-- 
2.54.0

