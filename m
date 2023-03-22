Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89214BA49
	for <linux-staging@lists.linux.dev>; Wed, 22 Mar 2023 22:07:40 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id eh3so78899829edb.11
        for <linux-staging@lists.linux.dev>; Wed, 22 Mar 2023 15:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=seecs.edu.pk; s=google; t=1679522859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=weAoEEZiI2mKD//rUNwkb5TZGAcwsmwF1BER0SC0aPA=;
        b=IXWt4G2ZA3GukJB/z5rnjE2Wa9BXVCQGEfpPTDAh13aVrCWjr6FuvXKVggBShCxYkN
         Yntj9unSvSiwAnyCu1Xl+TGTotq2cx0ZwN3Cjk8y+Mgk2NL77R6qAyvSkUE27T9NR1Ef
         sy20YsS0BcXlyJXKeWjaVcXcVy8220hDcIAEg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679522859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=weAoEEZiI2mKD//rUNwkb5TZGAcwsmwF1BER0SC0aPA=;
        b=4c3MIzH8t4J6KUKXgIefKtibPOtz43iNhUfLH26q70HbyY+2UgKsUrTBqMxYJasSWZ
         xp3YvNalSlGR4QFfaG05WCK4P3sFfUJA9fqVRbw2QZrz9J1GbFXcEKFoWxuLYH8naAfX
         RrM2XHf9Kbdp2wnAuZScYUsutNqCk7ggFH59tiNYNyCscHgojuZHEO29AWYRmadonEuf
         mKhv0bStaD6xWC8tt/LLdmyvS8Wwnf3l1eyC0YI0IasxfLyGepomXFd5DjHNo0YFhK93
         RAkS4WWwJ/eOkNsqFYnvXtu6zxCa+acEhmDsAakzCvSpnib89qbwtA8I8Yt3DeeiWV1E
         i++A==
X-Gm-Message-State: AO0yUKVZoy90eZ2OqnJps6cAvQUgGNYSjXA+CY7F2QSAhx7lyVC3cMYE
	sArb2lyQNrIEVMizj3sKM4hF6w==
X-Google-Smtp-Source: AK7set9mL7YFAbWNwcmS+drZUv7tSXxh/dqipCJRAzWc5sIUbkUEH1mhKIxWJhGALWQSn4Lowox+9A==
X-Received: by 2002:a17:907:765a:b0:8b1:7684:dfab with SMTP id kj26-20020a170907765a00b008b17684dfabmr9659463ejc.38.1679522858718;
        Wed, 22 Mar 2023 15:07:38 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id v19-20020a17090651d300b0092b86d41dbasm7787935ejk.114.2023.03.22.15.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 15:07:38 -0700 (PDT)
From: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
X-Google-Original-From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khadija Kamran <kamrankhadijadj@gmail.com>
Subject: [PATCH 3/4] staging: rtl8192e: add spaces around binary operators
Date: Thu, 23 Mar 2023 03:07:03 +0500
Message-Id: <fe0a146fd5164a5105d71c3931ac334c9062327a.1679521517.git.kamrankhadijadj@gmail.com>
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

Use spaces around binary operators as suggested by Linux kernel coding
style.
Issues reported by checkpatch.pl for the following binary operators:
	+ , - , * , | , <<

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 54 ++++++++++++++--------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index 7144a0630ea6..f627dfe66d90 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -356,7 +356,7 @@ rtllib_rx_frame_decrypt_msdu(struct rtllib_device *ieee, struct sk_buff *skb,
 }
 
 /* this function is stolen from ipw2200 driver*/
