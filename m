Received: from sonic312-26.consmr.mail.ir2.yahoo.com (sonic312-26.consmr.mail.ir2.yahoo.com [77.238.178.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0BF238C29
	for <linux-staging@lists.linux.dev>; Wed, 18 Feb 2026 17:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.178.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771437478; cv=none; b=TkOxrprkX/AHNPQwg4Csfertv+6r0aM+pY6Deu/2YdfCEhYZsKsyM1EwUnzPvb2Co/HFjryP9ZycBi8M/HcuDwK8M7DeGiu4p2YUtsP7K8jo+Ei2sAVJPBUZPlM+NvHSMtSHU9uiyklUaOF2ZrfYTnqmOruD0Qxa4IUQCGR2wvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771437478; c=relaxed/simple;
	bh=tj3fDLu9j+j/1D3Ns5QM27VBtcvoJcEDv94CX7fnhHs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:References; b=XJ0vYUg3qEqV8Q00GGexK7Qu1GNpKiKzw8wENSuvv/Pbt9pS8M87cbzGJ3FappZEVCjnQYPeY+b04GN28ldGB+ntc2kRYBICq9dHqsZ7rTbFqrhNKD7dhCgt482XRVhNZSDRsmadZEnkg+0GLpwG+T9K7T/0HwNds2GIoqnCZmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=ksxi5CUn; arc=none smtp.client-ip=77.238.178.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="ksxi5CUn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1771437475; bh=5+8LH/ttBDhQzOQTNsiHdkZH9I0ew9FiefVOo+uK+Xs=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=ksxi5CUn71/1/iUbTFwKJ629RbhM0uixB7Tb9IQ4i7bcJQCtBxNfH0lHFCfXs4eqw82G5B+N8FLkMrMmSnDMTvgfm5Osb54hDpP49QGTh8EHR6HW1uFz7fXAPaMuUzW8cTZ+U2RAK/YemaDoLBpB2xfkupnnsxYk1bTPRJpcmF3bP2WjjlDsPMyH9BMowMqHBKTFYC88lgZTHnNZSqKWnvmDDdsg4Hv5rKEFBjcdnuyQRAyMYu07fyu5R7jf2sVuMZ8SIY2OoCqeSDlFstYcRc07GJZ+THuCjon67aZInROY+Sz9Es/hD/VuRwKxKmTlYcqI0jXnaUNrlylGVvbp6A==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1771437475; bh=hHbLHIC/Iuns9XBkeoNFY+AJiysKezW9wpfuS3CMtrU=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=Yf2QAGiCrbgbMkVJp3r3cCNv1EsMPd4dVUrxFmfKE6pyX9EiG8Cq52MOEUjc26VYTUcM15vZLkE4pbC6eGZvWO2WEdZiHaweuzMv5/xeAN90s14xfuRjs1RXG0k2JNY+bVF6BOkf+9fXj5/vJuR0Pus/InqI6z4627yhKwESl7CXP2BDjHc2afhDsYuzA3I6Pf7mVtY0ny2bsIxG0aUW0uQszydg1K/9IAIyUZvuBo9lGg1FskLSFhk9MbziNCK0UVbf0R8AdGAXWfn5GUbimt/P4/RT/pm3LUBM/6rW3RMnQIfTPPzJIwIMGhXNOyp0fiws/M7gDQfoJbhCcer9GA==
X-YMail-OSG: OvZt89oVM1mPoTQrGIR9vJqkCQTriIgDK7pSx5FFBGBejYmvOukNlm7ern5lQI3
 jivIRjy5djehEf8AymmGgv9Wam1P9LCvUVVF2VmBwRAg8woYImSXk5PCw1ZPYLsEOykXSAsjRj6d
 XWA1za4ZtAoT8_ZFD9PuySuL1j_BcjVW4bgU0dqSMS519Jb12lIm37Oivady3LtRdR7.vnrSGSFk
 cHEEgncYxFS.HZRTo6q9Amc2tYZX_nUU.Vtk389suhrrAhqwBZ3u79DU_NPlYCdq6Ow1ad57kFas
 ob2zLOEWCOL0cpF6Yoc0FebTT9HZwafYwbsNWlEWGdJFxBqH.OsHqTMU.oxMt1kh68DYaZImDN.M
 vAe6.leZ.oS4.uAtlQAxvbXfJN21s0HIamz9K1Nomx6ryESTgoEpSy1o4Vl.PgryMacDueh5OhR4
 a948uVVMXYfSrTHxxn7DguU6q85Ld1x4ahe2OLSH.NYymOYVN5SAS.I7m6L1aPcB0fk2vx8T88u1
 cw8ZvkByFWSvvFUej2qatSeo9KsbyzcSNBBr1YjOf.8iQoHqic3CRfTmIJzIMmKQz0oU5LwV5z6C
 _Fd23IwVi6juoxiijemPiQeDhmcX_mtgasdr.fOXSHRixhHbJlPWzyocuhWVvXxJetCkrUAdxp.f
 4iX3neLoSJiRgsek01jKxD3hRtLEEVctl02YC.x6RUh5Rf4D2ujulDfwC0H4W7XuxhNsICs3X3DY
 PCy_bIz3nsMFaSx1q_c97Kpxjn8gIj1k8ASODqTiOwVGID_QDtyXxiipB2HvN4HwgOzkUFwWbErd
 LSwA3gJBXTmGHD1qTfgzlaDxYza81gYN8AOnRPoLbv7yePHDWxkxeRzrRllMV8HmkD8k29qarnr7
 bSvDgl26g.4Y7onH5TgVq1umbApQWpSeHwRrh7hBp0AVOKvaIVs6rJVVw1DDoQNF_fM6R9u_2dTj
 ZSjfGk11FOK0.rMKrRzDwdl47Tjgcl3GIBkngRhDAa5NGR95PvyAukOiIYNKe2W_y7Talvilioq9
 idwufv3sA0Yc4j.29wROiJvMf_.sKq56Yl.EYBPERshwUVLpswdygBFHDhv70qOFrFd2k1YKqrgQ
 cRJW_kHq1qILgoJBZdDd53eQwpPeTpnhZYrgHYIvGR9a51yMh1RVeZXR6dzgUHyOPnEQKEJMNVab
 ARpp6U7zBBGS9AzQha_Reb2ckMZtT9mlT410iTT82ce2cNIntbSh9hklhM5wYcwem6K6ARV2EsKi
 GNoAxH5EttxApPs9jaVwdt.t_0dvZPv7mw4V9xczkvFY6sz5XL5W_tz2YJs2iY16RiGH.VfUS1N6
 0ICTLgIikxGmtijK1qDuYSIEit6jWgIpf5ckTt1MaisORxbjHhEfsMOVh1O_mPh1JXa36pSgd1lm
 861WtPADJTaGGgxCKrKG9bKDteRhrYxrLb0ZI1BD.yN4aCoGn4evuqwyqqgoadM6LZWTSq2Q1DY5
 jFskUqNmpnwoByLgXJw5mSzPQ3StkzxbyPZFlyd4C9U9sThabuOnuDTynOM6flQ3SaNHYWEyVz3d
 jwIzjP1sLm2UAqam15QJQ5fpKz3ue1sQKryPPWI7QV51Sn17rDvmsKGzTIW2zJ8dwTIMMRqzyOxL
 638yGK4LXxe8sWfPMLG87x7H.XkxoTvK9E4HSE3Yn7k.yB3seAHok4iV3BACKYARU65K0cQSWYim
 145spClqc58yo86jR5C_yqMwlo.KQ5Dj9V9216iHCrgikIZKKiA2rsErhqhXZjNP08Su_r0SxMua
 6jJ86dqCK4MqcSdvhfGIGjawDQmE7AVTnc7u3nQws1QXhldLXJDJwxhUCqsd2kCcGorAJrAcj4Ey
 OZCNKI3HEuP7Ui6KVAys3znMMhMpRgNxtn8ComO9lJDalDu7s_li5r8pQ3pU4_atzl8mbJ.FH4Dz
 IUECH6Djd.aYu7lhE8870vUj1fQ0VNlvZEPSVpcjHuI8tuP4X0NdB_GMmLUU9Dpr__9e34ltQAA1
 Bus8dHOIFsliQCi9LBkKZX6_5UABVjrslhlTv4VuH9uA.KoJEoLuCjoN5fmTNNjTXkUo39CcwLlP
 Zq25pVCllKPLrfTFLPvnt238Mes7DZa8M2cdGyT5XuZtvEhXpM4f4hm5.9Vi9I1FKT0r2_j4EVXU
 T55iAkPu_LhI1gKzaNlfwBIuojgcJGusvpzxTz9FvshP7QJexkSzdQKOaq3bfooys2ko9BQa1x.E
 .T6UhtjYy.mRFH_HwC2o6B4LQTc52e_ED4DlCRgtG.4V5qNokEpvJMcuXd6aBFgoaC0wtFlr91Lq
 llA--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 457f293a-9a80-45c0-916e-296272d1d882
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.ir2.yahoo.com with HTTP; Wed, 18 Feb 2026 17:57:55 +0000
Received: by hermes--production-ir2-bbcfb4457-g6b6v (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID d8b8c0de62b821a074fed8fe833a97ce;
          Wed, 18 Feb 2026 17:47:42 +0000 (UTC)
From: tomasz.unger@yahoo.pl
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tomasz Unger <tomasz.unger@yahoo.pl>
Subject: [PATCH] staging: fbtft: fb_ra8875: replace udelay with usleep_range
Date: Wed, 18 Feb 2026 18:47:37 +0100
Message-ID: <20260218174737.86994-1-tomasz.unger@yahoo.pl>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20260218174737.86994-1-tomasz.unger.ref@yahoo.pl>

From: Tomasz Unger <tomasz.unger@yahoo.pl>

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/fbtft/fb_ra8875.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ra8875.c b/drivers/staging/fbtft/fb_ra8875.c
index 0ab1de6647d0..ec4ce534e409 100644
--- a/drivers/staging/fbtft/fb_ra8875.c
+++ b/drivers/staging/fbtft/fb_ra8875.c
@@ -210,7 +210,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 	}
 	len--;
 
-	udelay(100);
+	usleep_range(100, 110);
 
 	if (len) {
 		buf = (u8 *)par->buf;
@@ -231,7 +231,7 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
 
 	/* restore user spi-speed */
 	par->fbtftops.write = fbtft_write_spi;
-	udelay(100);
+	usleep_range(100, 110);
 }
 
 static int write_vmem16_bus8(struct fbtft_par *par, size_t offset, size_t len)
-- 
2.53.0

