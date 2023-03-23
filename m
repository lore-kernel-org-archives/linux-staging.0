Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201818F73;
	Thu, 23 Mar 2023 12:41:57 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id ek18so85981850edb.6;
        Thu, 23 Mar 2023 05:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679575316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jRIhiCMIYhlzOxpqNUvBzZ/DfwkIA0+Cejq18uIa0y0=;
        b=YsRResv+/EI11pFUKv28iYf87fPzodJ7FzZRpMbbtBK9NxRuWP97dVWS2trAsAWjq3
         JKX36XXrg9hwR+RiPd5fEwCl6zW2Wh642ctovQP4owleX4n3EiOd94c2eWef+qhVZ4fz
         hJMpTs5Kv3JMpN/2vyK5XJ5QIHcI6NrT6uJL96NZM2hyPY50HUuRr4fUf+1u6ngdzldn
         sfVObj6QZVDCZ8+HtaPWfSLagsO0hpebwPKTFtJ8xMnY/WLlZN/zNiXx4who+c0WDwsm
         8bpp1FYVcYYdWoi6Tydjr4lx07UNGQUxmVKo6UmEnan/qyrdY8fkuZ0YQNpE+wHqkHQW
         58lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679575316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRIhiCMIYhlzOxpqNUvBzZ/DfwkIA0+Cejq18uIa0y0=;
        b=dEQaGj/UDIyfS4rIID7ozYQoL+CaoWt6OV32g8zl3YWKo0igsHXuVkLDFASJdR7IIn
         PsPWmGLdvP3CU8LigQ+32Hc+/FG5Ng0o5nsjctG4XKNOFeXhLzv5YFXxYQ9i5mH8RXBr
         HTigp2DoAWBwChrfYJLGCzGKkbxJG/lEKk6xPKrfrUON4sgvHJV46WMAlKHT8h3PVO5C
         HJksHsYjI9x3MiEERCHYLtJBnLOlmlEfNvHCW9VaIQxs3R7ag5zVHKJrVvG+t2jnFKxt
         0k7J9LKH2J3oqVFCXGpJzm7oAclKBONkEVdR+aUEihRALPo3oZGSW3zvX7sgXkCDAJ06
         OKMw==
X-Gm-Message-State: AO0yUKUsoRyI+RvxO3/Vf9/LOkK8FjOqeUKHLShdy5YYSO/yN2NrrZdd
	NkC4wfsOh3j5ndElVUCg+Dw3BJcWyOAPK/Kk
X-Google-Smtp-Source: AK7set/9vMbuObGoSNbL668Qv2c/PorTp83sSbtHafwYghf4PLlj07ix/seWf8uFUxGjwSCMfqRz9g==
X-Received: by 2002:a17:907:7666:b0:931:dcd4:4ff0 with SMTP id kk6-20020a170907766600b00931dcd44ff0mr10644366ejc.75.1679575316304;
        Thu, 23 Mar 2023 05:41:56 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id g1-20020a1709061c8100b0092669fb4ba1sm8597116ejh.130.2023.03.23.05.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 05:41:56 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 4/4] staging: rtl8192e: remove blank lines after '{'
Date: Thu, 23 Mar 2023 17:41:45 +0500
Message-Id: <303a41480220a6c31cee91d40ece40b3fae3bddf.1679573474.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679573474.git.kamrankhadijadj@gmail.com>
References: <cover.1679573474.git.kamrankhadijadj@gmail.com>
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

