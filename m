Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15707173
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:55:12 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id j6so139700624edw.12
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HsHPc3OClUHj2lveqdBEtaBrEh8BpXWuJXdf11FguKA=;
        b=Nl4C2HHvYr8FOTTe/9eL/a/kGZltdXFKUTNIJPriNALRtv8H+Zsd9hfzxemg+aySNC
         CSLrcorOTkqGGPg6BBz5JLrgswxp1AApC9i2LRudQJmtzmz+/I5jEEwXG2zaBoOxFQXG
         cyQnen+cHSdDT6dC8FTIUAjx0ELb9tB59DwE/kftCIchPUWRyYcTq9xn3bi1Zck6H/k9
         VoUJQOX7g/PhAGOQV/y/VRm4M/9Ml8rhF22K9LrNR2XbEs8xkCQv3NId6lHjjW0/V1+6
         EpkV9SYp5Mdf0A9CB8F+odfiv7weYwVwcZ4RGVD3baSk0bmN4RVPwPtdNWg4LjNBy+IR
         qGvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HsHPc3OClUHj2lveqdBEtaBrEh8BpXWuJXdf11FguKA=;
        b=5zavTPQaNAfqdbJTD8U6rLQwmamxOWbZyeyPMywmKbmEwzOIrhBizbgX6NqwKkw4r7
         QUwpQa6QI1W7ryBtaEDZOMcQXz9qXoEuBAYq0RAKnrZ1QeEmkZBH8ntUyqkVzScwaj7l
         66KKWdkGxdRr1qDt90nWFH0FZjPnEA5O+7S1XZUTouUDL93ArZWuBOPPI2JjNeSmd7T8
         b+aIydAKBuGguAwQjKYC/oucj5zXk0SDGYoL2bgKG3i3i12sHlfC9FR/wM+o0Zm+4sHG
         61oI1Z6lt6Z6SdnXAnoTVJF9A+odbooJDHoSCmjX6FQ2hHtZZ+pFpKuQnvQG46TOHHR7
         uDng==
X-Gm-Message-State: AOAM531SoSWLZulOs3LzO/gOoYvXN/22YPNMPHyfte+7Eb/ONi3dQeWT
	jkNgTkKxwbdyOAHa65gxAXQ=
X-Google-Smtp-Source: ABdhPJzxtHbmGnS3MdAa50hjLzJGy0ZAmzwQr3J3OApscSAtUuXl+CXQGJNz9zRbi3+Kt3HkXTqA0g==
X-Received: by 2002:a17:907:1b0d:: with SMTP id mp13mr36889270ejc.29.1641239710500;
        Mon, 03 Jan 2022 11:55:10 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:55:10 -0800 (PST)
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: 
Cc: alb3rt0.m3rciai@gmail.com,
	linuxfancy@googlegroups.com,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Saurav Girepunje <saurav.girepunje@gmail.com>,
	Ivan Safonov <insafonov@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Zameer Manji <zmanji@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 53/56] staging: r8188eu: rename camelcase GetAddr1Ptr to get_addr_1_ptr
