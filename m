Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521BC18FDBD
	for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 12:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773922095; cv=none; b=sik8Sp2lPhpOF2sQdzyJO5WS5fkcZ9r39pol5QfyebyIae0xYZe93NymwmarPvrQSaRB4c/HUtXErU0Ep+oxEXIf5wu9xyN+nlQPwUtXN8zZzf268oHju2XKgQ3yjEt6P2FMf0t+SZcRxw33mqmF/JDe8nre/7yMtZlm4nSiFEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773922095; c=relaxed/simple;
	bh=Mm2JoOYHeAzZx9kr9Ry9JGjqg/aR1jHAbQSKdbYCEC8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mAUAqJcSY6Xvg+CzhqTCY0WDhFk0qzicKQDGFMgulKTMvusrrmOTJ+PS/eys87fOVy8zY9INf3fHaMAS7PE0I2iE4uRp1DcTtdyT/QFQiv/DbZTKhMza5cTc2C4btQPpN2reOCR3wnhf1ZITIKyEu35TC1EtmhABnjWT+HXWkgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LU9v3ie2; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LU9v3ie2"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82a62714fe6so430360b3a.0
        for <linux-staging@lists.linux.dev>; Thu, 19 Mar 2026 05:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773922094; x=1774526894; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vLEQwe+yFifzvWKq9zD+rUJ5wFDkLzjc0ts/3dMIVm0=;
        b=LU9v3ie21bhetVXnk6s47yPoPhej1x6eL0SFqLpCBtxZPgiBLJY1LqWWgNtAMXcEyr
         jNFtrrp1xH1TeZZCGyWge6QaDA+p8jrJS/cyvYTeQl3Z2NElTpzkhBl9yFkbfqYM5J+t
         CWHo1oueA7jL3kWfoE2SKQ6j85dgizaaF4p8q7Zf/NEzxWTlVBrWtvM6GOaoNiTyjip+
         1fvxA2iR0IY4UqtcRWWqfL/DRtJT0anHrxFWdUPLpJXAiCvDWc6zO1o5otsViWoO2i3L
         +mGH0DR8z0hR/D8VCy8k7c2EEpdOAgEBak6gYGe6bHPdYgbFAhaJmNmM5uM83K82nRSx
         ZYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773922094; x=1774526894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vLEQwe+yFifzvWKq9zD+rUJ5wFDkLzjc0ts/3dMIVm0=;
        b=gw5u0hNTQ8r8vERYNyEEI9XOnkkMunaiXTh7i+G4PJPFZyW2X5N4DZ3kYJQGIjnpN5
         Z5EDtbNiBIbTt+VDH491gLSuFEwH+jViuS+Ush8e0DSPIK0Jlu/sgpFlC1dyAdl97dj0
         ZvRm6HCX1VXUHNDteAQC9bgj95xIZA8RtX32sT6pb9+Nel+uLQ9Ah/AJNweRtmWilomo
         XtI4/q/5RIcyE0yAEVPxn6fhKsqhmHCfxKUDPpcY+9XSWVjongfWIBY7HaJdLv5UxpBX
         BI6X/kaNaL2CMDF46nmVBIsgaBxSeinAME4tlNgkIEau9kMnRHW+LtJGLU+2fXnWjXoW
         5sxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUv+lqPW3YJT0B96NihMqZ/iMM598U/vC28phmvX5LaMxEceDsJssCk1KSkKUIz7Il93F0+jyT2oxCuxGax@lists.linux.dev
X-Gm-Message-State: AOJu0YyYP8ortEk2QKQ9v3OFw/A1/TY/3QXaN4W9QDhCoK6Yk4JadD2q
	CQEsAfF3QNkyUKN0OKhRARrg8GcKMOxow8FZhgr/vlaUBW8WJl2gbOrv
