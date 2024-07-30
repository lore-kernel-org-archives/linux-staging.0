Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834C4187322
	for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 08:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722326739; cv=none; b=uFrV1yRGiW4eRsrLSmNR30/Q79grWkGVpLZkSYTVPsEBMotTyxMavE9v6zDCbO9gQ3lTo2StDPnf5JDeKsuOtUrTznrzmmp3uzCT8b5Xsv0oJAGB1nLLUop4liZMQsluhq35pMT33XijYXaUuhmVUqMra9fgZlmy/8yoTxO0ZYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722326739; c=relaxed/simple;
	bh=fz4DW3ntjyeWG6lnrMWYLUosjdk+QHCTQUIF7K0oA+8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=MQHW1E4WBnTXJWJtRsL7m+Oy/NtEBhq8K/9XFErLTN9frXbC3yGqpZkbjTfOZJX4tRjJPitc/DH+cmGXN4w2HeiJmd8yWoPgGl7K+0zMGRbOfQu8BSqx4roX9ac8HXhIM/lw2aFOfOkt3VdGqPu9Co68BjJiAXhJY5rU6uF+oKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=oFIj/cQs; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="oFIj/cQs"
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4WY77z5lf0zDqLl;
	Tue, 30 Jul 2024 08:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1722326736; bh=fz4DW3ntjyeWG6lnrMWYLUosjdk+QHCTQUIF7K0oA+8=;
	h=From:To:Cc:Subject:Date:From;
	b=oFIj/cQsAReFmXl2gdkT6WTavDgKtg+RDidhK2gjDZZwrL4WPmnRwEidxQghdS7IM
	 aXPQWX8TQfroSqNU+nvOVpuEM3rL3IaGIF0bMEF1VQbFB9LwYTzuInEWRkFtJiz4Ee
	 kxNyiROF6podt+D/9wGwz42uJMARJ/p3GclP9wSY=
X-Riseup-User-ID: C5153AF67710AA81E922AD9DF84F15AFD465CE048A165C188D4E1EC1DEA69DF7
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WY77y6B6GzJtKt;
	Tue, 30 Jul 2024 08:05:34 +0000 (UTC)
From: =?UTF-8?q?Santiago=20Ruano=20Rinc=C3=B3n?= <santiagorr@riseup.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: helen.koike@collabora.com,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH] staging: rtl8723bs: rtw_mlme_ext: replace spaces by tabs
Date: Tue, 30 Jul 2024 17:05:31 +0900
Message-Id: <20240730080531.991195-1-santiagorr@riseup.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix checkpatch error "ERROR: code indent should use tabs where possible"
in include/rtw_mlme_ext.h:388.

Signed-off-by: Santiago Ruano Rincón <santiagorr@riseup.net>

---
I am (mostly) a newcommer. Could you please tell me if there is anything
wrong with this patch? Thank you!

checkpatch reports a warning in line 387:
"WARNING: line length of 135 exceeds 100 columns"
Should I fix the warning in the same patch, or should I send a second
patch to fix it?
---
---
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 5b8574f5a..720aeeb00 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -384,8 +384,8 @@ struct mlme_ext_priv {
 	unsigned char default_supported_mcs_set[16];
 
 	struct ss_res		sitesurvey_res;
-	struct mlme_ext_info mlmext_info;/* for sta/adhoc mode, including current scanning/connecting/connected related info. */
-                                                     /* for ap mode, network includes ap's cap_info */
+	struct mlme_ext_info mlmext_info;	/* for sta/adhoc mode, including current scanning/connecting/connected related info. */
+						/* for ap mode, network includes ap's cap_info */
 	struct timer_list		survey_timer;
 	struct timer_list		link_timer;
 	struct timer_list		sa_query_timer;
-- 
2.39.2

