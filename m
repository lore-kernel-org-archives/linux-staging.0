Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83465372075
	for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 10:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781864517; cv=none; b=GiktKo+V2L9t/sxUxhzdCk9eofSfcpLDvod66YAEb9NFqwQ2lryoSjhIpqCenCVoF1b26kG7XPez8T3e28VqDu4COHqa1WJYV1/e39dLMlBH2fnY+GYfwkhPMNOfHNuulcwDPl0LXo5zLaLg3YyMo44d95jSgDVSk64v6bjl6JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781864517; c=relaxed/simple;
	bh=cAYF0XzMwGdcreGSJsLhLag9gw4K21hTxPeegQd6bFs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JDDbKie/oS5twvqjX7o7gCteNMrUSrFeyrE1e+c6gkZ5yYLNLgOs9kFbcmK6ocMlBVXNlxFiMmDOMKkAVz8klNbJSuqhsPX208KOImeask/FunC/hjJLTFqfD+5/j17HUHUjyubE2NLRXTwhXNe/COy1WoieCnJyIsUnVeOx7qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=eNfMZFQl; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="eNfMZFQl"
Received: from mx0.riseup.net (mx0-pn.riseup.net [10.0.1.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4ghYNK2mdMzDs0p
	for <linux-staging@lists.linux.dev>; Fri, 19 Jun 2026 10:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riseup.net; s=squak;
	t=1781864049; bh=/WudR2Tjh2ncDG1wPzLNcOaiIg3sUer2LFccxSxc9FA=;
	h=From:To:Cc:Subject:Date:From;
	b=eNfMZFQl2uIofMVJMSem9os0CTnRU3kVuskYak5P5btRwnydhc/osGF4tCTWdPTg1
	 wXNuxfZr5rJf3W3pnwkHJgrTzwAh0zCazGRpmUgtTO08hRkwNbWlBBKbA0o1zuK3uJ
	 far6MOJIMqc9bw9qZUYoGRxfIVImuoXpzK5LQHfA=
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx0.riseup.net (Postfix) with ESMTPS id 4ghYNC5Hp8z9s1y;
	Fri, 19 Jun 2026 10:14:03 +0000 (UTC)
X-Riseup-User-ID: 68EC748454F52C0788761C1576A86AEB9F7DB9EF7EDB23CB07BF7A5CB8ACF804
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4ghYN00qQLz1xvR;
	Fri, 19 Jun 2026 10:13:51 +0000 (UTC)
From: Alonso Garrigues <agarrigues@riseup.net>
To: gregkh@linuxfoundation.org
Cc: straube.linux@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alonso Garrigues <agarrigues@riseup.net>
Subject: [PATCH] staging: rtl8723bs: remove redundant condition in wlanhdr_to_ethhdr
Date: Fri, 19 Jun 2026 11:13:00 +0100
Message-ID: <20260619101300.1841338-1-agarrigues@riseup.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Comparing boolean return value to true with == is redundant.
Remove the explicit comparison and the extra parentheses.

Signed-off-by: Alonso Garrigues <agarrigues@riseup.net>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index f78194d508df..71dc6dd6473a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -1597,7 +1597,7 @@ static signed int wlanhdr_to_ethhdr(union recv_frame *precvframe)
 	eth_type = ntohs(be_tmp); /* pattrib->ether_type */
 	pattrib->eth_type = eth_type;
 
-	if ((check_fwstate(pmlmepriv, WIFI_MP_STATE) == true)) {
+	if (check_fwstate(pmlmepriv, WIFI_MP_STATE)) {
 		ptr += rmv_len;
 		*ptr = 0x87;
 		*(ptr + 1) = 0x12;
-- 
2.54.0