X-Gm-Gg: ATEYQzzN0I/NAUpMtQMH5mnDXa6jsK+uVY6oMFoeV51FHxvLQLf8Ajytjd2Zyguyf+y
	LiBKWgJxpmGGPcLqsWEzRVjzsbpLK9WnxmZTjRF0ZJdn8eyd0jr0XEubpKe2eNBPCY7B9qHgqw0
	n2BWviPfKHmgtsAWyCaySXDpmOFxftgwli7JvbIREis1OvDzYcal6+Z1ovKouMiuyIf1c5XHUA8
	AQYwah9qia1BBULHm2basFJLjy0sMAXtE94WUcASvoX3QpihglsNCtDvWKPMSUWsB7MGI91x4/T
	S3U2ZoEP47anNYuDN4wu5NW+QFY91ruxHghtcpm3lbODEbuEJiV9ZCzXVN57Qp6bCegmYU1kELv
	DvO0g2ewt+PgK0y7uMDDFAojbP1bHBiOBsWClArF+qxExNnnSLioo/RUCcY/eOk2w3Cy2f8aC/S
	xl6jPn7C4Jw9uitTwyVLQn/YUiqKkUwinR/2UX28paY2QGYtOGFjow8zDkVprNf9agEGKketh0u
	+YB4ZvSrbAUQBC/Aa+TrS5tZhzRiV9zw1F4Mg==
X-Received: by 2002:a05:6a00:4197:b0:824:b03f:2f65 with SMTP id d2e1a72fcca58-82a7a7e5f12mr2473045b3a.7.1773922093625;
        Thu, 19 Mar 2026 05:08:13 -0700 (PDT)
