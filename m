Received: from mail-dl2-f41.google.com (mail-dl2-f41.google.com [74.125.229.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 714D8495AF0
	for <linux-staging@lists.linux.dev>; Fri,  2 Oct 2026 14:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790949904; cv=none; b=V1q4xGyI5c7HYtAQ9XaMlRCkO7JF09SNu8hDjj5wemh0SNM4QHbTA7PU18HL2YMJUgN9RWVx9em+59cKapjEO7+xtlOEcGxchnPApCWl18TKUAJWo86RPj7jq1ZYV9qa2DBen1NjmZQemvVSq7r8ucn9Aq4nbSpKPtFRl+nfijY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790949904; c=relaxed/simple;
	bh=0aA08cUOcCkvWwT2S45HvZ1jn2zLufS3cFGbct+/1wc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IBSZI7rZ1F+NcSfBoCxYOsnMpVMUi06Cq2tpR/BI0MEmoo/6HVv9Dh3Ah1F5RVPWqpCcY4rP1guhYTZwTZdoinkl8AbWjUlRvfKiTggZYfL7wK7FIzAPdu/P7qUs7YXzJacKOOtio2kEhPcqpZvyS0Ju4xxltoYyc/VAum3634o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=njX8UFig; arc=none smtp.client-ip=74.125.229.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njX8UFig"
Received: by mail-dl2-f41.google.com with SMTP id a92af1059eb24-148b5c829e8so6191191c88.0
        for <linux-staging@lists.linux.dev>; Fri, 02 Oct 2026 07:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790949899; x=1791554699; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yWoTdtEhaANGiWjxC7mDCG65IUsbfc9dm1bjsFUluhU=;
        b=njX8UFig9Ir5eByc4J0OqhNbRCxq5nUqPKdG5FIpuvj4PQbxLWylIV69zPnAomoNIc
         xTFdggn1BnlE19oGSlBkVr/bd1ZCgj2ySTJhVA6LuYj+7PK5S9/qw6aCD4Pkt22+Lg6E
         VzMdA6DKaOQvrvbtlAlkiSBi4jyv+/R+W5wZuOyMFYh0+GsdPFj8WNTIzhVXoxmxcnsV
         m9TBlobVkZ3KS01iYEY1nyYMbIUoMDqzsdRtrLKITdzSGbwJD0E2oZNxmlSH5RuKGHzN
         zr/9Z/yzSMDQ5AiilWhouXK+tNpzdBf/cBLwLJNvOxqlrI65Uyv6s0WCT4e2HpLQ1sL9
         QAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790949899; x=1791554699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yWoTdtEhaANGiWjxC7mDCG65IUsbfc9dm1bjsFUluhU=;
        b=i9f3qxePRV3D0YSJDNU/yY8BDsCgytUoUkpWgSYUQhF2sLJz1+YeHTsg1Jwz+JJUji
         oZh0wrV3c2GJSEXGgHA8OnhF5Ch5sAOYsWpubFDuUiFBO8HfsxvplK7T3+GvuoXY1wBt
         5WIUeFfGAuqLuXMSBxgt3XVyOSGnBsnmvO7gQGL8adfSJ3myF5x1N3SJry2VLyAd1Tge
         /f5pcs6NRmcCAMyudf5EnQAUF/im5JUhEmdbC8CEIy88T7nLCTJOPKTZxS0KCHpMCR3r
         F9ACvJKSoO3V1giIjje5U0vAoc3BQ/jGdyHyylcvjPLTvH9JzqjRvR7Et+GIkn1OUozJ
         Afkw==
X-Gm-Message-State: AFuF++mAFp4PA5+UlXx82V3WU8u3SQAwpxR2UXA1B6BlUf4K7HOBmHQf
	3o1ZGubPRY8/6Cv/wzN82VpX3UVHAtuvuAMYhYfWCUcHJYJUBL43fpyiEemOXIMY
X-Gm-Gg: AYBFou1ec509ITpd7RyxljsWQsrlsBLKC+MSWx3/hIDCI3/5xehLiSkLYW3Xb1lvVTD
	VWrHXK+VCyLAs3sVy1b3XUJ0aQOrCuhFWF4iHEGVllH6ouE+3V0+WrY61uD8WK9uKDM20OfruXw
	1yf7jdVvtZQRYDSLErMk2NeTgJKIyHFaUdmjp7dSgIMDJ5npgtxv4jWscOX+nKCkk16kRle181f
	58uZvIlMKJrpPSEm2FEkGvL/xlGUZ+gAZRUJbuAUjyEX24Sz9M3YTyChHJLjy6tYeES66BbXmZj
	GfEKqf5zDY1jFZb7bbJWUVD3b5205pKINPWXzUsQLcFnsoEY9pN/dREoNVMt5NC5Wxcqu0/wYqc
	owsroQDMO8TLvhJyFtzhKGYU1Aa1zMbexPFh/VWEG4rikZoqx3bCUm9CC+k+oWhg8cYMwmLBOhX
	f9NEfDsSeAHAlNZEtEbSrNEsEamAXin5j5g8aMwurwnTjREN32KtGkyM5H7hoYfupQDpQiJioq
X-Received: by 2002:a05:7023:a4b:10b0:144:fedf:5789 with SMTP id a92af1059eb24-14f5bbfad09mr2830789c88.15.1790949898789;
        Fri, 02 Oct 2026 07:04:58 -0700 (PDT)
Received: from adi.. ([122.171.22.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14f4766f92fsm6656244c88.16.2026.10.02.07.04.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 07:04:58 -0700 (PDT)
From: Adi Prasan <itsadi2409@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	Adi Prasan <itsadi2409@gmail.com>
Subject: [PATCH v3] staging: rtl8723bs: fix ie_length bound check in rtw_cfg80211_inform_bss
Date: Fri,  2 Oct 2026 14:04:50 +0000
Message-ID: <20261002140450.3209-1-itsadi2409@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920142849.294162-1-itsadi2409@gmail.com>
References: <20260920142849.294162-1-itsadi2409@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The buffer bound check in rtw_cfg80211_inform_bss() checked bssinf_len
(ie_length + header size) against MAX_BSSINFO_LEN (1000 bytes), but
network.ies[] is only MAX_IE_SZ (768) bytes. This allowed ie_length
values up to ~976 bytes to pass the check while a subsequent memcpy()
from network.ies still only has 768 valid bytes, and other paths that
write to network.ies consistently cap ie_length to MAX_IE_SZ.

Check ie_length against MAX_IE_SZ directly, which is the actual size
of network.ies, and drop the now-unused bssinf_len/MAX_BSSINFO_LEN
comparison.

Signed-off-by: Adi Prasan <itsadi2409@gmail.com>
Fixes: 554c0a3abf216 ("staging: Add rtl8723bs sdio wifi driver")
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 27e7b8442d7b..7e964b15ae6d 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -210,7 +210,7 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
 	u64 notify_timestamp;
 	s32 notify_signal;
 	u8 *buf = NULL, *pbuf;
-	size_t len, bssinf_len = 0;
+	size_t len;
 	struct ieee80211_hdr *pwlanhdr;
 	__le16 *fctrl;
 
@@ -218,8 +218,7 @@ struct cfg80211_bss *rtw_cfg80211_inform_bss(struct adapter *padapter, struct wl
 	struct wiphy *wiphy = wdev->wiphy;
 	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
 
-	bssinf_len = pnetwork->network.ie_length + sizeof(struct ieee80211_hdr_3addr);
-	if (bssinf_len > MAX_BSSINFO_LEN || pnetwork->network.ie_length > MAX_IE_SZ)
+	if (pnetwork->network.ie_length > MAX_IE_SZ)
 		goto exit;
 
 	{
-- 
2.43.0

