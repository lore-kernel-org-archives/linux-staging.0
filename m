Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558A838DC7E
	for <linux-staging@lists.linux.dev>; Thu,  3 Sep 2026 05:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788412770; cv=none; b=pBH0G7rkD8TOxTNMRqUF7AFxe6PdFJfugVO/LN/s0Mm8SPIu+saWpe816uskqzYLniaLfZw731yrgsgVlihbNR5BAtPoumgvAfE88vBgrwwKIOdtaUIYB5GLCn9w56mAeJ046VZpCHgk2kwvIFBivzUbhVerRHSMGn5HCufLrW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788412770; c=relaxed/simple;
	bh=4fnFeD02M5HfgMYn//yImWUpNyf2Ei+TU+3WniEA/Y4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mqFbbm3Ek8Vty3cDYSeUuzm9N2WYmqVglXUUzXns8qdiXktFqlrsRaS76EgROO94HoZhh7eoC0RW2mUYLw4I1zTycr+8OXaiZeVbr8YmONEQackfKB92qEbhf2DwgosHa6+IZ5P1zmTicg0riupPpklfqFg1W0xOOfv6+r93a9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QEtJmOjG; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QEtJmOjG"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-5c2c0df0b45so969254e0c.1
        for <linux-staging@lists.linux.dev>; Wed, 02 Sep 2026 22:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788412768; x=1789017568; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K0A05RaYRO4PF8ANfwcARnh+mky0gIQFxc21ypB2pb0=;
        b=QEtJmOjGt1drcqmXir3d0U0T5KylDwvLNMlUOWoVqaugsiF4xH+1Rf9NsjndqMOM+Q
         bPNaHjsAEchJwBmBjp8i5r+K9Ete9D00/kcYu35kJiRUo11xaxO2jcWp/jDkeHWQGeip
         9MWuitiIPmEDWEoDeOOhJHnc17Z+QwmB85fKQHOrW8nm+BQyfkf1RS+qHOiuvGkrthIN
         7f3jVSVJtcYLB3wLAysZy820JXbe6GwO0VyeLJNuzehf+CinkL+12t7KLUgoyQGheWZV
         mxn1bwf10O+/Cm9+hC+qybBQ4dxwYLz7bDiL/X5qEanlyLd7zcKTi850/4SER999NHW7
         QlrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788412768; x=1789017568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K0A05RaYRO4PF8ANfwcARnh+mky0gIQFxc21ypB2pb0=;
        b=FaffIh8wmoNEOtYRcLkSvMxtWulYdrs2r39IMl2CsZDBnjUHihYiruvy5NWJtb4MUA
         bu0cnmtd+QohDBWOBnGOxNnimdZE8ngMFYtXJeXHM5LusEyyM8psFEm0rO4Tgl6Cg1K9
         75NsY1eFZfhA4LqIG/QDEtP4fRms1qSOBuWM8Gx8NYPNxIK4f/4UEXHIDsn5SjL2YJ9X
         JhZRtnCMhdvpShDvSx2J12qKcszGnxozeueTeje9LOMO73iD+I8tp8+rOZudiWVRxCGN
         sz5VukneYtShC+sVO49TdlDtxpoIndiThSZY/8axMUIauKI6xX2wpJGfzHKVt7EigWAC
         CQIw==
X-Gm-Message-State: AFuF++lKs7FAehvDwjpKU7uUcOq8I2f9yYLnteJCZwJl1d2Lg4BQyCcy
	8XjIS7JwGyH9CpwEEtn8YngTEydwxzRCKoARchR5icame7L4dPFtKDng
