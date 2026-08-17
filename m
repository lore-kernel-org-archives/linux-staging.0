Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E4344E64A
	for <linux-staging@lists.linux.dev>; Mon, 17 Aug 2026 16:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.82.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786984622; cv=none; b=M9GeJusrYYBTW9JWqXszsdS6M4lvHZVCD4dNL8C2tVPDmU/rkCy3Xhsn8ke4RBhBZAEJTaSn4k63I2BRgMDLzSlwJjHjCEMARaZTX31NfeliaYXN1Q98PuRMwmIoZRGDzc1PurzfFYo3ngQ5S2iNrHPeSta5o43en2SGahM8nus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786984622; c=relaxed/simple;
	bh=yvC5gn26WU1S0C0UA5hufxazmu5RDMK9HHaHz9Ary6o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=nxP4e5n5CBa8Ua/PGbdcs4Ec4VaNC6OD10O42cLZOXWKSf2cpZGYRwUjIKcycvekAZQ4CPW+vPFlRVrMmiNJPJgPB9wC5pfGLRUItTdoKrYmzASBUeAG+s4jBgGsIodHn+6WcZ82rwaq/+TO39KR/TtX/7yErl1Au6a7w73gHHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=gObUeknz; arc=none smtp.client-ip=34.2.82.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="gObUeknz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1786984619; bh=Y42NnNgt289QqY1enCu6A4Z+h5ixFR1iRkl/uq4We3Y=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=gObUeknz/+4qy/NWgxBRBOXRYuf8iQvBqgmhQfc5YqneKvrCPoxgXoFYW8w23LMFPM98y5/juGX2J4P3WneSOe5cIcvzr6xC8+V96GqnrdY4BSSInykL89yTyaq+pnw5WMFIWgOfq/V7RclkN4+dvYtflKn0aajMeXcQtcIWQvVzU1cDvx1PB1zmmRCxFYyVMDFOfEDFNMUPWmY2ZnzHxBZKr58BUGHWhbhabzV7+lNpY8HUZ0Y7AO/CDCfKR6SIMNqgJ/22RVWP7W8dk8+sUfYlm7RVvliBBPqet1r6x46vzl07ipo1lnNKzqEtEHBV2Q4XQaMoU7kwj1Soerwhcg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1786984619; bh=I8yXxTXoUFn/KcRKNECNOB++LkF7yYtgtjc82QMkM/K=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=MSmNRnytmCMDP89xxWpiFoF3Xl1Tl+p+m92ilYypCAySsy4m4F9oejpWMBGjs0Q8SBNR2Md7Ub1eZ4njIjbXa0AVL8ciEnCLlNeZG8QQbWHW6pKMGGzwUd5iTyydRuRIxJ/o3kN+iiNWCY+ME4j29dIuiipwLQxu4inMGIUEO/q+Yw/tCCOanCzlCUiJF9aL0oX4zpBCDCG4mgXNvRcYK1mWeaiDmsG0wA3kRZBtnnOcB66ppB705BRrpVhzh6c897av5qk23Ik2oMh6BlmWNSQUKuGy9bMjnWj6HiXNVFCnhIbYRIy08Jb60lMGqroNYUUEZCr6IbZ5ERoXdlshug==
