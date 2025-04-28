Received: from sonic301-19.consmr.mail.sg3.yahoo.com (sonic301-19.consmr.mail.sg3.yahoo.com [106.10.242.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7491805E
	for <linux-staging@lists.linux.dev>; Mon, 28 Apr 2025 03:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=106.10.242.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745812009; cv=none; b=EfUJsDhnsPEE50y3dk3O0mcqo9q+QICHK1IvIHEEth6YzeqqRLPBfFpvS6hqPrhyOCTl73DgjMLbdOeNaUKB/zdj2SWI6RnVB1tNFGZ1fh59v/qmF+iZ0hTHOrGgdy8kAYRVEAAubdfnIYFMGqfD6KyW0bdUKtSNfJS79ZtQTm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745812009; c=relaxed/simple;
	bh=ytCSVh1x7fzqauwZWVe+jVI3SjMWwrYR38KWfkI68jY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=Zig0yRlxtXykpIHoJKyvLgWxfs1evE5NqZjetwLKezAE3l77Coj2iTUf6LuFeaRIp473i5JVbm3WVwX843DGCsRbuHr5hlT8C8mUVIO8u1dU1KydWC+k2Td/SZLqEgJkIxkfn13IzgOCVo492jtTEl9hhp6OxSWuYok9eznPXLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=cs1oZcw+; arc=none smtp.client-ip=106.10.242.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="cs1oZcw+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1745812004; bh=mI6ZmHq/9Z/LvS4QCtHcL2AN75rBIOzyhvy0PxtfgT4=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=cs1oZcw+jDqE2hfH29B440EG2RCQJ3JO6r/cRsqVBHzr11m2eE4+kmfs6YfpFxTdS6KgnXTTuzoNz6bwjHZ98ItRbzDZzFhIhaknc9Odm0+9UbSFjLAP8aVpqfwx55q1ElKhJVWtLKtr/0yOcW/Z76vPkzbkUoA9mSR3lmnqJMttrMbuuM7vff1vZsZwuN6IapQo+BxSgtGJ+Q7U/d5dlXlbNGdloNtlxMHsRVwuzoYd3BKaklHUJomD4SLR8dNTymAuAU8rCUVkFq5XCzBtv2q9ZBnco3WMpKfEjJXeLdlQ5frfAAak522ehuwsblIpc2j7YpRgfzr4829LnTS3Xw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1745812004; bh=9xeDHCN/k4FyjYttxmFmyGc9n02H8yyo8iFlujl72GT=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=SYGAGw5sS3u9wvPrzAwD4BL4gFrJynU1uGdNyuxXONatoC3s9+HHnNcas3oqDRBPTWnljegZZWDdJ5t43JXUmDWl4D4e4gNSwx/Sg2tbgWJnG85etgEm2+SfygYSuhmKKgt65lkdxCFib7jqUt/B2ltnpLJtZVhVsWY+VykhWWcJ9zPLl1n0QyYzaVxWaN2gNchNGjObU3EooZLTkicIDC4XK431lwnh9fmYcHe5sqPnJ/oDuxu7ybPdY0jpj6Igo3nzbU5UjEZ5zd3eEoIvZDrcIEfO6+JqaeMPOA6FkKiHZ2BycU0gr5k1TrKQeRjh5tJABEifMyuYR4jlB8ATAA==
X-YMail-OSG: ixRZ_FoVM1kex.EHOgBfTueB4fjWz9mCqqvf9mrsUSdQtZcV.2k4E7LdKviOprn
 tDt8yGeMXnvqblvnIBqzQxZ7FU1kAc_GgGXnstcLb72.xIC1y_XaRxY1grmtho65Hh7NdPkG1Wyu
 aX8mUx93PAq60cDssOQFsP7.J9PEDWdE68vOffkEoHdIlJVPSmXr2XeJHGRGXsMG.86XSw4Iel_1
 jpnGSxM3JwzuhrcHoTwSoMzAk4q63zFmIxYeX9AV5qoqGDO7KRQFYC76rSd9RK9VsU1EH2f.iJoL
 c7LWVfqmJH9NufAKfUAr4b64EOsJ0h.Z0Vz7JYztx0Eb1m1flW9WscLGnngWULsekTch0PaFYeEr
 XX6155F8JP7cNuciZTN8vwTR4GnAGSknad96XqD6sOTsBZNQq8Cs5oOlDjCacsZ5Kl3zqY.rGJSq
 obWVR887G2x1hHUuENF_SgvnyBAnSOWPObiY5fXYYPweRFjWo57iwyULW66f.Zp3f7q4jViFiTBT
 n18RLP9FDktgZ6qnZ6ei7j7ul6mRUrGBvhOSwGY5F88NYTVZo1pChk0wl2sfnu1VCnCVkdyav0J0
 bllICX0h5LYBF72N_J_OsoB7lMhKpVJwSMS903kjEje5E3t5qlVbK3Sgwacbj3eg26gJBQ4mQ4w.
 x1iPwN_w15buWIkuVqewy5toOJV99hrgNJVW.1kSPxcY21HejZ6nwCnhOC1iFs6L.TwC3Y_HYHmW
 uLDtSo9WvHQDaHpbz3FaWJuM5y_X5mhJ4MWqD82uwujqjmpFoKNBBVmsivnenga320F7EnFPAJRL
 1wqMGnotmK6MHqmkw5vhazR1B7CjJZE4b3KPOuQf7oFTDodm1LtbMfei6Ht3ApLZjRDVn6g3kwXb
 tduzbwoH2iqBV_ccMDpfciLs7ZBCkcjOO3JFgbY4nXgdoLfn1wLxEbvsTBp01YGzmzbEYsnk0sNU
 HUDdGnkPt3li2gZcslLrDzD2D5LZe0gvI0txivxSng.G3XQGRBAamNZE5mUrKyvw6VMWS8esypQ9
 kIjAD_RpYO2e8pO30dfvU_5mOxqw3aD2XOyWZNVAWaQpYF6yvuF4KU.O4vhOFKfioADyTIQqYrfa
 Ovy_r8fqxF6cKBit.eWwnz6D2wDroE5K4PoTADg4VYF3y50JbKmN2T2LBlK.KIWz5J6PdFqDYt_u
 RgjdgS0CfyycfXRfTJGu_BT_eDE.kn_OQ9RGdLXCLuqWcdR_u9VlFh5EzhIikzLnptwn0H5VIjo1
 6K9WeKNydOfp9OFfLwi2Pb_yZ9IzjbDg3lBH4DAS.U4yVzL.jcI0OD0DOLsR8kQGGbM9RcSaZegY
 4fKw.KPY3L13YAkkpiWbGOa8AmwwiqCMlh4YTh327nZGPlvmw.zUAjo9d8LmpiiETfasalcqA_Ju
 Q9TikoWZmzi5Mp5saJ5t3Ilkyj1__L4w.7dR2Al8v8mNR3rvXvyTETvQ.S4Toze_JCL7nXTdug9j
 NK.5nAvdHlNA4hm.BQHz6eqR20vu4vJQTrJUuQzJpoatq3UcnTfjokFMV4hutRg.gtqLMOgRaUJT
 DmxNhaLQjHwJa_.y52tNGh94hXFscnN2zKAc_pKfNnfBcfq4WQv7ROgz919w0tOSkXkwYm1WFRX3
 u5s5ZfDoEqaUxWSzANQnU2hskn0umhW4LYFWIAKIyM5iBnmXS3yt6G1NkhyQL14naA46YfLcjDxn
 gTSrfywqvPOdegoeLACFDbPm.7A8m2mAxdHZVo8EB0U_vWfnI5vHWSEmXHdlE57n3tIVscm_ULBu
 BCUTA9UDpXJzT.Sex8wDeEb7IM.meOD4K0Rjr67kSnm2X0EBqx6Ajr_0rz_UZ5UgjnPl_vAIu4FZ
 OTnSK3PINDe8rW8qQlxHmLb1pFiFYrb_.zwmVFGsf6tgbfCcr6vdsU3Rd2kXeDOUccIwwhB9nwSX
 7pZvB6tboDr3ZunFGh.rMbORAGjkbWPV1BpA0DR.ngeMzRmCKcGuiKeyiHmPrhbyjyut0fkEvDiG
 0bHAIdUaVONIEVMU8_e.mi.oExh8fDidF6RatjOdyYak8z7r5PL5By8oSUBB2f9JCqDZboWBhFQ0
 OtF7WM5GPqEx14JSVYRU5zaedyQzFyxzKRD4r3yXZ4DNsoOpIK2BDwajDHTJ76lXPm4.u89e2lAT
 Q9pjW6knWBLAtLZimTE0E6RhLyZsWbyEN8xjr88zRq4LWqdHRb1fwsPGul6UaGQnlsiB6q.wjXVE
 -
X-Sonic-MF: <sridhar.arra@yahoo.com>
X-Sonic-ID: 5684e6fe-b652-4dff-afbc-b4c0db631f1c
Received: from sonic.gate.mail.ne1.yahoo.com by sonic301.consmr.mail.sg3.yahoo.com with HTTP; Mon, 28 Apr 2025 03:46:44 +0000
Received: by hermes--production-sg3-cdfd77c9c-gk59v (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID afa159ae805fe852c8d53bb3d7a5b8da;
          Mon, 28 Apr 2025 03:26:25 +0000 (UTC)
From: Sridhar Arra <sridhar.arra@yahoo.com>
To: linux-staging@lists.linux.dev
Cc: Sridhar Arra <sridhar.arra@yahoo.com>
Subject: [PATCH] drivers/staging: Fix indentation and add mutex comment in fw-management.c
Date: Mon, 28 Apr 2025 08:56:21 +0530
Message-ID: <20250428032621.656795-1-sridhar.arra@yahoo.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250428032621.656795-1-sridhar.arra.ref@yahoo.com>

Signed-off-by: Sridhar Arra <sridhar.arra@yahoo.com>
---
 drivers/staging/greybus/fw-management.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
index a47385175582..f59c5c7fd590 100644
--- a/drivers/staging/greybus/fw-management.c
+++ b/drivers/staging/greybus/fw-management.c
@@ -28,6 +28,7 @@ struct fw_mgmt {
 
 	/* Common id-map for interface and backend firmware requests */
 	struct ida		id_map;
+	/* Mutex to protect access to firmware management operations */
 	struct mutex		mutex;
 	struct completion	completion;
 	struct cdev		cdev;
@@ -448,7 +449,8 @@ static int fw_mgmt_ioctl(struct fw_mgmt *fw_mgmt, unsigned int cmd,
 			return -EFAULT;
 
 		ret = fw_mgmt_load_and_validate_operation(fw_mgmt,
-				intf_load.load_method, intf_load.firmware_tag);
+							  intf_load.load_method,
+							  intf_load.firmware_tag);
 		if (ret)
 			return ret;
 
-- 
2.43.0

