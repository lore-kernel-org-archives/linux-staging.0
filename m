Received: from viti.kaiser.cx (viti.kaiser.cx [85.214.81.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0A62F46
	for <linux-staging@lists.linux.dev>; Wed, 30 Mar 2022 20:56:26 +0000 (UTC)
Received: from dslb-178-004-172-185.178.004.pools.vodafone-ip.de ([178.4.172.185] helo=martin-debian-2.paytec.ch)
	by viti.kaiser.cx with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89)
	(envelope-from <martin@kaiser.cx>)
	id 1nZefy-0007FS-Jc; Wed, 30 Mar 2022 22:12:18 +0200
From: Martin Kaiser <martin@kaiser.cx>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Martin Kaiser <martin@kaiser.cx>
Subject: [PATCH 1/2] staging: r8188eu: remove the "dump rx packet" fragments
Date: Wed, 30 Mar 2022 22:12:09 +0200
Message-Id: <20220330201210.175941-2-martin@kaiser.cx>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220330201210.175941-1-martin@kaiser.cx>
References: <20220330201210.175941-1-martin@kaiser.cx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the code fragments for printing incoming packets. There's only a
hal variable HAL_DEF_DBG_DUMP_RXPKT and the bDumpRxPkt component of
struct hal_data_8188e.

The hal variable is set by a private ioctl, it's read in
validate_recv_frame but it's not used.

All of this can be removed, there's no code to dump the packets.

Signed-off-by: Martin Kaiser <martin@kaiser.cx>
---
 drivers/staging/r8188eu/core/rtw_recv.c        | 4 ----
 drivers/staging/r8188eu/hal/usb_halinit.c      | 6 ------
 drivers/staging/r8188eu/include/hal_intf.h     | 1 -
 drivers/staging/r8188eu/include/rtl8188e_hal.h | 1 -
 drivers/staging/r8188eu/os_dep/ioctl_linux.c   | 5 +----
 5 files changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 62cf2df90073..476bd4f22528 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -1060,7 +1060,6 @@ static int validate_recv_frame(struct adapter *adapter, struct recv_frame *precv
 	/* then call check if rx seq/frag. duplicated. */
 
 	int retval = _FAIL;
-	u8 bDumpRxPkt;
 	struct rx_pkt_attrib *pattrib = &precv_frame->attrib;
 	u8 *ptr = precv_frame->rx_data;
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)precv_frame->rx_data;
@@ -1086,9 +1085,6 @@ static int validate_recv_frame(struct adapter *adapter, struct recv_frame *precv
 	pattrib->privacy = ieee80211_has_protected(hdr->frame_control);
 	pattrib->order = ieee80211_has_order(hdr->frame_control);
 
-	/* Dump rx packets */
-	GetHalDefVar8188EUsb(adapter, HAL_DEF_DBG_DUMP_RXPKT, &bDumpRxPkt);
-
 	/* We return _SUCCESS only for data frames. */
 	if (ieee80211_is_mgmt(hdr->frame_control))
 		validate_recv_mgnt_frame(adapter, precv_frame);
diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index 789ad11170b2..0b6bf84acff6 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1401,9 +1401,6 @@ void GetHalDefVar8188EUsb(struct adapter *Adapter, enum hal_def_variable eVariab
 	case HAL_DEF_DBG_DM_FUNC:
 		*((u32 *)pValue) = haldata->odmpriv.SupportAbility;
 		break;
-	case HAL_DEF_DBG_DUMP_RXPKT:
-		*((u8 *)pValue) = haldata->bDumpRxPkt;
-		break;
 	case HAL_DEF_DBG_DUMP_TXPKT:
 		*((u8 *)pValue) = haldata->bDumpTxPkt;
 		break;
@@ -1436,9 +1433,6 @@ void SetHalDefVar8188EUsb(struct adapter *Adapter, enum hal_def_variable eVariab
 			}
 		}
 		break;
-	case HAL_DEF_DBG_DUMP_RXPKT:
-		haldata->bDumpRxPkt = *((u8 *)pValue);
-		break;
 	case HAL_DEF_DBG_DUMP_TXPKT:
 		haldata->bDumpTxPkt = *((u8 *)pValue);
 		break;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 6f661c4af358..8ecb49c4f038 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -45,7 +45,6 @@ enum hw_variables {
 enum hal_def_variable {
 	HAL_DEF_IS_SUPPORT_ANT_DIV,
 	HAL_DEF_CURRENT_ANTENNA,
-	HAL_DEF_DBG_DUMP_RXPKT,/* for dbg */
 	HAL_DEF_DBG_DM_FUNC,/* for dbg */
 	HAL_DEF_DBG_DUMP_TXPKT,
 };
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index 82cb4f7f4d3e..5bda353b6a41 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -160,7 +160,6 @@ struct hal_data_8188e {
 	u8	AntDivCfg;
 	u8	TRxAntDivType;
 
-	u8	bDumpRxPkt;/* for debug */
 	u8	bDumpTxPkt;/* for debug */
 
 	u8	OutEpQueueSel;
diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index eb9375b0c660..a45d60a7c19b 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -3633,11 +3633,8 @@ static int rtw_dbg_port(struct net_device *dev,
 		case 0x09:
 			break;
 		case 0x0c:/* dump rx/tx packet */
-			if (arg == 0) {
-				SetHalDefVar8188EUsb(padapter, HAL_DEF_DBG_DUMP_RXPKT, &extra_arg);
-			} else if (arg == 1) {
+			if (arg == 1)
 				SetHalDefVar8188EUsb(padapter, HAL_DEF_DBG_DUMP_TXPKT, &extra_arg);
-			}
 			break;
 		case 0x15:
 			break;
-- 
2.30.2

