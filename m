Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5723988E3
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 10:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776075352; cv=none; b=cyFQXFeYRv6+UCboOUesjRilukSoptm2QAc0jELU85Dt9lwFnzF7hUznHf4o/i4FnTcQXAujjkuVHRvzDsguibilA1HzLUNtHarOXPzgPGwuI6FVTSHDK6U1V+KPTQYuUhLRyw3wuR9IMrgJh6mSWaXUaplsz2o+O+Rw2oq4SvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776075352; c=relaxed/simple;
	bh=s26qjEBdRBuekJ1OQklu/aJ2s6i3w1YLlammy4HnsgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GKvmrL/u/ez3FX5nMSJWnYgGu7WjvgzjniyIgx+R8Ihtd+tOhgX4xZbCvDqihYyTREPstJmBRTTNY00i6F7U6bhdsxJZX4je33UHm76iaLWWFEp7Xjwh3+4iaXwL8HFmn7Obn2bMtyUbhjGTanRww2dN4b9jZ1kPGAa10eQH/Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Pw+u0PHe; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Pw+u0PHe"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776075348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NpxRsac8NiHAmsoyXEN6ICiA4iIU5Im8l/rci7jzfN0=;
	b=Pw+u0PHe91XFRIyht4UgDJKhjF8bLcjG3WVg0q3npKhx/snOHCYqD8o6zDe50HWUKzb/mB
	gesP7Pgc2kQvWYrOfyEzTzTnTIfnReSrkV5QVmH7zCq5y2aNt7Di2S1C87YOKts9vIVlEe
	yhn7oxcx1kWY+rByG+zqvWNSZfAQgYk=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH 07/11] staging: rtl8723bs: core: remove blank lines before closing brace
Date: Mon, 13 Apr 2026 12:14:28 +0200
Message-ID: <20260413101432.158925-8-luka.gejak@linux.dev>
In-Reply-To: <20260413101432.158925-1-luka.gejak@linux.dev>
References: <20260413101432.158925-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Luka Gejak <luka.gejak@linux.dev>

Remove empty lines immediately preceding a closing brace in the core
directory to adhere to the Linux kernel coding style. This resolves
"Blank lines aren't necessary before a close brace" warnings reported
by checkpatch.pl.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 .../staging/rtl8723bs/core/rtw_ieee80211.c    |  1 -
 .../staging/rtl8723bs/core/rtw_ioctl_set.c    |  3 -
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 60 -------------------
 drivers/staging/rtl8723bs/core/rtw_recv.c     | 38 ------------
 drivers/staging/rtl8723bs/core/rtw_security.c |  3 -
 5 files changed, 105 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 13f0120ddaed..305982c43613 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -593,7 +593,6 @@ int rtw_get_wapi_ie(u8 *in_ie, uint in_len, u8 *wapi_ie, u16 *wapi_len)
 
 			if (wapi_len)
 				*wapi_len = in_ie[cnt + 1] + 2;
-
 		}
 
 		cnt += in_ie[cnt + 1] + 2;   /* get next */
diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 380ce8c89670..5eaf47c6ccb3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -120,9 +120,7 @@ u8 rtw_do_join(struct adapter *padapter)
 					pmlmepriv->to_join = false;
 				}
 			}
-
 		}
-
 	}
 
 exit:
@@ -417,7 +415,6 @@ u8 rtw_set_802_11_authentication_mode(struct adapter *padapter, enum ndis_802_11
 
 u8 rtw_set_802_11_add_wep(struct adapter *padapter, struct ndis_802_11_wep *wep)
 {
-
 	signed int		keyid, res;
 	struct security_priv *psecuritypriv = &(padapter->securitypriv);
 	u8 ret = _SUCCESS;
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 53af3902f716..00beb68c3439 100644
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
@@ -539,7 +537,6 @@ unsigned int OnProbeReq(struct adapter *padapter, union recv_frame *precv_frame)
 	}
 
 	return _SUCCESS;
-
 }
 
 unsigned int OnProbeRsp(struct adapter *padapter, union recv_frame *precv_frame)
