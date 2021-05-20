Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427E471
	for <linux-staging@lists.linux.dev>; Thu, 20 May 2021 06:48:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5A7D561184;
	Thu, 20 May 2021 06:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1621493284;
	bh=/ULHtR4TqeRdRpXTs7tqChvGD52dOGrVljf5TQImA5w=;
	h=From:To:Cc:Subject:Date:From;
	b=Twuzil9Sd88E41Ieqf6GvPRTOHVO+vfaSUGqjvSaA0UUgHhPWZ2Ssg2lz39/4TfBi
	 XEuslwPHoYDruYlQKaYcVM8Fzm/JL+NXI1kRk6IKIdl2WI9KsveRrapc01kD1d1LPU
	 Ir++2X67+B6YqS/HchOlhTGyF8w6X0FdcgPkMPeE=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] staging: rtl8723bs: rename get_ra() due to global symbol collision
Date: Thu, 20 May 2021 08:48:01 +0200
Message-Id: <20210520064801.1961972-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Turns out that powerpc already has a get_ra() function, which conflicts
with this staging driver's inlined function (which is just picking a
byte out of an array for some odd reason), so rename it to fix the
powerpc build as that's the more important thing here.

Reported-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c | 2 +-
 drivers/staging/rtl8723bs/include/wifi.h       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
index 7c2680b6508c..ad803ffc0696 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
@@ -108,7 +108,7 @@ static void update_recvframe_phyinfo(union recv_frame *precvframe,
 				!pattrib->icv_err && !pattrib->crc_err &&
 				ether_addr_equal(rx_bssid, my_bssid));
 
-	rx_ra = get_ra(wlanhdr);
+	rx_ra = rtl8723bs_get_ra(wlanhdr);
 	my_hwaddr = myid(&padapter->eeprompriv);
 	pkt_info.to_self = pkt_info.bssid_match &&
 		ether_addr_equal(rx_ra, my_hwaddr);
diff --git a/drivers/staging/rtl8723bs/include/wifi.h b/drivers/staging/rtl8723bs/include/wifi.h
index 036cf57c65a9..23de3ab87f9c 100644
--- a/drivers/staging/rtl8723bs/include/wifi.h
+++ b/drivers/staging/rtl8723bs/include/wifi.h
@@ -234,7 +234,7 @@ static inline int IS_MCAST(unsigned char *da)
 		return false;
 }
 
-static inline unsigned char *get_ra(unsigned char *pframe)
+static inline unsigned char *rtl8723bs_get_ra(unsigned char *pframe)
 {
 	unsigned char *ra;
 	ra = GetAddr1Ptr(pframe);
-- 
2.31.1

