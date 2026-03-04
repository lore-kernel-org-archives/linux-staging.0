Received: from sonic314-21.consmr.mail.ir2.yahoo.com (sonic314-21.consmr.mail.ir2.yahoo.com [77.238.177.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CAE37C91A
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 08:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.238.177.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772614345; cv=none; b=o1+04Hi/JG6bni656C0s24YxqeUKR0INmUvQBqX8WukFfd0u4mBL+MC4wTtJ7qwf634h52gJBOoyH2Xg/07c1uKyu79IWMoFjaO7gBuvzBqoq7f5c3iJgX0bDd7QXESsfhqSsNhhbW7a8CshfGc8EgOjXYHn04OSwbrqd7YKEPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772614345; c=relaxed/simple;
	bh=UQcCgKIxJIpem+CScnTshW2NOuB5f42azRcSOn1AOxg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=JqJW9ivaKAt8Ncsx1peVEUieuZSzblVdz161g7QAqq244t7OrPgG57yKo2Kt0I1qmguIV6kl8QEjAwMk0Pq5E+NdeRBQUp+UaQ1Jc3fgrxviz2tsVjslx9sem44GPLj6PWVTnbG7wUWTZ7PhPAElUHhWxOOWP9JXdXANURn1Cw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=RijGBg5i; arc=none smtp.client-ip=77.238.177.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="RijGBg5i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1772614335; bh=Os0WDSIGwRsFYn6b+eidrUEBouJQdeK3F5pQzkvRx6w=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=RijGBg5ilzJQ/7n76+u/OAU9U5aF1bo29mUuORo09My51bLDURa1TtxH24knaTiVyg2Ktkapk4xbqi5GIOJNE6L4d63TXVbMAwGA4+vZuOTAWHZXF6XbRzK6quokrNn66Z1tjC0D+2nAh61D3WHpkMj7tdX+m1o0Ijg+ZH5ao/pZXVphzkM0S1N/PPE2ZfYSDulIMfwRvviggLbqnyRhdtjHwNuS/522gSPo0Q7x62TSiftIKS66nysI1/kO39td9jYOUKRkLUXk4cSWM+yz0xQRvufEoE9TRpiLCkBPCpgvjU0qrSCwZ0VnN/jkptCX+hh6zxvGYCQfb6bgPUA1Kg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1772614335; bh=BFXR909BgPjWCpB2UAAAYqvacvxLEoDneZ59oobTbYe=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=BnPNyo3UCbbS2HbFLOFDer3XaM5WD4U1u5rvcmglZCkgcec2Ojkvpm8cy4DrCZjIVhyA9SSBXqgpfxGZDYzAnu5gFYPKYBBmXqcusRjc9rW57DiqP4GvnX8lzZ2B6jNKok7MfjrRmxtIaxat+/sxPax7oLhe7cOD6Jv+KRlqyng1SUOpHu8abw7KQkM14KXEXfokEXq1r5qfKZ/hCuGtRj0SH2q8IIIWVshe8Y3w0jbWUEOM02Fk4ntMmRXKQYNt4uuyCOhOdAqNBa8l9GsF5iu1xsjqWaGSCeZepSPuB7b7BI3LVVaOAzUP9uxSS0yWwt2FfmQuIf4L5nYX2HM22Q==
X-YMail-OSG: mdKvJoIVM1k0iYoVbTsErPIgI6I9Q1mwZ2JAQ.RJeDPWPWRObuJzR0UDjBUyvlf
 n8Ec8F9lYR5cJH_akVBcdaQJuEaLO_M8Ip2UmUlMUT0QqfS.JQl9uz61pfT4W06032LIC0lIDDoo
 6o6Ej4ISHAz8.Dwv1qOvAI0jv0pzfbhqJA_CWsHyHF16sYtgND7FfaeGZ0dlNXEuwYeCMSjlvDyo
 Gnm6NACRv1Fi_wH1BozFdn_NMeT_bINHq.9QKqJPWydVso_Xt83ibyJCSqDWq2zQNKCdJpHVAhib
 hHudD6y2y21.9DOogCAxchP1gjXApeGB0sM9ZJYbTNfVzqi.LbC2DiOC7NK5VqXkjlHiii6q1etG
 cGdX1KsYy_C.tYnR36DoudnzqqDt4wt0sX4rp9DLfkMC88uECqc6VMyshBVlcSm_GWFmVJdagkDZ
 idzZPW97encmQGojcHQEFLWquZ1IIsii3Z.Qvfw5IslhAkCeE9HPxdHbMWOz42.GudYiv6DG7fyE
 c.OkykR9PyQ.1Whf9.cPBAzWcKeGQp471GMyQuud.iOBDz0ewpOC53QO_DYJedmMuepzRC2PSt3C
 Zh0n1qPq9VvmNDwe5i6hSssD1wnKh4yi8K4VHSZwLMPdsGK7mHEQfKczoSlysujPQpUUHJBlpp.h
 jdg3dAaiHOHJuyYjTErfx2hOTg13gfnjOK3Qjg9PCy4iYrnuquTKfc7MvYz7L9SdUTk1sE8k4v0X
 hsSzGffCTY00_xzu7rpuogOcbkj_Ynka.4LpPp2L_NmDeK96H41duvv6HF0l.hiJorMbp7BWhIEd
 9GcJUGqZe6ztfkpy7cWir7bPS_kbEDSku3qAJG_JIwS7NoOD34ozzZzchARmACEVKS32JynM_FwA
 sC4_4T3.95iotN2oOgTsjs_F.1JHr8Xo1ZFwGJlRbaCjO6WG.XiX8_8VGe.Mv6pzBF_bAbp_1PJ2
 8VLOk6XJeUbeHTEHw3DuDjzgzlBQlzT0ho89r7kn8rItA0HfB1TWAD3KsspE0ZOkp0jkCwLqhJLx
 mfqtgWBBZq.V2KtLwSKGIlYxIlcIN89BCHYAGwMjmAZOhjMGSrEksCOj5aCzoD4RM00ibzGRLwfH
 7P5hfjcxOq9SfwoIg84_CLVZTHf72B4gZQeLXUhRM6j3w2jd_Vy57vk63Vmz.dCDmsXB9bHbSs.1
 5Uv2d_AOMVJ7eCKpCiIZQpFLwzb_W.Auz7QHOHsUtmbfSBFF1Go1nPpInt8P9UkPysj4.LOM635j
 o97nHQdw9RRmDEBu1KF_qD9KYEI.ERWwZmDRzciHKwaUJ2777guNNft42YCjhSSiJLqZ0wMlSeX9
 DI.dAiM5klwLEql31uyUSRIwtPnNKD2ENEqorjNyDtcubo6dM9866Z8OAfCZPWv_U4N7ublGaSio
 4ONNtaUMIsCDVjpbCcx_aAUqQX1VT_HASy919tHfQYiC3.sTvdU5_IaZuI.kZdHLBBIs6i0I0Ft8
 L0oWuMSIgUbPlBPZI.I6yJb6ZR2UEgQxqV.O27e.8_OvdaU.nj6yKRHHxhZLfyBBBctj.Al8DTLq
 ZkJTyTp8ai81ax9R7h0ErqNBiL0QlUixsZ7U1OYk41X7iw0B8Wm_K.kVi1vhGF5g1oqqD41oQ3HY
 fR.yqcBGdKo_h83g2HkxOGQNJJAmu5wnypzZrSSyoTnarJNQxIi8BcFxcRU7Ct2gxlEqqFeGdQNJ
 RsBJ_pbqd3NBOU4.xeBIFx1toWRBsPrDA_EIp6vpnfEuh02g2sSLSoKPAXtgLDU2tflVK0e1QCx_
 0joXiBeUuNIrCETXBUQWxEfp9EaQ2ThikwwXfGj70ZwTkjWfrQZkJIrS2FVSSSt07pDBvfL2J2Ij
 XxrzXsF1lpeohn_vVI2QpCEZVAHfjSll.oM6uTR6pv35mCz95wn6wYVwuL5pjnpkDvYzdNe.UoDE
 fcW9gJApolOdrg.TmC.YA4gAmGR.7HYn9aLPhUpnp.R72MQxZ7kIJtMrnwPByfFUpbgXE81EdA1M
 pCmE1klYAM.BDvuhTY7WBfN0fhgtPfj3M5kwUuKTRQ49EcGmCJrinh9llk8bYaWJExxvsw1PIhe.
 C.oNv_AfYsVgYBKkMPHg9t3kpSmbZJXcvZgWs4C5euV5WSvndA1tWNhlZyQl51dZGe7tMkJRgKDn
 vpqUz07Rpez20vanS5KFaWp7DQQxN101mFV3.R8QV2HQBv7SQ0S_X5Uwe2WPmpDHf_YDTOrNyVCL
 _8vh8xFNO4Jno80S4.CqraR6sSPLkeSiqrT3qO5SKQq8EmZJXdy9ZiHaRNXV8QiOYX.h._tsSY0_
 0i48u2CysAGg_dX5AwS8R
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: 2f99fcab-6904-4c4e-af48-fe21199c7d5f
Received: from sonic.gate.mail.ne1.yahoo.com by sonic314.consmr.mail.ir2.yahoo.com with HTTP; Wed, 4 Mar 2026 08:52:15 +0000
Received: by hermes--production-ir2-bbcfb4457-796l5 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 2749bff91b48dc1ce2c58bd2f81002d3;
          Wed, 04 Mar 2026 08:42:01 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Wed, 04 Mar 2026 09:41:41 +0100
Subject: [PATCH] staging: rtl8723bs: Fix spelling mistake in comment
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-rtl8723bs-fix-spelling-v1-1-e2bcc89d5311@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MWwqAIBAArxL73YJpL7pK9FG21oKYuBFBdPekz
 2GYeUAoMQkMxQOJLhY+QoaqLMDuc9gIec0MWulWGVVjOn3fabMIOr5RInnPYUNXt6paDLnGGsh
 xTJT9Px6n9/0Azz23IWgAAAA=
X-Change-ID: 20260304-rtl8723bs-fix-spelling-f4601b3ef5c3
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.14.3
References: <20260304-rtl8723bs-fix-spelling-v1-1-e2bcc89d5311.ref@yahoo.pl>

Fix typo 'termindate' -> 'terminate' in a comment.
Found with codespell. No other occurrences in this file.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 29939bf5a156..c2cf5f11bc3c 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -492,7 +492,7 @@ void rtw_stop_drv_threads(struct adapter *padapter)
 {
 	rtw_stop_cmd_thread(padapter);
 
-	/*  Below is to termindate tx_thread... */
+	/*  Below is to terminate tx_thread... */
 	complete(&padapter->xmitpriv.xmit_comp);
 	wait_for_completion(&padapter->xmitpriv.terminate_xmitthread_comp);
 

---
base-commit: 0031c06807cfa8aa51a759ff8aa09e1aa48149af
change-id: 20260304-rtl8723bs-fix-spelling-f4601b3ef5c3

Best regards,
-- 
Tomasz Unger <tomasz.unger@yahoo.pl>

