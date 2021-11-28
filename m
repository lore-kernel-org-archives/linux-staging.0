Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75CE92C85
	for <linux-staging@lists.linux.dev>; Sun, 28 Nov 2021 17:09:51 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id j3so31418045wrp.1
        for <linux-staging@lists.linux.dev>; Sun, 28 Nov 2021 09:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DSyWvZx3eDkxPjxqzfYvtkxGCKAVHYBLh3L+7jrtBns=;
        b=ZllLeEGCc7s7MINftbGJsXIYUsCNebAbcQ4hEcWT3Wwmqe6drlxQ6F+1UCbhP4bQZH
         Dhfp3vUd4V2bgstg1pc6mbXjr4U4N/hvz9u7+nq0XbvIRxbNDsLH097qS58rbaXiy4WS
         XqY3LhiAFqnIj2vDaRJNiofDeLSLu70wZsEfYAbyBPPS3nfc5QQ8btz7tAxfM+AC5NdD
         t5GFokPf0BqzT2TrrG6CAkskk+MlP6ScbrInfTE1Q5J6dCZaqYJMp6FAtgQNUuXxGQWC
         IvzyX5vJPBdBR5sck/ss1q/8ST3Kg101Mj8bp00Xz1TuhjtxdU4t5FlmapavoCP58+z3
         Q5cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DSyWvZx3eDkxPjxqzfYvtkxGCKAVHYBLh3L+7jrtBns=;
        b=J/MuNDlESV5N7VGXGHifyLE9qqeDT1Zhtq37HMBG0oXR6rHumEyCyF7x8eZMZzTTKb
         R+6rL4M8bFuY2x/8WNgegCsG1Iak4louC6ZhD7sRizkWJWzroLyTqAhl4Bz98DQzKD1Y
         o9UShAm5xAsTrPfcZVzmktPr43hXzFxmzhkaq1+XHDBAgzfscmnqTGpDHjLIZ8Fg7P58
         Hl9qfqw/jJ+eP2g//Z7Ac1OK/nrPCqusLnj500YrEBFF8o3aBGHTUpG6hLoUnCcKbwt+
         bh13E5mann39Y6Sx/QIUniAEwQYFBw/x1jCvRI/P9VwqQzaPCLFBKOQBRSSB3Y35PSo5
         C1XA==
X-Gm-Message-State: AOAM533c58PR+lhW/Ysy1Cd9GXN7aJwuPzVLTYeuZ87R6XQC7T0CRwha
	ziR9+3tVsW1kDx6RSZ3DXYfhSOL6h1g=
X-Google-Smtp-Source: ABdhPJxiC8AKppWqDImCABdZlrCBa3uTf8rYJUtkiUvPBlTkSrxuFCJUG97zmN8TQTb9Ir7BkAX/0w==
X-Received: by 2002:a5d:5988:: with SMTP id n8mr27400277wri.309.1638119389837;
        Sun, 28 Nov 2021 09:09:49 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ac86])
        by smtp.gmail.com with ESMTPSA id n15sm18243845wmq.38.2021.11.28.09.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 09:09:49 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 02/10] staging: r8188eu: remove rf_type from issue_assocreq()
Date: Sun, 28 Nov 2021 18:09:16 +0100
Message-Id: <20211128170924.5874-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211128170924.5874-1-straube.linux@gmail.com>
References: <20211128170924.5874-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rf_type is always RF_1T1R. Remove it from issue_assocreq() and remove
related dead code.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 25 +++++----------------
 1 file changed, 5 insertions(+), 20 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 55c3d4a6faeb..bb0b565833cb 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -5060,7 +5060,7 @@ void issue_assocreq(struct adapter *padapter)
 	__le16 *fctrl;
 	__le16		le_tmp;
 	unsigned int	i, j, ie_len, index = 0;
-	unsigned char	rf_type, bssrate[NumRates], sta_bssrate[NumRates];
+	unsigned char bssrate[NumRates], sta_bssrate[NumRates];
 	struct ndis_802_11_var_ie *pIE;
 	struct registry_priv	*pregpriv = &padapter->registrypriv;
 	struct xmit_priv		*pxmitpriv = &padapter->xmitpriv;
@@ -5185,25 +5185,10 @@ void issue_assocreq(struct adapter *padapter)
 			/* todo: disable SM power save mode */
 			pmlmeinfo->HT_caps.u.HT_cap_element.HT_caps_info |= cpu_to_le16(0x000c);
 
-			GetHwReg8188EU(padapter, HW_VAR_RF_TYPE, (u8 *)(&rf_type));
-			switch (rf_type) {
-			case RF_1T1R:
-				if (pregpriv->rx_stbc)
-					pmlmeinfo->HT_caps.u.HT_cap_element.HT_caps_info |= cpu_to_le16(0x0100);/* RX STBC One spatial stream */
-				memcpy(pmlmeinfo->HT_caps.u.HT_cap_element.MCS_rate, MCS_rate_1R, 16);
-				break;
-			case RF_2T2R:
-			case RF_1T2R:
-			default:
-				if ((pregpriv->rx_stbc == 0x3) ||/* enable for 2.4/5 GHz */
-				    ((pmlmeext->cur_wireless_mode & WIRELESS_11_24N) && (pregpriv->rx_stbc == 0x1)) || /* enable for 2.4GHz */
-				    (pregpriv->wifi_spec == 1)) {
-					DBG_88E("declare supporting RX STBC\n");
-					pmlmeinfo->HT_caps.u.HT_cap_element.HT_caps_info |= cpu_to_le16(0x0200);/* RX STBC two spatial stream */
-				}
-				memcpy(pmlmeinfo->HT_caps.u.HT_cap_element.MCS_rate, MCS_rate_2R, 16);
-				break;
-			}
+			if (pregpriv->rx_stbc)
+				pmlmeinfo->HT_caps.u.HT_cap_element.HT_caps_info |= cpu_to_le16(0x0100);/* RX STBC One spatial stream */
+			memcpy(pmlmeinfo->HT_caps.u.HT_cap_element.MCS_rate, MCS_rate_1R, 16);
+
 			pframe = rtw_set_ie(pframe, _HT_CAPABILITY_IE_, ie_len, (u8 *)(&pmlmeinfo->HT_caps), &pattrib->pktlen);
 		}
 	}
-- 
2.34.0

