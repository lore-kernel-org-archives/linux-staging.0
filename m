Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE1625581E5
	for <linux-staging@lists.linux.dev>; Tue, 13 Oct 2026 20:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791922560; cv=none; b=Rsf5kcXgYaGHrWnX0aTcsWnII2NGs8xGS8adkm+WptsLuyOjDpHc4Til+BTrA9I6Cwx+eOCc/aF1698UzzpdaoMGHlPyU1SPXRXAMu8owBLxTwQFcGYcNWdy1VWE+U568YpJ4P/EYWbHydOaW86P085YqY20WzUwJ1B7UFvczBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791922560; c=relaxed/simple;
	bh=XrOKi5+LPvGwFwVerfisjs3shnJ7pN8myymdFyxc1Ec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q7GwTze+0gaA0gikWXK+abUHpL2EZDl4bGskWPlVi31punxNuK2bnWLc7RIxn+neGAVImjdf37UUG7N+qq0fF8vi3HIGrMfs9WgltrXlVk/149psaWrpg30M6/7neT4M6yXILyg2HuKTqFQpGjE9tCFsVWGQBcKQ82Cjsp1Cdxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I/Op3uBZ; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I/Op3uBZ"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-81ae6aefdceso221953a34.0
        for <linux-staging@lists.linux.dev>; Tue, 13 Oct 2026 13:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791922556; x=1792527356; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jcBlwSovPnfSTK4K/hUxzccfjyfeJvmVDVyKW4TD8gg=;
        b=I/Op3uBZLkHf4N8BPzowLyxzZqD4F8L3oMSyCW4lTrui8xrcVUsKTCco/dBaYb/1y6
         T2yXtAxx62LYjc8Wo6GIO/EBhYMvnIGmUschUaYVjXB392w+SeDwcAtQwfjc7RLswZtH
         iIK1F29qVX2RzfwnBsaOCOgWDSde47sxDPakJiL88p5GtNtVJuHBopNUlY2DzIGyiINL
         tudwr0Afc4V1r7VmAikdxUYf44AuezFT9RP/6zPedAgACwQj7PKO9lgG7SDV81+NyGJP
         esCKJNZyt8wGWPnStfwU9i/bMQ/CigGY0qi2ns2Q8MNGmzSVAp8JWWJzrWZmxTlzqeE3
         BXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791922556; x=1792527356;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jcBlwSovPnfSTK4K/hUxzccfjyfeJvmVDVyKW4TD8gg=;
        b=RwyllTnDfJQr/M7/TsHkC3gIdCZJ7NnCaYfNT50bJnMpjL5ePcpmHBu0yw0MYbYKI6
         wYmBWVCkgoLBnILrC/JVQmpFCkO9gEQNWAPjoudcbBJkY0f97n2UbX1wRzrCuUoJGU0Z
         ViJuzfax0G8ab9ckqSboZohFzMMtzOYSQ0E/W3l8DL7Q30zJY+wDgIm3eDfZPKoAlTWS
         bimOLSpumllAzU3oRF0Kcl2SJYHKLEjTpXqAAx0N1ga2ITmSj/p1ck5SepyO75eEjCoR
         sSIvETpbY4TIkQZ4zhTaC6jpTXUfE3qbrUzsQRaaf8omoQumAZABwMJVcIRiRva6YWeS
         ASjA==
X-Gm-Message-State: AFq9FYKzpQOXZRqeWWpT/dhyK1CWEAw9/ZUtAR1ce3EoEeWWiyqhaez5
	n3aSOQt0t1SyHwXwK+srF2iNaRoFIJs+BYStxTp5rUvr81FMLORe2cxrPn6WRBomkbo=
X-Gm-Gg: AYBFou1hTqbSqUEVF26jgAcQY9coTUorh1i1RzdtpCBgK+OIbMsEbCQmjc/AIfPKpmf
	QA4O2GF64jASDAphzJDKXNnEBz+gIQwgbmSRQaatLN9lAw6D3Nap07ap3tUIL0yEgsGSycdAw+r
	0BFa5q1iT8bts2q3VrBfhIt/YKmWZhLUD2OCOxWJQAwe2cziq5koTE8Y38wHBB7F0tLHmqDR9i6
	IgmF80LuEWBOB1lYjDUDtXRQdynRACt8FWvWCY7XEj9UXnOwIUV9RCeDD2uubxwGrlg5eFq+I26
	coABmybB2ZxgV7LBy7Y7m1U8DgwnmBZWcFxAiv8+05ELYAxBaCD/fzBI+XjbqzrYrjnYCyjA1ZB
	/utExeRRfQl9ijbI+Xnch8S/rdZEzWSJuCihBJt4ItbPQqSu2Cq+WFHXcdHF/FTpuXk3r/5yXx5
	FKIttvMam7sP2AvvuFHIfzeYyHc72Vemq5YcOdaXktjAMKROz/O4MNbByzDphx8PNVhvXeEKOnU
	i8=