X-Gm-Gg: AYBFou3Ko9FA8TCrdz+CDOPzoycM2qR2AwBTkYOW3YVQm/pjwhvbyBdLW732t7Cfh8i
	5IWZ/O2/sW4o4HRGJ1pDT7eMQtmaUMnOyIPMcn5k9wsLSHZ7farSF4/D9aeOlZTKXfjILxyL52G
	k1/LXQwDJAWwlKCBWCIcpP17U8JKAyRAvBvcEQylV4eHKAkWr5o01vky7u1ocTKUmz5brUa1kD+
	Mi90a/uPNv9RBEuFQKxdBzLT0bEAb0iJqzsPqM/YOxIZW+1bcIy5YZqIEhOCa8fO5479nKvdl7M
	baugnvN2d2cDPkQuNc00K12ZosF5lLvfX47RIvhEvQBEs9fNC2apRNnTDMJtNn/qkfY5P4IYn4a
	pjL8nEfIHkMUa7LyYGClQmisfDyZzM2X5vsoAHRmRNuqBx/68Y08jy5TdXRTKuAJv+buf5HPuhL
	bJl0d/8bBLA7x25QjaDX9VIT+7R9Scjsw2viiX7PL0+4um+0nkWcg//LPUSOmMBEfR
X-Received: by 2002:a05:6122:2203:b0:5bf:8955:a8ce with SMTP id 71dfb90a1353d-5c7d27126a5mr3731041e0c.1.1788412768165;
        Wed, 02 Sep 2026 22:19:28 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14d:9ea1:8718:4ce2:18a3:3335:cf81])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7cd8ce88dsm3618080e0c.9.2026.09.02.22.19.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 22:19:27 -0700 (PDT)
From: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
Date: Thu, 03 Sep 2026 02:18:10 -0300
Subject: [PATCH 4/4] staging: rtl8723bs: coalesce issue_probereq functions
 into a single one
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-issue_probereq-v1-4-82f153d157a1@gmail.com>
References: <20260903-issue_probereq-v1-0-82f153d157a1@gmail.com>
In-Reply-To: <20260903-issue_probereq-v1-0-82f153d157a1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Leonardo Martins Martins <dev.lmmrtns@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788412751; l=5798;
 i=dev.lmmrtns@gmail.com; s=20260813; h=from:subject:message-id;
 bh=4fnFeD02M5HfgMYn//yImWUpNyf2Ei+TU+3WniEA/Y4=;
 b=dFA0+EK1K+k2B8Rzv+AeX7/gx8ybHAIJcTji8yNN0g6jIj9xkUfvyCRp4vpCW7s9ZCg8msWhR
 em/bEqwMcNFDu5cKu/voAVbAM1Bm1PyPIzmXRNcNFHuJOyemFq2Go1/
X-Developer-Key: i=dev.lmmrtns@gmail.com; a=ed25519;
 pk=dOFSCpUL7hbyVftAaUGDebsgsSl9Uk/Tx0Aqpd4Bcng=

The function _issue_probereq() and its wrappers issue_probereq() and
issue_probereq_ex() have a difference of a single parameter in how
they're called, which is the value of append_wps - 0 for
issue_probereq_ex() and 1 for issue_probereq() -  meaning that these
wrappers don't bring much value, remove both of them, rename
_issue_probereq() to issue_probereq(), and replace the usages of the
wrappers with the unified function (with the value of append_wps added,
with true and false instead of 1 and 0 since it's a bool).

issue_probereq() and issue_probereq_ex() are not used in any other file
so the unified function was not added to the header file and kept the
static type.

Signed-off-by: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 54 +++++++++++-------------
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h |  2 -
 2 files changed, 25 insertions(+), 31 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index b3642c5021a230bd70e5d8fd8d5bf77ad1d8946a..c39fb142302edf267edca31babce40120c74451e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -2401,8 +2401,8 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 	dump_mgntframe(padapter, pmgntframe);
 }
 
-static void _issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da,
-			    bool append_wps)
+static void issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da,
+			   bool append_wps)
 {
 	struct xmit_frame		*pmgntframe;
 	struct pkt_attrib		*pattrib;
@@ -2481,16 +2481,6 @@ static void _issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *p
 	dump_mgntframe(padapter, pmgntframe);
 }
 
