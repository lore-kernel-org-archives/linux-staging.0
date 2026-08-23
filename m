Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B8F31B80E
	for <linux-staging@lists.linux.dev>; Sun, 23 Aug 2026 16:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.82.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787503601; cv=none; b=t+ezTazGgj6OVATJ1w1/pXFzgJsGSzmBad8ochOf6bZGIHIEi1L/LCPXYTEjWVn72OR9zxfGb9Q0rQ4mvohbG5FSXSCh9+qgjFfopQ4+SMSOyGEoK6acYV5rAmXz2pcDPbc7XqxkIjjd5gZl3Te3rp78umFykKmVCZCFNBy99v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787503601; c=relaxed/simple;
	bh=9cFSTEX2tohIEI9w1qXMUTdU16qxXqI561KVUY0qX5g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e5KCtz9WzbhTfpD9JiDpWVZ1+ypHSkNyIA8xH4SKP3LYYvdsL0N5RSsYNjbZmQXLnKC2rW9hS0UTCHHiF0tyTigjTHwZ8nDdQXVUgytgo7r2rl/cktI2tnrcSNSKuwwVHcGaoVUDpxQXEEHaBhz6AF5RJ8by6iBh9Wj29NCHx1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=NiNjjjpF; arc=none smtp.client-ip=34.2.82.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="NiNjjjpF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1787503598; bh=kPkI6Izg7i1eyeS1UtAPtLGYSlM4bvUl/ODAkjJBnzA=; h=From:Date:Subject:References:In-Reply-To:To:Cc:From:Subject:Reply-To; b=NiNjjjpFtBHFHgBMXic+wyelwRhSKVX8DotsvtT23GtPcwEBeofwoB1G/WyIjiUrCYafyg/PvosPkzrSaD7NqlHo/cdaR/Q0eHdRgrAZlFT795pU3jJGD11qa8WkpeswcVn1sFj0iWrbuaxtXedheddwsqPy0UYteqnHqkxxM9y+7R3vUD+pnugNmpbvQUMH6Stz8Qw6rI6h0vL6ODqXev17VaqIuzhZEHyfAy4WIWbQaUKXSTNNaAzswnqWki1huWtttIv18c01gTNRPJcUGaxxaeC7egAr5b90xrZgJeB8PRHXkRx+chycM4THYs3tPCr8BkDg78Yn0X7D/DtrjQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1787503598; bh=7/XoYmeDxT3qMZlds/2Uk67XNmUVCZgwWn9hIlo5mV6=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=QqdALZnk1LQrS2NuQz2VqXQnhjDwDS1Hgw9rFz8Cq2c+kKKVR1be1TZZmTDm3dURmqkWkvDqS+4tA74s4BQZhEdL2CjaXUTjTkZqMsivx4fZcPoRqJFf7LEw5m6wL2awngKvZ6AJl2zT0SnK5momeaGoAO+BCfR3eR3wKiHpRmkp6YQKsS25fUAAmdovjB1OcXWkATYrDL2ahLQHykwJhBerLdlSXAODHXh2QNHZyBuhzIgxfsras2Nd5j0yMZnT0x7NcP795S/ApSaq6yO7q+y9kHJB9vv5R3Nxbmv0XSkgg0nR9I77ZDq9IswxaxOUrKFP+5mNGSVXVmymBJpK2w==
