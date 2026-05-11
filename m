Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F2B466B71
	for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 18:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778523647; cv=none; b=Utb23yKOn9OuODphrlFGDvP4LSvMe+hkxLgfzOPXIo3PDcDeehBTWOrYxBtUT1R2q552fz4oUEP5yDWH+ORPW2sYM3F26L3bIaWGC+n68PfyroztkHoF1uc79KV0O4+XebGiJoCps3CnGmII7uBUe37DQcGVyStLTTj56+qKPC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778523647; c=relaxed/simple;
	bh=Yi+I3VbEXFpPWNyeCw3yICWAyV3Lgw7sX0/+YeLbwzA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rkaXUq1GRQLcOvypoI7zwSl4yCyPK95ozISXMhgaLX+H17Bv63YkhUeOIN6WxqImo76kRf1ebqXj3HdDRewYKqEl8MdBVfcXVOZTKrpu/d6znQaYFvkLzkYhwvH457yrPGF6Lb96V0O/uwfH184DElKvczpU9dchFo0aN+oyH/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UPTtQb4W; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UPTtQb4W"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ef38cf04f0so6977543eec.1
        for <linux-staging@lists.linux.dev>; Mon, 11 May 2026 11:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778523645; x=1779128445; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q4jxcm5677mNgE7SV2hBNxQ1/ouFisSqr+Illtus5Y8=;
        b=UPTtQb4W1LIWD3N0LuYF6TuwsMcVPlurSFsha13KLm0Y47T9Rt4KqplAM7V9qjKeQq
         bt4h7AwhhXf1k3kEXDfCq+r6HKXPN2tshvAKH2/bGemA0vORTz3kFDj5eAv/Ch5K+4YK
         f9g2E1Mg5vRLm131GxcO0xO3KGhFVibMEGIb+CtOi480kTWXpzBDKLBkMxXOh0gtKkNk
         QuK8uhFU7bytHS0mI9istlKm5QPdx7Ra39ZZAr+R3QHhL6aUxX2c4Rjb1z1dtjoed4Yp
         5giLuwisNjXN9paBQkpyb/qbPytY2K5gYgV8a1biWPZZfK6jOTb8aUer3Lo+ucSLq6/F
         rAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778523645; x=1779128445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q4jxcm5677mNgE7SV2hBNxQ1/ouFisSqr+Illtus5Y8=;
        b=Orgn69n08nVTj9JhWUJGc/A+Z/Vs5uWgH7F/R/UyR04Is4qWteeKkktkdR4bQdMHZu
         bcXbXyEnT8NkV3xy07oH29AR1g/eRbnlKEL4HH/8sAYEiM070OTFjcDnVvQpLpasfvhZ
         Xntxh/AELhjpXtPD+ZNxHR6QMyNXyIebVu1ke57rPpO7Y5hin4DxRlBmy6t7eh82EYPg
         bSW33wOwzXGsJfFMUfZ7HZC2W72kIsIUfG0qXMGrnz/MnGYLOI6nuZxgy57IOdu6rPjF
         z/tiTUuw+cicDHFk6dpkfv2XZdf7Nl0RuunqOatS9h2/ro5n8uhk2bYbMWr54jjWEhK+
         tAHQ==
X-Gm-Message-State: AOJu0YzkLE4pdXDjzzFleVSiHx932DFGLLoaLcuAPQx+lDWUYe4dKrwZ
	WO4TvIc3ezvJX7Hkc+qHuxCI70+hWRtiociW5DrH35tgTlGPhO3nD/UYOsITNw==
X-Gm-Gg: Acq92OEWimJVPngT/l/G5BMKizIVMlb3LiSN2n0TTd9Y5A87VEatqQb7DUz3Rn+UgW/
	/Cc+mw1libaHyLhpWI+sw5Eo8u4xFMQ5To+X9yrGSRXjH09a5xUYxL1TPthc+X8+ka6xnyk09Pm
	OYaLqq4xzOiZ4ouzwNdnvzYXFgrZLCxCd2h+QgXctiomsPBfEHoSCniB/YReB+6IfTWGr5umb73
	h/szbIwur22i8fAsJSraHxFmS6yyxNi+VwhpDzb3kZ+lvP1YgmWehDsObRbOKgDr0ulz/GGBU71
	1s5TUF2lUyFInT7sp88W/5kvV6TQf/TfznbYCYh7v1lDHvDqoRo8T14IowGuySZg/rtWDsTl6gK
	s+HbCOe7hW3XOadGcT28PH8dCLNcc77ctgMNlrlG/Uzh97mjzxSVRYG7mD+0R0I5tCl9F0CPRCG
	VOVl+GYgc9ymFwvSET6i9Kdp884wt3MWSXxAfAwwCZHIwYzmxsbEgg5A==
