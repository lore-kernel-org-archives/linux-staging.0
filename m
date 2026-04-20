Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080F62D876B
	for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 14:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776694185; cv=none; b=UboS5iiISz/Ehzy6kgBk3e0+KeI1vQlYq1IolYGWLSrV97mtbeaFSvxC5+hDrQl2UAYPCOciBDlS9BLV+eBm5sjnB1mNPukpMDg5KGrm7i14Zdv9Gy3xlGT9t/L7nL1P3IYZ3YGW4e2/7Tnfq0RzYdNgm7gd1POfxvgLANgirpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776694185; c=relaxed/simple;
	bh=x/aNAmwUYBnigl4ojqcwpNW/UE42YjbUCHfVQ0xHA4E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cr83klBC/Dhukp6xvadO0DTW9VaX0qDkOysGOL9dHV8r/wHq0YlBOrlCitPAaU1CPCD23GMCWH3S6l2MJBMYmSqBsEPJa7QvQ9DVOOKiUQom9KPOL43gslGUV7+kT4ogcQZ/6072aeGCr/ntMbxCBTYE/zrfgo43zckuE7YJz2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kcwjXDu4; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kcwjXDu4"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b8d7f22d405so545456566b.0
        for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 07:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776694182; x=1777298982; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jlnvteOKBJSDUMvxczhYyGCSUQ6dxtzv1BsshS4BqVc=;
        b=kcwjXDu4OnPZ4G6/dnahb0h14whBElmmVbUu8fHMj4tSdqc2sJjVhQZi/lp6m4H3Ke
         zpePwQtF9kNv3deXN6v3383hVqkJ8KdzGjiLtwWolRP2mXGUAqCUlj+cI5CipaJoKPKK
         XrbMC919aV9/hvX7sWt8rEq0hsQ9EdHuP0LKAcZo6fbF8P5hNYVoHTyne/6ccwREbKov
         ojyfVvaLkmTcoYhsRkPMXds+CPEJuIQSo54b2kWNqsYc2dO7JqQxw66ZOODMdMIDKSOD
         v8uvidho3Aj1MhMUuS1/+79Mhdn9v+99hc0TNDELip3XQ0+Plj9KwtzqpbOW1YEIo+L0
         2zIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776694182; x=1777298982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jlnvteOKBJSDUMvxczhYyGCSUQ6dxtzv1BsshS4BqVc=;
        b=dkIGnoVqt5XNVb8IjoI/0mZHtJApbbI7GbZ9bmhfld6v0y/zdJ0K21+Yxf3DB8svuQ
         wRuxLKtMUjP5JRAPD4CO1JugKg0JmiaDtPhB7cEd2XAv+pbbqSq+8uF6vIODSTT21vIb
         UY1Sek8nj4bj2kN3BreM5dpPJNsoQCVxzvMuAdlVVn5TpwV/CxOXn4xuJHmIHhdnJYTG
         tHASOKCuJuZo8D+Q81anzAZLd50r8nCl4ZKGlgnc6bfNXHG4ae/DH/PvBW+l/4D/jwsT
         5q6yFX4351C7Fe2bzU+S7pcRzJQfDeWYYRrG3+Q6hAZEd5oNaF5NI2gz8gMqx9lOZTlg
         mJXQ==
X-Gm-Message-State: AOJu0Yw6ZjqC2rx8o8coFbTpvY2CiHCS/RJtoVnzwKJL0LeYQsaS6kQh
	zNxin2ohLZ3CB25J478dnkz9Cr1qGvqIY7jC5kJKBLvBeJPiawxhXHD4
X-Gm-Gg: AeBDiet0PnBe55MC8DjQe2NI93Q9ijLEIFaKblBNu4pHL8nb7Mt6+rF2M0wYoMjbJId
	7suXaUgPrXwx5STFCRPP4EG1YDFIWuWkAEDIdrt2nYmutwLQxCrgP8i1F6yi1vY51f6S81kfwJU
	EZJ29jG6v7uye5lAlx3NvMyit3WGbteP+mwcqQ1eCXA6qJkBejAlP2ftZ/c+o7pVM1nTcepERfL
	+fUhiDh0D+xqqsOjmwSJJDAGQPKoWqMMtB8g18+mwrpR6DuzOEDLrL5qHdn5uVPpd7fYvm9kEZg
	lf2L3xxt+AN9Y6k28k20EUgYBjaw0svhhXplyMFGV7YD6Ecpqf6T+ovGY4MIxtvLCraPe2Ga9lT
	VaQi4N5whM4ouMEDLSQUitnrBVRajHqcYgWp5kci922EGSV85fp5MqF+Q/BeaRwER3+5WIDxncZ
	jVBJsQaXVBjso4gQKyCZyOQttKujJL1KVGwYkr/6F1wPtY904Dq+Zc5B/NgW6zcwHsOQjpT/A2n
	lIxwjy99uI/6Wo5QkClZ+aMpl90kM9RwPz97wDwynCJh4waPwXYPuDrdRRHMJmRQllJuPsDmfBJ
	OXxVfsOIYhIKylm6
X-Received: by 2002:a17:906:c10f:b0:ba7:636d:e285 with SMTP id a640c23a62f3a-ba7636de4a3mr220293166b.7.1776694181922;
        Mon, 20 Apr 2026 07:09:41 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45121109csm358377866b.6.2026.04.20.07.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 07:09:41 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH 1/2] staging: rtl8723bs: fix OOB write in HT_caps_handler()
Date: Mon, 20 Apr 2026 16:08:06 +0200
Message-ID: <20260420140807.152739-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HT_caps_handler() iterates pIE->length bytes and writes into
HT_caps.u.HT_cap[], which is a fixed 26-byte array (sizeof struct
HT_caps_element).  Because pIE->length is a raw u8 from an over-the-air
802.11 AssocResponse frame and is never validated, a malicious AP can set
it up to 255, causing up to 229 bytes of out-of-bounds writes into
adjacent fields of struct mlme_ext_info.

The parallel function HT_info_handler() already carries the correct guard:

  if (pIE->length > sizeof(struct HT_info_element))
          return;

Apply the same pattern to HT_caps_handler().

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 6a7c09db4..b75e7f4f8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -934,6 +934,9 @@ void HT_caps_handler(struct adapter *padapter, struct ndis_80211_var_ie *pIE)
 	if (phtpriv->ht_option == false)
 		return;
 
+	if (pIE->length > sizeof(struct HT_caps_element))
+		return;
+
 	pmlmeinfo->HT_caps_enable = 1;
 
 	for (i = 0; i < (pIE->length); i++) {
-- 
2.53.0

