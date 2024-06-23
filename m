Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39AE1836EA
	for <linux-staging@lists.linux.dev>; Sun, 23 Jun 2024 17:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719165415; cv=none; b=pf3H1iJkJY/1yKvv5u+RLag4AU0c6qKnXB9ht2UB7bbDzPm7Nq5Q27Xsof76+2pggoSePU+zngSWt9NufdsH9BNXQxDXP8lpXINq/C96ufXZgmLHgHlvyOcsebIFpEZ0KKQN3d10+JDrYo0NyZzZlaa5D/4I1v5CpHzDGMAFzOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719165415; c=relaxed/simple;
	bh=CkNidE77ffiowd7zZh05OdJoJAHIaW3NM/A1Lnyb0cQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ozA7jfnb5h7ejbyCFSxQDUfGEUdzKGwP+3Wav9eBlvCft06LA0Nq5vcQ36f5hjgTJOiCRq6wiUh3RdKkGzkxEZOraSWDwQURmQAr60EdtKSkV2dajIzenveMQNmh+D/Y1dBMcGvV8Rpx7CpXyvX7rgzq6+pShaJ5YILZiUJMOrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RFt82+IG; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RFt82+IG"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ec54a9071eso823161fa.0
        for <linux-staging@lists.linux.dev>; Sun, 23 Jun 2024 10:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719165411; x=1719770211; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IxEkr3kzazdvCbWAtPFW8X6ggBQGBByP2sngH0vtHa8=;
        b=RFt82+IG0hjKeCp4SXlq/VXl+en6XGjhKeKU6OZVTLTsgg7PAoeDaqcNE8l74s+l4B
         smJFkQ1Ke5qJKlnPcpxF/0ACxKBvTF3J0CZCLhkwLcKzalM2ATxmjWZ0gbJY6b8DwAqt
         ztJH+ufs+6zL5BZTeohHOm19co3GA6dUv1ViNU0csC3/9n8kS+jrM9uWXcKTF+0HRJF5
         +ocrzvooymuywVjWbVv/dcpq8B6Jhbhio+U2OK5hf5BDPzg/jO2SR4Z1GRWLoX+C13Pl
         14n8qdcbXH5O40H1wjhZQHzdp+01a5Vmy0FTCDM87IJzrdlWwhDDXtjEm305RBnJTKGf
         vMKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719165411; x=1719770211;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IxEkr3kzazdvCbWAtPFW8X6ggBQGBByP2sngH0vtHa8=;
        b=fE4ogFeVvKYrSKYiOEN4a33KxXNUv6DfvAD7IJUwz3wh1uZFcFhiutR8wmNMdv/lRs
         LzIyTet3ZLqCiSempqm5coW3kaNDK0j18vHTDSjqrrPl3nX7v4oxXGrFCrLgp3pUT+UX
         cSQnbVjAVRvSfaEQZTTIj1+ryK18BaA5/FBTyT5KY+6ie3eFY00KTVYBpT0zg8MjGdL2
         mzsw7FFzBeTThgWwdO2ki27o5NKdGQ11yex/LV4I/frrtiu9lYoUMryNFUDnM6bnd/nr
         iw4z9b8PVa6oCjkh9UwTViC6NdxdAQBUvaG/e40VI9zwaToal1g7ORNzoDa5f17A/k6C
         9vrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCIFVR4Kpo+v2HRX3DoXfkJXmjxGaY2RZL+cPFWARp6hN6Sh7tgqrmTWTCjpgT6StlWPjiDqm1LMMQxktwiQ1Noek7kdi9gRQ19At48w==
X-Gm-Message-State: AOJu0YxIGopK8I/kyUCcEzE0YSTTmV9f668xHivWm4enV7jHi1WPqK9f
	Xn0rU51197tWYOa3AJ2owEB6Qx0CFUoAWjaF9qd379v0R9bgat4K
X-Google-Smtp-Source: AGHT+IEGyyMp4Lh3xeBd9+B2B85X7h/A/naDjsCxxbgClWb8uFpH17/mXX7GTaHDfU0ro6S+G1ryhw==
X-Received: by 2002:a2e:bb8e:0:b0:2ec:31d9:16e1 with SMTP id 38308e7fff4ca-2ec561caabamr17414171fa.5.1719165410904;
        Sun, 23 Jun 2024 10:56:50 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935a9b.dip0.t-ipconnect.de. [87.147.90.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d3053558esm3719128a12.64.2024.06.23.10.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 10:56:50 -0700 (PDT)
Date: Sun, 23 Jun 2024 19:56:49 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 01/14] staging: rtl8723bs: Remove unused structs starting
 with profile_info
