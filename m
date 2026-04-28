Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F66F37EFE8
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 09:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777367904; cv=none; b=NgrF+1rCfJS+agiDoDzVJW85sf9YhpLkIN4RIF+okCxKl0aacUjACKPln7pBpxM4c7ML8KBfXL5z4/6Yq/bpxtgzejSdT/7wDlQatYKMOFxGj1UeE1TYfSlpYQB4HUaC8YZ9j0zsAE85PprZlWjMUmXWC8mD22UaH9r4lkvlni4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777367904; c=relaxed/simple;
	bh=+YeUIV1+wtcPKuOvB4oPRVaxMCPwWFWxjyfdg1SSC4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OOAHCoUzeUkBTAgSd53gxzY0c6VegZJjGDsDU+UhTWttK6UAs5+aq5pfRwribCb9+V7PyCB5HycRyQbRGrmJXG8W/SjS9M7PRK7W0PtMIifyos0WsMYR7oUFUWC6Ci9e6MVlS+oChVeSdoKXUSI5WaEcncahxRhyfEnXuwRptTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DsLK+Xz9; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DsLK+Xz9"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-43eada6d900so10850927f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 02:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777367901; x=1777972701; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMczc9e1ajSbK4Mrr/Qq92dYlg6aGcU3H3gAe4DnWL8=;
        b=DsLK+Xz9FLztdZ7galngpqBqCGRY3LWzdjKc2PFBYjCobTvuhUYMUCnJ6eElmva1hB
         ZL22coat/0Tyg7boXcGQ+lrSCNGAwiA8pCJ7JvOU2WHVJaLZTlFDAK1503KqOTPtUyoI
         WwtWSpcLZM0/1rn0BQ9hyUTzwGCx2tvkytKDWWuVFCFtgnxCBgHllcKzM/jZUxStWt2n
         rp8POx4xFKwufmxiLiM8YWoX8vmNslaMGxe66IZ6L8qKrfavwwO0T/WUTYZis1LWF8Rx
         wS7RaqFAHZlSiaNPH1wD4NR1+Q+gN0mOXc5Nc5N07OGXboNhLxhVMuq+KrAAX7wf5kh+
         REZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777367901; x=1777972701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nMczc9e1ajSbK4Mrr/Qq92dYlg6aGcU3H3gAe4DnWL8=;
        b=kXWVXOwSq/ytzXlzI00UAIiJwbcQTRH/9C3K+FQ6XjOsa9RnwQ5IO5IZZk0W+c3lHm
         6lMkzOefurjiWTdhYJ8ZKpQXyGAOgSfCkGnJE9sLMUIjfryxprn/tODlDJ5NmzLzCb16
         dO/PER4F1D3cK/gboCrZo8L2jMPz9vIua7lpkNWpDq2xk/vWFJxiaN0y4LV1qZYxLtXu
         KYqNA6cxy9N+gqX3ProesMjdbEXy87ca+nB1rQmRtUZTkcrfG5v/Fwt9BZcIhn+pMT4U
         N78iQHCh3iLRTHQc7VZ/x6xIe6HCDTJySJ1a8mXaqE4ajgxPW8KHO473Cs/p0P04wHIW
         /zdg==
X-Forwarded-Encrypted: i=1; AFNElJ+mtPjMw7iXvPZRPTeeuQt1hQeUEtkMNS3z26G+oI/wZBNxnUgX8yFSKV83SUCGSE2yIrbnFEVk6QfXdzR3@lists.linux.dev
X-Gm-Message-State: AOJu0Yxs2hR1uPtfWA8NvmMBZRtXthW+tR1jWluQPOzsWFnXjVHv/UZK
	yJzbFfIbLQ++a7SX7y0vM7n4GvPdWoMJXu7YHslht9OIphr9s1iKq884
X-Gm-Gg: AeBDietvyqHDIrs+JNXOIF5bQvazOTvMae/1EdhMCqjV1NjkG0tTxhWgk+0Si9ZP5RO
	FRyMmDnRQpAPaIT69axxM5WpszAi+AuQBrpHX5aDE1fMLoTCyuUMr1GzwBzJdMPXnmAVIhlYmPr
	/JPc2AIiyMsX2o3+4jtzlefNujQ+t3HVCJFs+Y4dYSrNc68x3fhskc0g/4xdOzcLhI0qvrsR8oB
	n/dtOwaazZkYopDH3CFhwqomLvCMZJ0r8tGTVYABGm46kWH4cXk0eazna32sCSTRCuni7zr3HOn
	ReCFWrHA1Fo3fmFJPcBxYTF9BbcXTYEk9CMAZwuAO70xjE+pPQ8NDtCkf29GqVLiCxYwBrTKwjR
	K2e+DcNcVuyoTuYz2fbGUcuvHzi7HuPQ52Npc0qy3Hr5fHMj95T+hm18mXYRfvZtsEiN9yfsrpk
	xfIwe0xUC6irL3nQsUpofG56tKEokzRgaCMDspXOvMv2/IBTIB+GW53gljRemsIKBY43bB25fjK
	6Uosy0qIV8FPK4zi3GX7hAnLK/EdHyGYacyVMB0AVmf4Qinrkj9ZMH2/EUYusEPgsl+rQ8=
X-Received: by 2002:a05:6000:40cb:b0:43c:f28b:8863 with SMTP id ffacd0b85a97d-44648963530mr4196668f8f.13.1777367901404;
        Tue, 28 Apr 2026 02:18:21 -0700 (PDT)
Received: from ahossu.localdomain ([82.78.232.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4463d02f6a1sm4902502f8f.13.2026.04.28.02.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 02:18:21 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: error27@gmail.com,
	luka.gejak@linux.dev,
	hossu.alexandru@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH v3 2/2] staging: rtl8723bs: fix OOB read in OnAssocRsp() IE loop
Date: Tue, 28 Apr 2026 11:16:21 +0200
Message-ID: <20260428091621.739680-3-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260428091621.739680-1-hossu.alexandru@gmail.com>
References: <20260428091621.739680-1-hossu.alexandru@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The IE parsing loop in OnAssocRsp() advances by (pIE->length + 2) each
iteration but only guards on i < pkt_len. When a malicious AP sends an
AssocResponse whose last IE has only one byte remaining in the frame
(the element_id byte lands at pkt_len-1), the loop reads pIE->length
from pframe[pkt_len], which is one byte past the allocated receive buffer.

Additionally, even when the header bytes are in bounds, pIE->length
itself can extend the data window beyond pkt_len, silently passing a
truncated IE to the handler functions.

Add two guards at the top of the loop body:
  1. Break if fewer than sizeof(*pIE) bytes remain (can't read header).
  2. Break if the IE's declared data extends past pkt_len.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index c646dc2a1741..68ce422305ed 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1406,7 +1406,11 @@ unsigned int OnAssocRsp(struct adapter *padapter, union recv_frame *precv_frame)
 	/* to handle HT, WMM, rate adaptive, update MAC reg */
 	/* for not to handle the synchronous IO in the tasklet */
 	for (i = (6 + WLAN_HDR_A3_LEN); i < pkt_len;) {
+		if (i + sizeof(*pIE) > pkt_len)
+			break;
 		pIE = (struct ndis_80211_var_ie *)(pframe + i);
+		if (i + sizeof(*pIE) + pIE->length > pkt_len)
+			break;
 
 		switch (pIE->element_id) {
 		case WLAN_EID_VENDOR_SPECIFIC:
-- 
2.53.0

