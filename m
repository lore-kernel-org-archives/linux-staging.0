Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991751096F
	for <linux-staging@lists.linux.dev>; Sat,  1 Nov 2025 20:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762028194; cv=none; b=gprrTODMy9p6IlknvBc854WqSIa1wXEeZPxVcVk7Lyo2BFryD6oONJZGhhNURwdU5AqcCO2bwIa1gzw1UPty3/a4XFHQ8i+mtZ34qTXaRy6X45tnfqWfkiA3qThXwA1SI/WvkqfzvFJCUYZZh8dXIF6LOTmRQljmh9N0dauvAfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762028194; c=relaxed/simple;
	bh=NgY32jHrmDxujixjfxxUJsAupyyE1/qxQpZzA9u0gaU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cCp63A0RQWvHBvoXGo8ztqTunnZHlKZ340jqMolVav575NSROmHL398lCNvjdBgxt3kwNnySwOmIusVDUjvRZu74c2SelKg7IYCaSxPONPFOnUqJJdmiR0QWv3FVcYxB6V/fhochJl/1YWvED7eGUk01Z75wxEcxDEChRmTHYZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lFRZq5ZV; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lFRZq5ZV"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b704db3686cso702441466b.3
        for <linux-staging@lists.linux.dev>; Sat, 01 Nov 2025 13:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762028191; x=1762632991; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UY8fhAykEF/ZiZ4HL8RaS16ulFJ7StXJeVUPVb78F9I=;
        b=lFRZq5ZVSphAl6CkEreLtYcLTMBAv3/GNeVgnpPXHWJf/3yDLPB+RlakjqdKt9ljKI
         bBT/91xZa5L9snsYP709B0E51+VjM5zVmAV56K8veTnUrKY+UsaV0SA+i1Bc42nLyAVN
         Y16L1Kk0aolnUZz0W24qAQkuqcISFfadywPRc2RAgs8jlyYSzBOfghROQQ8Puc1WFhXY
         jXqU2XrOBDnkrzZP1lqbaWCi6LnyLYR2J3e88eDcikmwQV8okBg2NoAfrIFHyYpZVMhe
         FpY7VnLBycO/tG90kc1UQn8UYTrG0Jdn7oiEINmfW390WYsnVsqkqNKG7CS0LtD5uuuo
         v0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762028191; x=1762632991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UY8fhAykEF/ZiZ4HL8RaS16ulFJ7StXJeVUPVb78F9I=;
        b=Zi3/isiOo9wJX8MVUEJYgIT98Oytv2k2p2a1JI2HczvUZb6LLhhShnW1vaq/D9j3Eb
         eZeYR5y6KntcA19x5bu2LLHUHmwhkVSOLK3XQihDPcylVZ4BsrBLegAgAt3Odt3v9MWJ
         bZrgywxPJtFyAEznlrk/y42+ujMJvvOL9oYUC17VpyDJXii9gLPeL3bUnSk061gIiHsg
         C6CivTsSDt6+T4YOh5vTQX/EvBlVV+byYYK3ZfbSAmA0jvJWlu1xMJafy1fk3Z0RoJ9R
         vLXwGPa8xdpdxokIcGKkhZV7xWRhP75ZISukvNq99Ws9V7cGE7vpSPQOAZ+6xuSfxGlz
         afQA==
X-Forwarded-Encrypted: i=1; AJvYcCVpx2X02EIYK5o6GOzqlDDdDCT6iVWmqB115Dor5N0kBTv/RcnyIpGNGJuNiJIT3FeaT8KPu3lqE3hNbsXv@lists.linux.dev
X-Gm-Message-State: AOJu0Yxv/BU88QxtjAPfPH64n7wC3jVm0AGyzruwTlIUe+Z4y2g3XIk5
	1m44H9mrYAPbdeZgNtfpIC/qoJbkZJ0/pM3odJ+9BJqFiUBBTKeBtCOc
X-Gm-Gg: ASbGnctddgBCpFbLg7idW7g6BTBOYgnGxDTRCyeq6554gM8sVFeTKOG1URMh0ro1+D9
	KJn8UJYc2ZT2TctXiSD4fN3Z9/kVk9k+6JkTQntOmsSf0TwjpCCk7tq+291B0u2HQQ0IIzJnErU
	t2LfG6XX8C3IeUpwwUZccQhvEnD9s1oB5GXrysEAafwfT5pqOYG5Lk+2BQN9KzYXpFJuuU4EWqq
	oYpEGsQo+YS/mhxJzftoZre4zfGm/wTAfGQvcd5i4VcHGlxN3gpOGO4hUGniaR3kRMUXgSSRzRm
	v4LFif31g4mODijoc6G+/SEAYAEjEiG7XpaO1tarWIkXtTh7X2JMGuoOLpWE5AW4MC19YOuT6g1
	u5rxN97bjAjOLJL/C9vhOdlzC63iHhTgAww4zMthg3jj5oxBNbLEI6naNfWiOsdYarRhKjTWUqW
	5uzP8FDoizGTZDjX9qUrzHnfi8f5s82Z+JHQ==
X-Google-Smtp-Source: AGHT+IGB7pHaBILf2c3NpKvf8sojA4NRxzvgG1R2KvX/z/p98Y0bkh17Ok5v5PO2TCOEk6VdJjPVag==
X-Received: by 2002:a17:907:972a:b0:b41:2fd0:2dd4 with SMTP id a640c23a62f3a-b70708738f7mr755907566b.61.1762028190523;
        Sat, 01 Nov 2025 13:16:30 -0700 (PDT)
Received: from localhost ([2a02:810d:bb0b:f200:c13a:3288:7fab:6ade])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7077975cfesm539241466b.4.2025.11.01.13.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 13:16:30 -0700 (PDT)
From: rafiqul713 <rafiqul713@gmail.com>
To: netdev@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	rafiqul713 <rafiqul713@gmail.com>
Subject: [PATCH] [PATCH] staging: rtl8723bs: use ether_addr_equal in rtw_ap.c
Date: Sat,  1 Nov 2025 21:16:23 +0100
Message-Id: <20251101201623.185575-1-rafiqul713@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace memcmp() with ether_addr_equal() for MAC address comparison.
This is the preferred and more readable method in network code.

Signed-off-by: rafiqul713 <rafiqul713@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 0908f2234f67..7cfd4088ce8e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -6,6 +6,7 @@
  ******************************************************************************/
 
 #include <drv_types.h>
+#include <linux/etherdevice.h>
 #include <linux/unaligned.h>
 
 void init_mlme_ap_info(struct adapter *padapter)
@@ -1185,7 +1186,7 @@ int rtw_acl_add_sta(struct adapter *padapter, u8 *addr)
 	list_for_each(plist, phead) {
 		paclnode = list_entry(plist, struct rtw_wlan_acl_node, list);
 
-		if (!memcmp(paclnode->addr, addr, ETH_ALEN)) {
+		if (ether_addr_equal(paclnode->addr, addr)) {
 			if (paclnode->valid == true) {
 				added = true;
 				break;
@@ -1238,7 +1239,7 @@ void rtw_acl_remove_sta(struct adapter *padapter, u8 *addr)
 		paclnode = list_entry(plist, struct rtw_wlan_acl_node, list);
 
 		if (
-			!memcmp(paclnode->addr, addr, ETH_ALEN) ||
+			ether_addr_equal(paclnode->addr, addr) ||
 			is_broadcast_ether_addr(addr)
 		) {
 			if (paclnode->valid) {
-- 
2.34.1

