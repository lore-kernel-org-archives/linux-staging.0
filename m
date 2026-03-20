Received: from sonic306-19.consmr.mail.ir2.yahoo.com (sonic306-19.consmr.mail.ir2.yahoo.com [77.238.176.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDEF35C19B
	for <linux-staging@lists.linux.dev>; Fri, 20 Mar 2026 08:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.176.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773993748; cv=none; b=MIGsJLwR0kdVnIkUKenbZ/J+39QBAz/cKty/rsllnobG2e7Y2jb7BauMDhC1aFHIsvT3sryHgOV6/2vxg/bKGi2aULDTKEmBC1do0lINAL1ypd5Kfhs/L9+nmmoOJ8+maTMh3eUqXaJSNQEpbc4O8ckUibUYoAkDH7sUpVauvxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773993748; c=relaxed/simple;
	bh=hQtt36PCM2IxbOJKeIbIzf5tc+4kHFr4xFRCx/uyxtA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=Dr7dL5P4eq73mAhCIGBaoLgY311fCujfQokr5HwRQRQOIyzL/IeFOhFfujMRf+TwbQIAfO6AhYKtjEUQ/gA+vjVmjJkMNTLE1K1vDWyFefOjMKAquKKUE4+R27K0oR8uC46rgdLCHpfuMY6asoIrxr44plUrlo00t9IRy6Fp91g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=oeHc1V4J; arc=none smtp.client-ip=77.238.176.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="oeHc1V4J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773993744; bh=qaIP3Bm5N1Np7nlfDM2AVn4xKggzuJB4+xlmNs4SdDM=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=oeHc1V4JZFMFlYM/THEpcolVdJAL65h9CN+YHt/HezhuLZl35Xeucv+c6b4eGX2z2T/bnCu0k1hvXqCScHa+LzaLGMhiU180mnwPeAGXtS748yF3Sw1+BLtBLnO7w9UegJYm4fKrfKK9/5fUJTGB02yNr4Pa4IkJY5zGVjHAWQyTWVvtIK3g1iS1lU1ExSVcn9AVeXnd37nd0Pi1OZ/iop2PHzU5YBrdpyu/bw0NzxpneDWPeHx4roijTfIw073gavA8338Lj/8/Oj9k0oxDAeE/aUuQ+m06W8QSak8ZLkue/bQG/WFbHOy0QJ4Khe/pOlaC3Z7Zfuy+xhd/aLi+4w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773993744; bh=w467fZYymiiMohO9JJAe+Tv7mftI0zMgR06EAzl7oMj=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=fzoemP6cslQ0QUf3X3HlKzCVkts+9wnxetOeeGOM4YqSU19VuPmcycwXiQyLCPI058dPoCny5U0DXB7HcT67wEkBzuTj0p0anwFsVTorRswVfNWg4nmhfwzGzFo/M7bBtVRFocWKRFc9iDRW1TGRlJZdNBBZKVD1F17qXbF+8z17l0a+3QyAz+ZhSWldK5qv3dWQriH9X65I2NoG55XQV4bXKKbIFHl+x5LH0Rdq5LCI/ekEdHTTOtkmkNz3Ox1OvS75nyHsXNChgYCvId1T7TD+sGkvNdFCZdOWxJF4cCCnPl6btb4vyoSkXQT15cqBaLTzfMXDapCLq0gxEbO2Ww==
X-YMail-OSG: xbEA50wVM1kVm1Uzr4fSe.ZfOMww5M16hnxak5l8PVIPmINZmOC5fxSekJylp7L
 eA1AEVcNOv9ZIunPKp_Smt6Eo34bTTVgjF_O.Rf90.uOilgbACqn5zF0f44IFny133WJ1eM9LhEf
 lv1ucbZPmLBx4UEIV6.bJxdVMvu.abVQfsbnHo9aGWETnFmdHnMQIYKxr0lDEyWcTcRS2NmB0hdw
 G9dAz5Iol4UEMnYD9qm.BnROJf1Tfzuo0zeM7SJSY4eqRfse7cwv0uhNIl.HtXvd.o6vIHp8fArx
 G7uDXQIIGbeCYZZHpG2bNXiVfmn6pm8xec_zJAEMGdqIpMHZCDchKeHhrBzE6EPOcPh0J_kdGAQA
 QP7Z0DOHUXP5kRWK1mc.sU8kYl1fm3IWm6EACtaJ_qSAzkWlxI.Cjpv14APe1bRWYoVhI.CwhSBh
 tr9XdOYuW8uxm1Yu6W5l9l5qgDf9NsdzjeMK57NJ7i_vctaOPPklZ6Y58DuH9wUbSPn8gWs72IoV
 VwZjLIYOGs7drO6JlJ.wcJKEHJ6Q49SUANoja3OfSTFYEFaAoNt0yXreTWtO_.aHMn3PZNwVYR8H
 iR0KIpfxdTdUNTFc6v3AnelaVH2Fxc2KDtp4LG1dK09DVyTJlTioNIomhwWVTs1fIy70N9jrMDP3
 8T0OQthoDOmS8.aTh_ZD211OAhGVuAOwkfhen_UJq_DySivfl8RlLrVMjAQHsE3VCQIs.4R9kt82
 9TsVdSHvaLdhQyl7lxhDVusfwCb.rTD_KZbuupEWgmxfEzjpnopB20lpmVk4SJWqb2ER.T7aigzL
 vnb2YNTKxl63Lp0p9102tIi1bix.2K6XNlCqH5Z_t92OQGhUf1Jq40Fhdtq9dQKSqvqULpmHDP2H
 hC9..UZPfrGRHAkJC00FtYa4kir4QHoiXxlwID3tCRRPmnyS7gexy.iQSugA1uVykC5MwFUy8RJZ
 fE96WOIzsbyk6itHkzAtRd8MLxGG3hHamyZ29yhlfpjZM4ZN6oePz0urCyXM4KxSjbnSLhOtKdLf
 ziSWp_8jKLxWiPgT7GkiA8r5CdZeUCSglgrWK4oLLP454zLe4UzdZf6xdSL6d8q8CDYYhotfLeRM
 yZCPNGrHGtb.78C8qZ2vSvOraNI0Ze2udj7Xhz79eR5l4v0MbFDqKOT_Vo7HbJ5aZ8xFyhaarbXz
 fO8G0rlKXEuyNxJEDwiwKaKY8arX82glvkGRzQpuzhU7s1LbRj_ow3P0qIEI4wnfJFaZjpFrY1YZ
 AzaxDh9GTnqxRomnL101HtUMAz9QRmF2QnUmjk3GK9.6HL9ItT1CFvLKBslWVa4hamjrKZmJ7V.j
 LCH5BwttU8VLnP7Rl6fOWMBC4.Igi_pzfSNR5Qem_Cfdnpp9oZAGpjduHNGx7TzA3.AeCqRvKGM8
 JlGyLfDLVsR4quOjNFpFScub418qk5YMEDLeqrwLFMXJg9CI2H9q6am3tt.251kZWvvcM3GIgZNU
 BeKqUmrzm0y8xyS6t598aWK.vuwXTNKae9Ehtqsdh.6MGixHuu3FgW8XUcaabkipP9G.IrRLOSXX
 dq6mVU31b2LGUNavkyEOU00fRmb3JwfktMlB5sUC7E6bxhIjMZDEjboQRYGSe6S3HdG3.D6T41qs
 Cg_kGnVKD6VKGqFmYjwX0J4TdcvzXDz5eMDtnuhHKi5IYrKIlPi8NNH.oAhfHVVfARfKJPX9SE3l
 Iy_togCLg.0Ko4JRDkHhUrrXFbEocTD0L3qQkPdVYGSgH6eWADRdrt0pI.eE6pwrUhRnR61b12Jr
 s9pGB.Brdx1ldMGTjdZ80l5Hm.X.VAW.zbfcu3gC8_lKymn.xXKxtsRpWJkAMjstHU_9OT3p2c4O
 wnyFmXFatu7j7NyBHzvpUnsnLm4MVFJBU5I1inGMDlu_q7feAabVaRX0oETAZpG3_gMi6Ziu_cmd
 yF5oN6dg7elSW9_lFdQpZ2_HTweaMfJpYpw4FMoB6qVvcQNL9QGIC4lVBoMf8OZshbT51J2sNoNC
 5uDDFfx6WEZ3fn00eOrA6_FDKDGasJpLpM8.J2s_62GHz0uPleMVgGykPCsLxi8_KMC2_nRxz02X
 a6eVbQ1ld9AUts_OCnqmgq_4iOUZuvhae8wTW4JQ.RFjhvgKsvKhlFtrg8TMe6UeEqPl68WQ8TWy
 B0txJy7aSYzqkBKAhbsYKBNwl_X2pCoKHs0fg46N4WwDvrgr0u0.3mfD9MF77IiNgpMYD7OSzWf7
 TGw19_SIQ9pPMBCjEi97XpzUtgtrsCqOX84.d_l3nnmbVelLK1BX_XeZSCWEzOLI9l3AojDYkA8h
 LBeN5nJYa36eRjPLmAaCa6JQZ2qowWWt4fiSOxvM-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: b2cda573-15ac-4c3b-9a70-1d02571b337e
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.ir2.yahoo.com with HTTP; Fri, 20 Mar 2026 08:02:24 +0000
Received: by hermes--production-ir2-bbcfb4457-796l5 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 28e8f1a3e0417791532239883a375e71;
          Fri, 20 Mar 2026 07:31:56 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Fri, 20 Mar 2026 08:31:54 +0100
Subject: [PATCH] staging: media: av7110: remove dead code in av7110.c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-av7110-dead-code-v1-1-70ad36eba662@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MSwqAMAxF0a1IxgbS+sWtiINinpqJSgsiiHu3O
 DyDex9KiIZEQ/FQxGXJjj3DlQXNW9hXsGk2efGtVF44XJ1zwoqgPB8KRiPB142i6oVydkYsdv/
 LcXrfD8Rl1fNiAAAA
X-Change-ID: 20260320-av7110-dead-code-e50a245de380
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773991916; l=878;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=hQtt36PCM2IxbOJKeIbIzf5tc+4kHFr4xFRCx/uyxtA=;
 b=+6MqPfiAxchkRWEEu+A72/e+IynS+DBpExyXwmrfXnun41uoIZJubyx5msgfF6KfY+SpgfeN0
 JAmzSNwVU2uB2/sSD/aeLvyzEg88QimR2E3su+GWHsv60hYa7cRx/wu
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260320-av7110-dead-code-v1-1-70ad36eba662.ref@yahoo.pl>

Remove commented-out line of dead code that serves no purpose.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Checked with scripts/checkpatch.pl - no errors, no warnings.
---
 drivers/staging/media/av7110/av7110.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/av7110/av7110.c b/drivers/staging/media/av7110/av7110.c
index 607992100baf..c4d54d10d753 100644
--- a/drivers/staging/media/av7110/av7110.c
+++ b/drivers/staging/media/av7110/av7110.c
@@ -762,7 +762,6 @@ static int StartHWFilter(struct dvb_demux_filter *dvbdmxfilter)
 	u16 buf[20];
 	int ret, i;
 	u16 handle;
-//	u16 mode = 0x0320;
 	u16 mode = 0xb96a;
 
 	dprintk(4, "%p\n", av7110);

---
base-commit: 82e1c68ac206efe42854296c462aa83f541ea22c
change-id: 20260320-av7110-dead-code-e50a245de380

Best regards,
-- 
Tomasz Unger <tomasz.unger@yahoo.pl>

