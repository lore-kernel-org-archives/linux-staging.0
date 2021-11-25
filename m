Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156332C86
	for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 19:59:51 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id o13so13872620wrs.12
        for <linux-staging@lists.linux.dev>; Thu, 25 Nov 2021 11:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G/cNpwvsVw5GnP7KSiepDl/i+9GFtJwQXsibbr5JQe8=;
        b=pYeGygMRdsV3331w3VLITX78jVO5iIYPmE8miaanEBH4h2twT4wKUw/H1yAuF9CVwg
         3PVPrBD1EBvjB0mtH5KOitqTI5lT8xidGBpDOnmufGuHRR7YJrj5T0UuHgDP8KuSFrlP
         pNMj5aMIl3SVtlnFLGtGdP5iN8q5rMxe9fL3eaWjXHRm3t3tlQj7Lp23HKLx3xZb9agM
         9mBuCZvoD7YBtA7Jg67jgzVpVP8cgL8ZLDJStygP0VTsOL3EQovsn7THVti7MOGhKc63
         dd997/SI+4K961h8X+dFdXyXhKxfxtbEdjDyluT+FPrqlfFideWVZqIuUnM2XhIBLAZz
         0e9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G/cNpwvsVw5GnP7KSiepDl/i+9GFtJwQXsibbr5JQe8=;
        b=fbdvl/K5qKFRNdzxP6h0xct+MYPKuDosMPvQmh7dkzElP+QO3xQrl2Rsq7ChCajdJB
         7/um+eJnusvjwmEQkGr39fnNlvtVNqqEoRAHnBevHu4tJ2zGfnRYHAsWx27YyiSyf9Bl
         K12Odn0C1+WFYJe15xCd+9sCUWEqgAFhsuKBsr+YcGbkxUk2xtc4+ipQ+2y0cOP9nVyC
         AQ4Mg2LWkMsBfUeZnUOUu6ri7VkVtBSc0QfDldNHvLUJ5oFo2AfdIujpdS9kptqeMPZ5
         pVk5Th6Lr/8xbQ0agrMwgHt58jvyf4ZlN6DO6xDED4w3KZhMhkCSIMQmdzO+YFrZSQxF
         tCRQ==
X-Gm-Message-State: AOAM530XLoRS6g76uN6ekoVhPfs5JpDBMTyxekWULPqQC8CWwczMkGX7
	MgidJKCvAOYk5CCWxqX2nZg=
X-Google-Smtp-Source: ABdhPJz/WtcDeDn7aR33eiKK836tVo64FoUHD8vjC83csXPi4iJRqN/ymLL2HdOClqFh4aZQ8c3rVg==
X-Received: by 2002:a05:6000:120a:: with SMTP id e10mr9763270wrx.156.1637870389525;
        Thu, 25 Nov 2021 11:59:49 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ac86])
        by smtp.gmail.com with ESMTPSA id h13sm3762721wrx.82.2021.11.25.11.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 11:59:49 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/5] staging: r8188eu: remove rf_type from issue_assocreq()
Date: Thu, 25 Nov 2021 20:59:33 +0100
Message-Id: <20211125195936.10060-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211125195936.10060-1-straube.linux@gmail.com>
References: <20211125195936.10060-1-straube.linux@gmail.com>
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
2.33.1

