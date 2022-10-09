Received: from valentin-vidic.from.hr (valentin-vidic.from.hr [109.200.23.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ADC82F56
	for <linux-staging@lists.linux.dev>; Sun,  9 Oct 2022 16:11:16 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at valentin-vidic.from.hr
Received: by valentin-vidic.from.hr (Postfix, from userid 1000)
	id 7407928E46; Sun,  9 Oct 2022 18:05:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=valentin-vidic.from.hr; s=2020; t=1665331538;
	bh=14Fx3Vttwfe4cUsybASXYvJK+oD3p3DL1tdWjsiEBsA=;
	h=From:To:Cc:Subject:Date:From;
	b=su76Hr/TGsBF8ye6H5EFzZ+H2y1PrFpXJBaryxva46WHLO3qFgYLcUvmktCwo/pWZ
	 7c0NFFgG9xEih18ZMCx4J1l8bsDnWk14rBd2t9M3PwprEN5Lg3mX88n6UQow1wHRgd
	 vK4Xx6MwI/DctM7/ROWdXlQfd1eCzNMCZ7ZsmWH2oklhNBJfVQ8FCgPfa1nJORjOCv
	 ELvAEiY5HPCTLDRXRMyGjnequgRpS8w/jB5g4KJHVPlCsoxHlzrnKwM6ZBitnwgG6i
	 UZPJ7pdEx0lW0puZaijGklVraMhSwqk1li7EZDQnGZPhpaXJ6+pOdF1te5+3FBmKTs
	 eeeLzYSzqLjTmY0XE8ZL9bZE/iCqv1Eoz12NRDrYy8t3nIY/4znYTiMSGMOptCH7AT
	 yk8TK/aEMaivMvQqhyVeQt9V6NPvvkTy70erX2WmXwt6x4TDSOs/S89pcsSxc0seUY
	 AyR/NJGk8BHRI2OiKIKTKgXJeS8WAbXuXoGqxPGmFU0Fcwu7b76Llg8YFSStRNKYH0
	 BygXoPObQCL0/gP8QIFbAc15jA9C62fwjreYkeReke7vz2AUKNoaOVvQpEIKfbBRjM
	 SPFhsjx3Xknwki4SHmYqE3m1VtMbMNxjG+2zMgbDOP6B9hkod9FD1scW+t3/5+v3Bd
	 QG8rCqtBlRu6+57VdYByT8D0=
From: Valentin Vidic <vvidic@valentin-vidic.from.hr>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Valentin Vidic <vvidic@valentin-vidic.from.hr>
Subject: [PATCH v2] staging: rtl8192e: cleanup if statements
Date: Sun,  9 Oct 2022 18:05:34 +0200
Message-Id: <20221009160534.922592-1-vvidic@valentin-vidic.from.hr>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch warnings for if statements in rtl_wx.c:

CHECK: Comparison to NULL could be written "!expr"
CHECK: Using comparison to true is error prone
CHECK: braces {} should be used on all arms of this statement
CHECK: Unbalanced braces around else statement
CHECK: Alignment should match open parenthesis

Signed-off-by: Valentin Vidic <vvidic@valentin-vidic.from.hr>
---
v2: rebase and update description

 drivers/staging/rtl8192e/rtl8192e/rtl_wx.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
index 4920cb49e381..d8c4326fece0 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_wx.c
@@ -313,7 +313,7 @@ static int _rtl92e_wx_get_range(struct net_device *dev,
 	/* ~130 Mb/s real (802.11n) */
 	range->throughput = 130 * 1000 * 1000;
 
-	if (priv->rf_set_sens != NULL)
+	if (priv->rf_set_sens)
 		/* signal level threshold range */
 		range->sensitivity = priv->max_sens;
 
@@ -395,7 +395,7 @@ static int _rtl92e_wx_set_scan(struct net_device *dev,
 	rt_state = priv->rtllib->rf_power_state;
 	if (!priv->up)
 		return -ENETDOWN;
-	if (priv->rtllib->LinkDetectInfo.bBusyTraffic == true)
+	if (priv->rtllib->LinkDetectInfo.bBusyTraffic)
 		return -EAGAIN;
 
 	if (wrqu->data.flags & IW_SCAN_THIS_ESSID) {
@@ -582,9 +582,9 @@ static int _rtl92e_wx_set_frag(struct net_device *dev,
 	if (priv->hw_radio_off)
 		return 0;
 
-	if (wrqu->frag.disabled)
+	if (wrqu->frag.disabled) {
 		priv->rtllib->fts = DEFAULT_FRAG_THRESHOLD;
-	else {
+	} else {
 		if (wrqu->frag.value < MIN_FRAG_THRESHOLD ||
 		    wrqu->frag.value > MAX_FRAG_THRESHOLD)
 			return -EINVAL;
@@ -821,7 +821,7 @@ static int _rtl92e_wx_get_sens(struct net_device *dev,
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 
-	if (priv->rf_set_sens == NULL)
+	if (!priv->rf_set_sens)
 		return -1; /* we have not this support for this radio */
 	wrqu->sens.value = priv->sens;
 	return 0;
@@ -839,7 +839,7 @@ static int _rtl92e_wx_set_sens(struct net_device *dev,
 		return 0;
 
 	mutex_lock(&priv->wx_mutex);
-	if (priv->rf_set_sens == NULL) {
+	if (!priv->rf_set_sens) {
 		err = -1; /* we have not this support for this radio */
 		goto exit;
 	}
@@ -882,7 +882,7 @@ static int _rtl92e_wx_set_encode_ext(struct net_device *dev,
 		u8 idx = 0, alg = 0, group = 0;
 
 		if ((encoding->flags & IW_ENCODE_DISABLED) ||
-		     ext->alg == IW_ENCODE_ALG_NONE) {
+		    ext->alg == IW_ENCODE_ALG_NONE) {
 			ieee->pairwise_key_type = ieee->group_key_type
 						= KEY_TYPE_NA;
 			rtl92e_cam_reset(dev);
@@ -919,7 +919,7 @@ static int _rtl92e_wx_set_encode_ext(struct net_device *dev,
 					 key, 0);
 		} else {
 			if ((ieee->pairwise_key_type == KEY_TYPE_CCMP) &&
-			     ieee->pHTInfo->bCurrentHTSupport)
+			    ieee->pHTInfo->bCurrentHTSupport)
 				rtl92e_writeb(dev, 0x173, 1);
 			rtl92e_set_key(dev, 4, idx, alg,
 				       (u8 *)ieee->ap_mac_addr, 0, key);
@@ -993,7 +993,7 @@ static int _rtl92e_wx_get_gen_ie(struct net_device *dev,
 	struct r8192_priv *priv = rtllib_priv(dev);
 	struct rtllib_device *ieee = priv->rtllib;
 
-	if (ieee->wpa_ie_len == 0 || ieee->wpa_ie == NULL) {
+	if (ieee->wpa_ie_len == 0 || !ieee->wpa_ie) {
 		data->data.length = 0;
 		return 0;
 	}
-- 
2.30.2

