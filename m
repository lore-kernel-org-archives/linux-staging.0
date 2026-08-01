Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA453002CF
	for <linux-staging@lists.linux.dev>; Sat,  1 Aug 2026 17:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785606378; cv=none; b=c9Xof3IoQqjGcPkw5NNMFjrBGiUZyMcN9QNKeVg8kr5iyZL4BVkQdzNaMcIwdBxTy0ydGsxjSuO3rmFHzCrpz0dTawtEO0hYIVt3/uBnQxBgpookqONX2OoCgT6Fo86Lnac3FGfvK2Wm67EG3h77lgwnzXchKkJvvhWpEiguNyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785606378; c=relaxed/simple;
	bh=FUZ4q1G7NLlYH4FBldchmQ9rFmJHtFQ5OSLYMtOJVGs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ohE01trc6lql8SUL8SA52vN0VNlTdmn7SDKxpC5WINiCrWvSS/m/PKbI5bH1lPLYT6fvJ05/EcZPPfEaRyiz2hCQ+QYH5fD7BocHgSXgDZSICkXuNjJiDwr6234kk274Wo1e102MDQHClEtj3CbE14HIEwtM/OuTyJsFIRgmnvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QIkn8Hyh; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QIkn8Hyh"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-c9e30214d8fso1541987a12.3
        for <linux-staging@lists.linux.dev>; Sat, 01 Aug 2026 10:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785606376; x=1786211176; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ExlG7ok7P5AUsQgKkv2/C0UDicaYRTTkOfSkDIupq6E=;
        b=QIkn8HyhDPBnoHDF/vP9uuxHbicfCbJTqO+Fr5v4H0vMlrpK4sGhXKBp0u8AeQ4Ve+
         WCERASc+aVbaV61GnkeQlNWnjbcIcwpod5zKXrJ2fbPGjxWmnRRcwxWdzKqggXx+cmX+
         BFAyLw/8dx1JGgoN5cVjuKuoKu4RihzVy/8Nq24zDuoywNqiilebwV2pJdbJYIZeUN6o
         3rwcc4knYEOXNEaPjgmVuY+3C30btqzjVjqfxvDHkxgqQ1jMjNDumt7GdUxA+vvsiCWX
         s9h0K92bsG7tgUVmYeniUSuBgeUBjHBMBQOUWYDrvwjEG7Iq0NgvIcKaIRORZE3kT3Fw
         X3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785606376; x=1786211176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ExlG7ok7P5AUsQgKkv2/C0UDicaYRTTkOfSkDIupq6E=;
        b=qJXL+nV+1NiSa4pXnWKDBr32liRPULJUmNEgz82oiQJevZQviX96FoxUhHLvbZskCw
         0o42OLXC5MOOzYqEbAkfyW7ikIJw4LMYmIQPMLv+Q8ds2KU4yTmFMHm3uqDIXNM0iUiA
         wgrSiAWUyRdunLL/qUuE5cg0tylHt5qM5q1PuNq2oBYeWZkdUcbjG7a/lyCQW8AFfb3e
         fBlLxiFdABVQ0lu+HuSWh6+yJXLly6jLcvy0t7B+ZSh4gYIJYaVcs5kwcoUPZbddN3cM
         Fcmoqb5ToijAY2h9wgNxTNENrH8IyIlFzowj9OVxpnWWGdHzYdjpiD+l5tX3NN1tfWFs
         F3mw==
X-Gm-Message-State: AOJu0YytkzX3QciDxwZE/khaGWRqHQ3oktQuDWuSFSmb0BVZf7rHlxIN
	0Liia+id2AfqORV7U9ueu8q2EpJWACNCBdktnOOvH4xBmlWv/B/99J5hRJW/ziDL
X-Gm-Gg: AR+sD13TizQDfJoX5y/ttUa40NHSZFoKKw43YCLe88ghD15snwoAYtouKOwUh3E1ukU
	UFPVS9bDAXOcqQ1ipXtk1Pz0FHzxo0IMD6br8GQC2cJvA2z6XeSVgeLfwimYLt6FDL/kGLXjZli
	Clsz4wcxEe0IY7j9ueolAsNI42/yjeelLe4QpPfPm1KuJuEN9h3aUpZlpVkFXgLhvTJ0pZYJruG
	8SErewj3RxGmYtextV3wS3PhvqG1IcY2m34OO53G7aSwAL/TsriteuG9GiXG4+EKJ7C9sFSYquX
	UM55kOfeAbq9TYEnFphTzJWPnAZiVHVfNbEBCuvJLm+gEWtejKQc6Vl3YMt+Mpf4FHgAWbLlJJs
	X4AdNiCPnCP9Gd//id5egSqhygynvoFJjZTpTR4JpffhV3O9OuRH259rftFtxsZTXHStRO0oy66
	gZJDEEkeVBIePEz1DWhvhdgrzxPbbcK8x9cBLcsigSYhYD3d2vTyBgiPYrreveUODeLOnB+O5qB
	R0F1uf+2ZjLeCU/S4ZAN+C1g3fyVHDrqnOp9ZKISyifDw4D1Uh8utvx+44WxjqSyzdE0je9+cE7
	R/OxCGid60P1clX66kE=