Received: from starpt-K55VD.. (2001-b011-7803-1df1-b14e-6890-de2e-81d0.dynamic-ip6.hinet.net. [2001:b011:7803:1df1:b14e:6890:de2e:81d0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bee990dsm7108477b3a.52.2026.03.19.05.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 05:08:13 -0700 (PDT)
From: Lin YuChen <starpt.official@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Cc: straube.linux@gmail.com,
	starpt.official@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] staging: rtl8723bs: use guard clause for stainfo check
Date: Thu, 19 Mar 2026 20:07:37 +0800
Message-Id: <20260319120737.29692-3-starpt.official@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260319120737.29692-1-starpt.official@gmail.com>
References: <abus4pKF0ykt6nhj@stanley.mountain>
 <20260319120737.29692-1-starpt.official@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Continue the refactor of rtw_aes_decrypt() by introducing a guard
clause for the stainfo check. This allows the subsequent multicast
and unicast decryption logic to be moved one indentation level to
the left, further improving code readability.

Signed-off-by: Lin YuChen <starpt.official@gmail.com>
---
v3: Use "return _FAIL" instead of "res = _FAIL; goto exit" for the stainfo
    guard clause.
v3: Revert unrelated formatting and line-breaking changes (e.g., in
    netdev_dbg calls) to keep the diff focused only on indentation
    changes, as suggested by Dan Carpenter.
v2: Split the refactoring into a separate patch to make it easier to
    verify logic changes.

 drivers/staging/rtl8723bs/core/rtw_security.c | 96 +++++++++----------
 1 file changed, 47 insertions(+), 49 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index 3c89e911ac2d..cf910c268bb3 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -1216,66 +1216,64 @@ u32 rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
 	if (prxattrib->encrypt != _AES_)
 		return _SUCCESS;
 	stainfo = rtw_get_stainfo(&padapter->stapriv, &prxattrib->ta[0]);
-	if (stainfo) {
-		if (is_multicast_ether_addr(prxattrib->ra)) {
-			static unsigned long start;
-			static u32 no_gkey_bc_cnt;
-			static u32 no_gkey_mc_cnt;
-
-			if (!psecuritypriv->binstallGrpkey) {
-				res = _FAIL;
+	if (stainfo)
+		return _FAIL;
+	if (is_multicast_ether_addr(prxattrib->ra)) {
+		static unsigned long start;
+		static u32 no_gkey_bc_cnt;
+		static u32 no_gkey_mc_cnt;
 
-				if (start == 0)
-					start = jiffies;
+		if (!psecuritypriv->binstallGrpkey) {
+			res = _FAIL;
 
-				if (is_broadcast_mac_addr(prxattrib->ra))
-					no_gkey_bc_cnt++;
-				else
-					no_gkey_mc_cnt++;
-
-				if (jiffies_to_msecs(jiffies - start) > 1000) {
-					if (no_gkey_bc_cnt || no_gkey_mc_cnt) {
-						netdev_dbg(padapter->pnetdev,
-							   FUNC_ADPT_FMT " no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
-							   FUNC_ADPT_ARG(padapter),
-							   no_gkey_bc_cnt,
-							   no_gkey_mc_cnt);
-					}
-					start = jiffies;
-					no_gkey_bc_cnt = 0;
-					no_gkey_mc_cnt = 0;
-				}
+			if (start == 0)
+				start = jiffies;
 
-				goto exit;
-			}
+			if (is_broadcast_mac_addr(prxattrib->ra))
+				no_gkey_bc_cnt++;
+			else
+				no_gkey_mc_cnt++;
 
-			if (no_gkey_bc_cnt || no_gkey_mc_cnt) {
-				netdev_dbg(padapter->pnetdev,
-					   FUNC_ADPT_FMT " gkey installed. no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
-					   FUNC_ADPT_ARG(padapter),
-					   no_gkey_bc_cnt,
-					   no_gkey_mc_cnt);
+			if (jiffies_to_msecs(jiffies - start) > 1000) {
+				if (no_gkey_bc_cnt || no_gkey_mc_cnt) {
+					netdev_dbg(padapter->pnetdev,
+						   FUNC_ADPT_FMT " no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
+						   FUNC_ADPT_ARG(padapter),
+						   no_gkey_bc_cnt,
+						   no_gkey_mc_cnt);
+				}
+				start = jiffies;
+				no_gkey_bc_cnt = 0;
+				no_gkey_mc_cnt = 0;
 			}
-			start = 0;
-			no_gkey_bc_cnt = 0;
-			no_gkey_mc_cnt = 0;
 
-			prwskey = psecuritypriv->dot118021XGrpKey[prxattrib->key_index].skey;
-			if (psecuritypriv->dot118021XGrpKeyid != prxattrib->key_index) {
-				res = _FAIL;
-				goto exit;
-			}
-		} else {
-			prwskey = &stainfo->dot118021x_UncstKey.skey[0];
+			goto exit;
 		}
 
-		length = ((union recv_frame *)precvframe)->u.hdr.len - prxattrib->hdrlen - prxattrib->iv_len;
-
-		res = aes_decipher(prwskey, prxattrib->hdrlen, pframe, length);
+		if (no_gkey_bc_cnt || no_gkey_mc_cnt) {
+			netdev_dbg(padapter->pnetdev,
+				   FUNC_ADPT_FMT " gkey installed. no_gkey_bc_cnt:%u, no_gkey_mc_cnt:%u\n",
+				   FUNC_ADPT_ARG(padapter),
+				   no_gkey_bc_cnt,
+				   no_gkey_mc_cnt);
+		}
+		start = 0;
+		no_gkey_bc_cnt = 0;
+		no_gkey_mc_cnt = 0;
 
+		prwskey = psecuritypriv->dot118021XGrpKey[prxattrib->key_index].skey;
+		if (psecuritypriv->dot118021XGrpKeyid != prxattrib->key_index) {
+			res = _FAIL;
+			goto exit;
+		}
 	} else {
-		res = _FAIL;
+		prwskey = &stainfo->dot118021x_UncstKey.skey[0];
 	}
+
+	length = ((union recv_frame *)precvframe)->u.hdr.len - prxattrib->hdrlen - prxattrib->iv_len;
+
+	res = aes_decipher(prwskey, prxattrib->hdrlen, pframe, length);
+
 exit:
 	return res;
 }
-- 
2.34.1

