Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EA63A4F26
	for <linux-staging@lists.linux.dev>; Sat, 22 Aug 2026 16:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.82.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787416030; cv=none; b=kbtCZsPBMtABqIXmBJ/EYNP9+y7ZPB/XFe0SOnMbCoUERDUJdZtflb6UzT3p9vOOH5ISQu52LOG1KywcsCrIuiWgx+6NotHB7ZJARzEWNLmlkDNas8E6+xvpafBpKDq+XmHN3GdqAG4Sz8aYOV7R7UW5XrTUBW4pYYIvpYEvWXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787416030; c=relaxed/simple;
	bh=tVe2LYtwP7cmNVF6rqZqzLlc2/MlBW2liCa9ovPu6l4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=GYXqvkFykjxA0qXIJlmgEvqlvjJi9yTZLtdJ4hxZru3SaHL/wbyrPDhBLezVtUx0OmDcaTtejmEm9flfclDSZXIOwGe8l6/hnUR5AY2eueoQqzA7WoQg52LUBwsWiq5sq74S+cADs0Iw9UOhoIeGuqIXUfXFSpknpImzeVWOXEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=fvVKpGgN; arc=none smtp.client-ip=34.2.82.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="fvVKpGgN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1787416025; bh=img4NbGaCHdQppkcgpoinvDkDNQGuhOZsw0nPuNdsvk=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=fvVKpGgNeS8Fts1+kbv3gXsfLpUjHlYEV8EjxDhU3vkvHHdFS0/HeahlDLAZrS2+auQQZtB9QbKQI1XJSvW08nqrMufhP/10MlR2SSgd0yKGP9FVGh4zROwPuMPirFYQG1Pb56d5ufchoJ/O/m9BnjXXv4XBfzD9/HqZr93kzj56IRt0zsqxVO6aWGcwmXEqq2Zziwyax2i6TklXRXd75IMB4uoGBgkmQ1CY+psb36iuTK3C3nMhC7bFAWVzj6L+XYE54VY5DRO7CDOsvj7mX570orkStjl07i59VNpzcbLdhGduWoNRhKX5MTWcPBRJiVU0pwZbDUVBmrBTwwL2ew==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1787416025; bh=F15ZFLOsdlBFJ5brxVoIa7WNetZtAcSC7hN/wHxKMUB=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=jf83btCA4Yq6ePJcq7Xq7RQS6QFcv0RVSyQC/UB0a9Vd705BgYMusH22N3xIvt/u8MrjEk51vV7DiTTJuVorLKFfGaA0WHY4a+DlvC68vp2OT0CGlGnLYvQUHWxIfgu8VqZ7HeFuud/bzF454A7J1mn2ultcX/IXbMpUeh26F5TAgPn6w+LMLZr+xhoFUOoULiXR0bbHK3wjOsXkFp+U1BCDpmB5LPNH7jq0JJnVCTpdN0uzsv7+/8s5Xw3H21od+Ps7UOAngCtpLEqAkOKPEQ1keQCE0jZnlmBzFISXSvLIPTtWEpsubnI7FiHYehp1xA+IVRLox429ov3bUdVB1A==
