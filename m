Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9318D18E022
	for <linux-staging@lists.linux.dev>; Tue, 30 Jul 2024 21:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.252.153.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722374942; cv=none; b=ada6VuUwYhQDuGAwnhYSc2u4e56QmEqfAdn40oOpw3n6TkgzbWOm3bbJ6dxJ6DKOBLVzid4vliC88oVka5mKuPOYp7o7537hkEFH9WJ5HJocpUyIiey1izap9XNMqxGr0hGpVcVvMgTq1JbHxebdEWECZLd5tdXffTSkzZY+CB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722374942; c=relaxed/simple;
	bh=d9DOTRd8kAc5fw35sUzIu6WzsI7yQjrSEqrfuiFNqYU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=uF84xoEkSr79B5nhitzhKcXtOG3cc4/ijB1X6yNo0CbMEwup2afOeI99rqtOGPmnI+BPFwR7hSWOOxHu4hIr6W6Skb8B/kC/qH8DHEvauvPVH7xhCLxaF4YoFybBsSsoxDvPyTFvu+jRhL2JXLvK8UiBHUdmacKNnaCcbQlCW5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net; spf=pass smtp.mailfrom=riseup.net; dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b=r5v4qWLv; arc=none smtp.client-ip=198.252.153.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riseup.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riseup.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=riseup.net header.i=@riseup.net header.b="r5v4qWLv"
Received: from fews01-sea.riseup.net (fews01-sea-pn.riseup.net [10.0.1.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx1.riseup.net (Postfix) with ESMTPS id 4WYSyz5ckCzDqP4;
	Tue, 30 Jul 2024 21:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1722374940; bh=d9DOTRd8kAc5fw35sUzIu6WzsI7yQjrSEqrfuiFNqYU=;
	h=From:To:Cc:Subject:Date:From;
	b=r5v4qWLvY4/kGsvFw1l0EuORSd7UcVGRmb6wgORcG7y1hed/N22dH34KKS9gpgrG+
	 f0iKMvwycIR1QJ+hM2D+QLGIC9Y1iVI74nbC5EgvO/njW6faT7Jmwkf+JpZp4UuQXI
	 iNaBENHjU0RsW47rB0wf1J+pacwFPB6DJMPvy+jc=
X-Riseup-User-ID: 7192E67EA91FC2267A7FC0DECF5ABE72E1EF159850640A75E2FA476C35DB71A3
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews01-sea.riseup.net (Postfix) with ESMTPSA id 4WYSyy0yn3zJtLb;
	Tue, 30 Jul 2024 21:28:57 +0000 (UTC)
From: =?UTF-8?q?Santiago=20Ruano=20Rinc=C3=B3n?= <santiagorr@riseup.net>
To: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: helen.koike@collabora.com,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v3 1/2] staging: media: sdis: move open brace to a new line
Date: Wed, 31 Jul 2024 06:28:53 +0900
Message-Id: <20240730212854.474708-1-santiagorr@riseup.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix checkpatch error "ERROR: open brace '{' following function
definitions go on the next line" in sdis_1.0/ia_css_sdis.host.c:239.

Signed-off-by: Santiago Ruano Rincón <santiagorr@riseup.net>

---
This is one of my first patches. Could you please tell me if is there
anything wrong with it? Thank you.

V3: Insert the change history (including for V2)

V2: Remove spurious [PATCH] header from the Subject, inserted by mistake
---
 .../atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
index bf0a768f8..cabacfc84 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_1.0/ia_css_sdis.host.c
@@ -239,7 +239,8 @@ void ia_css_sdis_clear_coefficients(
 int
 ia_css_get_dvs_statistics(
     struct ia_css_dvs_statistics	       *host_stats,
-    const struct ia_css_isp_dvs_statistics *isp_stats) {
+    const struct ia_css_isp_dvs_statistics *isp_stats)
+{
 	struct ia_css_isp_dvs_statistics_map *map;
 	int ret = 0;
 
-- 
2.39.2

