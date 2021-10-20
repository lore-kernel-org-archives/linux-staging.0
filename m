Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9265D2C95
	for <linux-staging@lists.linux.dev>; Wed, 20 Oct 2021 19:54:37 +0000 (UTC)
Received: from dslb-188-096-142-022.188.096.pools.vodafone-ip.de ([188.96.142.22] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1mdHfW-0007Cd-H6; Wed, 20 Oct 2021 21:54:34 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 4/5] staging: r8188eu: use helper to set broadcast address
Date: Wed, 20 Oct 2021 21:54:00 +0200
Message-Id: <20211020195401.12931-4-martin@kaiser.cx>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211020195401.12931-1-martin@kaiser.cx>
References: <20211020195401.12931-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The eth_broadcast_addr helper assigns the broadcast address to an address
array. Call this function instead of copying the address bytes manually.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c | 13 +++++--------
 drivers/staging/r8188eu/hal/rtl8188e_cmd.c  |  3 +--
 2 files changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index b0dfafe526f7..7b372374e638 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -3409,7 +3409,6 @@ static int _issue_probereq_p2p(struct adapter *padapter, u8 *da, int wait_ack)
 	unsigned char			*mac;
 	struct xmit_priv		*pxmitpriv = &padapter->xmitpriv;
 	struct mlme_ext_priv	*pmlmeext = &padapter->mlmeextpriv;
-	u8 bc_addr[] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
 	struct wifidirect_info	*pwdinfo = &padapter->wdinfo;
 	u8 wpsie[255] = { 0x00 }, p2pie[255] = { 0x00 };
 	u16 wpsielen = 0, p2pielen = 0;
@@ -3443,8 +3442,8 @@ static int _issue_probereq_p2p(struct adapter *padapter, u8 *da, int wait_ack)
 			memcpy(pwlanhdr->addr3, pwdinfo->p2p_peer_interface_addr, ETH_ALEN);
 		} else {
 			/*	broadcast probe request frame */
-			memcpy(pwlanhdr->addr1, bc_addr, ETH_ALEN);
-			memcpy(pwlanhdr->addr3, bc_addr, ETH_ALEN);
+			eth_broadcast_addr(pwlanhdr->addr1);
+			eth_broadcast_addr(pwlanhdr->addr3);
 		}
 	}
 	memcpy(pwlanhdr->addr2, mac, ETH_ALEN);
@@ -4311,7 +4310,6 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 	struct mlme_ext_priv	*pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info	*pmlmeinfo = &pmlmeext->mlmext_info;
 	struct wlan_bssid_ex		*cur_network = &pmlmeinfo->network;
-	u8	bc_addr[] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
 	struct wifidirect_info	*pwdinfo = &padapter->wdinfo;
 
 	pmgntframe = alloc_mgtxmitframe(pxmitpriv);
@@ -4334,7 +4332,7 @@ void issue_beacon(struct adapter *padapter, int timeout_ms)
 	fctrl = &pwlanhdr->frame_ctl;
 	*(fctrl) = 0;
 
-	memcpy(pwlanhdr->addr1, bc_addr, ETH_ALEN);
+	eth_broadcast_addr(pwlanhdr->addr1);
 	memcpy(pwlanhdr->addr2, myid(&padapter->eeprompriv), ETH_ALEN);
 	memcpy(pwlanhdr->addr3, get_my_bssid(cur_network), ETH_ALEN);
 
@@ -4676,7 +4674,6 @@ static int _issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *ps
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 	struct mlme_ext_priv	*pmlmeext = &padapter->mlmeextpriv;
 	int	bssrate_len = 0;
-	u8	bc_addr[] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
 
 	pmgntframe = alloc_mgtxmitframe(pxmitpriv);
 	if (!pmgntframe)
@@ -4702,8 +4699,8 @@ static int _issue_probereq(struct adapter *padapter, struct ndis_802_11_ssid *ps
 		memcpy(pwlanhdr->addr3, da, ETH_ALEN);
 	} else {
 		/*	broadcast probe request frame */
-		memcpy(pwlanhdr->addr1, bc_addr, ETH_ALEN);
-		memcpy(pwlanhdr->addr3, bc_addr, ETH_ALEN);
+		eth_broadcast_addr(pwlanhdr->addr1);
+		eth_broadcast_addr(pwlanhdr->addr3);
 	}
 
 	memcpy(pwlanhdr->addr2, mac, ETH_ALEN);
diff --git a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
index c5f9353fe3e6..14eed14a4c6a 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
@@ -226,14 +226,13 @@ static void ConstructBeacon(struct adapter *adapt, u8 *pframe, u32 *pLength)
 	struct mlme_ext_priv *pmlmeext = &adapt->mlmeextpriv;
 	struct mlme_ext_info	*pmlmeinfo = &pmlmeext->mlmext_info;
 	struct wlan_bssid_ex		*cur_network = &pmlmeinfo->network;
-	u8 bc_addr[] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
 
 	pwlanhdr = (struct rtw_ieee80211_hdr *)pframe;
 
 	fctrl = &pwlanhdr->frame_ctl;
 	*(fctrl) = 0;
 
-	memcpy(pwlanhdr->addr1, bc_addr, ETH_ALEN);
+	eth_broadcast_addr(pwlanhdr->addr1);
 	memcpy(pwlanhdr->addr2, myid(&adapt->eeprompriv), ETH_ALEN);
 	memcpy(pwlanhdr->addr3, get_my_bssid(cur_network), ETH_ALEN);
 
-- 
2.20.1

