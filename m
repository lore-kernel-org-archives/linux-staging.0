Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7D12771E;
	Fri, 24 Mar 2023 22:23:16 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id q19so106074wrc.5;
        Fri, 24 Mar 2023 15:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679696594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bmc+Yh3XTUiALV4q5vVltlntUVE9IZwmAKsrbcMIn8E=;
        b=aWxGS61g8iTvs/jCZu60IzW+7tzq2LyJwA0C2wj/JTxwMq7Zs2VTNdvqTZm1/tLESI
         2DxRQ9Ly/VdxXHQ7iMJNeq2pepUZjJfPCpZOCMvhGkkcREVN3p/UaM+Et4yGJ9EgCu4A
         JXzj5Ls3pKklSFuzkxyx+g16m5Fffi78htPhx/CmUY3dSfLmM6T0YIaqTFR/Atr3+Uko
         vg48Kr2FwUpUvVtkDn2zXWe4pS6NW0CEp00DyTa7XZDL4bFYliRNszXVieJ6Yu/jG1IZ
         LvqIhyP5Tl6LstMdGT7/ylh1oxPdQjkLmR/US43/cX4gPoHbrBIhG6O6KMc34xt5qa27
         xfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679696594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bmc+Yh3XTUiALV4q5vVltlntUVE9IZwmAKsrbcMIn8E=;
        b=Y15f9KLZ+3ZOepM5OarfHyHV0et5coJN0YiAcb5A9iph96xuCV3WNrLUNvwW44AjAL
         H8xP/wELaRmwLhICluHX78VCHp6i2U4zlbH/7JetoF7TPS4Y/ipmOfBU8dR0DV7ifRfi
         nfm4b9bTc9VxtlbHa7Ry1iwPM7s3NZ0/FoyP4L5Zr1SJE3T0hgmBMUPBF0TZVVvKRvVC
         IuPD18D0gIec7/8P/JUW52C2TfjUHO+5512K6dWOEPHhMhBpbjBNOVEeWwsfnFJXtuiS
         g5qrHE+xBPAFSDcoiuSG/R+1qUMJtQyyIQ2hspC2LqV3NhTCHgtdTW2UrBXiQk7R+Snj
         Z+Jw==
X-Gm-Message-State: AAQBX9cCJzq9GSXagGF1vpIwRcQgyzqExrBh1DrTnhnz+lS13nXvtsPb
	LBg/RIMmQu8BU87hB0Z4xQP1R8UqETt+GQ==
X-Google-Smtp-Source: AKy350bJk9DDB8yV4yakIr9ZUylqIt7VlEZDFfJEKYzJL+ZwIN5MTOHwRARrBy5IS3fsalvCk7gmzw==
X-Received: by 2002:adf:ed04:0:b0:2d7:82ee:c9ce with SMTP id a4-20020adfed04000000b002d782eec9cemr4236374wro.20.1679696594343;
        Fri, 24 Mar 2023 15:23:14 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id m8-20020a5d4a08000000b002c3f03d8851sm19161446wrq.16.2023.03.24.15.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 15:23:13 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/4] staging: rtl8192e: remove blank lines after '{'
Date: Sat, 25 Mar 2023 03:23:04 +0500
Message-Id: <e7cd8152e6986d361f81289868040889224bd1bf.1679696291.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679696291.git.kamrankhadijadj@gmail.com>
References: <cover.1679696291.git.kamrankhadijadj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary blank lines after an open brace to adhere to the
Linux kernel coding-style guidelines. These issues are reported by
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

