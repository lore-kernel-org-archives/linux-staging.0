Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23AFC7C;
	Fri,  1 Apr 2022 19:28:50 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id bp39so3008059qtb.6;
        Fri, 01 Apr 2022 12:28:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HZ+3ukPY3keLOSk2pZn5+tiMzNcnjZICwG03+QcVg+c=;
        b=cdifRGwPt/eL7qBaU3/HfXQX0Nshm2XRjizjUi+kzQ6MjYmfY7+F7qE2w9M6TU5LKi
         +4fonCnfZCyaI3Cl0umIwM64t0CL0JrgDh/M97mK7KI+c9aIayl3jphFMr5uvYck1TCe
         olV07esZwmS2gtZJxAis65r8fWExVUNb2r3ZELJgNg6+5kcBNNqsejh1FfoJoXvUk/Q4
         fi+me/a7aNAotQ36i06iCVnSOGr+VlYihpaXkWHtKXDn3JhmLFoU4xQ5DmAkZqEtExy4
         GCIO3JuDQCdS1ss3szplqz5o6JCcMcWnZB9BUCcMsF793cwWWFwht+q0c86RBX2GLZJ3
         p1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HZ+3ukPY3keLOSk2pZn5+tiMzNcnjZICwG03+QcVg+c=;
        b=fBF9X+vp2gpCMZ44bwaNYWmST+CJs2uhRRLP5i0Z3cwHsM71yBWWS3gcOymNVZBhe8
         /ajFWSaoajCGNuPwJKZo4tJGmIHT7VV714HSzP2vFZgv857gU959IZOnqy7QnP4l4feo
         xpjx8iupZ3TKKNWEpqr4aJBqaVQmU3BfCKnOD2wMqPtLrC2cRjwBT4A1Jd0M9/NPWtzr
         J5QDF1E4YvUsjGeoC9330LFdh1VN8XMRTRwPBP67yAgJHl2YMvJbN+/SdAF7MqQPlVav
         ccPqdRtEsDFq5EeqxrMqbt+RT8M9A3moVrpaR7aFqA4WnvqtdgzreQoZNUXxND+bojyd
         LBgQ==
X-Gm-Message-State: AOAM533CPUsqhNtCLZdt/9oKs/EBl2t5KOAXaqd0dXlbJLuCpws9a53l
	SfvEtZ0v2M21NeaOd92SOLorluSYFHIG5sMH
X-Google-Smtp-Source: ABdhPJxr36qgik7LEoGbCqaHkRc+Ec7NIHIF6BNkTfuYxpC4oEtD6fhdYVkEWBUiu74bT3ckEPnXDw==
X-Received: by 2002:ac8:4e8a:0:b0:2e1:e828:cac3 with SMTP id 10-20020ac84e8a000000b002e1e828cac3mr9576476qtp.616.1648841328952;
        Fri, 01 Apr 2022 12:28:48 -0700 (PDT)
Received: from euclid ([71.58.109.160])
        by smtp.gmail.com with ESMTPSA id t7-20020a05622a148700b002eba7850c57sm989225qtx.21.2022.04.01.12.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Apr 2022 12:28:48 -0700 (PDT)
From: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
Subject: [PATCH v3 1/3] staging: rtl8723bs: remove redundant braces in if statements
Date: Fri,  1 Apr 2022 15:28:36 -0400
Message-Id: <1a9f181f7f30f71c03e6e88df9fb8c17a298a192.1648840991.git.sevinj.aghayeva@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1648840991.git.sevinj.aghayeva@gmail.com>
References: <cover.1648840991.git.sevinj.aghayeva@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux kernel coding style.

Reported by checkpatch:

WARNING: braces {} are not necessary for single statement blocks

Signed-off-by: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 76 +++++++------------
 1 file changed, 26 insertions(+), 50 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 49a3f45cb771..9f328e9a81ff 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -271,12 +271,9 @@ static int has_channel(struct rt_channel_info *channel_set,
 {
 	int i;
 
-	for (i = 0; i < chanset_size; i++) {
-		if (channel_set[i].ChannelNum == chan) {
+	for (i = 0; i < chanset_size; i++)
+		if (channel_set[i].ChannelNum == chan)
 			return 1;
-		}
-	}
-
 	return 0;
 }
 
@@ -649,9 +646,8 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 			if (psta) {
 				/* update WMM, ERP in the beacon */
 				/* todo: the timer is used instead of the number of the beacon received */
-				if ((sta_rx_pkts(psta) & 0xf) == 0) {
+				if ((sta_rx_pkts(psta) & 0xf) == 0)
 					update_beacon_info(padapter, pframe, len, psta);
-				}
 			} else {
 				/* allocate a new CAM entry for IBSS station */
 				cam_idx = allocate_fw_sta_entry(padapter);
@@ -916,11 +912,10 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 			go2asoc = 1;
 		}
 	} else if (seq == 4) {
-		if (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared) {
+		if (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared)
 			go2asoc = 1;
-		} else {
+		else
 			goto authclnt_fail;
-		}
 	} else {
 		/*  this is also illegal */
 		goto authclnt_fail;
@@ -1455,11 +1450,10 @@ unsigned int OnAssocRsp(struct adapter *padapter, union recv_frame *precv_frame)
 	UpdateBrateTbl(padapter, pmlmeinfo->network.supported_rates);
 
 report_assoc_result:
-	if (res > 0) {
+	if (res > 0)
 		rtw_buf_update(&pmlmepriv->assoc_rsp, &pmlmepriv->assoc_rsp_len, pframe, pkt_len);
-	} else {
+	else
 		rtw_buf_free(&pmlmepriv->assoc_rsp, &pmlmepriv->assoc_rsp_len);
-	}
 
 	report_join_res(padapter, res);
 
@@ -1531,9 +1525,8 @@ unsigned int OnDeAuth(struct adapter *padapter, union recv_frame *precv_frame)
 			   reason, GetAddr3Ptr(pframe),
 			   ignore_received_deauth);
 
