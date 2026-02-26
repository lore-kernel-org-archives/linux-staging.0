Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E1C3A1A5F
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 10:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772100273; cv=none; b=YkhQws3Yt/ier9J7C12864p9xOrDssrIHU6MTCSnqIpx+NYb515XpgHaGKQ59fEkiG1C4oBlMUUE513InA49L5IJka8PRTrq5PMffJU3ruul/Lf3ygCy+vzaKbDOwu1R1WUwpYdPEKHLJCgZmOelDdL/AzSjKBZCNEQ8Ca0Nq08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772100273; c=relaxed/simple;
	bh=R5SKWbteYXl94CIOAq2IjCri8PcEfuaJrHzmHEKV+7U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kS93NTgzKbn3tjZDMUqQt/mk1b/iUaa4lg1pB2s/qfSo+1GmzdV2yxa4Sp7AH2qj+1zngZczTFjGTmUtDLFmf8jsvamFBu7NP/S6m6iqD/BGiS5HmADjOW0IASR+idcjzU6lC86UeA7g9ll9y0l9fPQTRFPTnkOW/g/VWhs8c1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Abhhmogj; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Abhhmogj"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4399567ea8cso25256f8f.3
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 02:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772100268; x=1772705068; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sYW+Qfy8gAdplTu194wNCzs4UHpN/prWjSJ7aZXwEMI=;
        b=AbhhmogjCnGtgZHsKyMwRF65oEVibEOuJa2oU1LsYfJExGekDk7fzWkeJAyStVGlzD
         PXelBw1BuQtEpvgI1GysZN3skPF5UaU8PZvPLhGg5rjG2ynI3Ab5ZOXK30+RWMw8WaBF
         4Iu/z6gS6xSDPJSXKoax0vilhhFyTnRsCVPYagbjcQmH9f4wvnJaJpWwTcHoCM49w0YN
         NDiDIAuVHwHiR4z2FXnQZnYXAQkNGPxjVUdxLuxAy/KmHYpWu/yOo9vGsAK2jlFzXOac
         u51kySnTjfZlz64iojWIXU4GZNMiKTgjJRf4fWj71DIhCKfhUzRCqoG3jsIMdv5XVNHf
         OHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772100268; x=1772705068;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sYW+Qfy8gAdplTu194wNCzs4UHpN/prWjSJ7aZXwEMI=;
        b=QPx14C0nZzIxRONGvXKybNH1ny3mSyAm/a8XoQpxS3acKV8RQK66ox25AkRME/b+pY
         cJR9Hbs4w35gR0294HHpsXwkp5YTd7m2Wgs3xhCc/EdsjBpQFRS2ZJIx6VuHyB2+V/+D
         7h7fv7S6rkBgrPyAvhyZW9IsvCUtFyDLhLG9QNnGlLb0W80vPZW7iOYA5YispCJH+1SG
         vbMTm6TGBe6xZs/aVDiYtqryUNBu3TYBtS4oVSy0txI42pJaF72jns3rgU216awHuhLZ
         UArjqXnU0FHr2tqiT1D7gCjH06EKfhcbE6GX847yGLRPvk1fQ4UsqdZNdw7alS76huxF
         nwdg==
X-Gm-Message-State: AOJu0YxhrUqxQ+rktgipMnWUpNGwr2awpyJPWFpEPpbkh5+hDIEDjY+4
	ba6T/VkU9Ry4e3l6JiB6Dx8rCJKAca1NmaUdTmwRzM4VGa89ujstMQUu
X-Gm-Gg: ATEYQzxWiFLtmyR6qV7loFL8CJ40krwfDPyO2YNibc1X3Dj7PdlvGD95j/DYryQF3oe
	wnjHMIjyG21/h2lmpsWxuaAtEREWrobfIqADA8adVEb7RRgCBDdBEwlyKk7jOv1TZjz4hNSJqZ9
	JXzIjT0mvUoUbgHj06mJroKXlw68HxndYg7EcAXegd1G8TQ47QaT1PR2xVERrTW4oWZ5iOCeYkf
	jKIL/o+K1971uTowTBqn6Kky2X4wYtgkBQEWs0plkmPTFi+/EP03ydP3UASRq51NLjFo9TbHwWx
	Dn2CsR0BuHXmkPLUAVHKsa57I0DA3txP7iKt93LhBVSY/wtzq598qJtBzNNwwmDYdNn7sAiqk/y
	qk7CxLLVeJLOY4RU7aHs6sQQLOKsq5IL8KqnYArwxEvxkGNh/ca+KS6QN4Gdp8XN8/dOUXi+5Yo
	MBSvIqPdM5Z3Z1MO/1rPfDu8DQ2rj6qM/jbNfTSygBErJqUjXraLmCg5nXWSKnrQ6d0VMVbZp/g
	3ecllwlVeOIIE+o6p8Ss6zjf3I5MQVvdFjN/DV/3J6yhc9Q/p4eXX1eIG3ahGY=
