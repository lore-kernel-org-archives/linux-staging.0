Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A700E1C6B4
	for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 03:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708919798; cv=none; b=ShyeH52pVQ8OAckDXGhku1Eg036G2xuiqr4simU9Y807UIqrWrN3a1fe9LfzHQh2gDr3nu4+4pBQpnv2mWK4jzZ2YdgG4HvtQ+t79t8NQYz7Xq3cjfDjOv8sf2KNi3vzh7/Rfpj04gexW3Qy+TqMNqoWDTIagPa8C+OYqKYK8kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708919798; c=relaxed/simple;
	bh=1u7hURa5SotBF7E39nq1ZuwEEo5Vll5q+P/Z5QRIR6Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SZSK7Jyv/2rTyUmzvfXb9fWV7TewZ8d5BZyUwPPy17lC4aPFQtR78iqqY3NN/7537/KGqN3JnFNioZlGn8zeerCvpOJib7NBDRA5EF5WP8iRUZ1b7RJp4P3n4hPtHur3IKP/i93BIX1OPvorRJeNhtF582vPbGRQ98SkTQxk7lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=EHz9vnNC; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="EHz9vnNC"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-29a430c3057so1100328a91.1
        for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 19:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1708919796; x=1709524596; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L6tGxskfEu9aXnzE+dB8cAliyoIBj16sQvq/Y/hZR3k=;
        b=EHz9vnNCfKdByAvDj4FjJecrfeIEDVQz9p6oEck4JY9B7nGjihOAP8qovrL5KquU5a
         43+P8+DJ8Owu/+qebgxatEKcy4l2fJaSZT1tvWQtyx/+FUu4wC/8wxJWMwpf8IAlB6H7
         qfe/QeeWGuWQKzIPcEJzpcLdPEOCKzUWiWUSN7qbK8zKNjuws4o3RD3APi9w1nkwvsx4
         azsEM25I/oJFMkJA8W0TrsKcmNZ2QXJ5NjDv9GumX4M9zsd8tg+Zm/yS2++BPFEDqu96
         LRDVLSJeFTT//ZToqnG0MQoWMobkuK8k60V8WVEAfWFraysbSGgfIiW2dAVSrwRX40hB
         aKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708919796; x=1709524596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L6tGxskfEu9aXnzE+dB8cAliyoIBj16sQvq/Y/hZR3k=;
        b=SmrlUodM5Y07xbSmUGfSMKRCqjsddFikpb/xhk6RMwZvhmfiBjJa/2T1v/xwDuBrHr
         +QGFVTbi8Ay57UD9rP0FjaSL03QvB7g4MZ8jceOcLuGyl6jOs1jHc+YkKI7xT0f4hyA9
         5tlf29n/KS7RwEmqKE68+J3PoL/KK5qYw3ei4Mxn40PdHxRGUo9R7atrs5/jlvgrq2Vr
         sCirC6j68m83EzN0vanUsIlIsaGFpSQdqso8U8qcoyWcQK5mk5H3JhKT/Hl1fAkx6Ogs
         bAUn0JxTuRMrML16rOnH5u6VJsoSzrto7e5mOezoSLPEGHo5OJhFR21tTZKq96aHmDrK
         vxqg==
X-Gm-Message-State: AOJu0YwG3jziWrdBa8cuMdgXloX1QMIP/BnOhQKdOsZI6XO1rMIZbHwD
	FzKnekuduRUR8n+a5B/TEG8z/aZ9Bda2ux0Ftt5zltO0xsfXYKdjMOHoK24U56E=
X-Google-Smtp-Source: AGHT+IEygXvZXsKKX+RteNlkEeMde3p8Sfrujz1Yi7Hukkoi2Ml7eVb7F0Lm5SkgsCA/cP2uI+YWgg==
X-Received: by 2002:a17:902:e5cf:b0:1dc:fb5:6f36 with SMTP id u15-20020a170902e5cf00b001dc0fb56f36mr7120020plf.32.1708919795919;
        Sun, 25 Feb 2024 19:56:35 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id kh5-20020a170903064500b001d8a93fa5b1sm2897615plb.131.2024.02.25.19.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 19:56:35 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 09/20] Staging: rtl8192e: Rename variable CcxRmCapBuf
Date: Sun, 25 Feb 2024 19:56:13 -0800
Message-Id: <20240226035624.370443-10-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240226035624.370443-1-tdavies@darkphysics.net>
References: <20240226035624.370443-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable CcxRmCapBuf to ccx_rm_cap_buf to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index db1a47ce3528..71583bcd8334 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -838,12 +838,12 @@ rtllib_association_req(struct rtllib_network *beacon,
 	}
 
 	if (beacon->ccx_rm_enable) {
-		static const u8 CcxRmCapBuf[] = {0x00, 0x40, 0x96, 0x01, 0x01,
+		static const u8 ccx_rm_cap_buf[] = {0x00, 0x40, 0x96, 0x01, 0x01,
 			0x00};
 		struct octet_string os_ccx_rm_cap;
 
-		os_ccx_rm_cap.octet = (u8 *)CcxRmCapBuf;
-		os_ccx_rm_cap.Length = sizeof(CcxRmCapBuf);
+		os_ccx_rm_cap.octet = (u8 *)ccx_rm_cap_buf;
+		os_ccx_rm_cap.Length = sizeof(ccx_rm_cap_buf);
 		tag = skb_put(skb, ccxrm_ie_len);
 		*tag++ = MFIE_TYPE_GENERIC;
 		*tag++ = os_ccx_rm_cap.Length;
-- 
2.39.2