Date: Mon,  3 Jan 2022 20:02:28 +0100
Message-Id: <20220103190326.363960-54-alb3rt0.m3rciai@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220103190326.363960-1-alb3rt0.m3rciai@gmail.com>
References: <20220103190326.363960-1-alb3rt0.m3rciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename camel case macro GetAddr1Ptr into get_addr_1_ptr

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 16 ++++++++--------
 drivers/staging/r8188eu/core/rtw_recv.c     | 14 +++++++-------
 drivers/staging/r8188eu/include/wifi.h      | 10 +++++-----
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 6ec53f1039cc..af65774ed936 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -401,8 +401,8 @@ static void _mgt_dispatcher(struct adapter *padapter, struct mlme_handler *ptabl
 
 	if (ptable->func) {
 	/* receive the frames that ra(a1) is my address or ra(a1) is bc address. */
-		if (memcmp(GetAddr1Ptr(pframe), myid(&padapter->eeprompriv), ETH_ALEN) &&
-		    !is_broadcast_ether_addr(GetAddr1Ptr(pframe)))
+		if (memcmp(get_addr_1_ptr(pframe), myid(&padapter->eeprompriv), ETH_ALEN) &&
+		    !is_broadcast_ether_addr(get_addr_1_ptr(pframe)))
 			return;
 		ptable->func(padapter, precv_frame);
 	}
@@ -420,8 +420,8 @@ void mgt_dispatcher(struct adapter *padapter, struct recv_frame *precv_frame)
 		return;
 
 	/* receive the frames that ra(a1) is my address or ra(a1) is bc address. */
-	if (memcmp(GetAddr1Ptr(pframe), myid(&padapter->eeprompriv), ETH_ALEN) &&
-	    !is_broadcast_ether_addr(GetAddr1Ptr(pframe)))
+	if (memcmp(get_addr_1_ptr(pframe), myid(&padapter->eeprompriv), ETH_ALEN) &&
+	    !is_broadcast_ether_addr(get_addr_1_ptr(pframe)))
 		return;
 
 	ptable = mlme_sta_tbl;
@@ -1679,7 +1679,7 @@ unsigned int OnAction_back(struct adapter *padapter, struct recv_frame *precv_fr
 	u8 *pframe = precv_frame->rx_data;
 	struct sta_priv *pstapriv = &padapter->stapriv;
 	/* check RA matches or not */
-	if (memcmp(myid(&padapter->eeprompriv), GetAddr1Ptr(pframe), ETH_ALEN))/* for if1, sta/ap mode */
+	if (memcmp(myid(&padapter->eeprompriv), get_addr_1_ptr(pframe), ETH_ALEN))/* for if1, sta/ap mode */
 		return _SUCCESS;
 
 	DBG_88E("%s\n", __func__);
@@ -4055,7 +4055,7 @@ unsigned int on_action_public(struct adapter *padapter, struct recv_frame *precv
 	u8 category, action;
 
 	/* check RA matches or not */
-	if (memcmp(myid(&padapter->eeprompriv), GetAddr1Ptr(pframe), ETH_ALEN))
+	if (memcmp(myid(&padapter->eeprompriv), get_addr_1_ptr(pframe), ETH_ALEN))
 		goto exit;
 
 	category = frame_body[0];
@@ -4097,7 +4097,7 @@ unsigned int OnAction_p2p(struct adapter *padapter, struct recv_frame *precv_fra
 	DBG_88E("%s\n", __func__);
 
 	/* check RA matches or not */
-	if (memcmp(myid(&padapter->eeprompriv), GetAddr1Ptr(pframe), ETH_ALEN))/* for if1, sta/ap mode */
+	if (memcmp(myid(&padapter->eeprompriv), get_addr_1_ptr(pframe), ETH_ALEN))/* for if1, sta/ap mode */
 		return _SUCCESS;
 
 	frame_body = (unsigned char *)(pframe + sizeof(struct rtw_ieee80211_hdr_3addr));
@@ -4964,7 +4964,7 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 	fctrl = &pwlanhdr->frame_ctl;
 	*(fctrl) = 0;
 
-	memcpy((void *)GetAddr1Ptr(pwlanhdr), pstat->hwaddr, ETH_ALEN);
+	memcpy((void *)get_addr_1_ptr(pwlanhdr), pstat->hwaddr, ETH_ALEN);
 	memcpy((void *)GetAddr2Ptr(pwlanhdr), myid(&padapter->eeprompriv), ETH_ALEN);
 	memcpy((void *)GetAddr3Ptr(pwlanhdr), get_my_bssid(&pmlmeinfo->network), ETH_ALEN);
 
diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 32e0bcce65a0..9d8da5ec8948 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -631,7 +631,7 @@ int sta2sta_data_frame(struct adapter *adapter, struct recv_frame *precv_frame,
 			sta_addr = pattrib->src;
 		}
 	} else if (check_fwstate(pmlmepriv, WIFI_MP_STATE)) {
-		memcpy(pattrib->dst, GetAddr1Ptr(ptr), ETH_ALEN);
+		memcpy(pattrib->dst, get_addr_1_ptr(ptr), ETH_ALEN);
 		memcpy(pattrib->src, GetAddr2Ptr(ptr), ETH_ALEN);
 		memcpy(pattrib->bssid, GetAddr3Ptr(ptr), ETH_ALEN);
 		memcpy(pattrib->ra, pattrib->dst, ETH_ALEN);
@@ -718,7 +718,7 @@ static int ap2sta_data_frame(
 		}
 	} else if (check_fwstate(pmlmepriv, WIFI_MP_STATE) &&
 		   check_fwstate(pmlmepriv, _FW_LINKED)) {
-		memcpy(pattrib->dst, GetAddr1Ptr(ptr), ETH_ALEN);
+		memcpy(pattrib->dst, get_addr_1_ptr(ptr), ETH_ALEN);
 		memcpy(pattrib->src, GetAddr2Ptr(ptr), ETH_ALEN);
 		memcpy(pattrib->bssid, GetAddr3Ptr(ptr), ETH_ALEN);
 		memcpy(pattrib->ra, pattrib->dst, ETH_ALEN);
@@ -823,7 +823,7 @@ static int validate_recv_ctrl_frame(struct adapter *padapter,
 		return _FAIL;
 
 	/* receive the frames that ra(a1) is my address */
-	if (memcmp(GetAddr1Ptr(pframe), myid(&padapter->eeprompriv), ETH_ALEN))
+	if (memcmp(get_addr_1_ptr(pframe), myid(&padapter->eeprompriv), ETH_ALEN))
 		return _FAIL;
 
 	/* only handle ps-poll */
@@ -949,10 +949,10 @@ static int validate_recv_mgnt_frame(struct adapter *padapter,
 		} else if (get_frame_subtype(precv_frame->rx_data) == WIFI_PROBEREQ) {
 			psta->sta_stats.rx_probereq_pkts++;
 		} else if (get_frame_subtype(precv_frame->rx_data) == WIFI_PROBERSP) {
-			if (!memcmp(padapter->eeprompriv.mac_addr, GetAddr1Ptr(precv_frame->rx_data), ETH_ALEN))
+			if (!memcmp(padapter->eeprompriv.mac_addr, get_addr_1_ptr(precv_frame->rx_data), ETH_ALEN))
 				psta->sta_stats.rx_probersp_pkts++;
-			else if (is_broadcast_mac_addr(GetAddr1Ptr(precv_frame->rx_data)) ||
-				 is_multicast_mac_addr(GetAddr1Ptr(precv_frame->rx_data)))
+			else if (is_broadcast_mac_addr(get_addr_1_ptr(precv_frame->rx_data)) ||
+				 is_multicast_mac_addr(get_addr_1_ptr(precv_frame->rx_data)))
 				psta->sta_stats.rx_probersp_bm_pkts++;
 			else
 				psta->sta_stats.rx_probersp_uo_pkts++;
@@ -1007,7 +1007,7 @@ static int validate_recv_data_frame(struct adapter *adapter,
 		ret = sta2ap_data_frame(adapter, precv_frame, &psta);
 		break;
 	case 3:
-		memcpy(pattrib->ra, GetAddr1Ptr(ptr), ETH_ALEN);
+		memcpy(pattrib->ra, get_addr_1_ptr(ptr), ETH_ALEN);
 		memcpy(pattrib->ta, GetAddr2Ptr(ptr), ETH_ALEN);
 		ret = _FAIL;
 		break;
diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index 061d1aa18eed..4d4db68b967e 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -250,7 +250,7 @@ enum WIFI_REG_DOMAIN {
 
 #define get_aid(pbuf)	(le16_to_cpu(*(__le16 *)((size_t)(pbuf) + 2)) & 0x3fff)
 
-#define GetAddr1Ptr(pbuf)	((unsigned char *)((size_t)(pbuf) + 4))
+#define get_addr_1_ptr(pbuf)	((unsigned char *)((size_t)(pbuf) + 4))
 
 #define GetAddr2Ptr(pbuf)	((unsigned char *)((size_t)(pbuf) + 10))
 
@@ -273,10 +273,10 @@ static inline unsigned char *get_da(unsigned char *pframe)
 
 	switch (to_fr_ds) {
 	case 0x00:	/*  ToDs=0, FromDs=0 */
-		da = GetAddr1Ptr(pframe);
+		da = get_addr_1_ptr(pframe);
 		break;
 	case 0x01:	/*  ToDs=0, FromDs=1 */
-		da = GetAddr1Ptr(pframe);
+		da = get_addr_1_ptr(pframe);
 		break;
 	case 0x02:	/*  ToDs=1, FromDs=0 */
 		da = GetAddr3Ptr(pframe);
@@ -323,10 +323,10 @@ static inline unsigned char *get_hdr_bssid(unsigned char *pframe)
 		sa = GetAddr2Ptr(pframe);
 		break;
 	case 0x02:	/*  ToDs=1, FromDs=0 */
-		sa = GetAddr1Ptr(pframe);
+		sa = get_addr_1_ptr(pframe);
 		break;
 	case 0x03:	/*  ToDs=1, FromDs=1 */
-		sa = GetAddr1Ptr(pframe);
+		sa = get_addr_1_ptr(pframe);
 		break;
 	default:
 		sa = NULL; /*  */
-- 
2.25.1

