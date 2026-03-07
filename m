Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C563081D6
	for <linux-staging@lists.linux.dev>; Sat,  7 Mar 2026 06:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772864737; cv=none; b=Fuft56ea43NgCg8yw0B4LnTW/E6xeOWiTEA3s6cXREVLyyU3+feu/zvwld+Vccc4pivvkilNbP4udPjLmlwpGsQ7EaSKEqSqv0UCqitEDTzL0pCX1pX5Pm403f8cCQUUP4axixz7FCGTydz0/Qow8R+x4HTwtwKNF1CanQi3slU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772864737; c=relaxed/simple;
	bh=7GXPB5tPIENL1r010383M94Fh8cc+1SaXwJPoDMp1a0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UYdZx6xwKvUzUKaerMCKUPbX6QFNYFBiOcLYC+bVJ9Mhe+xEDjko8U14kFYmSqyuXjEG82pfQjCHSepYpTlCT69fDVGrZLwgFEO4sjSIDqP9sxmpsJmtkadbkhVzwig+ZaUyBzLdp7V5HvRjhmHNQhhKqR9E9yrLw2xmunB6zw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mZ7buHQj; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mZ7buHQj"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-829a9c03780so1126673b3a.1
        for <linux-staging@lists.linux.dev>; Fri, 06 Mar 2026 22:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772864735; x=1773469535; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hV+qom7OsL2lmYdSGEPwQnrfWB7wQ9siJwxTvLW3avw=;
        b=mZ7buHQjoV74aNVwHuASjR+kY9V1DtUP7rxaNCKpSuVydohZZttt5BSRTCDMNPUFDx
         iyufwB5VoJgQVhy/UbRfxUoLgiFOEbhdGk+dTY9TJ2wS9cTPKNv9knJZKX7KM1Wb662E
         lMf2h4Pod92pzCD2iMkjT37Y7H8BUt37kvvxxVERngjjbDpJdjClDSWlDq5daJ9XpPTa
         4A4zG0cQzny/xtonwZbez0x1ICvXZ5WrsZgz7sOiYyYlgK/48z/MNHWL2ytAUbSlmcsV
         hda1hPbyuPIljgMjfuaK0bMHZbxwoPJzPbWyBpm/BA2glYdMVxxQZ37Mc6nhJxynBYlz
         UTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772864735; x=1773469535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hV+qom7OsL2lmYdSGEPwQnrfWB7wQ9siJwxTvLW3avw=;
        b=Gzm5d0AfQQAcTDL1ylkgAAX/n7KSLvKhyYm6S+6hC9YQHAt7eskheX+n+t2bGDqqrg
         OwyxVZd7qgZP11GGAv+vNKQGyIVL1CdL5dlwBIbqvtxDEOgy+MImbDOkVzTLhP/XwgJ7
         BVWRuP1v9qU2J59+Xe/57VDK10QC6jd9DVnMXgGUFeXS5kKnexRY5gFEn1RwFeh99F68
         SOwnCRLa7yAuIzNm83z7l5TUwCa/gN3HyAkFlHi3LuMzBRgPmPELdOiLR+Gw2y4aCBVu
         7iXJF3uJ/i8Xp1Tc2MRxxnHReixQrZDVr73qG0saIh5zADL2g3bIBPYs1cul2C+jr1J2
         Sexw==
X-Gm-Message-State: AOJu0YwKPEvAlGgKtf7GuQpnfcwq+H3PAhqi7hG/M6x8LKAvp3Qu2fnt
	83FXfsiHykwESo/ekgdvvGeyENpIWitydnIPciI4f1kk0w6iqpa4PHINJj57RBGSqbc=
X-Gm-Gg: ATEYQzyd+nThBzXXATgQ3dfDhCCYToBOyGFdVBo3Nea4yu5DI1y0JrcATaHfCtDuLuz
	pIHqzYKJMCQtSve4YFrN+zfwrslBZhLF96kK4f5J4Hf2H8HNMRIXuXa7QWYlrmh40ajzAc9S0Dq
	doCW6yxWYwftlwGzr5xkxxUsHK+BP/aW9Swv5HlCwHsoE3CISu5MyuH2RcBR9hUgwRDUCwSXSXT
	d4wlvUBOZV3Dy8DT9YCd+CAuZxIVivkbRzmw11MgmJvoa/Fvja9uCNfTrPPusjClhs1RDGa+yW7
	3cdxLH3E2frY66tPCASFFF3SC4wLVXSxSBebYEZf45z/pt4vfy39BYRa65cWaYta3/ZxUpqJ9j5
	yYJldzJmfU9JfjqcFthLgvaej1mbCtRH4UAsm1xcYiOTztbkfvfVAqcN3ij50uvNn99D2tDL6W0
	5umtkAp65jdT8MZilsQ+xWPzJ6M3fr73OjLWpi37VkJbIKYPqKAyiD0XWCvtFiHGm3pzmt83w/x
	324s0EBfX1X02w+
