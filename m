Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DF74A13AA
	for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 16:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784046939; cv=none; b=BcM4on5yP72ccYyIXqHRs2nEtJeFLjzGkqq6Bty4cUL6ttRlpNSl5oM0NeyiwZdxz6fKhGjgVQ0FQG5eWmspmk6peKgmR43WH6jlnaphfgPDVAI0/mZYlEiVar8QHMbs6EIaWqxAT8cHzUDFw5LMV/4t7A9oPIs6bQCT3B3Zgho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784046939; c=relaxed/simple;
	bh=aXoqXXMCG0cP/j8pfnMB6mvoTBg1tx08EmT2y2G9YAQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XhN9Qf6lSG71ibITbBpDKrda4hw0n0xKRtcu1emgo/+fT3/1T/QRRY+0GLV4w7iZ0/X51EqBAXCGzXPiINE7X6HF8vJOyIHLJ2KVNF/qCh78HXsrv5idFH9acEyZhMmiLkzqTCEbzC3Ac8cDfWxSszn/CaIDOsLpFDJzafkip4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dC9J4b1M; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dC9J4b1M"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8453427d3f4so3989017b3a.3
        for <linux-staging@lists.linux.dev>; Tue, 14 Jul 2026 09:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784046937; x=1784651737; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XaWCHcAmhDdt3u4ekwE5i5dlNmDWEw+44WeSeauVCtI=;
        b=dC9J4b1Mo6Ge7muyDrmBm0hF6UgEDiTNzJeRTzePWBZzv54bGRD3YgnM7LAJ1Spm9K
         0z7nGkbX+hPpHYCsK+/xN8NRBr/uk2AyzMHBM4g+teDsGGck67dHsq6eNJNXPlMp0uFs
         37OUzYeylfoxqlu6Y7SNCi4OQmgz2Tf8PZyS3DW1mkrja1TJmBd82uvnhNahROtzO4WZ
         ge6A8HbXzd1XiM4jbFnhha9e5ey4Y5qVht16vazTPNpQmyz4oLe0EbuuKezS9kUcrmFI
         aqV8LXYvXDdC2JGZJeE8mTOkMJjSrgKs88TTqO/pxLV6GL0Av1SCS94EnWNF90Nma1Tr
         TcGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784046937; x=1784651737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XaWCHcAmhDdt3u4ekwE5i5dlNmDWEw+44WeSeauVCtI=;
        b=V3KX8Z+Pqx9YEGbiZIonfL7/PW99rXc9CoWt4DTZPUkVPx+iKFT6Aa4+mVoEMRXJs0
         /XtLlnGQNT/DVejZBmClDXHH5ybZDseaZ+Kxv5FQv3Qw0yRyzxvnd2Kxtyxgik8ibATK
         V4dqFeBq8QUUpvr9OIgPpCROFIiK6VpfV6/dYE4xrMc2ZYKITrUN21DGMUPGyKiondyY
         aAtYkSZTr9cC5+N6MOWJWfChD6F8Vt+g9Wmtyvk8Zh61EdSKfly8G1kdwL3zcG9+lktp
         crQIJtXdpFuUrCyPrSQSDukPIclC1oHjEIeyJ9J6D7xq3KS9EV1OKRdozukQTbdWcviU
         7HgQ==
X-Forwarded-Encrypted: i=1; AHgh+RouZmRhh98h5+8jEA/q/ldZNOWWXH1WO3jbSlKJWFjz6KKK39vsMm1TSuBEox2TGlA8CpomB2K3sjBoFF20@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9b6AO8oBq4cVrCKQhPu9xCiSTj7YchhYatkBWml4Iv6FeVHJQ
	pCYWxHDExH7OwDiltScusF4R4c3ky0n0QYK9mYSdpJ+gbvcwPwcmgw3rnG5bBE20
X-Gm-Gg: AfdE7clQ10uPTcytEmxvfd8SOlSxQEu1XMoAHk+TC5CcJeWC9sLbI3+NiSl64n43JPl
	0Mya8KgjlPuMMdB4DAJ66Up5Tq/7ewq4ocWhkMvX1Sd+7weOfstgMSgLx2dOxW9TAoNHtxaT7ij
	3KW+L4CxqcWQ0xGbH6cBRRF8wL0E2q79BeubvSb7YZNBQ/SArMsarVaiiGsovVLZCR7aB+xA503
	Hyv+vupqzuxDbhZ+8g2eWygv+25p2Js4HadPEiM3Mc2hSLh2o1qVg1TTznjK4eellM6RIJYWAkG
	1ieZhQth3opylCidosCdGtqd2DP3dsZ+aPRpB0t+Guy8vd+3aXcmgohnWXPW4iA5RAiiGNryTJ8
	UIOhesAL2QEOOyAkAbby5uFFH13H9VILK4RBZu+y86sWzyPYyn5Ue2owiqHGgt+/0NwqeoLLlPa
	TDX42SmL8mxp2GUWTZqRxznwstmEExplCPibNS4f78
