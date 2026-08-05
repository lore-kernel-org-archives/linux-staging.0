Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A17B41F5FC
	for <linux-staging@lists.linux.dev>; Wed,  5 Aug 2026 10:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785926125; cv=none; b=IW1pL0pAVG+1W3dnqNuliY1fW53p3/wp63sojiTk0dbkrw++5SO+YPG1pxO0+9FliQd17f7doZyKPex6nSX6zxVIzbpJ4Sycpg4ILdY5cooLamRg3a6k7rtX5QkcmLqMcnGrbKFbvFczLWgdnm0IxXm7yq2yf/xe0MhVc6eMa1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785926125; c=relaxed/simple;
	bh=pPcKFb/bDrq0U7O6dzjEsN6I0EAi6f0DvRMmgTUOmBo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CpjTsKeTKtJn1ZyJ48Gwx3R6GGMPuAYilXNrsI1gvJuZDsVpryndk4ZbeSLgTFwC3ZEdqqIpuLVJxzqpa+S1ym6RQGYCuBggn1rkfCimX7g4RGuZGs6gIUexPzw9vMW+mYGEhEQwNeDak3RYWzZ8RYRnAm9qMvmqHTR1CxUZXFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHQfc8BD; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHQfc8BD"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84862b0d5f8so747671b3a.3
        for <linux-staging@lists.linux.dev>; Wed, 05 Aug 2026 03:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785926118; x=1786530918; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VUiYD5Ty0lkfuVaxexir3FbEWpD7cGVs2s4Tb3JgAs0=;
        b=QHQfc8BDRCxBLFd7rKr24mR6NZhNkzOzy+2l1T6/KZX5GVJuQi+DxUOyBhW0+EJeZW
         KOEFvDnieEJ2hlv4OHQFmNg9b8GxXkusKBIXMqdSdsAPa+6SKZX+clWUfwTb4af7tskK
         Xm9SNJYT9d60e/xs881WfcVSXf86vDHT+vh9PNBoh4JGqkiNJngLcPjYqqac9QdhaEnp
         frL+9EVbGiM5pMPRjrSJm2R7viTsGaJRnPddgEKCa/oZlgTxL5afLuGzgVkTs2Xwxnfo
         83q3jOgvj5sVgnpQmaeTwIm4TPGZoiIv93Oc+3HZwSm3JOipdlG7KhwdBo/oCwWxaMBS
         i/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785926118; x=1786530918;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VUiYD5Ty0lkfuVaxexir3FbEWpD7cGVs2s4Tb3JgAs0=;
        b=EbkdJux7odXo0JmsbceTx3Dc2g2LNaU3PUuLCJISWq9bgMh8/pe9Eq4qf8PfCKmV0k
         MqRfBhQyL/Or2vTQ6+C9TSXTh159LRwPZyR76l8tSqYJBN8Rp0ZA6NbYgZ2/hHq3GzmA
         kebw0JeQ1OlrhFbIXGeEC0BbbYXC0O5sfCyHUYPrYbDZFPHMfBz2GSxfuvO5DtVdlm7U
         Q8bBaZa3tFzjgTrRr8MdOjuaOcqJxVqC/WK082oQMHvL/Gz3G2CqQvK5E0wkHOFOAE9d
         xHj0vTSzRsOSD5/VeSmIX9QhpcBCiT6fLo53eJX0z4+2mxfItHTDwohbWerU1LlPBKc6
         VRpQ==
X-Gm-Message-State: AOJu0YysSj+F45wiKZ37WmTrDyNyfS7ihoOGlUAnBlXiLNX/6828JE74
	8wfgktQPSYTvvwX8PF9NUmAFszeDTLq7DIBBafaNjBF0X3zk3reRnvjI