X-Received: by 2002:a05:7300:bd03:b0:2ee:ade0:e0bf with SMTP id 5a478bee46e88-2fb4c2ef659mr5028866eec.30.1778523644533;
        Mon, 11 May 2026 11:20:44 -0700 (PDT)
Received: from TestUbuntu22.. ([73.15.108.84])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-2f888c3b301sm17951816eec.23.2026.05.11.11.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 11:20:44 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Jennifer Guo <guojy.bj@gmail.com>
Subject: [PATCH 1/2] staging: rtl8723bs: remove unnecessary blank lines in rtw_mlme_ext.c
Date: Mon, 11 May 2026 11:20:37 -0700
Message-Id: <20260511182038.6625-2-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260511182038.6625-1-guojy.bj@gmail.com>
References: <20260511182038.6625-1-guojy.bj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary blank lines around braces {} to improve readability.

This fixes the following checkpatch.pl checks in rtw_mlme_ext.c:
- CHECK: Blank lines aren't necessary after an open brace '{'
- CHECK: Blank lines aren't necessary before a close brace '}'

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 54 -------------------
 1 file changed, 54 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index ba19a162896e..a86d6f97cf02 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -272,7 +272,6 @@ static void init_channel_list(struct adapter *padapter, struct rt_channel_info *
 							  u8 chanset_size,
 							  struct p2p_channels *channel_list)
 {
-
 	static const struct p2p_oper_class_map op_class[] = {
 		{ IEEE80211G,  81,   1,  13,  1, BW20 },
 		{ IEEE80211G,  82,  14,  14,  1, BW20 },
@@ -317,7 +316,6 @@ static void init_channel_list(struct adapter *padapter, struct rt_channel_info *
 		}
 	}
 	channel_list->reg_classes = cla;
-
 }
 
 static u8 init_channel_set(struct adapter *padapter, u8 ChannelPlan, struct rt_channel_info *channel_set)
@@ -534,7 +532,6 @@ unsigned int OnProbeReq(struct adapter *padapter, union recv_frame *precv_frame)
 	}
 
 	return _SUCCESS;
-
 }
 
 unsigned int OnProbeRsp(struct adapter *padapter, union recv_frame *precv_frame)
@@ -547,7 +544,6 @@ unsigned int OnProbeRsp(struct adapter *padapter, union recv_frame *precv_frame)
 	}
 
 	return _SUCCESS;
-
 }
 
 unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
@@ -660,7 +656,6 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 _END_ONBEACON_:
 
 	return _SUCCESS;
-
 }
 
 unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
@@ -727,7 +722,6 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 
 	pstat = rtw_get_stainfo(pstapriv, sa);
 	if (!pstat) {
-
 		/*  allocate a new one */
 		pstat = rtw_alloc_stainfo(pstapriv, sa);
 		if (!pstat) {
@@ -741,7 +735,6 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 		/* pstat->flags = 0; */
 		/* pstat->capability = 0; */
 	} else {
-
 		spin_lock_bh(&pstapriv->asoc_list_lock);
 		if (!list_empty(&pstat->asoc_list)) {
 			list_del_init(&pstat->asoc_list);
@@ -759,7 +752,6 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 
 	spin_lock_bh(&pstapriv->auth_list_lock);
 	if (list_empty(&pstat->auth_list)) {
-
 		list_add_tail(&pstat->auth_list, &pstapriv->auth_list);
 		pstapriv->auth_list_cnt++;
 	}
@@ -792,7 +784,6 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 			pstat->state |= WIFI_FW_AUTH_STATE;
 			pstat->authalg = algorithm;
 		} else if (seq == 3) {
-
 			p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + 4 + _AUTH_IE_OFFSET_, WLAN_EID_CHALLENGE, (int *)&ie_len,
 					len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_ - 4);
 
@@ -839,7 +830,6 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	issue_auth(padapter, pstat, (unsigned short)status);
 
 	return _FAIL;
-
 }
 
 unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_frame)
