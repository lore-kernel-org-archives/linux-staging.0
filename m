Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372161CAAC
	for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 03:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708919799; cv=none; b=PVmwAmt1Mi1HjQZbVsgfaI1Egy88q35T+UaTfT+nXrAmVIbeXU0Z3l5QysAtm9BAM12RapGN5cERKTuaaiXjd0+ogg7XFbGJ4JJmw9JNvMEi9Y6rMi4sBHtuj68IFjnAPulU5OlOgHxy6yoFCtTd13UHCZ4tniAJGsWuDzjBwQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708919799; c=relaxed/simple;
	bh=+qXOC7uyNCfO3onc/Ij4YTWsCuq+NgWkyhuI5FVLo1M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sQeXbAiCeab4iARja/ZtBAsVnjQAkvmTXleC93kvQYDM8/POLU26dtVGonmLMVbmj9jvD528us4OETVbvEcln+TbNR/pkG8dabDtjDFQ6uV6UAAryF0QOSwy6PwAGULP2ZaW7V5LrMQJUvZU0M5Vu/IsL4px3+KGthJz8WERKuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=G988/Lw0; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="G988/Lw0"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1dba177c596so16000175ad.0
        for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 19:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1708919798; x=1709524598; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KsGpwW/IQSH0g2lIKg+JsO77ipE/Ng9n2y5WNXmPBxY=;
        b=G988/Lw0xb8MBZjpR/85w+vsLc0eI0jovQUbDVA3n2NnzpJpD1xwb4nPytNaP+UBzk
         TxAHzieaYLVA4ZL2kS3gjxjttfH1WfZgezgY0K74CicgJXbVPErtrcKGAGgYSp2cnquI
         V7wlGeK5kAXSainwGyGymdSkZU2EHgf3s/2jwjId5xeyj5BU9QFJ3JE9pEOSPOI6GrnR
         e4bDBscJn1VU3UdLIk8O8UFiZke5O2mUHIFgPsall5LcMeAvngkQNsvU2d/SP/pUlcN+
         dg82OOJAsNQXWaecmgi/BPKApCA8rOrUY5CbiE6ZkbQbfsqg8+/i0uSX0ggqb0E+mPQP
         ap/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708919798; x=1709524598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KsGpwW/IQSH0g2lIKg+JsO77ipE/Ng9n2y5WNXmPBxY=;
        b=julxszRvBhrFtuCw7ZLLsPbAcd9Ee6zO1BhpLKJ63/8IvOlAtILJ9zByKZwE1tiGg+
         YVq5F4DWSgg8+ZZjxZeBQ61afwi3QCyiX74hOIyZqMzojeG6GXgWyvY81O1M+HDIxyQ1
         TcfwRWMvmkHy1R+fxNyFTmWOi51WFD1EdFJZ6rmAYM/xB9RIFpI1H99xtXcSpB5UoREP
         LCzzt3VsHwPXbm6P8CEWIsNltf7bBLxYskGkH4WVMJ285nKt/DVuwkjNWMETGpjCc86V
         G0zicOaAuqMiscOpNjt3AtAHb9gjxHJ8to3H4Cf3aliuBcj75o/RmNW07+MDV6SsQcLy
         Lv6w==
X-Gm-Message-State: AOJu0YzL58DWa7gN7BexJ4OLtPjr8CjjKcV25diCfR82AtVg2SDzQx9m
	FKG8oW5ZQZs3qdhHs0gImUv3BiErXse9+EOGPOe1bFWIX0XJOUU3sVRhkQUKxeA=
X-Google-Smtp-Source: AGHT+IFyvxaV9n2kU65l431zMDHkO3AYTRqpmWx6fT26Kv0HMX4KdPYahVnwtwSKmypoNUvjILeFFg==
X-Received: by 2002:a17:902:b698:b0:1dc:a605:53fd with SMTP id c24-20020a170902b69800b001dca60553fdmr1110093pls.10.1708919797778;
        Sun, 25 Feb 2024 19:56:37 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id kh5-20020a170903064500b001d8a93fa5b1sm2897615plb.131.2024.02.25.19.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 19:56:37 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 11/20] Staging: rtl8192e: Rename variable CcxVerNumBuf
Date: Sun, 25 Feb 2024 19:56:15 -0800
Message-Id: <20240226035624.370443-12-tdavies@darkphysics.net>
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

Rename variable CcxVerNumBuf to ccx_ver_num_buf to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 61d4518dcd7b..4ab4cf6e1197 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -852,12 +852,12 @@ rtllib_association_req(struct rtllib_network *beacon,
 	}
 
 	if (beacon->bss_ccx_ver_number >= 2) {
-		u8 CcxVerNumBuf[] = {0x00, 0x40, 0x96, 0x03, 0x00};
+		u8 ccx_ver_num_buf[] = {0x00, 0x40, 0x96, 0x03, 0x00};
 		struct octet_string osCcxVerNum;
 
-		CcxVerNumBuf[4] = beacon->bss_ccx_ver_number;
-		osCcxVerNum.octet = CcxVerNumBuf;
-		osCcxVerNum.Length = sizeof(CcxVerNumBuf);
+		ccx_ver_num_buf[4] = beacon->bss_ccx_ver_number;
+		osCcxVerNum.octet = ccx_ver_num_buf;
+		osCcxVerNum.Length = sizeof(ccx_ver_num_buf);
 		tag = skb_put(skb, cxvernum_ie_len);
 		*tag++ = MFIE_TYPE_GENERIC;
 		*tag++ = osCcxVerNum.Length;
-- 
2.39.2

