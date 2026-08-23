Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F65274B39
	for <linux-staging@lists.linux.dev>; Sun, 23 Aug 2026 15:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.82.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787497271; cv=none; b=mMM7PW1/YA0LcwDJQES9ixgXmugo0XXBTmpE/1uQgdgVg+IZkntw2nOy0hj/o/JyTqEfHXoRnNWKkP4oDWfloIeEBjhlE/6UgAnLlzqJMqnIYMML6I+QIEk/UMWuqgyEdUkwUS8BV4Y+j2tTe7ddpK9g7hT7urEeHRGjfHxqZtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787497271; c=relaxed/simple;
	bh=YwEYvpebI/1WIIKKjcjIoFVYKep+fz5A/xPQ2iQqK/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=qxpVNmjk5CM6UT2iI3DE/VJ+Rcxo1n4z6ejj1oddzC/7TzdISCpy9JnAWrpx9kT2BBoFLzI1Pbf8kN2+XhuHgVD0N7Xh7DMAq01yghgHLdsthVcQoGSwYwPhogQ2G3MuriUSmyfeYVeSUy2bCItDzedvvIknq8ZVLNPJRHnHJuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=LDwRkfpY; arc=none smtp.client-ip=34.2.82.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="LDwRkfpY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1787497267; bh=pxmn7zPtl6Fo+g1JipPiUPK2Jnhj7sB72FmzABEcSDI=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=LDwRkfpY+1jEHD4XeypYXrNnVhEYFLh8o08GivtP5bx0IPTBbLXfFkbXYUmy/JJHuSVJbXe25wUCL8MVxQoYV043SIMoidX0EJoXAgUF5RIhDKDEs0K7TLf3Pa7QSOn0ad9Z63CMj8YfLquoK1Y4ye3m8KW3/jClPIs6Tu2fTBqDpJvSebTWTNenQzyjVEu5275YzjeYH4mryZ7sdlqbB+ZFdiTa1jq6T/DTe/g9BeRjkuKu5ZVuqHOiqcZPBZLG62Z9BU8Q0bMUt0UQTqL/5GitNzVAKrBbZakGXHHELH3SppTEGA5hiDMXpjNVZkj1q+n5h1O9iqAYeuZYXAhrbQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1787497267; bh=EKBABn9zV6y57CWG/+vuFKu9cP8IkMVvwu3Hw3vfBGQ=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=BE/RjSnIQIgPNwWdfmwZWriqC1JMLmsVp5RB1T8y18J8GrvYvWx3wUM0Ph8TESIzz/avRba735CQm3DNBLPbw9O2TQ+Qlt2ha/rLq0pyxamBrYRTlMb0f51lKuFdFT8bL3lYsmWzaMwmTKvXau1QssWOEWIH8aZ7d7cMtPJsL5pW4dm9+J2EYDqOWHwE/o+cDt+ZN32P8i2HxJsQiXhEPSowqiK+xnsgIkGsK2DGWyCX3zsOSiSCDX0C1epMIvgxcZiiJsVpXQJ/1yyuV4B6H/MkbUhcrT3DUR9Bm1bJTlzwFwsKQNuFM+PVJEaTcHW2AqpUXzi1pQIVcROpTLqp9w==
