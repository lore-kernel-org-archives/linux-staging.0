Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A642137475B
	for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 10:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781866486; cv=none; b=sLfp/ApKxrFXNIB8lsPAyasm53nGDg4zIbzsD079clemyam2mHjhMwEBRlccSh9LQhPjT+fJ1+QJuVTb5o3rIzw9g6cIkJ1ZfpSb+mM/mVhKSkIIz97pVd++nP179lWppEAGV/OwXyNxJplDz3Q7epNxq2ZsHCWEB/CAUl5BQY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781866486; c=relaxed/simple;
	bh=v8L8wInTChqahGEXVkOA2vsFJAo9FZGH0RiPJ6+cN/c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rMqEnPKQKTE56ZkR/5esrMhI7cxruE2zgClUScCg81uR3N5ABKbpUqZC3gOlISqEXkXEfN4N5Z5dQNHgQiA7oUwRLpKqQc10O9G75pF5k+7DevwaWSnR2bmcXCfdQsnexyw48k2O3l0d4GRIJKAboePdNPZBjCLg3XwUE73mZo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=nHbIZ42T; arc=none smtp.client-ip=198.252.153.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="nHbIZ42T"
Received: from fews04-sea.riseup.net (fews04-sea-pn.riseup.net [10.0.1.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4ghZH90z0bz9sF1;
	Fri, 19 Jun 2026 10:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riseup.net; s=squak;
	t=1781866485; bh=A1y2SYLo6h8pa/wSNIf39x6uCEw3JC9uLVLq0i9fV4M=;
	h=From:To:Cc:Subject:Date:From;
	b=nHbIZ42T8bBCjiucmnU3LWrJUda4BOl2e3rN//HtQxUOL8pJ17kJq+iH7SjtSrpMF
	 AxSmTd6fashfWDipd7pMtdX+MpQcRDAVY0AdMgLa7HQk0Lb3heu61uCmlHrbh2GwEw
	 wyCoVEHRsPj9ny+mpvM08oUFj1sHd2S5MG7LkVC4=
X-Riseup-User-ID: 743869109D5EDD7BA6743DBD6B78853AF288BCD119DF5601B3D31B18DD6935F7
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews04-sea.riseup.net (Postfix) with ESMTPSA id 4ghZH836KGz5wM9;
	Fri, 19 Jun 2026 10:54:44 +0000 (UTC)
From: Alonso Garrigues <agarrigues@riseup.net>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alonso Garrigues <agarrigues@riseup.net>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary braces in rtw_set_oper_ch
Date: Fri, 19 Jun 2026 11:53:27 +0100
Message-ID: <20260619105327.1877129-1-agarrigues@riseup.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Single statement if block does not need braces.

Signed-off-by: Alonso Garrigues <agarrigues@riseup.net>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 1d37c2d5b10d..cc05decd4c76 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -256,9 +256,8 @@ inline void rtw_set_oper_ch(struct adapter *adapter, u8 ch)
 {
 	struct dvobj_priv *dvobj = adapter_to_dvobj(adapter);
 
-	if (dvobj->oper_channel != ch) {
+	if (dvobj->oper_channel != ch)
 		dvobj->on_oper_ch_time = jiffies;
-	}
 
 	dvobj->oper_channel = ch;
 }
-- 
2.54.0

