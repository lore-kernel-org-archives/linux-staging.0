Received: from sonic307-54.consmr.mail.ir2.yahoo.com (sonic307-54.consmr.mail.ir2.yahoo.com [87.248.110.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7ED54758
	for <linux-staging@lists.linux.dev>; Wed, 25 Feb 2026 20:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.248.110.31
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772052367; cv=none; b=TuIyxhzpi8Ucg8RJR85qgrwTQ8xekgt/FnXs+ABHFRrsSSljvrF83RZfK4Xw+ata3S320yFspkpazkBhHX/qCLDFHHcKNDNJwkV6VKAJZeGqmx71f+c9nBAH9lPhtsqrKd+jUSffzikMPPpqTW6P/34HuW0yKTf8wqVV5L3+p5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772052367; c=relaxed/simple;
	bh=pLM2DUP0NKT/UPoso0gHWbjRkPL8+gofNLvkyvwZxq8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=OneLDPDH5qtFY34Bb5M3VJpeR13qBP3EEjFlvzHc8jCV7pTLIJjR+emzZx2ZdChxqHqxg4psJZMl4reMOODSIkf7QuIaNU6p91W1JOYSKCSeMaEt3le6x2KTtAJTB9r/frYFxqx8KxphalvMEhFdh/m8C3Xfzf4NQjXKmN04+KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=hLIkua6Y; arc=none smtp.client-ip=87.248.110.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="hLIkua6Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1772052356; bh=rqjSeLqrNTYpgQ4csgAQYzKoQVBW1wrZD/fZvYePWTA=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=hLIkua6Yor/9/1NZXswEgEpbo9wTb8tYhb1rkFPF9n1AC4vb2f1wAyKW/+BRX+bc/DbGYtFFz3EgefqqwmWaYTJTZXDcHncFsqnAfvq+/Hv0ymqFex6rEUuNvtAhmJUymsAwbg+PRsAKI8IBA+YsZOeXiGYEoWDAK83sRDFJHlHfnBGFWXfBjmmhI6VUYT0nQwjXrcLOjgaLgeJ2fLonyCU7C0eUvIgbv/vzrjisE0HruHPhAPesfiGQv5SwSzREFAYwly2HuGpZSnLt29GI9YDfet4sOhxSGrrolVKU6pilcceux2T8r1woIz9XKY+ijOul8QqdDzNhfXz523gWsA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1772052356; bh=6sS8ObD8OXtBZS3fe1PVA1XOo7lKh7XXzGcL4bDbFks=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=LkATMP/EjI9+NnFaTH/3rHfXLWNX/mgwxuGPykLp2782JIT44hSxrsXI2ELpL3u8bOcE8yJL4YXZ9AbnpBfmq1J3lx9ibJ4/2uuPChwh18SpQxdsVOn3bMwTRHtlk476zbR7SdLT0QEILe1Gmn1amEK/Vn1t604iDQFBhTvzr73TSqEfjkX/D9Zgn+/ppfg8LsuSzQmqBqlrG7arrK+4ptEKhatQrjryMeseimOxZryvV2I+qWMrh+B8hUfh9E2DRthIwrC6IPIc01dbYD+t6q21Ku5qi/Oee66qd/jZzJJcxapcVheDM0efwpcyL+V8Gb/HjZt3pZOhwQ2WYzV/rA==
X-YMail-OSG: CFHlLpgVM1kmv15ShPr8JXILLj0zZkn7cAwh1KoEJ8VPe5XStz8N0hGMReFv2ww
 HGti7D9QEliaQXG8Hz5bv6gcrlUjg68fdkb_gz8A7WovKhWRCYAKX_poaItOtRDfzbjNbnTOnzkD
 INCwj5T6Mx07iZC9AlE9ubF2XoudCItQRL.JBKbc5JVQ7O1CJ.MFJG8wwKLnryfRGc7.XAMMpk9x
 5mnAWArfR.UbF.tDQo_Hks0bDLBCsi_7SO18UdMQmTCVFdqyamnUqvObgltTs9vx8f.oeNNJRNaU
 8z7rHZ0DDeLCkcX85KOUKKhOroLg3yTiUtxx9JdAxbx9nt69gO_yPq_G7c2KNcftZ3IKE3uXv01V
 BTV3M_8ZDXtOVRi6GtW28h8dxLz.pDJtHcvsMeBAPvj6NSA_LR6UMyWc48ZsaqCLYOpr8e3JSpiz
 lwQvMkhQpzBezJHq.QlgxiEGh.FlkXAIC81VKHgab3nMxgHOU8X42mLosQyKWVnCczLBFWyX6qQy
 2adLy321SBABbjD8vQB_FVVqpGyenWEpJTu.CHlpmoo_sgEgf7X3r4q2Xqx.dBWHzzPWH_Uk90in
 6bE4YVt7VOZh.u1V2A4.Nk0R..BThz_rSgNw.EWWLy25R_LQsADiJ996AG1C4TziaU6k.5.Mg2_K
 MpIb5fHKnzyTrr922APIZLnR6_UH9DKpf2dxTlt_59hkHdBcEIYvDYSo_bHqJpUUV1RzY.hojThp
 r.tHnhJ8c0J6.IeJpW5lWLZuJxozpcpW_IZgCft3SLrFh2NY7wCx0hNPTPKrkqwVWYYs9m5EUEBB
 tiQtLxOhe.wgHrrxnxFG6y_FbeXPw_HaK6CCYcoP0fAE5DhDPI7YZMZaFflyPn_Q2wezrijPIHR6
 Q6YtINmqC9B42GXU5dCCGXvVSTSAUO4PUE0guYHedRRAWsKnYZ3oM7lpDTcQrgWU2ftq5PNovvgD
 Zs_0RYFBRkNJNjgZLH12zdndinoDQii5iyJz1Lq8GB.Sw_eLD28Rojnwt2XD2SCcYvFhLTHGMaUK
 gORaeHhJ3fPh5fEF2d9Djk98mYi13UbCNyLkvIirVkaxrC_uo4GnCNe2.vC9.rsKMHyzUVptSWow
 8E5RpwlKYMUtiB2sYcGoRiTCBuFwxPcBC1D3zun6TAFL7Q5iu.H8Lv.aQ4Cy0nSAbUnO4r1Sg3tV
 5Ebop9oXZo70OldsU3934b9hcXMAoauwXFL02y19xjdIaXDXpCrCYU1Yzp_eS9_nfwCBiy4PW1yO
 s7q9arKP3jfjU4k6sB_DwnfJoGfuxEVOtkLWjjkqRvr3lCVH5ESBhC8B4r3olwZLUrSKTX40RgtR
 hZST9kt6lIxY4puXqTqiYeZz88FWDi.cj35QxxMhktUngPCDN7l7qWzNmvpi9zAlXcyBaGq.SQnw
 p1eFNrw_Oq_s0UryNOFMx28eDb6T74VbB5PphadKxDNFjHT69SLZovVqYhtxkChJc8xfkIt_cJbn
 JGESOpxuQHDJt_Kl6Wj81TNRNDQ8eG_YGErfbvzN7Zh.7Xd2oZHUl4LBmOp7FZZM_v2HG8tmK_gz
 F6FRjEJbAlVAi3fSxh5iczixDwGB02MyWna.JVP4TEYuPXPC5Xe6KuDjcOyMxafi8kSZj7QdPfri
 P8MwwDVRSbErJYhvcFPixu91yiwjvnX_7wQG0QFxkCTm_xCHY_zSf5lRmMnIrLhcizUYJOmGaqjJ
 vqkNR86nmVZG34qP_.9uVlk.dvXc0TBOPZjvRoxGwpi.DW726yeh3fsMYOEvZshkftaHAVnz95NP
 jqwGvG0bTO6v4Nqn_BIJVvuJFrT3cUAdeVL30pWFkSG9t.hUoUDMTrNw7RnYBwI9l6Om_n6Idv3N
 Ss6JSBlDLZAx663uG7VG_grztcISdnxsVA.1D7xIxgMh5wLtpsPjzM8VF1EsfCEdmlkHIiPq6.xt
 TtdyKXK6JNzu8kbX2gXIGlIUb9BDgQrLyF64HH09A1IX7QE1KIilERT02mpIw7WWnfIm29VbsKom
 aUIt2RS0W_QqQm9rSCgVV1Ol7MvxJSEbL01graUi44cj2Vef3HRvSmZXZ8b7nPlm3LisIscnyiSF
 53Dr3HDCncjULoR_bZ2nCPfm.lizl1ciroLBMQOUxLRqoW6Ms0ioFB.EUxqXEhpyHz_8314xQ6Ri
 fC0Z_MMEiwQIHSjfjet.os9v62ClOTSz9PevyJoziGz9rbe8C1BqH0d.W18nvhVk_RT5vcfNUOVx
 H_EHm_rpXg3VzEOO7o8C8GdcefUGq7KyPFG3dvY1xNKtovEPIQNF7ftigTgAdAWVZp0NEABZb46n
 1ps1PRToa91jS
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 39b57372-5046-428a-9818-424abf2ba4a7
Received: from sonic.gate.mail.ne1.yahoo.com by sonic307.consmr.mail.ir2.yahoo.com with HTTP; Wed, 25 Feb 2026 20:45:56 +0000
Received: by hermes--production-ir2-bbcfb4457-796l5 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID edaa40cff86a4fd4347aacf3c45807c8;
          Wed, 25 Feb 2026 20:45:52 +0000 (UTC)
From: tomasz.unger@yahoo.pl
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tomasz Unger <tomasz.unger@yahoo.pl>
Subject: [PATCH] staging: atomisp: replace sprintf with strscpy
Date: Wed, 25 Feb 2026 21:45:48 +0100
Message-ID: <20260225204548.168092-1-tomasz.unger@yahoo.pl>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20260225204548.168092-1-tomasz.unger.ref@yahoo.pl>

From: Tomasz Unger <tomasz.unger@yahoo.pl>

Replace deprecated sprintf() with strscpy() which is the preferred
kernel API for string copying. strscpy() is safer as it guarantees
null-termination and prevents potential buffer overflows.

Since sd->name is a fixed-size array, the destination buffer size
is deduced automatically by the kernel-defined strscpy() macro,
so no explicit size parameter is needed.

Compiled and tested by loading atomisp.ko module successfully.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/media/atomisp/pci/atomisp_subdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 3d56ca83ecb7..cef44ec9ebde 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -808,7 +808,7 @@ static int isp_subdev_init_entities(struct atomisp_sub_device *asd)
 	int ret;
 
 	v4l2_subdev_init(sd, &isp_subdev_v4l2_ops);
-	sprintf(sd->name, "Atom ISP");
+	strscpy(sd->name, "Atom ISP");
 	v4l2_set_subdevdata(sd, asd);
 	sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS | V4L2_SUBDEV_FL_HAS_DEVNODE;
 
-- 
2.53.0

