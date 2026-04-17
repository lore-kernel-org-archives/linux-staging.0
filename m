Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F02A36920F
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 06:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776406346; cv=none; b=J2OIlJ1duX4E4LOGqlUPoflJzfAUlHOeStCa5STSxbmd8JZoThPUsOf3vmsUtlEivkIW6YeVIS5oJh2itDZ+95YX3cr5fua8EBX0K+ehcv4XmQZIvh+P7RC0cqW/x8MnFMk2TvYQjcvcWMWKYMxTmed2fUEiqBWylrACJESfY9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776406346; c=relaxed/simple;
	bh=2IOSrS/BCoF+OLbUXBknmlZ3v2w7geVGIulEGVdpUXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p7gOXXmATX3Y0PpD2Vc2rGx7y7tHrS7DFj9TKG8cFOLZ0na2/LRdXJ4yHLmkuN6vVlgWSRxu+o44C1eM6b6uwcn+97jjTMm1FLOobD8WNn2OikGvKnc9rn8OzOVSSmo0DjYAeAyfETg4Gywxp96SFizG+1vEet01tcHGejghOmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k1QL5NGY; arc=none smtp.client-ip=209.85.221.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k1QL5NGY"
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56f8c77ca6aso271846e0c.2
        for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 23:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776406344; x=1777011144; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6WeGK87I6I6uRVhZdQgQ7htgqEpuNuywO5trnD/VR80=;
        b=k1QL5NGYm4I8EqmEldatp5KWdYO9tTG5Q2dQe16nmUqrfltvJMNoJ3xGHDmOYkGEbS
         wasvFRaoVcEPpKmjF6c74oLMDmlEhPhPS8dHrfY3sEd3bWLvlJb4GHPaQ1RSsPNrFwI4
         TkKxawbqTULbQwfNJvHdzBhLvbOrsO+xmyQkWuO/WqRznnRrIE35JvNm4ATZsMxbD/bE
         ATgHUgr2MpgKuB0TbL/Y73R5EpQtgNsr3R0Sjk9ihzmlTwB6parX/HnXD1Qau6Vl2ZK7
         VMq1Q0ivK8yrssyllo/FjDMY7175yWB42TpC74KoAAGv0Q4vMbpLwHJRi1Gy/MCZ/O17
         0qZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776406344; x=1777011144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6WeGK87I6I6uRVhZdQgQ7htgqEpuNuywO5trnD/VR80=;
        b=mn5gjL92x0/KtSsBHz6FDNTOjj8Hh3Ar7fkSI/RWV46UKEaTYpA957A+us8KYpO7Gw
         hAR92Yx6afFBzmvO9JvqFvmgUXriQrxeG+0GHZD0przMbD0CJ5T4HQEFSSE5Iuoa7cPa
         ceg+QITp70Uft1+bsDVQJcvWuH1BUNU2UeepvGvVY0eHDPgDk7Ksu/XzN4unfvOXny+8
         /YCK3cCjlqsEsaHbTHV8Oxpu48HF9iEydPtM+quohJO3u8D0rRglKJ7FONBlhAm4ifF2
         p6JBtxL9My/UYT6k/wxx3UpSVZ/mvepOvazaNaTfED2Fh4PJoc6QDW5z3i5f+zuOqZEF
         tXlQ==
X-Forwarded-Encrypted: i=1; AFNElJ8Vqa/2/9KleRAStTCmdTI7dpSbPenAIlMZf8a/advZWy/9VJRFhU5TshxiJ0YRiGAbgSBtn/jwWNhIbgQc@lists.linux.dev
X-Gm-Message-State: AOJu0YzQb20UaT785ypzD83LiAxzSY9hamfbL0YXBpTBfEpROCKq1GBV
	FM+vbAduc9wmiK8vyWNKkoEhDulyaQDiCL8CBzyo6eFSKzCBS77ZBT8P
