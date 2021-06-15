Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674A26D0F
	for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 22:36:17 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id m18so332876wrv.2
        for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 15:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7NTt6kVS45eFrCk8h9Ebor928oZEbh0eBbR9RS7fDlQ=;
        b=QOqe7RjadKe5dBMGuQwqobUvDEFmRnmEgPFOZ5tYdGbfVuF0VPSbJ7tnnr9Ez5xvFl
         9cIfIWXV9N2WZpe1wntZVq5yRSBmPZXCFt+J+5fteA32JbMNxZllxp2dF2rNMduSDYPR
         7q118s8VcYw7HhueuEgMEkQDXBSABLUO5jWYw2Yjg+AO364ke51N4G0MKE4J/JIq5RzZ
         1Lg/FF7RKvf3JRj21ijh2eDp6R7uSzSrnpIzEq3iLtkTXnBXI1PPyFh3WXA2gC2xkIK+
         hRgTeoBMBxtNxAdJ5lOocuT6wNf8JEEXM/IAzmkSEvLvUn+NnCd7nHWiV9TeClSdnebq
         PZrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7NTt6kVS45eFrCk8h9Ebor928oZEbh0eBbR9RS7fDlQ=;
        b=TcJWOxTndl8L1HUcfgqHExfVSYHVCr+cTwxxXpMrpppuR3V6lVOgXUJhYNqhPmN1Kh
         RnPcroWFfByZdaJWRPib+GxU6JHOIkxyMstFQpv1LkL0i7XjyAUoGYZATw36b4HUCsVT
         ppUY234XM4N7APgSvnCl77TNZc+aNzsyzc4Znp7aoN1axr9V/fGaUQR9ZWAoTW8Zfhwg
         UaWyf0RZw3bhjjW/k+WiRCQNNn7OZueyj18BSNEap60tteEM2lEGmBuYupx5tq00Cymw
         ZJagqGGZL0BT38KIHW0C5Q2GZ8sTzKwXrMs72WhfSuSQbqqCjWwKq/X6eYm/MBME0vNf
         QtOA==
X-Gm-Message-State: AOAM533CbdNTN5tI52NISSva9Wvr/LhBOMykOHRL/aQT7b4RKwdQ0AJx
	nDzDU8vdQbIEY30RFz6SqlMLug==
X-Google-Smtp-Source: ABdhPJyhp5BZTzCza1EhNhfx2TBD98N+3f8PsIEKSa0xTKfLBXd7HSuFtf9qwjJocvW6jgwJ1fmmUg==
X-Received: by 2002:adf:f90e:: with SMTP id b14mr1571448wrr.248.1623796576024;
        Tue, 15 Jun 2021 15:36:16 -0700 (PDT)
Received: from localhost.localdomain (2.0.5.1.1.6.3.8.5.c.c.3.f.b.d.3.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16:0:3dbf:3cc5:8361:1502])
        by smtp.gmail.com with ESMTPSA id m23sm3934791wml.27.2021.06.15.15.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 15:36:15 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 4/7] staging: rtl8188eu: remove unused variables from core/rtw_mlme_ext.c
Date: Tue, 15 Jun 2021 23:36:04 +0100
Message-Id: <20210615223607.13863-5-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210615223607.13863-1-phil@philpotter.co.uk>
References: <20210615223607.13863-1-phil@philpotter.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove set but unused variables from within the file core/rtw_mlme_ext.c,
as they are triggering kernel test robot warnings.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/core/rtw_mlme_ext.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c b/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
index d41fd0b8980a..c6410030dcbf 100644
--- a/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8188eu/core/rtw_mlme_ext.c
@@ -1767,8 +1767,6 @@ unsigned int send_beacon(struct adapter *padapter)
 	u8 bxmitok = false;
 	int issue = 0;
 	int poll = 0;
-	unsigned long start = jiffies;
-	u32 passing_time;
 
 	rtw_hal_set_hwreg(padapter, HW_VAR_BCN_VALID, NULL);
 	do {
@@ -1785,7 +1783,6 @@ unsigned int send_beacon(struct adapter *padapter)
 		return _FAIL;
 	if (!bxmitok)
 		return _FAIL;
-	passing_time = jiffies_to_msecs(jiffies - start);
 
 	return _SUCCESS;
 }
@@ -2756,7 +2753,7 @@ static unsigned int OnAssocReq(struct adapter *padapter,
 	u16 capab_info;
 	struct rtw_ieee802_11_elems elems;
 	struct sta_info *pstat;
-	unsigned char reassoc, *p, *pos, *wpa_ie;
+	unsigned char *p, *pos, *wpa_ie;
 	unsigned char WMM_IE[] = {0x00, 0x50, 0xf2, 0x02, 0x00, 0x01};
 	int i, wpa_ie_len, left;
 	unsigned char supportRate[16];
@@ -2776,13 +2773,10 @@ static unsigned int OnAssocReq(struct adapter *padapter,
 		return _FAIL;
 
 	frame_type = GetFrameSubType(pframe);
-	if (frame_type == IEEE80211_STYPE_ASSOC_REQ) {
-		reassoc = 0;
+	if (frame_type == IEEE80211_STYPE_ASSOC_REQ)
 		ie_offset = _ASOCREQ_IE_OFFSET_;
-	} else { /*  IEEE80211_STYPE_REASSOC_REQ */
-		reassoc = 1;
+	else /*  IEEE80211_STYPE_REASSOC_REQ */
 		ie_offset = _REASOCREQ_IE_OFFSET_;
-	}
 
 	if (pkt_len < IEEE80211_3ADDR_LEN + ie_offset)
 		return _FAIL;
@@ -3397,7 +3391,7 @@ static unsigned int OnAction_back(struct adapter *padapter,
 	struct recv_reorder_ctrl *preorder_ctrl;
 	unsigned char *frame_body;
 	unsigned char category, action;
-	unsigned short tid, status, reason_code = 0;
+	unsigned short tid, status;
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
 	u8 *pframe = precv_frame->pkt->data;
@@ -3449,7 +3443,6 @@ static unsigned int OnAction_back(struct adapter *padapter,
 			if ((frame_body[3] & BIT(3)) == 0) {
 				psta->htpriv.agg_enable_bitmap &= ~(1 << ((frame_body[3] >> 4) & 0xf));
 				psta->htpriv.candidate_tid_bitmap &= ~(1 << ((frame_body[3] >> 4) & 0xf));
-				reason_code = get_unaligned_le16(&frame_body[4]);
 			} else if ((frame_body[3] & BIT(3)) == BIT(3)) {
 				tid = (frame_body[3] >> 4) & 0x0F;
 				preorder_ctrl =  &psta->recvreorder_ctrl[tid];
-- 
2.30.2