@@ -552,7 +549,6 @@ unsigned int OnProbeRsp(struct adapter *padapter, union recv_frame *precv_frame)
 	}
 
 	return _SUCCESS;
-
 }
 
 unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
@@ -665,7 +661,6 @@ unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame)
 _END_ONBEACON_:
 
 	return _SUCCESS;
-
 }
 
 unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
@@ -732,7 +727,6 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 
 	pstat = rtw_get_stainfo(pstapriv, sa);
 	if (!pstat) {
-
 		/*  allocate a new one */
 		pstat = rtw_alloc_stainfo(pstapriv, sa);
 		if (!pstat) {
@@ -746,7 +740,6 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 		/* pstat->flags = 0; */
 		/* pstat->capability = 0; */
 	} else {
-
 		spin_lock_bh(&pstapriv->asoc_list_lock);
 		if (list_empty(&pstat->asoc_list) == false) {
 			list_del_init(&pstat->asoc_list);
@@ -764,7 +757,6 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 
 	spin_lock_bh(&pstapriv->auth_list_lock);
 	if (list_empty(&pstat->auth_list)) {
-
 		list_add_tail(&pstat->auth_list, &pstapriv->auth_list);
 		pstapriv->auth_list_cnt++;
 	}
@@ -798,7 +790,6 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 			pstat->state |= WIFI_FW_AUTH_STATE;
 			pstat->authalg = algorithm;
 		} else if (seq == 3) {
-
 			p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + 4 + _AUTH_IE_OFFSET_, WLAN_EID_CHALLENGE, (int *)&ie_len,
 				       len - WLAN_HDR_A3_LEN - _AUTH_IE_OFFSET_ - 4);
 
@@ -847,7 +838,6 @@ unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame)
 	issue_auth(padapter, pstat, (unsigned short)status);
 
 	return _FAIL;
-
 }
 
 unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_frame)
@@ -924,7 +914,6 @@ unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_fram
 	/* pmlmeinfo->state &= ~(WIFI_FW_AUTH_STATE); */
 
 	return _FAIL;
-
 }
 
 unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
@@ -1038,7 +1027,6 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		p = rtw_get_ie(pframe + WLAN_HDR_A3_LEN + ie_offset, WLAN_EID_EXT_SUPP_RATES, &ie_len,
 			       pkt_len - WLAN_HDR_A3_LEN - ie_offset);
 		if (p) {
-
 			if (support_rate_num + ie_len <= sizeof(supportRate)) {
 				memcpy(supportRate + support_rate_num, p + 2, ie_len);
 				support_rate_num += ie_len;
@@ -1063,7 +1051,6 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 	pstat->wpa2_pairwise_cipher = 0;
 	memset(pstat->wpa_ie, 0, sizeof(pstat->wpa_ie));
 	if ((psecuritypriv->wpa_psk & BIT(1)) && elems.rsn_ie) {
-
 		int group_cipher = 0, pairwise_cipher = 0;
 
 		wpa_ie = elems.rsn_ie;
@@ -1086,7 +1073,6 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 		}
 
 	} else if ((psecuritypriv->wpa_psk & BIT(0)) && elems.wpa_ie) {
-
 		int group_cipher = 0, pairwise_cipher = 0;
 
 		wpa_ie = elems.wpa_ie;
@@ -1149,7 +1135,6 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 			status = WLAN_STATUS_INVALID_IE;
 
 			goto OnAssocReqFail;
-
 		}
 
 		if (elems.wps_ie) {
@@ -1162,7 +1147,6 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 
 		if (copy_len > 0)
 			memcpy(pstat->wpa_ie, wpa_ie - 2, copy_len);
-
 	}
 
 
@@ -1219,7 +1203,6 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 					pstat->uapsd_be = BIT(0) | BIT(1);
 				else
 					pstat->uapsd_be = 0;
-
 			}
 
 			break;