X-YMail-OSG: 9ylLxw4VM1k6Ya3jK.DI2baiYXlLe7Qi5Tjypiwe22cgXjHLZHo_bdecnot7_HN
 z_kioxqL_fxAPrNlhkvcbklfM5fsa_6ax2tJBx_PXQyKX2nlLr0Thr06SD9n4oyaDSKCFLDUjvK9
 I7IfgzKjOnPCIkHQ_1kK6NoCb2jHcxWL7gxNIrIdNomniXGOiTGeFurN3IkrPFGTH03xriBKwu.U
 HXrEyPELMsRve3jas3ifPC1Ps.8Y9dWHb4F1aJ352_aLZBq749Zk3eQ_UhR3h367npBJO7XnU0wG
 bFczYhf5kpPmyRfiE2zhj2jHeXl3EpTvpwKZbNc99fILYzUOceLWzwscqGs0V22IwSIa8iWH6qh6
 RocHUxkufv71etS_pIQmrLk8jpsvNKihO8.1dWXRSd.NCZn16j1hHPVoC6yYEkSASkYVDcam9rx_
 SIvF62NidJO5549RlJ0sSeKgMRYuuVPV94n5G_3I61OYpPGTJv_rQ_T_IHLRxMOTjmX5FKU_r_Ox
 NtVfU.NQvAaHPGuYEQePl3kGeF5ukW.p0gKKMWoOqLv6uG.zgiWq6druUnWYedRKlGdaG0gOFtbL
 ZPcFKdQST31PiQtBP12laKrIplhtRVy7U.5aZ09zY11Sb53hWHCO.NkIpyY4Z76uCCiT.4Hl7JHo
 EDm8FViJizFPj.iClA6O6O4sZSrOACpTBR5nZfvSmzEemKF1ph.56dSVPSta3FwEMZryzXY89CFX
 Wv0tPntp6uABysMamSVyNsKOPOkfMCULwC8536Dx1ojWmEcoMMpEx_Yqa0JIuyhNssk8agt7DsOB
 8I.qU7Nfpp5F6HhipZ3fNKIhgKijZ8l6x6I0MTXtUa8BQ_5QAcoFkoTWmbBAUEnUmcuSfF19VQ1N
 jo.giYp0Y1SICxV8blcK2_dxYpp933tnrL5QmfgesF7DGGjJKd6c5SBNgC_tGDORyp_DshBItkVC
 __VYJfqLv_wZ1tUNMrwGfss6zMOPmWEZM58_KnUm4cAfPk0b1KMUioS5lidLyVTlrl9YIFJzf6ZW
 Pi5eEWndYAxHAQ00sVZoKt3lDLhr8DAojU2J_VC4emSfuhjS.dlKKyLCFp3Kv1k3ynOAn_mc8WJE
 BJBYlfJFqKcJ6sUuD9eTAmvHKj7F4dipIbAbrS7cP7jRpmgEhMF89UVMiDgNMIkDioNVdGtn9w6g
 Ynqno6iZxXZVAUZuRFr6iFGvt5_QkndxB3Dbumr.U9BL529Qfjna6k8PtG5Lz92Sz7uap29T0zof
 e9v3FoW_xjgJK2NKc2d1VFKTQsNIxP5dBqCkti9Mn.IfSx5FZsDuuIIcHm4XxdSVNuW7Z.Uy3xLm
 YFB4t2ac82OkNV6qHTjdd9w4InQfSo.auMcjATL90OCRLNY0Y_34Nq7WXJ6QaVS.z04Oe7dWLWBE
 sO9h2OKeopI0xMC7jvka9wfEcLeMFoXcip3xSHPbBVfy1xx_HWQm4pjaV4e7lUccR1izsvCdF1kC
 6XznDBc7g7HDkPtFbj2WUkfJeWWTuVj9lQatJW4T8vNe8kOsnr5IDnLMxbbtXN2Ye.hvd3cicufc
 cBxk2.XUEj8IWgJzFG9VAB9rBZ1eVKMknLJnhiLPdNnIFo0FixdX6CR4zwx3rCyMaq4dzNXXkiDi
 ItYyx8loQ4_t4H2DqsLThx0IohCwW4q9FLuywgKhtwKci4amPygUneD8c8KVavgzKfzzluek3K75
 hkTvNL2wcosJIaXm6GB8ZXv1tkfVLvamuQZxEU3IR3NZoX3XAyDXMBuS2xZQgk3BaIH_waWxjRPG
 F4oNf.MB4j3lJLMv7HKppf7_mTzSRmfxuCrI.rP4HmIiTGxFIIydNTDAhCLSjoy8iZrSwbLYLwWv
 .Cbaku_yq4n_Q_B2kqjc5kIbYU_TcS2gYuiYNUxJRxZNKta51vCI34ClglwzEpOADudUujqF3sEA
 SPaasFWCID1NkEgVUaNfdfA7NGqpVBdN8jZSsSog61FsonwSBA22GpUIbESDAXl7Y9s0bRvcUr.c
 lYEFS2ITvE7vqPo4lk3kSZ57z6SeMQ1_5f6_fW5oV83gum9lelv69o0hb5.uS
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 74fe472d-b04a-49ea-bb1e-dd5a091b1f1a
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-101 with HTTP; Mon, 17 Aug 2026 16:36:59 +0000
Received: from dip24.lsn.ir2.yahoo.com ([87.248.99.33])
          by hello (SMTP) with SMTP ID 9e1be4391e7256f2a55869d251e40a27;
          Mon, 17 Aug 2026 16:36:54 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Mon, 17 Aug 2026 18:36:52 +0200