X-Gm-Gg: AR+sD11VsL2pMuBoXaWhw5kwdIldpwWVUmaSenYLxsUMg1t9zeYCtUHmGccafz9XG0r
	78tOCJ9pAnkMOAya7+Y71srJRvbGqf9IL6if8wAFcahE+P5YrHTywuOLz0gzAXBEG8gwwuLlDDg
	0/5fRWk8CxlrNKmuTbkzgubNqRIE5E2QSZwfjr8dDfsLGg5usdtyDok3vX5fpf6s9ZQRbNhkYfs
	x9zjIbJ3GCJKJ3ScxJuGWRRR+tkQIrDdvEBJWen8KYHm8yLWsZqn+sRw2TYCat344JIsFViptOb
	S/M5bwkHKw+I+pyFt4k3YOQdvZsweEIykTrwh0mgRTvjFUrS+tOTRjL+cd4gJDKqtugRDhNGAUl
	jFQ7TewMCzLqh1o6+j8N41Hifh8GJUUZPEiLD2k22zAEhp8+IQcsIlMdGU7nfGfaepNsA1Sxkgi
	LqVQkcHD9u1z76cIvLjG11ii1v43K+P+H6eL2euyYvkQX/tH7e2JpKobOfug==
X-Received: by 2002:a05:6a00:12c9:b0:848:4a48:9f9f with SMTP id d2e1a72fcca58-84f2e0c9c9bmr5317224b3a.34.1785926118337;
        Wed, 05 Aug 2026 03:35:18 -0700 (PDT)
Received: from eos ([103.89.26.202])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe70902224sm1266683a12.25.2026.08.05.03.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 03:35:17 -0700 (PDT)
From: =?UTF-8?q?=E3=82=A4=E3=83=A0=E3=83=86=E3=82=A3=E3=83=A4=E3=82=BA?= <reza1234khan1234@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	=?UTF-8?q?=E3=82=A4=E3=83=A0=E3=83=86=E3=82=A3=E3=83=A4=E3=82=BA?= <reza1234khan1234@gmail.com>,
	stable@kernel.org
Subject: [PATCH] staging: rtl8723bs: fix OOB read in rtw_restruct_wmm_ie()
Date: Wed,  5 Aug 2026 16:33:44 +0600
Message-ID: <20260805103344.172115-1-reza1234khan1234@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The IE parsing loop in rtw_restruct_wmm_ie() reads in_ie[i + 1] (the
length byte) and, when a vendor specific WMM IE is found, copies 9
bytes starting from in_ie[i], while only guarding the reads with
i + 5 < in_len. When the IE section of a beacon ends with a single
byte remaining, in_ie[i + 1] is read one byte past the end of the
buffer. A crafted IE with a short length field can likewise make the
9-byte copy read past the end of the buffer.

Validate that the 2-byte IE header and the declared payload length
are fully in bounds, and require the WMM IE to be at least 9 bytes
long so that the copy stays within the buffer.

Cc: stable@kernel.org
Signed-off-by: イムティヤズ <reza1234khan1234@gmail.com>
Assisted-by: opencode:auto/best-free
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 1196ec011455..222eb380500a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1965,8 +1965,18 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 	while (i < in_len) {
 		ielength = initial_out_len;
 
-		if (i + 5 < in_len &&
-		    in_ie[i] == 0xDD && in_ie[i + 2] == 0x00 &&
+		/* break if the 2-byte IE header is not fully in bounds */
+		if (i + 2 > in_len)
+			break;
+
+		/* break if the IE payload declared by the length byte
+		 * extends past the end of the buffer
+		 */
+		if (i + 2 + in_ie[i + 1] > in_len)
+			break;
+
+		if (in_ie[i] == 0xDD && in_ie[i + 1] >= 7 &&
+		    in_ie[i + 2] == 0x00 &&
 		    in_ie[i + 3] == 0x50 && in_ie[i + 4] == 0xF2 &&
 		    in_ie[i + 5] == 0x02) {
 			for (j = i; j < i + 9; j++) {
-- 
2.55.0