X-YMail-OSG: 5DrUxnAVM1kchKrQnU_GDKjsaPYSNOHgGdbspcZf2cAi4imoMmBC8sB1Ao9VBeP
 0GigHNcvsCnKg2iKOrDvLu1LIkAt_X7F0HIU.BhidB2gMZtdx1GIhJGmvbX2HaLI6HejV7D7NXgk
 6BQCYtdFfC_eJ7V.jMdFefsCcx3vEG9GD.gklh_Zzx3ATdz.QdGXC4Ph1bkscxJmjc.UDeUikMu0
 voREDn2l0flkY3NqN1GOLLqq1o_BN4tSkmJ6BKcDjpIPspylG3.5_PA.REz6JYXBIlrCa5aXotUQ
 _RajgmYmMQdrbnuCP3CrA1jVHSKMpr4V23z9SKvleSe.YZpbYXpy608lqNdFEDNEKyYKR3_sMo0E
 uI9qEb2Q4rUsqsuJcWxyZkrbDmRqCerEK6hkm8f33UmJXhZbjADKuXXx4AlVW7eRepCpJGfm_saW
 TTy5FvMhZp5sLuuYEjnAML6PL7eixMCc.VSC0CwV9zimP3uJV68BG7Yw2uw.GuQuwMGeMDiUt7Bv
 avZG0LDrSr_BhtsjjOnNRkGmiBLX4FBufJOw5lARqhLjW7fazAqfr0nCLIkCx3I_OM3VLvPoVN_X
 pBzGQpIITuLOg9wrVERjIljnESd0K_ClIDoBvEeVFBZVRDXPWIRR4l_hPfoFA9XuUNefW0Qg0eiS
 YjZaLMMwRN7x_ucKjSyf0_Z2YZo60QFAEHCAY8EYpX9N5K14.0ugPHzribi35BGqbbxLYfNgT7M7
 4P57Dz5vl5yuLzU4Tz5XHzm0sLPcvq2eaC75bcKvbz0GDSBhc5PtpjeyoomM_m5FJuccEWNjPoSe
 ca1EuMd64o8vGNPOPhuDvAyR4_3Cr0loUGwLleajfAVY7KLw3NyQwleebkWrDZub43r8npJslqXi
 iXHV970vea8iS.dwSd_st3WShh.VyvTjapZZTwlqcq2KXperotDTgdAtFnb9kM.lWmrIpAFlhqmJ
 NvI00whk1nddCVm0HmIbykn5zgO6AAUKmpnQYvArGFDm8.G2G33ONq98V48.FYPH8h5snv4Q044N
 SYs7in3zJHK8siXF5S.pu0ndGYXc4_byeNth5YV0ZOVtGx1GdhuwcCWKJeg4G.v5dbX3AX8rLCoR
 5e3RRKyJOOFQAUUZPFbuTVVNTYFMrijIe67Kg1WFmih2J9Xfvpmj6B.RJ68LUFGKWBVGQ2axtwKq
 IvitypDeUNSKxMdPvYp8osKmIqe5XDrv8msBFEzen0vm.aHrNwrvW2x0FPV_L9VRHigzwC56fVNX
 .GRgZ7zc0JAwPeAxMkBjusFaf28AHA2y_H2oRoVA1tXS7MjmhUC9nk7X3F8.fPSE3ZLAwAUBKZOk
 kNKWypMMgWOl8Wx0GuqYx.vVT8A4IpEBEPvooI7qVQqB69rZmug3i4PqAJYbE8mqowOfY.QqNCh8
 mRblNfZ9bnTMuAulwB6ZjTJc8MF_oWEnEwHKUqB1zzadSQjJ2sPMSUpqRVRPFNTk4rpSLv1d87Yx
 hEJ4UUreZkkOd1MWD2hQxz5OmKEGhFZ5Q5YbOzg0YboP5Nn41ns1aBP0dP_y6amF_kh4DSsXPDXd
 ZgvQp9p7MOAXJmmgTZRn02uMZYqQ2Xc7_Cakt1K7N50tduOzmuHnT9lKhcFvNv9BupVyn0REa9e4
 ryWqROzxk.4xC8hPQmYxyFgZNDh1IJoEa8vv4h2AR6TxsfdtqyNWj2bbzXocQQJaEIurvarm8zqk
 PRQ8NStuKM4.Hw_HIoPsh21yDfPdxcs_Sb70V.m0QBmn14MSbgWmpovARfKraMxDM_h34AfsINst
 KM9TWwb1EZCI6TjxUGRhyCWx90m3zqtbDkGt9OqqDvNeiDG5vYzD7o_sU7FxgLsz9nlrr6sL_QpE
 fPhd0lku3q46BDjRKRsL7Oncn004UYIR5EHmBL3f_WhIQwKB64iXYj0Iq.PMYHKXFaCn2HOXJYyM
 oiU0uNJArvPdgVsIhndgrj9iAsPnqQ8q5eUm8M7WVGqg6zPsLWYDXQAse1r5Xs7RljzuO8ryvzNi
 rcCxee4KuROc.4I9zGDLW2ieAcrweCKlK
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: bd8ae101-839c-467d-bc53-dd4b1dae51cc
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-101 with HTTP; Sun, 23 Aug 2026 15:01:07 +0000
Received: from dip199.lsn.ir2.yahoo.com ([87.248.99.208])
          by hello (SMTP) with SMTP ID 1a42a50086db3c12e8fcd5319afbe518;
          Sun, 23 Aug 2026 15:01:02 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Sun, 23 Aug 2026 17:01:01 +0200
Subject: [PATCH] staging: rtl8723bs: fix space before tab in odm.h comment
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260823-rtl8723bs-odm-space-before-tab-fix-v1-1-aa4a5b255a5b@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ6CMBCF4auQWTtJKQYar2JctGWqY5SSmWJMC
 He34PJ7i/+toCRMCpdmBaEPK+epoj01EB9+uhPyWA3W2N4426GUlxtsFxTz+EadfSQMlLIQFh8
 w8Rd7O6TYunROZKCGZqE6HyfX29+6hCfFspdh235Lz3KGhgAAAA==
X-Change-ID: 20260823-rtl8723bs-odm-space-before-tab-fix-627fc18f4fe0
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787497262; l=958;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=YwEYvpebI/1WIIKKjcjIoFVYKep+fz5A/xPQ2iQqK/M=;
 b=bAgxE1IhB2je9elWR28HHUDlQbSY691u/8Pti7NSnYWHyDPDDYBrFbkEJZNMW1bW/M+uXOLMW
 tvPc+hohbnYAPvQpq5CM/jUys18ZvGYXsdCbKyemIKY2lRq3i3wj36R
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260823-rtl8723bs-odm-space-before-tab-fix-v1-1-aa4a5b255a5b.ref@yahoo.pl>

Remove a stray space before a tab in a comment.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Verified with checkpatch.pl - no new warnings introduced by this change.
---
 drivers/staging/rtl8723bs/hal/odm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index a20b48660e63..43d37e149492 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -379,7 +379,7 @@ enum { /* _ODM_Support_Ability_Definition */
 	ODM_RF_CALIBRATION		= BIT(26),
 };
 
-/* 	ODM_CMNINFO_INTERFACE */
+/* ODM_CMNINFO_INTERFACE */
 enum { /* tag_ODM_Support_Interface_Definition */
 	ODM_ITRF_SDIO	=	0x4,
 	ODM_ITRF_ALL	=	0x7,

---
base-commit: c6eb4dc5964fdf4086b73b7f0f5dc0d595fb5cf3
change-id: 20260823-rtl8723bs-odm-space-before-tab-fix-627fc18f4fe0

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

