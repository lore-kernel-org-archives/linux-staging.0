Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85D94772A9
	for <linux-staging@lists.linux.dev>; Tue,  1 Sep 2026 09:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788253984; cv=none; b=mIiawwZK9Hjb1g7wQL2r5fX4sdSoJvDEaRWArRkPYNtVTVDxl8W7UmLA0hXQ09K6mKJiBnrGTxIidwia/lxuw/yjLIsNI8mv0pE9N4Haa763Thx3zRf8xIgctP87vPZlfpewX6SX9we9hL+i8C+oeMoopwnRyWBqAYn897o17lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788253984; c=relaxed/simple;
	bh=XITT+1DuVC2vgXp1PJ5Ms3WaLX/Qo05Edj4cZZEjhGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DmEniDXgCW0Rmx/BNPrfTwwZ/eYQUgJ3asrLx0+JyHkqzgXDfU84rzytSZuCyc1YwrimURIwt/utY/jsJaZh+MRotySg0nKOyYHHfzR+NPUQzBCJp1RlMnQt6luvpUglv5LFbA29huFVPPRUJCvzSd9YUmoL1rh7GlJ4u4G+sfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=badchecksum.net; spf=none smtp.mailfrom=badchecksum.net; dkim=pass (2048-bit key) header.d=badchecksum-net.20251104.gappssmtp.com header.i=@badchecksum-net.20251104.gappssmtp.com header.b=Zaiwa7xQ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=badchecksum.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=badchecksum.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=badchecksum-net.20251104.gappssmtp.com header.i=@badchecksum-net.20251104.gappssmtp.com header.b="Zaiwa7xQ"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4956869750eso30299505e9.2
        for <linux-staging@lists.linux.dev>; Tue, 01 Sep 2026 02:13:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=badchecksum-net.20251104.gappssmtp.com; s=20251104; t=1788253980; x=1788858780; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i8E1ABSc1cCqFvh3sVxbZ0v89Rm9asgTLDQTs9uO6so=;
        b=Zaiwa7xQYTBJw7C+lX7Iy9Z8AOUqwn7n6TGHsJUVXyEWdIABZRgF/ql0eyTQT86HhT
         kl+LNesoDFuZXJtcLgAPVeOR0q9JagIaBVTcyCUVg9uPFkKa19X9swMOPE/Zt3ov6f5C
         xsrrnqIeOBVupHXzQcFChLDtoatTO+xR8MPfhHGs5XSD3o7elW9Wjxp3VxMYDzPOjXUS
         pouvSTHJnCCjDY/oqqsEa2TrizasU01+KfdgO1ucH6InDX7XAv7/FTt8ASwHhgBLjVV/
         Y9QlbrVi08TO/1MLFA19OWzVIdAlB79TPlB58Cgg8u8c5fUreLwEHOxwLHuLYtEGLtT/
         Wtlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788253980; x=1788858780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i8E1ABSc1cCqFvh3sVxbZ0v89Rm9asgTLDQTs9uO6so=;
        b=PqVC3aRtCYAfCanpxe9cnXmnGMB1WgTIRFspXyRchz4bLef0GqHDU2sFOJ8ZJFH+py
         oKpyMuDVig/2iA4WxGfNZJuPngavCF3sicfVzOLHUap0QlzwaRcj7tpw0FmmRtNh607J
         +/NFQZNcnfq/SenouIZLjNx8LTph3sVT9IN79lh6HY2wBB6L6keSFWnMwZZn7Bpr7BYx
         /xb9+YvmHc3vPTgDBJcZpOsKj1owYGfBOgw4ADHaze9WnqrPnvBEgazpOGPW+e4CBRXk
         B+1cH8TAH5PlsJUIkz0FXEuSPWQigCKjwvfBDx2gTPXPPCCTcBWN+fuCgFvryfsLydUa
         jX1A==
X-Forwarded-Encrypted: i=1; AHgh+RoBFKLHou0i0y+SwQfg81BEKcD4iqlAaEC8/nG2n8BWOqXv0vMIpsMt/QZORW9E3e37M9L80gBMxl4kCPgp@lists.linux.dev
X-Gm-Message-State: AFuF++lW7HS1U96E/FHJZa8zIdGq2ksXWb4GlgBmmiqBnSFdLPImqVYb
	IBZ+Gqyu+D8P9pvNfaNTWaR15Y0AIPJdNoi6hYhuZSj+n4IUc0MU2vYNHDLkYsqClN2LB+qku5h
	J88daHg==
