Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=77.32.148.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794100188;
	b=sMd9NYSRXCB8jJKdBg7Fh3F9ddAUzkiJLyFf3B7uobILZGNtNBcFvuSwOupHw0o8ckRM
	 3ATDwcWDTJzN1lI2JvvUSEq/CovlGXMpJef3HpzslQf3Jhge+J+ek66YVNrka7mWZDtI4
	 6DC3L68p06B+Itxov06pPoeWO0cOEX5Pn7jPO0SHFYieCshY+FVsVqqlDjHvUch0Oa++B
	 +XNxoyF3hXEG45xm801clggTgXemxd/mkltKr1xQBbzgeerd8xgeN8+3vyhEGArcT860F
	 Qc9x/a90Ayu+8dfTv2xq+Tf7qjh41SxIi+06wQx5W8lyLxwNutTDms1D0fR8mvt1XxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794100188;
	h=DMARC-Filter:DKIM-Signature:List-Unsubscribe:X-Mailin-EID:Date:
	 Subject:X-sib-id:Cc:List-Unsubscribe-Post:From:X-CSA-Complaints:To:
	 Message-Id:Origin-messageId:Feedback-ID:Mime-Version:X-Mailer:
	 Content-Transfer-Encoding;
	bh=JklxAbPBaLydgyuBapQPXeWi+Bu2/32FWWJiqNnbyR8=;
	b=JiQnKVRXSrFilrbLmrnyZkI1IZ7Kp4dlM+Eer9xb4DlWP0hXFktHX/Ep/ii/SW9t2NDM
	 /7ZN9vRUJpJKLlbkTmJ/k4GGgf/l1rZ266STv7+tJhewGoon1bJ21KjPu4l5N5AEpqqsk
	 4nbn0M0ylK6ijyPVg7t29XRHVxd0+ZMXGV64TyYWY35pfTa9Gjc3v3k2VMeu3x3mO2b5B
	 44CuLbjSzqtVRAsn6bt3YQoXdxufd5zqwwtAGsmmGSE+Nj1e/yat3fnKa+Z7QflFRtEZm
	 AvJS4OAQ0L0nzQeNPvIw2E4dmviuTJiCpNU6Q9xyhwDrnE8gU89687R1CXuMs/k+o6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=tubot.lat;
	spf=pass smtp.mailfrom=gx.d.sender-sib.com;
	dkim=pass header.d=tubot.lat header.i=@tubot.lat header.a=rsa-sha256 header.s=brevo1 header.b=B4C5SVYd;
	arc=none smtp.remote-ip=77.32.148.24
