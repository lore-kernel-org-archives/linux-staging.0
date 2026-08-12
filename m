Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A28C3CA4A8
	for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 15:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.82.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786550086; cv=none; b=Yd9dXTtXoklnze2rvbBOoN58WimrHs025h0LiW0PLGihlvrB6Rs7hPW5pfhMRwazzCtHQZssefmIRPegcL+zWRbGg5dlmMTt0bOIef4huMtIe6fN2/SV4KUGokhZDdWTxnGnZRwGdNoOhaH9nBR0YbQhaiNl6KHvSmxUXdQchnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786550086; c=relaxed/simple;
	bh=WhyxJST2R372ONHs8/vWqXzDAcTpEusnQyOqkx5armY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=DgJzmt3gL0j6g+vpPWtwCj0t8tQP6D6pMtunak+OI7m/ZKhVlA4p+T8AQTE68jP9x7817s/NDCse0BA8gbQfqQvRWx5R8b77FMtlFrOxOaPgoU/2QQ3JWIah67O+vWLhVpy8/Z0gi5AnosuT6iuP+9kuOmLMgzMDeL21/XL5qJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=j+0IPi+V; arc=none smtp.client-ip=34.2.82.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="j+0IPi+V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1786550083; bh=ZTNWcZI3iJqw6dIcRPdqORsXLNwyh/ryow8/n498Y4M=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=j+0IPi+V1jofk4CLCu/gb5KDpa1G0nBsZZTFAFnH4oZv4MZ2Ihp5TjraVQFLeOxEGGfm/EnsiWIfw00PHEgOks/X1+BIQz7OsFpOGUX4JmRCQSlkIxFeIKDqjEkqYLRo2JBDzG2gdDxU/Rh0QSt9EHPwaAxiqBw60wGpHr0Pk5Feh9c0Qy0oNvi36JZGMpJGeC1MAVhHwxTT1kwRfbXDBDcPKLoZYGLmDOx5W8FXmUnsuFDY/N5cPxiug3T9KI3O6QPVKzx8cROk35JDg3IichdVtOPHf8hPPNLgkQ93BWrSCpnjNXXSChJgVJ1qClSBzXlwnWhQgTjTYUk2WGJnRA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1786550083; bh=qW/YR5JT7Ce1zr5fe990bGj1o5aw/4QCIgpRWgPud6A=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=aGQExsESTmZTxdzLQ/M3VJg5Bwtk1qXqXLtP4dlPHGP8dmzNuYsP5fk8d6lWDHGYQ7BTy7mB6n3D0xjzg/rJ8JSJQf+zUckoMq5XSO1Ba5AO/O6Nnv0FW8+rIrnouv6u+TS62RVXu7m3vcTneR9648UzaUEIKKvNBL49W08V3eOknVwpmRF9oQTO3E1Rl4Zm48ymLq8mVsqdOUbeoAFKqpxYaFXUkKK6VIeoFQY6W5q9dZVDX8svT4Q8hNxjrbXuuSt3fbvNCjtBpM+lsh4NEwJiI08ogtjYtaKST1Mqgjh3OfDRM8HpW+Ni5FBgopcXq1y3hl3Ds8pBag3Hd3gEfA==
