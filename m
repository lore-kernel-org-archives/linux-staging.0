Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2081BC39
	for <linux-staging@lists.linux.dev>; Mon, 26 Feb 2024 03:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708919796; cv=none; b=tdU6zSONOQfS77BRJUGrYiH6lHNvZ8Uve1xGrne0wZl/qCP0MYjOvd2ACPlkeR73d5ihIVaeu+ZUSsZfz2Tp+/7pcOWe5lt43N4L5ybCWrgMS6qt/5oC/MV8pTWZNUsvA/+Tzl150TAQZegCcX/cC6/dsC1qKMgJwBhcVTo9ZeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708919796; c=relaxed/simple;
	bh=Zhnubnov9j3g8AyIMp9VZ9sMhMszfUL6EZW6yyAZ+50=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WKuW8z7LjXZ1VCuABAnBuORdlU0BFrvhhttk4k3S7eB963V5GTJysl7u0QhfjbyzyB/4fXUpACdPAC2AywvzfqLSZSz2jNJwpaTQ5bHbp/50Zk6G0aIhUhEbGWpB66BFlTSlcP2vmlSpUKuFPLgO7YNkbUpb6Knlat2N2n2R1Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=RxbZWAyj; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="RxbZWAyj"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-5d8b70b39efso2838104a12.0
        for <linux-staging@lists.linux.dev>; Sun, 25 Feb 2024 19:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1708919793; x=1709524593; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JY8iqPJEK5oTs16X2+XchY8uGKTkL/eHXG4E9OI6Gb0=;
        b=RxbZWAyjSVUUEDExuwpq1+MN+VTMIucAEk7fp0aF+YPUCWEbmFtuNiqUdoWU2EDatB
         DcRbcO361o6Ivb/HZC50wzSFJ3lwTdk4McIsljYhjYR0NYrU1fw+S4kUWTfEv6alS7DT
         BpQn//JreC6Hjk7pCvQvHyABaT4cSZyepZFgoJ7WppTGpMrGuvirhhNSE2uxeIGbLcUl
         SiWdUwriHEnf24AYhvNKYcznLDCz69gneeA3ZsKdDgZO/I4AaCOrNyMDemT54sd+7QVR
         rvJBUD12sSbcTO4Tbj8pnx7+MjZn1ND16ysOnH3ajyWg7/3r7YYESlxqDFd6ZrsS6jKw
         o65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708919793; x=1709524593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JY8iqPJEK5oTs16X2+XchY8uGKTkL/eHXG4E9OI6Gb0=;
        b=uYmAK9K3GxZlw5eD0TG6Lji87PfrcND8yqynLvqd0J0CMOSAaVf1m2FiUbESMih4IW
         6q6PN2qfuz89eQKuu6JV6e6OPWOG1aOPc3kAJ9Q4Yk7b+IRxqKJTqOVe5YKcZxs2nzwi
         vsJF62tiZxYGjyPCmC1MPWaeYa11fEABb921SbTZKM2kWNfB9NvbLXGqJWSz3VDDs2ir
         uBMjL3LMei8jyMZz9qQAG+K4nc0Pqu2IVjZSvGZlq+HNPaeDZD17hDxMWA2+4Vq4Fl8U
         m4ZuZTJYuG8DJvO7gdIEIYI/rqIGtrYMh/pPNNeFBm98CSsc36rUjx7repG8re6nGUur
         6HCQ==
X-Gm-Message-State: AOJu0YxfbnxOKq+v0IglmEf3R7ZhLEBMP5sk9u7pIJSbls8W6IL1iLzu
	z3eNjauXaasgLFbfWnNWtWWZwHgFaAW0FJ5xtMOd2wI4oMSYdJH+D+26YlUB/7Q=
X-Google-Smtp-Source: AGHT+IEIsn5Gewpg8fz2lFyYRp2mnbqWiLpuKPdbHy/ZoVTu+qMSgu72cb8S8exg4jEBltJKJYGFzw==
X-Received: by 2002:a05:6a20:9c89:b0:1a0:dfc8:9204 with SMTP id mj9-20020a056a209c8900b001a0dfc89204mr5098142pzb.2.1708919792922;
        Sun, 25 Feb 2024 19:56:32 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id kh5-20020a170903064500b001d8a93fa5b1sm2897615plb.131.2024.02.25.19.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 19:56:32 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 06/20] Staging: rtl8192e: Rename variable osCcxRmCap
Date: Sun, 25 Feb 2024 19:56:10 -0800
Message-Id: <20240226035624.370443-7-tdavies@darkphysics.net>
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

Rename variable osCcxRmCap to os_ccx_rm_cap to fix checkpatch
warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index 9255eed85141..fd4bf3486804 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -840,15 +840,15 @@ rtllib_association_req(struct rtllib_network *beacon,
 	if (beacon->bCcxRmEnable) {
 		static const u8 CcxRmCapBuf[] = {0x00, 0x40, 0x96, 0x01, 0x01,
 			0x00};
-		struct octet_string osCcxRmCap;
+		struct octet_string os_ccx_rm_cap;
 
-		osCcxRmCap.octet = (u8 *)CcxRmCapBuf;
-		osCcxRmCap.Length = sizeof(CcxRmCapBuf);
+		os_ccx_rm_cap.octet = (u8 *)CcxRmCapBuf;
+		os_ccx_rm_cap.Length = sizeof(CcxRmCapBuf);
 		tag = skb_put(skb, ccxrm_ie_len);
 		*tag++ = MFIE_TYPE_GENERIC;
-		*tag++ = osCcxRmCap.Length;
-		memcpy(tag, osCcxRmCap.octet, osCcxRmCap.Length);
-		tag += osCcxRmCap.Length;
+		*tag++ = os_ccx_rm_cap.Length;
+		memcpy(tag, os_ccx_rm_cap.octet, os_ccx_rm_cap.Length);
+		tag += os_ccx_rm_cap.Length;
 	}
 
 	if (beacon->BssCcxVerNumber >= 2) {
-- 
2.39.2