X-Gm-Gg: AR+sD12GsMaRY9f7rfzjq2kCDz8qrBJbtDhmVTN8NbcViyRaxQqrca7UX0F9M68rVvR
	tk5iBbkong7tR21v21DbByYnIkvZyYKoSepOE4VcIoP41mPxDhuY2BbZcMdF7HwPk/D5Hnz/7J9
	RsXjB0SKu1qVH5vyQHZsAKZ8bJGJcM+l24SQwcz29tOwat/Q+8RIePfYRcmqRiZXLAXLrvX+Qop
	G9KzQUojGuxQ9VlqzwS/pQNVRsl0jMrdqntw/0p1/J6LwhmgaXq0aJahF7SoeQtzFdj83qKXFBt
	TA/N58WOEEd7Rs+1K8lV8AkbDoRJe7P5GrkjcT2Ob4l9lGMxeNDtF6/eyChWHtiEWjDnRP+mwrd
	gsth4qPjoXGWG8mxZS5JZ5Bc4I1FfYZ7nAYcIJLwd6sgV9pGNf66f3kTvB7sgMkFuYtyG6+O6FP
	by+nqjhkefagDT98sSaJsYaDdmBYG8oTzus1eIi44qPsZeFk/smz8jEMeAXCBQJWVbjgBNkQrA0
	dtOdNZ+dOhXT7ksiECjzBZJWoH3ow==
X-Received: by 2002:a05:600c:c08a:b0:49c:e1b5:b2bf with SMTP id 5b1f17b1804b1-49ce1b5b2c3mr13420475e9.0.1788253979747;
        Tue, 01 Sep 2026 02:12:59 -0700 (PDT)
