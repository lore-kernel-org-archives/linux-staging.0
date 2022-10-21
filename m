Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1517E;
	Fri, 21 Oct 2022 10:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1666347993; bh=jtnn88d1QPB9a8mRoXuB6CbwtjfRDKBhxTxl4zKQrP4=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=BzSBsgDT30zjfP6R2EuL8b3gdFP1qhhaLHcg9y3wBZ1RI00OH20PakEIRb9aaenG9
	 b+YXEoHp73fySTRqo7g6v8ZXVUS44fHNFvMVh106p/EnSFMNR5p1y0XXHnCd+hTSyN
	 9m8cmUWbUMhndUOWtZhwzmMsyEx1vGrTzMLtffjA=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
	via [213.182.55.206]
	Fri, 21 Oct 2022 12:26:33 +0200 (CEST)
X-EA-Auth: ss8y4ZETy7tcx9vO1Ln/+anMDba5bVR/sOeL39Dc5YErY5yvGs3dC+r3TSE9Bu1xSeXNNRZevV6D0IOs05Fde6piBT6ZS1L1
Date: Fri, 21 Oct 2022 07:11:09 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: wlan-ng: remove commented debug printk messages
Message-ID: <Y1H4tc3DugR1yny0@debian-BULLSEYE-live-builder-AMD64>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

printk messages are added for program flow tracing and are left
commented. These commented log messages should be removed as they
are no more useful for program execution.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 drivers/staging/wlan-ng/p80211netdev.c | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/drivers/staging/wlan-ng/p80211netdev.c b/drivers/staging/wlan-ng/p80211netdev.c
index e04fc666d218..6bef419e8ad0 100644
--- a/drivers/staging/wlan-ng/p80211netdev.c
+++ b/drivers/staging/wlan-ng/p80211netdev.c
@@ -881,55 +881,42 @@ static int p80211_rx_typedrop(struct wlandevice *wlandev, u16 fc)
 		wlandev->rx.mgmt++;
 		switch (fstype) {
 		case WLAN_FSTYPE_ASSOCREQ:
-			/* printk("assocreq"); */
 			wlandev->rx.assocreq++;
 			break;
 		case WLAN_FSTYPE_ASSOCRESP:
-			/* printk("assocresp"); */
 			wlandev->rx.assocresp++;
 			break;
 		case WLAN_FSTYPE_REASSOCREQ:
-			/* printk("reassocreq"); */
 			wlandev->rx.reassocreq++;
 			break;
 		case WLAN_FSTYPE_REASSOCRESP:
-			/* printk("reassocresp"); */
 			wlandev->rx.reassocresp++;
 			break;
 		case WLAN_FSTYPE_PROBEREQ:
-			/* printk("probereq"); */
 			wlandev->rx.probereq++;
 			break;
 		case WLAN_FSTYPE_PROBERESP:
-			/* printk("proberesp"); */
 			wlandev->rx.proberesp++;
 			break;
 		case WLAN_FSTYPE_BEACON:
-			/* printk("beacon"); */
 			wlandev->rx.beacon++;
 			break;
 		case WLAN_FSTYPE_ATIM:
-			/* printk("atim"); */
 			wlandev->rx.atim++;
 			break;
 		case WLAN_FSTYPE_DISASSOC:
-			/* printk("disassoc"); */
 			wlandev->rx.disassoc++;
 			break;
 		case WLAN_FSTYPE_AUTHEN:
-			/* printk("authen"); */
 			wlandev->rx.authen++;
 			break;
 		case WLAN_FSTYPE_DEAUTHEN:
-			/* printk("deauthen"); */
 			wlandev->rx.deauthen++;
 			break;
 		default:
-			/* printk("unknown"); */
 			wlandev->rx.mgmt_unknown++;
 			break;
 		}
-		/* printk("\n"); */
 		drop = 2;
 		break;

@@ -943,35 +930,27 @@ static int p80211_rx_typedrop(struct wlandevice *wlandev, u16 fc)
 		wlandev->rx.ctl++;
 		switch (fstype) {
 		case WLAN_FSTYPE_PSPOLL:
-			/* printk("pspoll"); */
 			wlandev->rx.pspoll++;
 			break;
 		case WLAN_FSTYPE_RTS:
-			/* printk("rts"); */
 			wlandev->rx.rts++;
 			break;
 		case WLAN_FSTYPE_CTS:
-			/* printk("cts"); */
 			wlandev->rx.cts++;
 			break;
 		case WLAN_FSTYPE_ACK:
-			/* printk("ack"); */
 			wlandev->rx.ack++;
 			break;
 		case WLAN_FSTYPE_CFEND:
-			/* printk("cfend"); */
 			wlandev->rx.cfend++;
 			break;
 		case WLAN_FSTYPE_CFENDCFACK:
-			/* printk("cfendcfack"); */
 			wlandev->rx.cfendcfack++;
 			break;
 		default:
-			/* printk("unknown"); */
 			wlandev->rx.ctl_unknown++;
 			break;
 		}
-		/* printk("\n"); */
 		drop = 2;
 		break;

@@ -1007,7 +986,6 @@ static int p80211_rx_typedrop(struct wlandevice *wlandev, u16 fc)
 			wlandev->rx.cfack_cfpoll++;
 			break;
 		default:
-			/* printk("unknown"); */
 			wlandev->rx.data_unknown++;
 			break;
 		}
--
2.30.2