X-YMail-OSG: M1GdR34VM1nlURpLeXUN5Mm.Czl5N5W2SWy3tWfGdMzd0YV9JNVIW2LMTRe_uLT
 K2chWJXvJSLaMmngTJA_O4vW.mydvFRuFr0hw60N.D0g08W_fl0P_A6PJlkgnWok5yIw9N3QGAiT
 MPb4nsfXTO9at6Stl5lSKZ5Lgcfxe1IbeCFba9M0E5QCXwtmoFdBVqEXvVuq5CTQC37dw8_N597y
 GFpmXsVufIxPi4YmGF4VVc5BwXdA_skSbBg3QjU4LaXoAYOO8PwB4c6HdiY_2BNl295yEd.GTKe3
 DwbuELOv3pSraAnzTc2wpCBYYmoD8AKYzVjAf3UQOgcWYdfDEjF_Jy3kf_AoqQxLbay_03Hs8Vnf
 IuCZfnOX96kfb_3y5fHBeZvzc8I7pR9nhvEtayw0SipstsSs7wakrxSkdyO6K0Hazhk1r3L2rxjn
 HfrgPtUMI.CAkPxyWbPENzDWMjXdpNBCQExS3EfhpBz4OAELQZMn7zot910a6Ojo0guqWRQa53xt
 qKg_AWeWcZj5c3FO3tnc_7r.P1IrGK3wDK60zb6sDukhL9c1gSOvR2vPMdzfpGsouo1QuR5Y6kwk
 Vn.fS4NiREm2OqBBBJcQBC_JGfPTi_BXVdnrmlkRf..PDvrWfCxNiRRpv9W7xqpy89SvivBv7RTT
 .EIg4_i60z9OF7KeCCttiZhW3OGFKj_C0rnlVJ6GosUNHMF5rbZg_rJnwm9XWr6nthyVqVCU3k7y
 NpK_I2VBpvfDwBOexKjz0ibHeW2dLiyilmNZG0UNDLdLQTMyc0xorpU8pHqxfovia0XfIR94T6lV
 h_O9gmR0i3kf3gqyAUix1f_L2qXEnwWnruHFP07Rg0rvuEKoMR26bgtJ62lMUtIQpnKIuiaMUHju
 qP2txxU2AQWzM_g99hRGxsduVVd3emDRKOM83Xpf3YTE_r8xfZnjnmclJtiHtPan.cyAQRadTYD9
 Vr.p30sVtfKd.ZT.UaGn26urmsq8haomUkYt1CwXuNUAEVNmBFeDCRr_dzqqDU3xfvZOCEpaKClC
 LynSnewzB18dVBDPeQSkROPZhCM4wAcZ0riwaNu9Tye7I_P7dX08m4xQZo_kI89ZMZOf_HdGae.9
 JdzAF.Ml0DKk9KJ3XiErCZkUIAvZLZD1nuLYzyOKN5CF5Ic3.VBJf47fz73B2zUPtEN2OWhbYMoh
 GGbloIt8emc_.Cjjy44AjmJCKbAiiGlKxn0Nf5uoiwsTjqS6Npv2AUQ.K_HDRUHM5P70_gizTjBS
 Q0fygzZFlEg2mW6kwDbbtD9hDEhG1suSGNqPLkctRvGTkPyGRJZrPFHr6cOBp8p4EkwPe3QMQNag
 dlyyg76qg2e4doAItq_.Zi0YbkqkCqRp9EgGKlXs.ZN9T1kqDyEM2qwEHDsf0FZCgYzSXK.HTXmn
 4jt_DFEFaMT9hEqG5eUXhuaHmsCiQMO3JxUsYq6iasW8GQyL3XBT4_uY0cLUZ2V09iQhz3N6y2mz
 R2DZd2Q.yOR6Q3p3vdP72OD3nRMFr.xqx1MquwBGjtCfARfKsOey35FX2edJPtywZBTgkVFX4Bmd
 UqHsfKoJ.Dp1U16HMry97rPfG8QXt1bBo6Hn7xaQObqYq1HQhu4t2svhtkalTbOqM_eDO9He0L2A
 B0iM2xcdiwe8ILjTRlM7KvfmLM9EeTxDJ0.gNktXC4iBhVXojbGFEN99URhv1n2VIiRfDRiyWdIH
 zEK_ZXu8dUUvzVmearHtXnwrmSQzZoaupDzs_QNbc6LNtMLE79ud1G0mnYNfmTFn7rzFfVeuCFMg
 eLOkKM3Klj7a2JtSm5MWYv3l8k2x9qDW4bLNNifoFyzS7qfyOdfxtLeMg0KvqAtx.tHI3h8pb7HM
 PLQKEpVrwoU0EHX7Lh9Fyjgk9WfU0XsPJ9f8BEUzxUXXjwOxn4JtYs_l1QadlLirsiMeeVbXbYP.
 Gf1so83GQS7MNSNr36FequXoHtYdZ4xElZ6VcdZbHKPHYtFPjo8bTFQ0swl8FzFVVYImMspVUqCv
 G0rz4Cq7gJYYDYOAgGbgviDxc7fqtJLD8m6L1S64JSjrCbRbOIG7JH9LPIGFmCw0-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 64704df0-5e07-46b2-8ccb-109d8e994703
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-102 with HTTP; Wed, 12 Aug 2026 15:54:43 +0000
Received: from dip107.lsn.ir2.yahoo.com ([87.248.99.116])
          by hello (SMTP) with SMTP ID a93bc84e770fe9cd2810f228a8a91847;
          Wed, 12 Aug 2026 15:54:37 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Wed, 12 Aug 2026 17:54:34 +0200