@@ -1278,7 +1261,6 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 
 		/* if (pstat->aid > NUM_STA) { */
 		if (pstat->aid > pstapriv->max_num_sta) {
-
 			pstat->aid = 0;
 
 			status = WLAN_STATUS_AP_UNABLE_TO_HANDLE_NEW_STA;
@@ -1478,7 +1460,6 @@ unsigned int OnDeAuth(struct adapter *padapter, union recv_frame *precv_frame)
 				list_del_init(&psta->asoc_list);
 				pstapriv->asoc_list_cnt--;
 				updated = ap_free_sta(padapter, psta, false, reason);
-
 			}
 			spin_unlock_bh(&pstapriv->asoc_list_lock);
 
@@ -1550,7 +1531,6 @@ unsigned int OnDisassoc(struct adapter *padapter, union recv_frame *precv_frame)
 				list_del_init(&psta->asoc_list);
 				pstapriv->asoc_list_cnt--;
 				updated = ap_free_sta(padapter, psta, false, reason);
-
 			}
 			spin_unlock_bh(&pstapriv->asoc_list_lock);
 
@@ -1567,7 +1547,6 @@ unsigned int OnDisassoc(struct adapter *padapter, union recv_frame *precv_frame)
 
 	pmlmepriv->link_detect_info.busy_traffic = false;
 	return _SUCCESS;
-
 }
 
 unsigned int OnAtim(struct adapter *padapter, union recv_frame *precv_frame)
@@ -1875,11 +1854,9 @@ unsigned int OnAction(struct adapter *padapter, union recv_frame *precv_frame)
 
 		if (category == ptable->num)
 			ptable->func(padapter, precv_frame);
-
 	}
 
 	return _SUCCESS;
-
 }
 
 unsigned int DoReserved(struct adapter *padapter, union recv_frame *precv_frame)
@@ -1914,7 +1891,6 @@ static struct xmit_frame *_alloc_mgtxmitframe(struct xmit_priv *pxmitpriv, bool
 
 exit:
 	return pmgntframe;
-
 }
 
 inline struct xmit_frame *alloc_mgtxmitframe(struct xmit_priv *pxmitpriv)
@@ -1967,7 +1943,6 @@ void update_mgntframe_attrib(struct adapter *padapter, struct pkt_attrib *pattri
 	pattrib->retry_ctrl = true;
 
 	pattrib->mbssid = 0;
-
 }
 
 void update_mgntframe_attrib_addr(struct adapter *padapter, struct xmit_frame *pmgntframe)
@@ -2158,7 +2133,6 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 		}
 
 		goto _issue_bcn;
-
 	}
 
 	/* below for ad-hoc mode */
@@ -2227,7 +2201,6 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 		dump_mgntframe_and_wait(padapter, pmgntframe, timeout_ms);
 	else
 		dump_mgntframe(padapter, pmgntframe);
-
 }
 
 void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p_probereq)
@@ -2412,7 +2385,6 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 
 
 		/* todo:HT for adhoc */
-
 	}
 
 	pattrib->last_txcmdsz = pattrib->pktlen;
@@ -2421,7 +2393,6 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 	dump_mgntframe(padapter, pmgntframe);
 
 	return;
-
 }
 
 static int _issue_probereq(struct adapter *padapter,
@@ -2672,9 +2643,7 @@ void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short
 			pattrib->icv_len = 4;
 
 			pattrib->pktlen += pattrib->icv_len;
-
 		}
-
 	}
 
 	pattrib->last_txcmdsz = pattrib->pktlen;
@@ -2771,7 +2740,6 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 			pframe += (ie_len + 2);
 			pattrib->pktlen += (ie_len + 2);
 		}
-
 	}
 
 	/* FILL WMM IE */
@@ -2792,7 +2760,6 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 			if (!pbuf || ie_len == 0)
 				break;
 		}
-
 	}
 
 	if (pmlmeinfo->assoc_AP_vendor == HT_IOT_PEER_REALTEK)