X-YMail-OSG: 4An7_LIVM1katkcZw2ktDWdmKl6zWkjaNqH2QNWY7WUE2oHDaLPlUzcAxeXug0p
 9CAYe46JBXVWWXx5aAkElUhWNpCrzIyDjqNNJjk9t9.nvgJKstt.5b4cDwEAZXQKR.pPpM7FUWew
 ih2WgrH.PkdRjIx.hlRYJ1aEvsmfMGdHGrDiWRHOm_NTpQnJuGffXQ121Rt4mbcWa2sfkD6KeCfM
 98KM0j62AOeFYt3y3o4ajIxpC7YhAtm2ToeOpPGSpzEeCtPRs8SBdA_odFsE_cDVI506YU1Q0tTP
 YHo9_uVdCQteeKS5VE_F8Hj0dcTynhwGZu91T12RLNSSvSrkEVuxQsmhAbvoZwkwVIkdrNt2tWuT
 IFGtLUhJPG.H9TLWsQtYmQ6jHJ8SpcDZr4BiCjitOeJ7neCGwb14LdlUsuPmaISidx.dp7ucY3Bn
 IMoB_bLmpLgzmZRYdRQ6IRFYmIsOvs2iSAEq.dVJgjQP5PK94EXAQtUN2ToOzHUAYDoznokmcrwd
 ygtt6Jf__c3ua7XM9ck3Wvdf39O_Junqi0QX2tict5bPXw37IGXIpUlTUXhfgjjVxv1gXnuNrtvT
 aVKaNLlSuIyilYm5fOHiQ__wPcCH1ZNLzBTfHNsKQqP6z2JOROnz8f.AQygV4EO7lc3sM96Kc9b5
 DtMS_3ADiQB6uNFVXoeKrSSmMu.MQ_ds.K0O5tD27Q3g9PfJnxAK.zJNRYKkOlS__ru0rT4Id3Ij
 JTBEVoX.JfDYRCAYy7l954sw1WG90qrUQAeSImcTd8an1lIFWAkXf7H0m5NTuB6SLbxuOIRx6NoA
 Xtyw99yhOwK5fnb46fs1IEn_5PEy5wRhlNr2b.hSeINSdHGI5IWC.r_7DkfgJ_r4HgQipaTy8_7t
 a.140f3kqNZqJE_OM.DfWJiu8PNBtoavkXwygPoGzeDfFAAFpIJ_.j0vXhBZM0N6JOLkmARz10qf
 CaI.I9ZKoPFcPuc79oyXf0X7fRZ6XorTew84mbiaEuNDGvMgVOiBzFi5Ow9wn7fFdCEgZeNI32Xx
 OaqulY.SAc8Mhu3uq6Aymo1TErGtBcFIQCBUUzXqTbK9sTBeCT.pi1.WMqjdz0iGRNVHo5ZcY18H
 vuvEq84u_9Lte.Bf_Q87ILfhOlILBCtYa9axfh2Dpagd6eU5QtSlLpn1mX.SexhLYYFXsknsPnNo
 fB2NQpDy95y6zpQ7T0FDppUEKami4vAfNFSlVE_on4r10lqOsbHYKkIMxPVKeHKF8_NiRzzVZKqE
 Cr41My3aLAQUte179ChyYspcRr9cElXKJ6c4tlLD4SrhktBQ0nskEVicjsI1LhmsLGRixuMsNCZw
 Sf0QRWZ_CLJL07JuNzFNzMvb_5H7YTVj3mwBkRW07TpDXmZcTe5wkBmIB0N2t0WLkJgQZcSF9XZl
 jka68KjI6qZoJKKs7Cra3gjCrcXRKvC5OMZkrfsOcAvwz9iVe_K.uoy2j_J6eiCWrqv7fo8PCIF3
 XKd4JC_3PF.__glhRprd2okg3hbVfRoSiq_QPq39Z2vLdjoEnTgknBESZMY_KuAaVJ1NGr5kcfvO
 hd6b1WkcvR2fTLoJ07.J8yT.vix3jdBKge6hSbdNDbSjNMb2f6z5hJo6IngAxx4k0nMFmbx4pYRr
 BO4s.IYB7ZeLwd1UXsga7Ya.BxwU3z0XmeQYo15GYMmMAj.0E6nPl0BVt5Oy1764YEiMNJ2TcFhi
 vQ86WL5VlkItbBieTRAyIu88mNsLttZqxSyLNlQlnyXFEXM95sxYvT9ohVYjhXQeWtK7hU1LTw6K
 Be5hC9jzdUD4oVbvBYS6IYq1Gx9poqagsqQG0pCXZUKBve_PBSs0TO1D7uGnmiXib.V4CdjQr06v
 exB1cRE2rTXBw7cDJXoimrdk_vF6ndE7a12O6a84Ddr9RRjPGHITuiygIBDhhC4G.Ry1pHxQwIo3
 eyRH5S4TfWtIElXSKFO3F7B7TvUanx_fgyCfWEIo7eGwsHYqNeAkbDXxTQy2EU0sAYn8fpPv9n64
 soR99pzdaHVZOEv3N4q0HGT5SzARfUKnBW1dkkUM2Ej86WB0-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 934059a3-135d-4577-8a85-3aee64d22cc1
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-102 with HTTP; Sun, 23 Aug 2026 16:46:38 +0000
Received: from dip173.lsn.ir2.yahoo.com ([87.248.99.182])
          by hello (SMTP) with SMTP ID 5d2b60595e62a328da161988bd9de51e;
          Sun, 23 Aug 2026 16:46:36 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Sun, 23 Aug 2026 18:46:32 +0200
Subject: [PATCH 2/2] staging: rtl8723bs: fix space before tab in
 rtl8723b_xmit.h comment
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260823-b4-rtl8723bs-cmd-xmit-space-before-tab-fix-v1-2-11f2600e470a@yahoo.pl>
References: <20260823-b4-rtl8723bs-cmd-xmit-space-before-tab-fix-v1-0-11f2600e470a@yahoo.pl>
In-Reply-To: <20260823-b4-rtl8723bs-cmd-xmit-space-before-tab-fix-v1-0-11f2600e470a@yahoo.pl>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787503592; l=727;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=9cFSTEX2tohIEI9w1qXMUTdU16qxXqI561KVUY0qX5g=;
 b=QTW41DVSv+l/w+MAkt+jI4QyVaO5L+bFu5wCjPMMVyUeZvp67JoylZWLzTqty3Kr36lq9+nHi
 +DAlpzPtodHCvnPGrsIgRsAN4JRqTPH1t43B60+yG5Bsk7ABsWqgNPS
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=

Remove a stray space before a tab in a comment.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
Verified with checkpatch.pl - no new warnings introduced by this change.
---
 drivers/staging/rtl8723bs/include/rtl8723b_xmit.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h b/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h
index ddf868c7899b..c2b5696554fe 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_xmit.h
@@ -366,7 +366,7 @@ struct txdesc_8723b {
 #endif
 /*  */
 /*  */
-/* 	Rate */
+/*	Rate */
 /*  */
 /*  */
 /*  CCK Rates, TxHT = 0 */

-- 
2.55.0