Received: from h4x0rl4nd (244.red-83-44-244.dynamicip.rima-tde.net. [83.44.244.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccd1e19desm313369165e9.1.2026.09.01.02.12.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:12:59 -0700 (PDT)
From: Jesus Olmos <sha0@badchecksum.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: rtl8723bs: bound WPS attribute copy in rtw_get_wps_attr_content()
Date: Tue,  1 Sep 2026 11:12:26 +0200
Message-ID: <20260901091226.444666-1-sha0@badchecksum.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901072249.366750-1-sha0@badchecksum.net>
References: <20260901072249.366750-1-sha0@badchecksum.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_get_wps_attr_content() copies attr_len - 4 (the WPS attribute's 2-byte
data-length field, up to 0xffff) from a WPS information element into the
caller's buffer with no destination-size bound:

	memcpy(buf_content, attr_ptr + 4, attr_len - 4);

The information element comes straight from a received beacon / probe
response: collect_bss_info() copies the frame's IEs verbatim into
bssid->ies, which reaches the scan queue, so attr_len is attacker
controlled. rtw_cfg80211_inform_bss() and two sites in rtw_mlme_ext.c call
this for WPS_ATTR_SELECTED_REGISTRAR with a one-byte destination (u8 sr /
u8 selected_registrar), because that attribute is a single byte by spec. A
frame that declares a longer Selected Registrar attribute therefore
overflows the one-byte stack variable during a scan, which happens
automatically (NetworkManager/iwd), giving an unauthenticated adjacent
attacker a remote stack buffer overflow (at minimum a stack-protector
panic).

Commit 1463ca3ec660 ("staging: rtl8723bs: fix OOB reads in rtw_get_sec_ie(),
rtw_get_wapi_ie(), and rtw_get_wps_attr()") added a bounds check for the
attribute header in rtw_get_wps_attr() but not for the attribute data
length, and did not touch rtw_get_wps_attr_content(), so the copy remained
both an out-of-bounds read of the attribute data and an out-of-bounds write
of the destination.

Reject attributes that claim more data than the IE holds (fixing the
out-of-bounds read and the latent memcpy(buf_attr, ...) in
rtw_get_wps_attr()), give rtw_get_wps_attr_content() the destination buffer
size, and clamp the copy to it.

Compute the attribute length in an unsigned int rather than u16: a declared
data length of 0xfffc made (u16)(attr_data_len + 4) wrap to 0, which slipped
past that bounds check and advanced the parser by zero, looping forever.

Found using mwemu (https://github.com/sha0coder/mwemu).

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Assisted-by: Claude (Anthropic)
Signed-off-by: Jesus Olmos <sha0@badchecksum.net>
---
v2:
 - Widen attr_len to unsigned int so a declared data length near 0xffff
   cannot wrap; for 0xfffc the old u16 wrap defeated the bounds check and
   made rtw_get_wps_attr() loop forever. Thanks Greg for spotting it.
 - Add Assisted-by: tag for the AI-assisted analysis.

Build-tested as a module (x86_64 defconfig + CONFIG_RTL8723BS=m). Not tested
on real hardware (I don't have an RTL8723BS device). The bug and the fix were
found and checked by source review plus function-level emulation of
rtw_get_wps_attr()/rtw_get_wps_attr_content() under mwemu: with a 0xfffc data
length the pre-fix code spins forever (u16 wrap -> attr_ptr += 0) while the
fix returns immediately, and the Selected Registrar overflow is clamped to the
1-byte destination.
 .../staging/rtl8723bs/core/rtw_ieee80211.c    | 19 +++++++++++++++----
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 12 ++++++++++--
 drivers/staging/rtl8723bs/include/ieee80211.h |  4 +++-
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  5 ++++-
 4 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 66f476a46aad..bf7509a6eb44 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -739,7 +739,11 @@ u8 *rtw_get_wps_attr(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_att
 			break;
 		u16 attr_id = get_unaligned_be16(attr_ptr);
 		u16 attr_data_len = get_unaligned_be16(attr_ptr + 2);
-		u16 attr_len = attr_data_len + 4;
+		uint attr_len = attr_data_len + 4;
+
+		/* An attribute must not claim more data than the IE holds. */
+		if (attr_ptr + attr_len > wps_ie + wps_ielen)
+			break;
 
 		if (attr_id == target_attr_id) {
 			target_attr_ptr = attr_ptr;
@@ -768,7 +772,9 @@ u8 *rtw_get_wps_attr(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_att
  *
  * Returns: the address of the specific WPS attribute content found, or NULL
  */
-u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_content, uint *len_content)
+u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen, u16 target_attr_id,
+			     u8 *buf_content, uint buf_content_len,
+			     uint *len_content)
 {
 	u8 *attr_ptr;
 	u32 attr_len;
@@ -779,11 +785,16 @@ u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8
 	attr_ptr = rtw_get_wps_attr(wps_ie, wps_ielen, target_attr_id, NULL, &attr_len);
 
 	if (attr_ptr && attr_len) {
+		uint content_len = attr_len - 4;
+
+		if (content_len > buf_content_len)
+			content_len = buf_content_len;
+
 		if (buf_content)
-			memcpy(buf_content, attr_ptr + 4, attr_len - 4);
+			memcpy(buf_content, attr_ptr + 4, content_len);
 
 		if (len_content)
-			*len_content = attr_len - 4;
+			*len_content = content_len;
 
 		return attr_ptr + 4;
 	}
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index e965133d94ab..0616ed03c6a1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1123,7 +1123,12 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 			if (pmlmepriv->wps_beacon_ie) {
 				u8 selected_registrar = 0;
 
-				rtw_get_wps_attr_content(pmlmepriv->wps_beacon_ie, pmlmepriv->wps_beacon_ie_len, WPS_ATTR_SELECTED_REGISTRAR, &selected_registrar, NULL);
+				rtw_get_wps_attr_content(pmlmepriv->wps_beacon_ie,
+							 pmlmepriv->wps_beacon_ie_len,
+							 WPS_ATTR_SELECTED_REGISTRAR,
+							 &selected_registrar,
+							 sizeof(selected_registrar),
+							 NULL);
 
 				if (!selected_registrar) {
 					status = WLAN_STATUS_AP_UNABLE_TO_HANDLE_NEW_STA;
@@ -2131,7 +2136,10 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 						sizeof(struct ieee80211_hdr_3addr) -
 						_BEACON_IE_OFFSET_, NULL, &wps_ielen);
 			if (wps_ie && wps_ielen > 0)
-				rtw_get_wps_attr_content(wps_ie,  wps_ielen, WPS_ATTR_SELECTED_REGISTRAR, (u8 *)(&sr), NULL);
+				rtw_get_wps_attr_content(wps_ie, wps_ielen,
+							 WPS_ATTR_SELECTED_REGISTRAR,
+							 (u8 *)(&sr), sizeof(sr),
+							 NULL);
 			if (sr != 0)
 				set_fwstate(pmlmepriv, WIFI_UNDER_WPS);
 			else
diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index 9f421e4875b7..2eeedd52454a 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -710,7 +710,9 @@ void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie
 
 u8 *rtw_get_wps_ie(u8 *in_ie, uint in_len, u8 *wps_ie, uint *wps_ielen);
 u8 *rtw_get_wps_attr(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_attr, u32 *len_attr);
-u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_content, uint *len_content);
+u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen, u16 target_attr_id,
+			     u8 *buf_content, uint buf_content_len,
+			     uint *len_content);
 
 /**
  * for_each_ie - iterate over continuous IEs
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 3468d4114f60..b9f74f61b0ca 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -244,7 +244,10 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
 		wpsie = rtw_get_wps_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_, pnetwork->network.ie_length - _FIXED_IE_LENGTH_, NULL, &wpsielen);
 
 		if (wpsie && wpsielen > 0)
-			psr = rtw_get_wps_attr_content(wpsie, wpsielen, WPS_ATTR_SELECTED_REGISTRAR, (u8 *)(&sr), NULL);
+			psr = rtw_get_wps_attr_content(wpsie, wpsielen,
+						       WPS_ATTR_SELECTED_REGISTRAR,
+						       (u8 *)(&sr), sizeof(sr),
+						       NULL);
 
 		if (sr != 0) {
 			/* it means under processing WPS */
-- 
2.55.0

