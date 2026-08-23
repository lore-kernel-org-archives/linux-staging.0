Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877DD315785
	for <linux-staging@lists.linux.dev>; Sun, 23 Aug 2026 16:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.82.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787501280; cv=none; b=eCpbUp0cZl9xZMBWLTRLQ1HG6B0BZIM5b+t2kKr4gHo/HkiiSRbED+Nyn1R/8aEY5D8axhe47l5d4ObnBMH5CB7seYarUzQwCDcumZnogFYtQ2Y0PJHJi7FHW6ILl125s4gpygdTx7PAm/Oo1BsoAGYOow6aTvK3kCvndKwYW0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787501280; c=relaxed/simple;
	bh=ZTjFBnZeTuOyBUHGXX1xser1jXIfPcOIb/uWb2Ccttk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=bVMHdFQ/o0NZAIwjUWv9ciNdaAzY3I7M0uY0tfps1OgMGivJPYZw8ujLRdkdQ8MHbOGUwvdrpItUh/WqcG2CtucNdMAKp2KU+FA0oiYxShXBuabAQdI1dJq+XQLUuHgn+VgtufNJQQpqbcs3e+E3xMQhxE4kRvrImponVK5YS8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=SHfQCgpV; arc=none smtp.client-ip=34.2.82.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="SHfQCgpV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1787501276; bh=/cAEnhNYRHBnxj1W/NrKWyiQC8xaIAwl0ot8GrBvtpE=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=SHfQCgpVfagPGOY3OckACvo4Tc5MD5t5qEACyC+4jnY2B4FXEz/MlhWJuM4x+qltbBUmcIwIKkECotNlCQm+T4dTuuJXVvyWe5hg731EJOqEXWgbKU5oO4Q+P/JxTouBMpaw4f+efJPQok3u2AAMWejTbDPk5S2OL3Mqa/Inj3tsDYHrqEoSFQpujfOVeI6BB8NxWKbGHrtsbAbrLC5/7s7pcOldRCYwqnnEslEYGr2qMvu+Fy2j4A1NHzHOsBFbJgFSGMvLYNCUNeiS/kiP3TDEH2PsFtH/bicGBdF8YVV3FQ/6bPAonL79uFbxuDrlU9h3St0kcLPxhBI4St9Ijg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1787501276; bh=54PLlv3hMy9fcJWTU1x/Nhc/I/h3X2334XfG6OeBkjb=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=XAV3ZvHpV7gNR4JgJ2OgHNl5eSh3z2rq6kqp7UhMeE1W4UvL0EjcwCFXRM0n17oWHQc+fl4SghZiAaostmggc2rzYOvh8FokPCIqkSiflTBLdOtX5oaBIcdMsojT+HK0IFc6BbVAxoGQoKA24fAJUIUq40ggucxkHRzo4hZNq+JgiGuLUcbpPeZGu0sNZbc/dTVoPbodPSZ9i/UuP3D+PXNWtSB425VEYgEcjJsRACO+hPZ8aoNXT6JIrzPZ3VLxrTIQWSz27akgyST6OMkDckk3r8ITYtXCdWUS423LKwEVxRRDvLg7xlywxvuvMnUKJQzNCdL2WYOwP3Ta7L1CRw==
