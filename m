Received: from sonic306-19.consmr.mail.ir2.yahoo.com (sonic306-19.consmr.mail.ir2.yahoo.com [77.238.176.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 424EC3644AD
	for <linux-staging@lists.linux.dev>; Mon, 23 Feb 2026 11:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.176.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771846868; cv=none; b=BczdEE9hBJOtL0XgqOsFdxuNJcWemgB2+u7CORkiZ6pBEmc7KsqEwIbwkufYbz2pfsYAwj3tjU2wA/UNYkcvxfitGNjY6y0kiWLPt2n6bSffwS22PY26O7zKDA05Ib7R7+a0tX7Hk0lbdiOc3Id65ZtVWJTodGzYDJaaBALKLIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771846868; c=relaxed/simple;
	bh=gWUV9o8F6Tw9sZ8OwWagSZKx+hP0AGX3mEhK75BeuQM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=pgEUM+8upbVrDOjVqxACjfcm2EEAwDx3pxRSQrh2NvP+YU5Wl9bL+uPZ/7bOTjvM1oefjWC3ynipe7dCD9O6DSjkfTnDv9OJ03VDlURyXBa4drc/wQ5UtgIcqxI9RfxWWsxyx0s+kI+5tZdvAwcK94fkNRuLqoj6HgSuIs431Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=SQW5XqQ1; arc=none smtp.client-ip=77.238.176.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="SQW5XqQ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1771846859; bh=KlqfZAo7wkePebocmjcVInkUNnKwXct+4VOWOXeO8AE=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=SQW5XqQ1AYJAHEemOBtwwOMZWf2Z7+4fSWJBFGUcusLSReHKesg4cXwm8/nYxrblVhmFCsQdWz7X73aTBn31xicqyernng2+uI/UoYzzfHNIS8qTYkzdBG30lniwRvyVmNjJ7AnKpIakBrlY4rk/HM90exuYF7sD+7NEmYOUoFeJAWxGqPaibwKiOCY7jDuyjhD4gdpWL7wUWc+0bPNguHYJEQwVoySw0U97jtQqtO3JMJ7zeWYwGd0iUx4Qgux/JMAcR8vcijAPv6lLBrxAvYY9kNcrz6tldhG2Ue4TYlmLqTKIFWz8IaPRG0yEViEPKjv/7dXsvpbF1EVI99cOIA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1771846859; bh=oqx0netap/rB/+1AtackN3bunAPWIb70afnfabPJgBH=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=C29lxmXpp48rN7TxCMCtDGm8lqgUWnnWmt2IfvbOlrsc6/Et3CWxdGWxJJZd4Bphjo3V5q7IInvQ3i+I7TCrHCLckKcybnlRdIv/6hZJ1x/tNiOQDIA3OCcdqtNcVZ7vx1sZCaX+kIfsrVqo4sMizHpemkfVbZUZF7Cwyj5j3HDzBMWOdhHG6wa7o0x1rKxh0jeKVg+BaReIoVeCSaMQ4YaV7he5/d+wANDi4nDNOh8jWf3Adi/lki192Dgwa/WmsvIy1iYaN82icHQPDiLWIuSrP84vq/5tLB45ZCOjNt+o0tVo1E55wB9DLzho9CdhShnochJxYMtOt9/WxieXEA==
X-YMail-OSG: pLeRwakVM1nWFpqrKbrIv85BT4KqJnlqQD3B10CYrRAC_PjjX2aeay1Otb3u0en
 Qp5lYreOyJ3p4S739x4Vjx7KND03_BdeGH_G4ON9l6xDvTLbGFy1yrPDcsASD5LNlPs3MjVTsibj
 ag53osj5LN9QaaFjIr9hVAMpyN6qaDGbI8Q2EFIq2F_9eOLoJGi1PRSXy64WarjFqPNyYdZU7BBm
 9vnOz1MoQsYp0eb8hKHLpdYbIF.iuelRnzqNEEsg3yh1no.t2USLcphmfLnqEp2wIBnFz5Zs2kAO
 y_3HmV2gwZrCIW3Em39UPHUnkirtqsndziRIJe_RjVD5Qa0etlHKiCE4dTz4RQDJH6IT9tddDVim
 7o3qvhGlRbotOWJMHd7VJWGITQTO40EwMRNChC8whAx8Vk5Er7CVZXvqIGazXoHYDdbKc8h34Hpt
 qBfXDNhf.0s5ONtxF3dnF9h7aODdFa2TcPSnU9qNBgqKxp26P66XwbRMhPqUU.ioTvJkJXy4rLwT
 HJcjNRqxbhZqTW1I1MeF49XP2tYu5J9FOJIF2GC4oNKa3vvSy7M9qEhyiwKHqyDNhEDxofYIFF91
 lotJ5SNjapc3Qq1vizETPISSNFeptgyurR2JpLDR6AcCf.zNQVxxroGvY7f0h2eQuhkCUWmMlNZY
 6rfPIxIfkAn27AntBH2PU4iF5e0nBUQGMGb11RXJxhe9iP9y1k4fK7ezz4clbLLg3z6yO8fs34Hb
 krU4KiZivFaTpmHSA.tVttkLct_abVdWcOQCVpkRYZEJkyYde1oK6JIs070mOV1OXDqlv_FrGJKH
 dpe4Yus7wXFZivfzd4LkgO4_KBaGlL2e2SdZPe0g1j6qKtH7QtoIi6iT3c9gQLmvQcLg5hWwkgao
 499ixsBJUWQBI0ep0t0Id348SYwZNFHROgETbAbQ9vjNzRJe8nkx.q9lLqsbD.ODCoOX3SilaLks
 4O2jBHHneab15Lf4ZjbBxJ4PEToK_l1EgEraAzGIbk8pV1f3ytrnHXvSqYZmp1ECi3fPnbyjbY60
 ZGiNkEFL.osN1QymL_Ja03PTBbQSpGnUANF6tKwIyV1N5rySXmBrJKEM7UAAKFkfprNkOulOlLH5
 ucA5_G3G9TQoDUtXrbcSYUbVnV_WpvD6nddiAU5LShgC8KUdpo5XgM4pndqMC2KSiBYnDqoIO1mF
 Fi6Ds8A6JrujB4wlE947ABX3rrjpgk0wFovSLlUZ7kYlFGciCJjy11yT_bg8au48eV0qgaGgB.4.
 9JRncN9HndmG2xIMMPwoFGtKdwi4.h8ZUKewFox8.MU_CF_urpCLnQuIkZn4OvKWkUdkCMkIz1Go
 MHdt2ND1ISeF8KAukH.AVhZRKwGzHmuJeGOp8YSN5RNEVkjc44rk2xB73tPXoVLu7cdi.5jxxTGe
 y_6PdKzs4Q_7U2OLQKyPot1QUuAEPSbnXd8SIs4Lxe.6mKIPIk6yrfSNZxd8Nru4Sp1uRJUJcM_I
 EmO7.fK3XxZLFGZaO6my0tLjZwCYlV.8xII4g7qGGKC.ugZsy9UpUKNZ6kLMbmZ84mYdtXmewFZ0
 CIZ3xN3aLXBtoSIlqbWWdaDDsG1eczVC_baJOg3MjzK33ErsEjNRU6.3_wY1TRbxSj6iN4AtvOLm
 PJQl.AQRbQlkVkyuAR7w3RTMezDFyMAJUI6b7pcoS_jvxRR60_xk9M.bReJ2_zN8Dlh_1G2gWodi
 WWBgzEY7VUZE5yX6osqos6EaqAmP_MmSfScB8b_8f7wv1V2hUqd6mjJEhfQvkBG.SclUx0laxrOv
 jKi2zSTOFXki4ykrffLa6aKpaJaBsSghiaGYtaXl2n2ZGNeKVtqkqjh9mJtDy90rKGeRLyTKHbdH
 M7OUal1GzG30k_ii8LAnBDjCxEov_b.ixYxywZDMxfLMyolUU9hRdk3tlRDnXpOe0Nn0TbhDp1az
 ZxMmxUAcs4hqJ77NqzqczsvCpjRZLfwWQzycQrhEbcG_sOSkMtQDpLY2M.yeI4PNZ3gG.kWcP2_U
 FH_45NKzxySV6X26cEk7tj.x.ZPUuwojt1XjeliVFtk2REcEe_yzfHs1KgXwldQho3XPpFGuQ0Ev
 s16lFjAJbXct02yqwgwC0B4UAut46lDEpUeyGu3Fc7TOf.LQj03jUAf9snDThS2VZuFs8rfDDAx6
 WDYe14s8McqtTDutiHoSr_rSdo.api669IgxtxeQNcymbef5ceuOe3Gj1YAGItQql5q6fsdfvY66
 G15HYk4rG7tu2hFnXD.pGAc4ogRlYKcJtVRsH4MJKRsJ6VckOQadpXk7s3oHLS7g70F.79FqKwDB
 s9A0-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: e4de7db1-690d-461f-9b16-567c17c858b1
Received: from sonic.gate.mail.ne1.yahoo.com by sonic306.consmr.mail.ir2.yahoo.com with HTTP; Mon, 23 Feb 2026 11:40:59 +0000
Received: by hermes--production-ir2-bbcfb4457-5fg9x (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 2b2b0364933a90d31427242a37aac641;
          Mon, 23 Feb 2026 11:40:56 +0000 (UTC)
From: tomasz.unger@yahoo.pl
To: gregkh@linuxfoundation.org
Cc: michael.straube@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tomasz Unger <tomasz.unger@yahoo.pl>
Subject: [PATCH] staging: rtl8723bs: fix spelling mistakes in sdio_halinit.c
Date: Mon, 23 Feb 2026 12:40:53 +0100
Message-ID: <20260223114053.67890-1-tomasz.unger@yahoo.pl>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20260223114053.67890-1-tomasz.unger.ref@yahoo.pl>

From: Tomasz Unger <tomasz.unger@yahoo.pl>

Fix spelling mistakes in comments found by codespell:
 - gurantee => guarantee
 - ser => set (two occurrences)

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 0fa1b22fdf9a..d55187777a2e 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -388,7 +388,7 @@ static void _InitWMACSetting(struct adapter *padapter)
 
 	/*  2010.09.08 hpfan */
 	/*  Since ADF is removed from RCR, ps-poll will not be indicate to driver, */
-	/*  RxFilterMap should mask ps-poll to gurantee AP mode can rx ps-poll. */
+	/*  RxFilterMap should mask ps-poll to guarantee AP mode can rx ps-poll. */
 	value16 = 0x400;
 	rtw_write16(padapter, REG_RXFLTMAP1, value16);
 
@@ -606,7 +606,7 @@ u32 rtl8723bs_hal_init(struct adapter *padapter)
 		cpwm_orig = 0;
 		rtw_hal_get_hwreg(padapter, HW_VAR_CPWM, &cpwm_orig);
 
-		/* ser rpwm */
+		/* set rpwm */
 		val8 = rtw_read8(padapter, SDIO_LOCAL_BASE | SDIO_REG_HRPWM1);
 		val8 &= 0x80;
 		val8 += 0x80;
@@ -901,7 +901,7 @@ u32 rtl8723bs_hal_deinit(struct adapter *padapter)
 				} while (cnt < 100 && (val8 != 0));
 				/* H2C done, enter 32k */
 				if (val8 == 0) {
-					/* ser rpwm to enter 32k */
+					/* set rpwm to enter 32k */
 					val8 = rtw_read8(padapter, SDIO_LOCAL_BASE | SDIO_REG_HRPWM1);
 					val8 += 0x80;
 					val8 |= BIT(0);
-- 
2.53.0

