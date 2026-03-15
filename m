Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73496370D70
	for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 21:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773608772; cv=none; b=E0Q2OV54DrIVLmkYc45IVxBS5k0So4zS3a46lpjBBq4H0kP75gkAzCBKE1u+Ek59JyT998jvnL2dYuJj3hUq4Mf2WQV+kYXfvWDe1Q2v1qL9UMvmccRqpVvPR4GRAV6UGKqB/E9I8IFTBGRoUxfA2CkOFBgoWkdjE85I1hDM0N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773608772; c=relaxed/simple;
	bh=ORJ4rscuuIawNtI4GPO1EVEu5tcsSDq0QVd96Pbwsqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FRg06Mxe5NKmZzVfpZ1licm4AqnEchwD3ly6N7DrwyIDJet3AqxARNOobFOFGK/ADMeCbYhjNrBFppnjsAEGA36CXjhPcKQPYTfLFUC7P5INTGlG9v0HtgT2dxs9iubqFk1FrKfoNRQzaT0FvrYfOkF8duYTxvYgBNrMxShNTvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TYEeWbZ4; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TYEeWbZ4"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8297e0b27e5so2367566b3a.1
        for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 14:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773608771; x=1774213571; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=akRjWY59n5sMvUNDaGckavPhAPsTROKRG/B6t9OT1vw=;
        b=TYEeWbZ4NtxG5SR2iHAeVvbX9Er0nzxGxIfRAYmoE9mSbqBLws7rqeIcmxpNhB7g+b
         HENsPC/E/7h2XCgQdgAoIZ7YB4ZoDE/IN5JLBekUpoJYX7809CgABIjLddvmWGdqx/X1
         a6hAjIdTa5aX37WwNlV88UKVVfevixSr8Lc/jS7Zi/1ysMCeSiS3V00IeVDWX/nnRxQu
         GxsgEnW6ZMOQY74xkmJCWQ8cg23S/VYfDjYxmqkrO0Gaat8Tda2rwKEA3RKFec5MnZZ6
         OPy2OXgABlQjk1A9032rQWMA1GhBeFbf1Sszy/2avqh0yGpU+Es6SKMb8WZVO3TygUw/
         juhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773608771; x=1774213571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=akRjWY59n5sMvUNDaGckavPhAPsTROKRG/B6t9OT1vw=;
        b=j2UcRZHFZXE9D3vBszpTssmuTE7cFoaxSh0xIJvu02ynKg6+wDPDo1DvfchJZbrRBU
         xGFAegH6YaBpA27eO8hBT6/YMARhfWzd1YU/4DjzP+ZAGuiBvYbxsHqIchufjk9j+AOy
         9tlZoyx62QkFjFoLBY2W6rrUlWRSpRDw44hVVCOVqi3h/Tfv1Ke85y8QiSHbcLGg4rJV
         QEcYJ0O+KRHbJgmWdIWU10vNodBV3AoKOhYG7UDIHE19BIqXw0vN8IKf02RlpWSaqC3N
         DHYo8HOnjufLEOJ9ecL5c5o/Ui6mbITnGBH+TUEjdShv8Kbg48DXxFf0eXGIWSNbARFe
         zPJQ==
X-Gm-Message-State: AOJu0YySTV7vKeAnE0mYw5lFdeq21D+tSDUknJqD5KmPFuJ2hs1fMV8J
	ECilB/OIb0qJ9w7YHeoCeGiH2i9GZdeol5LNwaFOEnXlUzY51A+C3uHv
X-Gm-Gg: ATEYQzztPWLiur9xb1L7HK4l/FIVVMbrGYe9fngS6a+B3Ny+Hx5kGd0pbOqZKEffwKa
	jg3YP9CAyCrX+ncUtHpVkQmHOHqsX8r2AfQijnyKAQfTsXdkD8hFiNpFAkXz7kmZXAT1x6vqGlF
	HfsKtp9sANuRvlTNMvinHLsssp/J2NijSlIblksBTZm92XAw4lN8A1gQvYmNjUire2kWilHxAmS
	SIGyHlT7V0Bi6oEJrLn4PJnbBXjlcNERjp7bIxKwgh3SeJiOfhm2wLkYq73pMnjT7NCJ3p/TYIR
	UuGT0CoHZEvwYS2LTLHXveymcYJPdweWIQ9qNH3eExDWfgjNBm6GN+Xi+JAKT7su/jXf+FNGee/
	48fPA8I3THd+uSLklI4rN0KH46zzRIHT3VvfTYVkqEQW0D5wDEEBweDvtBOaCJoABmPrvKpCdXN
	jXFF2iqhIs+z8wGEFbwyE6V/Lh/qqbqmF/E6qpAZIzEZ5Bn2g=
X-Received: by 2002:a05:6a00:1805:b0:81f:3c7c:8591 with SMTP id d2e1a72fcca58-82a198fb744mr9642802b3a.50.1773608770778;
        Sun, 15 Mar 2026 14:06:10 -0700 (PDT)
Received: from mjmachine.localdomain ([131.255.96.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0725e05esm13675506b3a.18.2026.03.15.14.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 14:06:10 -0700 (PDT)
From: Marcos Andrade <marcosandrade95963@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marcos Andrade <marcosandrade95963@gmail.com>
Subject: [PATCH v4 1/2] staging: rtl8723bs: Replace network magic numbers with EtherType macros
Date: Sun, 15 Mar 2026 18:05:49 -0300
Message-ID: <20260315210550.6058-2-marcosandrade95963@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260315210550.6058-1-marcosandrade95963@gmail.com>
References: <20260315210550.6058-1-marcosandrade95963@gmail.com>
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

