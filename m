Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E85261B70
	for <linux-staging@lists.linux.dev>; Thu,  4 Sep 2025 02:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756952126; cv=none; b=DVTrLdYrNsc4OKiBNzB5EE2CYWPZG2R1FTuYWoZxlgRKFxGCfHSfmkMPUQmIh6JkFDkXfUc6g//pGW12tjjgbYZ+uLuVmj8M5lL7/66aB+GrIMFSX+VO7VT/PWem4HdspH98hWGCg3mRnNVyD4rRNGY+SLaB4zgGP18hs4esqkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756952126; c=relaxed/simple;
	bh=jBqMxmVAmMDEYYiw51Q/Ns7mTaKe1/YemzM5cwPGyQM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ABuyf7uKQycLU66aloQjxFCQ6a23gi0gs1drbTLuhsznjECyXYbSmUc1venSdqYXp0Wn6gijkB9b8eq4xRRHWYaft7Xhh7IE0bZL8tZ7bVpxbUHS7M64wsBPf9Bx4Y7dgQYIHAv/d73vW7vtxd/cwvnaGkdihPkpG+qMSoojyp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HNjwpPH5; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HNjwpPH5"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-70dfcc589a6so5721506d6.2
        for <linux-staging@lists.linux.dev>; Wed, 03 Sep 2025 19:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756952121; x=1757556921; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z93vsxuF9UuLH4nsNHNXy3fXQ+B/Eo/YGql6jpQcpLE=;
        b=HNjwpPH53YF0eUILTDcpdaJavOId+rXbi0G1XyPmGTdyYMuH2gDz6V64WfSCnxST6H
         x30GF+ej7r/rgs86p3rpFeVn//4GP1WAuN1J7TgeCJD96Ud1DV1/IMgWAiN4MykolPGu
         fhKD+W3UZqmAwEUmtF2j6wAT7sIpzt4HW3shg5SpQ5zEzZVtLDloxx5hZqxJsPeo7yii
         FQ3/Hnu/rEqn/+XeQ7uL0G9RBlZvX82Xl5cHjP/pofSCkb7FfwY5F0M+eqsM+rvUqRfN
         Hdex8or9oKoqh9QYDBsdB9jU6JCvVygw9SWYf510nE8BYzkETO5fLaUSvog4/iqpVQol
         mxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756952121; x=1757556921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z93vsxuF9UuLH4nsNHNXy3fXQ+B/Eo/YGql6jpQcpLE=;
        b=rPHRSj8SB3/cWzuGtQiPlgvTqXkjJ1iS0iPFtpdgfoLFFDHkt+31HIYpIs94DbSria
         JNZRx01Odjh8gitMD5wjAt0d2o9bxn5Y4Q5AVmK7bTTVSA6ZBsKarS0NC/JA6ibWboar
         pKfEuTEU0y67Lq5h4qhKibq79yGkY2kvVGIAXirZfpXuYvyFhL9JTMogwxbtjChmqvp1
         lR2k0bmCxoUU48mujHHH/PzpEhAtCKqcStR6J51ubH2filWq4x7UkTY9b1F2IYN2mkdP
         yAaMVtjSEoBoy9B4jaK2kpqblSmZKuzodm04E+lXa2P1eRh5J1igOS0mwC39/VGCPsZD
         fZhQ==
X-Gm-Message-State: AOJu0YxSuhsMeRm3sq+g3DI0ftFK9vMZq07xw51GcjTWc6GICmzk+K2B
	Xu/pOKLUpzM6K8kIWZMbA7RPxnnw7HNNAu6PwCfCLY+MF7jMnAzavrGe
X-Gm-Gg: ASbGnctBR7SL2WCxL7EDCvjtu3tjR0h5bnPAlMxFXQVvrJtZVv3/x1NM7eUO/HdfS4C
	oRcMPJbMrlXAFb/F21JUKcGvahXGDCOgkLJDhC8GsC2qAyuiyrQALJIBIyYgIg6xayIBIvsDWcG
	LU4KHfK/T0Qve0H+JbxClvkDmLRXGd/pMzQUwY5MsO+wEi8WLUGncsGipbIKmoMQwiuW1r/Esj8
	/rGp4OoJubRItzToEzPsdC0Q/0Vssd2asHLryu9fXrrhTirfvmq1h+owk73DDg55CMQteonEOm8
	35JBmR/hMWHgEbof1WIeRcgNEKpsmSo1+r+MJVANSHpWdWYwIYJj1zp2u66Jwio1vGDOPSOFmhp
	HGnHhqjI1ObENSHGFSHzH83qmBgKUg/vlJnnAQ2tSKqvxgkrs//s=
X-Google-Smtp-Source: AGHT+IE9l+VNwTg253DcVZl9r1B1XEzkHxQ684beQjKzjt/9e85EwGCeLnyjO0W3FlXMfGJGDUhNkA==
X-Received: by 2002:a05:6214:765:b0:70f:4416:ce2c with SMTP id 6a1803df08f44-70fac8940a3mr206043676d6.40.1756952121055;
        Wed, 03 Sep 2025 19:15:21 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-720ad2cb78csm37714076d6.19.2025.09.03.19.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 19:15:20 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>
Subject: [PATCH v2 15/16] staging: rtl8723bs: place constant on right side of comparison
Date: Thu,  4 Sep 2025 02:14:47 +0000
Message-Id: <20250904021448.216461-16-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250904021448.216461-1-vivek.balachandhar@gmail.com>
References: <20250904021448.216461-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorder comparison to place the constant on the right side, in
conformance with kernel coding style.

No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 2c34b68f1d60..80b4dd1e8353 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -775,9 +775,10 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 			} else {
 				if (rtw_to_roam(adapter) != 0) {
 					if (rtw_dec_to_roam(adapter) == 0 ||
-					    _SUCCESS != rtw_sitesurvey_cmd(adapter,
-								&pmlmepriv->assoc_ssid, 1, NULL, 0)
-					) {
+					    rtw_sitesurvey_cmd(adapter,
+							       &pmlmepriv->assoc_ssid,
+							       1,
+							       NULL, 0) != _SUCCESS) {
 						rtw_set_to_roam(adapter, 0);
 						rtw_free_assoc_resources(adapter, 1);
 						rtw_indicate_disconnect(adapter);
-- 
2.39.5