X-YMail-OSG: Kvg656gVM1mHcJu4yJ91pL5cXBrVDiHPIqlqvordLvYFrBau3jJIdSWF4X984g5
 ziA3Hm1EP_XYLs0kxccy3ibBwUVKtz2n4U_ZqryVnlSyKPYJoeBDD9kTvX.A_lnGI5ox59WwPgMp
 R0A3xYOyE6JnavevyCnYoDLPJD4SQuapNqslJt.FQgDaT6CVulhUyszrqlSnPI_JLHEV2x5YoBr5
 AVYIhGRBULyx.QjOb5Gpo7qQ7WKxoqveNXQPZmyXhHEE39pYhNlxx.PILdUEvD2K_naZK5x_DXO3
 4nnxM5YjSXTjdNyAOFpJ.h_WBE7fGZp8V8TJpLe4mo4Jzs38BDjYBm_al2Jp6mNOZ26weLTMVsAD
 bb3gMFI3hXJ5BTIQX3sREoRXe_fVTA_eoHsfeda9urNs4TdGmwTo9fNK20D.SpnEBNndxsYU1DB_
 p9YnTvVOeElu05Mv0.4GlrqeqACydyA4WBvqKC22EGjFeihOD5e8IiJRcvINXrEM8teH58D3u_39
 IEuRROmP5.939K67amOSpUwPB.ernxLAK7LPmkoCuryJSu1obUssruMnsGiRzzM.ktm4SjQsvkhC
 y2L5oLtmb44QILwABpiJqxxY7kEBgXT_.kwPxXWBY0IIeEhi1YafBcbHWfUTzgnBMG7jcxaZgt1Y
 nRgvtcOM1TdW6wY5._b1c1MO2WHeLJZ5mjRzzgq157mwWeRyRkxcLd_SWgKjKlONUNz9EWR8E9cI
 nNH7nMiiypI0Qckv1Nv27MFH41OH9c8cUQA3A1wKvaJnLLmsYIAqjclpGYH8uFTLSxozLarEtBpi
 wAG_ILfffg4TJjSa3.uNMuS9uuZ6tAq9XNVcMfAdRWz4kAZiGpHxMivqcA.tThgMdlYgG7RO4mjN
 SHTJfZYVkmjurdkWKpvXiytiK5WpunBd2iFi6Ug2XIf5TyFrHgS0tuaG9tjocnhdJBIS1HCJwpH7
 b1W2PCa_yHFQdirORNygMVBN97x7fQtFpfqdwmHIWqmg47tc0wIF1BpGrRCorZBjEPSfuQLpsBrY
 x8y..DEz0ns1hg4rlr7NFhZ3F1j_KXlZ0RNKKpF4QSQzzDYvrmCQeNUJPmzCZ0ktNSP0lQicraiu
 TgEOXUnixJe3qvBfWUcA8jahE0dSXMkjpIO.AiFvjwZXXRL9f0fijk0xNGY3I.LfoYEgFbky2BmM
 8f9W.C5Vbu.umAzRUcuyhbZGWfTCux.iuZkfAdL99LbeAEkvQ30Hd2xCuaGW9Q8m.09gK6BZuXJ1
 KbqpIIu0Wwqy8QtEVPHBhaU7YjFgUXB9ukeWeJBreZ65JUeQIMrM.SAV5RgBi7hc__5RlQjXlH8d
 zIIZ39YG8Swjm8mLgnegwZQwavIZYqfFT2d1J0zEEU6TN2KHybqwwxy7qBs6v3FTqNrG0OvKmJBe
 l_HXn05dsQYisuyp8RucBKsAoa3EcREaiRmU1bDeAYMROafrDZ11H01_LiX07EFyAa1k_JUdPZUX
 3ABM4tqxbFHOIAKvK6e8WSj2OgrTqkvnGQoDKKqNF.d4eK_TAsw7CYhlg53ztQ2xUzwph9_OBZae
 wXLj4n7wtwmneiuMXzKiU_A5FwlzKlS9RxiEN1H03_GTbKetAy0A7GlvXB0Och5N2slY1yPuFpZs
 _LdV3CEiPeRhzKhanCmnRBGZQ6Wm.bhV77TcyEsDj7ZSgJyNMF8dY4iR58Gqok4heEWDhxxgYQPp
 q94kXAdb.JRSz6EYK2levgZrpKFQmsN5u4kd2u7h_gkkngTTH2KXQQKktr86M6Thl7Lz6BHsZ8De
 LhXDBf75PexOwPlVsD5yQ2QHCBPZJ7QoRdniFvrL5ov_2O4M9Qwfq6TI4M0uNiqpqT467JbnApWj
 jEYb4PtFIzJYZ.m6z6a9AW0GxREN8xYcxhAqHRz6exILj8DKk5n3Sk.K_QlQSJ7.ggAXWIbRI0Th
 dAoypj6_rFzPGUYbSJTvF94YtTepB9kt5kKebs3m8vzGdDnJk0MjmHB51iT3QBYlhDFzUA301Qx9
 1M5EFMFHwZiwhFoDdaV4vkSWL2ouBxyRC4Ddj2Se52_gtMA--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 16fe0c47-3af1-4afc-a878-0061958f4c4a
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-102 with HTTP; Sun, 23 Aug 2026 16:07:56 +0000
Received: from dip199.lsn.ir2.yahoo.com ([87.248.99.208])
          by hello (SMTP) with SMTP ID 78e984f2dad6ba5f1301d955d1d630dc;
          Sun, 23 Aug 2026 16:07:51 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Sun, 23 Aug 2026 18:07:50 +0200
Subject: [PATCH] staging: rtl8723bs: fix space before tab in rtw_io.h
 comment
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260823-rtw-io-space-before-tab-fix-v1-1-e9113e602793@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMPQ7CMAxA4atUnrGUphIgroIYHNcpZmgqO/xIV
 e9OoOP3hreCi6k4XLoVTF7qWuaG/tAB32meBHVshhjiMZzjgFbfqAV9IRZMkosJVkqY9YMc+mE
 8xUScCdphMWn5f7/edvszPYTrbwnb9gXNVKl5fwAAAA==
X-Change-ID: 20260823-rtw-io-space-before-tab-fix-c013d72bacfa
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787501270; l=987;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=ZTjFBnZeTuOyBUHGXX1xser1jXIfPcOIb/uWb2Ccttk=;
 b=ckq9KmQoqPNkOiGJYC0jf0G8VqKrLb8ufxlLZROz/Vl9PZWtNITvxuGaxHSuMv5S3MaTGDiCa
 r8K6tvd58mFBt7h2yDM2bN2LKP4D+hYfiY/vgcrqkYGjKFSrtP2UvVr
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260823-rtw-io-space-before-tab-fix-v1-1-e9113e602793.ref@yahoo.pl>

Remove a stray space before a tab in a comment.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Verified with checkpatch.pl - no new warnings introduced by this change.
---
 drivers/staging/rtl8723bs/include/rtw_io.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_io.h b/drivers/staging/rtl8723bs/include/rtw_io.h
index 3c99a2bc19bd..57628e4b42c0 100644
--- a/drivers/staging/rtl8723bs/include/rtw_io.h
+++ b/drivers/staging/rtl8723bs/include/rtw_io.h
@@ -24,7 +24,7 @@ struct _io_ops {
 
 struct	intf_hdl {
 	struct adapter *padapter;
-	struct dvobj_priv *pintf_dev;/* 	pointer to &(padapter->dvobjpriv); */
+	struct dvobj_priv *pintf_dev;/* pointer to &(padapter->dvobjpriv); */
 
 	struct _io_ops	io_ops;
 };

---
base-commit: c6eb4dc5964fdf4086b73b7f0f5dc0d595fb5cf3
change-id: 20260823-rtw-io-space-before-tab-fix-c013d72bacfa

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

