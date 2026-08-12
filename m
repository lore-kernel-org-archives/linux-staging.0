Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F047537204D
	for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 19:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.82.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786563632; cv=none; b=VLa8nKpxgGpD3kPBUK07zMqrJvd1Zh4Y8ZrmbAumqm9rexEP3cjNP6S80WsF6Fvqarxgax200PNdHGO85/VZjvyxizSr6tvZm5QlpV6aIiaVu4eR611EZVPAJqeYcu1/Idjvdq3beFjKX6b4kh0DyXlV/1aO/MDaiEbn1ShLck4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786563632; c=relaxed/simple;
	bh=s0HdPcAWHK9Kl1ulaQ0ownUAC5qob2RxOiNh7CzQUEQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=dBMzl3K78rCFpts1pyNt5i13GV5E4GIzcVbll9hSMu/86OJ0kizOpsEBQHtY32T64Hwwp9obBR+WmzvCB+UUOu6PPY2B1Hc+QtPidQrDBImnXIpRvxxeVer3xUV61vXUqMmlmP3GqMHz9sEUNA2GeVNrHmxfxwZizDweIOXBJR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=ebclKhUA; arc=none smtp.client-ip=34.2.82.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="ebclKhUA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1786563629; bh=t5+C0cCbX3Fnjnq6IYUkpCSxsdslSUZ16b9QyQVzVLY=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=ebclKhUA7suq/NN34tyEbnnGAZ1zKnk4nlyxAdLWccuv1fiNSII7vli/tz3LFNMj1jaRhLcKJ+5Rn4PTULGLiXbiFK2PNKnDrqhSOovovAeyMsEcyP6zjv1Dp3LetTIcZlYWqn3+QXQzT1F4X5HsMToIv0gsPAvztCvVAQL3DgFOpdu5ERsnI46odeG1ykFUgwAP2VEsvPl6v0n+sgYbqssj/7Vx3bITrguKBQGevKwjeA6Meu+nGpnL4+vlRMmnAitiVAoWvdX2gZQlP+KbNyX7apPZVms692erOf2+vDp7hpVCLwLY+53YVrNTGY7HbMQGQXmXoA/3XlycOEk3OA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1786563629; bh=c9TTNvAxvoxfVFoiSUkl42lIKo34URwH2XU8zOVs21l=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=EiHBBvqqSW4D6sJiDBIVyVCvjYT2RnX1YG2TqduKPxKoFRyI8B030DLQ129Pqqd23UVFkf8Ia3G7OZ64tWq+z5npGbDh8ar4hTiL/2j5MoHJpJ/i34r3qb/WxB8G9gAlELTP7q6sdJDz4VTUcYkoncMEUK4oRdpAZBJ5sbQ0r/ZWFT5NkQpz7BhLF2aefFXTGAunNM1miY2U460HnIPewIjEFVrGk6AIXzpWGSyQmmsjxeBObeLyDcu2RamXOfsk11CTxbkA2aI9H4LJpy9j2XYO/uQsTEA6t3eAjLHfySV7wjRndqMav17hU45oE11PXheLxV72Qqn4MASXUFlQPA==
