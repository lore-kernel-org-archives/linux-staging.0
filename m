Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAE56D19
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 15:59:38 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id k8so5394050wrn.3
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 08:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aTop8HQmEzqB3xL9XUIKc3+nGBNTzbj4vdHct+bRfwU=;
        b=cccvNkhln0hCRD/xljX46L49zDYIhJM7S8ifqghmDYVamLkWW5Iq/NPxxbcRqsSRuD
         m4yih5DiEyBmpum+9AFnJKf3s5roEWRfIPlJa3379tnfb+O4XexT7J14cGJL3+VuKeu8
         U4F4cX7wC5cfoyiYqPPGcZSvXONoV4I3yodJBD+djM0VfTrSXe7FupD89HjSFL1BJ311
         ceuKDcC0tnSH/ugwKtkuoIkOOT5KDh6Ojn7bl4bKVLXg6eKchs/ODLzKJjbX/foaNwXb
         Hv34Rs4n67pGpIgPH18XOMqPqezphaWHllaeZ2B+nQFI7yuz6xzGVn6fZb2c0wab8bzp
         ygpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aTop8HQmEzqB3xL9XUIKc3+nGBNTzbj4vdHct+bRfwU=;
        b=l/kvcQX8O65m6O6juC93Ft6JgL1RdbQLG8Nyrp9fcGjqFmK1acl6J6hLpoUl1kXFUt
         TsXyC9BRTmDXruBM1eBStaSuBEcQdJKMpmKr6tQin0kpYA983jfRpRGtloE0lmUrW+2S
         J8r4XtfE8BrwgZipMNDiV8FYqdoTSLZ0Z78gl6uE/2tC+o/Wk9Zq8UXDRpF46fdAaGQT
         gCQdme4KWYgQu4yAKGcQ8DEXdRAQOa1v8DIiL2FOzvJieg//RYqE4QNxiF7QT3B5/quB
         5GzusY2FFToeC+6JDQSzyKZBjeEn+xLaqqYuaPDMIzGfTNn/KOk7a2xn0IFlV3OOEfbf
         KNSA==
X-Gm-Message-State: AOAM533j6LUhrVzZ2K8fR2WMb/g4p+rjWB5rHxihdjVG6DU/7k9dU2Fn
	u/AZvbYqEMFOCaUSVSd6TLY=
X-Google-Smtp-Source: ABdhPJycStlqdFu95X0kt8eO4NSpI7ALDTT44aRo6R0yRWO21f/b5w+KYFXo2spaUiOkD/iSyJAZMA==
X-Received: by 2002:adf:dcd1:: with SMTP id x17mr19165623wrm.59.1629129576883;
        Mon, 16 Aug 2021 08:59:36 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::4058])
        by smtp.gmail.com with ESMTPSA id a77sm11589597wmd.31.2021.08.16.08.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 08:59:36 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 14/23] staging: r8188eu: clean up spacing style issues in core/rtw_p2p.c
Date: Mon, 16 Aug 2021 17:58:09 +0200
Message-Id: <20210816155818.24005-15-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210816155818.24005-1-straube.linux@gmail.com>
References: <20210816155818.24005-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up spacing style issues in core/rtw_p2p.c reported by checkpatch.

CHECK: spaces preferred around that ...
CHECK: No space is necessary after a cast
WARNING: space prohibited before semicolon
WARNING: space prohibited between function name and open parenthesis '('

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_p2p.c | 46 +++++++++++++-------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_p2p.c b/drivers/staging/r8188eu/core/rtw_p2p.c
index 1c2c6193b7af..e2b6cf2386e0 100644
--- a/drivers/staging/r8188eu/core/rtw_p2p.c
+++ b/drivers/staging/r8188eu/core/rtw_p2p.c
@@ -75,8 +75,8 @@ static u32 go_add_group_info_attr(struct wifidirect_info *pwdinfo, u8 *pbuf)
 			*pcur = psta->num_of_secdev_type;
 			pcur++;
 
