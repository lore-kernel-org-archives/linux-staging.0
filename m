Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972987C;
	Tue,  1 Nov 2022 13:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
	t=1667310549; bh=vFzpmBoau7NBl7FFTlmZYFwyYNbzqXjwJoyGzhQ4sDE=;
	h=X-EA-Auth:Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=DPOe8NTGgDw6DENTKI2h+HFxSxlw2SNLglRET2d/j2LL38nDz9MOmBZYOCTJseT7Z
	 DGvZsdmgbj7RgxGC87zlbSRSrYy3vLAYawlpka1LCMkAJM9oquaf2cMmGkCUlmE8IZ
	 wsuDSA/zkzkWqLCLxa6ZIICZyfrWr2T/1Q5j2atk=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
	via [213.182.55.206]
	Tue,  1 Nov 2022 14:49:09 +0100 (CET)
X-EA-Auth: m4kbEFhoIEjDxdTr7Dx+G1fH9jl1AA03O/KmMzF+amilm1q+pNst2gH1Zw2gw19RPWicZz0R3CJzQnchs6LjAeOi4oRIlVHt
Date: Tue, 1 Nov 2022 19:19:05 +0530
From: Deepak R Varma <drv@mailo.com>
To: outreachy@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/7] staging: wlan-ng: Remove unused struct wlan_ie_tim
 references
Message-ID: <36834007587a2e0ef7a782f5919f3a4c756b7840.1667308828.git.drv@mailo.com>
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

Pointer reference to struct wlan_ie_tim is added as a member
variable of a structure; However, this references is never
used. Remove such unused struct reference. The cleanup also
renders the struct useless; so remove it as well.
Issue identified as part of coccicheck based code analysis.

Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Suggested-by: Pavel Skripkin <paskripkin@gmail.com>
Signed-off-by: Deepak R Varma <drv@mailo.com>
---
Changes in v2:
   1. Include additional code clean-up opportunities and combine changes in a
      patch set based on impact areas.
   2. The patch changes are compile tested only on X86 arch.

 drivers/staging/wlan-ng/p80211mgmt.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/staging/wlan-ng/p80211mgmt.h b/drivers/staging/wlan-ng/p80211mgmt.h
index 536794bdd1f0..d95ffe0097e9 100644
--- a/drivers/staging/wlan-ng/p80211mgmt.h
+++ b/drivers/staging/wlan-ng/p80211mgmt.h
@@ -253,16 +253,6 @@ struct wlan_ie_cf_parms {
 	u16 cfp_durremaining;
 } __packed;

-/*-- TIM ------------------------------------------*/
-struct wlan_ie_tim {
-	u8 eid;
-	u8 len;
-	u8 dtim_cnt;
-	u8 dtim_period;
-	u8 bitmap_ctl;
-	u8 virt_bm[1];
-} __packed;
-
 /*-- IBSS Parameter Set ---------------------------*/
 struct wlan_ie_ibss_parms {
 	u8 eid;
@@ -309,8 +299,6 @@ struct wlan_fr_beacon {
 	struct wlan_ie_ds_parms *ds_parms;
 	struct wlan_ie_cf_parms *cf_parms;
 	struct wlan_ie_ibss_parms *ibss_parms;
-	struct wlan_ie_tim *tim;
-
 };

 /*-- IBSS ATIM ------------------------------------*/
--
2.34.1