@@ -916,7 +906,6 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 	/* pmlmeinfo->state &= ~(WIFI_FW_AUTH_STATE); */
 
 	return _FAIL;
-
 }
 
 unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
@@ -1028,7 +1017,6 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + ie_offset, WLAN_EID_EXT_SUPP_RATES, &ie_len,
 				pkt_len - WLAN_HDR_A3_LEN - ie_offset);
 		if (p) {
-
 			if (support_rate_num + ie_len <= sizeof(supportRate)) {
 				memcpy(supportRate + support_rate_num, p + 2, ie_len);
 				support_rate_num += ie_len;
@@ -1053,7 +1041,6 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	pstat->wpa2_pairwise_cipher = 0;
 	memset(pstat->wpa_ie, 0, sizeof(pstat->wpa_ie));
 	if ((psecuritypriv->wpa_psk & BIT(1)) && elems.rsn_ie) {
-
 		int group_cipher = 0, pairwise_cipher = 0;
 
 		wpa_ie = elems.rsn_ie;
@@ -1076,7 +1063,6 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		}
 
 	} else if ((psecuritypriv->wpa_psk & BIT(0)) && elems.wpa_ie) {
-
 		int group_cipher = 0, pairwise_cipher = 0;
 
 		wpa_ie = elems.wpa_ie;
@@ -1138,7 +1124,6 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 			status = WLAN_STATUS_INVALID_IE;
 
 			goto OnAssocReqFail;
-
 		}
 
 		if (elems.wps_ie) {
@@ -1150,7 +1135,6 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 
 		if (copy_len > 0)
 			memcpy(pstat->wpa_ie, wpa_ie-2, copy_len);
-
 	}
 
 	/*  check if there is WMM IE & support WWM-PS */
@@ -1206,7 +1190,6 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 					pstat->uapsd_be = BIT(0)|BIT(1);
 				else
 					pstat->uapsd_be = 0;
-
 			}
 
 			break;
@@ -1263,7 +1246,6 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 
 		/* if (pstat->aid > NUM_STA) { */
 		if (pstat->aid > pstapriv->max_num_sta) {
-
 			pstat->aid = 0;
 
 			status = WLAN_STATUS_AP_UNABLE_TO_HANDLE_NEW_STA;
@@ -1461,7 +1443,6 @@ unsigned int OnDeAuth(struct adapter *padapter, union recv_frame *precv_frame)
 				list_del_init(&psta->asoc_list);
 				pstapriv->asoc_list_cnt--;
 				updated = ap_free_sta(padapter, psta, false, reason);
-
 			}
 			spin_unlock_bh(&pstapriv->asoc_list_lock);
 
@@ -1532,7 +1513,6 @@ unsigned int OnDisassoc(struct adapter *padapter, union recv_frame *precv_frame)
 				list_del_init(&psta->asoc_list);
 				pstapriv->asoc_list_cnt--;
 				updated = ap_free_sta(padapter, psta, false, reason);
-
 			}
 			spin_unlock_bh(&pstapriv->asoc_list_lock);
 
@@ -1549,7 +1529,6 @@ unsigned int OnDisassoc(struct adapter *padapter, union recv_frame *precv_frame)
 
 	pmlmepriv->link_detect_info.busy_traffic = false;
 	return _SUCCESS;
-
 }
 
 unsigned int OnAtim(struct adapter *padapter, union recv_frame *precv_frame)
@@ -1857,11 +1836,9 @@ unsigned int OnAction(struct adapter *padapter, union recv_frame *precv_frame)
 
 		if (category == ptable->num)
 			ptable->func(padapter, precv_frame);
-
 	}
 
 	return _SUCCESS;
-
 }
 
 unsigned int DoReserved(struct adapter *padapter, union recv_frame *precv_frame)
@@ -1896,7 +1873,6 @@ static struct xmit_frame *_alloc_mgtxmitframe(struct xmit_priv *pxmitpriv, bool
 
 exit:
 	return pmgntframe;
-
 }
 
 inline struct xmit_frame *alloc_mgtxmitframe(struct xmit_priv *pxmitpriv)
