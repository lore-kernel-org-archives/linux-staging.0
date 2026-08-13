Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6389B485518
	for <linux-staging@lists.linux.dev>; Thu, 13 Aug 2026 16:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.82.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786640366; cv=none; b=rthRQ0LMNOXzdOiqva/XCHU7Jl6BYP0jHsFVzGiJ8RlzKVnMJWTRgr/is7PuIRzKrkNaiQpHwOMuWREQwt2w5ybUNPv/FkVGFSYo3kUtf0Uk1IjPYe0S8BYdQTs406OCvuepqMO2vvOr7zPEHZ38O0KRUQdytCkn8PNI/eoTiek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786640366; c=relaxed/simple;
	bh=deheVz6EbziO6lh3IHy2gLuNM1X/uj8YtA0JHMxBanI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=H01GmGr1wckRoE+DpMctZssg9H/FfM6AQ0T9ESJaxaoiX8g0mPc01LJc5FTEqChR8CaqVSQOO8hjM0SRlrtftRqVOLSmGus4b6wFdeh3KsMu6MYgDwqDxCpL4PvtQbvVQWIN6Rxh/FsxVnNtREmWHAKbgbXYbeIJLYGiGM64wxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=HOxY9PqQ; arc=none smtp.client-ip=34.2.82.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="HOxY9PqQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1786640362; bh=JizmvpkgHQ7shMwyqDODWSUaf4k34aMQnLoLbYQLanc=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=HOxY9PqQD+2jzhAfjtsn7vlFLEP1zh76RD3sgLpZrxgTf0Ka++D3cqIbNUUGKyJehV6rrQeY/+eHgNzP+khoPwHArKsFgf3CPsRKXPZUfXG2RZhHchh9f5hotzNjadp+0yiUmKzMkH1pH6+WD9EKFfwGVJRzKFSlSBPwDL+udszEoq2dkl7odEpoiJSra1lnYAAm+PcyBYe/rQ2WpmO5oJSEjq/Z6ds8Mq6udfRTTzW/rLazywRfVllBJS6M1yv9PsSyIEzfSKWDw/7JfCOWqrQOAJpmmo1G/SQll5mmWWUajfkew4jtYvml+3ugiLJfKSYRjcNDmBHpKTVFyyuCOg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1786640362; bh=Md0Lynv+x8EhUFeltoTHPFnwCwYbnaz97W8ZgxgcNQI=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=n5O/0sC0A1ZGukr7sHyjvigHSZbQPm39X4zdo6Y94810YTIV2MI432E8gBZPY3lQ8LQihEqXMYd/X6/tMCqTkhb3J8lwHc7f4qr8MBCzUoRrPSKp8wEdwXwzELRKfTiBqERZikihGWuGr4+rjCYZhFSOM1KLlMLIjzOU2lldf0iBVbOufi7IKJphOA74MlV6mFdb7ZpLe1P/RQfqZ/k6g/CIBhjnvwST19dm/P7I1YdR7fdZXpYOJrXZpD5FgR1eutWzSudIFTONg0mMVyFXOfRwYI4tJ88H8/kn3cOcLVXEBZgDXNc9WHcUXdbFdBCj4WGtLLylD6YGMY/SMqEXmw==
