Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 122B1BA44
	for <linux-staging@lists.linux.dev>; Wed, 22 Mar 2023 22:07:42 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id y4so78999660edo.2
        for <linux-staging@lists.linux.dev>; Wed, 22 Mar 2023 15:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=seecs.edu.pk; s=google; t=1679522860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jRIhiCMIYhlzOxpqNUvBzZ/DfwkIA0+Cejq18uIa0y0=;
        b=Vayg/s7IU/T//J5ygUx8W93dQ1yMAPQ6wpM2Kml2UBPoShghd2Q1Adkx1mGiBLsoFF
         8vgEMzcKqQvSI1+sU6tw2/oEXAoFs9eWPhKz4WvITlv3igw6d7xUgfzdeldDQmvJ4bFk
         7srUtmt3rCorsT74+qfCVk4YsUtBPPOaWSI90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679522860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRIhiCMIYhlzOxpqNUvBzZ/DfwkIA0+Cejq18uIa0y0=;
        b=UUBvwd2h9QVDjY0APxkgMFFTIO3BCAuR9gQ65S5D4YoJERJhDLTIFPrv/jiBzKl6PQ
         mBFoG/Dgjkdp013pVEBT0oPFXI6S+ApW3jZKSEHMnG5+KwZ8g9/PlLEUuc9Rc7d6s1GD
         ZOPHmp7+OTy6qXYWGOZyG3rSkleDhEc92CrzfMkemZKa76AE+srHDG/UW8TuR8Mytghc
         Imj5sCEAYVyEqgGsJlrOqGCEpOwVIiN3sOKgDKW65gEnny1hLEJATCFKerBYZdVIZgvY
         j6giBxpjHQtDNEVbatKDFwy6wT4ILO9mpK98Oc1fE9etqWy6s2WMdaw8GlG0ywd//Dtt
         bKxQ==
X-Gm-Message-State: AO0yUKVvOUDCNciS8+GEbN7+w60ULe+0JOGNY8q5SjcgsUNM7REZ+NHe
	kpEZKX4bIw5mI9tagl3i5ACAdEt0TVsUZ4b22XE=
X-Google-Smtp-Source: AK7set9u8/YsDflK7FkGY0lgh0NX2peBT8VOq+aLiQWweYgWgxpaMlUnP2iQj3cQuGG4PHMysrb/1Q==
X-Received: by 2002:a17:907:b0f:b0:930:e634:3d52 with SMTP id h15-20020a1709070b0f00b00930e6343d52mr8203320ejl.24.1679522860416;
        Wed, 22 Mar 2023 15:07:40 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id v19-20020a17090651d300b0092b86d41dbasm7787935ejk.114.2023.03.22.15.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 15:07:40 -0700 (PDT)
From: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
X-Google-Original-From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khadija Kamran <kamrankhadijadj@gmail.com>
Subject: [PATCH 4/4] staging: rtl8192e: remove blank lines after '{'
Date: Thu, 23 Mar 2023 03:07:04 +0500
Message-Id: <303a41480220a6c31cee91d40ece40b3fae3bddf.1679521517.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679521517.git.kamrankhadijadj@gmail.com>
References: <cover.1679521517.git.kamrankhadijadj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary blank lines after an open brace as reported by
checkpatch.pl

"CHECK: Blank lines aren't necessary after an open brace '{'"

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index f627dfe66d90..b649d02dc5c8 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -1167,7 +1167,6 @@ static int rtllib_rx_decrypt(struct rtllib_device *ieee, struct sk_buff *skb,
 	if (crypt && !(fc & RTLLIB_FCTL_WEP) && !ieee->open_wep) {
 		if (/*ieee->ieee802_1x &&*/
 		    rtllib_is_eapol_frame(ieee, skb, hdrlen)) {
-
 			/* pass unencrypted EAPOL frames even if encryption is
 			 * configured
 			 */
@@ -1207,7 +1206,6 @@ static void rtllib_rx_check_leave_lps(struct rtllib_device *ieee, u8 unicast,
 				      u8 nr_subframes)
 {
 	if (unicast) {
-
 		if (ieee->state == RTLLIB_LINKED) {
 			if (((ieee->link_detect_info.NumRxUnicastOkInPeriod +
 			    ieee->link_detect_info.NumTxOkInPeriod) > 8) ||
@@ -1552,7 +1550,6 @@ static u8 qos_oui[QOS_OUI_LEN] = { 0x00, 0x50, 0xF2 };
 static int rtllib_verify_qos_info(struct rtllib_qos_information_element
 				     *info_element, int sub_type)
 {
-
 	if (info_element->elementID != QOS_ELEMENT_ID)
 		return -1;
 	if (info_element->qui_subtype != sub_type)
@@ -2696,7 +2693,6 @@ static void rtllib_rx_mgt(struct rtllib_device *ieee,
 		ieee->last_rx_ps_time = jiffies;
 
 	switch (WLAN_FC_GET_STYPE(le16_to_cpu(header->frame_ctl))) {
-
 	case RTLLIB_STYPE_BEACON:
 		netdev_dbg(ieee->dev, "received BEACON (%d)\n",
 			   WLAN_FC_GET_STYPE(le16_to_cpu(header->frame_ctl)));
-- 
2.34.1