X-Received: by 2002:a05:6830:6f8d:b0:824:e29:e00e with SMTP id 46e09a7af769-830971a491fmr11696739a34.20.1791922556403;
        Tue, 13 Oct 2026 13:15:56 -0700 (PDT)
Received: from pop-os.. ([24.32.17.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-83038f82468sm13557570a34.11.2026.10.13.13.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 13:15:55 -0700 (PDT)
From: Rishik Yechuri <epicrishik@gmail.com>
X-Google-Original-From: Rishik Yechuri <rishik.yechuri.code@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rishik Yechuri <rishik.yechuri.code@gmail.com>
Subject: [PATCH 09/10] staging: rtl8723bs: use IEEE80211_QOS_CTL_* masks for QoS control
Date: Tue, 13 Oct 2026 15:15:37 -0500
Message-ID: <20261013201538.43156-10-rishik.yechuri.code@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013201538.43156-1-rishik.yechuri.code@gmail.com>
References: <20261013201538.43156-1-rishik.yechuri.code@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver reads and writes the QoS Control field with the
SetPriority(), GetPriority(), SetEOSP(), SetAckpolicy(),
GetAckpolicy() and GetAMsdu() macros, which shift and mask the field
by hand. <linux/ieee80211.h> defines IEEE80211_QOS_CTL_* masks for the
TID, EOSP, Ack Policy and A-MSDU Present subfields.

On transmit, set the subfields with le16_encode_bits() and the
corresponding masks, and declare the QoS Control pointers as __le16
to match the byte order of the field. le16_encode_bits() masks the
value to the width of the subfield, as the macros did.

On receive, locate the field with ieee80211_get_qos_ctl() instead of
a fixed offset of 24 bytes, and extract the subfields with
u8_get_bits(). Frames with four addresses are rejected by
validate_recv_data_frame() before the QoS Control field is parsed, so
the helper always returns the same offset as before.

Remove the macro definitions, which no longer have any users.

No functional change intended.

Signed-off-by: Rishik Yechuri <rishik.yechuri.code@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 10 +++++-----
 drivers/staging/rtl8723bs/core/rtw_recv.c     |  8 +++++---
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 12 +++++++-----
 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  |  8 ++++----
 drivers/staging/rtl8723bs/include/wifi.h      | 15 ---------------
 5 files changed, 21 insertions(+), 32 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index ec0046d3a..4d8073d48 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -3039,7 +3039,7 @@ static int _issue_qos_nulldata(struct adapter *padapter, unsigned char *da,
 	unsigned char *pframe;
 	struct ieee80211_hdr	*pwlanhdr;
 	__le16 *fctrl;
-	u16 *qc;
+	__le16 *qc;
 	struct xmit_priv *pxmitpriv = &(padapter->xmitpriv);
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
@@ -3071,13 +3071,13 @@ static int _issue_qos_nulldata(struct adapter *padapter, unsigned char *da,
 	else if ((pmlmeinfo->state & 0x03) == WIFI_FW_STATION_STATE)
 		*fctrl |= cpu_to_le16(IEEE80211_FCTL_TODS);
 
-	qc = (unsigned short *)(pframe + pattrib->hdrlen - 2);
+	qc = (__le16 *)(pframe + pattrib->hdrlen - 2);
 
-	SetPriority(qc, tid);
+	*qc |= le16_encode_bits(tid, IEEE80211_QOS_CTL_TID_MASK);
 
-	SetEOSP(qc, pattrib->eosp);
+	*qc |= le16_encode_bits(pattrib->eosp, IEEE80211_QOS_CTL_EOSP);
 
-	SetAckpolicy(qc, pattrib->ack_policy);
+	*qc |= le16_encode_bits(pattrib->ack_policy, IEEE80211_QOS_CTL_ACK_POLICY_MASK);
 
 	memcpy(pwlanhdr->addr1, da, ETH_ALEN);
 	memcpy(pwlanhdr->addr2, myid(&(padapter->eeprompriv)), ETH_ALEN);
diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index b09ea6f76..a7462444e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1309,9 +1309,11 @@ static signed int validate_recv_data_frame(struct adapter *adapter, union recv_f
 	pattrib->ack_policy = 0;
 	/* parsing QC field */
 	if (pattrib->qos == 1) {
-		pattrib->priority = GetPriority((ptr + 24));
-		pattrib->ack_policy = GetAckpolicy((ptr + 24));
-		pattrib->amsdu = GetAMsdu((ptr + 24));
+		u8 *qc = ieee80211_get_qos_ctl(hdr);
+
+		pattrib->priority = u8_get_bits(*qc, IEEE80211_QOS_CTL_TID_MASK);
+		pattrib->ack_policy = u8_get_bits(*qc, IEEE80211_QOS_CTL_ACK_POLICY_MASK);
+		pattrib->amsdu = u8_get_bits(*qc, IEEE80211_QOS_CTL_A_MSDU_PRESENT);
 		pattrib->hdrlen = pattrib->to_fr_ds == 3 ? 32 : 26;
 
 		if (pattrib->priority != 0 && pattrib->priority != 3)
diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 1624bf6de..290e7e589 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -904,7 +904,7 @@ static void xmitframe_swencrypt(struct adapter *padapter, struct xmit_frame *pxm
 
 int rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattrib)
 {
-	u16 *qc;
+	__le16 *qc;
 
 	struct ieee80211_hdr *pwlanhdr = (struct ieee80211_hdr *)hdr;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
@@ -956,14 +956,16 @@ int rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 			*fctrl |= cpu_to_le16(IEEE80211_FCTL_PROTECTED);
 
 		if (qos_option) {
-			qc = (unsigned short *)(hdr + pattrib->hdrlen - 2);
+			qc = (__le16 *)(hdr + pattrib->hdrlen - 2);
 
 			if (pattrib->priority)
-				SetPriority(qc, pattrib->priority);
+				*qc |= le16_encode_bits(pattrib->priority,
+							IEEE80211_QOS_CTL_TID_MASK);
 
-			SetEOSP(qc, pattrib->eosp);
+			*qc |= le16_encode_bits(pattrib->eosp, IEEE80211_QOS_CTL_EOSP);
 
-			SetAckpolicy(qc, pattrib->ack_policy);
+			*qc |= le16_encode_bits(pattrib->ack_policy,
+						IEEE80211_QOS_CTL_ACK_POLICY_MASK);
 		}
 
 		/* TODO: fill HT Control Field */
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
index 756d6dc84..24cf2b6eb 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c
@@ -260,8 +260,8 @@ static void ConstructNullFunctionData(struct adapter *padapter,
 		*fctrl |= cpu_to_le16(IEEE80211_FTYPE_DATA | IEEE80211_STYPE_QOS_NULLFUNC);
 
 		pwlanqoshdr = (struct ieee80211_qos_hdr *)pframe;
-		SetPriority(&pwlanqoshdr->qos_ctrl, AC);
-		SetEOSP(&pwlanqoshdr->qos_ctrl, bEosp);
+		pwlanqoshdr->qos_ctrl |= le16_encode_bits(AC, IEEE80211_QOS_CTL_TID_MASK);
+		pwlanqoshdr->qos_ctrl |= le16_encode_bits(bEosp, IEEE80211_QOS_CTL_EOSP);
 
 		pktlen = sizeof(struct ieee80211_qos_hdr);
 	} else {
@@ -748,8 +748,8 @@ static void ConstructBtNullFunctionData(struct adapter *padapter,
 		*fctrl |= cpu_to_le16(IEEE80211_FTYPE_DATA | IEEE80211_STYPE_QOS_NULLFUNC);
 
 		pwlanqoshdr = (struct ieee80211_qos_hdr *)pframe;
-		SetPriority(&pwlanqoshdr->qos_ctrl, AC);
-		SetEOSP(&pwlanqoshdr->qos_ctrl, bEosp);
+		pwlanqoshdr->qos_ctrl |= le16_encode_bits(AC, IEEE80211_QOS_CTL_TID_MASK);
+		pwlanqoshdr->qos_ctrl |= le16_encode_bits(bEosp, IEEE80211_QOS_CTL_EOSP);
 
 		pktlen = sizeof(struct ieee80211_qos_hdr);
 	} else {
diff --git a/drivers/staging/rtl8723bs/include/wifi.h b/drivers/staging/rtl8723bs/include/wifi.h
index 85348979a..d1bb9076d 100644
--- a/drivers/staging/rtl8723bs/include/wifi.h
+++ b/drivers/staging/rtl8723bs/include/wifi.h
@@ -18,21 +18,6 @@
 /*  This test verifies the WLAN NIC can update the NAV through sending the CTS with large duration. */
 #define	WiFiNavUpperUs				30000	/*  30 ms */
 
-#define SetPriority(pbuf, tid)	\
-	(*(__le16 *)(pbuf) |= cpu_to_le16(tid & 0xf))
-
-#define GetPriority(pbuf)	((le16_to_cpu(*(__le16 *)(pbuf))) & 0xf)
-
-#define SetEOSP(pbuf, eosp)	\
-		(*(__le16 *)(pbuf) |= cpu_to_le16((eosp & 1) << 4))
-
-#define SetAckpolicy(pbuf, ack)	\
-	(*(__le16 *)(pbuf) |= cpu_to_le16((ack & 3) << 5))
-
-#define GetAckpolicy(pbuf) (((le16_to_cpu(*(__le16 *)pbuf)) >> 5) & 0x3)
-
-#define GetAMsdu(pbuf) (((le16_to_cpu(*(__le16 *)pbuf)) >> 7) & 0x1)
-
 static inline unsigned char *rtl8723bs_get_ra(unsigned char *pframe)
 {
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)pframe;
-- 
2.43.0