@@ -1949,7 +1925,6 @@ void update_mgntframe_attrib(struct adapter *padapter, struct pkt_attrib *pattri
 	pattrib->retry_ctrl = true;
 
 	pattrib->mbssid = 0;
-
 }
 
 void update_mgntframe_attrib_addr(struct adapter *padapter, struct xmit_frame *pmgntframe)
@@ -2139,7 +2114,6 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 		}
 
 		goto _issue_bcn;
-
 	}
 
 	/* below for ad-hoc mode */
@@ -2206,7 +2180,6 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 		dump_mgntframe_and_wait(padapter, pmgntframe, timeout_ms);
 	else
 		dump_mgntframe(padapter, pmgntframe);
-
 }
 
 void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p_probereq)
@@ -2388,7 +2361,6 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 			pframe = rtw_set_ie(pframe, WLAN_EID_EXT_SUPP_RATES, (rate_len - 8), (cur_network->supported_rates + 8), &pattrib->pktlen);
 
 		/* todo:HT for adhoc */
-
 	}
 
 	pattrib->last_txcmdsz = pattrib->pktlen;
@@ -2641,9 +2613,7 @@ void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short
 			pattrib->icv_len = 4;
 
 			pattrib->pktlen += pattrib->icv_len;
-
 		}
-
 	}
 
 	pattrib->last_txcmdsz = pattrib->pktlen;
@@ -2737,7 +2707,6 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 			pframe += (ie_len+2);
 			pattrib->pktlen += (ie_len+2);
 		}
-
 	}
 
 	/* FILL WMM IE */
@@ -2758,7 +2727,6 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 			if (!pbuf || ie_len == 0)
 				break;
 		}
-
 	}
 
 	if (pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_REALTEK)
@@ -3576,7 +3544,6 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 		iedata |= BIT(2);/* 20 MHz BSS Width Request */
 
 		pframe = rtw_set_ie(pframe, WLAN_EID_BSS_COEX_2040,  1, &iedata, &(pattrib->pktlen));
-
 	}
 
 	/*  */
@@ -3614,7 +3581,6 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 				if (ICS[0][0] == 0)
 					ICS[0][0] = 1;
 			}
-
 		}
 
 		spin_unlock_bh(&(pmlmepriv->scanned_queue.lock));
@@ -3641,9 +3607,7 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 			}
 
 			pframe = rtw_set_ie(pframe, WLAN_EID_BSS_INTOLERANT_CHL_REPORT, k, InfoContent, &(pattrib->pktlen));
-
 		}
-
 	}
 
 	pattrib->last_txcmdsz = pattrib->pktlen;
@@ -3682,13 +3646,11 @@ unsigned int send_delba(struct adapter *padapter, u8 initiator, u8 *addr)
 				issue_action_BA(padapter, addr, WLAN_ACTION_DELBA, (((tid << 1) | initiator)&0x1F));
 				psta->htpriv.agg_enable_bitmap &= ~BIT(tid);
 				psta->htpriv.candidate_tid_bitmap &= ~BIT(tid);
-
 			}
 		}
 	}
 
 	return _SUCCESS;
-
 }
 
 unsigned int send_beacon(struct adapter *padapter)
@@ -3779,7 +3741,6 @@ void site_survey(struct adapter *padapter)
 
 		set_survey_timer(pmlmeext, channel_scan_time_ms);
 	} else {
-
 		/* channel number is 0 or this channel is not valid. */
 
 		{
@@ -4029,7 +3990,6 @@ void start_create_ibss(struct adapter *padapter)
 	}
 	/* update bc/mc sta_info */
 	update_bmc_sta(padapter);
-
 }
 
 void start_clnt_join(struct adapter *padapter)
@@ -4088,7 +4048,6 @@ void start_clnt_join(struct adapter *padapter)
 	} else {
 		return;
 	}
-
 }
 
 void start_clnt_auth(struct adapter *padapter)
@@ -4111,7 +4070,6 @@ void start_clnt_auth(struct adapter *padapter)
 	issue_auth(padapter, NULL, 0);
 
 	set_link_timer(pmlmeext, REAUTH_TO);