Subject: [PATCH] staging: rtl8723bs: fix space before tab in hal_com.h
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-rtl8723bs-space-before-tab-halcom-v1-1-69f617827661@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ6CMBBA0auQWTtJW4JUr2JctMNUapCSTjUmh
 LtTcfk2/68gnCMLXJsVMn+ixDRX6FMDNLr5wRiHajDKnJXVBnOZbG9aLyiLI0bPIWXG4jyObqL
 0wkurA3WqH8h2UDtL5hC/x+N2/1ve/slUfmHYth1D1E23hQAAAA==
X-Change-ID: 20260812-rtl8723bs-space-before-tab-halcom-931fc507dc85
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786550077; l=1835;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=WhyxJST2R372ONHs8/vWqXzDAcTpEusnQyOqkx5armY=;
 b=wYKNyY9sASLogPJ76+2lXVGWVU7TVLfclDNz0etMiQJAIL/MilNe426SZH5HgsUa8c/SceRtD
 SXyMYhqlhE1AaVpXJ6VJuWp/GcBY5xPbWfOdMc4u560XgXzxdnqa6mJ
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260812-rtl8723bs-space-before-tab-halcom-v1-1-69f617827661.ref@yahoo.pl>

Replace space-then-tab with a single tab between parameter type
and name for hw_channel_plan, sw_channel_plan, def_channel_plan
in hal_com_config_channel_plan(), and for Channel in
HAL_IsLegalChannel(), matching the alignment style used by the
rest of each function's parameter list.

Verified with checkpatch.pl that the 'please, no space before
tabs' warnings were present before this change and are no
longer reported for these lines after it.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/rtl8723bs/include/hal_com.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_com.h b/drivers/staging/rtl8723bs/include/hal_com.h
index 7bbf62cfd825..3e6140bead86 100644
--- a/drivers/staging/rtl8723bs/include/hal_com.h
+++ b/drivers/staging/rtl8723bs/include/hal_com.h
@@ -94,16 +94,16 @@ void rtw_hal_data_deinit(struct adapter *padapter);
 u8 /* return the final channel plan decision */
 hal_com_config_channel_plan(
 struct adapter *padapter,
-u8 	hw_channel_plan,	/* channel plan from HW (efuse/eeprom) */
-u8 	sw_channel_plan,	/* channel plan from SW (registry/module param) */
-u8 	def_channel_plan,	/* channel plan used when the former two is invalid */
+u8	hw_channel_plan,	/* channel plan from HW (efuse/eeprom) */
+u8	sw_channel_plan,	/* channel plan from SW (registry/module param) */
+u8	def_channel_plan,	/* channel plan used when the former two is invalid */
 bool		AutoLoadFail
 	);
 
 bool
 HAL_IsLegalChannel(
 struct adapter *Adapter,
-u32 		Channel
+u32		Channel
 	);
 
 u8 MRateToHwRate(u8 rate);

---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260812-rtl8723bs-space-before-tab-halcom-931fc507dc85

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

