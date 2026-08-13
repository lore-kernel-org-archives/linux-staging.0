Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7685F492513
	for <linux-staging@lists.linux.dev>; Thu, 13 Aug 2026 15:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.82.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635878; cv=none; b=HsSLARN+4GmlJU4a2m9BLiY2VWvWvLdh8+1g+xFwrXndjd6o0PElR6ImisH3+EryaKc2d+sHmR87imUtaeVBX97fS66vi/9ZzPEkE8shqA2g0BFXb9ph1Od8qHy0vNPzyoZx6UI4XWKuSaPDMguVDiYk6sYstQZPQ4myAP9rwQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635878; c=relaxed/simple;
	bh=QRplkkh1Qevi64aHWUGi/8mYLX2nFEwMAwMKqHdS9xE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=txmrGfXbZ9wf9b/rvuHG3cDCDjgs8Op9AynTFEo9uAkpcYPw8dbNImHixFzlGLY3d0UdDpDP/TrvpHlkIOFNTZ9hog09raEYP84rJR7TH2FvJUZ9l3y1nllVflefDdQTJ9+MxL2Yvhgzp7KyLZEYYhZQbeOwTQ3OBFOLhWsVWbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=aIgVYYFP; arc=none smtp.client-ip=34.2.82.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="aIgVYYFP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1786635870; bh=s4EkSwk8hxzLPHS8yWSuH1ZE1aKZizOKnNKsBAHUxeM=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=aIgVYYFP35jShqj7kdcskAAM9es2Jms/d8Zng/SU10oySyfpSkWHr656bU7alwh8I1uL1l0ATePA2/cWCysJmdicQMNuwrFisIr53k78tUtmQzmjmwT8EG3bF8E2+q7BeV8uYYcp5/DwE0RTgB3Flq+uls0J6qxbvbCqjcZSDkMgPnJ6nHKqzum9TP59aB7XN1ORJjB5SFPXNipp6TnLRLKkRByMWe4Mn09DQzfCfdBzjTnizndHP54GgjrhqVyq6yTJPWU28bYH5HSFBOgOWkb0lAKqMYOczXnfLNb+eh+JRQV+vj6w0T39dP+qU8xr//c1i5vofYGQqq6XfDl61g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1786635870; bh=M4FcbMvELyGA1FlRIE0YVq3bX+jV2I73xoCh19HbnX/=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=UK2Hni3qs4BFPPgtRjAL3zo9gZcd4oD+QzHb3/V1hRfN5EVvB9Kd1TrYD8bj1X61whHAeeH5SpWmlSt//Y5ATx3UB0JlqasuF2PsdqNWxtBvN4JKIK21DHFEJRnAyOFHKa/52r/7kiaWXDCXMQkzx2oda0oaX8ug+GdIM/I4p3DAZVD38MxEdCMGoQvW/5bYVrP03lrev6NSMatSYqGYYy5PfR0Ktw5LUYKg+AoplkWvuLoZQQWe7RBxJ6tMVBC24kdITd7L49RZ6ybwnequEaZYleONOyc7nFsPkjKLANtINcvnzjC1VQ8/PK+MP8J/Sv5RqSQTQKEIgzbl4x50rw==