Received: from gx.d.sender-sib.com (gx.d.sender-sib.com [77.32.148.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA924606A331
	for <linux-staging@lists.linux.dev>; Sun,  8 Nov 2026 01:09:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA924606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tubot.lat
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gx.d.sender-sib.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=tubot.lat header.i=@tubot.lat header.a=rsa-sha256 header.s=brevo1 header.b=B4C5SVYd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tubot.lat;
 q=dns/txt; s=brevo1; bh=JklxAbPBaLydgyuBapQPXeWi+Bu2/32FWWJiqNnbyR8=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=B4C5SVYdIbooUozD8VDsoIvGQZtkqsMUu8VG1BGPBo9WeX64RHgxuJ7j3Xz3o3RoYa906onKwftc
        /RMFXmNx++yC44hRBkU1KGZ+3M/TA8h23mpPEh0cb+2RtZeo9k+sQ1sobwb/xWgZU22QQFr5Vw+X
        LL67/FG/daVSSmYZwp3Ej5bKV4x24Xkusnmu480vDgHxcDpRGR8Qbbtf/SicjM6Hdl/3iIIBOjT+
        KjAz2Ljl2cvgFk4L5tJbA4GY8lq92zYuVjGeOlfxInN+FDQx4oPrKX9K5zX135BtuQ0f0GgUn6Uv
        QrW2rDwAmrXGOrGbJD4KrwmUa0sw1tbI8JZtHA==
X-Mailin-EID: NDczOTMwODc4fmxpbnV4LXN0YWdpbmdAbGlzdHMubGludXguZGV2fjwyMDI2MTEwODAxMDk0MS4xMTIxNDMzLTEtRGVsYXlTeXN0ZW1AdHVib3QubGF0Pn5neC5kLnNlbmRlci1zaWIuY29t
Date: Sat,  7 Nov 2026 17:09:41 -0800
Subject: [PATCH] staging: nvec: convert to DEFINE_SIMPLE_DEV_PM_OPS()
X-sib-id: A9Lmf9iLlegeQ7gMqjTfyvk1X6cyPsXwRE82nP30X2g37x_4nNzU2fyFrmNifw6SbtvAJ7evML6lgtTv-_Oy3nnfVu3n0W4cfDnA_XI-bNqIClGsh9u_MHIAHLkwV8anwnEsqre-JNm36o_23z8paUPNvltO-IMTI31lF030Tt-JjOMuTVqQu6h7tYI
Cc: <ac100@lists.launchpad.net>,  <linux-tegra@vger.kernel.org>,  <linux-staging@lists.linux.dev>,  <linux-kernel@vger.kernel.org>,  "DelaySystem" <delaysystem@tubot.lat>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
From: "DelaySystem" <DelaySystem@tubot.lat>
X-CSA-Complaints: csa-complaints@eco.de
To: <marvin24@gmx.de>,<gregkh@linuxfoundation.org>
Message-Id: <20261108010941.1121433-1-DelaySystem@tubot.lat>
Origin-messageId: <20261108010941.1121433-1-DelaySystem@tubot.lat>
Feedback-ID: 77.32.148.24:11287567_-1:11287567:Sendinblue
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: quoted-printable


Convert the deprecated SIMPLE_DEV_PM_OPS() to DEFINE_SIMPLE_DEV_PM_OPS()
and pm_sleep_ptr() in the nvec core and nvec-mouse drivers.

This lets us drop the CONFIG_PM_SLEEP guards around the suspend and
resume callbacks, and reduces kernel size when CONFIG_PM_SLEEP is
disabled. No functional change.

Signed-off-by: DelaySystem <DelaySystem@tubot.lat>
---
v2: resend in plain text via git send-email; v1 was corrupted by the
webmail send path (HTML part rejected by vger, tabs expanded to spaces).

Build-tested: arm64 defconfig with MFD_NVEC=3Dm and SERIO_NVEC_PS2=3Dm,
under both CONFIG_PM_SLEEP=3Dy and =3Dn; both build with zero warnings.

 drivers/staging/nvec/nvec.c     | 8 ++------
 drivers/staging/nvec/nvec_ps2.c | 6 ++----
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
index 41cbdfdc1da6..afe384cbd960 100644
--- a/drivers/staging/nvec/nvec.c
+++ b/drivers/staging/nvec/nvec.c
@@ -763,14 +763,12 @@ static void tegra_init_i2c_slave(struct nvec_chip *nv=
ec)
 	enable_irq(nvec->irq);
 }
=20
-#ifdef CONFIG_PM_SLEEP
 static void nvec_disable_i2c_slave(struct nvec_chip *nvec)
 {
 	disable_irq(nvec->irq);
 	tegra_i2c_writel(I2C_SL_NEWSL | I2C_SL_NACK, nvec->base + I2C_SL_CNFG);
 	clk_disable_unprepare(nvec->i2c_clk);
 }
-#endif
=20
 static void nvec_power_off(void)
 {
@@ -910,7 +908,6 @@ static void tegra_nvec_remove(struct platform_device *p=
dev)
 		pm_power_off =3D NULL;
 }
=20
-#ifdef CONFIG_PM_SLEEP
 static int nvec_suspend(struct device *dev)
 {
 	int err;
@@ -942,9 +939,8 @@ static int nvec_resume(struct device *dev)
=20
 	return 0;
 }
-#endif
=20
-static SIMPLE_DEV_PM_OPS(nvec_pm_ops, nvec_suspend, nvec_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(nvec_pm_ops, nvec_suspend, nvec_resume);
=20
 /* Match table for of_platform binding */
 static const struct of_device_id nvidia_nvec_of_match[] =3D {
@@ -958,7 +954,7 @@ static struct platform_driver nvec_device_driver =3D {
 	.remove =3D tegra_nvec_remove,
 	.driver  =3D {
 		.name =3D "nvec",
-		.pm =3D &nvec_pm_ops,
+		.pm =3D pm_sleep_ptr(&nvec_pm_ops),
 		.of_match_table =3D nvidia_nvec_of_match,
 	}
 };
diff --git a/drivers/staging/nvec/nvec_ps2.c b/drivers/staging/nvec/nvec_ps=
2.c
index e6234d29e264..2fb34f0d0dca 100644
--- a/drivers/staging/nvec/nvec_ps2.c
+++ b/drivers/staging/nvec/nvec_ps2.c
@@ -134,7 +134,6 @@ static void nvec_mouse_remove(struct platform_device *p=
dev)
 	serio_unregister_port(ps2_dev.ser_dev);
 }
=20
-#ifdef CONFIG_PM_SLEEP
 static int nvec_mouse_suspend(struct device *dev)
 {
 	/* disable mouse */
@@ -156,9 +155,8 @@ static int nvec_mouse_resume(struct device *dev)
=20
 	return 0;
 }
-#endif
=20
-static SIMPLE_DEV_PM_OPS(nvec_mouse_pm_ops, nvec_mouse_suspend,
+static DEFINE_SIMPLE_DEV_PM_OPS(nvec_mouse_pm_ops, nvec_mouse_suspend,
 			 nvec_mouse_resume);
=20
 static struct platform_driver nvec_mouse_driver =3D {
@@ -166,7 +164,7 @@ static struct platform_driver nvec_mouse_driver =3D {
 	.remove =3D nvec_mouse_remove,
 	.driver =3D {
 		.name =3D "nvec-mouse",
-		.pm =3D &nvec_mouse_pm_ops,
+		.pm =3D pm_sleep_ptr(&nvec_mouse_pm_ops),
 	},
 };
=20
--=20
2.34.1


