Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9370224CEFD;
	Thu,  3 Apr 2025 13:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743686865; cv=none; b=gf0yZAJZi4J37KuiZwOPGn4Eyu1zxxX8a4kDLigZ5xXsK0+j6plrJhhv0mbeOR4/UQGjT9tGDAwGvJ9rZMCtzan+Dhe/kcTOGduWX9OEAx2zFeA55riXXCU06bWm5/qMaw2BzMd6IQr91eaENMWx3Mk4n5VRmrOSIT7dOHlTDGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743686865; c=relaxed/simple;
	bh=3lqEc9rPy9OYJRQBlojfZPpuIi3iFAtcMjxPrU7z7DA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qves2atO4ggH40g3YouKyCbx+TJILTfflDHQ8l+aeDBPS4vbVA9Ye5IAFtqxk3YQKZEe/+s0z31vuHmSsKcs63dk6GNSpBMVGiLljHeRLrw1hxj4gkprmkUNAydRCS1pRIcQQjNJI7Pwz392YX2JHr6cA55z+ek2LvuBOqqNHa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XOxbrQRQ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XOxbrQRQ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39149bccb69so776835f8f.2;
        Thu, 03 Apr 2025 06:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743686862; x=1744291662; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dp5nBsd/DFr5VpeaYg8UHTlBPWUcWv/79+vKJ0EyykY=;
        b=XOxbrQRQavl+T55nnWdCUQfxbwqAEA8OemUFztFebDVKLShmmRKV4HpBBmUyHaaIpe
         QxPPZZBxiKbqKqMZUuP/Dgp5FV+MdUGx5RT32aRja5Uo4PrXdvptyJRTbm57zZaKmXuU
         Ta7oWFSsPV39eZB/GEUWH8yCD+0M4ZO7UWo16Mye1YOp7pYXAXv07n43++3jxa1gIpWL
         Q1uI6U737BS4TZNPSoFiZ3XTFL3ie09FdnGTGY9bMFG4p9olgqgJ6qFh1wSj8My4G8PK
         RypGDMSB6Z/DMdCoxn+kTAVHSJ1FUqmq1SolPVsl0MsoNXRElkcMgOHK/+hKFwdsmnyv
         qojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743686862; x=1744291662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dp5nBsd/DFr5VpeaYg8UHTlBPWUcWv/79+vKJ0EyykY=;
        b=Y1ln8DZdyTqa+dj91JX0UW6qoym0GBD86XI+3QbGRvXDMf9sEe2KiStmoA1bnaVzZQ
         YY+mEk8Tr4wTX9afUHrDbveOUWN+w7uuUgIVIudx6kO7PUlNnasbETt6MoqymrcQfbHB
         W+uF/Tnodu+5bIspQijCpeJXVXrbud56FNDLBBMWRfPkcOt5sDuhKwjXDi0XkVZIXhhw
         4BwIFaY0CSokwQRHTHEMxLamvLFFOhYRTz6tqIZIu28Yuxbbibh2kCM++pVMoYVRgFK0
         WPmSdQqXPAyJ2ab5moWivnINncRpe+54HFfsd3IhfBrBY+7wQVsLFo2h+3pRBkyVs0PN
         I5Ag==
X-Forwarded-Encrypted: i=1; AJvYcCVUGXk8sJtiZRsYLRuGHPjLBU65HLFq9bSMcdfFunpXeL2EjVGRqiVceJEJXV0ao7aKxnkdpdPC2WbtYrmk@lists.linux.dev
X-Gm-Message-State: AOJu0Yxq5sbA3CK8iyS5fRlbBZM5xa561wAytiydL8fHjiQjymH/vj7v
	BVh47n+zuvXiCEwg//Wpg04PZTt2BrmkncdeWhR9Xrhl1EhTNinb
X-Gm-Gg: ASbGncu6wxp6vUvKXQaXctzopuM+layO/Futm0vfmM6HCP7vUWE7HRA/tTI+U9b9Wsz
	+rSQSuwoxyd6ZYa6G1c7CyBngZY0ayPllyK/BEYOJZoLICt6/4PknEn0JWAmdAgHM5+ojOBRGAl
	DZYQIcTHYSJ/oJaDo29AJl8tccP65HMZ6/t/KlY4QRhG72JiNh3odchMxxDmFwOfFq/NQVYlkyZ
	B9NBuqNM5kZaobYY5Yt20NhMO2yyrxtVibLyWX2rGxhgqlhab5OUKbYJGnlk1upbyI1cVy/l3aG
	QZ65E4Z9uwRGDyoIco8oBEKB8VjrEWKZy+YEal0FBThIFVh79q58Kg==
X-Google-Smtp-Source: AGHT+IF8hv/rELd9ZpO2/F3vybwO6WLkSrCgrysuGBoCihWf+/H7dhnQV7G5SP6T1xyX8KA9DX7Wcg==
X-Received: by 2002:a05:6000:1acc:b0:39a:ca59:a626 with SMTP id ffacd0b85a97d-39c297687e3mr5947919f8f.28.1743686861580;
        Thu, 03 Apr 2025 06:27:41 -0700 (PDT)
Received: from HP-650 ([197.210.35.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec36691b3sm18621535e9.34.2025.04.03.06.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 06:27:41 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev,
	julia.lawall@inria.fr
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	andy@kernel.org,
	hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH v2 2/3] staging: media: Remove duplicated NULL tests on a value in av7110
Date: Thu,  3 Apr 2025 14:26:42 +0100
Message-Id: <76351e135cf7ec4d609e60461bae4ba6d3c3a445.1743685415.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1743685415.git.abrahamadekunle50@gmail.com>
References: <cover.1743685415.git.abrahamadekunle50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a value has been tested for NULL in an expression, a
second NULL test on the same value in another expression
is unnecessary when the value has not been assigned NULL.

Remove unnecessary duplicate NULL tests on the same value that
has previously been NULL tested.

Found by Coccinelle

Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
 drivers/staging/media/av7110/sp8870.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/av7110/sp8870.c b/drivers/staging/media/av7110/sp8870.c
index 0c813860f5b2..65842dd559e3 100644
--- a/drivers/staging/media/av7110/sp8870.c
+++ b/drivers/staging/media/av7110/sp8870.c
@@ -508,12 +508,10 @@ static int sp8870_set_frontend(struct dvb_frontend *fe)
 	}
 
 	if (debug) {
-		if (valid) {
-			if (trials > 1) {
-				pr_info("%s(): firmware lockup!!!\n", __func__);
-				pr_info("%s(): recovered after %i trial(s))\n",  __func__, trials - 1);
-				lockups++;
-			}
+		if (trials > 1) {
+			pr_info("%s(): firmware lockup!!!\n", __func__);
+			pr_info("%s(): recovered after %i trial(s))\n",  __func__, trials - 1);
+			lockups++;
 		}
 		switches++;
 		pr_info("%s(): switches = %i lockups = %i\n", __func__, switches, lockups);
-- 
2.34.1