X-YMail-OSG: ka2r7lsVM1n2WffnWZA4NiusY0dhU2USYZJfQVO8sdtFybMsQjmlAouRmPaLcPx
 9wsxSpUfLK5915vPgX907z6WmZ35Ud3F1Nb7qXhrEHQFxLNJJAcbHNQI7ekhBewx6inLwRCkdA.F
 q4F5ZHNG2p3IQzi.NVaxb6jFJqODniUD3LtPrUKVxYjfjwJL6VuJ1.k.7N3UtXQgH_Ve2ah93LIo
 BK.Pz5Ci1ZMSra3Q6AZCj6hY4hNnkgt_EPhWLxojrSfZnx3E3fEQn133OffT9wyApyT5_zXe.Uk6
 yb268on0_HmpD3ZePQWSEcQbzGudLkx.TrhVBqCn7_VzrMQbfgpGJWVTNOIjKf.s96Ic21jY_hHC
 tzrc7J15AhQAcmudaCmkq.PLey6rfB6wrBuZcIA0gc2yn8ncmVwsAXYQxwTW3LypED2O96dyKsP5
 sTuJ0g46ig1051NiOdacGBqDKSgGImJny5lAkzzyiwOZ5ioF4o27_31nc3qJ.VE.ZmQGVdPfU0NJ
 7GkcuInoJoqrP5FJ1oZPx2UsvepxOIwvZ_4yj19M92iJ8d3X37dbwVdtl7QZ3oFL1V_9a7511Da6
 FHiYGFU2dUBJFcCi9EkNHBZw5Apu4IG4mZGhdZe_qlSO7so_xzITXUd8BU24KMvHZpEdeTrsSHyI
 MiW9Agd4nvPnvphlYaL0dRKQ_jG8eZ3mtVOlW1xN0ta3pEg73LQEAbN10kFVGuS5fz91QA8v4duW
 mQmJ5UuzP19Jxn5bOLjL8.3OKbM9CMW6_OyJ22_aGalBrkOIj_7aJwToQKuFL4R6UMnVjONXuij.
 MKK330GnucO7xImMkb6L6F2V6A4yFAIVnb9J1DIX7zOeUAhHBmv8diX2ChnKI75flA.sw5PgwbLz
 .a0TKa1Vysigto2YvJ1latlRp.uW45b94SKmkbcr_TaLMsSXInHIsgMM04WmtgURlHQFQvce6CII
 8EDZzQwM_k9qPAGxBei18ajD02ucfF1ByIF29v9Lh0nwpdO6e9url7pu1IYXQGqIuNjm5w_WIYFp
 gf65YfTGI9uUhOvI3rt80gLHKEaqQEfT4mLibhBw0Pg..NwFK1pxkiPIckhyuDR_bnr3zBQUsDZs
 BupvZu0RaG38GMY0opcUndaUuyAzwZtPDac4O_e78VkESrPFQ5uD4G09Yun0J.g6bqrP1n.WWNy7
 _Q1kouYwv3lBDow7mX.uJ4qFIWAiUxkLTzMXRVvPXDdThnoRpl.T0662zdL3FdA72mPEIcIJlX.v
 b29l0LXq7PRpL6y.FgE3DMdpkLIQPQa8JLLVroYHFbds0UlEiVuIu7gJe4N9buFizEqqAOTdrbkT
 VGE.9M.5ZOeSu8355owEkS9WEpF6OvMZzxdNIO4_T3H3HS145effBcqV0mILt0LXX3Q5gW9hrBek
 QqRN.MaRy8_GER5JcrM9RzXuQfmWrLbv5oE.kIVBDs4ueV3iO2B0ezdkzSFPpLvjI_ae2OAFCQ8q
 0S.6.kmuBJ2FRISSNbSG5_dUGtZPHSNmNDnVstH6zx.55V1ppvkOwhT1LZC_4_lP7Mrk3ktKAuvW
 _JLgfja1kyZS1qlpJ0pBNGyYH8PSEw4zrs1ZLP6BNDwoX25zKFc1pbdHt7rADLodDb_4xFLdoXwJ
 SPIFTso5Q0k7NZKxDllX.vNhbMXhwr6ln5sFysnPV4ZoqRTxbpo4Wi2rczj3h.gDEVlt0x4Tj_4U
 6SUsY0wyJRnbLWEhWRJIAgP321qrhxrwwMZBRPJdC4iBF1AP1ZNqhPDvj82_H.I93gmQ6ebI2zzn
 vSZgVb8_olhM7EbfVDzNtsvUH0GPWHaZqtbRwCWzU6D44pzVY_gqQt3BX6_6I61oWYKPg_RGS561
 KuEF9ZEaJUh8Na_9rBXSc0BRrIXO9tUJWU6K9jyBh372EyfyqAroZvwQFKg.vmOcqjM_3fNXul_E
 J8pZwI_IPDH9JStTEh1cvIAoJdntMK6rUtieeL5W0zhBhsHISehaRerjzLfUUlEEYJ4dNEtah7ZV
 nR.wXhjxrTa9UcJDTPX5UyUdCig.1E2Kqh6aOlfxaPX4W0zK3dt_cGce1dDPKP9k-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 98bebe40-4929-4953-b032-f78a14023ceb
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-102 with HTTP; Thu, 13 Aug 2026 15:44:30 +0000
Received: from dip232.lsn.ir2.yahoo.com ([87.248.99.241])
          by hello (SMTP) with SMTP ID 25221f258dcc07cf89468394f2de2ef7;
          Thu, 13 Aug 2026 15:44:24 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Thu, 13 Aug 2026 17:44:22 +0200
