Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C36EC36828D
	for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 14:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776693969; cv=none; b=oq/1sJErH7HIG6FE+ZI+bjdsnCh5gdriC4BAIs7zPf7jcSuuFKd+luRelpDRDfD2s/K4JM4Q4QzC08Vu0zNyu26xV8D//vUsenvB/st+oxw3AzuU6e/aNN9BAJX5brRm56VhAi7+VwACgs8Tvzzt2YfkUAgP/G92H3rD76ugRoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776693969; c=relaxed/simple;
	bh=uxYQuB4zCIHMUo5lGPq/D+Ib/tJBDBnqjcU2qW38Yms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qFCnp7/pYc/2fcmRkwJ2dt3pNPeWakpbTmqGrApJ0bUXLoQZfp6QW44i5mJjwd9QpRflk2xkKOSBFrm2apaLaRRR/x6tJdOFRdHjlv/UfNoLDxFyK8FmSso2lSvKpeaNWSXZSHS13DJ/1gUFkyI15YVdkGCTZFnzPJJMG95xFhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZ7dezEH; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZ7dezEH"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b8f97c626aaso483973266b.2
        for <linux-staging@lists.linux.dev>; Mon, 20 Apr 2026 07:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776693966; x=1777298766; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=97974GtdtwWe6NOkpQCqCEwwPqvlp2vIawuZ+Sj53rM=;
        b=MZ7dezEHUH3Vi+mjtGsjgMIAnVj2ZUWVL6i8EKrbPf0rv8357iT81w2bA0fgmWm8Z1
         06BIc0yX3L85MYapXo1LuaA+v+UehhcqVPn+H6OMHInQ9+vLRBPBhW5ORiebdThXU/wG
         BQeL9L7IMCyPQflT1RwB+2TrQ6sSp4fxqlfbZKNBk/05cC+Z5wABJAqdPoPkl0tLgjJ2
         DbmOy1LRXWDq/f54jHPdO4HVcFLZojjBlacmpOW+p6T0FsNzF5B65XtX+WgQl5KNkT7k
         cCHuTPLyq+iomGlv0WAUfHYsQuMkq1vK/fHOSUI1Gj5h/TE/0oIYIEcSAX7N5v7tJ3Vr
         7PUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776693966; x=1777298766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97974GtdtwWe6NOkpQCqCEwwPqvlp2vIawuZ+Sj53rM=;
        b=iatZ9ZN0aXnHq0eKTxNAaP1jwZ1QD35eg+MKhHDFx+vkHwb+fu8lb2YntX9IUu9Lw8
         R7CgiEXIOXEZ0ZC9pJcmTeN9hhMldyptCOoNFIxrXQlLYHWpAvVN4Qr6scIepOw0pm3B
         q3ys1UD3ecix8vyurE9++8OObxfPrVmCnR+O99C1kKnOMfSyiafUGIk1re5BxSbJ7x2L
         ZHYJLGLeKzgUKQHx8JMXQxyfC6J0fMtJlVkxITnuhQcnxW2mArNZwXve8f8QCSMYlvBV
         MZVgiL+nbvxWHC9ctlX7kVOpYv53c6UzoDnnviy7/juwVhMG3v1nCDbQLBoLQbmClCS3
         T3wA==
X-Gm-Message-State: AOJu0YwwC1jcQeMpj2gbXagdiJ7Cy0nWsWuvela5Y1F3wZA0zxSwonKN
	W5n6EXlI6PBLeT40WS7yruWRAZ2lNGdRbFiBjTZmd+1qTFG98RQFM1Fu
X-Gm-Gg: AeBDievzOqpgQzECAXBMjZbi3SX3w3u8BlrFNFnjSg7bMTkSCNp+Vp6WWNqtW/yTwnR
	2XsSgmI1SWal9tLEj6jcb8DZqGr8gOzARZA95P6aDn4uB5QbxYLo4uChyOiH8WyXNKOmrwNkb+v
	vdl5T+V6Ilt8n/nwLZVngIPHxPSI+rMICLWQjxJHl0w571en0F/8lC6YGYywldRruJdFzhmGWVE
	fgAuWtbZE9gw9VzCVDLaDXGtx8SyJ8A98CNOTfUG9fzFTMYEt7TcgYUCotfPwdFmwR/QKfwcOcR
	53g6jzaSE+UAH5VMDajiPAvV1dgLHUkQAktrje7mgy7xoVuZOxSKZpJT5BqpchYfoVKBmZpTKdu
	ang3GV5mRGQ04u5VaBDpb6ypAETuEQk7ZF7XI0W2LNIoqY3cTMn5+o/Cv9FAC5nk8znb9Jvm2uy
	4Sl7BZBD3QqqZRXQKixG7GuQh+nWarfEl0GnVVHPocbbJ7Kf7IRhQzsR+wc/rry7o0B9oJEsqFn
	DvKlbKYK2ZOdR99i5W2UPg0QxGP0ZTncOa5+O6iiHue0AXx0U8JebmSj/r0a37AlgZ8Z50Xre3/
	e7oYWvCXfbefH2NTvd4dUqg8iys=
X-Received: by 2002:a17:907:2d0b:b0:b98:50b:e94a with SMTP id a640c23a62f3a-ba41c2ab6c0mr660897366b.16.1776693965861;
        Mon, 20 Apr 2026 07:06:05 -0700 (PDT)
Received: from ahossu.residents.sin.openfiber.nl ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45121109csm358128966b.6.2026.04.20.07.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 07:06:05 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	Alexandru Hossu <a.hossu@student.tudelft.nl>
Subject: [PATCH 1/2] staging: rtl8723bs: fix OOB write in HT_caps_handler()
Date: Mon, 20 Apr 2026 16:04:31 +0200
Message-ID: <20260420140432.150431-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexandru Hossu <a.hossu@student.tudelft.nl>

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

Signed-off-by: Alexandru Hossu <a.hossu@student.tudelft.nl>
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

