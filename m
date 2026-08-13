Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32033472F91
	for <linux-staging@lists.linux.dev>; Thu, 13 Aug 2026 15:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.2.82.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786636282; cv=none; b=AhBKBV4/MmK9ixO9sgcJVXWAnXppq94OPd8r7PGKNIRsqdVnvNBAAqKeyFzPdNaikhMxnKgx6fof0cd9dV+pfjJUixYXcRMOYrgouN9PnWYDCNZFgjew/UjD/9S5gUb1kSTlw7X8AjC8xNNkMJZXyfzxuBFJpiP1nms60NjZn4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786636282; c=relaxed/simple;
	bh=sjLCPeCX0G0Pw997ybnNBygtplxFdIL+m2XqJRRrc1Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc:
	 References; b=P/5LGu4bRvkIcYL1A3GW6+Kd6C1zmia2o9tVHNSyF9FEf9xEINDuVUdovuMBIBHcjJtE96tPxVBUBwO2eVCCk/1ZdatoXAEbTBQffnFztH4N4BGcdUO/haZX/9iZYOSdUlJMCuBEQ2n3XwX9yoTMF7n3lCegFP5n+2rxG2nmmCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl; spf=pass smtp.mailfrom=yahoo.pl; dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b=RjCxHemk; arc=none smtp.client-ip=34.2.82.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.pl header.i=@yahoo.pl header.b="RjCxHemk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1786636268; bh=PNfqCanq81E4PSbKkmDeb24Yw/HDYHi4vSZmKBdyqbw=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=RjCxHemk1EB3+fccsnBFvoouyS836+ZkI7YM4WiVbrSSBEYsHZdcwvFgV1yIUNKqOZc97TubWzz69o0kiN3qdaG8FXe364LY08JoFumxFvE4ugjr9FnA7VO1dxFjTIam3qc81S11YJ97PgFz7lo1JzMVEu6b5O9EDfvmaKLbLEqKfGvWq4QyoR8hivnj62PK0Bf/Y4liAZvEzbPAGvv9LWSiCv2xwFDPoLjKZu7liGnF/eUpwYJM37R0pfnWeplbIbmtOGpAPlqFqfGESrvUmmq6FxqO/4bsWGsDuW8NbO7DLgeRNX1F9ar9+KcFGHjNsXrlA6RpWBdMRXGQYafS0w==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1786636268; bh=HSDIlz1K1buD60YNk7TSa2bFhVbUNO7hHEdKroxpaIR=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=mNUY8NWtN/oih07qq6UVe6aDkTKCJyYrCkesCaRC2kANJkHwDlidbUADC50O/YKFl5JwvB25pbaP0DzeXfht1HOa1wxm9sFc5TlM/k7EWFNXaf1ZzgztWnlE6gVMqB8dWLWpyFtmhIBYhSFrJAHVWfPoIPYNSgJ21lf3xP8+QaZtZxIsM6LKFlrBsusEcfAt52sFYYAvJpJZrHIslHHexi8ykOPH9OB7xSA++y3h3MO4euwtuaprlCzfdrp7O/tHRU7iGXNfycmKw9ecfPQgDPtWvCHR6cH+c30gTadPqRlUoEekpR5T2EXh4zXbpxZGRlSzxIkEIgnAf9ReTxzGaw==
