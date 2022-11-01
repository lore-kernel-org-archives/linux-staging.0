Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3328C7C;
	Tue,  1 Nov 2022 13:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667310617; bh=XmP1+R7p/DnWE5QzKvv5uzhyseayhrVNsX9HWBGsGr8=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=VExi3kuq/HmPb0/aDWSXNQOY7ISbyBbW5d+yK/DcBRJJbrcicNKbfVEnpQcDo9LWC
	 OKD6Pn7tR1b5UM93MgwQH4p9YDr8/vkFxYSY3joD3Gp8io459DD5XSsisSzy9d1hp/
	 Uaf+yt33pz5i2snxiBKpsRjMBPnA6wS1tGQu/PZw=
Received: by b-6.in.mailobj.net [192.168.90.16] with ESMTP
	via [213.182.55.206]
	Tue,  1 Nov 2022 14:50:17 +0100 (CET)
X-EA-Auth: gOpbJ+yZ/65L/9kxRhFEwwz17m1XTt5yz03Fd6XsbTcl10l1/WuCWkGYjjQ3rWczKNL8G2kBfpJrudGWB+4lLwoE5KQGl5/e
Date: Tue, 1 Nov 2022 19:20:13 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/7] staging: wlan-ng: Remove unused function declarations
Message-ID: <09e2af8d702e33c15ed9f655b0a1190b4e8bec86.1667308828.git.drv@mailo.com>
References: <cover.1667308828.git.drv@mailo.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1667308828.git.drv@mailo.com>

Several functions are declared but are not implemented or used in any
part of the code. Remove such unimplemented function declarations.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
Changes in v2:
   1. Patch included in patch set.
   2. The patch changes are compile tested only on X86 arch.


 drivers/staging/wlan-ng/p80211mgmt.h | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/drivers/staging/wlan-ng/p80211mgmt.h b/drivers/staging/wlan-ng/p80211mgmt.h
index 816b25641f5a..da824bc36365 100644
--- a/drivers/staging/wlan-ng/p80211mgmt.h
+++ b/drivers/staging/wlan-ng/p80211mgmt.h
@@ -449,26 +449,4 @@ struct wlan_fr_deauthen {
 	/*-- info elements ----------*/

 };
-
-void wlan_mgmt_encode_beacon(struct wlan_fr_beacon *f);
-void wlan_mgmt_decode_beacon(struct wlan_fr_beacon *f);
-void wlan_mgmt_encode_disassoc(struct wlan_fr_disassoc *f);
-void wlan_mgmt_decode_disassoc(struct wlan_fr_disassoc *f);
-void wlan_mgmt_encode_assocreq(struct wlan_fr_assocreq *f);
-void wlan_mgmt_decode_assocreq(struct wlan_fr_assocreq *f);
-void wlan_mgmt_encode_assocresp(struct wlan_fr_assocresp *f);
-void wlan_mgmt_decode_assocresp(struct wlan_fr_assocresp *f);
-void wlan_mgmt_encode_reassocreq(struct wlan_fr_reassocreq *f);
-void wlan_mgmt_decode_reassocreq(struct wlan_fr_reassocreq *f);
-void wlan_mgmt_encode_reassocresp(struct wlan_fr_reassocresp *f);
-void wlan_mgmt_decode_reassocresp(struct wlan_fr_reassocresp *f);
-void wlan_mgmt_encode_probereq(struct wlan_fr_probereq *f);
-void wlan_mgmt_decode_probereq(struct wlan_fr_probereq *f);
-void wlan_mgmt_encode_proberesp(struct wlan_fr_proberesp *f);
-void wlan_mgmt_decode_proberesp(struct wlan_fr_proberesp *f);
-void wlan_mgmt_encode_authen(struct wlan_fr_authen *f);
-void wlan_mgmt_decode_authen(struct wlan_fr_authen *f);
-void wlan_mgmt_encode_deauthen(struct wlan_fr_deauthen *f);
-void wlan_mgmt_decode_deauthen(struct wlan_fr_deauthen *f);
-
 #endif /* _P80211MGMT_H */
--
2.34.1



