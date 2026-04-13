Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1468E362139
	for <linux-staging@lists.linux.dev>; Mon, 13 Apr 2026 10:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776075359; cv=none; b=u4NnCoKBB0VePJTS7DVZ/l0TKNiHIUgnLSx6WGoHvm+ATRsXGkJF9eoUeVbmtw7HnrXDER+bd6uj3htVvwZKGJhbFyGgnKXP24qF7R0I0nROxUq94iRrk7Vry/KztY29XEKStQ82G/bFRlzPXLdXVy9m1eirsVoi0MXo5LcBNOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776075359; c=relaxed/simple;
	bh=otXB5VcUaTZ6Grd+/pSMjdOw4IBGTtx4RqrduBbEOsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zftx7p2vAOnBrsJQOj+UCJ+Ax05LNXwoPjv5ZglkiH8fkXJefJUaV0dinE1YiOQXKfTvwptOQE8158twexdTtws3Ip9QNgGefmAxKwpogjPWyyG6bewHzGPXco48/cj3uwQS+X28SK/cjNQiksBK4RnsGpRfLG9+j8Z1RdN/pxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YNuc3J1z; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YNuc3J1z"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776075356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bBAFvJKdbJQBv8ulDEnQpow37aZfHxjdPr7A83AbeIc=;
	b=YNuc3J1znbLqFYDQzICuzLF5a1icrWwkBeRQlsBVV88yB+6gQ20rN2B8L/ffYMr572lwf5
	XDeS1kjF+8M+RlV/3ri/lLrUtoAosWrnliWwwrym+SIWreB/F578lyDznSwogHzgEWkOj2
	BuZ/UPsnr4gvbUR9jLlKF9bMpHIigG4=
From: luka.gejak@linux.dev
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Luka Gejak <luka.gejak@linux.dev>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <error27@gmail.com>
Subject: [PATCH 09/11] staging: rtl8723bs: os_dep: remove unnecessary braces
Date: Mon, 13 Apr 2026 12:14:30 +0200
Message-ID: <20260413101432.158925-10-luka.gejak@linux.dev>
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

Remove unnecessary braces around single-statement blocks in the os_dep
directory to adhere to the Linux kernel coding style. This resolves
unnecessary braces warnings reported by checkpatch.pl.

Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 3 +--
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c      | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index eb407d245ebc..53b305443c29 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1402,9 +1402,8 @@ static int rtw_cfg80211_set_key_mgt(struct security_priv *psecuritypriv, u32 key
 	if (key_mgt == WLAN_AKM_SUITE_8021X)
 		/* auth_type = UMAC_AUTH_TYPE_8021X; */
 		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
-	else if (key_mgt == WLAN_AKM_SUITE_PSK) {
+	else if (key_mgt == WLAN_AKM_SUITE_PSK)
 		psecuritypriv->dot11AuthAlgrthm = dot11AuthAlgrthm_8021X;
-	}
 
 	return 0;
 }
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index 95523c3a508b..5c546ce04747 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -144,9 +144,8 @@ static void sdio_deinit(struct dvobj_priv *dvobj)
 		sdio_claim_host(func);
 		sdio_disable_func(func);
 
-		if (dvobj->irq_alloc) {
+		if (dvobj->irq_alloc)
 			sdio_release_irq(func);
-		}
 
 		sdio_release_host(func);
 	}
-- 
2.53.0

