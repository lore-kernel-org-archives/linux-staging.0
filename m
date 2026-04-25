Received: from sonic313-20.consmr.mail.ir2.yahoo.com (sonic313-20.consmr.mail.ir2.yahoo.com [77.238.179.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2134A1DF73C
	for <linux-staging@lists.linux.dev>; Sat, 25 Apr 2026 10:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.179.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777114463; cv=none; b=ubZjtnOIfhZlKlue5kfjBQ5M8Sw5KWlJ8k5CrG+lX0ey4BPeRXL+ovom+wVtfvxcCli3/1/iv0YbAqjmHrOgdDe0ATDBRY92dsJ9l7XFhRdJaQL8+CUexBZQ3LTKObMgbZzbs1ZYl6WTYizsQkXQjmjQ7oRbPAAvh9nIVy1Vvpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777114463; c=relaxed/simple;
	bh=+ku/a+4nr0zQWDANZaP2afrAcx+aGSH6EXjBTIYdUmg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=EDEohgKEiC0FVPKTRacmafVwnnXj3iHMSZpVwu6nzBfF+4xaRb9yyAYAHtWdO0mGuQFG8bybf3csGbqzpC5hVZvJ+A/MMurnGT2UKfcch7toc54t31iKAVE/JexVeAoa6cA6od3g6Lxbe8+h3+d8ozwBSa0LOoHCQRF15K6C+gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=s4C/BeWG; arc=none smtp.client-ip=77.238.179.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="s4C/BeWG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1777114460; bh=dgWe6lU1p3t1mqUvUApDNSJpSB96TldhXWlxyy8ysxE=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=s4C/BeWG3gv2ZdUn1EHQkM5IPnerltqxvV9CAwOCeF010CkQQjoiEol8fl+dkrS8pk/vajM8eukaHxNvhVi6YcvcA3KvFRV4Fiivyc2tDgAuOZZE0znPcdlkbhFB8t5mCaE9THBLpacCExOWRZ0esJiIhCyv+CRmpo8PNLuezRukZQ3JLpZqofwjRC1HSU0yWFvVap5adD/GiRz8oR0cAgivE9EZ02/DxJ5GblScH7tfQQjLCek4PeASVheHTknVlhTpQ56QTzoteRb4isJP5eFTjPXxKbzgLrX71KkFhX01DtpG7YlcdCeQxKhLXRMNIYXQrYevSV1RaZyVn52s9w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1777114460; bh=PL3WCs2KYVhpslhrcF7qBaKDOVH5DIL5+yE3rJcZM0U=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=lTKNnPMAmCIAgn5Eqi+rIV+72/MkOYfx8hUqKpZ8svlGXbY7+G6L4pRpK7HgJn4coxWYGAsE2VGvEHMeB8JrweTDx1goV/IP0GSmobL17r71S3pOmWBdrK4h9ZbISO2/FlBZbNvpNgFewX+g0keFOZ/SdT3XZvamqFpXewTLH5UX9v9S56IJPn6sT3yDGSHhAp7OWV5Vf0UPn1YeGKlyMh6mxZ6i8IC/vljSjoykVOWv8zgU20cyCAevR3ncbgxIXLGzCicXWdU1jYgXlBWVcsxLYtSAB1MyRxlAWStDCNVsUWv7YrbVnR/dVGRvPcTNTcxB/Or9mO5fA13DdFW9ZA==
X-YMail-OSG: oHKPHSIVM1l6tXvbQu4jniqHWiqjSTLubu8Aj5veDioyPenhP.XV2MwD1SlIdBY
 t7oDZm7XtcT0Xb0Bywuk2GGtQkNwvSQ7zchQ3h16YukcCnL1WbXDVvuldmBug7b8xErdiTDsye15
 iAbsaNoT2whPpLEk.ZFb8y11YlPoOuPnr9oTyFrnhfvNOXMDb8ZtmvjLK0F9tcnbOz7TQ2pVfpew
 xUq..3LB8nZJgfgYAw8aiSrlC8LjzJ9WbTGgXLw2K.nqpMjaDQQiMPie6TguwtaLPziUFCt.dkcT
 Ye75Og5L.CyjSbiiNYzVxE7X9l5oOpn_GrKlAiWYG9afxQdaJy8wTOOfK19tlAWiOYMCNsimt7H9
 Z0IfhG8hWBhstKt86.pJPw25lkKlfVVylqnWvUkVviPpbG6BqJaZZfdSoijsBm99M3ZblWm52uzE
 L3dnVAP7lju8SV.whwEEcVPTuD92spJOAEq2ZZzxYqqHthbrPzPzcxUla5GbBpin1q5jNf5OWlsY
 uyXbQKh4xoQwLEiqrySXdeBkWASp30kCp9Gfxnjd.hpDWMC1hfRREoO5_P6i4qFfYgybFBNccLTw
 r10yFQVLBEI6jdIMZxlpje_U.gNbbA2n4BoJIzJ8h73i5cwgmiNJmxqDEimPiwuizq8NR1ICdL1J
 yd5ERkt_wIVSOGPv60.TTYMjSKBUYdwn6zj6ph6ih3UYK1s5Yz9brsr3.ZEbRQJ3xDp3ngZVVq1k
 YUboZHH_Wrp_XfvvDa43S5vRGzYTbT2NZ99cyubqew7vp8gMvLmVVsipOSqMxm32WoHCWJfRJooe
 7yTcTyoFtz5mNVG1C1TrtYiqau0F8qYsLZPefaW3RoDw_ac4hZuonZrbjD60moM4j9aOkBARoMtn
 G77P7s9bXwo3t7JCRT6LZey3zh76lVTkibcU1dwp4s_Z8YX2pHwjdA07xdxUrY0v5dEmM8Vq8PLD
 UMNA4Ky9eJqEtVix798Se5KbAHeJGy6dIwTbu3odW19Us55jcUb9sZOXuxYvdZBdpaBsl36iw2Xe
 7ZVnzNWIzHvoP6IfhP4uRM2hW5UZp_jHNYsXqDuoJcwOQL.DXIOeD_LussQtt8my0EPKamdRhD0Y
 8Ote8wlf0cJFEU34Xhy3YiMbvhtu856GwxuVR5wLYAxES29T99OUufOmVWFlJmpA1rZ0Y4kQi0ZI
 OGrrSwu0BgWFT3Bo_wQaK8z7Ju5fyQQ9bbxEot8TjxwVeyxPifNN2AAGu5aB.AKvwKNeOwdWpa9x
 3QWsA2dgmUCKYFf.pTpOlqIuZb3vS2tzDktb4wNjITppJ09XeUsSwUD7XIYFlRXyR6nx_G2OO1c1
 z9lFA7mOahliW9i69hTgaCczZ.NYXDs2OLBtOSl0A8PMAmuslHoE2DyAGIx7yE2xAu91PZ0iZiSv
 jitWP4rtEnCKLj9dS1QwQxPegXwngsLo7LEUzepuBXAEjfhDF0fbWZ4t_U5ExuHJEzwsrDGT51ub
 BruTTU8v5.W6t1ijLdiklLmQytxKvGy9QExRn9cXNMZVOeb7MKRr_267qK8fI2EkdkCET9h7WoKT
 KG0fikMbXssvDrk4xTVr.tgey4MaXAc27tZd7Zo1GNFzVY.a9Zge8.asD_nN8oDt9k5B5GVI6zln
 PhORxVOw00K8MPjv4GodKIdSp7yWumlvV1ruQZbhQL_FiVkZGEN0MqCygcqD6U7ekek2oa3DNW7U
 Y.XCVITHd99NootzumOe.fvukZIkhP56WCy_jqtvFv5goVRNrsLeJhpTEAQP53lkw3dNI66VuRgI
 BWKfXCx4Y1qJrjB5Ur8zXAoyMOyKHk0pJz_jC0zU4XkY7hEK6nV_eiZ.jMF.VoP0l_E00bgi0ho4
 komwtYb5ffaMjIuHbCYQ2D5tpcJq8yk6vq_e6.lrqeG1g2S3jAvMYwhwu1_iY9ZdSZnM8fwgblFQ
 kP7gy7CkZkXttf679SjA6bYaqN9AshG7xEwsyv8ynIBmuIFMduQQ.N0R9ZVS0p2VHVZJ3y9isb5V
 1.z2pzHTy.WK3sjgdoyYMdpye.Mp0xbjiqcMlEE9wRnuvToC0SKHoSzsbdmx0tFgThqsljRsd2_X
 bK4rsMNWjlr1yJyQJpyBjsRDcgtMgLntHzhaY4uOC5kcB1Lg.f5RqFqXR0p279LRlfAUdIsd5V..
 s.3th9skCVXSfIyJ6TeavvnRtvO.9UUFBjHn95KgBdEZReoMXzRR_iUMOM6fsFrHm2eWCscvWasx
 7TYgbxcnLgTiPAeh1OVzC4rG3MGUi.b3qhXD.rPxZouknawHS7cK5rQnl4_mXkDyQ1JMLdBLR6_e
 6IGRCEdsl8gwrB1BVHGDdt2rdrJ8kVPHrWA5P
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: aec62254-987c-4565-8041-de158bd81302
Received: from sonic.gate.mail.ne1.yahoo.com by sonic313.consmr.mail.ir2.yahoo.com with HTTP; Sat, 25 Apr 2026 10:54:20 +0000
Received: by hermes--production-ir2-89844b765-fcdgd (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 6dba02b77df0017c6e65044697a472c6;
          Sat, 25 Apr 2026 10:22:57 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Sat, 25 Apr 2026 12:22:37 +0200
Subject: [PATCH] staging: media: atomisp: fix typo "stablization" in
 comments
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260425-atomisp-fix-typo-stabilization-v1-1-92f31b43ba63@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWN0QrCMAxFf2Xk2cBaZ2H+ivjQrZlGdC1NFHXs3
 436eODccxcQqkwC+2aBSg8WzrOB2zQwnuN8IuRkDL71oe38DqPmG0vBiZ+or5JRNA585XdUm2J
 wk+/ctu9DSmCRUsnM38Hh+Ge5Dxca9VuFdf0AppgNjYIAAAA=
X-Change-ID: 20260425-atomisp-fix-typo-stabilization-61f2413996dd
To: Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777112576; l=2810;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=+ku/a+4nr0zQWDANZaP2afrAcx+aGSH6EXjBTIYdUmg=;
 b=ljU+IbANmCuztvG86w4xsn/bkn7fD+NbG5ifKtgRNBXBku/5Bev+dfjlsOTD27G+30VPbVAQJ
 03CfwvJJELpDup1Pg4He4qkSwv/PpQxlX5+kHgGs4L9m3oYzYku/Ijm
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260425-atomisp-fix-typo-stabilization-v1-1-92f31b43ba63.ref@yahoo.pl>

Fix a repeated typo "stablization" -> "stabilization" in comments
across three files. Found with codespell.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c          | 4 ++--
 drivers/staging/media/atomisp/pci/atomisp_cmd.h          | 2 +-
 drivers/staging/media/atomisp/pci/atomisp_compat_css20.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index fec369575d88..47e2b5f317e1 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1575,7 +1575,7 @@ int atomisp_set_dis_vector(struct atomisp_sub_device *asd,
 }
 
 /*
- * Function to set/get image stablization statistics
+ * Function to set/get image stabilization statistics
  */
 int atomisp_get_dis_stat(struct atomisp_sub_device *asd,
 			 struct atomisp_dis_statistics *stats)
@@ -3232,7 +3232,7 @@ int atomisp_bad_pixel_param(struct atomisp_sub_device *asd, int flag,
 }
 
 /*
- * Function to enable/disable video image stablization
+ * Function to enable/disable video image stabilization
  */
 int atomisp_video_stable(struct atomisp_sub_device *asd, int flag,
 			 __s32 *value)
diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.h b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
index 82199dc9284e..d3d1f2574e77 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.h
@@ -153,7 +153,7 @@ int atomisp_bad_pixel(struct atomisp_sub_device *asd, int flag,
 int atomisp_bad_pixel_param(struct atomisp_sub_device *asd, int flag,
 			    struct atomisp_dp_config *config);
 
-/* Function to enable/disable video image stablization */
+/* Function to enable/disable video image stabilization */
 int atomisp_video_stable(struct atomisp_sub_device *asd, int flag,
 			 __s32 *value);
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index be5f37f4a6fd..eb5b3d91e58c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -3002,7 +3002,7 @@ int atomisp_css_get_zoom_factor(struct atomisp_sub_device *asd,
 }
 
 /*
- * Function to set/get image stablization statistics
+ * Function to set/get image stabilization statistics
  */
 int atomisp_css_get_dis_stat(struct atomisp_sub_device *asd,
 			     struct atomisp_dis_statistics *stats)

---
base-commit: 27d128c1cff64c3b8012cc56dd5a1391bb4f1821
change-id: 20260425-atomisp-fix-typo-stabilization-61f2413996dd

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

