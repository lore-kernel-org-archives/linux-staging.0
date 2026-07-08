Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DE93E8C6A
	for <linux-staging@lists.linux.dev>; Wed,  8 Jul 2026 08:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783500961; cv=none; b=q1HDyEu2FrovzmF1Y6PZx1V9C9RJ5n3D37Tt4ljpzQppTIpi29l68+7oAScjUU8VHnEeC7UpyLS20xM4in6+ue+NLugivBSuM8exB4RKFP3+aOhmc5tGrnZdBucYayL4aVXaueLTIQwcMayriWm5DD56Sk1vUzDgtz0eHcug8WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783500961; c=relaxed/simple;
	bh=b9jKvI55pyRI8T7tgOhQXEspXytz33bEe/VOYrVQzs0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=envPt/2q0TVxkz9UvlQO8NC1XEgu267tfv4lT6BsDN0SjNrOattneoWxju4LfN2YKGdEwb08vOzX1FSkwTQX07b3jBx3RAN37SujT/5UgM19tKtVajza8bJ+OVaMGRT1WN3u8QA32R0G4ViJmvVusS6sq5R/EAmYgLIX0aD2dRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Ng9D/YNw; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=jYVLf/yy; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Ng9D/YNw";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="jYVLf/yy"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA512)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gwBlK35rhzKw4G;
	Wed, 08 Jul 2026 10:55:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783500957;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8ZQsVfCG3xV+ni0ayEcP7BewyBBqjKUQqUvk6BD3NAw=;
	b=Ng9D/YNw2/uM32vpOR2pIFqUjOHm2Ww2ULyrweSDU7IHochTRfnNd4wz0jnFV8vlKf1CFe
	hvCP3DR+pp9067nZoP4lrEria2w0hcGIKK+2S8XGsgRNCGAETO9AM7JvoXMkGVv2o8Weyv
	2IYQSK69rsLop1ZOiLMpfta8Ul/yK8WG21FAsPH1QXCeLQ3a2a80XCu0gnfss8yaxF+OJH
	+oT48X5VM5m1n7kVCLAOcp4p6YwJRIvlv9n3PXf2zaniJ1theQsDPpOPrJFWK0vQijQgwE
	wdazlF+mJ6xcZxSi6I378icGg3QzN3vjSF236vEcrURMNxAseUC0V6vrUBrlXg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b="jYVLf/yy";
	spf=pass (outgoing_mbo_mout: domain of manuelebner@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=manuelebner@mailbox.org
From: Manuel Ebner <manuelebner@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1783500955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8ZQsVfCG3xV+ni0ayEcP7BewyBBqjKUQqUvk6BD3NAw=;
	b=jYVLf/yy+k/+be3/s+IY30IYEslChG+jQJtsuSrM/7ofhJ9QnM0k3B8Th77DVwuGXR8mbg
	KN+MiFx/Y4FMklu6df+O3m822D6NX5HMCy1KcnrOKIrwNg0Wc+l/8keBc+B9n5o29vPCeD
	k1zhnyNg3rA275FmIhANf9xUd+Bio3NwpXUfLfY5KhUPPzK3gnhZN+XZVqr3D/mQGk/6l8
	rHr4Uieds6W75seSBj9+XX8HA07qfvGFQMruiJcxxM6Dcy6gpORS1RFjrwfPyT1ra2kAum
	CXZf1z0QNhTtZknbNpB579/VrMJ8gy0/y7WQBBfNryJxAl21FWPzFN92e5wFkA==
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: manuelebner@mailbox.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v4 1/3] staging: rtl8723bs: sdio_intf.c: refactor function
Date: Wed,  8 Jul 2026 10:54:05 +0200
Message-ID: <20260708085405.306809-2-manuelebner@mailbox.org>
In-Reply-To: <20260708084808.305951-4-manuelebner@mailbox.org>
References: <20260708084808.305951-4-manuelebner@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 8ae1474f98146921eff
X-MBO-RS-META: xmdtnhjp5fqhqn18e4izyaui6ah3s5t8
X-Rspamd-Queue-Id: 4gwBlK35rhzKw4G

Remove unused argument of rtw_sdio_if1_init().

Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index d0feb28b7043..ff58923e43f1 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -217,7 +217,7 @@ static void sd_intf_stop(struct adapter *padapter)
 }
 
 
-static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct sdio_device_id  *pdid)
+static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj)
 {
 	int status = _FAIL;
 	struct net_device *pnetdev;
@@ -348,7 +348,7 @@ static int rtw_drv_init(
 	if (!dvobj)
 		goto exit;
 
-	if1 = rtw_sdio_if1_init(dvobj, id);
+	if1 = rtw_sdio_if1_init(dvobj);
 	if (!if1)
 		goto free_dvobj;
 
-- 
2.54.0

