Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CC923507B
	for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 20:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782158687; cv=none; b=upKO6fenjeuDIMn2T/ird+1UEFkC9n5EbKAP0gBuIHddcke+pDeMDnlC1ji1hbMigJkQ5VsANHwmR5FixRpdFB7lt9F+R7WyXfEd7uYkCY8LeJ06cBu46axwD9Ajy2RVqFocMeYen3sNRN2baLOcHFgeeZLjdYcNgGw5kBQql3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782158687; c=relaxed/simple;
	bh=aYZk1Bzl1es2rj6bfZkOPtzNyaKi/CTNJBFbY+J2eaw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=m6XydUutUvouEula0PhKPWo0ng7cdeIAnqu8ksWL4ew+0m5u03+riLOL235tTHyIMdlqV6VOQ89asJCBS6DJeOHIsudpJjmJsPq0tZ43qLVhjLdjW+5h3Z8Mvpi4hKOlbYXRZV8i26v/tjaPf+28iDv7v0Zbmt1URiAy/137ZyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rq4Uoe3G; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rq4Uoe3G"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6978f0870c9so3287623a12.3
        for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 13:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782158685; x=1782763485; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KKCFTo42mwtAka+9vkrYWK+7jVWK6OC1VqnxrPZbx8w=;
        b=Rq4Uoe3G65TwkWdJueJ8jBIpYrZK5VUwkkM3PjKAm+5DhcZS38dPIcP/nmRfY/4Zs8
         0ksAESlBrnMIr2oJgPpJiuBcNIYbYuFpE8qzhukhd0xFjjChaSEmxMMsvzouNsRcFuhB
         xhfp2ZgZ8ohuCYRU5GcQnywHK1viN24H0NTryi/cLwsCzwyyWJO1u/FKgRvAWeEp7lJP
         MFUUw5N/x3srtxYdCXnZieHR8rFPVqeWrUl+pbkmkAvdLH4hDiSDVeN0XhCq3tWqFuak
         uVPq/z5b273ge7sCycZphwLQ0XCWHPwl8DjvujtIR5o03wmEySYMLd4Z/pBM60j5fO5A
         FWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782158685; x=1782763485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKCFTo42mwtAka+9vkrYWK+7jVWK6OC1VqnxrPZbx8w=;
        b=VhCaummTlGlD5ODiY9Ct8TYC5nX0Qk9U/QVXcSZUUqt/ZEOqQbfRT3p28hm2R3wm9g
         Ka1H6EInXP5BYgApusBWRMIkNjjD5oGZyOMM5S1n10HsvaVSDW0muFUaIq33yfT0La1A
         RvLBStNbtC/yal6ZTSEFxT0D/OKUuY4i0PLSKmLNlQZcNv4g9dFr2Wr/FguTdjvKZScm
         wLXLRpG/9qEwbGNwILmuD14IKzNd0UnYNYVa5UrTiKBdsuIk+2uagCP4OyyFj1Tce2fu
         C8sTCss8nxsdrMLAl5sf/8MxneUWKTmlUZKHl2vctQqKw4WjJH19o/vfZNOtXpNiIkbs
         pSZw==
X-Gm-Message-State: AOJu0Yxbpaj6w5wUpx9Z3IBHVh/cHq/eIMktdcbqRsV5TGSmeEQJBMkb
	dEMvm77rQfcr2j2VaahJoacReDjHMPkcM25mCIF+6S4neUAQRL2Vela9
X-Gm-Gg: AfdE7ckaXXqfsLy+RrVCItAHJArhpRUI5SKzI55totHUQl5N84/l8DYSw/fkzI7DMZI
	IjoSncpCdRqSfNoteCZ6KB2/x/CvEG9x2RO2rZMe1pIDWHHeCrwZeaRD5xqbR3/yLRB9+1QE88n
	ZCi1bj8opARia0jYFaC8IVSHqOhhYFQ5N/ibbRXDOlM6DWq7tzwTJsEEJYu3BD8UCUJx6gNcDGc
	Vr+jkiCFSvHOwJtUk9PB5v3Ep4HQEp+XLovsEJ/P622QoUU3IyFJYotRy1NPxiILWVFZMUTl6uo
	Kvd0LDiM8n7UinrFOYJf8VHoyPrx2SvkFyloGIoJFiNSVAkRBmkKkYQjL4FFhOhtW1dTKM1e4YA
	DjBewvu4vatSEVXKqEbTZlwgQQ9rK10mfmKYIMgU21gVEtOxZE1xBG4S+ZdPJTuFaRfPZ/C3cA8
	Q8ssHoA7QDGp2gyK1wA/1AltDwLvwJVbZmqCHxN4L8Y91YYkhRIoeDBgk=
X-Received: by 2002:a17:907:70c:b0:bf4:9f78:8399 with SMTP id a640c23a62f3a-c0c661d1314mr627786666b.42.1782158684759;
        Mon, 22 Jun 2026 13:04:44 -0700 (PDT)
Received: from adr.. (185-184-195-125.hosted-by-worldstream.net. [185.184.195.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c610e55aesm409736466b.52.2026.06.22.13.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 13:04:44 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Moreira?= <andrem.33333@gmail.com>
Subject: [PATCH] staging: rtl8723bs: clean up style and dead code in rtw_recv.c
Date: Mon, 22 Jun 2026 17:02:39 -0300
Message-ID: <20260622200239.14683-1-andrem.33333@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl warnings in rtw_recv.c by removing an explicit '== true'
comparison with extra parentheses from check_fwstate() and dropping a
redundant 'else' block after an early return.

Signed-off-by: André Moreira <andrem.33333@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index f78194d508dfc..3fb48a8a52b17 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1597,7 +1597,7 @@ static signed int wlanhdr_to_ethhdr(union recv_frame *precvframe)
 	eth_type = ntohs(be_tmp); /* pattrib->ether_type */
 	pattrib->eth_type = eth_type;
 
-	if ((check_fwstate(pmlmepriv, WIFI_MP_STATE) == true)) {
+	if (check_fwstate(pmlmepriv, WIFI_MP_STATE)) {
 		ptr += rmv_len;
 		*ptr = 0x87;
 		*(ptr + 1) = 0x12;
@@ -1841,8 +1841,7 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
 			/* Duplicate entry is found!! Do not insert current entry. */
 			/* spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
 			return false;
-		else
-			break;
+		break;
 
 	}
 
-- 
2.43.0