X-YMail-OSG: gBa_3B8VM1mvRjQk_.nIWqxwWn_5w7oXy9FhbmQe0Lxfa5KbTUs5rN0xi1AYLtd
 .M7vVdag.uXDKXZXQTPBGpeEIpVn.sjG55Ugay7nunqKnCrPgdo3CDYpgW9Yvf5LXklXaal4B28u
 PLO9W4dGpl.QZ2cDDyxoENrs3Id37jowjYjLiRWYcItlTeZ3JgaCCBEvurgDkgYgqnBxg.NQeuD6
 q8vj4d4l1_4N93FVi9Pv5wJ3IMtWTzNx7Pv1P7bOXtwRFCwGom8K3wUsvUgzpfG7.8wKuAbPY5_D
 Wpln5eN8Q0EOsW7_yYJFntA32Togse75z7Egf.RQH1eioCbHQBICwFonevFuizgrt4wYrFZvMv2P
 OQtVcD4pa8F74ev3lzC08MIJa5vckLmmghtpsL9i3LDkOW5V_9mbkt0RETxMfuN_WlDQFpyxcbQd
 fficSzfsg11JJtUjzLvZaebywrgdrQLPuT93VTM1Xio2F8L902fiIdXBFiYLW82TGk1KVUvuI7Ik
 NA.0st5bBXIrhWLa56ZrTZYzfYiNBkBZ2Nv8U5xj2w6Vq5Tcof9P8UFFOoLBdkRx6lHaExX3Ydqv
 UePihm0RHq31iFWW2vDNXM1EcEme78t4LQuOm5J8ZG0CB9eR4m7mVhAc3g2NHTQmvUHSnREGqWbG
 mZUwuC3EzMIFXB_NXlwyZjBM3KCiAKiF9qt5P4QfMc4WDp4LOJSLpk6aAB9CSbVsIcaCIDLPkz1u
 9PBNtjZT3cb5uGNxjGvU.oou0FrHS8N48T779ddNyp9TfJGCR5vHvMspy9BHGYtPj1OTIAr5Uaf.
 ER.hkpg6Zhb9DpMsVxm8aE0D.jY5AbHf2c5fyqJG2waN0om0DpcIir8MDBHPFUCnzYMRTDQNpJkH
 uf0YmvY7Q5l6vZLVTezn75sNOgC9Nuz1w3bFTd5s_BRHJ0lv1qrqlMB07hSy.GCFCqCZu1L4uELD
 vRYW0nCQCT5BoZZNFuC3sIjmT5M4EcjboPWixQC7jueX9rPCAO99Rqgghk6B09o4JpP2fdBL5bnl
 RNYXozQQ5wWDVCG4jsfy.GNs0vARqvyAKDbriM8aQHwiE_XYa3F2J32ecOc6HLjfnGNulwkQsiW8
 IZpMr_qgm1dUdXFdy6pr.7mrAXTTBNB_Fb3ZQ.MEVKIuXpEEuU6xlBQgKVYHLh4fTUlURj2km6he
 RRWj9dGYI0IoyRncyslAWbWbF0zgGvWQ4u9X.7_whC36pgeUkO2veg__uZ9zQVXy9dQvIn.goruE
 CgmKWYJWQraeoJ6HCSZ_BTxEvdBkqLzwRZh.1jHOoe7ooqaBbXO_EKtlC.k3LRyiRlVy29x9hFY3
 0qJd_BIo8oJofoaydlaUhKNw9lbjRN0xQley1FDhjzPdKEXNosaBjUVN.wr0Cvl8jAaySdXPfSFy
 H6QysOqZMVPOnpNynmMzeaVWZUItsXgDy06obBfme2OpucCW7dsNkcPiqKX8lUzrhO9HbtLRXLFw
 PZw1tCaJIX6ewEYlwen4mFn1GebhP1qiMpRoXZ1QCQWN32_OyNnVpOQSxqb6CFQtn4qFI3hFzDEF
 1MfDV_FeCx2cOAZCmxtZkw6HGm8qCmTdxCiruPiOEntpjtXN9WFQegLzIXnh1oMVQidRYyXz9.46
 SMFPTtgYnv8kk7Tlcrm783S4sA8td.9HcO1rTOGFWf1DZ7oSsCo6_IK.sFVpqoZmOtbx.lVW.mC7
 Sbx_4bNAcwxPQNjE6Lm_lheIKfK9_F979qV4y8UWNIrD9ZmMSyIvDDWmurXp1OGywS3.UiFsAMdd
 zGZuB2RMwrut3RtUtCrIupuYHnqJ1GW1z2thqXBlgP5QspTBMIJ6P2TBRIz6mHEsOEZdy2OtWJeR
 C3h0Lz1qTOol5rSk9zueP_JmyAmuaGEGK7nv2MkWjjSDcok7h9PqZi94xjC.E4q89dI8qicoFRwO
 IKaOlOy_.vQKG3JxpohN3u6UiS2IQ3B1NcVZ03_0KFhmxUfuBmIxzM1XawjW2QKJvQ0umCLzWJj0
 -
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 00ff135e-0536-4402-9714-0ae4b0d45c4f
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-102 with HTTP; Thu, 13 Aug 2026 16:59:22 +0000
Received: from dip2.lsn.ir2.yahoo.com ([87.248.99.11])
          by hello (SMTP) with SMTP ID 5af242c419c37af97605f8d8a2f48edc;
          Thu, 13 Aug 2026 16:59:21 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Thu, 13 Aug 2026 18:59:19 +0200
Subject: [PATCH] staging: media: atomisp: fix typo in refcount.c comment
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-atomisp-fix-typo-aswell-v1-1-0aaf45422cf2@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMywqDMBCF4VeRWTtgUujFVxEXk3Rsp6gJmdgL4
 rs3tcsPzvlXUE7CCm21QuKnqIS5wNQV+DvNN0a5FoNt7LE5mwNSDpNoxEHemD8xIOmLxxFp8Cd
 jyF08WyjvmLhM9nLX/62Le7DPvxxs2xcigj22ewAAAA==
X-Change-ID: 20260813-atomisp-fix-typo-aswell-afc711ab9ce2
To: Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786640360; l=1133;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=deheVz6EbziO6lh3IHy2gLuNM1X/uj8YtA0JHMxBanI=;
 b=imDm4e1qNZaoUWBwttLWhFYwvMOa+STREfScuammUYh0dyD6Ts/Z/SAerSH/qrvSM/YTBEoah
 VoFDMy1mU5gB/v1areY5pHXplWOqMZgoGQ5DodHn4lghKyWPVRWufqY
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260813-atomisp-fix-typo-aswell-v1-1-0aaf45422cf2.ref@yahoo.pl>

Fix 'aswell' typo to 'as well' in a TODO comment describing
refcount support for memory types other than ia_css_ptr. Only
the spelling is corrected; the TODO item itself is unchanged
and still needs to be addressed separately.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c b/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
index 4a8675d0129a..5947f9033b89 100644
--- a/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
+++ b/drivers/staging/media/atomisp/pci/base/refcount/src/refcount.c
@@ -15,7 +15,7 @@
 
 #include "ia_css_debug.h"
 
-/* TODO: enable for other memory aswell
+/* TODO: enable for other memory as well
 	 now only for ia_css_ptr */
 struct ia_css_refcount_entry {
 	u32 count;

---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260813-atomisp-fix-typo-aswell-afc711ab9ce2

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

