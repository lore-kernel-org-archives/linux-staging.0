Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 989B23A1E75
	for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 16:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771949623; cv=none; b=uHdTSmnvKR9qphQlN+/wiGJsZaZT1otPdhTB51BnlFJGEJZw+/23p8m5MvwMhpZqYz/4xOFqy2eWgBBVLPzLVKkWlL49ZEfczODv6bozAqdQpCzqrwL0x+mNpksWHXyiev5fgC/mKRyIxMN60oiHKx3EhRfINLkTkkdagxkE4qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771949623; c=relaxed/simple;
	bh=SHUwjb7uxeUM/Fo4eVf2vZea7fnOmezdadodV898a9E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fx0VhyP43H0RaGeT8v4YoNKGgrhYE9WdBK7xcr+Nv2rtGgZ2bcKLpxh7eBW0QAwM+ykVtdq2fghMh9Tb9gC6ZIM+yGSoJMPtaNAdZ6xaadTeMv+EaLM7aZXaCwVPAz2MLnbUJS/f0wNMCPouj+6/uVwr2hwtvgDfmZ+mkzBLtMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m6tiadc2; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m6tiadc2"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4362d4050c1so5891271f8f.2
        for <linux-staging@lists.linux.dev>; Tue, 24 Feb 2026 08:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771949621; x=1772554421; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qoMVQq/3oy5C1nYF9dD1zRyG77fLqujKxwVM2Jq1C+o=;
        b=m6tiadc21gITDedro0EvR/oOF31IXa/oWN3xjV0pVSwZrCx7mWp2pReo5KF0EbAQ1P
         nIPb59gpnOVVsDFh8LNVK7jGfJOYsjgUhJ3CGDgvfqyQ2EBUlkchpEKh0qq4Y3EE4b3z
         7ye96gq/mNvKN0UIoQM9JOznpLo10JjQRfjJAvGgif/AT6KB+Vgu4F4WpD6DKMqVHjsb
         IOHeL+8aFWebgmo7wasINvbPG7E9COSzrc9sdDBP7eFp7EgyKBt8o41CIBQKZKSk8wwn
         9fD10e0QOUW2dTpfgY33OlCFQnQZBFDeepVPiNE5Ny22EJOqQan3ZumFTmXmBhTs4E8t
         Q99g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771949621; x=1772554421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qoMVQq/3oy5C1nYF9dD1zRyG77fLqujKxwVM2Jq1C+o=;
        b=bGwUF9OZ1xx7/rJL4TatpDq8rWZaqLfE5c/LrNh7W6Y9/BBCTK2/SPYz2ajP1FRoKv
         B5ewAx7KUNovUjXaY7kyzU6Gd3GYaRodais+B/f4EV+4nr8HV637UlRbUE0+Lqke8WKv
         sbT1PhTfZkUisim4++0srlfR444Rqz4F0ZeLHIvYNaHU3rxq5vw6kTuZUDpRPYGDADRO
         ykMSQaQZdnIu9Wv4Hp2guXXEQcD4Fo4E6JWU7s00O4KKeAvcaIvuoboTlPs5toyHfvJM
         wReOUC7DJs60FNVuX/h78uGTInxRacXpHb2q7tSectAagIZ4XDcNRpHPazNjPPWBYf3h
         iSOg==
X-Gm-Message-State: AOJu0YwEtii13YOKieLg73sGYNX/W3FSSpThFJKXJM3ib/2Vvs+/KGuw
	VohjQzWPHzRMZ9Queaw1gqjURFcUPIEi72gAfgFvBKliUjqO8e3ZAxo/
X-Gm-Gg: ATEYQzzmksaI5/ipKY/GgRXsVtpOFMr6umVWzYudy6eqPMqqXHkOe4kvLOH7T9VV70J
	/glEQbMG7o3cMBmrNRfakIrG1ND/vcv9K4RVeiRpK+RsWyRswXyg/SRjNsx6/ZhZ9BcowEARvbh
	aiDTDHzWDx6WL3SPboJjdNBN8XfphAqSLkoBZez6pFzUk85t1/5w2U86OqgJbsCIFQb0ehfucd+
	pA191R1ZllPr5A4pIbRthQ6+xYDvvCQh+ruZOgy9tLJvYputrU6LaITBDJiD964nvPBmPURpJnZ
	DlKgT41DRoJ4ZLOyIkoDdYWzigoOAKxKk5gWN4B38defpMg0KmiAiSI3cpgNRR/x8739/hzPaae
	TFXxVuU5SPVDJqywcPu/hlIhwngCMui8uqBAJYxilfcNR9lLFbNS66Sj7yLsnlPG//Ecv1T/EwI
	KTkhbbE7ov/vlHvqzppi6eqTaa+zzHQ9ZVaxd+PL4+Aw==
X-Received: by 2002:a05:6000:4282:b0:432:a9db:f9a2 with SMTP id ffacd0b85a97d-4396f181413mr25165111f8f.41.1771949620745;
        Tue, 24 Feb 2026 08:13:40 -0800 (PST)
Received: from arch.tail32e249.ts.net ([2a02:1210:2e28:2800:36a5:7f85:ccb8:1176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d54760sm27568866f8f.35.2026.02.24.08.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 08:13:40 -0800 (PST)
From: Gabriel Windlin <gawindlin@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	Gabriel Windlin <gawindlin@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove multiple blank lines
Date: Tue, 24 Feb 2026 17:13:19 +0100
Message-ID: <20260224161319.89187-1-gawindlin@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove multiple consecutive blank lines to adhere to the Linux kernel
coding style. Issues reported by checkpatch.pl.

Signed-off-by: Gabriel Windlin <gawindlin@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index b489babe7432..93b97c1ac797 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -196,7 +196,6 @@ void rtw_secgetmic(struct mic_data *pmicdata, u8 *dst)
 	secmicclear(pmicdata);
 }
 
-
 void rtw_seccalctkipmic(u8 *key, u8 *header, u8 *data, u32 data_len, u8 *mic_code, u8 pri)
 {
 
@@ -222,7 +221,6 @@ void rtw_seccalctkipmic(u8 *key, u8 *header, u8 *data, u32 data_len, u8 *mic_cod
 	}
 	rtw_secmicappend(&micdata, &priority[0], 4);
 
-
 	rtw_secmicappend(&micdata, data, data_len);
 
 	rtw_secgetmic(&micdata, mic_code);
@@ -282,7 +280,6 @@ static const unsigned short Sbox1[2][256] = {      /* Sbox for hash (can be in R
 	 0x82C3, 0x29B0, 0x5A77, 0x1E11, 0x7BCB, 0xA8FC, 0x6DD6, 0x2C3A,
 	},
 
-
 	{  /* second half of table is unsigned char-reversed version of first! */
 	 0xA5C6, 0x84F8, 0x99EE, 0x8DF6, 0x0DFF, 0xBDD6, 0xB1DE, 0x5491,
 	 0x5060, 0x0302, 0xA9CE, 0x7D56, 0x19E7, 0x62B5, 0xE64D, 0x9AEC,
@@ -357,7 +354,6 @@ static void phase1(u16 *p1k, const u8 *tk, const u8 *ta, u32 iv32)
 	}
 }
 
-
 /*
  * Routine: Phase 2 -- generate RC4KEY, given TK, P1K, IV16
  *
-- 
2.53.0

