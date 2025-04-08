Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9D222CBCC;
	Tue,  8 Apr 2025 15:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126965; cv=none; b=rKoETXyNnZMx+vsdYmer3g3fOefRRvyDJQ6vdQdtZgCJGWec8ZgV8oO4XmKL46AKG93TMsdVrEViaINOlQHvldosxmHlRw5UsYAKs710VyWMnHxsNd0KLtG+G+DT9slcY9EQ2XUD/cSTLh2qFWu8+wu7Bckokl4EYIgQiL/Wmfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126965; c=relaxed/simple;
	bh=SNY+xfg7xuqeKo0bASauwm4CIB4Hh1IX6M085ebqjU4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sCFO+RIi2u4B4IMjYszoeLDfBiEsJngCM2GwzCDwc+V0gEW31VVV0nzEON7bc4HT1Tz4WK+3yMKSDu5rucsXrZy+0OVf75zU9lo0Saa1jyZbb6XZoh1NrtOtNGl+uUouFRs0QVLe0x3JOKI67MgGEa3qClxQxuVFHScftme6HMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JyiIaGjT; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JyiIaGjT"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6f0ad744811so30426826d6.1;
        Tue, 08 Apr 2025 08:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744126963; x=1744731763; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjpOiArvf1Z04uOUqAGMUvVN32k8PuPE73FHU3En8hk=;
        b=JyiIaGjTiPg2JfuchkbiMuOy3YCcEc+Zdj7xEBX4sMQP5fMvOUPzIWaX+mOMjERWXG
         wvd5LP8pARM16TycobQEpJVSSce+ZpPAqXqvdBOrvj3UrPD+rneN45v1iPu2ifm016zn
         tlM5SsuyQuVHg6s1ZZCZD/XzACP8xKbttpp8DnyUYgreNh/G5yzZqwAzK8zZftav7uPD
         3RpRmIqYoXv82o0JynlmnLwRdObewitQdC4u5u/zfcfyrvN9aYTivTD/ecc8gPEEuYuF
         YjSk3e+6yLzlLAS1yjLhfQplbCDFS1ZIkJS4kU1cbRLcaI4/Qj82MhZp5z+TbenaYa61
         wH2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744126963; x=1744731763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mjpOiArvf1Z04uOUqAGMUvVN32k8PuPE73FHU3En8hk=;
        b=FWXx0PSTuV/xmGaNrR7zZYOjEZBPq7cZ0iMW6JATBqm698RP6pZ8Qu7i9wRuC9r1e+
         pWhGjoKIeLPZhtI3VSuQLJIK1duzVVViZmNGIVJsvstoDq7gJvWHSCa4Al4BYS/N1e84
         HVYfsgsQSnlTPrUqifWNGoXztyBVes6/4SWAwMEu3z2RmRFnAaFDhlO4mUPWHMGORlb1
         95XfvG3qrfqALr0n58Ta5PSElYnAaAOYTxWUzWFCv+6+Lkvpl4eq9XKqTyZcCVIS3WhV
         qmIgKG6lpsLHPsTipqPGUseoHtClXenQR+Naw5aPTjV5VLDlv6Bn4NHa2AOxjwMvZJ5n
         E4KA==
X-Forwarded-Encrypted: i=1; AJvYcCVcJmQq9mXWFrMmbemiwoIbjgkE4/IhTvocRUmIYwnBUhi1wmoqV+3HNPt+SUf/m0iYrmMEje5rH20Vwgg2@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2B0fcMweCxCzExwzlKO9k2C07i7BHjy6ko17jeseZeQabApT8
	0zzcwrTTdDt7Gqd3zU9nALE6anUycqL+OIF0FX9N6JrffGa2h3NJ
X-Gm-Gg: ASbGnculsAuj/OVizGm/B5IT9pa+2OEsJSyO9lOXItdn7xmHS2OPGjqgpsIhVfRmyMS
	GTNWlBwoFbc7Mxt6ZhxDVgl/sq2BgG3cC0vSPHyKpN1S8xS8sEaQFpt7MjkmhwupGEmXneJQEIA
	r3HGmtgmKhAOSZPoB+lF7AJGtSCrAneEmz/tf/3Zf0rB15lSpOi8E6d1r64yDy+sNeiNk7NcNmy
	qa8s+BO0JrI4y3hCdB9Yd6VknvfhamCUzNoEcsvxf49/isXo/Xc2uiE92PMnIPkYCR8wwrC3L1i
	/I/r/JRjTdmaIx+ali6BnSW0xeIjQ690rZ3fiYAHkaNCnTU=
X-Google-Smtp-Source: AGHT+IEBOFu8DkxETzJ/TQ79/F8iZyj7apjJ9thtow93hUktf75LJrMwRZAQnVsHhdWqm842dQ96yA==
X-Received: by 2002:a05:6214:1bcf:b0:6e8:f2ec:4932 with SMTP id 6a1803df08f44-6f064b18b90mr238930066d6.28.1744126962967;
        Tue, 08 Apr 2025 08:42:42 -0700 (PDT)
Received: from ubuntu ([105.117.1.177])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f0483besm76229386d6.67.2025.04.08.08.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:42:42 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev,
	julia.lawall@inria.fr
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	david.laight.linux@gmail.com,
	dan.carpenter@linaro.org,
	andy@kernel.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH v8 1/2] staging: rtl8723bs: Add spaces and line breaks to improve readability
Date: Tue,  8 Apr 2025 15:41:56 +0000
Message-Id: <faf8f6f9ae2b0e4ca37ece39a33db6ea79e025c3.1744126058.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1744126058.git.abrahamadekunle50@gmail.com>
References: <cover.1744126058.git.abrahamadekunle50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The code contains no spaces around binary operators with long lines
which reduces readability thereby not adhering to Linux kernel coding
style.

Add white spaces around the binary operators and use line breaks to
increase readability and ensure adherence to Linux kernel coding
styles.

Suggested-by: Andy Shevchenko <andy@kernel.org>
Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 297c93d65315..5def2467f42b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -963,11 +963,14 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
 					if (SN_LESS(pattrib->seqnum, tx_seq)) {
 						pattrib->ampdu_en = false;/* AGG BK */
 					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
+						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] =
+							(tx_seq + 1) & 0xfff;
 
 						pattrib->ampdu_en = true;/* AGG EN */
 					} else {
-						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;
+						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] =
+							(pattrib->seqnum + 1) & 0xfff;
+
 						pattrib->ampdu_en = true;/* AGG EN */
 					}
 				}
-- 
2.34.1

