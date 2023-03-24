Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C502771B;
	Fri, 24 Mar 2023 22:09:59 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id l12so3129070wrm.10;
        Fri, 24 Mar 2023 15:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679695797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qHW/CyCQWbbVJjXUcNnqunHcb5Z7BkaW2HblBqM5Qy8=;
        b=P8OaKsVj8aVBbGfD44ArWKOkdXCKP4ihm+EBz8j6hFS/77+OnOC+rb1B321webTsN3
         kNl5ixQm2p5+I4JBMST/4+5NW9LEeffyRP2UlKs46HsGp+S6Lfny7yOsBMGK2tKy9+wN
         0VoteDOVJRtrL96nIJPhnA59RVIL4ua2ACnPyOpoBVSOn8CNeHjvu1OgRpHOp2W/EtlR
         DeubsbdrOiwOtmn4KhxbTfLaqPJnqekJIMmf54U8858WxQxwP50++wp0h98wWdngWj33
         hpIZwcZTs0e5MvOTtmSD5TLPyFsWJtk/3TEvEnTAi7T6jd1pvxTdX0ajh9Hdenkqa2tX
         Hsvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679695797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qHW/CyCQWbbVJjXUcNnqunHcb5Z7BkaW2HblBqM5Qy8=;
        b=XJkIC3tUGMjIMt3/fi4QZ7jBFnqdYtC1h+QGJIbDpdvVXD7bIimh39G0KDvXCfFt/C
         un5nqwkJUrI4v07EJwNL9xiR+t+VcbY349K6iwzOk9giQ20empwA7dw8x2h8nGhMxOSS
         PQbtvQ9iiAsBgI/EsOS1AydpNpsMng80i+ZwXFK/hy0+h4TwkZqeGsTjJo/vtTY+AfuR
         ZN0qnM5nlqIvOMvEdBsCmT/x64bCDDl400B6l0dOrMOI5H90hT6tL0e7jYNYT7tlul2z
         pvYeFnKC+mZWTexHdXyLANzsfcJyG9SApkPHhFb/ueDrziRAJycmZp1PzK2pvfjwx4rC
         4KkQ==
X-Gm-Message-State: AAQBX9eRDZghM+y2v1HfmhXVNSWTPcXSQw3g2QdartW8xqEOhgpsViwa
	wj/7wHUE5RHo3XcrcA2Lxra3CHEYmBH5JUPt
X-Google-Smtp-Source: AKy350bv17FwvgoxD59q8/VBlKC/zE+cjJOKqNKrhpDnqxwyw8eiQV8Nh5Xzg6YWbmjIpYSO1opkTQ==
X-Received: by 2002:a5d:58e9:0:b0:2d1:87f:2cd1 with SMTP id f9-20020a5d58e9000000b002d1087f2cd1mr3876648wrd.25.1679695797489;
        Fri, 24 Mar 2023 15:09:57 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id x12-20020a5d650c000000b002c5544b3a69sm19201736wru.89.2023.03.24.15.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 15:09:57 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] staging: rtl8192e: remove extra blank lines
Date: Sat, 25 Mar 2023 03:09:48 +0500
Message-Id: <6d7388f944e8296227269c7472a462ea7c94149c.1679695111.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679695111.git.kamrankhadijadj@gmail.com>
References: <cover.1679695111.git.kamrankhadijadj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the extra blank line in accordance with the Linux kernel
coding-style regulations. These issues were reported by checkpatch.pl

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