-		if (0 == ignore_received_deauth) {
+		if (0 == ignore_received_deauth)
 			receive_disconnect(padapter, GetAddr3Ptr(pframe), reason);
-		}
 	}
 	pmlmepriv->LinkDetectInfo.bBusyTraffic = false;
 	return _SUCCESS;
@@ -1674,11 +1667,10 @@ unsigned int OnAction_back(struct adapter *padapter, union recv_frame *precv_fra
 			/* process_addba_req(padapter, (u8 *)&(pmlmeinfo->ADDBA_req), GetAddr3Ptr(pframe)); */
 			process_addba_req(padapter, (u8 *)&(pmlmeinfo->ADDBA_req), addr);
 
-			if (pmlmeinfo->accept_addba_req) {
+			if (pmlmeinfo->accept_addba_req)
 				issue_action_BA(padapter, addr, WLAN_ACTION_ADDBA_RESP, 0);
-			} else {
+			else
 				issue_action_BA(padapter, addr, WLAN_ACTION_ADDBA_RESP, 37);/* reject ADDBA Req */
-			}
 
 			break;
 
@@ -1774,9 +1766,8 @@ static unsigned int on_action_public_vendor(union recv_frame *precv_frame)
 	u8 *pframe = precv_frame->u.hdr.rx_data;
 	u8 *frame_body = pframe + sizeof(struct ieee80211_hdr_3addr);
 
-	if (!memcmp(frame_body + 2, P2P_OUI, 4)) {
+	if (!memcmp(frame_body + 2, P2P_OUI, 4))
 		ret = on_action_public_p2p(precv_frame);
-	}
 
 	return ret;
 }
@@ -2187,9 +2178,8 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 
 			wps_ie = rtw_get_wps_ie(pmgntframe->buf_addr+TXDESC_OFFSET+sizeof(struct ieee80211_hdr_3addr)+_BEACON_IE_OFFSET_,
 				pattrib->pktlen-sizeof(struct ieee80211_hdr_3addr)-_BEACON_IE_OFFSET_, NULL, &wps_ielen);
-			if (wps_ie && wps_ielen > 0) {
+			if (wps_ie && wps_ielen > 0)
 				rtw_get_wps_attr_content(wps_ie,  wps_ielen, WPS_ATTR_SELECTED_REGISTRAR, (u8 *)(&sr), NULL);
-			}
 			if (sr != 0)
 				set_fwstate(pmlmepriv, WIFI_UNDER_WPS);
 			else
@@ -2245,9 +2235,8 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 
 
 	/*  EXTERNDED SUPPORTED RATE */
-	if (rate_len > 8) {
+	if (rate_len > 8)
 		pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES, (rate_len - 8), (cur_network->supported_rates + 8), &pattrib->pktlen);
-	}
 
 
 	/* todo:HT for adhoc */
@@ -2447,9 +2436,8 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 
 
 		/*  EXTERNDED SUPPORTED RATE */
-		if (rate_len > 8) {
+		if (rate_len > 8)
 			pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES, (rate_len - 8), (cur_network->supported_rates + 8), &pattrib->pktlen);
-		}
 
 
 		/* todo:HT for adhoc */
@@ -2674,9 +2662,8 @@ void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short
 
 		/*  setting auth algo number */
 		val16 = (pmlmeinfo->auth_algo == dot11AuthAlgrthm_Shared) ? 1 : 0;/*  0:OPEN System, 1:Shared key */
-		if (val16) {
+		if (val16)
 			use_shared_key = 1;
-		}
 		le_tmp = cpu_to_le16(val16);
 
 		/* setting IV for auth seq #3 */
@@ -2831,16 +2818,14 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 				break;
 			}
 
-			if (!pbuf || ie_len == 0) {
+			if (!pbuf || ie_len == 0)
 				break;
-			}
 		}
 
 	}
 
