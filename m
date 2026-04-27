Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC5F3E5ED7
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 17:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777311549; cv=none; b=ffsMJdr+sO0qTQ2EhC9axfwq21NWBQl7bv8C6yYw0J8Ifhi84reVL+md484yQhBMfQbLl4OZAAUWcDznoXw9fS8Kva9PchYa0oIAdL3WSxlHB9PJosVVpWofLaLSov0wIOfnePm2VBhY8gGv/MnzUvuSVSg7PE5wJGHRpXb16Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777311549; c=relaxed/simple;
	bh=aKQf0carPNlE9jqBhyaHXAMVdq2Gz3BTRIssUPzYbqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ObuP0KvmVNiijgaAv4CAolOUISBjexGxvIIpzFDq/oU4y0S9Rd2GBCol6p3BM745mjCWujMalElHcmzPbzx0mVrHlfYBNlc4HHbKGJiIw7XkmTv1uS1FShQIyBgIpb+uiVBqD5e8oxnnUSuyxOgQt+CEWYuqeSl3wsgV1nH7d5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dnue4SrG; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dnue4SrG"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5a40cfab24dso10784603e87.2
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 10:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777311546; x=1777916346; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGlTvYEbatgd6qXrb1rPCWc3hUqWdKosIs008gR6Etk=;
        b=Dnue4SrGDS1bu+f1Z1u569srk1JCBl7pz/di9YYHIOO6RbraLpnSzKPiaCm01JhF/G
         HGqPaX/+kSCaylXWTNateVpRPvWWXqeVPTRNaGUCJ4tyNirs5GpsSdKxv78DA7mm0Q9L
         TuOO3K4Jf/iCrmXwdhxFumAZg0IMPRqYlPI9JNomRktABsOMYzMZUsSddahabdOBQ0yf
         ns4+rbknnKeeKQv2v4OIBFHnDgeG8g9AO4ZeKBoIBCkS76kPpd6iGHgZb1XorBpGtmSr
         kigx/RH9rVMkmpbOy/ukVOJ8ocop8sr+fZVzRuCi2lkXKBqarI4Z2Pti2UxfLeUc28SH
         FIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311546; x=1777916346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MGlTvYEbatgd6qXrb1rPCWc3hUqWdKosIs008gR6Etk=;
        b=crJfOM72bE3LkxHR4Zwebq71wPJKbrfY3CTDxkjOvFbXKXKwPYWSdOZtu1p69USPUe
         cb/Q1sfj4al4gLhhiFTVRmxMIiMiufDYSBxS4SwbmO1JQtr99wSOsKYQGeEFJQvRvCnh
         eOyXcm+NPDo3g2mYiWABG5KivOJSoQ693VtVXLLj3xqwVcCefLLgzxhbUQLFPpyT2Dcb
         oNufbZqKpGyRbldBzovJZLV129pxYEes8HScbTh+qDFZChwn8LqvQpqSDYyYO6hsg6Ua
         IZWo6Epk/UU+PtOVp1R04lX62+oZ/OvSKcp3zUlZ8y8qK2lKcXaX+l85eLyX5e/vqKnm
         vp7g==
X-Gm-Message-State: AOJu0YzCLu79MEjWDpOsYSYidYhMsvbCTbdPptVcrV5mNfYbp60nRi0a
	4Z1hBr3hIk/zzsRb3l3Vdes+e6+t9aixtyGu5EovG9+UkKIOeRbCN1/NBe6zdACvhpU=
X-Gm-Gg: AeBDiet3Can5H4z5rfGj7rP2I59NuR5InYPz/V8an4QnoLY767MTvK183E9qw/LSJUD
	d/kmo6Q0+AfgZ/lbJTTdgAXyCPdkfyTiX5OjMETQ6h7RLwH4/sy/3Uwho9PSBN6mDavTsa+kbrb
	uAbKwwpQyCxj2f8SYLQfgtQhsdK4G0LCPXyamUywwqkIW9Qz4PRNDYbn34ipQvWAFU/ycMlH/0K
	JVhnCr8cKrac5D7EXK+SYiMp1bN3Xy722jeipPtsN1qLmSROayz2cgVkOkPl7inuigzS/mDGwLt
	LbK6luzqdEblfXyzWbXl/T9PQzm45lhqykHCdsFy+HXzzXgtVIVj8HuXqXC04RYKYkSBSYC1hDL
	0Z9LdLU6qje+HN0IJGK8neIrtS3K3NS9peMW/3fEPMvSaw7zgN3xyCaHIwDA5EAbUuC02nwkUne
	JuBPlSw0kiWcC6PwSlCsG8SQQ/ImPNjx94dZMQwTq66OjlSngFtHqoU3l0gMT7qAVz/nBIJrP3U
	3C3SDifqC4=
