Received: from sonic310-11.consmr.mail.ir2.yahoo.com (sonic310-11.consmr.mail.ir2.yahoo.com [77.238.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DFA309DAB
	for <linux-staging@lists.linux.dev>; Wed, 18 Feb 2026 18:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771438543; cv=none; b=n7fu0miwF1SNUaPjTJh3FfrAEgCaP5DY4/nLB2RRCjx7sv9DTnYcxHqq6L+6FjsdowLkmbJbACop6BBfqlTOeCfsCe9CGCIF2njVeau/MOZx1GRiKDvLzBYEOxe/3VFH/l78AOaRRt7Sr8G+j+tw6ADdCB2gPGSXpC93jXwmGfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771438543; c=relaxed/simple;
	bh=4OjeIzluLTFXfIPZYQh8T7dB75J9bPfIcpAY9c4NwLo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=ZbkAUjgmzgjudXEP51aCY1l1LQkuwnt0b0OwCVywVTpHndVwGW3MGVCDq4/0S6c5P0Hss6Z7FPigzugPQqgR7d++KJNKZXPDwgHaqkBg0caYYG4FrA6A3ChRCTu7rVlRzZww4LHX8tVrA4lWaYeXeBxIHMfufoVN9YKbWXQOYhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=mkEDzQlX; arc=none smtp.client-ip=77.238.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="mkEDzQlX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1771438540; bh=W+sJ3VNDowmOBUMcqspMoPWR8FdjjCPVp2YqC2j+X9M=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=mkEDzQlXE17Sa3ky9YhiwsG+W8XmBW3gCKrw6DjDXyMC6RTYdRUHrxIihLnBQjUDD3tX0JSMyOezdoebj4P+5tXtljvE/GVFlDlOjpg9EzrbAlEvsWfavUj7Oe6ONuW2v9J/696tn8hGvZ3NQwnuvcobSDWDu3lkpwvkI+T99ABcJhFzn5NGyDyu2oUd+2gvAKXDqC8R1jGWOdXZNT56L59WZaiyp8IApXNj7QrTy96IpV9pqN1T2jrzc+I3OropEPd2gdDAel/tBYFj38NbEOmnNvCoKexLRTzjsaGGyrmP2XjnjIFkFZaP8Dl04ChX1EN6zqR8QvGwMqaEO1USag==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1771438540; bh=qlnmHA8pGY8lzZ/Yzm8S/FP1uTVPXKC+J2eHUYw1kqp=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=X0oSi2iq065kbh0/ATKP2xrZVapWedfHwIE5+UH/fcnVlMpMKu/FM6KZtygPCROXvDpGL/oroUIwdyoi8aHV/8B2Nhu+0ptUkap3+b9U6fxemClhXNZKmL4JULDyhbZvfLRolPyBB5yc4MGBM160NAw5bHsdfgBgAeBukobrNwFLi+L9y7x7SZ+n4xY/8As6DQhar+Kao1wXnzQlGKGgDx11EDreSHx2VPfRG9gISheShXsy3eGSKQps0mJxE9Wx0lbZ6ojIH8DTOjzyN51KTVO0YLBQHubw+8FtIXxZL6YopzX2oqFvvXxvvnSFoDoreqhb/7TDsGTAEnNKdkRPGg==
X-YMail-OSG: 4sEOnZ0VM1mbcZht71G0dFrGEjLDtJmK5ZLiamtq6ezmjcvmGlxK1R6Pe0Gc91C
 71WLMqd5mQbAyq46rzW2xdMjGhl7ZWhjCAAELhnwyMCWggH6zEeM0VuokELTOd5HWkX2U9eaf4VU
 jP9rQZ8ADmlCdEzoYrv4hQnR1O0dGl0mQsfMITS4iT339S0YKyomc6Moye3UUowLxmN14t0L3lhZ
 rtFgWEOZp50hHd9IBZiavhOcr0LULAHuXde3Xet4ugymrZ85ZY70TTWJHXlYFFFALG8ePG7sxSKm
 prfEeXC9H99PuwZa_Rb2p149khwEGmQv6.KBjND4mDB_LauqUpQbDS783QkCUC_UgNbPDcA5hBNa
 E5SW7hEIj2wMZt07TLMqAxSWnwa_hZWFk1NFF1tfPIoVtzHKdtTPYU2KfyTz0p9rKuFhg7GtECw2
 FBGsrQ9ea80JugojVNRAWLXsAF1dFsv7CmqbRhqToLFMfOE0HtAKZDj1P806tdlA3bKEIeZJvIYi
 a1MKnBhLS0aLSM408pc2U1ALIKx.Xr5nTkyH5ZHkPkeWoBCLZJ5BbYRlyescA.vm4JJut0quO8Nq
 .9L0Tmshz68bdl2zZIMUMuUFnIazNTtsMfr_dQQnSQlFvGFJqTqI6yiripcaBR9iM890nzzAJZ9_
 ktptBrKhgIj5EdDJveFwqqRsdXGu80ppD.sJgmBUvxtSvdWHC_5NS6NcYS8wWfJdsLLUTV9wqmGs
 PF76RjnFhKdRU1qBkHiC.MeCdeLOh1hhxA8zsQH8zsC5.AYn0NXHMQSS41FzPHxi3SOoWrv4p9Gy
 b.ScV_tjEGrlRT2iZ_gOlcQWb1tZtho6rYZpSWFtxSxHMqpAEa7vrbKEnIHJ9Cdu2uRF04Rny57F
 ZTCw9hrPB9W24lpnGxhcTHz3P8VN8Ltz6B1PdkhIt_L7rSUBUT5oKm3Odv3425vPzR3CRQMaOCig
 irwAGsmcBCQNhWw1m_Z10W3xjYdqlfDqQHzVR.PCM8Oo5dPJnMf7HtZ3yCIZN0lM8uzItjm7j2WQ
 zWWcONiSsneBOX8.NvMWq9qTvVjwQtq8ttT0OG8hI2ytVd8uCFdt3_bsC7C1ZMDHSu5.OLejmZVW
 vwHUarc7j2SeUAnAAO8_R795nloFRTgRYcrPw8qBQOtXdSAbvIabEut4jzejPw_mDEVPrRw2ytkq
 rGGZobR3lDX.wOL4QiP320tBqg..0U1kAQ0TeCx.P3ACWiOjAdj3eC3FGhbj9n8kNNaQaAlR36Ku
 YGGgekb7w8kdWqbcrCSpKC4lfPJnnIfC7CMPnJtGZOmvrIo88kSeSveJ.0ziKQ7FUoqvmAlLCxkV
 nf4mizBjZJYcJpyiZwYZYjQwC6tkSlr305WEKbg7053HNw9tVKqqW40z_RFPzXZRoLcMLcHibRf4
 om9DRknk9Yo68mdJvEjwhKPpXTepVDLx12E.PchpTxtjRJLvAMQxGw4UwllsaiHLKiPElRieob7H
 XQF9rCNzMbF7Rn084tVj.Eqo8F4QWIFIjFQCBwDvTkzlJKGMxakVBNWPGoQ1Xrru3n8AUZLFPJYg
 RYA7VXAG0Cbjw4ZAvrNuZ_aO9TrFEwumx0nm6A0TNCHs_KzlYAno9OFSRpUReqAgQFH8O4Zu6B32
 ntUCr6yB2pLG3rF0L9fzoRkRUWKqG2U0jgriE2phi8AI1qAAupPeBNRCzyRhoSS_CUZPmcxU2YOZ
 l.ZslBwgJyLrIe.kG0m1t6sd9n5SePlhDsH65CSRdZYYPwwfJtiNfK6NCE76MBiEpZkF7kIpEn_I
 U.h.eUzmtfWWuDGZTTjFOFRncPB4ORqUJ3ndZ6lnD9JCsG0.tXvhYIxaOt4MhYy_BhmpxuzoEwf7
 lIkRhnMpwjZ3IZlzH.k0vwc5z6U0P4q4_PuyjUvf1F_ZFt0pskF_h.YbX3G9I4sJELXaA13vbNe4
 ckfijTGBM87z7XVMFl6v6Q9lqR4wlhryjv2uuBJaznS08Cj0qLLhvJT0mlNrYDo_MSp3GbjgeYsp
 LfDz_Ur1Gvyo361fpvIDBNSR_GBCWm3ZmTm2CCLn_LLPX2_TMOcXM9D4led70sj0aLyRCXjOSGTb
 Bw.ETulnd3khi49yZmptgRmUkEhzwnkSZ3kRH4xsx9U9nAn7AruGoqyTwXCNyHurcNoEImOkGbN7
 3tUgHg8Z3Y_LG8iYF.1ARNY9ywF1Fe2I4V8tiuav8vHEvZkdF_Ki48gen_RgL8qTBDz6joAAZTWe
 VpKY3VNrw0h8jzMYAQnnfTeBYwFl3FYsOgsXa5rviruiDLQy88P5QmPdB1K31su.rOQkDhsWIell
 tpcow_ux7pjE-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: e8bec533-c71c-4e69-84ef-a68bd4914449
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.ir2.yahoo.com with HTTP; Wed, 18 Feb 2026 18:15:40 +0000
Received: by hermes--production-ir2-bbcfb4457-jfg7j (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 629fff2e81fd17e3702ad5303f037aa4;
          Wed, 18 Feb 2026 17:55:22 +0000 (UTC)
From: tomasz.unger@yahoo.pl
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tomasz Unger <tomasz.unger@yahoo.pl>
Subject: [PATCH] staging: fbtft: fb_tinylcd: replace udelay with usleep_range
Date: Wed, 18 Feb 2026 18:55:17 +0100
Message-ID: <20260218175517.87544-1-tomasz.unger@yahoo.pl>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20260218175517.87544-1-tomasz.unger.ref@yahoo.pl>

From: Tomasz Unger <tomasz.unger@yahoo.pl>

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/fbtft/fb_tinylcd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fb_tinylcd.c b/drivers/staging/fbtft/fb_tinylcd.c
index 9469248f2c50..89ee7b9d621e 100644
--- a/drivers/staging/fbtft/fb_tinylcd.c
+++ b/drivers/staging/fbtft/fb_tinylcd.c
@@ -41,7 +41,7 @@ static int init_display(struct fbtft_par *par)
 		       0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
 	write_reg(par, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
 	write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
-	udelay(250);
+	usleep_range(250, 275);
 	write_reg(par, MIPI_DCS_SET_DISPLAY_ON);
 
 	return 0;
-- 
2.53.0