X-YMail-OSG: 3v82lcMVM1mO_uMxrJaMGbzeRljazqgRhVpkwWwqej4S0Ho4Ohprcfd0nTjEKUd
 mjVMACd8dDpEQIN3vUI2wGWr9CuDaEZzbQCEb.gtdZ0UbWaugPNsakOort4lFHHeojA6ZqdI8YDg
 DLks6FU2jPnuHcZvkaeyqfkPNO9BKXThgu4SUz_d4JIfqZhvocin3Lz_ckAmYgIw_XAJgcxxttmp
 Z9aKHHzCeiZ5ECnBbIsLpw2DHfSqgrfkqYICvNxSnRuFrawpRLbjMjsi1V57cKQ9Y6jnR.MqEVdF
 .lFO.U77Y9X8k9ZWbH_dw84EA3cLHZ.REkQM1fI3A7Lwk6enJ52mmdfCozWFQJUcHxYAE0CKAdck
 CWsd4sWHo1EQUBQSI4FmhuZdlqLmNHkkE9y4doipDA4UXJfQVLsHZD0mvqZVUQYqNDKsuSvFuAnv
 zc9hv2CYBfBdMJCu4zL.ME3aMT3v2WyzzNH0m6TsOfqr5wIrYPe4yywGc6rnZ3J3g2Mf4d8tyB0.
 Gq766KzpTL2_bm23QxYZgs51gzZuyMWYHF2Xo5CE9BWpNRTFksqYvkEPPV2TVRb3n9YSLedTCITW
 WahsDQ_kd.6vjcW_Y2uYyysf1Rbd54.KuAhKTrhI9zME_6nnxqocmIYvPsBgpf1Arwgct7OWuZ41
 _o9QRIhtjsY1A2gEK9dE5D2HSNAWjyQ8iSjc0zb0pkGMbZ8VeBMOxKuZ.Av7AwsLfAG.2hyBQFcD
 lajPY9zOS98QWYKz_viEOY2RbIcLofXM1Yp9BpDNGxigDKn4zDIeXFMcXeeePdd3JuLALUumt4FB
 H_qD2hlgGIvT5XnO7OabzMvzuSootubbZbAi_DEEwAi8rY91g4ZCwN9losY2SDjCr.G4IUy.7qTg
 5FXbXnOHjEJoweEuYpd6GPSh0zToHoWN3m3GM1fPa6pW7g6hVWx65NG_R5X842G8ccld2SXVHORL
 4o8O0fHqM1WqFhg2MT_WvQ1Z6whe.iAIZGkGzH_xL8pMJ2PocbG_Q4w7fBn29v4k8PTqqKLBXZP8
 OEX4pUckKs6MDXWsdstfaiza5ljpMot2Z53IjtNoK4CDIxG_JUIP4MomoAGWTojaocDql_cZGy6q
 OpqIHQ_Unnb0Bt7hR4Vu.vSGLAbnzt57dq5XMFJCEBOIDIikF9bVUMKKHLdL5FNbikbfOfoFjfPA
 gC67p1BJtSMjCNFq8DJSl24hwLs.V9VzPqHFEim.RfMzvmGbChQWQU0ol7gpPXuvOYYn4HjOQfBd
 OhyqDEyvzDmuODvtUxwxx_29QZg9qOEE66XgwIr1qeRjrT8q0os3nfKIl9ofRYC7Uvx8aBkb2q.p
 0y4QF2KgiNFs0qz_osA4MhyR5vx.ezB6o00iD.qbnZLFtdbK1RGhlo4GrqZjnO1wGS8R2xvwHkqs
 IXLu3jmbtxtRMJujaPIYkU0.HEotGIGpsILEJdFrvdmnT0arSq1dcQFoR7yOuRsOXuaEvD4w_WSt
 qPjox5hN5WY41DfI.tDAMYcFNVjjBN8ohxYWgBTgIwVl353eIewFaiqdq7DKeQdlVMhOjBQssAVF
 h2CoTQvb2sBijxhJa5CD0ZppV1ZaIgvMkR8EM9OMjEXTIXn.9xA3ybS.XhGsZ4ZYfLo5uN4jFYb4
 64HeE1r.BJp5Vfo3I7X1oewkzKaxNcPeRK.Hpb42iQG7neRxH7bE0D3WBG6huoBzx_ycx64bwazO
 E9pTWzMS3NoX_fmsOf8iynuJWpKvfawX5MprjuqSDQ3Om81i9a5FbIIVjItrWA3XeaC6D9dMHG_7
 m_cN1JYO80FUsXsfLufTywqjMaswNuaZ4lFaGkjA.MU.vffSjestEqXtQZN.cw8Js3IgVS6MHltt
 0771kbwLKZUeT_uYKQtubNHOU9dwYlXqOMMtob7GUZ24SjLoAj.LRsH0.y1hdQWS2YzaPxyQxnNU
 0dF7ioODsAhVhrhXSjMeCryc6wypTfE7nTQdgT01I.KeJpaQrhGcaSLfTJmGVMQnoQGb6VUa.S8j
 VSyfPV6f1ZwlfeNJWeXGISYLMiGt6gXZNCNXiJdrUfog4KwFGSQ47
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 63bd8a5c-b9fd-4f88-96e7-071d6c99bf2d
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-102 with HTTP; Wed, 12 Aug 2026 19:40:29 +0000
Received: from dip203.lsn.ir2.yahoo.com ([87.248.99.212])
          by hello (SMTP) with SMTP ID 8ef121c85d099bb13daa1f64fc16bd28;
          Wed, 12 Aug 2026 19:40:23 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Wed, 12 Aug 2026 21:40:21 +0200
Subject: [PATCH] staging: rtl8723bs: fix space before tab in hal_phy.h
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-rtl8723bs-space-before-tab-halphy-v1-1-20aaf940dc56@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ7CIBBG4as0s3aSgo2lXsW4APpXME1LGDSap
 ncXdflt3ttIkCOEzs1GGc8ocV0q1KEhH+xyA8exmnSrT61RmnOZTa+PTliS9WCHac3gYh0HO6f
 w5s6MugeGoVOeaidlTPH1e1yuf8vD3eHLN0z7/gGqRrGmhQAAAA==
X-Change-ID: 20260812-rtl8723bs-space-before-tab-halphy-48d27ee9941c
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786563623; l=1250;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=s0HdPcAWHK9Kl1ulaQ0ownUAC5qob2RxOiNh7CzQUEQ=;
 b=JVDJvatnNLeOwaa/1zR1WPBcLnGwRr9uBs7DldbSHQ7q5olUrdIAeVRcl95ou1ROQuYR8zyQ5
 wLlUI0l0nvpBi1Nio8rUBwSuW+K6QODl1A1TCEv3HiKTcFUfJYlOseG
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260812-rtl8723bs-space-before-tab-halphy-v1-1-20aaf940dc56.ref@yahoo.pl>

Replace space-then-tab with a single tab between field type and
name for Para1, Para2 and msDelay in struct SwChnlCmd, matching
the alignment style used by the CmdID field in the same struct.

Verified with checkpatch.pl that the 'please, no space before
tabs' warnings were present before this change and are no
longer reported for these lines after it.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/rtl8723bs/include/hal_phy.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_phy.h b/drivers/staging/rtl8723bs/include/hal_phy.h
index abc0f27fdaa4..03d20e54d269 100644
--- a/drivers/staging/rtl8723bs/include/hal_phy.h
+++ b/drivers/staging/rtl8723bs/include/hal_phy.h
@@ -63,9 +63,9 @@ enum SwChnlCmdID {
 
 struct SwChnlCmd {
 	enum SwChnlCmdID	CmdID;
-	u32 			Para1;
-	u32 			Para2;
-	u32 			msDelay;
+	u32			Para1;
+	u32			Para2;
+	u32			msDelay;
 };
 
 /*--------------------------Exported Function prototype---------------------*/

---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260812-rtl8723bs-space-before-tab-halphy-48d27ee9941c

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