@@ -3619,7 +3586,6 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 		iedata |= BIT(2);/* 20 MHz BSS Width Request */
 
 		pframe = rtw_set_ie(pframe, WLAN_EID_BSS_COEX_2040,  1, &iedata, &(pattrib->pktlen));
-
 	}
 
 
@@ -3658,7 +3624,6 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 				if (ICS[0][0] == 0)
 					ICS[0][0] = 1;
 			}
-
 		}
 
 		spin_unlock_bh(&(pmlmepriv->scanned_queue.lock));
@@ -3686,9 +3651,7 @@ static void issue_action_BSSCoexistPacket(struct adapter *padapter)
 			}
 
 			pframe = rtw_set_ie(pframe, WLAN_EID_BSS_INTOLERANT_CHL_REPORT, k, InfoContent, &(pattrib->pktlen));
-
 		}
-
 	}
 
 
@@ -3728,13 +3691,11 @@ unsigned int send_delba(struct adapter *padapter, u8 initiator, u8 *addr)
 				issue_action_BA(padapter, addr, WLAN_ACTION_DELBA, (((tid << 1) | initiator) & 0x1F));
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
@@ -3839,7 +3800,6 @@ void site_survey(struct adapter *padapter)
 
 		set_survey_timer(pmlmeext, channel_scan_time_ms);
 	} else {
-
 		/* channel number is 0 or this channel is not valid. */
 
 		{
@@ -3881,7 +3841,6 @@ void site_survey(struct adapter *padapter)
 	}
 
 	return;
-
 }
 
 /* collect bss info from Beacon and Probe request/response frames. */
@@ -4092,7 +4051,6 @@ void start_create_ibss(struct adapter *padapter)
 	}
 	/* update bc/mc sta_info */
 	update_bmc_sta(padapter);
-
 }
 
 void start_clnt_join(struct adapter *padapter)
@@ -4151,7 +4109,6 @@ void start_clnt_join(struct adapter *padapter)
 	} else {
 		return;
 	}
-
 }
 
 void start_clnt_auth(struct adapter *padapter)
@@ -4175,7 +4132,6 @@ void start_clnt_auth(struct adapter *padapter)
 	issue_auth(padapter, NULL, 0);
 
 	set_link_timer(pmlmeext, REAUTH_TO);
-
 }
 
 
@@ -4311,7 +4267,6 @@ static void process_80211d(struct adapter *padapter, struct wlan_bssid_ex *bssid
 			while ((i < MAX_CHANNEL_NUM) &&
 			       (chplan_sta[i].ChannelNum != 0) &&
 				(chplan_sta[i].ChannelNum <= 14)) {
-
 				chplan_new[k].ChannelNum = chplan_sta[i].ChannelNum;
 				chplan_new[k].ScanType = SCAN_PASSIVE;
 				i++;
@@ -4418,7 +4373,6 @@ void report_survey_event(struct adapter *padapter, union recv_frame *precv_frame
 	pmlmeext->sitesurvey_res.bss_cnt++;
 
 	return;
-
 }
 
 void report_surveydone_event(struct adapter *padapter)
@@ -4462,7 +4416,6 @@ void report_surveydone_event(struct adapter *padapter)
 	rtw_enqueue_cmd(pcmdpriv, pcmd_obj);
 
 	return;
-
 }
 
 void report_join_res(struct adapter *padapter, int res)
@@ -4512,7 +4465,6 @@ void report_join_res(struct adapter *padapter, int res)
 	rtw_enqueue_cmd(pcmdpriv, pcmd_obj);
 
 	return;
-
 }
 
 void report_wmm_edca_update(struct adapter *padapter)
@@ -4556,7 +4508,6 @@ void report_wmm_edca_update(struct adapter *padapter)
 	rtw_enqueue_cmd(pcmdpriv, pcmd_obj);
 
 	return;
-
 }
 
 void report_del_sta_event(struct adapter *padapter, unsigned char *MacAddr, unsigned short reason)
@@ -4695,7 +4646,6 @@ void update_sta_info(struct adapter *padapter, struct sta_info *psta)
 		psta->htpriv.sgi_20m = false;
 		psta->htpriv.sgi_40m = false;
 		psta->qos_option = false;
