Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696EB72
	for <linux-staging@lists.linux.dev>; Sat, 15 May 2021 08:15:26 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id p17so506386plf.12
        for <linux-staging@lists.linux.dev>; Sat, 15 May 2021 01:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p2myGYY0cziyB2Ci5y2caQQe9yM5HE5UndBsXhuUUdA=;
        b=HWz5EW4lytfdAJkp5Euu1d4tmtWlZAMAUArBHbeM1lePTgWmTYF0+cD0IENgL4ugco
         D0OCRwENTS0aWD3Q1WLq1bpHz/oHbUKg371P0/0a/woiSkwHvOlH+mZE9DasB8VtLRtk
         rNFR7BC4zc7/kttAChiyuX3s1m8aMh+u9y+NHzGZH+TDHPp4noS6lst3wZsVp4EFhDkh
         S7i/0BkrUqoTedWsjanOY4FzwI0hEMFJi17YMumFx4xiykDqDl7cezUrdf433gueuHpx
         JMaZM9f3ax2VtfS8bPKUezAT3OceqQ/qOPrMr1Fk2qsSj92tAX/v165KSLsPpQkZyWRC
         /uFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=p2myGYY0cziyB2Ci5y2caQQe9yM5HE5UndBsXhuUUdA=;
        b=GWohXYcgWlYbO06fUPYSmolAPXQ0aqxG1NY2lsvWAIm1relj50lF7b3cPbXxvxRktX
         rgoOsT/+FihBCjXjJfn3PpZ9SyK0cPQvuqP7qPYgCUoLkGqeO8M1GVmQ+4RgNO9K6+GZ
         3xwgxpSQ6aH06zSkzOZW89IAgV+aUnebifAe7wrY4AQ9fW3QngTFqcaRv0//AGN0eDLk
         aqawDQ16/b/fmOWEmxEyAvuMKGjxsJpx54v1AVasMhvUGSxQcN65WLo48ZJa7+60i6bX
         MdFSoEoM3o4LqkAz6nII/ZA/fmI7Rz18MhQNPkoGIm6H1CWLOR9v1XDIzjamk+j9gjRF
         XeLQ==
X-Gm-Message-State: AOAM533iuRs6OnbLL67Qh2jA/iBxk9eknQU75bccvwdTzunUhZZGG4Os
	cxo3UAbcqN8nBckc8pLQwXI=
X-Google-Smtp-Source: ABdhPJzmvbkYAoM/LWw0+auTR8kwciuWbWxmAwLtdcz0IBgKxbYb9mVUFMNbVam22XEfnvskjR98cA==
X-Received: by 2002:a17:902:ee54:b029:ef:8497:e097 with SMTP id 20-20020a170902ee54b02900ef8497e097mr16983949plo.22.1621066525874;
        Sat, 15 May 2021 01:15:25 -0700 (PDT)
Received: from fedora.. ([2405:201:6008:61b4:4e16:5348:d963:c66d])
        by smtp.googlemail.com with ESMTPSA id b15sm5552085pfi.100.2021.05.15.01.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 01:15:25 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
To: gregkh@linuxfoundation.org,
	ross.schm.dev@gmail.com,
	deborahbrouwer3563@gmail.com,
	fabioaiuto83@gmail.com,
	marcocesati@gmail.com,
	linux@roeck-us.net,
	phil@philpotter.co.uk
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix coding style for if comparisions
Date: Sat, 15 May 2021 13:44:46 +0530
Message-Id: <20210515081446.676500-1-chouhan.shreyansh630@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Placed constants on the right side of the equality tests in rtw_xmit.c

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 7e3477a45a0f..b46646c74f2d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -645,7 +645,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 
 	pattrib->pktlen = pktfile.pkt_len;
 
-	if (ETH_P_IP == pattrib->ether_type) {
+	if (pattrib->ether_type == ETH_P_IP) {
 		/*  The following is for DHCP and ARP packet, we use cck1M to tx these packets and let LPS awake some time */
 		/*  to prevent DHCP protocol fail */
 
@@ -655,7 +655,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 
 		pattrib->dhcp_pkt = 0;
 		if (pktfile.pkt_len > 282) {/* MINIMUM_DHCP_PACKET_SIZE) { */
-			if (ETH_P_IP == pattrib->ether_type) {/*  IP header */
+			if (pattrib->ether_type == ETH_P_IP) {/*  IP header */
 				if (((tmp[21] == 68) && (tmp[23] == 67)) ||
 					((tmp[21] == 67) && (tmp[23] == 68))) {
 					/*  68 : UDP BOOTP client */
@@ -673,7 +673,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 			if (piphdr->protocol == 0x1) /*  protocol type in ip header 0x1 is ICMP */
 				pattrib->icmp_pkt = 1;
 		}
-	} else if (0x888e == pattrib->ether_type) {
+	} else if (pattrib->ether_type == 0x888e) {
 		netdev_dbg(padapter->pnetdev, "send eapol packet\n");
 	}
 
-- 
2.31.1

