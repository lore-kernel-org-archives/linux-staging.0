Received: from mail.cipherat.com (mail.cipherat.com [91.98.42.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988D53FB7D4
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 12:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.98.42.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777378715; cv=none; b=tNkZBnPbQs5D79ryiBgm6yqLqctKF1fg0hkyOXC31bMXtgAmvNcd/+CMAZ4yZaNE8c2yAu8o65RFUp94CsNSAQh+MF/UJxE/+trt8oIzARMLAlNYH6mpYOWIt2w2QHLsWTpUR1L62hyvSGjHpo4rg6OHsHyiavmHEThQlRXyLhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777378715; c=relaxed/simple;
	bh=rZHYkXggah79PkVFN+6E/RKD6b6tAyfkViysUFDb8oc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A8MvFsxJ2b8NhJHGs4yK7Yl8glQ2bX5hxKCv+Rb2OPcfOL0I0pRXPu4hNQykfqOxAgWJXj3ZX1e1tWmWdfhRWfF7gTc+Y5S9A7m+my6+Y/IJNg52ub2NnKrrCDm0J8A0C3wLCg87hArDXAnUiFJCCDnHyI2J8dhAW+TolCPOzDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com; spf=pass smtp.mailfrom=cipherat.com; dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b=HvG95tv2; arc=none smtp.client-ip=91.98.42.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cipherat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cipherat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=cipherat.com header.i=@cipherat.com header.b="HvG95tv2"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ED6A484F92;
	Tue, 28 Apr 2026 15:18:25 +0300 (+03)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cipherat.com;
	s=dkim; t=1777378706; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=9UgJASqxAWAeh3eiXQ4y7gcX7HLK+OapSPbuxmiLW5Y=;
	b=HvG95tv2dxC0qdZMP+gSK3gZtQLlN62WmAagFsSks60XheDsHRyCFZjKIlXw8tpelsN4sM
	G+48OG2DErpQfSzUJsdv+ym5lTH53Fm0CX7A0ajSbJupxUVSkAljVWNw1fZFRAQftAqO78
	QZwTms7EE63pfuptis/F20Kza2bTRBJg0mD7jtIsO/dBuO8u4mOEm4jL3D+D5FHHuhb/rm
	gbA/GKrrtvcnX52CfATNgdsiVHU+c5Ve5v3xfHMUHkYBvl3tI0IDYLFH7sPAHbxMDukT4L
	33huh62UMYn0YCrKPrJ0r3xZ+t2pUgUCokXN9NbAquxOA3GHfvYZ/uHrtmUfO6NoJkCI10
	8TiNglUWE6nxPwgUzG2CIHCC8/peB3RL1OVp1fxT8aexZ9I8A9BspuqmJ76re6QXOm78hN
	7qOchDGCLaK+Ewa75INBIQO5qpV4/VjV77EabdnMP6b3lavDy6jOAgskxuDjDbsv8HmFxE
	LDRGg6Lu2HJAGLXcspBQAAyR+lXR3ZYUWW3rWJISdYL4KpJwLJkEOrhlOVMlHNAkE1xQcj
	LtAXIc6c/WMH36go3cbfy0zuq9fvyyUmXIqxFOXbleR7UFryR/5+25sKIDQ3IXQmHooQ4U
	PBeaPocWm8oFCOao6gFVJdo9THBrm6yh+4C0m1zv2ZjJ7zVKZ3xe8=
From: Salman Alghamdi <me@cipherat.com>
To: gregkh@linuxfoundation.org
Cc: luka.gejak@linux.dev,
	straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v5 1/8] staging: rtl8723bs: fix buffer over-read in rtw_update_protection
Date: Tue, 28 Apr 2026 15:15:44 +0300
Message-ID: <20260428121737.435248-2-me@cipherat.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260428121737.435248-1-me@cipherat.com>
References: <20260428121737.435248-1-me@cipherat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

rtw_update_protection() is called with a pointer offset into the
ies buffer but the full ie_length is passed, causing a potential
buffer over-read.

Fixes: e945c43df60b ("Staging: rtl8723bs: Delete dead code from update_current_network()")
Fixes: d3fcee1b78a5 ("staging: rtl8723bs: fix camel case in struct wlan_bssid_ex")
Reported-by: Luka Gejak <luka.gejak@linux.dev>
Closes: https://lore.kernel.org/linux-staging/DI2H39EAAFBZ.3KI5NWN02AQ2S@linux.dev
Cc: stable@vger.kernel.org
Signed-off-by: Salman Alghamdi <me@cipherat.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index ddfc56f0253d..268f294528e6 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -464,8 +464,11 @@ static void update_current_network(struct adapter *adapter, struct wlan_bssid_ex
 
 	if (check_fwstate(pmlmepriv, _FW_LINKED) && (is_same_network(&pmlmepriv->cur_network.network, pnetwork, 0))) {
 		update_network(&pmlmepriv->cur_network.network, pnetwork, adapter, true);
+		if (pmlmepriv->cur_network.network.ie_length < sizeof(struct ndis_802_11_fix_ie))
+			return;
+
 		rtw_update_protection(adapter, (pmlmepriv->cur_network.network.ies) + sizeof(struct ndis_802_11_fix_ie),
-								pmlmepriv->cur_network.network.ie_length);
+								pmlmepriv->cur_network.network.ie_length - sizeof(struct ndis_802_11_fix_ie));
 	}
 }
 
@@ -1072,8 +1075,11 @@ static void rtw_joinbss_update_network(struct adapter *padapter, struct wlan_net
 			break;
 	}
 
+	if (cur_network->network.ie_length < sizeof(struct ndis_802_11_fix_ie))
+		return;
+
 	rtw_update_protection(padapter, (cur_network->network.ies) + sizeof(struct ndis_802_11_fix_ie),
-									(cur_network->network.ie_length));
+									(cur_network->network.ie_length - sizeof(struct ndis_802_11_fix_ie)));
 
 	rtw_update_ht_cap(padapter, cur_network->network.ies, cur_network->network.ie_length, (u8) cur_network->network.configuration.ds_config);
 }
-- 
2.54.0

