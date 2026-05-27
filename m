Received: from sonic302-21.consmr.mail.ir2.yahoo.com (sonic302-21.consmr.mail.ir2.yahoo.com [87.248.110.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3727132D7F8
	for <linux-staging@lists.linux.dev>; Wed, 27 May 2026 18:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=87.248.110.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779907323; cv=none; b=Zy9fKgzGH7y1iB5Y3gV0GlzyPxtkDg1M8JHQNtd/wuw/sJuVivYWLDRwllkVOgg+92DgreKxO1gUMT+DDS32eS2vwr5asl6z3xr86sVK1U16rzVKfUqlZLejgaCnAzXNwSJoOad/bECi2p+P3z/agYDoBDmgBwy90OZoOR/nX6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779907323; c=relaxed/simple;
	bh=thrn6UqmIdj+8+vFOpRu1xUNjQn3ybJ9Lohcg8g7zNY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=gKSOrC6GRuQwDlE11NLqSIVyQrRybEtO0LaxpfpUC9qcFofOx4n710iYYlTFeBeVheVqOZY9Iab8AAar9/VccLHrWNP0izxisHiawfEPymCwm8FLckXU0/xHQ75GN8kdJuBH9vXVWFhvg0XIEpsXyzHyMptVweBWjykhEwAs6TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=X0sMaV6B; arc=none smtp.client-ip=87.248.110.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="X0sMaV6B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1779907319; bh=G2PwHg5aqWPVW93927DUHV+ljfXj9+7nXra9DgEPqvQ=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=X0sMaV6BHj1KNCLQXk48JaYkLBqaRKatQ16Zat4Cib5bPpsV3oraqawirG2vD7+37iIpkmzE7g1FAQu4hfltWXFUkhbX2dE/mmi15RZ2vvketjEn21N2/HijNSfUuxQ7sO0ze0A3O1vqrr514q8xhh95ipaRYKwbAp6RHlTzQNV/2nkPAhWlq0IJwlu1GbuPOwC5QGanHBWSLHHrm6+5niGIyeiUiFajgRhPsDqglhiHptYtNzSzJ/8wSrHVMVlLCBQVkt9TAdk2iIOikBiFTqIviep5uzTAs3iDC7SlGFZHhTzSc0hSG4FyfuNxERawjBRxdUU5+bcWx/FOOV1GPw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1779907319; bh=dVlepjIFs9DYA2I8jJDSPxQDXwFkJg7va7bqT5prJ3p=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=Oj+7OABZSjY+7IoymamMFgldNTpRLVlJHgAb9hLc0inrDhEN39cLS7T8r4BMdvCCV7y/XZu9oX7+1uoO0RX5YfZruauBcUQZrTI2lJvgvuyMQlvVA9040YfRUDw60l9nqYL4l0o9UUt2KqEA0VMcaykvcGF07mxzJgYHcGNYvqx/qMre5CdIBvts9eYJXfCiLG1wpTyMW8LqcEL8mvqE4yIYR05fYru0W40kR9QwQtnkto65O9LP+0mc3rpT4HMQMhE3L0iq0Onxuf7ZvQ8TwvJjlUgXOHA2Lrp+EfNMZn56l6qLt/xfok2r/uZwB3DZTsyZWzGwm5lWQnzS0RM7rA==
X-YMail-OSG: FJ31cEoVM1mJNRjLuLVu6nv_I_I27wlFx8trRiWJrjeQ_6F3wvn__p6JzoFeICL
 uqy54QDMUTsZk5mb1716rFjSsd.SKPn9ae8rsYS2E3VCcN0VJU0zCMmGomYHjzgZMM.LZPfR.26T
 tuHa4goYemXUAY4vwcTFOqQbBblx8uwHmiJOr8MQRUzVtguFdJGdIKLJXJsft.dsVxWpWMSZLeJl
 uNWXV4xVWWtggNkppcwh2sAgJZijcEukdL36tv35QG8K_19E.mxe3cC7iLsg5LtexWlwfZ3RA.x4
 ZpJiPZOedn7kCf0VP5AHH4PLPxkxq_vsdkqp5_oaLu5BPuUC0wNTGbR6p2PEAP5s9DBcIA0X7EnV
 .i2dBFm7qniUCzOw7YpcDqGbr73wkylbeIlCrJoczebZuySRL8bfg.Pq6oSXmJQkBoYmjhA3OSVP
 xFZPGLVYO4mJ2S.qaLebPe.wD2e3OPchkVN5AxgIPbTqUwb.88t4O5ZvPdlPWWIeoIJM.vPezexe
 k0JVmFTGvsCwHVBg4VLaxrPMQWlsCM0XYrCQAfGETFL5H5Tapsxvkyhntr67IK6OF_cdLyKpWw.Y
 YKAibvAE3yTpwagI3raf77IjQ3CrSKFN4N80ecl8caHgbpN_IWJD44ax2wez7OByP40IyrtKq0iq
 yc75QHjDgvS2EqsmRzijpnTXsHpszlS4YRuoiEwgX9SJJDPuV45suK8CnoVHpmcJPlvzECLTugnA
 7ttzLIQ3bB464GdFQSyf5CL.xDA5NaGpNUKXADakc7gXf4WKz78UY6gB2mo91NW4Al8TqQsC1IuB
 6kI5njQMCXwFtTCCasfrhRaFYzSoGdKBv0vMeISwDM6pr5FWjmxoaN0at4Nu.j_m_js9YO0Qfku2
 0m0dVT1Oa3p92hE55zfuEcYwslFzhWL6U9kd3KF8Vl.AszHGaIdhgtb7o3.KCfeL.dL2WISXBUNv
 iuQocTI0HEQO0372UPmwcuAEtusg263_BVFFdjo3kj1a.lUW2yptz5Yb9dWApMNp4kdnT1K1iFsB
 ax1s55UNwPuZiXYMYkyaVXjuuAJp9yHDITbNTrkE2O8OH1zQMti5kPsLQiGZQlvXGfRQCLyl1sB1
 NHDGZJYMDCe8zcQS5Bp3lKqrjXTy_FvKqJX8bIZts3fkpDoD6p_t2aF75M2aTea4McuBoj1RuXrn
 z8jVZw1wN.Lxy06vO5DQ.1OfUu7qcCEdyHTeP3OU0m74k6PYU83BO7XGJTsTQ_G5Ak5dKCvCmSXB
 Jbr4NJeDp0TvHBiXoNA_ELu1LyMOCuirR3ERm7N2L0LXzAFQW0hehzCZpi.uQ5uHwSlPU.q0j3Ar
 3jFJEGLMBaVhGDkTRnYJ1XJ2Ll9RSeFtGRr3.8KJuB1E6PQQ2oSYD4IH0CMH0_6BIL0RvhS4RkPL
 AG7NBSD0dvrP70E0HUeX_MtiOCj57D86O9FofbEXrKqFfx_mejZSgDxzD4hqXfeuQwsLjs6aLHb5
 qolOQ4v9PIWLSQqzneavy2L0OrXdTTU2KiS.Co1biPoqFIFotp6CnqufDwECDEbxfCC5mPEzBgrJ
 L2B2YAHSybZKORfGdXfqDhQWFSZ8v79P5Fww.TmA1pFDI4dF5X1X7uXUmeI74a2XBPFHSnlC1eW_
 sZ6ePzZjzO10fA0CRlUAb8V18XBgaeDa37aN9AT1xT4_aDLG2KxX9tyPzjm6ySH0ObUeWSBlZ.9Z
 X1tJ9gPiEtMLX8nDwKg_HOIcNlVtsBEbWtF45QDPWBhlNpsEx6PlgIHF5w5vODgYT64Q_6I7lfDs
 IDCcOyry0vkRMoi3UHvU7RYJrMYbOfxlZaEZwmvwqlgiBGkjfmAcV3TwdZ9JFvj8D.8OVbNJ36Um
 _nwo1iZYdZOWOz227545BJ894gSMNiSZn3Q5ljKfnIotaOExSRxPlp.UHwdS0RRGRwgMXYz3juoM
 PuwwE58_NpKaUo8TSZI6UR1tNcNOJ5NhyqpK6mngEgTeGVZRq9Ao_TsxMfaVGw2e4QTaiCJg4yCN
 hF_MCjB9bVUf8mmLOshp_gKAgGoASdieYJkBZfxw7v31iCfC8k7NnLpG6d.ZbaItv0Q16dxsC5bB
 u3uyPBxRHIln3j.1_3j3atM0ZcQDZZ.cNk52S9J83llrvxMtVigjwwBAW1uBYXuIM16ONGKELsCH
 n.fVWzCHchvpDqBweMyx9.ZQMGlyG0AoxSBdjhATzHdg2WZOwCCCnnVDnq8jDhds0O4wckaqCAbg
 H._FgtrhsSkDsXTTjv38LWkXLG0zZonZhN4wl44K13LwLWeiSWAt7C1ZpmiR.wymt_8Zf55yknHH
 EUqi.fD.d79SX7QVOgmG2f08Cxw--
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: e7535df5-3f73-49bb-8875-c4c6b7b0a304
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.ir2.yahoo.com with HTTP; Wed, 27 May 2026 18:41:59 +0000
Received: by hermes--production-ir2-89844b765-j4kkl (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID d54d862aa209be4a71f31e944a7592a2;
          Wed, 27 May 2026 18:31:39 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Wed, 27 May 2026 20:31:37 +0200
Subject: [PATCH] staging: rtl8723bs: fix spelling mistake in rtw_recv.c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-staging-fix-1-v1-1-66ad880bcf76@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDUyNz3eKSxPTMvHTdtMwKXUPdxEQzUxMDYzNDI1MLJaCegqJUoATYvOh
 YCL+4NCkrNbkEZIhSbS0AjsQKAnEAAAA=
X-Change-ID: 20260527-staging-fix-1-aa6540361258
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
References: <20260527-staging-fix-1-v1-1-66ad880bcf76.ref@yahoo.pl>

Fix typo 'temporily' -> 'temporarily' in comments.

Found by codespell.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 86c5e2c4e7dd..0ffa69c38bca 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -815,7 +815,7 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
 		}
 
 		if (GetFrameSubType(ptr) & BIT(6)) {
-			/* No data, will not indicate to upper layer, temporily count it here */
+			/* No data, will not indicate to upper layer, temporarily count it here */
 			count_rx_stats(adapter, precv_frame, *psta);
 			ret = RTW_RX_HANDLED;
 			goto exit;
@@ -895,7 +895,7 @@ static signed int sta2ap_data_frame(struct adapter *adapter, union recv_frame *p
 			process_wmmps_data(adapter, precv_frame);
 
 		if (GetFrameSubType(ptr) & BIT(6)) {
-			/* No data, will not indicate to upper layer, temporily count it here */
+			/* No data, will not indicate to upper layer, temporarily count it here */
 			count_rx_stats(adapter, precv_frame, *psta);
 			ret = RTW_RX_HANDLED;
 			goto exit;

---
base-commit: 7cb1c5b32a2bfde961fff8d5204526b609bcb30a
change-id: 20260527-staging-fix-1-aa6540361258

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

