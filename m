Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1AD19D07E
	for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 02:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773540611; cv=none; b=M2Mf5L7QZqKHPtX/baiXbjU0Epmzzc5g79BqufoBm7ji7BuYKoWMRKNsR52iCz7ivYgoGPT/1GBtd8GYq3LCpqmXwxYx8C6DjiWpmli6XWintwBaLvZowafgv0c2Iw1lSN++XgesWwEmWPigYtenhV7mxlhJEZEMJxAVZynEjik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773540611; c=relaxed/simple;
	bh=ORJ4rscuuIawNtI4GPO1EVEu5tcsSDq0QVd96Pbwsqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P04B6lWnrOjdjlb5poMgggElTZqLnJxB7f6KTa65K5UqZ6d2EdUaes9nn5FlVTbXsbIRCgqLXD4Q2fDub1drSeqZghwSBjZHGD+DH/T1KcE1HhES/TqniMlrKEWbglJqagC0mcqipPGQ9Y/O0KQTyK+D/PLIcMR5K6eOmqnL3ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nLVaHnPP; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLVaHnPP"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2be4781d2baso2045599eec.0
        for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 19:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773540609; x=1774145409; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akRjWY59n5sMvUNDaGckavPhAPsTROKRG/B6t9OT1vw=;
        b=nLVaHnPP/ybc+OCMUy4pMHe8jPpSMR+fL/Lf4NuwsIp1ZduUoJSTlpOX9SPszk4SHG
         RPRiMA2ZaxxFuRD5GFpNoqar6VL1o+B8EAY0PblRlwd65LlYGYB0yVHF0Lb0KfxCF8aN
         Tbt6RVDNWVmlf+VQGyaY0n1j++phJkLwS31m+zCFCY4w5y1bdQMneLh0iUarYHkcCltb
         m2L8VD5XdCxpm6iHKgd9wOZ68PRLMtIqh/q3yXwTg/VLzplKkxrdwM6/d4Gg8+n3CVL6
         wcCWeZaScc92QF8MIriEtZOliajeXIQYjOfjNnaDHJ5JpIu72f59wwOzQW0itVdE3UPN
         xVWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773540609; x=1774145409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=akRjWY59n5sMvUNDaGckavPhAPsTROKRG/B6t9OT1vw=;
        b=tYZu6I0z3lXusoVniTP2PAS0u7yxI3QXK75nF5aeStdXLSkRU5TmK4WngOrp4Po869
         +qhqpoAzmILx5LFoRltoTJMLulmz4ygaTrVgzgPAfYSL10dzMe8MbUMiB/275dFSqRcn
         JEHco3u6S7NikUTF2bW16fJjP/31HEPOIhuBnbV/6D/A6cpUjkXwtJCXYS0ZhnJn+gqA
         /fDHVqffcvF3ZD8kZAPmY6m2CRKfy22NZw745rWNbsC5X3KOyStEdaU1WsYHEh7rx6C2
         74BaNuY0rANKqBlLOVsEl7zbSUX/GGS1WF8rlRCzaaqsqwZRPaoqqE5olT9vY412y+Sl
         gFIw==
X-Gm-Message-State: AOJu0YwGz1aQIdrRXbSnaBc79BrrCjKJDy+fnng5LUVgmlJRP/RBAvYc
	yZzfFPYWxsuS83CmB7dDjMd95tAj6AATYAmDgHpgew7lhuEH29Wd5s4E
X-Gm-Gg: ATEYQzy/cTZV58jI6XaHAseyM6cfoaA211y3DNOmEtRVRP9H7vRhZJZ/Voz4iqKCY3w
	hpnOaPNDhAwApFA0DKWcRoXjK/6ooNHrVGtDGfYmU3xxEiBt876mgp+fiXfFTUJdL7hkuxjOioj
	kSIvK9fAa2V5DwyMFOTLrkeV++pWMKRXTIbOs9cDZVjtEyY7WN5ISa9jxsVXT3ujHpLKO9fRuFG
	0uaCPVdIz5KFzcJpEetIKTfVcHiqejkZ3fh06PkfYM9a9TIkLzzycYeS69oFA6bSdloKNR5qZOE
	sSjB3IfwJc0rLoy302q3XRWUnerlCrU2FbFyQc5g6M0RwvRP8Yf6DV4Q3GLVHnHxzjXxXC8j37y
	iwaOs4o1e8EtEmyIgQbU54pamlHIUTFo37FPPpLOd2YvGHpjr5zErzJ+fbegAYq3kc5SMy9dheY
	JkJQqO+vckMNP+ttwwhND2PvvdhNi6jmXOw3mENUSgFbGTM4U=
X-Received: by 2002:a05:7301:3f19:b0:2b8:66f3:2502 with SMTP id 5a478bee46e88-2bea5418f4fmr3867429eec.1.1773540609231;
        Sat, 14 Mar 2026 19:10:09 -0700 (PDT)
Received: from mjmachine.localdomain ([131.255.96.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab526f9asm11012192eec.19.2026.03.14.19.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 19:10:08 -0700 (PDT)
From: Marcos Andrade <marcosandrade95963@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ethantidmore06@gmail.com,
	Marcos Andrade <marcosandrade95963@gmail.com>
Subject: [PATCH v3 1/2] staging: rtl8723bs: Replace network magic numbers with EtherType macros
Date: Sat, 14 Mar 2026 23:09:48 -0300
Message-ID: <20260315020949.50149-2-marcosandrade95963@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260315020949.50149-1-marcosandrade95963@gmail.com>
References: <20260315020949.50149-1-marcosandrade95963@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace hardcoded magic numbers for network protocols (e.g., 0x0806
for ARP, 0x888e for EAPOL) with their standard EtherType macro
equivalents (ETH_P_ARP, ETH_P_PAE) defined in <linux/if_ether.h>.

This change improves code readability and aligns the driver with
standard Linux networking definitions.

Signed-off-by: Marcos Andrade <marcosandrade95963@gmail.com>
---
Changes in v3:
 - Included in a patch series.
Changes in v2:
 - Changed include from "" to <> for linux/if_ether.h.
 - Sorted includes alphabetically.

 drivers/staging/rtl8723bs/core/rtw_xmit.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 7b18be891..4062fe0c1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -5,6 +5,7 @@
  *
  ******************************************************************************/
 #include <drv_types.h>
+#include <linux/if_ether.h>
 
 static u8 P802_1H_OUI[P80211_OUI_LEN] = { 0x00, 0x00, 0xf8 };
 static u8 RFC1042_OUI[P80211_OUI_LEN] = { 0x00, 0x00, 0x00 };
@@ -2026,8 +2027,8 @@ inline bool xmitframe_hiq_filter(struct xmit_frame *xmitframe)
 	if (registry->hiq_filter == RTW_HIQ_FILTER_ALLOW_SPECIAL) {
 		struct pkt_attrib *attrib = &xmitframe->attrib;
 
-		if (attrib->ether_type == 0x0806 ||
-		    attrib->ether_type == 0x888e ||
+		if (attrib->ether_type == ETH_P_ARP ||
+		    attrib->ether_type == ETH_P_PAE ||
 		    attrib->dhcp_pkt
 		)
 			allow = true;
-- 
2.53.0