X-Received: by 2002:a05:6512:3b25:b0:5a3:fe60:471c with SMTP id 2adb3069b0e04-5a745e3b576mr87585e87.16.1777311545810;
        Mon, 27 Apr 2026 10:39:05 -0700 (PDT)
Received: from localhost (c188-150-77-196.bredband.tele2.se. [188.150.77.196])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a6335ce587sm3777487e87.70.2026.04.27.10.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:39:05 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH 3/8] staging: rtl8723bs: rename rtw_btcoex_MediaStatusNotify()
Date: Mon, 27 Apr 2026 19:38:52 +0200
Message-ID: <20260427173857.585742-4-linus.probert@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427173857.585742-1-linus.probert@gmail.com>
References: <20260427173857.585742-1-linus.probert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Renames function rtw_btcoex_MediaStatusNotify to
rtw_btcoex_media_status_notify which removes CamelCase in order to
conform to kernel code style.

Issue found using checkpatch.pl

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c        | 2 +-
 drivers/staging/rtl8723bs/core/rtw_btcoex.c    | 2 +-
 drivers/staging/rtl8723bs/core/rtw_cmd.c       | 4 ++--
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c  | 2 +-
 drivers/staging/rtl8723bs/include/rtw_btcoex.h | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 4b4012411011..5c325626f291 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -2105,5 +2105,5 @@ void stop_ap_mode(struct adapter *padapter)
 
 	rtw_free_mlme_priv_ie_data(pmlmepriv);
 
-	rtw_btcoex_MediaStatusNotify(padapter, 0); /* disconnect */
+	rtw_btcoex_media_status_notify(padapter, 0); /* disconnect */
 }
diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
index 0191a943f0a4..961c034ef719 100644
--- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
+++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
@@ -8,7 +8,7 @@
 #include <rtw_btcoex.h>
 #include <hal_btcoex.h>
 
-void rtw_btcoex_MediaStatusNotify(struct adapter *padapter, u8 media_status)
+void rtw_btcoex_media_status_notify(struct adapter *padapter, u8 media_status)
 {
 	if ((media_status == RT_MEDIA_CONNECT)
 		&& (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) == true)) {
diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index c1185c25ed36..14d4d4276dac 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1291,11 +1291,11 @@ void lps_ctrl_wk_hdl(struct adapter *padapter, u8 lps_ctrl_type)
 		/*  Reset LPS Setting */
 		pwrpriv->LpsIdleCount = 0;
 		rtw_hal_set_hwreg(padapter, HW_VAR_H2C_FW_JOINBSSRPT, (u8 *)(&mstatus));
-		rtw_btcoex_MediaStatusNotify(padapter, mstatus);
+		rtw_btcoex_media_status_notify(padapter, mstatus);
 		break;
 	case LPS_CTRL_DISCONNECT:
 		mstatus = 0;/* disconnect */
-		rtw_btcoex_MediaStatusNotify(padapter, mstatus);
+		rtw_btcoex_media_status_notify(padapter, mstatus);
 		LPS_Leave(padapter, "LPS_CTRL_DISCONNECT");
 		rtw_hal_set_hwreg(padapter, HW_VAR_H2C_FW_JOINBSSRPT, (u8 *)(&mstatus));
 		break;
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 5f00fe282d1b..3f087ea94b7e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -5191,7 +5191,7 @@ u8 setopmode_hdl(struct adapter *padapter, u8 *pbuf)
 	if (psetop->mode == Ndis802_11APMode) {
 		/*  Do this after port switch to */
 		/*  prevent from downloading rsvd page to wrong port */
-		rtw_btcoex_MediaStatusNotify(padapter, 1); /* connect */
+		rtw_btcoex_media_status_notify(padapter, 1); /* connect */
 	}
 
 	return H2C_SUCCESS;
diff --git a/drivers/staging/rtl8723bs/include/rtw_btcoex.h b/drivers/staging/rtl8723bs/include/rtw_btcoex.h
index df939b20867b..524f0fba294d 100644
--- a/drivers/staging/rtl8723bs/include/rtw_btcoex.h
+++ b/drivers/staging/rtl8723bs/include/rtw_btcoex.h
@@ -14,7 +14,7 @@
 #define	PACKET_ARP				2
 #define	PACKET_EAPOL			3
 
-void rtw_btcoex_MediaStatusNotify(struct adapter *padapter, u8 mediaStatus);
+void rtw_btcoex_media_status_notify(struct adapter *padapter, u8 mediaStatus);
 void rtw_btcoex_HaltNotify(struct adapter *padapter);
 
 /*  ================================================== */
-- 
2.54.0

