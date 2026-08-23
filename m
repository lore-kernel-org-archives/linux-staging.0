Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978D4165F16
	for <linux-staging@lists.linux.dev>; Sun, 23 Aug 2026 16:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.82.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787503602; cv=none; b=Pa4F4L0lEYiFCtAjalPNs2+FEleqUjytWsFRbgc4nd2McbPA7QTSyOZpnLBIiAvxL6fX3DcyIHhkOh/KHZi2sLv6NSyGL5nZ9w0IeBVMizAipWb/d70UAEKHo1E9J3xqceFvnWE6ATshPwq4BZED0BtTctIZ8j2uF7eFAyu3q3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787503602; c=relaxed/simple;
	bh=U/fQTeHT/i0WBJhw+T0gLhegZd/MTV0SeIUUx6aVbkA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc:
	 References; b=PcxQFjHj3IO4cQNX0cJitN0JlLwR5YjdbgtQxo1zDD4ZKg5BwAQb+kfI62wBspQhaQQ19UM+orDLqsK0pDJCnfgy1s5B3DKPe2qNvN7ptLxBRA7YFbDcEHB0CRTaK9YR75LZWy501Hoy0FRD7haHlixntj9LgHFsvmQSfOMisso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=gys4SOXD; arc=none smtp.client-ip=34.2.82.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="gys4SOXD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1787503598; bh=PdP9+ScQBzZfTur8pIstSvBh4ClEeMKS3zGNJwigcR0=; h=From:Subject:Date:To:Cc:References:From:Subject:Reply-To; b=gys4SOXDFNV/VO/rpXlNbptRLuceqrAOO8ImMS9k4XeXiyum3BVThzAbrW/9/g3T9aFn/7dPmp+C/O6u982MKbDm0TiCUt0hHl3zLrUGCuuiRv7jz+qzEwz2gD9WbAZy8mafoLVHFf+do+AdQd+eA/1+QNiomSEV2FStMwGwyD3Y3pm66o1b/nBzpE8y1EOrGf3IstE6t/gkrrW1o3LlvGYE+KY10QcwyUSp238pagVJFf2kKQ5tfW8AhcU73NkLPMEMWD1OFmMH+ncNLbquswDkzVY60iqqNOhr2qnkRNaGW+jE3gaZDImrB8sYt6C/znhYtZviQ4Mth3Mn8C+vLQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1787503598; bh=FQ1EFCmNX2VJaf0dzzdyFuGUhr5VNQzqBLoos5SL1YJ=; h=X-Sonic-MF:From:Subject:Date:To:From:Subject; b=BhZtXhhbj7GkXiITthqLvHs8zUJQqjuPimXgtwwtqSJl/HSbg6Xn+Mlxf50ARWxW3IuwCekUwxFMLAwuEhtRvitGZ6R0HCuQS48ysDt22vtXGatzDx18ATheSH3paRkyStkFcW99UOuZaIVWy6st0bkJRDEwoux/TPrp1h9qUe4revv94JjolTMhFPN/y91ml5KVUvyy7u2nfY5H6BY7inJGIvKrI8OtLfDvBkX9QSOqUh5e2Q21aLWjOdgdKwXGT/weTyBBjmXT/LsYlvFZbSoRoFsimNMEcXZJIhmhwsc/2dUDCZbzRX+wMgHLouIPsqRbP7IQzsYWxvdjjfVAPg==
