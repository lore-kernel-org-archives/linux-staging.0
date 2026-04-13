Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952FF3AF667
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 10:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776075348; cv=none; b=VrNrWFysbJu19p4hMswIrt/TSXT/GJpbvK3yahGX7dPAzmH4w2/id6bXcD/UN0w6vfyukz5QRudDQqVvqq+hI0nJ+WxyDQ+SuPFVZmrKxrEmiMYp/C+eOR92IsZ5bL9Kw5IajH2AVgq5eqcfdS1jafPRgVNgb+0Kq/+aLeHztts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776075348; c=relaxed/simple;
	bh=yPkQpdRJz4UUEAIB1UHDnAtzLhdEjq30MfMTXx+1RkQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dq8/xpGGhUISAlPAdFoz/O4En7ht9QjJgVBoP7QXCyqAHxDko2XwyI3VsaHLDd3D7ShsPIFf02pmD8DfKKGI3TLa5PlOjexjVa92UAmkhJTh6SGlN264fm+GBCyEiE8Jq691fTKT7E/8aH8drbpc5VNqKqUfkCruWG7fLXIdFzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Mz5UfPXW; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Mz5UfPXW"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776075344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1cb61+C5CwkI3uiNoG1Pp1t2PFr18a9etaR9+AfhkPM=;
	b=Mz5UfPXW8xGqq/jC5C08wqxNH+xvkcy4feLl2TQZI9Xyxx6xs+JxCVgjGYOFRzPBscY33A
	jCM87NKHsK5KRiP8wbwuI5WcoK2WogPhojD6iY8fxrpxB2R1+YEimYuVhQBKmPxQTVbC/O
	0lrsV2x7RH8+29kyDkNiOw0dkFQOnNg=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH 06/11] staging: rtl8723bs: os_dep: align parameters with open parenthesis
Date: Mon, 13 Apr 2026 12:14:27 +0200
Message-ID: <20260413101432.158925-7-luka.gejak@linux.dev>
In-Reply-To: <20260413101432.158925-1-luka.gejak@linux.dev>
References: <20260413101432.158925-1-luka.gejak@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Luka Gejak <luka.gejak@linux.dev>

Align function parameters with the open parenthesis in the os_dep
directory to adhere to the Linux kernel coding style. This resolves
"Alignment should match open parenthesis" warnings reported by
checkpatch.pl.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 098456e97c96..eb407d245ebc 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -2305,7 +2305,7 @@ static int cfg80211_rtw_start_ap(struct wiphy *wiphy, struct net_device *ndev,
 }
 
 static int cfg80211_rtw_change_beacon(struct wiphy *wiphy, struct net_device *ndev,
-		struct cfg80211_ap_update *info)
+				      struct cfg80211_ap_update *info)
 {
 	struct adapter *adapter = rtw_netdev_priv(ndev);
 
-- 
2.53.0

