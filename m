Received: from sonic312-26.consmr.mail.ir2.yahoo.com (sonic312-26.consmr.mail.ir2.yahoo.com [77.238.178.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE342DF137
	for <linux-staging@lists.linux.dev>; Thu, 12 Mar 2026 18:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.178.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773339710; cv=none; b=r9rzY9lNXJjfTqwUAiXPDPuBWe/OVkm0REUQhOAm/vgi2hcVpvYY3DtGLFePxYvHC5rAdOyH8q9fXBAVRcmjv0I12bFPG1Wbj0ZPPEh/3diK5Fz8S+k8+NzCrL+umzsOMJVb4AVlUtF4ntmjtS3J/ba82x3mxHHPF9i/vaIrQOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773339710; c=relaxed/simple;
	bh=uiZNkQrfrAcTwFtj18/WFY2hV7Bn8kQ9HLtmikAh3qM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=FCFelRqIgEJCjZwTB8MrLCKOekkSaruMhzxynaieC7EDK8OzXN4lwSMNPVBuPnI0ht13OCqURYXDR5Xd7qk5+iybmI+9ZlP7MkUh8tvKeN4ZMs875+F4w8AQcu71gk8UazT78ATfOpcUjlUu7UtxbB5oKXnaun4mumnzO4EHn3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=TpmwmhDp; arc=none smtp.client-ip=77.238.178.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="TpmwmhDp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773339699; bh=BTGnmmG37P1hyCZJBm5E0qDJC9JZJfDZCCf/9iKB1qo=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=TpmwmhDpUq37wY2FV683i4kHuUgPbcBsiwh/QQMK9RNAOSQ/sMD6sP/3aBqlLUGEpaB5g2tAHoxVkQujwhy4C8ERjL4jAoyPfllg7N16dnnf262A2+eOrV6RQi/QsJCpkc557omloOAjiHOsUe5scacb2oJFnclkIYo6BwWtrSYIiiba+76DDBfJbTvCfAwEwyfoG7slb+2n3OxDEQNWlSE2MXrP3XqcO8vCgWbpWAX5kzpwEw2zHOkLtM7JBCHKUECIOxxA57E4DBcDWscLiIOAXfjIEbtvbZAzybuXFEKrCiR3XUXGi5QhYlcIYx79x9NnsNDmzAfrHqOPAndtEA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773339699; bh=B7AzpEBZzJlchfoFp+u5jlptcYens6qSZn5td1Hjjtq=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=HMPrExYUXv4UQOXmM7rkwely9vo7mhz+Qh8baUFeFN0xBWo2EmarKbjlqwHifwkTdg05er73w9dVqDgREfB63wBwHr/T2K/M3uylXz1xG5ernOICu5EubS66fmrElmiPyCyUdUaICPCRG1St3rO83ooPVUE4S0X3YYO1ybNZQ0a5N4ayFQLKbgOJr7+WZbx16Yj2Nt8oTg1w4KZjrxkzH87SD0sUAraM+KC8ykbGSrke7cMYQfbNz5p0fcEn4TCRzNMOZ+DIVJJcIq/uunXKqYM1oO/SCvb4riNAQbp/UTNZfvxwihC/QCJzcwZ2VZNzMjL3NGOXTOyzEm5HYq1d3A==
X-YMail-OSG: IBgJZpQVM1npjcVldqFAP1Cw4Y7LDHRcn3l._W4ewq6wpXMrP.xLYSEzO17XtS3
 kSp6JyWr9r2yl8BaHjaabRp3ZNPnZJsHccYBltdeA7NbAPdsErqEZJicWWao_wcE.EgT4Ww3.WcA
 u7R8nnCQf1.7zKCWv_uoPgxSYMG__02fL2HtgAZt1OYYT_2w_l4t_Q4czcvloMNcW3zD2TiJEqlT
 ckeFfVXoOLaxOVSQEBwCRIQ3ZiWcvEMew2XUyb9XWKbOL4gki4N6DCGJJ1ZnwSM0Ln_p0pG5PVXN
 gGXIlZKZao1xgajqbBte_yix10dxL_oT1E2Sa5cAdXw_dG0uGLYP3YYyAWN31_QUZ4hbHBW51NcZ
 uUOGd4TW.Yzkv4OHiRVnG75Ns_4fzdnVNueRf81MGz8kdQeg5DL2v.Zob2Jh.CkWfs2vT7Lq0s2v
 jYkroEbQwmEMRNYxN8_JjbAlyrsy3Dq.MbduyXa8A1qwiVk1sUUlKwhI7.kEyQo7Qo7kp3e8N6QK
 X_klQ7d.otiJ_viSA5w03uauHNdDYqxSo1y1AknHyE7wxTztDrmc7_IekI3FZJxmvI5n9tyY84d2
 BKf_69BdkuxyK5ijBbeC670GjPLoBmO5WQmiBAd5EqIh49uzRET8Csow4RC2oC6RbAtr3OJc8FPM
 CXhqtybShmkx2Y7aRvxb4fdYgsk2shY.BI2BIVZyFIcA7kAWo2l8ikkN8ohjiAe0BnFjmv.VANnx
 kr_mJi4nJHVPZboHI1b82dgKmV88laxj26Sh9KFKtXZ44PO7rUmAT5bFbG5ETq859QC15tofe_I4
 WSODFxHKnBy7ZA8rIoAspknxS27rlqql0tyvNy8ZFmA0.jxya9xx60S8CxE9l0yDfJhye0ym3TR.
 Ia1uKLJLrfjqYHKmgJ1hOv97bMcrnkZfJYK1tW_ncZ0o6GXP6TQfaqRSJ.35VKJUiHbMXdCaJGxP
 1YVhnHzShgMUA7yxY6nideBUFBcJHGaU6IO52x_ktJ7MjBQ12rSbsP3qpQu0RojuFOQXpudd6MYG
 _rOJSqbMx660YW3qQ43L729jfzkRJ.Y4ug.C2mSBW_m8HAxq4keoDddkBGV..q4eYGb2cgsxy3px
 eKA9TZjcSEiBKxvwHUwqCBOZ0V9Y8EboddMZJkCBRIzniK6JW9rtmTN1hv1OSodk_K.8lDcnOn.Z
 YVrZ5dQPNTSRU7atcRF6X2MIVkNgrZ_qwRKT7zJw.dJJzOdKvQin8XVVyiRZmOSs7sJWTMIHlnkL
 cb6ANfghAOCxaVBuXi0zOwqj85GXq99BofaimTgOKyzNhI1IXZh6fmMlL.r1bfjC9pURPgBIuIqM
 J5S4TfMMieKsL3Gf0seV1Od1g2hc6.tgGmXEozkWBbHFF2.RbtX.t9.T8IE8bS40p0.snaRcwzcI
 nFVi0vATBc85bN4tczinxd8o8cIcdmrAoBSoOjVBr9YSzODjGe8__8vge7p7FQguYVjWx001siIn
 PmCevrsBv_Y20sr7jQNsrFb.5xzsguOQah.9nM3YGCCafxShfXMZADYi.4I3abojmJhhjOCm5LiM
 aMbcB0g4QUjaAJGWkTJUEQ.Wx7jxYyRsQDXm5LoTO9ktF2Kc7uj07gZ_HAxTxXuNM1UZWcwJFLHC
 6Ysb2tTZXpZOkCiPTeNY0IBRlpuP9Bl1xXtLazOOWITKAztywA98zaEg4ipWO7CJ3hqihwejiw26
 vfXNXYuK.52kt8KpCPqzMYi9TXHzRw3qSmLfUf9njuHoaAdLO02enixlQ1YXLL.RvXou5UZV9QVJ
 a27WEdd0hMSVFOW.gCASGgEia3iUM5qL4a2Ozg9h5Ih26f55hIFb3b2vqgjP.l27MLVkFYC1N5.j
 Ga32rfSDy6USpgCpqQRZ4v0JeQ5trjeyJGWvuzrx5X478Tm3dyV9zqQME.GysrKLqBE36RWgrQvW
 eq9zmWFp6bieze74tymwVrteRtirxO6z1bzKK9i9aTkcP0JW6I0.zxfReM0gZWjVgiT.hixpNix0
 phbBBR0Ra0m_rHliiOuB4W3pSEOhw0rJm7rP2L_OE9Kbc4U3cICSIsILzkf5.nvKBxEdiI7HFi5w
 6y4LOe8_J_7v5ZjnJ8gOOifF3WfyG0qPcD8VP3MvD7Jbw2qF_tI4RCy91kE8_Gyn5b0z.g5tCHLN
 v8TUL84nSb6p8s3K0153xB9r2GRW5uPfU0r7H1ajr5rjkZPko_zJymPV0UN2GlzLtH36ava720VF
 bkFqqpw28XKZdqiZUp5ItTcW3WgE1.YoqH8YYkzW1GofKl_UCjx3WwT3wEypevzCj8bMp3lyVU.p
 oe.mXHd5LOs3o7TwUllspi55nRjt_eoFdCQ--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 32e708ed-acbb-47ac-ae1a-2f0c7d0e6d8b
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.ir2.yahoo.com with HTTP; Thu, 12 Mar 2026 18:21:39 +0000
Received: by hermes--production-ir2-bbcfb4457-f49j6 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 3ccf00084b4d5413ffcb9d01e92182b0;
          Thu, 12 Mar 2026 18:21:38 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Thu, 12 Mar 2026 19:21:17 +0100
Subject: [PATCH] staging/media/av7110: update FIXME comment for signal
 strength
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-staging-cleanup-v1-1-fdb9f8367e3f@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQqAIBBA4avErBvwh4K6SrSwHG0gTLQikO6et
 PwW7xXIlJgyjE2BRDdnPkKFbBtYNxM8IdtqUEL1QkuF+TSeg8d1JxOuiJYGLZZucWQs1Comcvz
 8x2l+3w/uz6F7YQAAAA==
X-Change-ID: 20260312-staging-cleanup-de930b5bfead
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773339697; l=1160;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=uiZNkQrfrAcTwFtj18/WFY2hV7Bn8kQ9HLtmikAh3qM=;
 b=ENxRsWP1QcjOBnY/QyJw7KDIGRGzvdsG5VkXpSVb5ry1G+rErn6jzN6G57zURtqiw5bCWd+JH
 xFKzvJlyweUCKsMcPnPNfWSxMQJw3JcfGVH69isMqbUVMYR2apkBoZD
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260312-staging-cleanup-v1-1-fdb9f8367e3f.ref@yahoo.pl>

Update the FIXME comment to provide more detail about the future
implementation for computing the signal strength based on the tuner RSSI.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/media/av7110/av7110_v4l.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/av7110/av7110_v4l.c b/drivers/staging/media/av7110/av7110_v4l.c
index 200a7a29ea31..a64761979609 100644
--- a/drivers/staging/media/av7110/av7110_v4l.c
+++ b/drivers/staging/media/av7110/av7110_v4l.c
@@ -310,7 +310,7 @@ static int vidioc_g_tuner(struct file *file, void *fh, struct v4l2_tuner *t)
 		V4L2_TUNER_CAP_LANG1 | V4L2_TUNER_CAP_LANG2 | V4L2_TUNER_CAP_SAP;
 	t->rangelow = 772;	/* 48.25 MHZ / 62.5 kHz = 772, see fi1216mk2-specs, page 2 */
 	t->rangehigh = 13684;	/* 855.25 MHz / 62.5 kHz = 13684 */
-	/* FIXME: add the real signal strength here */
+	/* TODO: compute based on tuner RSSI */
 	t->signal = 0xffff;
 	t->afc = 0;
 

---
base-commit: 80234b5ab240f52fa45d201e899e207b9265ef91
change-id: 20260312-staging-cleanup-de930b5bfead

Best regards,
-- 
Tomasz Unger <tomasz.unger@yahoo.pl>