-			memcpy(pcur, psta->secdev_types_list, psta->num_of_secdev_type*8);
-			pcur += psta->num_of_secdev_type*8;
+			memcpy(pcur, psta->secdev_types_list, psta->num_of_secdev_type * 8);
+			pcur += psta->num_of_secdev_type * 8;
 
 			if (psta->dev_name_len > 0) {
 				/* u16*)(pcur) = cpu_to_be16(WPS_ATTR_DEVICE_NAME); */
@@ -91,9 +91,9 @@ static u32 go_add_group_info_attr(struct wifidirect_info *pwdinfo, u8 *pbuf)
 				pcur += psta->dev_name_len;
 			}
 
-			tmplen = (u8)(pcur-pstart);
+			tmplen = (u8)(pcur - pstart);
 
-			*pstart = (tmplen-1);
+			*pstart = (tmplen - 1);
 
 			attr_len += tmplen;
 
@@ -419,10 +419,10 @@ u32 build_beacon_p2p_ie(struct wifidirect_info *pwdinfo, u8 *pbuf)
 	/*	Be able to participate in additional P2P Groups and */
 	/*	support the P2P Invitation Procedure */
 	/*	Group Capability Bitmap, 1 byte */
-	capability = P2P_DEVCAP_INVITATION_PROC|P2P_DEVCAP_CLIENT_DISCOVERABILITY;
+	capability = P2P_DEVCAP_INVITATION_PROC | P2P_DEVCAP_CLIENT_DISCOVERABILITY;
 	capability |=  ((P2P_GRPCAP_GO | P2P_GRPCAP_INTRABSS) << 8);
 	if (rtw_p2p_chk_state(pwdinfo, P2P_STATE_PROVISIONING_ING))
-		capability |= (P2P_GRPCAP_GROUP_FORMATION<<8);
+		capability |= (P2P_GRPCAP_GROUP_FORMATION << 8);
 
 	le_tmp = cpu_to_le16(capability);
 	p2pielen += rtw_set_p2p_attr_content(&p2pie[p2pielen], P2P_ATTR_CAPABILITY, 2, (u8 *)&le_tmp);