X-Received: by 2002:a05:6a20:7f9a:b0:3c3:64cc:c1fc with SMTP id adf61e73a8af0-3c92a99434cmr4132810637.73.1785606376416;
        Sat, 01 Aug 2026 10:46:16 -0700 (PDT)
Received: from localhost.localdomain ([2405:acc0:1306:9d5b:7865:f907:f2bf:8664])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e5b0sm17817768eec.1.2026.08.01.10.46.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 01 Aug 2026 10:46:16 -0700 (PDT)
From: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: validate WPS attribute lengths
Date: Sat,  1 Aug 2026 23:31:11 +0545
Message-ID: <20260801174611.49470-1-acharyalaxman8848@gmail.com>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_get_wps_attr() checks that the four-byte attribute header fits in the
WPS information element, but trusts the payload length from that header
when copying the attribute and advancing to the next one. A malformed
attribute can therefore make the driver read beyond a received management
frame. Storing the total attribute length in u16 also allows the addition
of the header size to wrap.

rtw_get_wps_attr_content() also copies the full payload without knowing
the destination size. Its callers copy the Selected Registrar attribute
into one-byte objects, so an oversized payload can overwrite the stack
even when the payload itself fits inside the information element.

Store the total attribute length in u32 and reject attributes extending
past the information element. Add destination lengths to the copy helpers
and reject attributes that do not fit before copying them.

Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 863ddf846..4889c7247 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -702,11 +702,13 @@ u8 *rtw_get_wps_ie(u8 *in_ie, uint in_len, u8 *wps_ie, uint *wps_ielen)
  * @wps_ielen: Length limit from wps_ie
  * @target_attr_id: The attribute ID of WPS attribute to search
  * @buf_attr: If not NULL and the WPS attribute is found, WPS attribute will be copied to the buf starting from buf_attr
+ * @buf_attr_len: Length of buf_attr
  * @len_attr: If not NULL and the WPS attribute is found, will set to the length of the entire WPS attribute
  *
  * Returns: the address of the specific WPS attribute found, or NULL
  */
