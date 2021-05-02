Received: from smtp.smtpout.orange.fr (smtp09.smtpout.orange.fr [80.12.242.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2523B71
	for <linux-staging@lists.linux.dev>; Sun,  2 May 2021 07:28:49 +0000 (UTC)
Received: from localhost.localdomain ([86.243.172.93])
	by mwinf5d84 with ME
	id zjMA2400F21Fzsu03jMAmL; Sun, 02 May 2021 09:21:11 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 02 May 2021 09:21:11 +0200
X-ME-IP: 86.243.172.93
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] staging: rtl8712: Fix some tests against some 'data' subtype frames
Date: Sun,  2 May 2021 09:21:08 +0200
Message-Id: <44aebfa3c5ce8f45ae05369c73e9ff77c6d271f9.1619939806.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.30.2
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 6e2baa44c6d1 ("staging: rtl8712: remove enum WIFI_FRAME_SUBTYPE")
was wrong because:
	WIFI_DATA_NULL != IEEE80211_STYPE_NULLFUNC
	WIFI_DATA_CFACK != IEEE80211_STYPE_DATA_CFACK
	WIFI_DATA_CFPOLL != IEEE80211_STYPE_DATA_CFPOLL
	WIFI_DATA_CFACKPOLL != IEEE80211_STYPE_DATA_CFACKPOLL

the WIFI_DATA_xxx definitions include WIFI_DATA_TYPE, which is 'BIT(3)'.
Restore the previous behavior by adding the missing
'IEEE80211_FTYPE_DATA |' (0x0008, that is to say BIT(3)) when these values
are used.

Hopefully, the wrong commit was small enough and hand review is possible.

Fixes: 6e2baa44c6d1 ("staging: rtl8712: remove enum WIFI_FRAME_SUBTYPE")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Apologies for the noise and for the wrong initial commit :(
---
 drivers/staging/rtl8712/rtl871x_recv.c     |  2 +-
 drivers/staging/rtl8712/rtl871x_security.c | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl871x_recv.c b/drivers/staging/rtl8712/rtl871x_recv.c
index db2add576418..c23f6b376111 100644
--- a/drivers/staging/rtl8712/rtl871x_recv.c
+++ b/drivers/staging/rtl8712/rtl871x_recv.c
@@ -374,7 +374,7 @@ static sint ap2sta_data_frame(struct _adapter *adapter,
 	if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) &&
 	    check_fwstate(pmlmepriv, _FW_LINKED)) {
 		/* if NULL-frame, drop packet */
-		if ((GetFrameSubType(ptr)) == IEEE80211_STYPE_NULLFUNC)
+		if ((GetFrameSubType(ptr)) == (IEEE80211_FTYPE_DATA | IEEE80211_STYPE_NULLFUNC))
 			return _FAIL;
 		/* drop QoS-SubType Data, including QoS NULL,
 		 * excluding QoS-Data
diff --git a/drivers/staging/rtl8712/rtl871x_security.c b/drivers/staging/rtl8712/rtl871x_security.c
index 63d63f7be481..e0a1c30a8fe6 100644
--- a/drivers/staging/rtl8712/rtl871x_security.c
+++ b/drivers/staging/rtl8712/rtl871x_security.c
@@ -1045,9 +1045,9 @@ static void aes_cipher(u8 *key, uint hdrlen,
 	else
 		a4_exists = 1;
 
-	if ((frtype == IEEE80211_STYPE_DATA_CFACK) ||
-	    (frtype == IEEE80211_STYPE_DATA_CFPOLL) ||
-	    (frtype == IEEE80211_STYPE_DATA_CFACKPOLL)) {
+	if ((frtype == (IEEE80211_FTYPE_DATA | IEEE80211_STYPE_DATA_CFACK)) ||
+	    (frtype == (IEEE80211_FTYPE_DATA | IEEE80211_STYPE_DATA_CFPOLL)) ||
+	    (frtype == (IEEE80211_FTYPE_DATA | IEEE80211_STYPE_DATA_CFACKPOLL))) {
 		qc_exists = 1;
 		if (hdrlen !=  WLAN_HDR_A3_QOS_LEN)
 			hdrlen += 2;
@@ -1225,9 +1225,9 @@ static void aes_decipher(u8 *key, uint hdrlen,
 		a4_exists = 0;
 	else
 		a4_exists = 1;
-	if ((frtype == IEEE80211_STYPE_DATA_CFACK) ||
-	    (frtype == IEEE80211_STYPE_DATA_CFPOLL) ||
-	    (frtype == IEEE80211_STYPE_DATA_CFACKPOLL)) {
+	if ((frtype == (IEEE80211_FTYPE_DATA | IEEE80211_STYPE_DATA_CFACK)) ||
+	    (frtype == (IEEE80211_FTYPE_DATA | IEEE80211_STYPE_DATA_CFPOLL)) ||
+	    (frtype == (IEEE80211_FTYPE_DATA | IEEE80211_STYPE_DATA_CFACKPOLL))) {
 		qc_exists = 1;
 		if (hdrlen != WLAN_HDR_A3_QOS_LEN)
 			hdrlen += 2;
-- 
2.30.2