@@ -790,7 +790,7 @@ u32 process_probe_req_p2p_ie(struct wifidirect_info *pwdinfo, u8 *pframe, uint l
 	if (rtw_p2p_chk_role(pwdinfo, P2P_ROLE_DEVICE) || rtw_p2p_chk_role(pwdinfo, P2P_ROLE_GO)) {
 		p2pie = rtw_get_p2p_ie(pframe + WLAN_HDR_A3_LEN + _PROBEREQ_IE_OFFSET_, len - WLAN_HDR_A3_LEN - _PROBEREQ_IE_OFFSET_, NULL, &p2pielen);
 		if (p2pie) {
-			if (p && !memcmp((void *)(p+2), (void *)pwdinfo->p2p_wildcard_ssid, 7)) {
+			if (p && !memcmp((void *)(p + 2), (void *)pwdinfo->p2p_wildcard_ssid, 7)) {
 				/* todo: */
 				/* Check Requested Device Type attributes in WSC IE. */
 				/* Check Device ID attribute in P2P IE */
@@ -847,7 +847,7 @@ u32 process_assoc_req_p2p_ie(struct wifidirect_info *pwdinfo, u8 *pframe, uint l
 		if (rtw_get_p2p_attr_content(p2p_ie, p2p_ielen, P2P_ATTR_CAPABILITY, (u8 *)&le_tmp, (uint *)&attr_contentlen)) {
 			DBG_88E("[%s] Got P2P Capability Attr!!\n", __func__);
 			cap_attr = le16_to_cpu(le_tmp);
-			psta->dev_cap = cap_attr&0xff;
+			psta->dev_cap = cap_attr & 0xff;
 		}
 
 		/* Check Extended Listen Timing ATTR */
@@ -886,28 +886,28 @@ u32 process_assoc_req_p2p_ie(struct wifidirect_info *pwdinfo, u8 *pframe, uint l
 
 					psta->num_of_secdev_type = num_of_secdev_type;
 
-					len = (sizeof(psta->secdev_types_list) < (num_of_secdev_type*8)) ?
-					      (sizeof(psta->secdev_types_list)) : (num_of_secdev_type*8);
+					len = (sizeof(psta->secdev_types_list) < (num_of_secdev_type * 8)) ?
+					      (sizeof(psta->secdev_types_list)) : (num_of_secdev_type * 8);
 
 					memcpy(psta->secdev_types_list, pattr_content, len);
 
-					pattr_content += (num_of_secdev_type*8);
+					pattr_content += (num_of_secdev_type * 8);
 				}
 
 				psta->dev_name_len = 0;
 				if (WPS_ATTR_DEVICE_NAME == be16_to_cpu(*(__be16 *)pattr_content)) {
-					dev_name_len = be16_to_cpu(*(__be16 *)(pattr_content+2));
+					dev_name_len = be16_to_cpu(*(__be16 *)(pattr_content + 2));
 
 					psta->dev_name_len = (sizeof(psta->dev_name) < dev_name_len) ? sizeof(psta->dev_name) : dev_name_len;
 
-					memcpy(psta->dev_name, pattr_content+4, psta->dev_name_len);
+					memcpy(psta->dev_name, pattr_content + 4, psta->dev_name_len);
 				}
 				kfree(pbuf);
 			}
 		}
 
 		/* Get the next P2P IE */
-		p2p_ie = rtw_get_p2p_ie(p2p_ie+p2p_ielen, ies_len - (p2p_ie - ies + p2p_ielen), NULL, &p2p_ielen);
+		p2p_ie = rtw_get_p2p_ie(p2p_ie + p2p_ielen, ies_len - (p2p_ie - ies + p2p_ielen), NULL, &p2p_ielen);
 	}
 
 	return status_code;
@@ -936,7 +936,7 @@ u32 process_p2p_devdisc_req(struct wifidirect_info *pwdinfo, u8 *pframe, uint le
 
 		if (rtw_get_p2p_attr_content(p2p_ie, p2p_ielen, P2P_ATTR_GROUP_ID, groupid, &attr_contentlen)) {
 			if (!memcmp(pwdinfo->device_addr, groupid, ETH_ALEN) &&
-			    !memcmp(pwdinfo->p2p_group_ssid, groupid+ETH_ALEN, pwdinfo->p2p_group_ssid_len)) {
+			    !memcmp(pwdinfo->p2p_group_ssid, groupid + ETH_ALEN, pwdinfo->p2p_group_ssid_len)) {
 				attr_contentlen = 0;
 				if (rtw_get_p2p_attr_content(p2p_ie, p2p_ielen, P2P_ATTR_DEVICE_ID, dev_addr, &attr_contentlen)) {
 					struct list_head *phead, *plist;
@@ -951,7 +951,7 @@ u32 process_p2p_devdisc_req(struct wifidirect_info *pwdinfo, u8 *pframe, uint le
 
 						plist = plist->next;
 
-						if (psta->is_p2p_device && (psta->dev_cap&P2P_DEVCAP_CLIENT_DISCOVERABILITY) &&
+						if (psta->is_p2p_device && (psta->dev_cap & P2P_DEVCAP_CLIENT_DISCOVERABILITY) &&
 						    !memcmp(psta->dev_addr, dev_addr, ETH_ALEN)) {
 							/* issue GO Discoverability Request */
 							issue_group_disc_req(pwdinfo, psta->hwaddr);
@@ -1038,7 +1038,7 @@ static u8 rtw_p2p_get_peer_ch_list(struct wifidirect_info *pwdinfo, u8 *ch_conte
 			peer_ch_list[j] = *(ch_content + 1 + i);
 		ch_content += (temp + 1);
 		ch_cnt -= (temp + 1);
-		ch_no += temp ;
+		ch_no += temp;
 	}
 
 	return ch_no;
@@ -1198,7 +1198,7 @@ u8 process_p2p_group_negotation_req(struct wifidirect_info *pwdinfo, u8 *pframe,
 		}
 
 		/* Get the next P2P IE */
-		p2p_ie = rtw_get_p2p_ie(p2p_ie+p2p_ielen, ies_len - (p2p_ie - ies + p2p_ielen), NULL, &p2p_ielen);
+		p2p_ie = rtw_get_p2p_ie(p2p_ie + p2p_ielen, ies_len - (p2p_ie - ies + p2p_ielen), NULL, &p2p_ielen);
 	}
 	return result;
 }
@@ -1360,7 +1360,7 @@ u8 process_p2p_group_negotation_resp(struct wifidirect_info *pwdinfo, u8 *pframe
 			}
 
 			/* Get the next P2P IE */
-			p2p_ie = rtw_get_p2p_ie(p2p_ie+p2p_ielen, ies_len - (p2p_ie - ies + p2p_ielen), NULL, &p2p_ielen);
+			p2p_ie = rtw_get_p2p_ie(p2p_ie + p2p_ielen, ies_len - (p2p_ie - ies + p2p_ielen), NULL, &p2p_ielen);
 		}
 	}
 	return result;
@@ -1431,7 +1431,7 @@ u8 process_p2p_group_negotation_confirm(struct wifidirect_info *pwdinfo, u8 *pfr
 		}
 
 		/* Get the next P2P IE */
-		p2p_ie = rtw_get_p2p_ie(p2p_ie+p2p_ielen, ies_len - (p2p_ie - ies + p2p_ielen), NULL, &p2p_ielen);
+		p2p_ie = rtw_get_p2p_ie(p2p_ie + p2p_ielen, ies_len - (p2p_ie - ies + p2p_ielen), NULL, &p2p_ielen);
 	}
 	return result;
 }
@@ -1623,7 +1623,7 @@ void process_p2p_ps_ie(struct adapter *padapter, u8 *IEs, u32 IELength)
 		}
 
 		/* Get the next P2P IE */
-		p2p_ie = rtw_get_p2p_ie(p2p_ie+p2p_ielen, ies_len - (p2p_ie - ies + p2p_ielen), NULL, &p2p_ielen);
+		p2p_ie = rtw_get_p2p_ie(p2p_ie + p2p_ielen, ies_len - (p2p_ie - ies + p2p_ielen), NULL, &p2p_ielen);
 	}
 
 	if (find_p2p) {
@@ -1740,7 +1740,7 @@ static void reset_ch_sitesurvey_timer_process(struct timer_list *t)
 	pwdinfo->rx_invitereq_info.scan_op_ch_only = 0;
 }
 
-static void reset_ch_sitesurvey_timer_process2 (struct timer_list *t)
+static void reset_ch_sitesurvey_timer_process2(struct timer_list *t)
 {
 	struct adapter *adapter = from_timer(adapter, t, pwrctrlpriv.pwr_state_check_timer);
 	struct	wifidirect_info		*pwdinfo = &adapter->wdinfo;
@@ -1902,7 +1902,7 @@ void init_wifidirect_info(struct adapter *padapter, enum P2P_ROLE role)
 
 	rtw_p2p_findphase_ex_set(pwdinfo, P2P_FINDPHASE_EX_NONE);
 
-	pwdinfo->listen_dwell = (u8) ((jiffies % 3) + 1);
+	pwdinfo->listen_dwell = (u8)((jiffies % 3) + 1);
 
 	memset(&pwdinfo->tx_prov_disc_info, 0x00, sizeof(struct tx_provdisc_req_info));
 	pwdinfo->tx_prov_disc_info.wps_config_method_request = WPS_CM_NONE;
-- 
2.32.0

