Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216BB2CA3
	for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 09:00:27 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id q8so25257030wra.12
        for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 01:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Vdq1YRATZXZW2zTmJrFcNBwG86kVUBqymJ+QklrHyQY=;
        b=iXPFPewI0GZ1elrbXi5ovlp6lZOKo157t8RaURBq2v/j9IBpNhMDtZfaDILCKIBcIL
         0PmrzvqIwgOPYjT6KfO/YZzDaPbjglOZMZotoZFH5KszCzCnGvc00KbO6tFKdQAYVFVi
         AIQC+UqGWL6HBDlb+GBqBdk4zcCzAGM/SHHqqc/eG3Pv34B78dxp6Udjch3gP3pOkUkT
         DJcXdpp9AEDW+xzLz85DOrD8c4gVa+FptBsLmf9uNE01maC1lB+wBWFJb4CSSAjJZThv
         NJsAkLUaYZ9ZKPJoL4+RlfgGYjTJNk9RVX7XE6fuC1YQWXKRqrRsMoIaWd+oDRqACWHO
         fosQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Vdq1YRATZXZW2zTmJrFcNBwG86kVUBqymJ+QklrHyQY=;
        b=TBAQOCeGB70e20di5/7DUcfhMmXNTef9Daepdo/qH5cZoq691IwN//YUySu7oeZe9U
         AY47aNjcY8BY2twNyXLdsyRBbxPL0HOwnJtpciXPi4UjWatKAdCr32HxlwBeLqu+G5pf
         EN2TVFJsjnuCWMr272zJqr+O86hG6eLztTvymeC1zOvUqs4knzDNST86QxzTL8g0LSwd
         rw0qFMX/5qsRuM6m/nQkSOdXWDE3Eb7gnRnnEIW9M1FoY29nTAd2KKxGafHCyhvCqtEh
         OW+iN8IZ6b9P4XiiXD9gr5gVPa1/TPIXTV87XcoZIdAZe13CoQAgnpNuebMShvN1Va8d
         COxg==
X-Gm-Message-State: AOAM531Z0CbPy5ME4/HovA3m3SgcXBozil81ATZ/sP3Le0olLd6Z9ruq
	56h5/kAU2hK4yrHN6JEPgltFig==
X-Google-Smtp-Source: ABdhPJwM2BPb7k1hwg9ILv4zfpmrE0Fk1nkhO60Ej/mSk1/4v/arm9rU1jXliRptgQzkTwnxG55eoA==
X-Received: by 2002:a05:6000:188d:: with SMTP id a13mr44403881wri.389.1641805225521;
        Mon, 10 Jan 2022 01:00:25 -0800 (PST)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id m15sm6263287wmq.6.2022.01.10.01.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 01:00:25 -0800 (PST)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/7] staging: r8188eu: convert DBG_88E calls in core/rtw_ioctl_set.c
Date: Mon, 10 Jan 2022 09:00:18 +0000
Message-Id: <20220110090020.6800-6-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220110090020.6800-1-phil@philpotter.co.uk>
References: <20220110090020.6800-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the DBG_88E macro calls in core/rtw_ioctl_set.c to use netdev_dbg,
as their information may be useful to observers, and this gets the
driver closer to the point of being able to remove DBG_88E itself.
Also remove one unnecessary DBG_88E call which was already commented
out.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/core/rtw_ioctl_set.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ioctl_set.c b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
index eadfbdb94dd5..c95ca471ae55 100644
--- a/drivers/staging/r8188eu/core/rtw_ioctl_set.c
+++ b/drivers/staging/r8188eu/core/rtw_ioctl_set.c
@@ -122,7 +122,8 @@ u8 rtw_set_802_11_bssid(struct adapter *padapter, u8 *bssid)
 
 	spin_lock_bh(&pmlmepriv->lock);
 
-	DBG_88E("Set BSSID under fw_state = 0x%08x\n", get_fwstate(pmlmepriv));
+	netdev_dbg(padapter->pnetdev, "Set BSSID under fw_state = 0x%08x\n",
+		   get_fwstate(pmlmepriv));
 	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY))
 		goto handle_tkip_countermeasure;
 	else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING))
@@ -195,7 +196,8 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid)
 
 	spin_lock_bh(&pmlmepriv->lock);
 
-	DBG_88E("Set SSID under fw_state = 0x%08x\n", get_fwstate(pmlmepriv));
+	netdev_dbg(padapter->pnetdev, "Set SSID under fw_state = 0x%08x\n",
+		   get_fwstate(pmlmepriv));
 	if (check_fwstate(pmlmepriv, _FW_UNDER_SURVEY)) {
 		goto handle_tkip_countermeasure;
 	} else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING)) {
@@ -280,8 +282,6 @@ u8 rtw_set_802_11_infrastructure_mode(struct adapter *padapter,
 	if (*pold_state != networktype) {
 		spin_lock_bh(&pmlmepriv->lock);
 
-		/* DBG_88E("change mode, old_mode =%d, new_mode =%d, fw_state = 0x%x\n", *pold_state, networktype, get_fwstate(pmlmepriv)); */
-
 		if (*pold_state == Ndis802_11APMode) {
 			/* change to other mode from Ndis802_11APMode */
 			cur_network->join_res = -1;
@@ -364,7 +364,7 @@ u8 rtw_set_802_11_bssid_list_scan(struct adapter *padapter, struct ndis_802_11_s
 		res = true;
 	} else {
 		if (rtw_is_scan_deny(padapter)) {
-			DBG_88E(FUNC_ADPT_FMT": scan deny\n", FUNC_ADPT_ARG(padapter));
+			netdev_dbg(padapter->pnetdev, "scan deny\n");
 			indicate_wx_scan_complete_event(padapter);
 			return _SUCCESS;
 		}
-- 
2.33.1

