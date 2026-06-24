Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1AB322533
	for <linux-staging@lists.linux.dev>; Wed, 24 Jun 2026 19:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782329708; cv=none; b=darqoqpPV+vGmNkZYOAQ9sFrxkcUOV8Yn0zATu19pchdJs648UQ+c2tjO/31El4JFMwCWyNIYmgK/WFBAOmC75yNcBL7kP5Q8udbwHB7m/VGXioRJCFP7SXkA6jmMgLNNldFG8DHrgJqkxRx9BHmVr2BwYQdWhRJCnMk1XuWZCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782329708; c=relaxed/simple;
	bh=DwbreWjHhFD4PTDCjXkObAFTtDOFOiizG9PXlSeIWV4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BCoaZ6itMhmjjgFWbqWlZXVNIPagofe6quY7rQQcwrYBhyuG6yo0NfvnepJOYIjSCMupYDJvV7Rg1ZrQ+X4XFLZcK+Sp1a3U5He29zmkFuTD2MPJmdzoVRlRMG96KTF+H9mTUR//k2Lc+9cTPOKcGgWW+XTE1RMXJZ617PGyoUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=hwb5KkkX; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="hwb5KkkX"
Received: from fews03-sea.riseup.net (fews03-sea-pn.riseup.net [10.0.1.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4glsbH46slzDs18;
	Wed, 24 Jun 2026 19:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riseup.net; s=squak;
	t=1782329707; bh=rFgYSJVKkUZveratfRx9ZHEkHNTMHq4p2NImVnJoYXI=;
	h=From:To:Cc:Subject:Date:From;
	b=hwb5KkkXwtYvMSDRNvD0a3Jpdov8/aLed2dRoo1Shd7VCWLPTJYsdQdmWowxaj+Bs
	 AbwMOjexean+OvvivU/u44xToKFmPP4sR7whL0yL0mRRqNyBD2X3fRbNa3n9vNHZCY
	 ouuIamNi6SUScWYue3mPGPwdycG02W51HXQlTu70=
X-Riseup-User-ID: EF65CC0EDFA80235BB0A53F9FAA2698BBDDB29277014FDC18D1103BD3AB96333
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews03-sea.riseup.net (Postfix) with ESMTPSA id 4glsb407l4z1y3b;
	Wed, 24 Jun 2026 19:34:55 +0000 (UTC)
From: Alonso Garrigues <agarrigues@riseup.net>
To: gregkh@linuxfoundation.org
Cc: error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alonso Garrigues <agarrigues@riseup.net>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary braces in odm_HWConfig.c
Date: Wed, 24 Jun 2026 20:34:46 +0100
Message-ID: <20260624193446.1429981-1-agarrigues@riseup.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Single statement block does not need braces.

Signed-off-by: Alonso Garrigues <agarrigues@riseup.net>
---
 drivers/staging/rtl8723bs/hal/odm_HWConfig.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
index c88d669cb086..1716252641d3 100644
--- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
+++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
@@ -236,9 +236,8 @@ static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
 	if (is_cck_rate) {
 		phy_info->signal_strength = (u8)(odm_signal_scale_mapping(dm_odm, pwdb_all));
 	} else {
-		if (rf_rx_num != 0) {
+		if (rf_rx_num != 0)
 			phy_info->signal_strength = (u8)(odm_signal_scale_mapping(dm_odm, total_rssi /= rf_rx_num));
-		}
 	}
 }
 
-- 
2.54.0