-#define IEEE_PACKET_RETRY_TIME (5*HZ)
+#define IEEE_PACKET_RETRY_TIME (5 * HZ)
 static int is_duplicate_packet(struct rtllib_device *ieee,
 				      struct rtllib_hdr_4addr *header)
 {
@@ -936,7 +936,7 @@ static int rtllib_rx_check_duplicate(struct rtllib_device *ieee,
 
 		if (GetTs(ieee, (struct ts_common_info **)&pRxTS, hdr->addr2,
 			(u8)Frame_QoSTID((u8 *)(skb->data)), RX_DIR, true)) {
-			if ((fc & (1<<11)) && (frag == pRxTS->rx_last_frag_num) &&
+			if ((fc & (1 << 11)) && (frag == pRxTS->rx_last_frag_num) &&
 			    (WLAN_GET_SEQ_SEQ(sc) == pRxTS->rx_last_seq_num))
 				return -1;
 			pRxTS->rx_last_frag_num = frag;
@@ -1619,23 +1619,23 @@ static int rtllib_qos_convert_ac_to_parameters(struct rtllib_qos_parameter_info
 		case 1:
 			/* BIT(0) | BIT(3) */
 			if (acm)
-				qos_data->wmm_acm |= (0x01<<0)|(0x01<<3);
+				qos_data->wmm_acm |= (0x01 << 0) | (0x01 << 3);
 			break;
 		case 2:
 			/* BIT(4) | BIT(5) */
 			if (acm)
-				qos_data->wmm_acm |= (0x01<<4)|(0x01<<5);
+				qos_data->wmm_acm |= (0x01 << 4) | (0x01 << 5);
 			break;
 		case 3:
 			/* BIT(6) | BIT(7) */
 			if (acm)
-				qos_data->wmm_acm |= (0x01<<6)|(0x01<<7);
+				qos_data->wmm_acm |= (0x01 << 6) | (0x01 << 7);
 			break;
 		case 0:
 		default:
 			/* BIT(1) | BIT(2) */
 			if (acm)
-				qos_data->wmm_acm |= (0x01<<1)|(0x01<<2);
+				qos_data->wmm_acm |= (0x01 << 1) | (0x01 << 2);
 			break;
 		}
 
@@ -1979,7 +1979,7 @@ static void rtllib_parse_mife_generic(struct rtllib_device *ieee,
 	    info_element->data[3] == 0x04) {
 		netdev_dbg(ieee->dev, "MFIE_TYPE_WZC: %d bytes\n",
 			   info_element->len);
-		network->wzc_ie_len = min(info_element->len+2, MAX_WZC_IE_LEN);
+		network->wzc_ie_len = min(info_element->len + 2, MAX_WZC_IE_LEN);
 		memcpy(network->wzc_ie, info_element, network->wzc_ie_len);
 	}
 }
@@ -2139,10 +2139,10 @@ int rtllib_parse_info_param(struct rtllib_device *ieee,
 			if (info_element->data[2] & 1)
 				network->dtim_data |= RTLLIB_DTIM_MBCAST;
 
-			offset = (info_element->data[2] >> 1)*2;
+			offset = (info_element->data[2] >> 1) * 2;
 
-			if (ieee->assoc_id < 8*offset ||
-			    ieee->assoc_id > 8*(offset + info_element->len - 3))
+			if (ieee->assoc_id < 8 * offset ||
+			    ieee->assoc_id > 8 * (offset + info_element->len - 3))
 				break;
 
 			offset = (ieee->assoc_id / 8) - offset;
@@ -2357,7 +2357,7 @@ static inline int rtllib_network_init(
 	if (rtllib_is_empty_essid(network->ssid, network->ssid_len))
 		network->flags |= NETWORK_EMPTY_ESSID;
 	stats->signal = 30 + (stats->SignalStrength * 70) / 100;
-	stats->noise = rtllib_translate_todbm((u8)(100-stats->signal)) - 25;
+	stats->noise = rtllib_translate_todbm((u8)(100 - stats->signal)) - 25;
 
 	memcpy(&network->stats, stats, sizeof(network->stats));
 
@@ -2545,22 +2545,22 @@ static inline void rtllib_process_probe_response(
 		   "'%s' ( %pM ): %c%c%c%c %c%c%c%c-%c%c%c%c %c%c%c%c\n",
 		   escape_essid(info_element->data, info_element->len),
 		   beacon->header.addr3,
-		   (le16_to_cpu(beacon->capability) & (1<<0xf)) ? '1' : '0',
-		   (le16_to_cpu(beacon->capability) & (1<<0xe)) ? '1' : '0',
-		   (le16_to_cpu(beacon->capability) & (1<<0xd)) ? '1' : '0',
-		   (le16_to_cpu(beacon->capability) & (1<<0xc)) ? '1' : '0',
-		   (le16_to_cpu(beacon->capability) & (1<<0xb)) ? '1' : '0',
-		   (le16_to_cpu(beacon->capability) & (1<<0xa)) ? '1' : '0',
-		   (le16_to_cpu(beacon->capability) & (1<<0x9)) ? '1' : '0',
-		   (le16_to_cpu(beacon->capability) & (1<<0x8)) ? '1' : '0',
-		   (le16_to_cpu(beacon->capability) & (1<<0x7)) ? '1' : '0',
-		   (le16_to_cpu(beacon->capability) & (1<<0x6)) ? '1' : '0',
-		   (le16_to_cpu(beacon->capability) & (1<<0x5)) ? '1' : '0',
-		   (le16_to_cpu(beacon->capability) & (1<<0x4)) ? '1' : '0',
-		   (le16_to_cpu(beacon->capability) & (1<<0x3)) ? '1' : '0',
-		   (le16_to_cpu(beacon->capability) & (1<<0x2)) ? '1' : '0',
-		   (le16_to_cpu(beacon->capability) & (1<<0x1)) ? '1' : '0',
-		   (le16_to_cpu(beacon->capability) & (1<<0x0)) ? '1' : '0');
+		   (le16_to_cpu(beacon->capability) & (1 << 0xf)) ? '1' : '0',
+		   (le16_to_cpu(beacon->capability) & (1 << 0xe)) ? '1' : '0',
+		   (le16_to_cpu(beacon->capability) & (1 << 0xd)) ? '1' : '0',
+		   (le16_to_cpu(beacon->capability) & (1 << 0xc)) ? '1' : '0',
+		   (le16_to_cpu(beacon->capability) & (1 << 0xb)) ? '1' : '0',
+		   (le16_to_cpu(beacon->capability) & (1 << 0xa)) ? '1' : '0',
+		   (le16_to_cpu(beacon->capability) & (1 << 0x9)) ? '1' : '0',
+		   (le16_to_cpu(beacon->capability) & (1 << 0x8)) ? '1' : '0',
+		   (le16_to_cpu(beacon->capability) & (1 << 0x7)) ? '1' : '0',
+		   (le16_to_cpu(beacon->capability) & (1 << 0x6)) ? '1' : '0',
+		   (le16_to_cpu(beacon->capability) & (1 << 0x5)) ? '1' : '0',
+		   (le16_to_cpu(beacon->capability) & (1 << 0x4)) ? '1' : '0',
+		   (le16_to_cpu(beacon->capability) & (1 << 0x3)) ? '1' : '0',
+		   (le16_to_cpu(beacon->capability) & (1 << 0x2)) ? '1' : '0',
+		   (le16_to_cpu(beacon->capability) & (1 << 0x1)) ? '1' : '0',
+		   (le16_to_cpu(beacon->capability) & (1 << 0x0)) ? '1' : '0');
 
 	if (rtllib_network_init(ieee, beacon, network, stats)) {
 		netdev_dbg(ieee->dev, "Dropped '%s' ( %pM) via %s.\n",
-- 
2.34.1