X-YMail-OSG: ihyQ8qcVM1kTl6X0S_RyHr56615AFs6O9E80XKoLXDifXch7zqSlZlWwZHzlHiB
 mkViqZ2Twj56SlwCwqlSB_Y_I.eOwwkvOFm_UOOVFuyeX_lIO_uttNNO62E3bbOgpGuYzJ2YuT16
 VTFQIf3d0L06sRo664XwxWjVzz1s4xXg2fy0u2nD5c1J86wxQNcEC_QOjS6B6sszB_x7.Vy7Ywd5
 KWGV7A1mGYovkfY4XFVld6Hc7qNQPZDlIoTCw8aiPlcGUOHEJ.RRdrdNeK0I4b1IC7tl0iX10Mok
 EVCO.U5cGtBdM34hhhMez6xRYJAJML9dJ3JHMcwWVs0Xia2nX26ltgKBcCv.QPN2r00hDwhFcC.Y
 3klTj62T9ncZN77t6WUcffRpaIfmyHjMcFpx3AjYMIE3YKi7_oE5JYGha48md3miIABNzudXH7HG
 xubzIPC9Ba24550jZcU2l.7jGJXcZESMcfbEtoohhDiQk.mXCmg4V7N1JaO9jk6Cbv8O8duBSHQo
 i4uuYHssA6hcWnl6mhEOaWtXjUvlodjUcHEnft9PkvZ.QhXP3RGleYE1g1L7Ex8053ZTkYGMDQDR
 16qZHEYR80mDtp5NhfqsX4_n9Pp7K8KA_M3_V3ON4vSXJFQvYkTbg8ZT.fKCPMYRggMsMrc7zVET
 g_XkwV2d5Vi5gjDf98hB7KnjmOaTjqT2dHiuCAm1F.3v8oNXm_UhCl3EjvOc_lNtu4vxfv6NPu_U
 vLYMUkq_rj8UZQ.sIJFP9NeRdySh8VTj7EQ9bg6gKgu9LqKjiozc6P68bM0g2BSCv9uR.7pktigb
 QaltT.2f6VTklEvoIVTHCWvQMG7OHLERXGi.834nYry761ehqZi_3PxxAx5eLvvSrw6e2uZzknDo
 gnOclvB9Aa6onetA3aoLttPuqoLFE0qYmmk7fP9cJwxiVPEJRMBLl6_xg79dZUF6pFmukA5iQZVk
 vaY317cu30ljt3bUcAyiIeYBlnjuCYIcV1qaYlqwS6kP7QDdArhZHm7fHtUHRMHXienAPnDsQoXQ
 WTZHZmSCigqMsMiryqKXmfhi4jmvdC4ntb_ScGBFLEueZCI2W_QuvCRbowWX4Yxcl_yOwM4pxBf3
 1SVJDVuwws3CuCZfKVFnr8vJvo3w4K3JlkKI1PK_zTiKLtD17Nduz1ZSJA9KMRhTbY_lCgiY_I0W
 Ago7BI8Wu7m5V2mmFqi_hUX997PqbVVp_.CxYOTMMMrRCg00ZmvBrP1.QSdw.zdc3rDwmDjE2mBn
 M9_VRWAy4uhJ8SPti9oMBAZrfjz3x8Dv0vx5eEY6urHoF9k2KvHaEiSJAMokisOWMkkdXH3N6dkt
 eXKVBX4E6Phq9JJcq0y.v6Vc5_EuMH.N8ptI2KAH9QF256yS1j6oh84SeAjKiA9VSj6FAogs2xJ0
 w5q8SDEfnQlWQo4UCnd4IPx3oTak2hPKXBN4pm00Tu4EtkvJaOahNi0CJKkoj4KtYcPVBicpw4Rg
 aIUKCWnaQ7feCN643ZwtmygzuEjZt.L6BxdzcQWWMAkcX3zRQy22pLi3BDzKeZwgERoBy9WEF_sz
 1RwSANRLqXFGi7R5asVZJgAaXZapVoLUTjgcLMlnf.wYfYgKdkTvkeVWc1KjY054Yvvd0wyxZPsx
 4BBGcPziy5PKw8mK.y59_tDC3OQL8bStZqK3R7oGQ_he1ouMnMG_Dpw1Xw08lpdSk10JCQi7nN3r
 L0bI.8gSSlZ.8AU2EGIS.2nR0vbsJtVccQ_7J9E5kNjrPEKAf1RzICfmWB9B.JVailkStzXdkwsR
 3n3FO1SgIHquOQB8vzCih0rG9iwENZDFXuOlN5.lihlyWrhMAYaoHcRaYweb4MfzBZ1Sn5t0XACf
 yYWIs9Vv8fTxklNHCgqraVGHbg3LY1O.zpqG6JJ7vzA0xbTbw0pKjz3Fppt83PS48Pd04hA2dewq
 9WE5y84893YQwsjIKhIjyRaYBz9eh_rz6CyqR00trxxXo5Q4zLo6.ga_3MBDYRTVtjWmldgrizZF
 _CwOCOiXyJf7xWa3DBEd_iuRYnzVH5oaDM6O4L3T7mYDYjpPH7ageFtQKoouM
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: ee95d656-a03b-414d-9e33-4da78c888bb9
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-101 with HTTP; Thu, 13 Aug 2026 15:51:08 +0000
Received: from dip11.lsn.ir2.yahoo.com ([87.248.99.20])
          by hello (SMTP) with SMTP ID ca8578ebc380555c706eb9bee2a1c8e1;
          Thu, 13 Aug 2026 15:51:04 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Thu, 13 Aug 2026 17:51:01 +0200
Subject: [PATCH] staging: rtl8723bs: fix space before tab in
 rtl8723b_hal_init.c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-rtl8723bs-space-before-tab-halinit-v1-1-4dde782d57b3@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQ6CMBBG4auQWTsJFKXoVYiLtv6VMQRIpxoTw
 t2tuvw2722kSAKlS7VRwktUlrmgOVQURjffwXIrJlObru6bllOeemtar6yrC2CPuCRwdp5HN8k
 smQ3Ox1MHG4M1VEJrQpT3bzJc/9anfyDkb5n2/QMtCJJIhgAAAA==
X-Change-ID: 20260813-rtl8723bs-space-before-tab-halinit-2e9456e7fc72
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786636264; l=1359;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=sjLCPeCX0G0Pw997ybnNBygtplxFdIL+m2XqJRRrc1Q=;
 b=tWkOBWP+ZkEjuxRMZ1pLqYmjq1aU79F/wwbFef6zlshls5L7/lnJlmFAHXjSY+8ObRE5plkEg
 cCxkz0FYEkHD1rKZofyv6+4KFhU+i+KWPNmrrz9nTdFK5BdfRZ28jsK
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20260813-rtl8723bs-space-before-tab-halinit-v1-1-4dde782d57b3.ref@yahoo.pl>

Replace space-then-tab with a single tab between variable type
and name for rfPath in Hal_EfuseParseTxPowerInfo_8723B(),
matching the alignment style used by the surrounding local
variables.

Verified with checkpatch.pl that the 'please, no space before
tabs' warning was present before this change and is no longer
reported for this line after it.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index bcaf63b2893c..a2694495194b 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1310,7 +1310,7 @@ void Hal_EfuseParseTxPowerInfo_8723B(
 {
 	struct hal_com_data	*pHalData = GET_HAL_DATA(padapter);
 	struct TxPowerInfo24G	pwrInfo24G;
-	u8 	rfPath, ch, TxCount = 1;
+	u8	rfPath, ch, TxCount = 1;
 
 	Hal_ReadPowerValueFromPROM_8723B(padapter, &pwrInfo24G, PROMContent, AutoLoadFail);
 	for (rfPath = 0 ; rfPath < MAX_RF_PATH ; rfPath++) {

---
base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
change-id: 20260813-rtl8723bs-space-before-tab-halinit-2e9456e7fc72

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