-inline void issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da)
-{
-	_issue_probereq(padapter, pssid, da, 1);
-}
-
-void issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da)
-{
-	_issue_probereq(padapter, pssid, da, 0);
-}
-
 /*  if psta == NULL, indicate we are station(client) now... */
 void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short status)
 {
@@ -3727,22 +3717,25 @@ void site_survey(struct adapter *padapter)
 
 					/* IOT issue, When wifi_spec is not set, send one probe req without WPS IE. */
 					if (padapter->registrypriv.wifi_spec)
-						issue_probereq(padapter, &(pmlmeext->sitesurvey_res.ssid[i]), NULL);
+						issue_probereq(padapter,
+							       &pmlmeext->sitesurvey_res.ssid[i],
+							       NULL, true);
 					else
-						issue_probereq_ex(padapter,
-								  &pmlmeext->sitesurvey_res.ssid[i],
-								  NULL);
+						issue_probereq(padapter,
+							       &pmlmeext->sitesurvey_res.ssid[i],
+							       NULL, false);
 
-					issue_probereq(padapter, &(pmlmeext->sitesurvey_res.ssid[i]), NULL);
+					issue_probereq(padapter, &pmlmeext->sitesurvey_res.ssid[i],
+						       NULL, true);
 				}
 
 				if (pmlmeext->sitesurvey_res.scan_mode == SCAN_ACTIVE) {
 					/* IOT issue, When wifi_spec is not set, send one probe req without WPS IE. */
 					if (padapter->registrypriv.wifi_spec)
-						issue_probereq(padapter, NULL, NULL);
+						issue_probereq(padapter, NULL, NULL, true);
 					else
-						issue_probereq_ex(padapter, NULL, NULL);
-					issue_probereq(padapter, NULL, NULL);
+						issue_probereq(padapter, NULL, NULL, false);
+					issue_probereq(padapter, NULL, NULL, true);
 				}
 			}
 		}
@@ -4860,15 +4853,18 @@ void linked_status_chk(struct adapter *padapter)
 			{
 				if (rx_chk != _SUCCESS) {
 					if (pmlmeext->retry == 0) {
-						issue_probereq_ex(padapter,
-								  &pmlmeinfo->network.ssid,
-								  pmlmeinfo->network.mac_address);
-						issue_probereq_ex(padapter,
-								  &pmlmeinfo->network.ssid,
-								  pmlmeinfo->network.mac_address);
-						issue_probereq_ex(padapter,
-								  &pmlmeinfo->network.ssid,
-								  pmlmeinfo->network.mac_address);
+						issue_probereq(padapter,
+							       &pmlmeinfo->network.ssid,
+							       pmlmeinfo->network.mac_address,
+							       false);
+						issue_probereq(padapter,
+							       &pmlmeinfo->network.ssid,
+							       pmlmeinfo->network.mac_address,
+							       false);
+						issue_probereq(padapter,
+							       &pmlmeinfo->network.ssid,
+							       pmlmeinfo->network.mac_address,
+							       false);
 					}
 				}
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 8e35aabb0ccf96a2bb0c1208db8ad74598a687e0..d486cd462509e9d43d43a7d6718a3bb3935df52d 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -541,8 +541,6 @@ void issue_probersp(struct adapter *padapter, unsigned char *da, u8 is_valid_p2p
 void issue_assocreq(struct adapter *padapter);
 void issue_asocrsp(struct adapter *padapter, unsigned short status, struct sta_info *pstat, int pkt_type);
 void issue_auth(struct adapter *padapter, struct sta_info *psta, unsigned short status);
-void issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da);
-void issue_probereq_ex(struct adapter *padapter, struct ndis_802_11_ssid *pssid, u8 *da);
 int issue_nulldata(struct adapter *padapter, unsigned char *da, unsigned int power_mode, int try_cnt, int wait_ms);
 s32 issue_nulldata_in_interrupt(struct adapter *padapter, u8 *da);
 int issue_qos_nulldata(struct adapter *padapter, unsigned char *da, u16 tid, int try_cnt, int wait_ms);

-- 
2.47.3