-
 }
 
 void start_clnt_assoc(struct adapter *padapter)
@@ -4245,7 +4203,6 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 			while ((i < MAX_CHANNEL_NUM) &&
 				(chplan_sta[i].ChannelNum != 0) &&
 				(chplan_sta[i].ChannelNum <= 14)) {
-
 				chplan_new[k].ChannelNum = chplan_sta[i].ChannelNum;
 				chplan_new[k].ScanType = SCAN_PASSIVE;
 				i++;
@@ -4614,7 +4571,6 @@ void update_sta_info(struct adapter *padapter, struct sta_info *psta)
 		psta->htpriv.sgi_20m = false;
 		psta->htpriv.sgi_40m = false;
 		psta->qos_option = false;
-
 	}
 
 	psta->htpriv.ch_offset = pmlmeext->cur_ch_offset;
@@ -4633,7 +4589,6 @@ void update_sta_info(struct adapter *padapter, struct sta_info *psta)
 	spin_lock_bh(&psta->lock);
 	psta->state = _FW_LINKED;
 	spin_unlock_bh(&psta->lock);
-
 }
 
 static void rtw_mlmeext_disconnect(struct adapter *padapter)
@@ -4679,7 +4634,6 @@ static void rtw_mlmeext_disconnect(struct adapter *padapter)
 
 	pmlmepriv->link_detect_info.traffic_transition_count = 0;
 	pmlmepriv->link_detect_info.low_power_transition_count = 0;
-
 }
 
 void mlmeext_joinbss_event_callback(struct adapter *padapter, int join_res)
@@ -4786,7 +4740,6 @@ void mlmeext_sta_add_event_callback(struct adapter *padapter, struct sta_info *p
 			}
 
 			pmlmeinfo->state |= WIFI_FW_ASSOC_SUCCESS;
-
 		}
 
 		join_type = 2;
@@ -4828,7 +4781,6 @@ void _linked_info_dump(struct adapter *padapter)
 	struct dvobj_priv *pdvobj = adapter_to_dvobj(padapter);
 
 	if (padapter->bLinkInfoDump) {
-
 		if ((pmlmeinfo->state&0x03) == WIFI_FW_STATION_STATE)
 			rtw_hal_get_def_var(padapter,
 					    HAL_DEF_UNDERCORATEDSMOOTHEDPWDB,
@@ -5055,7 +5007,6 @@ void addba_timer_hdl(struct timer_list *t)
 	if (phtpriv->ht_option && phtpriv->ampdu_enable) {
 		if (phtpriv->candidate_tid_bitmap)
 			phtpriv->candidate_tid_bitmap = 0x0;
-
 	}
 }
 
@@ -5164,11 +5115,9 @@ u8 createbss_hdl(struct adapter *padapter, u8 *pbuf)
 		memcpy(pnetwork->ies, ((struct wlan_bssid_ex *)pbuf)->ies, pnetwork->ie_length);
 
 		start_create_ibss(padapter);
-
 	}
 
 	return H2C_SUCCESS;
-
 }
 
 u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
@@ -5311,7 +5260,6 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 	start_clnt_join(padapter);
 
 	return H2C_SUCCESS;
-
 }
 
 u8 disconnect_hdl(struct adapter *padapter, unsigned char *pbuf)
@@ -5351,7 +5299,6 @@ static int rtw_scan_ch_decision(struct adapter *padapter, struct rtw_ieee80211_c
 	/* acquire channels from in */
 	j = 0;
 	for (i = 0; i < in_num; i++) {
-
 		set_idx = rtw_ch_set_search_ch(pmlmeext->channel_set, in[i].hw_value);
 		if (in[i].hw_value && !(in[i].flags & RTW_IEEE80211_CHAN_DISABLED)
 			&& set_idx >= 0
@@ -5377,7 +5324,6 @@ static int rtw_scan_ch_decision(struct adapter *padapter, struct rtw_ieee80211_c
 	/* if out is empty, use channel_set as default */
 	if (j == 0) {
 		for (i = 0; i < pmlmeext->max_chan_nums; i++) {
-
 			if (j >= out_num) {
 				netdev_dbg(padapter->pnetdev,
 					   FUNC_ADPT_FMT " out_num:%u not enough\n",
-- 
2.34.1

