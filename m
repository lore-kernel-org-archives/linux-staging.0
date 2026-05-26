Received: from sonic303-20.consmr.mail.ir2.yahoo.com (sonic303-20.consmr.mail.ir2.yahoo.com [77.238.178.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAC33DD851
	for <linux-staging@lists.linux.dev>; Tue, 26 May 2026 10:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.178.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779791684; cv=none; b=n0givVD3GMb+DACP7e3TVFYARQmorO9Pd5mHvBMu2UN7i8qTTfES7v/fe+LNRqti7OOsmoCWRj+19olLQv2krADCpNKb/WOe16tb0eVPWSNjYlwZeQUImCBkrxHo4QaPrUPj6L6GE4dep/+Y2ZF2lXn3ZvgU2Wro2xkYphRPhKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779791684; c=relaxed/simple;
	bh=37MLDzTW4k5v7MfNqtdj+5ZF99GHK1CQjKS3ZcbVGpc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=tA1N1g41eWu3xPkxHToZ/fZx8vcBWrs78OVFOe7oPBWGNxFOgEPDd8NXYW7GTj2zt3/dluCBWPZvtXaFqe1THoymWT4nRvCdRskWZnedLZs//mQ++wQD476svAYobMTrkUBxFecce85aTIrpoxr44Je5LXVxz3TkFbmD9jv+vV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=QDFUvZiV; arc=none smtp.client-ip=77.238.178.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="QDFUvZiV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1779791679; bh=d1lRaJyvXuJxvoHCSKS4YsHriT/mGv6KU4lN0zJtoKg=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=QDFUvZiVSzSTY99lsCzjAhiLK6PeoZIuNCrq3OtBZ/qIXQXByG2wLUvWxMbjwlpAzVLkfyBFnAFLxv2iaX+/Fd2u5eNMqY5E48u6+9kmnxE4qc/nFqt+lD7adRIIiGhO759xif6VkoqFLMx2aSL6n05r6s04XwRreMDjOlHBctTv/xd1tSRp0FkLw3HpG8e+KmG02cptPL8nWWwGeRVepBStSGmKxeO3HT4Ka4GvrWlwcdI802kj/payyPKj2ntu9vOxjHqh1XMai6ip18j5GiCNcYSh3Ij/prjIeimUcFkdQeSbx4U/MNPI8tc5Hl4ADJfBtpx8xz9oFtqMFQ1wlQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1779791679; bh=Ws89s4kOaK/vsPmzNoqTjcipeO9ULzJu+qx8flLJ5SY=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=lqCk1B+vSDt6ISL/LKNuqQI91ma2qAjn29LAfaX7AwDs7F9usVmSfgoat7nbpb8fQCxQ6blbX/dUHjTy3QQHvfof9gMmd4s26bocwGpXK1Cz1HkEdlVs/078MlIxuyNZ2bjUcAIkLvM3O6FQE06sR3WpP/+kBROkDQOJjF3bMtGX4zWzc7fOchn7ZT4FeApoiHaSv+yntj9r9ruo6qsct32pu1X8E4HDLzQ3FTmBg2+NwU81ZCFkVhHRlz5U+lSt8aJsxcGMyg3MPADPOyyndxPKb+df9EXYnbylKmem6aaQ7JjVGXE0ziWsbZE7ZMa/2a/jHc306LmiJV/x3cdUVQ==
X-YMail-OSG: xJnGDncVM1n0RG4Qq2tYRRWyfsv4E2dBJ74YQOkHAsw6sXrnA6lvFHL4Xz8XqPN
 PtQ7KpQ.rj5D7t0zUEK3YroDSHpZiiTABgqNtkD02jDjPZuOT8v93XqVvNzNHsF51rftJxs6gN3u
 CB4zV0s5HIYoqTTtazB2qV5PVDulN6U2O8GK3p4SEAq9Ttq9L.MnBTEuKcR4_Jiy8vVpQ4qtskZ9
 nmetTfZNc3BaJa89NQ8JrZKyk_QuLlve6zyxyIBeXYf8tPyJezpz50w1KcHvjRIPkRYEf_lQGSew
 Y2MFdH2YTQ9TuPeg3qx.lZj2AWtLoSkHn.xDNrEErTPbKqMzsNQngvkrUJmvopfovHI8scujv2UQ
 _0oB5CaswChlwDDPzMnOUbBmr50MU6u0YMiHS4d8vtYTsesq2E0V2jkYaYVn3mfkcORq3zynsPHD
 GaJCzaEldwY5xcHHgSi9G4Y924RgS4SPAUum5efKt2oLCsh1zE6WKt6uxxBDvx4S9F7HUlg62F80
 XCFfaeeKKQebn3SPtOsrcggkGmdHNY9YxMFwwhKmMeBnkg_TpOARs4kK0KN.jLMxtSjvFLArFKx0
 mPZaniFqJZx5Kw4U8Tkj3b.XjG5P13mPH7TemeG1_wWw6E1pK64VE_kzMi48V6sMrrV87fJ64pza
 oXbNSk1TTyT_.nADtikIQ_IVAg9YKUJdobhWEsBz8KZVLQLDfIyNovMr73tNrpICaU.5rVpUmw_N
 7G2krI8vtkGAPSJsXbygFevUNPqzK0jkSWuzrS3W5M_xuSr8g7WfAe.a30k_m0D2xjEsLKnsPO01
 ytSFvip49NBPHnBz_ysVGUy01qvE7dnqRXqwAWImZcUgdoKheyFYXOC8_4qn_n5CuqQVaNpqQYjE
 e3In851BVxgeC_Jk9UyDWS8heaaS7Lkv6tUVVSRw.IaoxZzjaJFcRxxl_zj09XNTmxTevY_TvhXw
 lBXdWLxguuHbojEbBvSlWjMloLTmQO5YsnN4pr3fH3jQCvqjGm8aXjeS0vm6owNfOkaGvh0w3z9S
 O3yFPhFMiDSuyYQvjEDTjLxEwbcO8D6ClTSfn9XuQcgdSpUWaj5iwjiear0TSzPwED6JKmcnGegX
 AD3nxzhC.4Q5RIKhVyLd3Pp40NyaTJlVq6sjkEXqIJbABKS_aI62zcfRNQ6R.WJOafWdfbMWB8Px
 iCMWDoxBCupQfbEqRE9MTlkpplmvvj7Ww1A_WSVONkc4m3vVjxifJMvAyW3CZJAPxoI1hZcaYO7e
 _zZZmC4XFYx05tg_unyNuY059BtrhcAALoSRFZKLp044yJIUrrfDGWKVnqteeEcKiHvFjj2Q_T70
 S8.00p2hrQ7kHU0r7CJ0ItMTTMQgq_9EIrMiurOgD_j3OsTVuLuSyOtIbC_bLkyR42HLyhRwGKCS
 fnXkF5DP5lfbxpOqaWByt5CyVX7.tQ2QOQoJQFaU8A._kLyrCfY8HYkv0K18DVBxjXjfNAbcwSfq
 a_XfbqLDvjE.5KDOyWdYmWSt_9MPyHKzyPLJcNj3bzMI6N2oSAu3SBo2dULWhJO7tm2ItLVsIUsC
 ib2BPROzOHwLD8B1pGbTHeQNT1F65Uvbpuk7n5DgCHlraxQ5uNoUipB8trUfUaAp3TvH0degaBIq
 8F1NZOTOrg4ErL5.y9BvosVudK_2lZZGZOwQJArk.BdtcNDEZcA8DOQClq0U0U2pkGIosWPUqZSc
 PCqfB_l8Zn_JE7WWPzDdX.hMu62jEEgoIQcuxy_HMnJjOTC4cGTXd9UWwlEMw7LkymNBhx_MIz1H
 .Ou1DWam9nrFtlT5Qr.MvsQgUEo4IlJERQfKvRtkVkkHtz_f3oxZ198ynxOcVNwn64KdhWU3zGmD
 wWn0.61u9XAmyS9BBbKOkRONhZ.5OxMsWQX_PHtc7UGdjBMFYVNKByE6Eu_JEU__8X7B1TX7VXL3
 5TcIk2Q1wF0rL63_oh4R3PSKy0ofzeppBdkxCKWaeoZCOEJOhZPtcijeSUjMIEmDbXvfDdcla18_
 VYe4CjJTRx.QnIU5DGoHIFCV5bwtdmCb8hRmPZUEEO.SYEP7GgKI8VTA7RVC5dM8PSogDfHMpGo8
 pyHwdIlHrgsgxR1SYIVqMjv04z2RF4dfrTbv_1yyIjqYOX4NLhK5ASdL2gtCROYDVnqbfANtS5YV
 80kfbEr2FOmpIqcyzIGyNV9HfaWZzzbELWNESf4SD5Dx6Qi9iVMsL.BKz37TZNNr_v3y9EOgTtC1
 BBEZEwhX61Izh_7tlZFhPfkDnbzJ8SPa9DHxFsPtHSBIVs8NCe9sRuBXHRnDwAzXziByziiRxWjJ
 1zGjr_Mz7XueXE_2ehfG8nte2.NUt8ykjUX9qycrsvJOpg._nSaU0XoNkQw--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 617945a2-6d02-4f1f-9390-f5a78d3aadeb
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.ir2.yahoo.com with HTTP; Tue, 26 May 2026 10:34:39 +0000
Received: by hermes--production-ir2-89844b765-l4vp4 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID f6c6a09eadbbd8c4837994bdd2f91111;
          Tue, 26 May 2026 10:03:18 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Tue, 26 May 2026 12:04:23 +0200
Subject: [PATCH] staging: rtl8723bs: fix spelling mistake found by
 codespell
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-fix-typo-odm-dig-v1-1-4392b0c03e13@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIACZwFWoC/x2MQQqAIBAAvxJ7bsEWE+sr0UFysz2UoRFF9Pek4
 8DMPJA5CWfoqwcSn5IlbgWauoJpcVtgFF8YSJFRLRmc5cLj3iNGv6KXgGydJmO508pCyfbExfm
 Xw/i+H5i9erhiAAAA
X-Change-ID: 20260526-fix-typo-odm-dig-e8a4268e9408
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
References: <20260526-fix-typo-odm-dig-v1-1-4392b0c03e13.ref@yahoo.pl>

Corrected typo: FASLE -> FALSE in comment

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/rtl8723bs/hal/odm_DIG.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_DIG.c b/drivers/staging/rtl8723bs/hal/odm_DIG.c
index 4e28b7742bfe..c862c86b7695 100644
--- a/drivers/staging/rtl8723bs/hal/odm_DIG.c
+++ b/drivers/staging/rtl8723bs/hal/odm_DIG.c
@@ -590,7 +590,7 @@ void odm_DIGbyRSSI_LPS(void *pDM_VOID)
 }
 
 /* 3 ============================================================ */
-/* 3 FASLE ALARM CHECK */
+/* 3 FALSE ALARM CHECK */
 /* 3 ============================================================ */
 
 void odm_FalseAlarmCounterStatistics(void *pDM_VOID)

---
base-commit: 7cb1c5b32a2bfde961fff8d5204526b609bcb30a
change-id: 20260526-fix-typo-odm-dig-e8a4268e9408

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

