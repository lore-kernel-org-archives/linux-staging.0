Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE103D75CD
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 08:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784105773; cv=none; b=WwRoKPNsYzpc6H/hl/RHRsjuWqb0A4eYiFvk9IEWlgzf0jzHYxTpTAF2udouuIJnL0HuZhuFA72sNDgHYie/Cu4Ll+yeKEeZuDBZr7EkgETNtZrlakHfKaj/3C6Wms1SCcuNb6TDso+p2wCMe8GENefopCeItyRPu5fDSDnt89Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784105773; c=relaxed/simple;
	bh=dGpX6UFtr8/clvIMqbAqlofH8gbu2hG34/nGSFeSDOg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DMuScjO1GQc30D78BACoSd1PvDnjN6atDeVfi68/XWjKUMlL294X+VpvwatQgtq0IsAyG+68qKqZaqpWM2fQfB3w3I1NhEByfA7ZNKCd2cOw2Kon65125Pe7iwdf1v40Jynmo1Q/CfU2DoQi2KB9JHZ9omXFUszO5bYy6K+kM7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=hHFsms0N; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="hHFsms0N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=3K
	fJv479xFr4Dg2qi4lChQhRWiNXEn64dt5MqGURgbA=; b=hHFsms0NqvyHsDPirp
	aQNJrRm92aT4rHOV8SiUhHQR8TsUnhFwoJcFBTqjrGFl1dwYwvmXTn7Ct2BuCYPE
	/grwUzbitm/ybwX53Co8LFK2Y1dsVVxOKPYft3qtoWJmBK1TT7Y8cMa9pc4uLnTW
	CZ/pITz3eD5daEWdwC4iP6wfI=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wAXw+cQS1dqIAg2Jg--.14468S2;
	Wed, 15 Jul 2026 16:55:46 +0800 (CST)
From: Gongwei Li <13875017792@163.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Luka Gejak <luka.gejak@linux.dev>,
	Michael Straube <straube.linux@gmail.com>,
	Gongwei Li <ligongwei@kylinos.cn>
Subject: [PATCH] staging: rtl8723bs: rtw_mlme: make rtw_add_network() static
Date: Wed, 15 Jul 2026 16:55:42 +0800
Message-Id: <20260715085542.1648015-1-13875017792@163.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAXw+cQS1dqIAg2Jg--.14468S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKryfZrW5Zr45XF45WrW7Jwb_yoWkurc_u3
	4Fyr4xCrn5Awn3C3yUJrWxXFyvgr4UZwn5GF4Dtr93Zw45WFW8u34DZry5CrWxXayYqr9x
	Jw4jy34rKF1fJjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbVyI5UUUUU==
X-CM-SenderInfo: rprtmlyvqrllizs6il2tof0z/xtbC-RJHAmpXSxIQiQAA3X

From: Gongwei Li <ligongwei@kylinos.cn>

Function rtw_add_network() used only in rtw_mlme.c file, so it should
be declared static. Remove the redundant prototype and add static
keyword to the definition.

Signed-off-by: Gongwei Li <ligongwei@kylinos.cn>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 1196ec011455..3b5f1dd32348 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -566,8 +566,7 @@ void rtw_update_scanned_network(struct adapter *adapter, struct wlan_bssid_ex *t
 	spin_unlock_bh(&queue->lock);
 }
 
-void rtw_add_network(struct adapter *adapter, struct wlan_bssid_ex *pnetwork);
-void rtw_add_network(struct adapter *adapter, struct wlan_bssid_ex *pnetwork)
+static void rtw_add_network(struct adapter *adapter, struct wlan_bssid_ex *pnetwork)
 {
 	update_current_network(adapter, pnetwork);
 	rtw_update_scanned_network(adapter, pnetwork);
-- 
2.25.1

