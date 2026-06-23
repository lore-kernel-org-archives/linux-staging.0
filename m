Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AD736EAB2
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 10:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209174; cv=none; b=Q0oeqQ+xNbiGVpGSs9YzSfR2c23XA2KFeRwnJC8ylHPkK93DzT+I7HiLJmBP4e1T+vaB70kdHgcdyP0GxXQjQzTLWEyAk2RPqxh4fm7yCb+JnC8fHPLNI53/KKTsK61sfJEbRi/Qbe6dJRYrLMbiaMB/AGWumwXniCX/3sQlDSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209174; c=relaxed/simple;
	bh=EuAufa+Bp78LgeL5Ttrz2UO6X9aGjsNBshKQdqk4p+U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HI/+bUz6x8fz501w/TGD1MurM7nT6ehlWFhdHvAz+oL+8vjDIjccmnJNHyhCiepUuPktRshj2l+hni8PSJ451GuLAC+hTkL76Sn9dyCr69w6DTzH/o8ccHpcuT4Xt2C40CtfIqaqrB4stwHSrDD/ob0eVJaO3s+eFWi2HawPaHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bLHySTzx; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bLHySTzx"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-4629051c9d1so3654842f8f.2
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 03:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782209172; x=1782813972; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hl5BMS5RX8hKcSSwiKmaIw1d9w8cUDwM8HhhvvEsBwI=;
        b=bLHySTzx0f6S2ixn76r1GRBdxsdV1tyYmz9hnv7RLQPAEyarKg3MIHuvooWFBHPb/E
         +zLaHYTDGuPh1nAfM96ugz9R/xXKX2jcR6GHKfGfXu6apzLaw7zy3tEbHdFVFeUBfIMP
         WYmY4wSNf+suDfupzYY3hIhT8bfgshhb4lFr1coGnxAEFXP40DefiaS05RmdZq68Cgh4
         t2mrWRmArHP+4d++R03Z+vmV8e7VjMILGHhQVVh9mmpHTZ5gXiLvxnDlp7HVWFiNJVKg
         sedSKxCeVlxUPkPmjtKz+7gGJTzoXMTu6nJfHeq8LhuaHSm0x36c0wif4FEwqfBG8wex
         rcTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782209172; x=1782813972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Hl5BMS5RX8hKcSSwiKmaIw1d9w8cUDwM8HhhvvEsBwI=;
        b=U+804CiBcjOVyAzRPmLjCRtvYT+SxBxPMRk5kI0FKGQ9ZSwtFM1xHOFasC2bGU7gB8
         pgT4HyDzxhSYleqIU8SbKjaGS4h/7O8jhrJbV2VOUYUqXlEfUFtD0W0oXPXCon4pG36K
         KnDTcRZhRU2OMXgMdSPiWNkheYi/eTi/wsWey0Bu/30g3YPeWSYi+nqt6ojE/G5Mjowu
         hVbx1JlH1MVvtJIzz4+lBsGvgU1SPPDv5j67L9mvifMWYZ6IVrLRuqt++aMZoiXhwFmg
         +8zU3K7/KcvfHRPOpy1kEC/SNe2azt8i8Oo6/TObkQLszSIDENbiZ1QiI1ve8j34znlU
         F2CQ==
X-Gm-Message-State: AOJu0Yxsw4kCSKTN8XNvG88N4GfWUwXbanJGXaUce2OBAkFFXhAsDu4Y
	eTkGIsmgMSPc5VjFEW3ArBMuUKKHFFs7Ju54GpFaTTYJZxtkEmWgkTPZRsRH40fq9KE+Rw==
X-Gm-Gg: AfdE7cn7hPsf2riP5EA6y9srtCKb48itiv5KCPz34fOglq52a39TSCMB4M1Bv/Zq7qz
	Kok9U6GIMruYlmUZdZuT+hPdpEiSgDhwjz6E9Yg5593SoeyTc2TcQDBf77EGKuiR0XqT/jkMS0I
	rRx6GuI0hlijs+Yncze7bLAyLMBZWn1uOyAvd42+p1L6MnNxVXBOpx8ZjvExOqcIi99HyhwTqfw
	clncKF+bwcVmDkhz4+4UHh9/t/oWbp3qmzBW5Yxc6PTa+Ue43flVbYZAhZYUMPyg86UcnbWT0DM
	cJoyzdY4X3siAClHgWZOkcaUw08PTd31aL2mQvqUMTWzG32J8P9pk9Feze8i6nciD43WCF95nCs
	0CsoNzYyhjLYtn/YZtCws76YRU0L1A0mgWEcHddvV/T7A/cI0ODMMG8pWHWigNMNMJWm0D1MNYQ
	qWa5tP9sHt8Q==
X-Received: by 2002:a05:6000:2992:20b0:469:58f2:f30e with SMTP id ffacd0b85a97d-46958f2f6b9mr8211399f8f.14.1782209171939;
        Tue, 23 Jun 2026 03:06:11 -0700 (PDT)
Received: from fedora ([212.253.214.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-466648c698dsm36936714f8f.16.2026.06.23.03.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 03:06:11 -0700 (PDT)
From: Serhat Kumral <serhatkumral1@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	lgs201920130244@gmail.com,
	error27@gmail.com,
	Serhat Kumral <serhatkumral1@gmail.com>
Subject: [PATCH v2 2/2] staging: rtl8723bs: put logical continuation on previous line
Date: Tue, 23 Jun 2026 13:05:35 +0300
Message-ID: <20260623100535.5752-2-serhatkumral1@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623100535.5752-1-serhatkumral1@gmail.com>
References: <20260623100535.5752-1-serhatkumral1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the logical operator '&&' to the previous line in os_intfs.c
to conform to the Linux kernel coding style guidelines.
This fixes the checkpatch.pl warning:
CHECK: Logical continuations should be on the previous line

Signed-off-by: Serhat Kumral <serhatkumral1@gmail.com>
---
Changes in v2:
  - Dropped the third patch of the v1 series (msleep to usleep_range conversion) 
    based on feedback from Dan Carpenter.

 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index a545c3338..89e41c26e 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -1018,8 +1018,8 @@ static int rtw_suspend_free_assoc_resource(struct adapter *padapter)
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	if (rtw_chk_roam_flags(padapter, RTW_ROAM_ON_RESUME)) {
-		if (check_fwstate(pmlmepriv, WIFI_STATION_STATE)
-			&& check_fwstate(pmlmepriv, _FW_LINKED)) {
+		if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) &&
+		    check_fwstate(pmlmepriv, _FW_LINKED)) {
 			rtw_set_to_roam(padapter, 1);
 		}
 	}
-- 
2.54.0