-
 	}
 
 	psta->htpriv.ch_offset = pmlmeext->cur_ch_offset;
@@ -4714,7 +4664,6 @@ void update_sta_info(struct adapter *padapter, struct sta_info *psta)
 	spin_lock_bh(&psta->lock);
 	psta->state = _FW_LINKED;
 	spin_unlock_bh(&psta->lock);
-
 }
 
 static void rtw_mlmeext_disconnect(struct adapter *padapter)
@@ -4760,7 +4709,6 @@ static void rtw_mlmeext_disconnect(struct adapter *padapter)
 
 	pmlmepriv->link_detect_info.traffic_transition_count = 0;
 	pmlmepriv->link_detect_info.low_power_transition_count = 0;
-
 }
 
 void mlmeext_joinbss_event_callback(struct adapter *padapter, int join_res)
@@ -4868,7 +4816,6 @@ void mlmeext_sta_add_event_callback(struct adapter *padapter, struct sta_info *p
 			}
 
 			pmlmeinfo->state |= WIFI_FW_ASSOC_SUCCESS;
-
 		}
 
 		join_type = 2;
@@ -4910,7 +4857,6 @@ void _linked_info_dump(struct adapter *padapter)
 	struct dvobj_priv *pdvobj = adapter_to_dvobj(padapter);
 
 	if (padapter->bLinkInfoDump) {
-
 		if ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE)
 			rtw_hal_get_def_var(padapter,
 					    HAL_DEF_UNDERCORATEDSMOOTHEDPWDB,
@@ -5138,7 +5084,6 @@ void addba_timer_hdl(struct timer_list *t)
 	if (phtpriv->ht_option && phtpriv->ampdu_enable) {
 		if (phtpriv->candidate_tid_bitmap)
 			phtpriv->candidate_tid_bitmap = 0x0;
-
 	}
 }
 
@@ -5247,11 +5192,9 @@ u8 createbss_hdl(struct adapter *padapter, u8 *pbuf)
 		memcpy(pnetwork->ies, ((struct wlan_bssid_ex *)pbuf)->ies, pnetwork->ie_length);
 
 		start_create_ibss(padapter);
-
 	}
 
 	return H2C_SUCCESS;
-
 }
 
 u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
@@ -5395,7 +5338,6 @@ u8 join_cmd_hdl(struct adapter *padapter, u8 *pbuf)
 	start_clnt_join(padapter);
 
 	return H2C_SUCCESS;
-
 }
 
 u8 disconnect_hdl(struct adapter *padapter, unsigned char *pbuf)