Message-ID: <0771ebf074f71fb484d0005241416144ca813859.1719155208.git.philipp.g.hortmann@gmail.com>
References: <cover.1719155208.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1719155208.git.philipp.g.hortmann@gmail.com>

Remove unused structs.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_mlme.h | 133 -------------------
 1 file changed, 133 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index fc0b43d38d9a..7ce8eaf4ec80 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -141,139 +141,6 @@ struct rt_link_detect_t {
 	u32 LowPowerTransitionCount;
 };
 
-struct profile_info {
-	u8 ssidlen;
-	u8 ssid[WLAN_SSID_MAXLEN];
-	u8 peermac[ETH_ALEN];
-};
-
-struct tx_invite_req_info {
-	u8 			token;
-	u8 			benable;
-	u8			go_ssid[WLAN_SSID_MAXLEN];
-	u8 			ssidlen;
-	u8			go_bssid[ETH_ALEN];
-	u8			peer_macaddr[ETH_ALEN];
-	u8 			operating_ch;	/* 	This information will be set by using the p2p_set op_ch =x */
-	u8 			peer_ch;		/* 	The listen channel for peer P2P device */
-
-};
-
-struct tx_invite_resp_info {
-	u8 			token;	/* 	Used to record the dialog token of p2p invitation request frame. */
-};
-
-struct tx_provdisc_req_info {
-	u16 				wps_config_method_request;	/* 	Used when sending the provisioning request frame */
-	u16 				peer_channel_num[2];		/* 	The channel number which the receiver stands. */
-	struct ndis_802_11_ssid	ssid;
-	u8			peerDevAddr[ETH_ALEN];		/*	Peer device address */
-	u8			peerIFAddr[ETH_ALEN];		/*	Peer interface address */
-	u8 			benable;					/* 	This provision discovery request frame is trigger to send or not */
-};
-
-struct rx_provdisc_req_info {	/* When peer device issue prov_disc_req first, we should store the following information */
-	u8			peerDevAddr[ETH_ALEN];		/*	Peer device address */
-	u8 			strconfig_method_desc_of_prov_disc_req[4];	/* 	description for the config method located in the provisioning discovery request frame. */
-																	/* 	The UI must know this information to know which config method the remote p2p device is requiring. */
-};
-
-struct tx_nego_req_info {
-	u16 				peer_channel_num[2];		/* 	The channel number which the receiver stands. */
-	u8			peerDevAddr[ETH_ALEN];		/*	Peer device address */
-	u8 			benable;					/* 	This negotiation request frame is trigger to send or not */
-};
-
-struct group_id_info {
-	u8			go_device_addr[ETH_ALEN];	/*	The GO's device address of this P2P group */
-	u8			ssid[WLAN_SSID_MAXLEN];	/*	The SSID of this P2P group */
-};
-
-struct scan_limit_info {
-	u8 			scan_op_ch_only;			/* 	When this flag is set, the driver should just scan the operation channel */
-	u8 			operation_ch[2];				/* 	Store the operation channel of invitation request frame */
-};
-
-struct wifidirect_info {
-	struct adapter				*padapter;
-	struct timer_list					find_phase_timer;
-	struct timer_list					restore_p2p_state_timer;
-
-	/* 	Used to do the scanning. After confirming the peer is availalble, the driver transmits the P2P frame to peer. */
-	struct timer_list					pre_tx_scan_timer;
-	struct timer_list					reset_ch_sitesurvey;
-	struct timer_list					reset_ch_sitesurvey2;	/* 	Just for resetting the scan limit function by using p2p nego */
-	struct tx_provdisc_req_info tx_prov_disc_info;
-	struct rx_provdisc_req_info rx_prov_disc_info;
-	struct tx_invite_req_info invitereq_info;
-	struct profile_info		profileinfo[P2P_MAX_PERSISTENT_GROUP_NUM];	/*	Store the profile information of persistent group */
-	struct tx_invite_resp_info inviteresp_info;
-	struct tx_nego_req_info nego_req_info;
-	struct group_id_info 	groupid_info;	/* 	Store the group id information when doing the group negotiation handshake. */
-	struct scan_limit_info 	rx_invitereq_info;	/* 	Used for get the limit scan channel from the Invitation procedure */
-	struct scan_limit_info 	p2p_info;		/* 	Used for get the limit scan channel from the P2P negotiation handshake */
-	enum p2p_role			role;
-	enum p2p_state			pre_p2p_state;
-	enum p2p_state			p2p_state;
-	u8 				device_addr[ETH_ALEN];	/* 	The device address should be the mac address of this device. */
-	u8 				interface_addr[ETH_ALEN];
-	u8 				social_chan[4];
-	u8 				listen_channel;
-	u8 				operating_channel;
-	u8 				listen_dwell;		/* 	This value should be between 1 and 3 */
-	u8 				support_rate[8];
-	u8 				p2p_wildcard_ssid[P2P_WILDCARD_SSID_LEN];
-	u8 				intent;		/* 	should only include the intent value. */
-	u8				p2p_peer_interface_addr[ETH_ALEN];
-	u8				p2p_peer_device_addr[ETH_ALEN];
-	u8 				peer_intent;	/* 	Included the intent value and tie breaker value. */
-	u8				device_name[WPS_MAX_DEVICE_NAME_LEN];	/*	Device name for displaying on searching device screen */
-	u8 				device_name_len;
-	u8 				profileindex;	/* 	Used to point to the index of profileinfo array */
-	u8 				peer_operating_ch;
-	u8 				find_phase_state_exchange_cnt;
-	u16 					device_password_id_for_nego;	/* 	The device password ID for group negotiation */
-	u8 				negotiation_dialog_token;
-	u8				nego_ssid[WLAN_SSID_MAXLEN];	/*	SSID information for group negotiation */
-	u8 				nego_ssidlen;
-	u8 				p2p_group_ssid[WLAN_SSID_MAXLEN];
-	u8 				p2p_group_ssid_len;
-	u8 				persistent_supported;		/* 	Flag to know the persistent function should be supported or not. */
-														/* 	In the Sigma test, the Sigma will provide this enable from the sta_set_p2p CAPI. */
-														/* 	0: disable */
-														/* 	1: enable */
-	u8 				session_available;			/* 	Flag to set the WFD session available to enable or disable "by Sigma" */
-														/* 	In the Sigma test, the Sigma will disable the session available by using the sta_preset CAPI. */
-														/* 	0: disable */
-														/* 	1: enable */
-
-	u8 				wfd_tdls_enable;			/* 	Flag to enable or disable the TDLS by WFD Sigma */
-														/* 	0: disable */
-														/* 	1: enable */
-	u8 				wfd_tdls_weaksec;			/* 	Flag to enable or disable the weak security function for TDLS by WFD Sigma */
-														/* 	0: disable */
-														/* 	In this case, the driver can't issue the tdsl setup request frame. */
-														/* 	1: enable */
-														/* 	In this case, the driver can issue the tdls setup request frame */
-														/* 	even the current security is weak security. */
-
-	enum	p2p_wpsinfo		ui_got_wps_info;			/* 	This field will store the WPS value (PIN value or PBC) that UI had got from the user. */
-	u16 					supported_wps_cm;			/* 	This field describes the WPS config method which this driver supported. */
-														/* 	The value should be the combination of config method defined in page104 of WPS v2.0 spec. */
-	u8 				external_uuid;				/*  UUID flag */
-	u8 				uuid[16];					/*  UUID */
-	uint						channel_list_attr_len;		/* 	This field will contain the length of body of P2P Channel List attribute of group negotitation response frame. */
-	u8 				channel_list_attr[100];		/* 	This field will contain the body of P2P Channel List attribute of group negotitation response frame. */
-														/* 	We will use the channel_cnt and channel_list fields when constructing the group negotitation confirm frame. */
-	u8 				driver_interface;			/* 	Indicate DRIVER_WEXT or DRIVER_CFG80211 */
-};
-
-struct tdls_ss_record {	/* signal strength record */
-	u8 macaddr[ETH_ALEN];
-	u8 rx_pwd_ba11;
-	u8 is_tdls_sta;	/*  true: direct link sta, false: else */
-};
-
 /* used for mlme_priv.roam_flags */
 enum {
 	RTW_ROAM_ON_EXPIRED = BIT0,
-- 
2.45.2

