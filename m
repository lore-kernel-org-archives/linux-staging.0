Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E063BD659
	for <linux-staging@lists.linux.dev>; Thu, 20 Aug 2026 19:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787255706; cv=none; b=OgR7jmFYr+KcJt+ZoaJHHMqKrdGgayfcQff5ZF2FIidK+MNeo1Dgg27DUdK+/nFXVBrKUFQBv7hnI1gfVr5miHt8sAW+0E44/l5VOQFSt1Ix/jLC6EPiVqaoeO1/Y/SvLMjnKS4MS+5b36kc21FelfIXiDLQI3w9kFHVMn7u1rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787255706; c=relaxed/simple;
	bh=ws8cBk10lmCtxgMp0WxRot/4jSedKeR6foNlYY8tcdM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rvySdaI3Equf35V4fl0lMz9WR4s+o4Ds3iq8zctW9gVXcouAciiacXB/rnIsRJDN8AmxWdi8Bqgb1ettTJBxQy0C7V8KEbmUE1o3xxOipJTvSWh3hJAeEg0UkEKceBgpgx+R/CchCKDAr+QoMXua20flRw3HYGwi7FVEGN1M2Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TrvVtpE6; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TrvVtpE6"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a3efa2b38aso555145a12.2
        for <linux-staging@lists.linux.dev>; Thu, 20 Aug 2026 12:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787255703; x=1787860503; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vGFx8IubxWOY0l5x17KjJVyU3ordCR0tVtvFH4XXZlc=;
        b=TrvVtpE62WcgePOiqmc71kCbiX++dujvxJNPvFwilF3rPwwheiS1YDuzqPf2rZ7FR4
         GkgaeIlbzlBvnGTEFAvJoliPiQggqTH4tfpkGPrb2kiLEHyXkxjQJz/4BRkkozdtfdN0
         Rh5Kwi5ini73QUEZ1cNnRa61UqnyT7T+OFJmqcCl+dqhzOdjAeI/bn7ebh1jN+SWb9lk
         kEY3GKaQjtRwqfOEM1vwA6fliOtFaGgaYzjs4W7+MifhAfrZCYYBh4ySitEcf5jgyqTd
         5upssLRuoAkRUnFAD6nJHWvYIFf2bAFUsd03aLyAxUVRj06ive8DGBujy9ZoUUpuryOl
         3xag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787255703; x=1787860503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vGFx8IubxWOY0l5x17KjJVyU3ordCR0tVtvFH4XXZlc=;
        b=Ve0aEQWP+RbSx5sdnh52kBy2tNr5wrDVfTSp31lIEBLSK/IbOKAj7VTVlk/lS8fhu4
         +WlJ7MOqsYkC+/wUlTK57SxquFCw07IwIxT20gnBhwVnUpdg+Dri0vQhGnqCn3cao16T
         tQ+fvoSkxzbpGLxDAEeg66EZ6tGKG4ONDd4/jkHKWr5vWyNkHWBYzA85L/gTkSHYqcmx
         dzweTy8VHruVENo7nU96F7HCYOTOJz7ml3j0ru3vUv5bPw5shekv3klQVqln8OF/2vJ5
         BvtdQangnH+ryz4uALn+/27u4uUOXycSgyxXDUsNu8KuntbwKXsXqiMhLfGr3i0ItWSE
         Kzcw==
X-Gm-Message-State: AFuF++kcNA1cdPvfdgeKeDNNYf9JlAxgvTvM0cC+P3TKXhZ1wlkE0UZH
	+0p4d1RIEEtbKeq3QpuNoTacSQ5E8psmPKiDclOimTnBkx43scZEQLfI
X-Gm-Gg: AR+sD13GImxlvIdjTS8jhK0Mgx89QSrh15GLngGdQftrgHP8fl3yXXzob026dTZemYG
	JztoBl7vBwQ2QvMVOJW2qVOk/6pkiDMumK9sEbT7VTAizfWyZglCt8d/DPjJMNC9giFKNnGC4wi
	9C427lzbWRsCOZrYI1BKcHGTvB6hbPWLF3fxWeaKapH2xr23gSBVPbfBoICkjCf3zx2epIZ3nMp
	e3riUiLNEynH6Hb6qmZsEvHCMimg70r35nfKsOKOmSePVGhLRePtJ6kEo4ajQphXF00p4uN7gBz
	YNOv69P9IijMa04pfOm7fUw60phiUrJ8sz2RNlGQ//kHUgbQWMj+pdDUgSylv3dM3qyK/RpWrqs
	tH0bjrbdmVMzMGpIamSGUd2GmE+vwON984/NtS/UHpnIfhUiNZl7IEsMIWOstxM5wYQWvYG1Iby
	61Yv4ruXp0KBrwe1usSR6D35ZblwGm/fy+/tffT4ZM7JDLgVfG6/gudcG34sLNCg2bmzA9OWFX+
	A==
