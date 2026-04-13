Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404EF3BD245
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 10:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776075363; cv=none; b=Zp2hbKNRo/eSrXyEwMngpRe/sa4PB4yWQJd8kVN3NtUJq74ctY1R2AvygD4vviLDPYOtg/deun/IYKK2MVcwXxq1pCx0bjG7cYf9etLTU+8/9gi3060UD3Qw61Xce18Jk4fedCvEaAPIr+SqIlcMUPQO++kFiPtuDaPt67r7xqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776075363; c=relaxed/simple;
	bh=Hk1LEJ06Ybb8Melf5c2Ksth/5iklXN3N3Cv9u8QA0rA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jgmDqeYF9rsGmZWTuDI5vHfZN6IsAWtPhz0LXdwriKx8hVv5+VpXQljWhJHXqtI0p6Rf87LpAvl0JlxPJJlHjrMehC1cXkOaw78zfinJiSP3Cu4S/2ru9O3H/PXfrcFhuuXEMzN+XpDjzxkZ66o5osyTXKIUE5X4kOBWRYbMFxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=MA3zhxcN; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="MA3zhxcN"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776075360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hGyJpPVklh6FqHgzngavFWRRnEwhwlHdxbmqXEQ7qlI=;
	b=MA3zhxcNRVfFa3ZZ/4o+KcTv+G2zfCz3qF51NNt+7eoJXFGdNXWJOj0JU8qcsJv4BhXerF
	2lyXR6RT1ZWV0QAn5RrWsKdEepchLyyqjwM9G/HqaFOcx6y2Gg14eXvB7yLCO8F8oZ8/+r
	cvI8Cuh0GH8D69/2UYEGRghnAODqMOI=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH 10/11] staging: rtl8723bs: os_dep: remove blank lines before closing braces
Date: Mon, 13 Apr 2026 12:14:31 +0200
Message-ID: <20260413101432.158925-11-luka.gejak@linux.dev>
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

Remove empty lines immediately preceding a closing brace in the os_dep
directory to adhere to the Linux kernel coding style. This resolves
"Blank lines aren't necessary before a close brace" warnings reported
by checkpatch.pl.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 53b305443c29..b7d6bc96559d 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -578,7 +578,6 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 				psecuritypriv->dot118021XGrpPrivacy = _WEP40_;
 				if (param->u.crypt.key_len == 13)
 					psecuritypriv->dot118021XGrpPrivacy = _WEP104_;
-
 			} else if (strcmp(param->u.crypt.alg, "TKIP") == 0) {
 				psecuritypriv->dot118021XGrpPrivacy = _TKIP_;
 
@@ -589,7 +588,6 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 				memcpy(rxkey, &(param->u.crypt.key[24]), 8);
 
 				psecuritypriv->busetkipkey = true;
-
 			} else if (strcmp(param->u.crypt.alg, "CCMP") == 0) {
 				psecuritypriv->dot118021XGrpPrivacy = _AES_;
 
@@ -633,7 +631,6 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 					memcpy(psta->dot11tkiprxmickey.skey, &(param->u.crypt.key[24]), 8);
 
 					psecuritypriv->busetkipkey = true;
-
 				} else if (strcmp(param->u.crypt.alg, "CCMP") == 0) {
 					psta->dot118021XPrivacy = _AES_;
 				} else {
@@ -645,7 +642,6 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 				psta->ieee8021x_blocked = false;
 
 				psta->bpairwise_key_installed = true;
-
 			} else { /* group key??? */
 				if (strcmp(param->u.crypt.alg, "WEP") == 0) {
 					memcpy(grpkey, param->u.crypt.key, (param->u.crypt.key_len > 16 ? 16 : param->u.crypt.key_len));
@@ -663,7 +659,6 @@ static int rtw_cfg80211_ap_set_encryption(struct net_device *dev, struct ieee_pa
 					memcpy(rxkey, &(param->u.crypt.key[24]), 8);
 
 					psecuritypriv->busetkipkey = true;
-
 				} else if (strcmp(param->u.crypt.alg, "CCMP") == 0) {
 					psecuritypriv->dot118021XGrpPrivacy = _AES_;
 
@@ -2048,7 +2043,6 @@ static netdev_tx_t rtw_cfg80211_monitor_if_xmit_entry(struct sk_buff *skb, struc
 		/* Use the real net device to transmit the packet */
 		_rtw_xmit_entry(skb, padapter->pnetdev);
 		return NETDEV_TX_OK;
-
 	} else if ((frame_control & (IEEE80211_FCTL_FTYPE | IEEE80211_FCTL_STYPE)) ==
 		   (IEEE80211_FTYPE_MGMT | IEEE80211_STYPE_ACTION)) {
 		/* only for action frames */
@@ -2503,7 +2497,6 @@ static int _cfg80211_rtw_mgmt_tx(struct adapter *padapter, u8 tx_ch, const u8 *b
 	if (dump_mgntframe_and_wait_ack(padapter, pmgntframe) != _SUCCESS) {
 		ack = false;
 		ret = _FAIL;
-
 	} else {
 		msleep(50);
 
-- 
2.53.0