X-Received: by 2002:a05:6a00:1804:b0:847:711f:49ab with SMTP id d2e1a72fcca58-8488961b62cmr13385114b3a.22.1784046937413;
        Tue, 14 Jul 2026 09:35:37 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f7de23asm1786227b3a.49.2026.07.14.09.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 09:35:37 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Cong Nguyen <congnt264@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix xmit_frame/xmit_buf leaks on mgnt-frame error paths
Date: Tue, 14 Jul 2026 23:35:25 +0700
Message-Id: <20260714163525.175763-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

issue_beacon(), issue_probersp() and issue_asocrsp() obtain a management
xmit_frame together with its xmit_buf from the driver's fixed-size
management-TX pools via alloc_mgtxmitframe(). On the normal path the frame
is handed to dump_mgntframe(), which transfers ownership and eventually
returns both objects to their pools (the frame and, for beacons, the buf
in rtl8723bs_mgnt_xmit(); other bufs via the pending-xmitbuf/TX-completion
path).

Several error/edge paths return early after a successful
alloc_mgtxmitframe() but before dump_mgntframe(), so ownership is never
transferred and neither object is freed:

  - issue_beacon(): beacon larger than 512 bytes
  - issue_probersp(): cur_network->ie_length > MAX_IE_SZ
  - issue_probersp(): kzalloc() of the SSID scratch buffer fails
  - issue_asocrsp(): pkt_type is neither ASSOCRSP nor REASSOCRSP

Because alloc_mgtxmitframe() removes the frame and buf from their free
lists (list_del_init) without placing them on any pending list, an
orphaned pair is on no list and referenced by nobody, so it is only
reclaimed at driver teardown. Repeated hits progressively exhaust the
management-TX pools until alloc_mgtxmitframe() returns NULL and the
interface can no longer send beacons or probe/assoc responses.

Free the frame and buffer on these paths, matching the existing correct
error handling in issue_assocreq().

Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 22 ++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 8cf3c14a0dd7..354acd7ceb6f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -2196,8 +2196,11 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 
 	spin_unlock_bh(&pmlmepriv->bcn_update_lock);
 
-	if ((pattrib->pktlen + TXDESC_SIZE) > 512)
+	if ((pattrib->pktlen + TXDESC_SIZE) > 512) {
+		rtw_free_xmitbuf(pxmitpriv, pmgntframe->pxmitbuf);
+		rtw_free_xmitframe(pxmitpriv, pmgntframe);
 		return;
+	}
 
 	pattrib->last_txcmdsz = pattrib->pktlen;
 
@@ -2258,8 +2261,11 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 	pattrib->pktlen = pattrib->hdrlen;
 	pframe += pattrib->hdrlen;
 
-	if (cur_network->ie_length > MAX_IE_SZ)
+	if (cur_network->ie_length > MAX_IE_SZ) {
+		rtw_free_xmitbuf(pxmitpriv, pmgntframe->pxmitbuf);
+		rtw_free_xmitframe(pxmitpriv, pmgntframe);
 		return;
+	}
 
 	if ((pmlmeinfo->state & 0x03) == WIFI_FW_AP_STATE) {
 		pwps_ie = rtw_get_wps_ie(cur_network->ies + _FIXED_IE_LENGTH_,
@@ -2309,8 +2315,11 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 				sizeof(struct ieee80211_hdr_3addr);
 
 			buf = kzalloc(MAX_IE_SZ, GFP_ATOMIC);
-			if (!buf)
+			if (!buf) {
+				rtw_free_xmitbuf(pxmitpriv, pmgntframe->pxmitbuf);
+				rtw_free_xmitframe(pxmitpriv, pmgntframe);
 				return;
+			}
 
 			ssid_ie = rtw_get_ie(ies + _FIXED_IE_LENGTH_, WLAN_EID_SSID, &ssid_ielen,
 					     (pframe - ies) - _FIXED_IE_LENGTH_);
@@ -2689,10 +2698,13 @@ void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_i
 
 	SetSeqNum(pwlanhdr, pmlmeext->mgnt_seq);
 	pmlmeext->mgnt_seq++;
-	if ((pkt_type == WIFI_ASSOCRSP) || (pkt_type == WIFI_REASSOCRSP))
+	if ((pkt_type == WIFI_ASSOCRSP) || (pkt_type == WIFI_REASSOCRSP)) {
 		SetFrameSubType(pwlanhdr, pkt_type);
-	else
+	} else {
+		rtw_free_xmitbuf(pxmitpriv, pmgntframe->pxmitbuf);
+		rtw_free_xmitframe(pxmitpriv, pmgntframe);
 		return;
+	}
 
 	pattrib->hdrlen = sizeof(struct ieee80211_hdr_3addr);
 	pattrib->pktlen += pattrib->hdrlen;
-- 
2.25.1

