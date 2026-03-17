Received: from mail-08.mail-europe.com (mail-08.mail-europe.com [57.129.93.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB623F6611
	for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 17:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.129.93.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773766805; cv=none; b=RLcIuZd0BNNS4zwxrn4rbpXhgWCy4wHGzf9vxAv6yWOokC5GaIsyy1BsuoysTlcxsnwO28+0iq9aQQkKRNK0y2/6ZgDtWYg8sOJsoWbyxsKN40pFGxtCD17MnuVv5l5L/DHNNTEKOPRazAExsYZbmhCVa4kr1FVzpIXJATqvEjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773766805; c=relaxed/simple;
	bh=OV2VMfTLruaQWSgZOWfCX4a2y/OIVRU0xD97xVblPyo=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GxTCDwjvpf48ggQqtGRA+6wCvX52moG0Idbn6zCmTJ41kZ7Lv0GFmxbQrtXFYFbCD/LfkEjFcxN0SV1VMbeIlvdVqSordHQ365iSholoM2A4D5TkuQQ1v0YbZBgpiAZD6UFQDaO/JYeyV1HnYGqcWi6IGz3HPDJzZ8PhJnH++w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=riposetti.com; spf=pass smtp.mailfrom=riposetti.com; dkim=pass (2048-bit key) header.d=riposetti.com header.i=@riposetti.com header.b=l53JC8Fq; arc=none smtp.client-ip=57.129.93.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=riposetti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riposetti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riposetti.com header.i=@riposetti.com header.b="l53JC8Fq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=riposetti.com;
	s=protonmail; t=1773766787; x=1774025987;
	bh=sV5dozjlKtkOeJl8Njz11VTDQnO6ZQvjqnouM6jJ8nE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=l53JC8FqZ8yPG5IBIsm7VS6Q5Mb9WVGWG8D5AKzV2RKuH8BWL1VvmP3XHr9URrUrg
	 cXIdJboplNvvVHOvZXjZDAxQa1yIPpN1JVv4LjXpbn9Lgs311V+Ysz2QvUukVUy3Sc
	 3kKVLAWishEkmzjUy2d8Hqbi1zxA/eqYaFTWjVHILHB69UZ4zwHt9fYBk2H+IuH1k2
	 XfGMS8Qasi+ehJxO/42I4ayySrroapWv8pYr718w7GU29hduWK7G89wyVlOGJfS7TI
	 n3es9W4wLRrUv921FzKs8O2/LpHY+mjuwSuEvzBunxEH5V9ijTDRwwXvxvMDDJDwvr
	 /rnIrJxHoSSVg==
Date: Tue, 17 Mar 2026 16:59:40 +0000
To: gregkh@linuxfoundation.org
From: Andrea Poldi <andrea@riposetti.com>
Cc: daniel.baluta@nxp.com, simona.toaca@nxp.com, d-gole@ti.com, m-chawdhry@ti.com, Andrea Poldi <andrea@riposetti.com>, Khushal Chitturi <khushalchitturi@gmail.com>, Minu Jin <s9430939@naver.com>, Archit Anant <architanant5@gmail.com>, Andy Shevchenko <andriy.shevchenko@intel.com>, Kees Cook <kees@kernel.org>, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: fix line length warning
Message-ID: <20260317165845.12594-1-andrea@riposetti.com>
Feedback-ID: 120562977:user:proton
X-Pm-Message-ID: 58d86777089521ec58217e020cf20f7cad5561d2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Break a long function call across two lines in order to make code
easier to read and also comply with the Linux coding style.

Problem was found using checkpatch.pl tool.

Signed-off-by: Andrea Poldi <andrea@riposetti.com>
---

Note:
* This patch is part of the GSoC2026 application process for device tree bi=
ndings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device=
-Tree-Bindings

 drivers/staging/rtl8723bs/core/rtw_cmd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl=
8723bs/core/rtw_cmd.c
index 8cd2fdbe417d..c1185c25ed36 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1769,7 +1769,8 @@ u8 rtw_drvextra_cmd_hdl(struct adapter *padapter, uns=
igned char *pbuf)
 =09=09rtw_free_assoc_resources(padapter, 1);
 =09=09break;
 =09case C2H_WK_CID:
-=09=09rtw_hal_set_hwreg_with_buf(padapter, HW_VAR_C2H_HANDLE, pdrvextra_cm=
d->pbuf, pdrvextra_cmd->size);
+=09=09rtw_hal_set_hwreg_with_buf(padapter, HW_VAR_C2H_HANDLE,
+=09=09=09=09=09   pdrvextra_cmd->pbuf, pdrvextra_cmd->size);
 =09=09break;
 =09case DM_RA_MSK_WK_CID:
 =09=09rtw_dm_ra_mask_hdl(padapter, (struct sta_info *)pdrvextra_cmd->pbuf)=
;
--=20
2.50.1 (Apple Git-155)


