Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15045313531
	for <linux-staging@lists.linux.dev>; Wed, 22 Jul 2026 12:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784723186; cv=none; b=af43cLsbWEH2/pu67GK29i7wzm0pNWBBiFkXRlE6YKDrBQ2KpuOLNSdDhgoytt1ZpNNbeN9cHUQmAmGuqGq4IVnO4yC/z15JJYTMrDdpSDIcztEDdPA8278GLsp68f5n7B/rE7GMGk1CZh3SiJ2lITNbRkbCWMdC+jUwoJdmjcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784723186; c=relaxed/simple;
	bh=vonf3+wevdyAh5E4nhVRWB8FQ8xXeBQfY4QDmilXIrs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TiAhG6w8ZE2PPG0SguIewRRHE6V5UCg33pJFjFurN3HXOu7zjXOGCUDjRhmdQHIdcvadVpVr9/oDFDjBiqgOYYQe0GRL5mbxjijG8L6ERQsUIFlph3Bj/tXgdLOeFhvH+aZqr4WoWBMDqb57Hs3xbDQL/p41dqlqOE28jo6UzSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lL2Pvv+p; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lL2Pvv+p"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c167bda216fso1186456866b.2
        for <linux-staging@lists.linux.dev>; Wed, 22 Jul 2026 05:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784723182; x=1785327982; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OsVt3asVGylNxsOn48sC9QIekMdCTbHAMhPRVZQXPs8=;
        b=lL2Pvv+pqH2Jb+TwBfbNrpj5V/AGzyyXGzYVJVDXE2M/jrVMxUDKO+tZ8I0U0dWzvC
         ZeOUQ8KmX1wYSM7TDbm3Fa9iuNEC8COT4jzEmV5UDtHF0mEiSXRaJpD+iml6O4kQQEe8
         keqx0FLNGkcVEjuFDLITXoIUGnCMeCgnrs/3Ggz/VEmxvi1P+K4vCcYyOOrzOLJj9AO9
         +vGgUgA4RkMRzPq7RinPU0IGEVOvK+vzBCR7FE8U4bdqUPZOSr6Mn6M8TG3xHWb5LRpI
         +Kw8kILeeME62wDqYiX04AuEZjr8hUv8fi66aTNleNT3GcgqVKPFrwpaYE+yKnNgL31w
         qe+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784723182; x=1785327982;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OsVt3asVGylNxsOn48sC9QIekMdCTbHAMhPRVZQXPs8=;
        b=tE3B3LiFeuamDo6/qvHc073W75DU0/pBFeCasWmq8wiEFdi7jh5l/pvjGT/amsd8XB
         1/1cyfmTs5ar79xqaexHf9cbnxoEUyhkfQjbxtn0aynfA+9+nQ8x2u7Xc1e4bdz74wL7
         tJnW2+MURXh7jTMHdoKoZI6EUv6Q/gT+waolSkrBNxi3qIigMBiS0xDIuIUMeBEf7HAN
         kay1j/SAMFtuGEitf+qz9YArZ+j1E1lyuMdEJZkIMtWG3h8/b3KqWb9oWjoN+eB8zg9e
         CR8GgPe3miqI4pjQUwH9X/+/LtRqAFjw7CE0E9yrHONt2NocT1d4eU4bqtt52ALKWcDx
         peSg==
X-Forwarded-Encrypted: i=1; AHgh+Rrg4UBrknE3q79Bc9BgNDmuGqbXSNyUBGBimE6/VJ+ueSVE56WcZmBwYndltMrNr+eXj++G4CflZDw0qt2C@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9OS2nR/2WUoRJgdgl8FuYe8hV2HFdo84KvQ5f02DugHO/mdy5
	Tx0qdiRPS2IKW6bqyH1dI6kCSkQuUCGS8ZJe+HhamNkb03wfMQ1akoQX
X-Gm-Gg: AR+sD13OVGYIUbFoputFLfw7Ysz11MAGpfZK0eSB4QMmEWfmq+EPf3Xd2CMwWEKnkm9
	GLLWWjnlimmXKcDcRtxhYq5a16AzS+hBkRiVg4Wq0rMseb2jiEf88AXGOZg+/jZ3jfJ4T2yL5N3
	fQ//n7u3eeZb61L3JRLLC4TP1Jr4NyQ5nkHVvilJrIIwAwjqtHg0IyOpz6soYj3WeN1p2WdD9PR
	ahcdWc+ZY6gI6DQHZQfIE8t5IMVwX4XaFWmTG69ll/4ZK6+HoBW0dkr1PzdIIq8rA8hEL6gu9gI
	gNuZHazQZxpPcguqfJOHYtViS8hjqakgIIzptvO3jG+aTDcUaE4X7FVn5qRXnZcxhd9cDkDF5B8
	+8jSCPkiA/7jfo5loC2eMHOLLDstSr3tjyEw7CGUl4322w7Qjk9V/i3/dh3dkaHNn4q0AzgDg+c
	LjQ0W6/72OpLugmBrq5YV5fBArleA8dbgQ63RMpCAu7kh4PLYEsh6pYfZR5c3MKy3B
X-Received: by 2002:a17:906:f587:b0:c16:12ff:dc8b with SMTP id a640c23a62f3a-c16b48ed34amr1059324666b.54.1784723182100;
        Wed, 22 Jul 2026 05:26:22 -0700 (PDT)
Received: from DESKTOP-LO2SIVE.localdomain (83.4.116.191.ipv4.supernova.orange.pl. [83.4.116.191])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32ac9d79sm94973966b.21.2026.07.22.05.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:26:21 -0700 (PDT)
From: =?UTF-8?q?Patryk=20Gawro=C5=84ski?= <gawronski1.6@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dennylin0707@gmail.com,
	error27@gmail.com,
	fliegbert2@gmail.com,
	khomenkov@mailbox.org,
	nikolayof23@gmail.com,
	khushalchitturi@gmail.com,
	s9430939@naver.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Patryk=20Gawro=C5=84ski?= <gawronski1.6@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Remove multiple assignments
Date: Wed, 22 Jul 2026 14:26:18 +0200
Message-ID: <20260722122618.41747-1-gawronski1.6@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix a checkpatch warning by splitting multiple assignments on a single
line into separate operations. This improves code readability and aligns
with kernel coding style guidelines.

Signed-off-by: Patryk Gawroński <gawronski1.6@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 16e6c9567224..7f183db72123 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -185,7 +185,8 @@ s32 _rtw_init_xmit_priv(struct xmit_priv *pxmitpriv, struct adapter *padapter)
 		pxmitbuf->phead = pxmitbuf->pbuf;
 		pxmitbuf->pend = pxmitbuf->pbuf + MAX_XMITBUF_SZ;
 		pxmitbuf->len = 0;
-		pxmitbuf->pdata = pxmitbuf->ptail = pxmitbuf->phead;
+		pxmitbuf->pdata = pxmitbuf->phead;
+		pxmitbuf->ptail = pxmitbuf->phead;
 
 		pxmitbuf->flags = XMIT_VO_QUEUE;
 
-- 
2.55.0