X-YMail-OSG: e9I_lv0VM1kMyk8tsr1D0fznHzXAkl7f1vAXbqgtNUM9I3G7TkwxtJIaESzYmT0
 OQJW1BkRsosajLzuPk.vTfG7KNQhmoPrOnzFQdi2hfY_dt9cw2I2wOarh78WkfG.T1OsxrPYfX2F
 jRZgd.SNDU_s3JzqAas9Sjk5Anbwq_tiKl7qZ1pGBtQSzBFtPIKclvU5u0AxRAF9OO4jwnUmsFPh
 obb4TwORIK6gfPlSiWXbOVp3DfwQPxbHMrhpPWLL6DLD01QE0BZTWJxAzA5guoRdbA12FefooFk5
 j3dELtqEzSO58kbKO7e0FN_G7g1F.gbKOPdeH5PONvjBVVfcgtCzLsVDKK3Mu9URXFLKHrJ2dhQz
 F3Cpp__EOcBHt_8PC9BOieww07uqXGX.T5mESM25DbxykNM9_nwAJ4evfqchocPxDt.8jjDJaSHF
 lhZPrfqoJ.lZG_eQsz_2._9DNMSqnZF_w3G7JfXKVmaJdo47g6arA8azyC3c6hpPrmvXdw034tGu
 TUL8YbzCMselFtAdu8LOO5wsvRt8.J4o4_lu0JzNVW0AQwOydWz_RODGaEobrC017OLjwZhiX3wX
 pxJHyB3suSfCCHcXfAnZBpzeZFx0FSyj2n30ut5QEz1J3x4fS3nog38EZ8IfswHAdvCwWntn2N1X
 af7Gy2e.g4bngoT4ErO7i7N_LhQZkv8yyJv2PmN2Mu3TDgpiDcYC58UhvDY1P8.nk6ZnyKiINomY
 JXmrQr6BOSLX78NGofsVBufVnaezJHWdGidLyCfnHRLHAZ44qZf1w2dneugemcFvizcNK4G7nNRW
 W5s9jKkZfbiHsfX2KneJJnakTHozaHxerkdJT07x0cg0Nh1p3sgeXLzspNj6342c69IGGnd2vNdm
 tA1o8DiuDbqd6226p7.OEWxBiC3b_LMBjbvYg2Y4AQGp1UAjzDPPqLOThH0_VWL.V0g5OBMhg0yD
 TFeT_dCw1gA20sKQxyeaIq.CCuGcISktH5mIs1tgumgJHKk4sivdVnaI39nxfOQPrbLg7sjQDWVk
 MBUdUDLCPFA956R_lR6eOoF06uf1tYqjnR_f_2tbY7ILhW_wY9YQznxtMH89wSQAWfUHRhDsLIFf
 RPhKY0G5GtqO6fU1uuX8GP84qKNKIXRN.lIDQxDXqAAxHGO8qKg3z4hS_jQ5ZtZiZzAWCrtiPikn
 nvTvnSEL811KfCv4MmxIEQBhk7iAUR8La87G7pLq1IjnLJ8HILOWcu4f7_nJyTAalFv0eecZQ6VS
 krusaw2YRtJK7bT2s893M0cbTUkglNQePVa.wSuzDTpgxnH5kvKtlifyve1uCR2EvrAg81oSty12
 dmr46W6KlfhygkwpzES2WWjhBZUyhymbN93QFPJmPopT0nx2Z9FXpMrkm7VMYEloKBuzu1TU9AjX
 pwi8G50XRpaMpNEVhvV_2dT4IvZojR3Q1Pv.vzCDn3dHVNc9ZFawFg0YParF3dwYCs47m.OZ4a9L
 Xxfu9U49RMyzpNaeVZUhpz2aUE63UBsebYgaechCKR_rCF8dwOEy1Syg4fZOObb3bMUwGM.dSjPY
 U0PPJlRM7AC.2oaMf7mZ01HgAM3EjyAhplMyw3fYLlx4EDp6OPplcNloZHRORzCLDbvV9HJs9nNa
 miFGM16Y1h1f0KpqHmX9SHFtf_fifuaX9ibW9L98LDLi_5JWWAfXFNM7MTpfdwpnft7nrKwSuuyb
 HtQSkDwJoW8Mqadv61VkboWdzW2.EmFH9RUY1cHkKN1j3y8SE1f2MocgEFMzZqsFQEoI178bHDTB
 QjfNgf9XlHdCge.L1aLKakfrG_cvO3ZKpBPD6YKlJJm9MBUXHr2Vpnwjr6S2UOA3XsbJHAgN_nGz
 yb5RiAcWvFO0AGtcwYYN_KFUGsWV4GkDWYwS3jiRzx30fOXxIT8PlH9W3vNBbNNZLNTrQkjmllkL
 staFgiX_2AMijDdKZFldyOIkXR32r8cr.uM1d_ntvLNfErydTf7f2KjkUarX3sNk9.GssWDzsa92
 IRx7o2QoxX5tF9QLzRVTOHxmQ9LC7oJNJ5BYvInulj6ORuPc-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 9bef52c1-ce7c-46df-afb4-5550c416010b
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-102 with HTTP; Sun, 23 Aug 2026 16:46:38 +0000
Received: from dip173.lsn.ir2.yahoo.com ([87.248.99.182])
          by hello (SMTP) with SMTP ID 5d2b60595e62a328da161988bd9de51e;
          Sun, 23 Aug 2026 16:46:33 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Subject: [PATCH 0/2] staging: rtl8723bs: fix space before tab in comments
Date: Sun, 23 Aug 2026 18:46:30 +0200
Message-Id: <20260823-b4-rtl8723bs-cmd-xmit-space-before-tab-fix-v1-0-11f2600e470a@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNSw7CMAxF0a1UHmMpOClUbAUxyMcFI/pRHFClq
 nsnlOF5g3dXUM7CCpdmhcwfUZnGiuOhgfjw451RUjWQoZPpyGJwmMurO5MNinFIuAxSUGcfGQP
 3U2YsPmAvC7rkIrEh61sH9XDOXOc9dr39re/w5Fh+Bdi2LxUwW3mOAAAA
X-Change-ID: 20260823-b4-rtl8723bs-cmd-xmit-space-before-tab-fix-4d4c2e023a54
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787503592; l=732;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=U/fQTeHT/i0WBJhw+T0gLhegZd/MTV0SeIUUx6aVbkA=;
 b=zD9hf7pkncQ9egZvTl+JNQqH7CPEtwCaA2NbnRG8R/5p+KtYT6InBQF42Zn4TFLT7YqIcl9NF
 fPjRwvWWH64A6QgJxZWi4w2ZQw8kCspdwlNAciUefF4RG9zclSItTev
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260823-b4-rtl8723bs-cmd-xmit-space-before-tab-fix-v1-0-11f2600e470a.ref@yahoo.pl>

Remove stray spaces before tabs in two comments in the rtl8723bs
driver, found while auditing drivers/staging for whitespace issues.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Tomasz Unger (2):
      staging: rtl8723bs: fix space before tab in rtl8723b_cmd.c comment
      staging: rtl8723bs: fix space before tab in rtl8723b_xmit.h comment

 drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c      | 2 +-
 drivers/staging/rtl8723bs/include/rtl8723b_xmit.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: c6eb4dc5964fdf4086b73b7f0f5dc0d595fb5cf3
change-id: 20260823-b4-rtl8723bs-cmd-xmit-space-before-tab-fix-4d4c2e023a54

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