X-Received: by 2002:a05:6a00:c95:b0:823:edd:20b9 with SMTP id d2e1a72fcca58-829a2fa9676mr4591649b3a.61.1772864735289;
        Fri, 06 Mar 2026 22:25:35 -0800 (PST)
Received: from tower (c-73-37-64-97.hsd1.or.comcast.net. [73.37.64.97])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a4866a72sm3451754b3a.36.2026.03.06.22.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 22:25:34 -0800 (PST)
From: Mark Adamenko <marusik.adamenko@gmail.com>
To: linux-staging@lists.linux.dev
Cc: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Adamenko <marusik.adamenko@gmail.com>
Subject: [PATCH] staging: media: imx: fix parenthesis ending checks
Date: Fri,  6 Mar 2026 22:23:53 -0800
Message-ID: <20260307062353.22069-1-marusik.adamenko@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove 4 checks for ending with a parenthesis by removing
unnecessary line breaks, and forward declare a variable for a function
call that would otherwise remain over 80 columns.

Signed-off-by: Mark Adamenko <marusik.adamenko@gmail.com>
---
v2: remove empty line
---
---
 drivers/staging/media/imx/imx-ic-prpencvf.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
index 77360bfe081a..2339b59af7b0 100644
--- a/drivers/staging/media/imx/imx-ic-prpencvf.c
+++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
@@ -315,8 +315,7 @@ static void prp_setup_vb2_buf(struct prp_priv *priv, dma_addr_t *phys)
 		buf = imx_media_capture_device_next_buf(vdev);
 		if (buf) {
 			priv->active_vb2_buf[i] = buf;
-			phys[i] = vb2_dma_contig_plane_dma_addr(
-				&buf->vbuf.vb2_buf, 0);
+			phys[i] = vb2_dma_contig_plane_dma_addr(&buf->vbuf.vb2_buf, 0);
 		} else {
 			priv->active_vb2_buf[i] = NULL;
 			phys[i] = priv->underrun_buf.phys;
@@ -704,11 +703,9 @@ static int prp_start(struct prp_priv *priv)
 	}
 
 	if (ipu_rot_mode_is_irt(priv->rot_mode))
-		priv->eof_irq = ipu_idmac_channel_irq(
-			ic_priv->ipu, priv->rot_out_ch, IPU_IRQ_EOF);
+		priv->eof_irq = ipu_idmac_channel_irq(ic_priv->ipu, priv->rot_out_ch, IPU_IRQ_EOF);
 	else
-		priv->eof_irq = ipu_idmac_channel_irq(
-			ic_priv->ipu, priv->out_ch, IPU_IRQ_EOF);
+		priv->eof_irq = ipu_idmac_channel_irq(ic_priv->ipu, priv->out_ch, IPU_IRQ_EOF);
 
 	ret = devm_request_irq(ic_priv->ipu_dev, priv->eof_irq,
 			       prp_eof_interrupt, 0,
@@ -750,7 +747,7 @@ static int prp_start(struct prp_priv *priv)
 static void prp_stop(struct prp_priv *priv)
 {
 	struct imx_ic_priv *ic_priv = priv->ic_priv;
-	unsigned long flags;
+	unsigned long flags, timeout_in_jiffies;
 	int ret;
 
 	/* mark next EOF interrupt as the last before stream off */
@@ -761,9 +758,8 @@ static void prp_stop(struct prp_priv *priv)
 	/*
 	 * and then wait for interrupt handler to mark completion.
 	 */
-	ret = wait_for_completion_timeout(
-		&priv->last_eof_comp,
-		msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT));
+	timeout_in_jiffies = msecs_to_jiffies(IMX_MEDIA_EOF_TIMEOUT);
+	ret = wait_for_completion_timeout(&priv->last_eof_comp, timeout_in_jiffies);
 	if (ret == 0)
 		v4l2_warn(&ic_priv->sd, "wait last EOF timeout\n");
 
-- 
2.53.0