@@ -5435,7 +5377,6 @@ static int rtw_scan_ch_decision(struct adapter *padapter, struct rtw_ieee80211_c
 	/* acquire channels from in */
 	j = 0;
 	for (i = 0; i < in_num; i++) {
-
 		set_idx = rtw_ch_set_search_ch(pmlmeext->channel_set, in[i].hw_value);
 		if (in[i].hw_value && !(in[i].flags & RTW_IEEE80211_CHAN_DISABLED)
 			&& set_idx >= 0
@@ -5461,7 +5402,6 @@ static int rtw_scan_ch_decision(struct adapter *padapter, struct rtw_ieee80211_c
 	/* if out is empty, use channel_set as default */
 	if (j == 0) {
 		for (i = 0; i < pmlmeext->max_chan_nums; i++) {
-
 			if (j >= out_num) {
 				netdev_dbg(padapter->pnetdev,
 					   FUNC_ADPT_FMT " out_num:%u not enough\n",
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index f3c1ed9823f9..6d38fffa98dc 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -73,7 +73,6 @@ signed int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *pada
 
 		precvframe->u.hdr.adapter = padapter;
 		precvframe++;
-
 	}
 
 	res = rtw_hal_init_recv_priv(padapter);
@@ -115,7 +114,6 @@ void _rtw_free_recv_priv(struct recv_priv *precvpriv)
 
 union recv_frame *_rtw_alloc_recvframe(struct __queue *pfree_recv_queue)
 {
-
 	union recv_frame  *precvframe;
 	struct list_head	*plist, *phead;
 	struct adapter *padapter;
@@ -185,7 +183,6 @@ int rtw_free_recvframe(union recv_frame *precvframe, struct __queue *pfree_recv_
 
 signed int _rtw_enqueue_recvframe(union recv_frame *precvframe, struct __queue *queue)
 {
-
 	struct adapter *padapter = precvframe->u.hdr.adapter;
 	struct recv_priv *precvpriv = &padapter->recvpriv;
 
@@ -279,7 +276,6 @@ signed int rtw_enqueue_recvbuf(struct recv_buf *precvbuf, struct __queue *queue)
 	list_add_tail(&precvbuf->list, get_list_head(queue));
 	spin_unlock_bh(&queue->lock);
 	return _SUCCESS;
-
 }
 
 struct recv_buf *rtw_dequeue_recvbuf(struct __queue *queue)
@@ -299,13 +295,11 @@ struct recv_buf *rtw_dequeue_recvbuf(struct __queue *queue)
 		precvbuf = container_of(plist, struct recv_buf, list);
 
 		list_del_init(&precvbuf->list);
-
 	}
 
 	spin_unlock_bh(&queue->lock);
 
 	return precvbuf;
-
 }
 
 static void rtw_handle_tkip_mic_err(struct adapter *padapter, u8 bgroup)
@@ -354,7 +348,6 @@ static void rtw_handle_tkip_mic_err(struct adapter *padapter, u8 bgroup)
 
 static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *precvframe)
 {
-
 	signed int	i, res = _SUCCESS;
 	u32 datalen;
 	u8 miccode[8];
@@ -426,18 +419,15 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
 		}
 
 		recvframe_pull_tail(precvframe, 8);
-
 	}
 
 exit:
 	return res;
-
 }
 
 /* decrypt and set the ivlen, icvlen of the recv_frame */
 static union recv_frame *decryptor(struct adapter *padapter, union recv_frame *precv_frame)
 {
-
 	struct rx_pkt_attrib *prxattrib = &precv_frame->u.hdr.attrib;
 	struct security_priv *psecuritypriv = &padapter->securitypriv;
 	union recv_frame *return_packet = precv_frame;
@@ -582,7 +572,6 @@ static signed int recv_decache(union recv_frame *precv_frame, u8 bretry, struct
 	prxcache->tid_rxseq[tid] = seq_ctrl;
 
 	return _SUCCESS;
-
 }
 
 static void process_pwrbit_data(struct adapter *padapter, union recv_frame *precv_frame)
@@ -604,7 +593,6 @@ static void process_pwrbit_data(struct adapter *padapter, union recv_frame *prec
 				/* pstapriv->sta_dz_bitmap |= BIT(psta->aid); */
 
 				stop_sta_xmit(padapter, psta);
-
 			}
 		} else {
 			if (psta->state & WIFI_SLEEP_STATE) {
@@ -614,7 +602,6 @@ static void process_pwrbit_data(struct adapter *padapter, union recv_frame *prec
 				wakeup_sta_to_xmit(padapter, psta);
 			}
 		}
-
 	}
 }
 
@@ -715,7 +702,6 @@ static signed int sta2sta_data_frame(struct adapter *adapter, union recv_frame *
 
 	if ((check_fwstate(pmlmepriv, WIFI_ADHOC_STATE) == true) ||
 	    (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE) == true)) {
-
 		/*  filter packets that SA is myself or multicast or broadcast */
 		if (!memcmp(myhwaddr, pattrib->src, ETH_ALEN)) {
 			ret = _FAIL;
@@ -804,7 +790,6 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
 	    (check_fwstate(pmlmepriv, _FW_LINKED) == true ||
 	     check_fwstate(pmlmepriv, _FW_UNDER_LINKING) == true)
 		) {
-
 		/*  filter packets that SA is myself or multicast or broadcast */
 		if (!memcmp(myhwaddr, pattrib->src, ETH_ALEN)) {
 			ret = _FAIL;
@@ -822,7 +807,6 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
 		if (is_zero_ether_addr(pattrib->bssid) ||
 		    is_zero_ether_addr(mybssid) ||
 		    (memcmp(pattrib->bssid, mybssid, ETH_ALEN))) {
-
 			if (!bmcast)
 				issue_deauth(adapter, pattrib->bssid, WLAN_REASON_CLASS3_FRAME_FROM_NONASSOC_STA);
 
@@ -874,7 +858,6 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
 		if (!memcmp(myhwaddr, pattrib->dst, ETH_ALEN) && (!bmcast)) {
 			*psta = rtw_get_stainfo(pstapriv, pattrib->bssid); /*  get sta_info */
 			if (!*psta) {
-
 				/* for AP multicast issue , modify by yiwei */
 				static unsigned long send_issue_deauth_time;
 
@@ -1067,7 +1050,6 @@ static signed int validate_recv_ctrl_frame(struct adapter *padapter, union recv_
 	}
 
 	return _FAIL;
-
 }
 
 /* perform defrag */
@@ -1139,7 +1121,6 @@ static union recv_frame *recvframe_defrag(struct adapter *adapter,
 
 		pfhdr->attrib.icv_len = pnfhdr->attrib.icv_len;
 		plist = get_next(plist);
-
 	}
 
 	/* free the defrag_q queue and return the prframe */
@@ -1212,7 +1193,6 @@ static union recv_frame *recvframe_chk_defrag(struct adapter *padapter, union re
 			rtw_free_recvframe(precv_frame, pfree_recv_queue);
 			prtnframe = NULL;
 		}
-
 	}
 
 	if ((ismfrag == 0) && (fragnum != 0)) {
@@ -1233,7 +1213,6 @@ static union recv_frame *recvframe_chk_defrag(struct adapter *padapter, union re
 			rtw_free_recvframe(precv_frame, pfree_recv_queue);
 			prtnframe = NULL;
 		}
-
 	}
 
 
@@ -1287,7 +1266,6 @@ static signed int validate_recv_mgnt_frame(struct adapter *padapter, union recv_
 	mgt_dispatcher(padapter, precv_frame);
 
 	return _SUCCESS;
-
 }
 
 static signed int validate_recv_data_frame(struct adapter *adapter, union recv_frame *precv_frame)
@@ -1343,7 +1321,6 @@ static signed int validate_recv_data_frame(struct adapter *adapter, union recv_f
 	default:
 		ret = _FAIL;
 		break;
-
 	}
 
 	if (ret == _FAIL || ret == RTW_RX_HANDLED)
@@ -1475,7 +1452,6 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
 
 validate_80211w_fail:
 	return _FAIL;
-
 }
 
 static signed int validate_recv_frame(struct adapter *adapter, union recv_frame *precv_frame)
@@ -1735,7 +1711,6 @@ static int amsdu_to_msdu(struct adapter *padapter, union recv_frame *prframe)
 	pdata = prframe->u.hdr.rx_data;
 
 	while (a_len > ETH_HLEN) {
-
 		/* Offset 12 denote 2 mac address */
 		nSubframe_Length = get_unaligned_be16(pdata + 12);
 
@@ -1843,7 +1818,6 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
 			return false;
 		else
 			break;
-
 	}
 
 
@@ -1858,7 +1832,6 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
 	/* spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
 
 	return true;
-
 }
 
 static int rtw_recv_indicatepkt(struct adapter *padapter, union recv_frame *precv_frame)
@@ -1926,13 +1899,11 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
 		pattrib = &prframe->u.hdr.attrib;
 
 		preorder_ctrl->indicate_seq = pattrib->seq_num;
-
 	}
 
 	/*  Prepare indication list and indication. */
 	/*  Check if there is any packet need indicate. */
 	while (!list_empty(phead)) {
-
 		prframe = (union recv_frame *)plist;
 		pattrib = &prframe->u.hdr.attrib;
 
@@ -1970,7 +1941,6 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
 			bPktInBuf = true;
 			break;
 		}
-
 	}
 
 	/* spin_unlock(&ppending_recvframe_queue->lock); */
@@ -1995,11 +1965,9 @@ static int recv_indicatepkt_reorder(struct adapter *padapter, union recv_frame *
 			    (padapter->bSurpriseRemoved == false)) {
 				rtw_recv_indicatepkt(padapter, prframe);
 				return _SUCCESS;
-
 			}
 
 			return _FAIL;
-
 		}
 
 		if (preorder_ctrl->enable == false) {
@@ -2083,7 +2051,6 @@ void rtw_reordering_ctrl_timeout_handler(struct timer_list *t)
 		_set_timer(&preorder_ctrl->reordering_ctrl_timer, REORDER_WAIT_TIME);
 
 	spin_unlock_bh(&ppending_recvframe_queue->lock);
-
 }
 
 static int process_recv_indicatepkts(struct adapter *padapter, union recv_frame *prframe)
@@ -2117,11 +2084,9 @@ static int process_recv_indicatepkts(struct adapter *padapter, union recv_frame
 			retval = _FAIL;
 			return retval;
 		}
-
 	}
 
 	return retval;
-
 }
 
 static int recv_func_prehandle(struct adapter *padapter, union recv_frame *rframe)
@@ -2195,7 +2160,6 @@ static int recv_func(struct adapter *padapter, union recv_frame *rframe)
 	ret = recv_func_prehandle(padapter, rframe);
 
 	if (ret == _SUCCESS) {
-
 		/* check if need to enqueue into uc_swdec_pending_queue*/
 		if (check_fwstate(mlmepriv, WIFI_STATION_STATE) &&
 		    !is_multicast_ether_addr(prxattrib->ra) && prxattrib->encrypt > 0 &&
@@ -2263,7 +2227,6 @@ static void rtw_signal_stat_timer_hdl(struct timer_list *t)
 		adapter->recvpriv.signal_strength = adapter->recvpriv.signal_strength_dbg;
 		adapter->recvpriv.rssi = (s8)translate_percentage_to_dbm((u8)adapter->recvpriv.signal_strength_dbg);
 	} else {
-
 		if (recvpriv->signal_strength_data.update_req == 0) {/*  update_req is clear, means we got rx */
 			avg_signal_strength = recvpriv->signal_strength_data.avg_val;
 			num_signal_strength = recvpriv->signal_strength_data.total_num;
@@ -2316,5 +2279,4 @@ static void rtw_signal_stat_timer_hdl(struct timer_list *t)
 
 set_timer:
 	rtw_set_signal_stat_timer(recvpriv);
-
 }
diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index e95daba50fbf..8358499b6f89 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -123,7 +123,6 @@ void rtw_wep_decrypt(struct adapter  *padapter, u8 *precvframe)
 
 		/* calculate icv and compare the icv */
 		*((u32 *)crc) = ~crc32_le(~0, payload, length - 4);
-
 	}
 }
 
@@ -198,7 +197,6 @@ void rtw_secgetmic(struct mic_data *pmicdata, u8 *dst)
 
 void rtw_seccalctkipmic(u8 *key, u8 *header, u8 *data, u32 data_len, u8 *mic_code, u8 pri)
 {
-
 	struct mic_data	micdata;
 	u8 priority[4] = {0x0, 0x0, 0x0, 0x0};
 
@@ -450,7 +448,6 @@ u32 rtw_tkip_encrypt(struct adapter *padapter, u8 *pxmitframe)
 
 	/* 4 start to encrypt each fragment */
 	if (pattrib->encrypt == _TKIP_) {
-
 		{
 			if (is_multicast_ether_addr(pattrib->ra))
 				prwskey = psecuritypriv->dot118021XGrpKey[psecuritypriv->dot118021XGrpKeyid].skey;
-- 
2.53.0