X-Received: by 2002:a05:6402:4498:b0:6a1:44c8:edc4 with SMTP id 4fb4d7f45d1cf-6a42f21ee39mr983177a12.12.1787255703230;
        Thu, 20 Aug 2026 12:55:03 -0700 (PDT)
Received: from nevertabs-archlinux ([46.216.37.165])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3feec9f4asm2909073a12.3.2026.08.20.12.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 12:55:02 -0700 (PDT)
From: alwaystabs <reservedstep@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	alwaystabs <reservedstep@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary parentheses in rtw_ioctl_set.c
Date: Thu, 20 Aug 2026 22:54:58 +0300
Message-ID: <20260820195458.11689-1-reservedstep@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary parentheses around variables in rtw_ioctl_set.c
to fix checkpatch CHECK messages.

Signed-off-by: alwaystabs <reservedstep@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index 12bf7780b..d9dc47eba 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -36,11 +36,11 @@ u8 rtw_do_join(struct adapter *padapter)
 {
 	struct list_head	*plist, *phead;
 	u8 *pibss = NULL;
-	struct	mlme_priv *pmlmepriv = &(padapter->mlmepriv);
-	struct __queue	*queue	= &(pmlmepriv->scanned_queue);
+	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
+	struct __queue	*queue	= &pmlmepriv->scanned_queue;
 	u8 ret = _SUCCESS;
 
-	spin_lock_bh(&(pmlmepriv->scanned_queue.lock));
+	spin_lock_bh(&pmlmepriv->scanned_queue.lock);
 	phead = get_list_head(queue);
 	plist = get_next(phead);
 
@@ -53,7 +53,7 @@ u8 rtw_do_join(struct adapter *padapter)
 	pmlmepriv->to_join = true;
 
 	if (list_empty(&queue->queue)) {
-		spin_unlock_bh(&(pmlmepriv->scanned_queue.lock));
+		spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
 		_clr_fwstate_(pmlmepriv, _FW_UNDER_LINKING);
 
 		/* when set_ssid/set_bssid for rtw_do_join(), but scanning queue is empty */
@@ -74,7 +74,7 @@ u8 rtw_do_join(struct adapter *padapter)
 	} else {
 		int select_ret;
 
-		spin_unlock_bh(&(pmlmepriv->scanned_queue.lock));
+		spin_unlock_bh(&pmlmepriv->scanned_queue.lock);
 		select_ret = rtw_select_and_join_from_scanned_queue(pmlmepriv);
 		if (select_ret == _SUCCESS) {
 			pmlmepriv->to_join = false;
@@ -84,7 +84,7 @@ u8 rtw_do_join(struct adapter *padapter)
 				/*  submit createbss_cmd to change to a ADHOC_MASTER */
 
 				/* pmlmepriv->lock has been acquired by caller... */
-				struct wlan_bssid_ex    *pdev_network = &(padapter->registrypriv.dev_network);
+				struct wlan_bssid_ex    *pdev_network = &padapter->registrypriv.dev_network;
 
 				pmlmepriv->fw_state = WIFI_ADHOC_MASTER_STATE;
 
@@ -415,7 +415,7 @@ u8 rtw_set_802_11_authentication_mode(struct adapter *padapter, enum ndis_802_11
 u8 rtw_set_802_11_add_wep(struct adapter *padapter, struct ndis_802_11_wep *wep)
 {
 	signed int		keyid, res;
-	struct security_priv *psecuritypriv = &(padapter->securitypriv);
+	struct security_priv *psecuritypriv = &padapter->securitypriv;
 	u8 ret = _SUCCESS;
 
 	keyid = wep->key_index & 0x3fffffff;
@@ -437,7 +437,7 @@ u8 rtw_set_802_11_add_wep(struct adapter *padapter, struct ndis_802_11_wep *wep)
 		break;
 	}
 
-	memcpy(&(psecuritypriv->dot11DefKey[keyid].skey[0]), &(wep->key_material), wep->key_length);
+	memcpy(&psecuritypriv->dot11DefKey[keyid].skey[0], &(wep->key_material), wep->key_length);
 
 	psecuritypriv->dot11DefKeylen[keyid] = wep->key_length;
 
-- 
2.55.0