X-Gm-Gg: AeBDietl8yTgYpd0ZpZAL808lxwcbu396tQoTSMOOf7foUk7j8IxQoutWVPlui0NdRy
	T/blSYUEvhwqh6LqMIWJuGSQD60YsAmCWkakbmWuZNwIf/HIQli0fOn3Cd1vSe5HNCEaRzHub9J
	qspVPSPGtOGMPmH3FGtc4Br3xvuQO1zOY2GoEFcxD4gOXxY5ZGyqg6Tl/Ufedx7rQkUbHJpqFzh
	lx3fTyvxPO0vv3UyW7eeBFFFKVzGVzykgXj9XDSbjhvOHJeeqbp5UKcJV5h33vpyzavNyJpYJcj
	PyFmBKXSbJHk1UrNttNBzeL8/1eY3LcZ7UzTpvok6s0hJeuOLC6wvK2bks+kPv7++uHx8TAR1RG
	iH3/nIPqmtD02dppoG2Uz3TKI+FTjzaAEDmOYiW5TBsNw7LUNL1kwgEv8KMb1SrGgXYvH2SIMQY
	d71zUUFD9eiQ/DAzta29CBVw2yS1DGt0GsB9dQmnayh63k2Uw0o6J1
X-Received: by 2002:a05:6122:1795:b0:56e:e80c:bb25 with SMTP id 71dfb90a1353d-56fa5a9dd17mr699227e0c.13.1776406344185;
        Thu, 16 Apr 2026 23:12:24 -0700 (PDT)
Received: from localhost.localdomain ([102.244.98.124])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9589093a8bbsm297947241.3.2026.04.16.23.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 23:12:23 -0700 (PDT)
From: Delene Tchio Romuald <delenetchior1@gmail.com>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	luka.gejak@linux.dev,
	hansg@kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Delene Tchio Romuald <delenetchior1@gmail.com>
Subject: [PATCH v6 3/5] staging: rtl8723bs: fix out-of-bounds read in portctrl()
Date: Fri, 17 Apr 2026 07:10:46 +0100
Message-ID: <20260417061048.62484-4-delenetchior1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260417061048.62484-1-delenetchior1@gmail.com>
References: <20260417061048.62484-1-delenetchior1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In portctrl(), when 802.1X port control is enabled and a non-EAPOL
frame is received, the ether_type is read from the LLC header
without verifying that the frame actually contains enough bytes to
hold the MAC header, IV and the LLC header plus two bytes of
ether_type. For sufficiently short frames, the memcpy() that loads
be_tmp reads past the end of the receive buffer.

An attacker within WiFi radio range can exploit this by sending a
crafted short frame. No authentication is required.

Validate the frame length before dereferencing the LLC header; drop
the frame if it is too short.

Found by reviewing length validation in the receive path.
Not tested on hardware.

Fixes: 554c0a3abf216 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Delene Tchio Romuald <delenetchior1@gmail.com>
---
v6: drop the unrelated cleanups (ptr = ptr + X -> ptr += X,
    ether_type inversion into direct return NULL); the patch
    now only adds the short-frame length check before
    dereferencing the LLC header (Dan Carpenter).
v5: return NULL directly on the short-frame and non-EAPOL
    error paths (Dan Carpenter).
v4: add Fixes: tag and Cc: stable (Dan Carpenter).
v3: rebased on staging-next; sent as numbered series with
    proper Cc from get_maintainer.pl.
v2: rebased on staging-next (v1 was based on v7.0-rc6 and
    did not apply).

 drivers/staging/rtl8723bs/core/rtw_recv.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index e30617875a69d..b476f7a03a234 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -539,6 +539,14 @@ static union recv_frame *portctrl(struct adapter *adapter, union recv_frame *pre
 
 			prtnframe = precv_frame;
 
+			/* Ensure frame has LLC header and ether_type */
+			if (pfhdr->len < pattrib->hdrlen +
+			    pattrib->iv_len + LLC_HEADER_LENGTH + 2) {
+				rtw_free_recvframe(precv_frame,
+						   &adapter->recvpriv.free_recv_queue);
+				return NULL;
+			}
+
 			/* get ether_type */
 			ptr = ptr + pfhdr->attrib.hdrlen + pfhdr->attrib.iv_len + LLC_HEADER_LENGTH;
 			memcpy(&be_tmp, ptr, 2);
-- 
2.43.0

