Received: from sonic307-53.consmr.mail.ir2.yahoo.com (sonic307-53.consmr.mail.ir2.yahoo.com [87.248.110.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB702F28FF
	for <linux-staging@lists.linux.dev>; Fri, 13 Mar 2026 07:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.248.110.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773388166; cv=none; b=SG9w7q8153GqrsGJ5RAwbFGNJfSAUMRmWjgwJVT9VcEcErr6or4Ycqr0Ow0EhSmdCaELPSIlZQw+QmozPg2TskyOXLGegDgbZb3XJxF2D4xQGW+mQrhhUP7gyrckbWKiqHBm1ApiUX4TIQgmq8LWmpXfyrakRP3w/x85DXYqI/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773388166; c=relaxed/simple;
	bh=rnGCQPWQA4n/Bjvv6keJvlbHiIUTQW87yQ3f7/wVmsg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=NbU2dpIgUAz+XVt4b55XkJFeQv2lU/PBrlaEx2BZdiVxcIxgFWPTgmKpWmw0owasMWYEhJ1vWLnhooeGUWndLAl9gXlCzFp/0a8MPmCzELZF9gVJqaLEjSNsPzsZqMtSj5eAxbTgpy9OFMaXFqykh/4zjeBtH+BX6fcMjloO5y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=nwVKDbvF; arc=none smtp.client-ip=87.248.110.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="nwVKDbvF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773388161; bh=SQnN+C/BrXIYCmReKNHrdNkFUsdSw/jVAftWsFeFmHo=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=nwVKDbvFJlOUg9Nx4egSaQxXyycQ17InMqXddyLEJcoNsHI4VANKesP+w3oxfcaLF+EnqBf9qoLstYaelKyYsDdejBupWr/Uai0xW9WalT33iP/ZQfOyGLIGN7wpBwx70U4EhuSCEBtJgbPSi5WArNa+f3kX4h6q5liFDarI60+H+70XzRKsvubs2qTnCplr+veU77qRfzMD0+ZrXvT3bO2s0oYjIgmVLRcibCG+HHEsuRQZ2DQYjQvLvdfK6RqqRDqtzKaZRoR3IJqy57XG/fac+19XSjie7i6LPXxrw+jxd2aHLwLzKQ9xqKjnSy13KgAOpVeohw0JacS0eIz7Pg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773388161; bh=/iX8UY6HDQ72/Xo11hzqwH3vzUXaOzuo0rTdQx44Yed=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=YutuFxvOwU3S4MOWT30JIqsJoKYR4VuvLlu8Uxf+atWBDeSch9UTP+6XAD68DXvNkeIKSRT1UP6Kfjwhf07nnUZnxA/F71K0qx0fE9Xcf2jI4JOnmbwtuMMtZcV5Mynq+Up2k8HsgM7QSPIckiS4mFhD24nnFcozq8e54vIe6kQV7C42cI65/N+wdn2yHU/R3OJnEIPfxWIwi29fkwL4bFhppdGigzIEWxYbQquY/u9q7KW3lb20qp57+jwm3TPZbbPNXIffWzGBOH6K4hsR3au6br946D1f7DVjTkDAiNm29l9JtruMNDIu5BebYeFt3qS5QOvAoKGvVKURePZj+w==
X-YMail-OSG: rwQRke0VM1kFfVKWopHHjvGDglWTs8ztlOOZxJKEsyI2ehHI5dlZlD.sn09vnvF
 tPj4Vafks08hHS2NvFq2v395orC9tBcDs9AdJ7ODmSOuea.HkcI3tFSExLiks6bK7phPjOb.3UWE
 nBHnPpzGmMTvPa93Rp8ejshe6MXLW7q4N26OMarFBSxt5WwqG4f05p3GgWpEWvC9aImIqxIyJdI.
 vros9hI38dmH_Ko2Og3AAOfoGe1ZtJ0p_WkBLHhl..G2XxVSXWGeX5V_MV_NU2C1hMilv1blwj.T
 jZidAGSIn5M2j7xJNylvScHaLkt25bzSRgegk2z.paMd5MuPd_.B2NG6.nAUALod2w3POh7hO1H0
 5Qw9iM72D0NPPzSvzC_G.qYY2zLotY.2HNYj7PcPDIl.wn3Fr0ZGEGqdf88swDbxg3N.WcgdLii3
 jZOjLsvUvx5JrAIXb.y3BuML5yHZUF1h_DR08GVd_RiOemZSgcQPKKjx8yxOkueKNvTxAQGPp6B0
 skK1W5IeUw3t4PsDqtV3k2W0CC2QPkWL7E2Jc.v2NnL3c5gsVN.hf26PSYgh9.c23UU2BiV5M7B0
 vevF.3IwJhKAFr9apqys3miA5Mwvd1pw0sqooum_qi3b8xzP6ZZBEnKX.rXRt4.hcQTKeIedA85S
 I9k1yNbHPoWj_bnmhkTIiXKwAZi9BoweMOfJTSmk4aMeS4o9HTcXNYvJjWByJXIpBe2dR44DmeVC
 Mn2VpB7_ceJGevWxH8M74GtxJG.xkQe07AlqJiWwFNEaE2i39g.a78avymDZJt1EQGlUGvnmKVUp
 3nk52DCGnv6SJ8mw7l68W8qZXVJhdE_1iuU1mfCFjYB6nADGRxIJ9MTsBTavrkfz0yKRmJflDg2a
 5WT9RBECyIKRYK9dDE.62xfFPq00ZWiskpc0mouHAnbTMIMrYSFPzVlhIHw27d13NBnWKSmJaai3
 NwXpGSV640gtPVL2g49YVHVmL7rrtH0v9SZN42nW205EETBcqgBXSzFjPVAN8O08limmkWwWK6Y4
 N0pME3SZFfA7pmyBs2HIin7bHGB_q11VYx3lrbsEM4_g3y69Oqp8O6lOCBP2P7qUPjO_4W_0ptVZ
 BAD0x7I_AFPW1jz_EsZp8Hk8Y5IGCjkT_uH7cA2QPanMuSpL_YQebZ0ClIbvKAmSGwh0YG.fzaDN
 wZz4QwW0P1wZH9T9nW2VXppDHt7N_PEQkZ075pdw0MGmbkaEmkhXvaK9YuNl138vgKtIrha8CDr0
 mtOtNThQ55Vd7LrCCf2MzrtVjbjuJ2WB_nhWswvDJIv.rba55tPvlb3cqf_7JjTrYXepwhfZE2lz
 RPbKZlQVF9YZ3tQreSepw8UCPUSJzEv9t2XeUTjjiEKbDjkE.hFNC_mo8evIF0v8zUse9bC36oU1
 1E_HiqJF9TbSyMgnykUvML6aWZR0dBRjVzefb25GIXB4bFkuz05zl6UVn_Sr9sjbT_8zAivM6k9J
 zCTZWI_CLliZcJXxoeKliD0v6L9pN1nHnSUOqYS6wQxfAXdjXC_6Y.TzNAYDZ_HeuN9pgk8E5cXa
 Y1QRh7L8B0VQYU80vzCiY8K6jmbxjDtA2JtUZr2aoaQ26ME37UDbd753LVR1ml7YVFL9.S.F4Cxa
 sS3hKZhJnJa.zoIXgrBCBknbnW6F3ZghR2E8J.kieU8hHETUyOwYKH3y3uekvGUgF_Vip3UlP45t
 WwWOo8OUmYaFOKIAuU5zaBw8YawNUKzB.nLZEAFk7VmsQEDLRFM0yLT4BkROlfJcnLo4mUqdK0EG
 Rmvn3ZZjIpamly4ZKIW1mEmatTk9fXFoxSlL5bCuBEB5Y3B2WYACLb3YKrKwckAlZU5nh_Dp8WMg
 Xym0QciT9lqMrZlRSySi8it7zk7SL9zextP5tFWQ66iiXaT7kSm21WMqqHN.lra8q355XcRiPfa3
 UvWJw0xlMqdhjWirFaxSU29LM6QC4Y47ieinTmPGwpfeeQ4hQiFjD1RX7_YuoGG0lJGruTNzCmiK
 CixLsROX7feNbCloRuY8OLFTScB.fC90g1flQOuGVSX9LX__okzB.c_65iMk5uVqayPk7Q9b05mW
 oZVsgz80pZgsVJXrwIrR6u26ZEi38vMTo5q1nhSYt1C2emHGRhbDK_fMtjIW6n7xhdu7FL8yPv8V
 XhBNOlbNTz6brYGEl131eYSAWESf910MlBcEOIU534IGILI4RwL3crFhi5ZascuUcso_wl8kH0IX
 uuSzBr829K67yihkHsF0mAWfh2zRM4PYiwOAMsLSWf3jTiFsljOIuMOPiriEcYH9woTMGBpnxRGy
 r155LjqRGunCv18s_B_THJW0Fng7laB6pVQ--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 2ca73ae8-24a6-4a47-8a0f-79f59662be0c
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ir2.yahoo.com with HTTP; Fri, 13 Mar 2026 07:49:21 +0000
Received: by hermes--production-ir2-bbcfb4457-c8c4b (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID db11ebeee954aaba4505377b1fc08410;
          Fri, 13 Mar 2026 07:39:11 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Fri, 13 Mar 2026 08:39:07 +0100
Subject: [PATCH v2] media: staging: av7110: update FIXME comment for signal
 strength
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-staging-cleanup-v2-1-31074aba2688@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNywqDMBBFf0Vm3Sl5UFu78j+Ki2gmZkASSaxUx
 H9v6r7Lc+Ceu0OmxJThWe2QaOXMMRRQlwoGb8JIyLYwKKFqoaXCvJiRw4jDRCa8Z7TUaNHfekf
 GQlnNiRx/zuKrK+w5LzFt58Eqf/Z/a5Uo0dm+cQ9d30m7djM+xus8QXccxxeAAR2UrQAAAA==
X-Change-ID: 20260312-staging-cleanup-de930b5bfead
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773387550; l=1336;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=rnGCQPWQA4n/Bjvv6keJvlbHiIUTQW87yQ3f7/wVmsg=;
 b=FUWuLRctJDw0GDiyGO8xb/BDOyHE0Q5z22szi5bJz9eoYBMqlwdcP8ZnrqL2Zh36DO5ZlSbMV
 +usoGr7qqIUBIgeV6jB2jxjkPmJzXwpoBzK3386NtUSmgAoDplD3M15
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260313-staging-cleanup-v2-1-31074aba2688.ref@yahoo.pl>

Update the FIXME comment to provide more detail about the future
implementation for computing the signal strength based on the tuner RSSI.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Changes in v2:
- Fix subject prefix to use 'media: staging: av7110:' format
- Link to v1: https://lore.kernel.org/r/20260312-staging-cleanup-v1-1-fdb9f8367e3f@yahoo.pl
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

