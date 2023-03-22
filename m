Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1042DBA44
	for <linux-staging@lists.linux.dev>; Wed, 22 Mar 2023 22:07:36 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id eg48so78807644edb.13
        for <linux-staging@lists.linux.dev>; Wed, 22 Mar 2023 15:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=seecs.edu.pk; s=google; t=1679522855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2qlJwucxS9YsM3710vjGoZ2YHREnKLXbsqoSCiO7TnI=;
        b=gPXSR/6CQUuHvcu8ph+2uLp4ghyNKEBCx4AIpOi1WC5Jow3aQc2iTrRDKKmeprIXEz
         TPlS+FMUFFLfQMoBfW5mwv/5VVJTefVxqTR0rFafvQrdGsGuUXMlBiLQqPES83D+Y7Ux
         P5NB2/26JpPnrnKd5kMMz8TLx+5GD58EWTt4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679522855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2qlJwucxS9YsM3710vjGoZ2YHREnKLXbsqoSCiO7TnI=;
        b=ZHBY+dY+Ro08pJXlWWzBl0VyVknOzvEy4iTlfasu0ykt+L1JDkMdfYMVQA03SLAmC5
         FJJHE7X8RClTm6zoA7HCUMxFs849kXO361pV2iFk/KGou0cjTO+c9rvMbxdg/4XYXpWf
         n6h2EQuB8VbzfQI+A7KetAheUWS+BQSaQDRsryhuXUAfASTdTlr7VGu70QefnGPrFV/S
         f8aFM0Vy38NN30vqQ5Y3QxMbUgU2vkpD0QAy7Wr0N550o3NZMVxddfMHnoQG6gcuB1nE
         LQNUaGcOltVb6VP+TfjQL8fKok04D2ElTajURPaRUvAuDUfaHFeRrGqC+14IJHms7gnv
         ILgg==
X-Gm-Message-State: AO0yUKUlXaLmj4eWzzVj3elNb4BiK0lnxxAFNjyOPtrb/YlJDdBFPHog
	fkYd4e0ViyFf6xZK89W7Fd9HXg==
X-Google-Smtp-Source: AK7set/3fSUAw7kZj//xOAYh+vvAqiu6Mzaryf+EugaMQP8MYCEUVcza/jzStA07Q6dx4kwNd2VQlA==
X-Received: by 2002:a17:906:5410:b0:931:86cf:9556 with SMTP id q16-20020a170906541000b0093186cf9556mr9343600ejo.23.1679522855286;
        Wed, 22 Mar 2023 15:07:35 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id v19-20020a17090651d300b0092b86d41dbasm7787935ejk.114.2023.03.22.15.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 15:07:35 -0700 (PDT)
From: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
X-Google-Original-From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khadija Kamran <kamrankhadijadj@gmail.com>
Subject: [PATCH 1/4] staging: rtl8192e: remove extra blank lines
Date: Thu, 23 Mar 2023 03:07:01 +0500
Message-Id: <43d5864fc42e51089a0a0626278204bac8313eb0.1679521517.git.kamrankhadijadj@gmail.com>
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

Remove extra blank lines as reported by checkpatch.pl

"CHECK: Please don't use multiple blank lines"

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index c394c21beefb..c6114d99829b 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -154,7 +154,6 @@ rtllib_frag_cache_get(struct rtllib_device *ieee,
 	return skb;
 }
 
-
 /* Called only as a tasklet (software IRQ) */
 static int rtllib_frag_cache_invalidate(struct rtllib_device *ieee,
 					   struct rtllib_hdr_4addr *hdr)
@@ -318,7 +317,6 @@ rtllib_rx_frame_decrypt(struct rtllib_device *ieee, struct sk_buff *skb,
 	return res;
 }
 
-
 /* Called only as a tasklet (software IRQ), by rtllib_rx */
 static inline int
 rtllib_rx_frame_decrypt_msdu(struct rtllib_device *ieee, struct sk_buff *skb,
@@ -355,7 +353,6 @@ rtllib_rx_frame_decrypt_msdu(struct rtllib_device *ieee, struct sk_buff *skb,
 	return 0;
 }
 
-
 /* this function is stolen from ipw2200 driver*/
 #define IEEE_PACKET_RETRY_TIME (5*HZ)
 static int is_duplicate_packet(struct rtllib_device *ieee,
@@ -887,7 +884,6 @@ static u8 parse_subframe(struct rtllib_device *ieee, struct sk_buff *skb,
 	return rxb->nr_subframes;
 }
 
-
 static size_t rtllib_rx_get_hdrlen(struct rtllib_device *ieee,
 				   struct sk_buff *skb,
 				   struct rtllib_rx_stats *rx_stats)
@@ -1569,7 +1565,6 @@ static int rtllib_verify_qos_info(struct rtllib_qos_information_element
 	return 0;
 }
 
-
 /* Parse a QoS parameter element */
 static int rtllib_read_qos_param_element(
 			struct rtllib_qos_parameter_info *element_param,
@@ -1599,7 +1594,6 @@ static int rtllib_read_qos_info_element(
 	return rtllib_verify_qos_info(element_info, QOS_OUI_INFO_SUB_TYPE);
 }
 
-
 /* Write QoS parameters from the ac parameters. */
 static int rtllib_qos_convert_ac_to_parameters(struct rtllib_qos_parameter_info *param_elm,
 					       struct rtllib_qos_data *qos_data)
@@ -1843,7 +1837,6 @@ static void rtllib_parse_mife_generic(struct rtllib_device *ieee,
 		}
 	}
 
-
 	if (*tmp_htinfo_len == 0) {
 		if (info_element->len >= 4 &&
 		    info_element->data[0] == 0x00 &&
@@ -1932,7 +1925,6 @@ static void rtllib_parse_mife_generic(struct rtllib_device *ieee,
 	    info_element->data[2] == 0x96)
 		network->cisco_cap_exist = true;
 
-
 	if (info_element->len >= 3 &&
 	    info_element->data[0] == 0x00 &&
 	    info_element->data[1] == 0x0a &&
@@ -2142,13 +2134,11 @@ int rtllib_parse_info_param(struct rtllib_device *ieee,
 
 			network->dtim_data = RTLLIB_DTIM_VALID;
 
-
 			if (info_element->data[2] & 1)
 				network->dtim_data |= RTLLIB_DTIM_MBCAST;
 
 			offset = (info_element->data[2] >> 1)*2;
 
-
 			if (ieee->assoc_id < 8*offset ||
 			    ieee->assoc_id > 8*(offset + info_element->len - 3))
 				break;
@@ -2203,7 +2193,6 @@ int rtllib_parse_info_param(struct rtllib_device *ieee,
 						 &tmp_htcap_len);
 			break;
 
-
 		case MFIE_TYPE_HT_INFO:
 			netdev_dbg(ieee->dev, "MFIE_TYPE_HT_INFO: %d bytes\n",
 				   info_element->len);
@@ -2392,7 +2381,6 @@ static inline int is_same_network(struct rtllib_network *src,
 		(dst->capability & WLAN_CAPABILITY_ESS)));
 }
 
-
 static inline void update_network(struct rtllib_device *ieee,
 				  struct rtllib_network *dst,
 				  struct rtllib_network *src)
@@ -2580,7 +2568,6 @@ static inline void rtllib_process_probe_response(
 		goto free_network;
 	}
 
-
 	if (!rtllib_legal_channel(ieee, network->channel))
 		goto free_network;
 
-- 
2.34.1