X-Received: by 2002:a05:6000:612:b0:439:9025:156e with SMTP id ffacd0b85a97d-4399025176fmr4884052f8f.1.1772100267477;
        Thu, 26 Feb 2026 02:04:27 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43994da2584sm7127026f8f.12.2026.02.26.02.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 02:04:26 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH 03/12] staging: rtl8723bs: remove unnecessary casts in rtw_mlme.c
Date: Thu, 26 Feb 2026 14:02:47 +0400
Message-ID: <20260226100255.167059-5-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary pointer casts in memset(), memcpy(), and memcmp()
calls. These functions accept void * arguments, so explicit casts
are not needed.

No functional change. Object code verified identical before and after.

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 26 +++++++++++++----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 7df651708381..d3055ff9258a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -296,7 +296,7 @@ u16 rtw_get_capability(struct wlan_bssid_ex *bss)
 {
 	__le16	val;
 
-	memcpy((u8 *)&val, rtw_get_capability_from_ie(bss->ies), 2);
+	memcpy(&val, rtw_get_capability_from_ie(bss->ies), 2);
 
 	return le16_to_cpu(val);
 }
@@ -361,8 +361,8 @@ int is_same_network(struct wlan_bssid_ex *src, struct wlan_bssid_ex *dst, u8 fea
 	if (rtw_bug_check(dst, src, &s_cap, &d_cap) == false)
 		return false;
 
-	memcpy((u8 *)&tmps, rtw_get_capability_from_ie(src->ies), 2);
-	memcpy((u8 *)&tmpd, rtw_get_capability_from_ie(dst->ies), 2);
+	memcpy(&tmps, rtw_get_capability_from_ie(src->ies), 2);
+	memcpy(&tmpd, rtw_get_capability_from_ie(dst->ies), 2);
 
 	s_cap = le16_to_cpu(tmps);
 	d_cap = le16_to_cpu(tmpd);
@@ -452,7 +452,7 @@ void update_network(struct wlan_bssid_ex *dst, struct wlan_bssid_ex *src,
 	if (update_ie) {
 		dst->reserved[0] = src->reserved[0];
 		dst->reserved[1] = src->reserved[1];
-		memcpy((u8 *)dst, (u8 *)src, get_wlan_bssid_ex_sz(src));
+		memcpy(dst, src, get_wlan_bssid_ex_sz(src));
 	}
 
 	dst->phy_info.signal_strength = ss_final;
@@ -995,15 +995,18 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 			psta->ieee8021x_blocked = true;
 			psta->dot118021XPrivacy = padapter->securitypriv.dot11PrivacyAlgrthm;
 
-			memset((u8 *)&psta->dot118021x_UncstKey, 0, sizeof(union Keytype));
+			memset(&psta->dot118021x_UncstKey, 0,
+			       sizeof(union Keytype));
 
-			memset((u8 *)&psta->dot11tkiprxmickey, 0, sizeof(union Keytype));
-			memset((u8 *)&psta->dot11tkiptxmickey, 0, sizeof(union Keytype));
+			memset(&psta->dot11tkiprxmickey, 0,
+			       sizeof(union Keytype));
+			memset(&psta->dot11tkiptxmickey, 0,
+			       sizeof(union Keytype));
 
-			memset((u8 *)&psta->dot11txpn, 0, sizeof(union pn48));
+			memset(&psta->dot11txpn, 0, sizeof(union pn48));
 			psta->dot11txpn.val = psta->dot11txpn.val + 1;
-			memset((u8 *)&psta->dot11wtxpn, 0, sizeof(union pn48));
-			memset((u8 *)&psta->dot11rxpn, 0, sizeof(union pn48));
+			memset(&psta->dot11wtxpn, 0, sizeof(union pn48));
+			memset(&psta->dot11rxpn, 0, sizeof(union pn48));
 		}
 
 		/* When doing the WPS, the wps_ie_len won't equal to 0 */
@@ -1114,7 +1117,8 @@ void rtw_reset_securitypriv(struct adapter *adapter)
 		/* reset RX BIP packet number */
 		pmlmeext->mgnt_80211w_IPN_rx = 0;
 
-		memset((unsigned char *)&adapter->securitypriv, 0, sizeof(struct security_priv));
+		memset(&adapter->securitypriv, 0,
+		       sizeof(struct security_priv));
 
 		/*  Added by Albert 2009/02/18 */
 		/*  Restore the PMK information to securitypriv structure for the following connection. */
-- 
2.52.0

