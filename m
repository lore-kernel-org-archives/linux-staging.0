Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46D52F6562
	for <linux-staging@lists.linux.dev>; Sun, 23 Aug 2026 16:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.82.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787501543; cv=none; b=XfuhNa++QaIGo4/C1TX9xPwQQJaoavGA41LObRsRf2OEAc5Pnd/0jER48dZCIzCAa3HtWTK9Fh5xfhKICruLea3pSdjQItUeWaCe3v5TRUr2pUTbFUm6IVQTVIrVWp/DuE/3Re9A3fnw/mIp8XhYL2YkSEb/muAAPJbeADobEVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787501543; c=relaxed/simple;
	bh=gXN0XzKcAJ1xiB8ui27/X2mFbu340VwPjJpfCn5qEhY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=g/wTkNdFGwkQhf8HiDH/SID7BvMux5g+WKDXbGOMKuJlslTeb9/RN9wwzCN3MtbRHYlVRLSiWCQQiCaOREPhlt5IHeS89x6Bflh4QbRjhbj7ghTyVW/CG5OLW/xDx6vDW7kLuOVyXFDxpGvK092E5q2O/TZSkI2Y8hAV1fUruaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=exHSFjQe; arc=none smtp.client-ip=34.2.82.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="exHSFjQe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1787501539; bh=SDRj92XDPzS6ArfkrhHfKeVXJxjDaJPrkLXOUmVJtrg=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=exHSFjQe+An2AegPxbcnHzpy4bBWVOcgTOnUgzqC3LzWvP52LNRwfRfVRffMixXhV2hr2JAWz4wfsKwNGIVQXdnnsPiT2uzupk7l7jawppBJjPBnkF8MbprHTYA+C38PstXj7GIBNC4Vmc5Y1vgF0DdD62kYC0y1fu3sxe3Jx1HckLhsLnVnpgwY8F/82FgHDgTLBCjguq96P5ovFwcXkLWHZ1zqqtVc+7DURatgBVDxNJe1NsMwZuXNHXul5iT5fR4H1798fujir+OkqV7Rz6GVlqmnHAtscj8yWP6kN6GNan9uwXEMHXXZaj50D0Kbv1GnAtwwlEFh6MC3DHBcFw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1787501539; bh=4kgXW9ut8Im5hxzekDKzXGUNGNUDHeNxTXk+2Sk/27P=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=qJX3QPhb6rmYwWa1kn3VdsbRCMjLqUePyiEAuBRUTMIQYEED++RPNJhObXBckJJBG3tvo4uZIHMLsddkoXKA6GAxvdR4KKc2++c7xDV1DBiHAuyZo8qBHm5tKoqLqj4kaCZsAWy2T+tgRc5VzTNcTiEmxBLNjN1Fx5MafTCbvBEaDjtTsmB3QRVPM6eEPMJgS52XLR75JVkEDwsomjJ3++noaKpJxcdQr7FGKcRW8gqxK1ONz4b9rFYdOiDHTpaTNOVNXeUgrvnTfjtijhNW7Yhc2vySJnOIH+ubmcS9yXcdcDwhA3N4f4lyUC+eMzN2hSRYWWQjJcBW7x+irXaNew==
