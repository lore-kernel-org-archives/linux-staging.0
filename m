Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20DA27702;
	Wed,  2 Nov 2022 20:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667422403; bh=ErI90by0HaqztfHJ1f4QhDxXIDPNR+OgRqtS9KaMhGY=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=Z+spEJBzMVi5xKT7d/GwOuRCDppU2VG8/klxJ3GlwSg6QNuK+Dx/tsUnv1wDwlDBz
	 ZxyoM1pKg3fwc1LCDN3r18jkY7dG2QY6HCHtQNZkEZPlhXyKhe+j7wtc7xrL3BhCrF
	 BfDQyAv1c7PDMvQj2e/1RUkP6iUg/ND7BVa9a0aY=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
	via [213.182.55.206]
	Wed,  2 Nov 2022 21:53:23 +0100 (CET)
X-EA-Auth: LajOJuXyvXTUK3TXRm9ZGJ+afNBNj9R0X2uGkBJY7ohaa+hZqXsqAMEV8G34qM/KM2uQ69ONy5JEI2kOjTS9Yr4+pu9o4qKv
Date: Thu, 3 Nov 2022 02:23:18 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev, Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: r8188eu: remove unused struct declarations
Message-ID: <Y2LYvhr74ng+xFbz@qemulion>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Some structures are only declared but have not been used anywhere
in the code. Remove such unused structs. Issue identified as part
of coccicheck report driven code investigation.


Suggested-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 drivers/staging/r8188eu/include/wlan_bssdef.h | 42 -------------------
 1 file changed, 42 deletions(-)

diff --git a/drivers/staging/r8188eu/include/wlan_bssdef.h b/drivers/staging/r8188eu/include/wlan_bssdef.h
index 831c465df500..ffeafa19ef26 100644
--- a/drivers/staging/r8188eu/include/wlan_bssdef.h
+++ b/drivers/staging/r8188eu/include/wlan_bssdef.h
@@ -177,20 +177,6 @@ struct ndis_802_11_status_ind {
 /*  MIC check time, 60 seconds. */
 #define MIC_CHECK_TIME	60000000

-struct ndis_802_11_auth_evt {
-	struct ndis_802_11_status_ind       Status;
-	struct ndis_802_11_auth_req  Request[1];
-};
-
-struct ndis_802_11_test {
-	u32 Length;
-	u32 Type;
-	union {
-		struct ndis_802_11_auth_evt AuthenticationEvent;
-		NDIS_802_11_RSSI RssiTrigger;
-	} tt;
-};
-
 #ifndef Ndis802_11APMode
 #define Ndis802_11APMode (Ndis802_11InfrastructureMax+1)
 #endif
@@ -279,34 +265,6 @@ enum UAPSD_MAX_SP {
 #define NUM_PRE_AUTH_KEY 16
 #define NUM_PMKID_CACHE NUM_PRE_AUTH_KEY

-/*
-*	WPA2
-*/
-
-struct pmkid_candidate {
-	unsigned char BSSID[ETH_ALEN];
-	u32 Flags;
-};
-
-struct ndis_802_11_pmkid_list {
-	u32 Version;       /*  Version of the structure */
-	u32 NumCandidates; /*  No. of pmkid candidates */
-	struct pmkid_candidate CandidateList[1];
-};
-
-struct ndis_802_11_auth_encrypt {
-	enum ndis_802_11_auth_mode AuthModeSupported;
-	enum ndis_802_11_wep_status EncryptStatusSupported;
-};
-
-struct ndis_802_11_cap {
-	u32  Length;
-	u32  Version;
-	u32  NoOfPMKIDs;
-	u32  NoOfAuthEncryptPairsSupported;
-	struct ndis_802_11_auth_encrypt AuthenticationEncryptionSupported[1];
-};
-
 u8 key_2char2num(u8 hch, u8 lch);
 u8 key_char2num(u8 ch);
 u8 str_2char2num(u8 hch, u8 lch);
--
2.34.1