X-YMail-OSG: QIck2LoVM1mEX05nAOcRQJUOkJxS.lbXYaQrcBf1LRzivJU_oj4vXXSYcnemmsz
 KCAKiDDK1fOG27pe9RLIIjNKgnQP6siE7ZkAjl8tsNzawnMypY_yZ.HI.Dr_nPvR3dIOuS0JrrJO
 TyoXHy1c8Ww_VYPK0CAVtJ4x_1zANHsr6fRBUP6lk9HSI4hmrahkvrY3ihnX1MdgqSkVlMRsmIme
 fe6LFhyXBIQVf8ReV0aaBRv9PEVhEuQCbM9h.HL2PTqBPay3koZvMqD8IKVL2lZNipIDHjdqX08c
 5Ztc1eOyiWF8mZ9bwvF76cYHvnwPiccdoo78yE2gNm2fbmX4T5AMOJKEnJWwyOZ9TqcWI3l0IEmn
 grRK0UseK0LBAFSVK14BS75bpeueuFMmDeyCWoYwiL5Q3Y94PhMqDanjJHN3Fs2QCt5_kdoqUtSm
 uKmIcGHT7rcLgNPlCph40Vedd4AZMddFRhSE87JtdLtIjxCN94STfXKCBCIfRNUgGDiJOMVY_dI6
 5j5JRL8JDDpYnpoG05FVeKu.iYZKeXKlNZH47h8nbWVKTRgR68RBL1vtI.iALRxYm37eKJ7MXkFM
 Fj5M4wWdmxOFCJ96sdZa1ezEOA8VrnoKrdf41OjTnaczdct94JqyW1DpCyxvq.sKf.VYUGzCF0lT
 4S1ZI9hB0wbo_mfLtMbh8upMeb.p.nosYwAiBbiJXtd9kkaJ8EN48Yv8SAkv4ZuW9sEoAvxz4brb
 dbJ1zRnEPRxHX1OTjd.llxTHuQrbOTNQyyG.AZPjyf99fRtNGNFodgCjlgP909iwRoD2aIxIiBaS
 9uc_bAPxV9kWfg46yC09BxYtY1dViHcSBcvLQ5VToXmTNSQHBIUuB6SA1kHinnDR1.LK0mpHQAy3
 CnR_5I0OtD3mCzBcD9mDxgvUv10O7DacVpEODIAHzgU_eOiF8LYoSH93ogq3kJze19bPcGV6gear
 J7V3GgJWMM6E2rNCpgg9hb2jvZV5CJgH97SfLvMtYJAbGfl9baAVHKmnIe1vnSX1U33o26k8Fptf
 RLBH09S97JYA6S743TOnilYxcku45SOwN1wA8gliBnLpzoDwL0bTSu68a3.6JWJBWm38me6V9XPH
 VbrQh2k43wpFOTC7y4f9CFnX.zBeBrMqif6jOWv3rqZamCe.hXHD.OBKw_VoQ9RHC45PISM.SJn5
 U1Bn4._XwkOLeupViYHOlQwYzTLm.JOw2UqXvbW5SaiBf.JGwsyNdinWxCwE8N5gAY8AagOnVwu3
 x3XV0RrphDzM53_P2kwquiGPnMNpgfyqNWg6EcW5GxQDZ6Tng2aiisN_pQtywgFQSKc9.AloGD9k
 mv4Dujm6iDK29NzW.ntVmOa6ZdTEYhQl4NOGmAbJ8QqtjRcZJr91bkvqj5_g_t.vHsG9QCxN1hzi
 lfuhgnueQM3bUc71GSVIcCn5nJjG5bMhk8YmAp7S8L2rCcZCUbGK9WHTFuRYfVBBekvf599ROt8t
 _uV5hGt2JRo_dzhpLHiTmMi7OmGpmW9g_jpIsHUpg5_kdRst130Xi9H5JJol4Qao6DOgLQcpuMKC
 TxieaEBmdwfOFMAhHE1lScXqKOAayXSwZykqY5PcSX1kRtvafIhywUHRM_ktWsegvpWaZ7fCYMgZ
 TXunwQMztq7.itrlLEwfYlUbHO1oGVALef9PXalHTAjcVXM52_59S8cIsRJ5D0fdRXu3eZh1p3qm
 rTPVtVDFtxSEwcpQgYVh18zkXheu1BD_VCKx.XwSqQrTaTs_Mj8opb5WxJhs40kkguXTWDjlEy_h
 cnTnR5Wc.J93phtLgSVNLxkY5IUUcC78YyRhfgJr7ClMmft4fCXZq_0izAzDeuUAdx3ABQmqZ4VD
 a_u.E_8BxxZfs3a16FUaF1FX3gZQCLCZb7lYyplSWQSB2d439WcA0.Z1xgo27pcBflEKRcFRaBZK
 SI6hM2fa1.1DKhYQTsTgGeN2WThvFmFrTHQA77mOVEyEBVnCidRJPuB1heuNppjKdr_NVbPvsbpp
 y2v35yuA2EmuWkwVK0EITMl87eQNpyVXW
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 748c7aad-ed97-4a41-9f58-f1cb89164332
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-102 with HTTP; Sat, 22 Aug 2026 16:27:05 +0000
Received: from dip7.lsn.ir2.yahoo.com ([87.248.99.16])
          by hello (SMTP) with SMTP ID 75bde3effed4a57533d9170ba446886b;
          Sat, 22 Aug 2026 16:27:01 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Sat, 22 Aug 2026 18:26:59 +0200
Subject: [PATCH] staging: media: ipu7: fix typo in comment
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260822-ipu7-utlization-typo-fix-v1-1-d1e551420be5@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMSwqDQBAFryK9ToM2wU+uIlk42qMtQYf5hETx7
 unosh6vaofAXjjAI9vB81uCrItCccugn7plZJRBGSinMq+JUFyqMMWXbF3UL8avW9HKB201GDJ
 321DNoLrzrPOZbp8Xh2Rm7uO/B8fxA68fDgh8AAAA
X-Change-ID: 20260822-ipu7-utlization-typo-fix-f7db2b4f928e
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bingbu Cao <bingbu.cao@intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787416020; l=1156;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=tVe2LYtwP7cmNVF6rqZqzLlc2/MlBW2liCa9ovPu6l4=;
 b=fLE/ENoASF+5NcZZ8m3y1tS6+mouN8eCG+KXf3h9XJveasjY4KhHaqdyM6G7T+NtTMUUZNx/N
 uOR9OssuXAGCl5CDGz1prlLj9dBYCbAZdyghx5VTFgDkdm7OkLQBqH3
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260822-ipu7-utlization-typo-fix-v1-1-d1e551420be5.ref@yahoo.pl>

Fix a typo in a comment: "utlization" should be "utilization".

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Verified with checkpatch.pl - no new warnings introduced by this change.
---
 drivers/staging/media/ipu7/ipu7.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu7/ipu7.h b/drivers/staging/media/ipu7/ipu7.h
index ac8ac0689468..d045e16bbcf0 100644
--- a/drivers/staging/media/ipu7/ipu7.h
+++ b/drivers/staging/media/ipu7/ipu7.h
@@ -114,7 +114,7 @@ struct ipu7_device {
 #define IPU_UAO_PLANE_MAX_NUM		64U
 
 /*
- * To maximize the IOSF utlization, IPU need to send requests in bursts.
+ * To maximize the IOSF utilization, IPU need to send requests in bursts.
  * At the DMA interface with the buttress, there are CDC FIFOs with burst
  * collection capability. CDC FIFO burst collectors have a configurable
  * threshold and is configured based on the outcome of performance measurements.

---
base-commit: c6eb4dc5964fdf4086b73b7f0f5dc0d595fb5cf3
change-id: 20260822-ipu7-utlization-typo-fix-f7db2b4f928e

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