X-YMail-OSG: 8h2oCv8VM1lIuOpGYPPLdbBV80bMacAenSaP6i7l4SlE2AGkrzKUB27aJkNjCz2
 FAllceXI0qof1Iz_WcpfngLDqBeZVLfbwqDX3E0ulqjIuZW.zD2tYCPB_Zeie5Mw5tKS4jA_BUok
 4MxSpQACfSwbY4sMdW35WyL6gUPeNwNjCYo.bz6n1U7XJg3Tpu7dplUoIgzCLimz.8dZpxKg6zfD
 h0SqQ2oMsMYfBzN5mZQ2tjhcV5ae3Vf81zUn6zLf2n9LzEcghpSCnahcACt4rAYWa_Br8SzYLdM7
 6k9fGGobWXbjNWLSgxDKFEwhnWArpbblXpFYc1cbjKWAXDzWVRzxEf9pME8bO6gi5KHTSePiXu9B
 4T11AthCLm05UlWNKLe8yqaUvH_n.m8xMhXXDGhOfW._UPzGuZll3jqH6E6t1D4l0PRJmSOzANnV
 RGYDzahwpzSYZrYoaA.S8FkCeifCs_wX9YFmE8jHkfhS0jqggCmmiQ_uD5.LO54i8AY7mAwV2itg
 rfu0jo3sm8mvvriMe580Ro2qMb6oUcDzTV6i2UzDENevCHWtY6HK5wTRK2rJxA3WSid7urNH.Io0
 zppC3_SYvF_v7Es6s1qnzvn8vxGbHt_KWUOYPc_VKaivllzdd9zBGKnObMhJuUvutlvzMVBfYPjb
 NWjovnVdq_qc75jOhxi6nqsn9K8yEhZRa9KkajIYSMnAaRrHsRBNc0dQca5115kZWq7tcDMcXn7P
 HFtCBsX1Rs2p2qPUjISaj7LWS12XJKdE8UJ8v9XZpOAuhJ88dOoOOPCnUwJGBHbeisPfLOCoG_9w
 pte_566ANXbpANopLaCRDj_pztNH3yXEHU9ZEg.n.ecusEsy8JRnvgWRW42BL16hPSqCLrUv2fzi
 FUAMdPuGgnYsqdrXpwpZiBUNw39UWaUARPv7WOHqxyCkbD8b78biouKsK9XDxXvIWup492TY__f1
 gYJUwmtLJGaqX4Kw10f6NQCpS4n2BI6mam8QQjtW1rPACoiN5aNTXoEWO.2.YmfHRzoSVPN8_51l
 GA7lwF7lu5JD6pZ.xS7rvAmMGwaNY1G9oQxQ8eIqu1I39bP1vYgU8X9YduF8J6Fw3c9VyVTo27.e
 XtYUjkAAEiWFlyfZkhNzoIFsTTmfAnH0olNxt86g_OLRjDWa6qhVPQ.vAqvFsDgP7QrEvCV2jZ2C
 IUPB.z9OCGSFOaflIwt7uScISCYzDzFvVaT1qpZQFxxH2HgwHvhOE1vXP92Zh1TGiwaFF33SJJPv
 207YPfxRi98v3Togy7QYd9WG7jlnoFJA4sOcQilLpeNX2E45rG8PlX.v4ibW5Pkje3kDYwWK1Lut
 3J1czen3BOOAgR_s0Lbyf0YCFRzWGP_WAqiE37Jh3u2yEjntVVyDwu8rV_GPCXsZ3JxAdhxA1Fy3
 nRatIqj8Zi8nqSGsARTuyv6EKQSJMbyGoPPTsXZb7odOHqVPo0dMdfA1LTmwWSujek42TNPhHzWZ
 fjZYEeYid7x7sTRimMkRZcjkdT1hZq0moU.Gdc2CeYqGHtZb49e.vthm_7KDz8EjMkbWQCCzj_9u
 AVww2cGIypyyQyXSTFhtlqcqP5gx1Ii7RMkthZDDG7kvzs.r8Wf.uclwUxggkrFSqI8rN_lGqsDc
 kPVt9eRQTEZOg3vOKlI.aafWdxiPx5KP0uxmWc9Jjs1F_eEmWR.B0Wu8ScEVS3B.BoUwTc1sYY0r
 mtp_sQeN6F1rMezhik8S8OzcijTjibWVDaIH7uqfjLL2r5FvDBK47aRLeaAoFTe.oH9DkNRuE8Dl
 YSsNEbxFIAetsKVwgZvOQWpUpTPVGpvl7O0Oqa3UZZn_aed5RqDXno4jDqvsSvQUdyUEPdSwiEJ7
 qXMEt60xMsoF5pJweMnZo._GfnPn.sJcYfmwr410q90rlzOtogsk46E0Avy9qLRX8dcGKUOIEQW9
 ZnwLofmLu30RYJvU28wet.x6yG4bL4_0PeWzM6Tl8WSCNdbgwCOey9jPKIWSmPwDQBFo-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 6375220c-bf4b-451a-b458-79364b9b16b8
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-101 with HTTP; Sun, 23 Aug 2026 16:12:19 +0000
Received: from dip80.lsn.ir2.yahoo.com ([87.248.99.89])
          by hello (SMTP) with SMTP ID 2930c7a07539683b7370b3a65290f9c5;
          Sun, 23 Aug 2026 16:12:19 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Sun, 23 Aug 2026 18:12:17 +0200
Subject: [PATCH] staging: rtl8723bs: fix space before tab in sta_info.h
 comment
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260823-sta-info-space-before-tab-fix-v1-1-c88118e72485@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSw7CMAxF0a1UHmOpH5QCW0EMEvMCZpBUcUBIV
 fdOgOG5g7uSoSiMTt1KBS81zalh2HUkd59uYL0209iPrj+ME1v1rClmtsULOCDmAq4+cNQ3z4P
 I7KYjxO2pPZaCln//8+Vve4YHpH6ntG0fmlvKAIEAAAA=
X-Change-ID: 20260823-sta-info-space-before-tab-fix-71cc7639ec64
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787501538; l=968;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=gXN0XzKcAJ1xiB8ui27/X2mFbu340VwPjJpfCn5qEhY=;
 b=FpEUTEIjCAKJR06Eyi4Ahi2OSt3wZi95qQEnHsbOFXlq1zcDrHKNzujuGTFpe3A4kVU/KBQC9
 8cR7EUfaNtmDrEvIsbYJ1FrUxw7xfopL7pL79U2QZh3BMBgj649WsVy
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260823-sta-info-space-before-tab-fix-v1-1-c88118e72485.ref@yahoo.pl>

Remove a stray space before a tab in a comment.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Verified with checkpatch.pl - no new warnings introduced by this change.
---
 drivers/staging/rtl8723bs/include/sta_info.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/sta_info.h b/drivers/staging/rtl8723bs/include/sta_info.h
index 0f53e77c110c..c6cbe89806b6 100644
--- a/drivers/staging/rtl8723bs/include/sta_info.h
+++ b/drivers/staging/rtl8723bs/include/sta_info.h
@@ -122,7 +122,7 @@ struct sta_info {
 	struct recv_reorder_ctrl recvreorder_ctrl[16];
 
 	/* for A-MPDU Tx */
-	/* unsigned char 	ampdu_txen_bitmap; */
+	/* unsigned char ampdu_txen_bitmap; */
 	u16 BA_starting_seqctrl[16];
 
 

---
base-commit: c6eb4dc5964fdf4086b73b7f0f5dc0d595fb5cf3
change-id: 20260823-sta-info-space-before-tab-fix-71cc7639ec64

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

