Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E8836BCE8
	for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 12:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773147390; cv=none; b=OcxDHYnpd4j6YOJ0fX/mO2mbEwMG191xIFiHirRw+PnJUkVi1tKQCTzn5cMOmKCwC5ukTuDxl4Zgns/OlSceki8bnl35RpbCsVTaKEvSoNQ6HNm0qucEOXCtXd1ZX7dl9LwTZ1IkGT/qXIO64uxi3XvCdRCx+9/6bJvatms1hRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773147390; c=relaxed/simple;
	bh=WBcP20CMsEyFktTxPB2rjXWpHgtCmOMRgcPxzHK3/7k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dWcBK14kHRNzv2qiTaPPrN06V/Hli0ZrpjxmKupUcka9UBWu1j4sx7ZkvfmvHq3BPNOzKN7pAJA+OKu/quekYCX2FgzQILXm2YPmLkFAFKozclrdNbBcf0VoP98yMArGvFww+vhH5Ql4Cy4sYklDyv1+PIJvxH5XRxpX6kmgi/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ch2Vg58C; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ch2Vg58C"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-482f454be5bso129437775e9.0
        for <linux-staging@lists.linux.dev>; Tue, 10 Mar 2026 05:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773147387; x=1773752187; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JQ6TEeypBBrBlN0tPd/ovZ5rS+L8W2mY+HDzVJDJvNI=;
        b=ch2Vg58CKK89OWBDRkf595el+5JO2qxe9XQgmbE9UKOU6ukWtDPTBi7iNSnGKuIMSQ
         i8RWMbAMoWeKJeiV4hmXgLYxzeztnM9wAE0FfT5jX5SADaM+MOore4/WzDATQsnjFiua
         TzFYIzIY+e2f4KT7WSB5VsCATcuqwbVdgMvKmdNqrjS+TWIg6R9rLXge2Yb1zIcLaLfd
         X9AsOwxIlGkmFk85HEsj+jfCRO58daQc9cmFFCqSRi2ABjKyrM1zClvH2LzvSj7BOBi3
         aWwrSac9MVgT601IYugZr0LXaUSKLoUJPDYKynopyVnuyvpQgHgsqbhQiTMwGJMKBZwM
         dnqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773147387; x=1773752187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQ6TEeypBBrBlN0tPd/ovZ5rS+L8W2mY+HDzVJDJvNI=;
        b=uHHhS8vKiBbK3cPlwEEoGzOphkTGU2mjOtFyQ1orxin02i5hkNQtMQc9EGpAurscla
         POz661KiLlFpILRaCcEo8S2YzVsevlR2citmxcbESPSzDw/xgTxg7oqvZwYZyFw8JC42
         9jaH+Q5XXmO4mjHj/BJaVuhFbApQ1SMp05vaXuoLiG/A4q7TB+ix4vULxN8YqkQvUyAK
         Hg/dkPqMeq76daICHiNgGYmQoSxFk//m1OtPqhs8PY+QQFEc0ii8JWpRuQRakwKs8Xm0
         qzsKcE6cKn6nbyc0fSugcj/x2RCdIcy3wM+n+poH2sgBibD+xx26fIVjDEx2EP/tRQxY
         OpXw==
X-Gm-Message-State: AOJu0YxWYWaZMf1I3zMgbNUpVhoQ2WTeh52iQhp0GYgXcSyGowLHedT8
	XTagfuFsWduO5pm4z6V9KUzShz/96R9Hf7P0+tbJIRD3pEjIua8U2TWA
X-Gm-Gg: ATEYQzz8LCQqO41kaW/J13VmqS164YCUd1ZhTHLO+0oGTdiiq983E5P/9Krkge2U2G+
	HtKjiSjbC06KOhawsBXDjwlHR5mcvG0m2MHiVAiB8Nxr8IEBMaCiT4gOUJsKe1k2Jt3zTfMqvyx
	QYg72IRYIs5xsRNeA/iEhy/f3tctqgzefdUPvzKCWzfgVen84k7ZN7r/N/hTRoI/Tx0nMMJfMWz
	TKRMYlml9BizdueOr2QguDRVidut5cHrr23P5eZ28uMJcHRPDYFYanJe/XVT/4X4S8vmrOI1/Vs
	KBnBi7+qWh96LRGNaeWxERdh9lcZ+F5bfrI4xYhGbEovm+BBMkBzUKqohUP78J726AEsFnjOvqS
	omQYzgjURfF4ZvzXcTJpSPGf8Em7QVcJPS2wjfcuZ/Sb3pLORMkYXLKSW7jd7mvftGFWDaQydLt
	Qkoc78c/kgN3Wl2nvzrNQBHWtwW0WIgEFbCqhOmWpA
X-Received: by 2002:a05:600c:8b53:b0:485:3b33:f4b6 with SMTP id 5b1f17b1804b1-4854192dd56mr8835085e9.0.1773147386849;
        Tue, 10 Mar 2026 05:56:26 -0700 (PDT)
Received: from DESKTOP-BTQF5RC.localdomain ([85.110.79.247])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541acea11sm81507025e9.7.2026.03.10.05.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 05:56:26 -0700 (PDT)
From: =?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Bera=20Y=C3=BCzl=C3=BC?= <b9788213@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Remove space in the line start
Date: Tue, 10 Mar 2026 15:55:57 +0300
Message-ID: <20260310125556.874-2-b9788213@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove a space in the line start to follow kernel coding style.
Reported by checkpatch.pl.

Signed-off-by: Bera Yüzlü <b9788213@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.h b/drivers/staging/rtl8723bs/hal/odm.h
index 38830552d..714bab71d 100644
--- a/drivers/staging/rtl8723bs/hal/odm.h
+++ b/drivers/staging/rtl8723bs/hal/odm.h
@@ -978,7 +978,7 @@ struct dm_odm_t { /* DM_Out_Source_Dynamic_Mechanism_Structure */
 	#endif
 };
 
- enum odm_rf_content {
+enum odm_rf_content {
 	odm_radioa_txt = 0x1000,
 	odm_radiob_txt = 0x1001,
 	odm_radioc_txt = 0x1002,
-- 
2.43.0