-	if (pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_REALTEK) {
+	if (pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_REALTEK)
 		pframe = rtw_set_ie(pframe, WLAN_EID_VENDOR_SPECIFIC, 6, REALTEK_96B_IE, &(pattrib->pktlen));
-	}
 
 	/* add WPS IE ie for wps 2.0 */
 	if (pmlmepriv->wps_assoc_resp_ie && pmlmepriv->wps_assoc_resp_ie_len > 0) {
@@ -3301,9 +3286,8 @@ static int _issue_deauth(struct adapter *padapter, unsigned char *da,
 	__le16 le_tmp;
 
 	pmgntframe = alloc_mgtxmitframe(pxmitpriv);
-	if (!pmgntframe) {
+	if (!pmgntframe)
 		goto exit;
-	}
 
 	/* update attribute */
 	pattrib = &pmgntframe->attrib;
@@ -3627,9 +3611,8 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 	action = ACT_PUBLIC_BSSCOEXIST;
 
 	pmgntframe = alloc_mgtxmitframe(pxmitpriv);
-	if (!pmgntframe) {
+	if (!pmgntframe)
 		return;
-	}
 
 	/* update attribute */
 	pattrib = &pmgntframe->attrib;
@@ -3802,9 +3785,8 @@ unsigned int send_beacon(struct adapter *padapter)
 
 	} while (false == bxmitok && issue < 100 && !padapter->bSurpriseRemoved && !padapter->bDriverStopped);
 
-	if (padapter->bSurpriseRemoved || padapter->bDriverStopped) {
+	if (padapter->bSurpriseRemoved || padapter->bDriverStopped)
 		return _FAIL;
-	}
 
 
 	if (!bxmitok)
@@ -4388,9 +4370,8 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 			}
 
 			/*  skip AP 2.4G channel plan */
-			while ((j < chplan_ap.Len) && (chplan_ap.Channel[j] <= 14)) {
+			while ((j < chplan_ap.Len) && (chplan_ap.Channel[j] <= 14))
 				j++;
-			}
 		}
 
 		pmlmeext->update_channel_plan_by_ap_done = 1;
@@ -4402,9 +4383,8 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 	i = 0;
 	while ((i < MAX_CHANNEL_NUM) && (chplan_new[i].ChannelNum != 0)) {
 		if (chplan_new[i].ChannelNum == channel) {
-			if (chplan_new[i].ScanType == SCAN_PASSIVE) {
+			if (chplan_new[i].ScanType == SCAN_PASSIVE)
 				chplan_new[i].ScanType = SCAN_ACTIVE;
-			}
 			break;
 		}
 		i++;
@@ -4629,9 +4609,8 @@ void report_del_sta_event(struct adapter *padapter, unsigned char *MacAddr, unsi
 	struct cmd_priv *pcmdpriv = &padapter->cmdpriv;
 
 	pcmd_obj = rtw_zmalloc(sizeof(struct cmd_obj));
-	if (!pcmd_obj) {
+	if (!pcmd_obj)
 		return;
-	}
 
 	cmdsz = (sizeof(struct stadel_event) + sizeof(struct C2HEvent_Header));
 	pevtcmd = rtw_zmalloc(cmdsz);
@@ -5124,9 +5103,8 @@ void survey_timer_hdl(struct timer_list *t)
 
 	/* issue rtw_sitesurvey_cmd */
 	if (pmlmeext->sitesurvey_res.state > SCAN_START) {
-		if (pmlmeext->sitesurvey_res.state ==  SCAN_PROCESS) {
+		if (pmlmeext->sitesurvey_res.state ==  SCAN_PROCESS)
 			pmlmeext->sitesurvey_res.channel_idx++;
-		}
 
 		if (pmlmeext->scan_abort) {
 			pmlmeext->sitesurvey_res.channel_idx = pmlmeext->sitesurvey_res.ch_num;
@@ -5135,9 +5113,8 @@ void survey_timer_hdl(struct timer_list *t)
 		}
 
 		ph2c = rtw_zmalloc(sizeof(struct cmd_obj));
-		if (!ph2c) {
+		if (!ph2c)
 			goto exit_survey_timer_hdl;
-		}
 
 		psurveyPara = rtw_zmalloc(sizeof(struct sitesurvey_parm));
 		if (!psurveyPara) {
@@ -5348,9 +5325,8 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 
 	/* check already connecting to AP or not */
 	if (pmlmeinfo->state & WIFI_FW_ASSOC_SUCCESS) {
-		if (pmlmeinfo->state & WIFI_FW_STATION_STATE) {
+		if (pmlmeinfo->state & WIFI_FW_STATION_STATE)
 			issue_deauth_ex(padapter, pnetwork->mac_address, WLAN_REASON_DEAUTH_LEAVING, 1, 100);
-		}
 		pmlmeinfo->state = WIFI_FW_NULL_STATE;
 
 		/* clear CAM */
-- 
2.25.1