Subject: [PATCH] staging: rtl8723bs: remove unnecessary void * casts in
 odm_DynamicBBPowerSaving.c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-rtl8723bs-void-cast-bbpower-v1-1-e40c57ec7ad0@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQrCMAwA0F8ZORtYqqzDXxEPbZdpRNaRdFMY+
 3erHt/lbWCswgbnZgPlVUzyVEGHBtI9TDdGGarBta5re/Ko5dl7d4yGa5YBU7CCMc75xYqpc/5
 ERG4MHuowK4/y/u2X69+2xAen8i1h3z9b6ou7fwAAAA==
X-Change-ID: 20260817-rtl8723bs-void-cast-bbpower-c62741112fa7
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786984614; l=1800;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=yvC5gn26WU1S0C0UA5hufxazmu5RDMK9HHaHz9Ary6o=;
 b=RbTdMPHBmTetih0kV4ksMS0Ii3MCLyXQpuki6Lsih4e/w8a5SfryLwMzM9a2fmzhEq/ioZwjj
 LlCOQOtmnFJCI12fKIVDR+Otydm3feh7V1L0EIcF0x2penX8W3xzAXX
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260817-rtl8723bs-void-cast-bbpower-v1-1-e40c57ec7ad0.ref@yahoo.pl>

The conversion from void pointer to any other pointer type is
guaranteed by the C programming language, so the explicit casts
from pDM_VOID to struct dm_odm_t * are unnecessary.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Verified with checkpatch.pl - no errors or warnings.
Compiled the rtl8723bs module successfully with CONFIG_RTL8723BS=m.
Module loads without errors in a QEMU environment (verified via
insmod and lsmod). This confirms the module loads cleanly but does
not exercise the changed code path, which would require the actual
RTL8723BS hardware.
---
 drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.c b/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.c
index ba6357c6a7ed..5dee700f3888 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.c
+++ b/drivers/staging/rtl8723bs/hal/odm_DynamicBBPowerSaving.c
@@ -9,7 +9,7 @@
 
 void odm_DynamicBBPowerSavingInit(void *pDM_VOID)
 {
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
+	struct dm_odm_t *pDM_Odm = pDM_VOID;
 	struct ps_t *pDM_PSTable = &pDM_Odm->DM_PSTable;
 
 	pDM_PSTable->PreCCAState = CCA_MAX;
@@ -22,7 +22,7 @@ void odm_DynamicBBPowerSavingInit(void *pDM_VOID)
 
 void ODM_RF_Saving(void *pDM_VOID, u8 bForceInNormal)
 {
-	struct dm_odm_t *pDM_Odm = (struct dm_odm_t *)pDM_VOID;
+	struct dm_odm_t *pDM_Odm = pDM_VOID;
 	struct ps_t *pDM_PSTable = &pDM_Odm->DM_PSTable;
 	u8 Rssi_Up_bound = 30;
 	u8 Rssi_Low_bound = 25;

---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260817-rtl8723bs-void-cast-bbpower-c62741112fa7

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

