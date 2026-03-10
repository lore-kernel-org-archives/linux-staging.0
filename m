Received: from sonic303-21.consmr.mail.ir2.yahoo.com (sonic303-21.consmr.mail.ir2.yahoo.com [77.238.178.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B907B3EBF37
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 22:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.178.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773180749; cv=none; b=m39/k1yYFIV207kTvV9aJh9ID/1Wj3awlc8P3n6GKD2b+WGiNMyf9+DLSrM+GwBA12QRHz9Ewn91hUHCm+V5mynxbvXyywdq5dD8xw+vnpRbtsdE87AA3tAbFIQaEO19Mde5yzv2gojoul9l9zT6U1ffBv8MOzyJeHIN5Na8i+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773180749; c=relaxed/simple;
	bh=Dp0PKrzupnM9Zr/TCqbo8T7AkXG5SGnIj6eqtgN20dg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DfRtvfsFS1XmdqIlShXDbUMzZl7qPBg0UWSUAvxi3219cY3pjXGKfXN2Pt+i7vSp86oI2YKjbEaZGZlar6TtrvOZrI4mT2UKbQWehDexooDwAkMpyQHmpQMSl3hyUU3Dxjg0J1GNOPDBYHlaYw3H2zOJwomekXdKu8RZfEMx0zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=HcU3Waqn; arc=none smtp.client-ip=77.238.178.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="HcU3Waqn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1773180745; bh=8ckeZyJN2PlnSinFUcGsnzDv2zOqaBXkAtGStgRDD8w=; h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To; b=HcU3WaqnO2Z1aZn7OOptpLWcXgQBJx8rUxV8gRIlicyn2OtAG+hzeFg2ZhA7Kvq6w7Rh9B5Fv0VqzlvElivcUB4nhaD4M5pdyR1CyZ7PK0apmlZtdeQ1YiCqwZfk/8yAmZfzZfwVM0uAPzDbxLjhWa7CtEoTRLkZHYGGEuprTeTq7AAgg4ZZQA+G9rPCLUk7AowPQ8WyY5vtU2bM1D5yxi4SiEfnCkiv/j22WkvLDuVZT9nkR8SUAt7/99lqYVbPee9IqHirMwd0D48jJBi9TV5U0fPqBy7gq6nFr4o03lFz5Zg/1PrbXW0O/crYHjjagvm00RgZoCzMKMdMXgd97g==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1773180745; bh=ltOVwOhtN6hwV9nvbJJ7aQedP/vg7FjhsUghldCIYys=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=HKRHy2fjteplnWdDA/xDcw7xq1JMrrMgOhm5Bu/Nl3hCuUD+SCOsx46TRULo1xlkjE1JxAtaBotoM4YWYDIoZte9F6sYRDSkeCMoq79anDYfPKuf6o97t6n06DBqQ8kZxMBaf9B4wwy1pOqAjgJuAZDPrqtqEau3I3nzXIpWihBjX+4DviIbhrieSyhrzrReHXLaw3QeSnb6g529QueiIdbKrZazUxUEF4rjVzYQ3Rv4PhErT/4tEK5InRawgPFVU1bgndivbvzTPCGl2WINKPIXG6ZgqGxVgAhQudjOcPERre2B/rDyVSWrHvu5zQrAZ8pTQLfo5IUI6PqrOeo/YA==
X-YMail-OSG: aqzb57AVM1nZNd.6i1wdZHIbVfpBwXGKRjHuamuwi8Wnv6zDKNDzDAR5RPQmZEI
 D03qUy51_BGfRDXNDN5UWpuUcpVDiaE0MuwuiFld114mQ8A5JiUIzr9Je35mtEco9DIq_wMzUEL0
 vZLyO.0ZAlPb2qA5Bj5_fg__4DcIsxXCzb5etFgW6_lm9SqExXFq9zUYam9vRaJZFEtK4aUp.wnz
 cq.zJJ8YV63iuFmMOE48483fLYGAsjvlNt8OPn3P00.Krqpc7JxDL0Y_rzP9IDciqiI5FNIWOl.V
 AZ9Qq6DRAJASJyaH_Yjx0PoCzKdX.II1bJ08yixNdlBJFn09d1gjTq_VZmKKwTpjRgVqVrXjaIWY
 l5mhH9FeNlspFuMT1TyeemWVwjx1Bg93hFqwzuEG4ROlh4S9pIECPorB31NEod4rLS2gY4gIkdaD
 x1WYuJB.ckxiZP9sXWXE3AbAOXr5i_EMNK1Br6JaoGHp3Nn6GXURUIDARyunudQhgPoUlYZ7i6mG
 JvQPGibuzaKcK9Lc79PxdqN.InzHcROSW4e2xT_SBec0EHcWA9GKGtNgW_IIPfVnxPtPxa9pz_Ev
 7h5qHPtqqu0k1bsrKi3Es_RASnPDUwkVk33fnW8_nZ7c3Hbrx8YXGwgejADmPTQdELIiDCHTXVxX
 rg4zgW74ZjouOJ_SZvtUtEc2_XJkFExvVhMqp8s.eGHkfKrVnuntR_I8.6KreL.OMxcr4.SEL_Ez
 Iiax0feBLCexX80TdjgiaJp9FGM7wuMS4xHtT2uLaLtO5g3bk4fxKrY1scz5Hfs1C39EgDtaMQqi
 uvOIynzDM1HUyfxHHkmd9IprWXRWvt.0t5QhbXwl8oWQGvLRFLk5DgGf6L.LFpT.9GCshrbvMDq1
 5xZi7oKXKimr7KB3oogi1Lp2FoZd0aCFbXmYwypxQ7xfOAzNUgY7Q75WpGTBdqGsjOnfh93zAKxj
 2U2V3u6aiD1th5cb3oQUUS_L5AAwiUHYcQXUVlkfMyRZjl2ukPYsuHBI3btrnM2teVpKMpYl9oGu
 XxUBG2WOginPAPaZoQRR9zqN4.l.DNPY.zCDO_dUWrWsrqpl3wsDCfAhRcpK8vpHQJi4igEROew3
 vCmaK7svWOAFkaGJVYQMQVTJZT0wOr2mdNu1EwuLP4Tii6Taho_9tzV6m2SONubHsLZ0Zk0hBuVz
 nr.AlQAq5AT5ULljIlDjIKwrjxEoTfQtTKQUF8Zz3KLXyHFO8jTLCVIeDM0ILzPGigkiF3lKaa5H
 AqLTL_NgIsJnAe_7dbne9qnAhApBcqLpHJ62M9KXnxgFjvEKMACRPTHcDJBaExN7hq1cp8.IQUW1
 BXfoxVQ7TuCzmuEQU5DNn9khuvuhvsE9Rlj54ZriCUZA_5M.zJtTl1r2f.rxPX35TqKzLqm0kdi5
 hGNTLtbU6pkHSK2NYDsLuYmuTWFuhU6GyVJfUsgjZJlo2I5DPcEkmU0ibf.JF1oBBpe3pzT9byiS
 PDmCd8TLr5yl3H0b3P15wn0pbJ8hbT.oH5wfFjVt.NOS5CDaOW7pUbM2nmkEnZ4Q47CpIIgAoXSW
 zt9_d8KETOYNxViXBZnmBH7ZX0tQtttv915H0Ok7VfLq2Efdo8SbJPZnj19WygV_Q22FI6qo3YMx
 xJsqkjyzCx9PVBACT9fXzM_mF1k166eGMi8ckyIT5NXk3OtfcAshM9D1NKEy9b5FJ0u4gaAMElns
 ayOL0rMGvNMIdJbwGaQtud7xiBfoVjnsXzrNLaCTqMElh7OW68t57s800wDky.9eUkciDxC9NShs
 eKXdZfQFYWr2.fFUXkm7sRw6uByOgnfr8RWg3n27dCck05Vbb5A9Kiy06bqXV30jyyaaF6bccKLV
 i4v8IDrYM5wZ_5PVdyJQgpVDmPi9kzlMoLjLnSsDUmw_PBnB0gI3.6VX5mvjBYlRSGqAr6lJ.U7.
 5GkIIacg63x9KGlCElIHN_ho1RNls5yubdJ.yxOlM355HUKMCRssPd6yDaqAVr42CCh9333UemD0
 nqffLbWUqPy6lqTjZGUtPvt4tqcv3JURy_kvMAgFwve5yY9NzhP9SXuaW6dTz_NNwHGmcTgqzAUJ
 qwV0JCyo0.bKzpb6jGFAOUEMz.FUmIhUjtgeqET023zDNM9pYLeCw9GIcP07Hg2OEfATuIEsK0Bv
 rl.UXh46EYoWE59g6qyrlJ1OK_eiERdYm1FTWDKkytsAf5Eu90xBC3wpD.fKxbZ9y2qG379VpDqp
 mjvBbyBJaswakSxn6b850CVlTp9g3LiPAYm_AciaNWOw3EAsUZPkw.XyrX_hEoc4dLfCdObHF2xk
 X3tTdfyYgTZFqeUBEnBCF_tlSAbrP
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: b5ddd03e-2ae3-4a00-85df-e9327915702c
Received: from sonic.gate.mail.ne1.yahoo.com by sonic303.consmr.mail.ir2.yahoo.com with HTTP; Tue, 10 Mar 2026 22:12:25 +0000
Received: by hermes--production-ir2-bbcfb4457-4sf65 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 48b5c4a15ee0780b19eed7b75aa629cc;
          Tue, 10 Mar 2026 22:12:24 +0000 (UTC)
From: tomasz.unger@yahoo.pl
To: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tomasz Unger <tomasz.unger@yahoo.pl>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v3 02/28] media: staging: atomisp: Remove unnecessary return statements in inputfifo.c
Date: Tue, 10 Mar 2026 23:09:46 +0100
Message-ID: <20260310-atomisp-remove-void-return-v2b-v3-2-f2977db216cc@yahoo.pl>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260310-atomisp-remove-void-return-v2b-v3-0-f2977db216cc@yahoo.pl>
References: <20260310-atomisp-remove-void-return-v2b-v3-0-f2977db216cc@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.3
Content-Transfer-Encoding: 8bit

From: Tomasz Unger <tomasz.unger@yahoo.pl>

Remove redundant 'return;' statements at the end of void functions
in inputfifo.c. Void functions do not need an explicit return
statement at the end.

Found with checkpatch.pl --strict.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 .../media/atomisp/pci/runtime/inputfifo/src/inputfifo.c  | 16 ----------------
 1 file changed, 16 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c b/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c
index 8e1efeb6372c..f0dcd839e33b 100644
--- a/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c
+++ b/drivers/staging/media/atomisp/pci/runtime/inputfifo/src/inputfifo.c
@@ -88,7 +88,6 @@ _sh_css_fifo_snd(unsigned int token)
 	while (!can_event_send_token(STR2MIPI_EVENT_ID))
 		udelay(1);
 	event_send_token(STR2MIPI_EVENT_ID, token);
-	return;
 }
 
 static void inputfifo_send_data_a(
@@ -98,7 +97,6 @@ static void inputfifo_send_data_a(
 	unsigned int token = (1 << HIVE_STR_TO_MIPI_VALID_A_BIT) |
 			     (data << HIVE_STR_TO_MIPI_DATA_A_LSB);
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_send_data_b(
@@ -108,7 +106,6 @@ static void inputfifo_send_data_b(
 	unsigned int token = (1 << HIVE_STR_TO_MIPI_VALID_B_BIT) |
 			     (data << _HIVE_STR_TO_MIPI_DATA_B_LSB);
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_send_data(
@@ -121,7 +118,6 @@ static void inputfifo_send_data(
 			      (a << HIVE_STR_TO_MIPI_DATA_A_LSB) |
 			      (b << _HIVE_STR_TO_MIPI_DATA_B_LSB));
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_send_sol(void)
@@ -131,7 +127,6 @@ static void inputfifo_send_sol(void)
 				1 << HIVE_STR_TO_MIPI_SOL_BIT);
 
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_send_eol(void)
@@ -140,7 +135,6 @@ static void inputfifo_send_eol(void)
 	hrt_data	token = inputfifo_wrap_marker(
 				1 << HIVE_STR_TO_MIPI_EOL_BIT);
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_send_sof(void)
@@ -150,7 +144,6 @@ static void inputfifo_send_sof(void)
 				1 << HIVE_STR_TO_MIPI_SOF_BIT);
 
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_send_eof(void)
@@ -159,7 +152,6 @@ static void inputfifo_send_eof(void)
 	hrt_data	token = inputfifo_wrap_marker(
 				1 << HIVE_STR_TO_MIPI_EOF_BIT);
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_send_ch_id_and_fmt_type(
@@ -177,7 +169,6 @@ static void inputfifo_send_ch_id_and_fmt_type(
 	 */
 	token = inputfifo_wrap_marker(0);
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_send_empty_token(void)
@@ -186,7 +177,6 @@ static void inputfifo_send_empty_token(void)
 	hrt_data	token = inputfifo_wrap_marker(0);
 
 	_sh_css_fifo_snd(token);
-	return;
 }
 
 static void inputfifo_start_frame(
@@ -196,7 +186,6 @@ static void inputfifo_start_frame(
 {
 	inputfifo_send_ch_id_and_fmt_type(ch_id, fmt_type);
 	inputfifo_send_sof();
-	return;
 }
 
 static void inputfifo_end_frame(
@@ -207,7 +196,6 @@ static void inputfifo_end_frame(
 	for (i = 0; i < marker_cycles; i++)
 		inputfifo_send_empty_token();
 	inputfifo_send_eof();
-	return;
 }
 
 static void inputfifo_send_line2(
@@ -297,7 +285,6 @@ static void inputfifo_send_line2(
 	for (i = 0; i < hblank_cycles; i++)
 		inputfifo_send_empty_token();
 	inputfifo_send_eol();
-	return;
 }
 
 static void
@@ -377,7 +364,6 @@ static void inputfifo_send_frame(
 		}
 	}
 	inputfifo_end_frame(marker_cycles);
-	return;
 }
 
 static enum inputfifo_mipi_data_type inputfifo_determine_type(
@@ -453,7 +439,6 @@ void ia_css_inputfifo_start_frame(
 	s2mi->streaming = true;
 
 	inputfifo_start_frame(ch_id, s2mi->fmt_type);
-	return;
 }
 
 void ia_css_inputfifo_send_line(
@@ -516,5 +501,4 @@ void ia_css_inputfifo_end_frame(
 	inputfifo_end_frame(s2mi->marker_cycles);
 
 	s2mi->streaming = false;
-	return;
 }

-- 
2.53.0

