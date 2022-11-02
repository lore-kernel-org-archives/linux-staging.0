Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02523363;
	Wed,  2 Nov 2022 22:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667428623; bh=Jh9hVKlG9E8M6+Hg4/uFDmdMr+5rCinh9+KF12rxCMs=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:MIME-Version:
	 Content-Type;
	b=eLa3HMC9o56WEYZq2SgqNyfJWWMf14vSK+J+8Kjo/Wz4Z9/jOClxEgzxzq4VSyik9
	 yQAZGFrNuIQTvtblfxcgbc1kj8dt97CffGv8a3yBmVKLuT0w7bkCxxwzmmq8g5oatW
	 xhEm4Xgo1HYeDvNL3ZxA2G1vE2+ROoZueYOczGe0=
Received: by b-5.in.mailobj.net [192.168.90.15] with ESMTP
	via [213.182.55.206]
	Wed,  2 Nov 2022 23:37:03 +0100 (CET)
X-EA-Auth: w+3zi4nkHeGs1aO9AAZFE88t8u3GtxhuNPQ5I+2Kebsq2h73girS4qV9PZWmt8dwhm8SNoKbKQoIgCfn4kr4gD0xympHdQW7
Date: Thu, 3 Nov 2022 04:06:59 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8192e: Use min_t/max_t macros for variable
 comparison
Message-ID: <Y2LxC2kziM1TznhO@qemulion>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Simplify code by using min_t and max_t helper macros in place of lengthy
if/else block oriented logical evaluation and value assignment. This
issue is identified by coccicheck using the minmax.cocci file.

Use the *_t variants of min/max macros to avoid compiler warnings about
data typecast.
Also, use u32 as type for min_t macro to avoid any truncation of data
associated with enum constant HT_AGG_SIZE_32K.

Signed-off-by: Deepak R Varma <drv@mailo.com>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 62aa8e893c34..ccb86660ab48 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -587,17 +587,12 @@ void HTOnAssocRsp(struct rtllib_device *ieee)
 			else
 				pHTInfo->CurrentAMPDUFactor = HT_AGG_SIZE_64K;
 		} else {
-			if (pPeerHTCap->MaxRxAMPDUFactor < HT_AGG_SIZE_32K)
-				pHTInfo->CurrentAMPDUFactor =
-						 pPeerHTCap->MaxRxAMPDUFactor;
-			else
-				pHTInfo->CurrentAMPDUFactor = HT_AGG_SIZE_32K;
+			pHTInfo->CurrentAMPDUFactor = min_t(u32, pPeerHTCap->MaxRxAMPDUFactor,
+							    HT_AGG_SIZE_32K);
 		}
 	}
-	if (pHTInfo->MPDU_Density > pPeerHTCap->MPDUDensity)
-		pHTInfo->current_mpdu_density = pHTInfo->MPDU_Density;
-	else
-		pHTInfo->current_mpdu_density = pPeerHTCap->MPDUDensity;
+	pHTInfo->current_mpdu_density = max_t(u8, pHTInfo->MPDU_Density,
+					      pPeerHTCap->MPDUDensity);
 	if (pHTInfo->iot_action & HT_IOT_ACT_TX_USE_AMSDU_8K) {
 		pHTInfo->bCurrentAMPDUEnable = false;
 		pHTInfo->ForcedAMSDUMode = HT_AGG_FORCE_ENABLE;
--
2.34.1



