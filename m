Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30501146D6B
	for <linux-staging@lists.linux.dev>; Tue, 20 Aug 2024 18:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724179354; cv=none; b=lJZXZLwHv5nZTqfTVRfMPw3fbgh/NzBBvNhruhq5hY0h7YPJ8Q+SeyYe971Vd4jFlWdEXVDUpRG7afMaiJFHsXnT765e9sd9rSakVK3heRe65YoKKkbHU6i2ZsYBqqK47cPqtqfTu9QWRPrWiW0cAZSW5mZajCDkUjQIU2Zbx/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724179354; c=relaxed/simple;
	bh=YPwnmjDLK+YVf0WyuqFgoPNXU4jhy1NiR/p0IqzQHyo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pBRaCvw6nCZH6RHS87N44+L6dZvXDZT9mAGbcbxHHOD59RRKyPCyY9RtRE0AU9dU8wObnTzGyDQYjFr7duRG1KwaL590Gh2XW6x1kzdru8DacDd9CCOliLbZYRhaTGHuK/Vuo8HkVr0NKTPTsRT273Mw/ar1XgF3nbWJOF1OCWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j7FQ1uqU; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j7FQ1uqU"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7b8884631c4so2446807a12.2
        for <linux-staging@lists.linux.dev>; Tue, 20 Aug 2024 11:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724179352; x=1724784152; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d6qvU2I/kFY0fRRBFMo/OPhj2YEvUyZhHs3rYMJMfKI=;
        b=j7FQ1uqUA9W+kxsOpzA+OIdxXrAWoc6rz7k/nnvXBz9MgEzWoJJus4lYExUzYvTdBF
         Emr7MUYmPx+zYhciLOBR5WC0noCzBAg7CWcDO2tSiFcnY6ctTIu3ypitbLu9HsyOqTdn
         UeXlp5nJpOKJzHFbPCkKkwzIlyrGXK6opNefo3zeysOCk5e73L0EMM260i/mQCz8Qqyr
         kEZv1HwO3hYNTWf6dpo47Rm8hDPWVMBqPdyZ3WJAYL5KwdFrHGSoZDzblMDt0ilihelw
         4ZCXXEvh/U1sEWrFmYZudfwNwJo8eygGUIzeZmy1MqFx48Ga6xe3RFAy3ZSbCU2KDUZk
         CD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724179352; x=1724784152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d6qvU2I/kFY0fRRBFMo/OPhj2YEvUyZhHs3rYMJMfKI=;
        b=FUaHL0X70wz8B9qSfNUwRjCnVCgbIXc8PdEkGzL7VdRi+j13IkD+k4JeC0UI7eM4nT
         X+GJfF8q5YXMYJnhICFmXrJ1seeM26TrTVDrttVr70OB8VvfjV8m1O0ESTR5odESX0iR
         vL+OFl+9RRvgfEjWVRe4v+25/lRwXXfq7uhJ4AGgUyA/V7ZG4ks92Y8CWeHw5qzS/U2F
         JzTR+8wigkJvBMrBqhLWzdKhbNc/EF6dqDTKdnAYU4HV8HfgaDeBTIXR+yH7DssjKZ5/
         MyywQdbTmmh4/xJj2JrdK3RZnR+WDXWKt9sa9b/N/goFzt9+r1AIEL+WV0A9pkDbgPWI
         rcGA==
X-Forwarded-Encrypted: i=1; AJvYcCXs3n5JfIUAxnEHZTlMH5+ULHe2qYnbGzgG6oqoKnRFaLwyenKkwOXl+3rxl35/UqAW5/J/rlcz9Cvo8EG5@lists.linux.dev
X-Gm-Message-State: AOJu0YzdCAisd8bSCpW0ITLbExUF8sEVRXt0ui6GDCVQoNXhNfdrAiCt
	ldMvcNW5iaWNrJfACQyLkBDQM8Se/oN7ICa+wSRlNGenbsBlG8Yd
X-Google-Smtp-Source: AGHT+IFxlJrjQAQKZg0A12JTqiKvjdykV//J1dgiLVqq1WbyaFiL56N6kPECxFc5tIIGDKmeX/UNoQ==
X-Received: by 2002:a05:6a21:1788:b0:1c6:a57a:159c with SMTP id adf61e73a8af0-1cad81814e4mr388450637.52.1724179352220;
        Tue, 20 Aug 2024 11:42:32 -0700 (PDT)
Received: from embed-PC.. ([106.222.232.230])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127ae0e246sm8541159b3a.70.2024.08.20.11.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 11:42:31 -0700 (PDT)
From: Abhishek Tamboli <abhishektamboli9@gmail.com>
To: gregkh@linuxfoundation.org
Cc: tdavies@darkphysics.net,
	philipp.g.hortmann@gmail.com,
	garyrookard@fastmail.org,
	linux-staging@lists.linux.dev,
	skhan@linuxfoundation.org,
	rbmarliere@gmail.com,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8192e: Replace strcpy with strscpy in rtl819x_translate_scan
Date: Wed, 21 Aug 2024 00:12:16 +0530
Message-Id: <20240820184216.45390-1-abhishektamboli9@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace strcpy() with strscpy() in rtl819x_translate_scan() 
function to ensure buffer safety.

Signed-off-by: Abhishek Tamboli <abhishektamboli9@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_wx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib_wx.c b/drivers/staging/rtl8192e/rtllib_wx.c
index fbd4ec824084..970b7fcb3f7e 100644
--- a/drivers/staging/rtl8192e/rtllib_wx.c
+++ b/drivers/staging/rtl8192e/rtllib_wx.c
@@ -61,7 +61,7 @@ static inline char *rtl819x_translate_scan(struct rtllib_device *ieee,
 	iwe.cmd = SIOCGIWNAME;
 	for (i = 0; i < ARRAY_SIZE(rtllib_modes); i++) {
 		if (network->mode & BIT(i)) {
-			strcpy(pname, rtllib_modes[i]);
+			strscpy(pname, rtllib_modes[i], sizeof(pname));
 			pname += strlen(rtllib_modes[i]);
 		}
 	}
--
2.34.1

