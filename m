Received: from sonic310-57.consmr.mail.ir2.yahoo.com (sonic310-57.consmr.mail.ir2.yahoo.com [77.238.177.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70195399349
	for <linux-staging@lists.linux.dev>; Thu, 28 May 2026 09:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.177.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779958864; cv=none; b=MgNjiKue3bxgQZHQjrTgtzhRVGqG5No+LIX6X45LOpP+hQsqyS4xOcjH6LvXBWAlIs+PvG2W320MaQhyxH7R1GMFOgauCyMfLOrbeNxZLhcGjl2bX2QgwwX/0YPXW/Z48eBwe4L/rT/bv5ADiB1LrOmek+UPsO4UN7GJcX2kqIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779958864; c=relaxed/simple;
	bh=YUaj0Euo7RFAUcilVXXHIqtP1EjJ+Eu9pZTyeH2MLPo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=iVzIdwYk3D3lmL930koHsu3sljnGgzfDYZkeXiBgbELtKpleCGIVog5s/yhtt7aiqJtXjR9KnEBDY1iHSHv51fjp9xYkrlxUNSTPsm+Sl2N0q3sHlqmyPp3PZF6PZYOM9bHc9DEv0GKuYJzm2MThU5C5Gu+tuTVgunCoOTWHQOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=BBN2OtsP; arc=none smtp.client-ip=77.238.177.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="BBN2OtsP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1779958854; bh=Az3gzCkfjkDRlsIJE8Rt9q6fKbxdI7zwJMmynTHKUx4=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=BBN2OtsPS1bVliBBvknDE38Y+a1j2a1fzqcVOX3On2LW8xNaX226fA2Bd4ZnlJnKGJdDBGhZ5DNb13S1ubg9YQo1usY0bAgbbpWvdwlZzjXY5fVFns5K5tF7z+ZG15a+qFANjy/23rVL4UaFdwrqPKCGks2SsvoaUQs5ZdYeMd3HZcevRxpuATwi8d+X/l35LOJf7mV4aK3rB3fUs2Ap1HQ/FITzqk1Q7fXBGn4JKFLtVDGl0fbz1rsxHozBlezJUwhzTnw7kduJBQK1PBie+bZSxF76LLOEp1eohvZ07an+DohX+/o2iYiApWEdf/a7tayFNBTjJsh8beWKgbxfEA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1779958854; bh=wso3c2il+EcAYJKaNd0Cr9vsNTu2bwyNVwH2wiMpUJI=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=bubYfKGs+gmBiYZAZUuI+8RVaof+QAE9poFxm7uAb/jn4uA7wH9eUajCUcA/kNouOYpq2Vn7Hq4cyeWvbwocn9E+bpDTZmEEeVXw2GJfUvW7D5+5Ewqu/0SfLPdbxDtmOsKDTrjr6kv4tTtDBZioCT8ThGH02X1vNUloznN8omXPHmCWskXEGoHdU7gvylD6AJBQy+gh7b5YIYZqn+Re41okp3cS3FM4jIRZTNGqLcbumDQhv34+m1QkoGEokHKs0K7elwpJeCbhxCLbB3s1YgvnGo7RT9DRsMyb5dvMyDMsEGTfIH59TwRmxWt2OCOUw0hamAYlXsTqmUNkZtmYhQ==
X-YMail-OSG: SrA.zcAVM1nKxjPs4CBNe3QbWGZKlzzLUZWnUtB_ALOgDhCb_BHymUaoFyfc2Tp
 XPtIwoljMGcFv52uH7OmSS_EPgYobIi1BeLUatpaH737Z3nueqUdvxOK1cAmRBOzbrBccjMn0yM6
 wP6Ps77UfiOr.fHynCubZD7J3Vq6yxq3qqYIITHQFA4tuiAd3iH1yQaVsrHQdrjAOpZ9Y1ZjhFgR
 d_N9ANJlrE4JQBrQNAX88DHU8Y21aH.AiLEmGonKWztgTwMJAE4pIn2aNXcidr5lNaWZhbnXxLmR
 793xvC5EQnQ6naq5JBIXGU_WTdoQoGD8cPo7in8HpZht3mg6DHwAjt5bSfsqiI2TNOJNsK3.9i38
 cTYqyKdRSTp4xAsb3YtR3RtUSvnAoTJkmx9rVqIPAxvXc2uHNGWuLj5yV1fQOnRjPBCf26SbDjFu
 x.SKwvIzgU0.XsQnkmlhcDsNfimYVYSQzVd_3gbSqwDDZGQTeeRHWAqoZKk32XmWJgz4OVKDsVFb
 4TdgNYQhIGP2WrV6Z0L30aFm95_hhQXCfjp.WeAwMzYWsUqHD5mApVBlm9ro6D_RGLmNy4bVYq5P
 Zzs4BryRUqAowGTDkVXuycRDgWKw6qZhsNK4W3fykqsmtG0klIq9rFbIZ4t5Zj4y1H.FSBarE5km
 mWFJ5xyca5xJafCcZ2nW97afQkOlD6khTKlunn03MJ200j8WpqOyXyNgm7y9X5LxAIBZZ_xocpev
 rZelIB9fAW5CEyZc1v7IwOWQoxagB7A2B0oKvEteii5k2ROjAORjwHVPjHvyi2nonVBTUTANT7oV
 mz5ue0Cq3g56m0KB7Nl7ckl.Xo4QJ7PeNXxbXspZBtIxq3P3.AUpk5xUD8_CRADh0otwhC27ywWl
 .QyExf2cJl5dDt6GsaDBvXWzbamqKqNc.53N_EXYTzWsy81D792AkvQ3xTPvK6xUcUz9YRYxsQ9q
 gDIt8EFLsyH73ZzXqx8h_ndDaITxYa38NmupDvqLOWgReJnC2H7O5qTzp81nr6wiPPxRPCW2KZ7A
 RYWn.dupD5D7wCanKQCRLyrgEhEbU4YZ9yKI0sP27wTdJ5Yu3oPk0GsdWxTVG_7FXqmJDMqn56Lf
 q7ngBbzdfgiv4zePBGHvcNF9eC0XShPvikqaSkAYdp.IFwFkZVJEKbp9OvuPaUuDZDlqcnDtS.Y8
 _jDxvwKeXlbnLvlnSzRD5Ak3wjZV6LnOnWc13dixMycdRY3bhWXkMEjsj5NOzyU.ZnHK2Kb8xIIo
 cBL70T0M..Fsvxu4StObAtbeHRkEavsFSqE8ccurKKFLxb5yeOCmK_bcuc8U3iHjag1IQficnleu
 KlLitmYH.M1ap3Blwe2fihUIhR.plDsYlolzCVPwtPKh.nmQIQpaxZCOxLLmEGIz4j.5A2QNXSqD
 uwQaEWYekPn0Ksd56.5XikdRbe_5wrfQLTgmrU_6eBMZsiez1GXHSUm230unJN_XIO7zeIPOD2Se
 VRx.hHKXZM3BSLdu9bnN17vfpDCh.atkyJKFBfYpLvUDNaOzWLkWLBRHEPpEfn026CJTc00flaoT
 omP6LvlEpJJSWPcRPDEtnFXTw2zK_4TOSuDkPOYZ5ZbqkVpHmu0CvaWVJIa3VB3sfzaEM1poruZ.
 YoexGavwj8nCUB_iqAbtncjv7shMiOT6L85.ymYSmSRC79SJ4GSg75yngPx9Sh.U.WRG5bzinJnu
 3g45rQxsVfM5_huPzbo609KYNgO13jtuopy.fx8aysyFYxFe7KJBnWDzqtDVUJgRwbNNg9VslFXU
 Ps8iq6aBAT1R5UzXjJmyLAYDV_PnhaSi5zDlCDCB3CGXInn3JN4ps3FzmTnXEhelxYZGM4M9AbXD
 jG4_TWEj.8z9uZjJjqPB74BKL0oIZaLVHcytuuwfSITmPRYe6tQjZ.ZHsFmyOJpzTW.huyvylCj.
 ULXFmEUD_dVGkTaHvlZpYwIaMfJReRAqQSrHE0v_2SKFZ0bQGFEh_vo8AhxTsy0wb8xTkuE7C5EH
 tIf64G97FKzl9DrXpCjaL80qRolORT4b0W_Rq3gBWpPVnUyRrF9IzvB7t4wQ6gVCDMFZoebspzO6
 XHuZ5Vfn.jdHTLBMUENChhzuc4Oqtn8s1KYA35znUTzZ47.2nGa885X30PkyMJ0Katx8IYjsXUVD
 05LScVNn.m2GQvqIPCTSWhi63BsXfTdH7hZqQGs1g7_Ws6wSVTsxfWe2_pWX2RgJBQVtdc_8GWwa
 dsrUuPKh47DII3OpT8akNXlT6grbjm0Vli3SZwaux3QVFdTCOv0OrafZFpliWEekAw9pM30dCq6W
 1qn.zJ04cWUNk.UOODwbL6Bomh14dLIwXMYRgoSBD_1KUz3oh2qwLb4454dOorYCc3A--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: c8918c96-bc88-4111-9fe3-caf820e92147
Received: from sonic.gate.mail.ne1.yahoo.com by sonic310.consmr.mail.ir2.yahoo.com with HTTP; Thu, 28 May 2026 09:00:54 +0000
Received: by hermes--production-ir2-89844b765-v28ct (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID feb719bba49da831d4499f154d4a9db5;
          Thu, 28 May 2026 09:00:49 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Thu, 28 May 2026 11:01:58 +0200
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
Message-Id: <20260528-fix-typo-rtw-mlme-v1-1-2172d3227b00@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAIUEGGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUyML3bTMCt2SyoJ83aKSct3cnNxUXWPTpFRLQ3PL5BQTUyWgvoKiVKA
 isJnRsRB+cWlSVmpyCcggpdpaAF5K0MF1AAAA
X-Change-ID: 20260528-fix-typo-rtw-mlme-35be9179cd45
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
References: <20260528-fix-typo-rtw-mlme-v1-1-2172d3227b00.ref@yahoo.pl>

Corrected typo in comment:
 - varable -> variable

Found by codespell.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 4fb74729180f..43587a927d17 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -52,7 +52,7 @@ int	rtw_init_mlme_priv(struct adapter *padapter)
 	pmlmepriv->pscanned = NULL;
 	pmlmepriv->fw_state = WIFI_STATION_STATE; /*  Must sync with rtw_wdev_alloc() */
 	pmlmepriv->cur_network.network.infrastructure_mode = Ndis802_11AutoUnknown;
-	pmlmepriv->scan_mode = SCAN_ACTIVE;/*  1: active, 0: passive. Maybe someday we should rename this varable to "active_mode" (Jeff) */
+	pmlmepriv->scan_mode = SCAN_ACTIVE;/*  1: active, 0: passive. Maybe someday we should rename this variable to "active_mode" (Jeff) */
 
 	spin_lock_init(&pmlmepriv->lock);
 	INIT_LIST_HEAD(&pmlmepriv->free_bss_pool.queue);

---
base-commit: 7cb1c5b32a2bfde961fff8d5204526b609bcb30a
change-id: 20260528-fix-typo-rtw-mlme-35be9179cd45

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

