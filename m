Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AE479FD
	for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 00:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724286239; cv=none; b=ryjef1nRrTG7JZAwLI7yNSyldpAvT734E0tVeQ3cmSBloAhoegn9AoV14QzTjHTSdgmX89zZK3F1lF1i4tGKpvnC9iVzJIPBAisXqP08rvnTQK9uisqnCISBVHCL9UlTp9g980w8cSaYXCgksqVM9MW3NtvnhERDQuhZA3Pc+oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724286239; c=relaxed/simple;
	bh=rfQIt6yrRhb9t4G12CePLYsvrES22E9sLirarAwlNdM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Y9zP9hWZbzUovt8TG+gTSLQ55Y7e8fEQmPLKuyqgWQeYAlUqvJdRmnL4y4qEMhBcaeCbtetCya2nmp6lW8YHmPzB3fKNFMLSNq/MnP2nHiArfV4WESd2kFRBDqrpEn3qgkUs+0OMfP8tP04ysUHkURNX+FTNDcgIKTWW0F6H8HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lkcamp.dev; spf=pass smtp.mailfrom=lkcamp.dev; dkim=pass (2048-bit key) header.d=lkcamp.dev header.i=@lkcamp.dev header.b=Q89nzcDc; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=r2GtIk26; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lkcamp.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lkcamp.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lkcamp.dev header.i=@lkcamp.dev header.b="Q89nzcDc";
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="r2GtIk26"
DKIM-Signature: a=rsa-sha256; b=Q89nzcDcEJWtbZt8P6NA8izuzaR4WhiWyAUsT0jnOm8wvbgXNW70UJDNvZhgYeYrc3mla+8bbKDDfYUr8S+qlYgBnTbYAxi58vtrxIdFi+mujA0gco+8DkfDUHJX32PHaIJGdoiN3mSBczwRIJnJSb09/Gjw/G+Phw72X2+X9pc3IyuZpcq+lqLRDvEAseNLSGjzDzKCf/25biQMutZTIBMEdKH3+9YEqX6f8+8J+yXOF56c2DWo6t3rjRrAaH/HwKkSZi+Z934kSep+jfT0OShN7MaS/hPtgomUdGeVtQsM9bIQvRCL73BRk0LX+4KvZhfoYfMAXeDVvCMdLhL/Cw==; s=purelymail2; d=lkcamp.dev; v=1; bh=rfQIt6yrRhb9t4G12CePLYsvrES22E9sLirarAwlNdM=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=r2GtIk26jrQWFXyEnNA1Q+h/mtC9Ev5W92tdHnCZkEswb0/F1ISN423v83I9HRdl04fc1Y5uUctRkB4x69pc+AGlchGots9HZTU+vvsc8PW62b+3Jp5jZMzoXntGLbmyLUrLLAsncy15G+emEgae8Z6r9YwXmcGrxZ3LlW6hylQk6NN9J4Qr9Vue7CnZylouw0+35Orn7SJdUDjiCE5vXDcsAZ8b92eGJxepAELNWUKyDskqXehAoY69PX2C69uxGFlUEazDTqI8Z4Vn0KQ2oYAhDTCF/9eLT8ziushT/BNn5KknTAPAA24mR3u77w/5J0swL7CGGpV3Nmw3km1QcQ==; s=purelymail2; d=purelymail.com; v=1; bh=rfQIt6yrRhb9t4G12CePLYsvrES22E9sLirarAwlNdM=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 40580:7130:null:purelymail
X-Pm-Original-To: linux-staging@lists.linux.dev
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2138234990;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Thu, 22 Aug 2024 00:23:48 +0000 (UTC)
From: Vinicius Peixoto <vpeixoto@lkcamp.dev>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH] staging: rtl8192e: Fix parenthesis alignment
Date: Wed, 21 Aug 2024 21:23:43 -0300
Message-ID: <20240822002346.94433-1-vpeixoto@lkcamp.dev>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8

Fix parenthesis alignment in rtl92e_init_gain in order to silence the
following checkpatch warning:

CHECK: Alignment should match open parenthesis

Signed-off-by: Vinicius Peixoto <vpeixoto@lkcamp.dev>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/stagi=
ng/rtl8192e/rtl8192e/r8192E_phy.c
index 18b948d4d86d..ddb0004198cc 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -944,19 +944,19 @@ void rtl92e_init_gain(struct net_device *dev, u8 Oper=
ation)
 =09=09case IG_Restore:
 =09=09=09BitMask =3D 0x7f;
 =09=09=09rtl92e_set_bb_reg(dev, rOFDM0_XAAGCCore1, BitMask,
-=09=09=09=09=09 (u32)priv->initgain_backup.xaagccore1);
+=09=09=09=09=09  (u32)priv->initgain_backup.xaagccore1);
 =09=09=09rtl92e_set_bb_reg(dev, rOFDM0_XBAGCCore1, BitMask,
-=09=09=09=09=09 (u32)priv->initgain_backup.xbagccore1);
+=09=09=09=09=09  (u32)priv->initgain_backup.xbagccore1);
 =09=09=09rtl92e_set_bb_reg(dev, rOFDM0_XCAGCCore1, BitMask,
-=09=09=09=09=09 (u32)priv->initgain_backup.xcagccore1);
+=09=09=09=09=09  (u32)priv->initgain_backup.xcagccore1);
 =09=09=09rtl92e_set_bb_reg(dev, rOFDM0_XDAGCCore1, BitMask,
-=09=09=09=09=09 (u32)priv->initgain_backup.xdagccore1);
+=09=09=09=09=09  (u32)priv->initgain_backup.xdagccore1);
 =09=09=09BitMask  =3D bMaskByte2;
 =09=09=09rtl92e_set_bb_reg(dev, rCCK0_CCA, BitMask,
-=09=09=09=09=09 (u32)priv->initgain_backup.cca);
+=09=09=09=09=09  (u32)priv->initgain_backup.cca);
=20
 =09=09=09rtl92e_set_tx_power(dev,
-=09=09=09=09=09 priv->rtllib->current_network.channel);
+=09=09=09=09=09    priv->rtllib->current_network.channel);
 =09=09=09break;
 =09=09}
 =09}
--=20
2.46.0