Subject: [PATCH] staging: rtl8723bs: fix space before tab in
 HalPhyRf_8723B.c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rtl8723bs-space-before-tab-halphyrf-v1-1-13dce9021e6f@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ6CMBBA0auQWTtJKUlBr2JctMPU1hAgM8VoC
 He36vJt/t9BWTIrXJodhJ9Z8zJXtKcGKPn5zpjHarDGOjO0HUqZht52QVFXT4yB4yKMxQdMflr
 TWyKeLY0huJ7IOKilVTjm1+9yvf2tW3gwlW8ajuMD2AigSIcAAAA=
X-Change-ID: 20260813-rtl8723bs-space-before-tab-halphyrf-92cdbb67cc06
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786635864; l=1556;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=QRplkkh1Qevi64aHWUGi/8mYLX2nFEwMAwMKqHdS9xE=;
 b=rf4leuZF1/Hyu62NLr8mDPGlGKbL6+Od41XvoEXbKIReotxZ4nrxrxAIznk4k+2IfnWUElgtQ
 f300Dtb8S7hBO5H/HTmXL3Fr0shhfO/a/RuKULCdJ7vuiD2Ncv/WaAm
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260813-rtl8723bs-space-before-tab-halphyrf-v1-1-13dce9021e6f.ref@yahoo.pl>

Replace space-then-tab with a single tab between variable type
and name for GNT_BT_default in PHY_IQCalibrate_8723B() and
timeout in PHY_LCCalibrate_8723B(), matching the alignment
style used by the surrounding local variables.

Verified with checkpatch.pl that the 'please, no space before
tabs' warnings were present before this change and are no
longer reported for these lines after it.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
index 70b68f473d58..7ba4684dd8d9 100644
--- a/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
+++ b/drivers/staging/rtl8723bs/hal/HalPhyRf_8723B.c
@@ -1554,7 +1554,7 @@ void PHY_IQCalibrate_8723B(
 		rOFDM0_RxIQExtAnta
 	};
 /* 	u32 		Path_SEL_BB = 0; */
-	u32 		GNT_BT_default;
+	u32		GNT_BT_default;
 
 	if (!ODM_CheckPowerStatus(padapter))
 		return;
@@ -1745,7 +1745,7 @@ void PHY_IQCalibrate_8723B(
 void PHY_LCCalibrate_8723B(struct dm_odm_t *pDM_Odm)
 {
 	bool		bSingleTone = false, bCarrierSuppression = false;
-	u32 		timeout = 2000, timecount = 0;
+	u32		timeout = 2000, timecount = 0;
 
 	if (!(pDM_Odm->SupportAbility & ODM_RF_CALIBRATION))
 		return;

---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260813-rtl8723bs-space-before-tab-halphyrf-92cdbb67cc06

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

