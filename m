Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E021FEFBE
	for <linux-staging@lists.linux.dev>; Tue,  5 Nov 2024 05:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730786136; cv=none; b=m2kPfu8mfqudDmUCZeneipnnPaU+ZxQ5zn5NTN5Xna6uHE3uOk5pUVA1Cl8i98ZXhWeEzx0zZYz4FgUd7ve2QIfqAPxH/zTKM9nS2eqb/Wr19mF9asfGgGSNQiwt1oAgP83TWoK/+Z8Y6/XwrQu/DzAumkJKHo5tsiIgDQbGtIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730786136; c=relaxed/simple;
	bh=9oxoSNrl05LDnfU19cL4GGdDL9tbdwm3S1/shv4n9rg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PrL7w1617jR5ro3xBrtYFxg9R9x/dDN+f6hK5eKXx20HCdPhjB+Se2J3Ez7PHRueFB4ylDKXrtLFACQYespPGKWkrf1Fzd5vnPA+OCW9KgLYY8phXt+dbJSgYHYq8Y2240tNYXn5rTwqz+pAdFAscDxFpTqT0Io4poUxcvJ2jEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aCd2ACz4; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aCd2ACz4"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a93c1cc74fdso798666166b.3
        for <linux-staging@lists.linux.dev>; Mon, 04 Nov 2024 21:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730786133; x=1731390933; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rHh53OxhseY5hazfP8y9zHFBWmzPsydNQrxS+Mqf09Q=;
        b=aCd2ACz4CyV+sT2lm/Z4p9MnZUwFUJ7wBRJeDowq0bPlHk7/pv089yKL+wcX0lzJSV
         dsVViLKMNJ8Si0nItXfW/MlWgMgH+WV+SXgq4DpweKQzrQyAwl31UlLWtdx30BqJzGF1
         R+4Uqc1D3kZ1SUN+3aWbO1bL5cTF1Nuf5EnFadyAxbyPA6BShCHPs+MBDFGvecLdJZZG
         /u5qcXfTimmYZKoX5AAz1p5nOAQa3k8Pm6yfvg8iyrb32IMFv+ZgsJ/0G6ExtSy68Ww4
         ae2AIXZ1eJxeuDM0EFpaQkB9Ma7LAfzivvY6D/EXRaqfRMvYk3WHq7fCHVtMYhXnR1zs
         oZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730786133; x=1731390933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rHh53OxhseY5hazfP8y9zHFBWmzPsydNQrxS+Mqf09Q=;
        b=nNuDFc7nVI2j1k0jjMAuuTlvGYWigvNXhh6wGTRijjbgIXwx4A8CoqCJ2KnJuJcUFw
         D0Rdh4VgeQ7g7UknxSAtw04AZjzgfzBdXTKao3AiviH+lxqXFCXlsUvXgWGzLSz6ys1I
         grojKnc3RPxA1giU70Z/vEDGB8W5q0tTGI+In3kL2bFpTA71KdsF9s1YCZmUWoBFkah0
         bJR73IOvW+iq4Bso77jTNzqw9Cba5r9NAA6kfU04LlAkJLltUnhnkzkSA/Y24YVtQ1ra
         9RsIn7Z03Tbb/K54Ib0ZVUohbugE4SCHOVVdVT2g3mY7ieTl4cWNeuctcUrKy1ed/Uh8
         csAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWektCns+h+/k6Tuq9EFdRbamwmRhMsmj5I3BIyhcX1U/HmvKbarJgsgXiM7ZF3xKFLXzVc2qOsEL8Y0yjc@lists.linux.dev
X-Gm-Message-State: AOJu0YwG/ewBRFnqDi05yIYaEfGHYvvxWAT6TdBE7k1NamKYEVruvHVY
	wfHpmVU6VGpr2PrDkM/dv3KCVeuN+NpFPxrGq/eq4fIuPHhIy0gd
X-Google-Smtp-Source: AGHT+IHhGA3OH/rcaYhretm6zSBAxAb2/EldQCnER6BsvR1dEsP61rnKJTZg01jOiEoS4uGu/J1a2A==
X-Received: by 2002:a17:906:c145:b0:a99:7bc0:bca9 with SMTP id a640c23a62f3a-a9e6553af4fmr1500239266b.3.1730786132567;
        Mon, 04 Nov 2024 21:55:32 -0800 (PST)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb181451bsm78775466b.201.2024.11.04.21.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 21:55:32 -0800 (PST)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 09/16] staging: rtl8723bs: Remove function pointer run_thread
Date: Tue,  5 Nov 2024 06:54:56 +0100
Message-ID: <aee978f7180d728517af457e525549c19e3618c8.1730749680.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1730749680.git.philipp.g.hortmann@gmail.com>
References: <cover.1730749680.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove function pointer run_thread and use rtl8723b_start_thread
directly to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c          | 3 +--
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 1 -
 drivers/staging/rtl8723bs/include/hal_intf.h      | 1 -
 3 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 46da566106ae..28d15536abbb 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -233,8 +233,7 @@ void rtw_hal_add_ra_tid(struct adapter *padapter, u32 bitmap, u8 *arg, u8 rssi_l
 /*Start specifical interface thread		*/
 void rtw_hal_start_thread(struct adapter *padapter)
 {
-	if (padapter->HalFunc.run_thread)
-		padapter->HalFunc.run_thread(padapter);
+	rtl8723b_start_thread(padapter);
 }
 /*Start specifical interface thread		*/
 void rtw_hal_stop_thread(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 66c2a8fb2454..8d8270d85f96 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1744,7 +1744,6 @@ void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
 
 void rtl8723b_set_hal_ops(struct hal_ops *pHalFunc)
 {
-	pHalFunc->run_thread = &rtl8723b_start_thread;
 	pHalFunc->cancel_thread = &rtl8723b_stop_thread;
 
 	pHalFunc->read_bbreg = &PHY_QueryBBReg_8723B;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index dc5bb61294b0..3306c26ed2a4 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -164,7 +164,6 @@ typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 struct hal_ops {
 	void (*SetHalODMVarHandler)(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet);
 
-	void (*run_thread)(struct adapter *padapter);
 	void (*cancel_thread)(struct adapter *padapter);
 
 	u32 (*read_bbreg)(struct adapter *padapter, u32 RegAddr, u32 BitMask);
-- 
2.43.0