-u8 *rtw_get_wps_attr(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_attr, u32 *len_attr)
+u8 *rtw_get_wps_attr(u8 *wps_ie, uint wps_ielen, u16 target_attr_id,
+		     u8 *buf_attr, u32 buf_attr_len, u32 *len_attr)
 {
 	u8 *attr_ptr = NULL;
 	u8 *target_attr_ptr = NULL;
@@ -732,13 +734,19 @@ u8 *rtw_get_wps_attr(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_att
 			break;
 		u16 attr_id = get_unaligned_be16(attr_ptr);
 		u16 attr_data_len = get_unaligned_be16(attr_ptr + 2);
-		u16 attr_len = attr_data_len + 4;
+		u32 attr_len = attr_data_len + 4;
+
+		if (attr_len > wps_ie + wps_ielen - attr_ptr)
+			break;
 
 		if (attr_id == target_attr_id) {
 			target_attr_ptr = attr_ptr;
 
-			if (buf_attr)
+			if (buf_attr) {
+				if (attr_len > buf_attr_len)
+					return NULL;
 				memcpy(buf_attr, attr_ptr, attr_len);
+			}
 
 			if (len_attr)
 				*len_attr = attr_len;
@@ -757,26 +765,35 @@ u8 *rtw_get_wps_attr(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_att
  * @wps_ielen: Length limit from wps_ie
  * @target_attr_id: The attribute ID of WPS attribute to search
  * @buf_content: If not NULL and the WPS attribute is found, WPS attribute content will be copied to the buf starting from buf_content
+ * @buf_content_len: Length of buf_content
  * @len_content: If not NULL and the WPS attribute is found, will set to the length of the WPS attribute content
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
+	u32 content_len;
 
 	if (len_content)
 		*len_content = 0;
 
-	attr_ptr = rtw_get_wps_attr(wps_ie, wps_ielen, target_attr_id, NULL, &attr_len);
+	attr_ptr = rtw_get_wps_attr(wps_ie, wps_ielen, target_attr_id, NULL, 0,
+				    &attr_len);
 
 	if (attr_ptr && attr_len) {
-		if (buf_content)
-			memcpy(buf_content, attr_ptr + 4, attr_len - 4);
+		content_len = attr_len - 4;
+		if (buf_content) {
+			if (content_len > buf_content_len)
+				return NULL;
+			memcpy(buf_content, attr_ptr + 4, content_len);
+		}
 
 		if (len_content)
-			*len_content = attr_len - 4;
+			*len_content = content_len;
 
 		return attr_ptr + 4;
 	}
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index a443b3530..ab620231c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -1113,7 +1113,11 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
 			if (pmlmepriv->wps_beacon_ie) {
 				u8 selected_registrar = 0;
 
-				rtw_get_wps_attr_content(pmlmepriv->wps_beacon_ie, pmlmepriv->wps_beacon_ie_len, WPS_ATTR_SELECTED_REGISTRAR, &selected_registrar, NULL);
+				rtw_get_wps_attr_content(pmlmepriv->wps_beacon_ie,
+							 pmlmepriv->wps_beacon_ie_len,
+							 WPS_ATTR_SELECTED_REGISTRAR,
+							 &selected_registrar,
+							 sizeof(selected_registrar), NULL);
 
 				if (!selected_registrar) {
 					status = WLAN_STATUS_AP_UNABLE_TO_HANDLE_NEW_STA;
@@ -2116,7 +2120,9 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 			wps_ie = rtw_get_wps_ie(pmgntframe->buf_addr+TXDESC_OFFSET+sizeof(struct ieee80211_hdr_3addr)+_BEACON_IE_OFFSET_,
 				pattrib->pktlen-sizeof(struct ieee80211_hdr_3addr)-_BEACON_IE_OFFSET_, NULL, &wps_ielen);
 			if (wps_ie && wps_ielen > 0)
-				rtw_get_wps_attr_content(wps_ie,  wps_ielen, WPS_ATTR_SELECTED_REGISTRAR, (u8 *)(&sr), NULL);
+				rtw_get_wps_attr_content(wps_ie, wps_ielen,
+							 WPS_ATTR_SELECTED_REGISTRAR,
+							 &sr, sizeof(sr), NULL);
 			if (sr != 0)
 				set_fwstate(pmlmepriv, WIFI_UNDER_WPS);
 			else
diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index 39ee139f1..114d73a91 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -735,8 +735,11 @@ int rtw_parse_wpa2_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher, int *pairwi
 void rtw_get_sec_ie(u8 *in_ie, uint in_len, u8 *rsn_ie, u16 *rsn_len, u8 *wpa_ie, u16 *wpa_len);
 
 u8 *rtw_get_wps_ie(u8 *in_ie, uint in_len, u8 *wps_ie, uint *wps_ielen);
-u8 *rtw_get_wps_attr(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_attr, u32 *len_attr);
-u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen, u16 target_attr_id, u8 *buf_content, uint *len_content);
+u8 *rtw_get_wps_attr(u8 *wps_ie, uint wps_ielen, u16 target_attr_id,
+		     u8 *buf_attr, u32 buf_attr_len, u32 *len_attr);
+u8 *rtw_get_wps_attr_content(u8 *wps_ie, uint wps_ielen, u16 target_attr_id,
+			     u8 *buf_content, uint buf_content_len,
+			     uint *len_content);
 
 /**
  * for_each_ie - iterate over continuous IEs
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 967cd1b34..60c27b4fd 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -251,7 +251,9 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
 		wpsie = rtw_get_wps_ie(pnetwork->network.ies + _FIXED_IE_LENGTH_, pnetwork->network.ie_length - _FIXED_IE_LENGTH_, NULL, &wpsielen);
 
 		if (wpsie && wpsielen > 0)
-			psr = rtw_get_wps_attr_content(wpsie, wpsielen, WPS_ATTR_SELECTED_REGISTRAR, (u8 *)(&sr), NULL);
+			psr = rtw_get_wps_attr_content(wpsie, wpsielen,
+						       WPS_ATTR_SELECTED_REGISTRAR,
+						       &sr, sizeof(sr), NULL);
 
 		if (sr != 0) {
 			/* it means under processing WPS */
-- 
2.51.2

