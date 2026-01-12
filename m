Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4A0330DD2A
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 04:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768192503; cv=none; b=Z9+QnVCokFugIw6bw4f+7JFfdWLzmVMmxJeyKPG9jfvLDz7op5apXjRuzGZ/MGFPgsBo9eda+JURkskJO4LwOmT7KkLH0xl9Pxw5n5HZIaqVCEf4Esz2iqHnVG4dQmrot5n3AxLApoPdFyOUs8EwDOGsHrnKkCdwbRMEANEiRtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768192503; c=relaxed/simple;
	bh=Qc85MFpnfmV9gh6PEOVCy4HWaqRzXk5RlS+WYVYU3O0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LUrl+vI6PEjkR6fU+TvaABnNgLkTDzySDYEw9INUaMNfWGNAXkpn/RZ/jKU6+uB77fhI/O0CMk5rWyVW2TrV+xoi7BMbds5rJ9TYJwM9Mm3CvUFHxCbaytG+Q2fr2fjPnQdhf36SdcCWrA3Jc00IVeBnlNZ7CTiOpSrsZhIRSSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Irp1mE7X; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Irp1mE7X"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-81f4ba336b4so835490b3a.1
        for <linux-staging@lists.linux.dev>; Sun, 11 Jan 2026 20:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768192491; x=1768797291; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNqBa2NEMZlSq/IvbZLP+HdJzrzTFSiXqKg6f5na7yA=;
        b=Irp1mE7X67iH8YCWdX+7gKIdlNplglG/srsqBPDFSfyzxg0EyP0uXS7s+/DYGHKcxV
         3t2gpWO38m/xKnTjs9jIqaeD5RELq3r6HYHfTuhxERENn3ft0J3wv/qUS+snJHcSItAv
         2+yMI5QI+YKGnd/yCTcVKm1PPYxQdXe+/UR4eBAuC4+jOOR3Y2umQ6g2LX7SQBvnuH9s
         dyHvjSJuaiWuXRe3UJS5JntmC8O9eUiMv3Rfqxkq1awc9eubk/806lS7eVhDF70lsUTF
         lsJr1l0LRkX/7G184Zh94cOvuw8bYVjKfioysjNTei34V9GJS+bLJydUojxRshetodyu
         2/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768192491; x=1768797291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cNqBa2NEMZlSq/IvbZLP+HdJzrzTFSiXqKg6f5na7yA=;
        b=YTlJZAL3H6PiyDvwIZcpMP+5AXbgLyizJmjY+uX36k8zEIqY2wIZOLbDpCBEZn2Eij
         GWUdeNLxSSUHnrEYbh67FxffZD/gpYpUYb57wHeiD1hAFShpqC5fe5xwAFiPBvtJ4u5X
         I4fXaq4CfD7ex1c9wNTq20AWwfF94Emt3yOhBjpwpEUKAoKjUyWM9nbEgNPWEWygQrPc
         xp8gl8F8w/xk9kRttRd7gtwsL90S6CyY4j854zIc5idWw34ylUNwR+XDKBdLHhZWDFCv
         dMBhF2F6TIEW/LQZMOy+bw77hmhAkRLxM7Xzg99KMYsy+MFT0PuM289Up9fxZUJVQuBK
         ha+g==
X-Forwarded-Encrypted: i=1; AJvYcCW8bWZHh4wx/0Q6/n9NbOJWR7g19gfbxLSk9AGotluAyDePBFUUb/cVYkAyDHcJjrQnieOl0ikwza/MDwNB@lists.linux.dev
X-Gm-Message-State: AOJu0YyM5B+ifhEQ9H3YKprk9mIsP6u0cJppzG9EoyTqPHphouvmGBg0
	SAEn7wdiRK1W6Y3cJUQFP1+fMb6WWBBdVqmI4mBpf3GZxtSyM9RyxQ6q
X-Gm-Gg: AY/fxX4/mn+LXrdrmxzBNGisrlM2WVm1esoMZjsOoTenROi23ENCHdjvsvB4ZCZIfDF
	avVP53iptfk5Dj2HjJXhN33mlqV8Hs3woqIIBckZFMUTefHsbKnaZ6tKa+CdG9cFCe9BWCh4Suv
	RycL9DLeCmV2tkl+0X2VabZzdrWRcTJyHhRb3cQDS5pbyfSILw17tixpUzylJVJWrEimGrUEo66
	3hKsr7cCOodMvQWJHlKgxqDG44AujgQpVdzPEPxiETZwijfll6EuWBbE9zPx6dpZsSXy5OSbqJs
	9Qp81KUN5oEB1TARRhw10ldiPtEGpJHL1olXEFMMm3PQXUUxdFe18efv6ybv+TZrqTKryhaLPT0
	1A77cI9q4WNZyYZSTsQwMk/JFh/J1E0K1Go/6/UnYc3EEiw5bStiKcYBTYyULxTX8A/9F8ThYyF
	Ec6BmYYVwDDMOVUiZKCuV2S3zvYifugxE=
X-Google-Smtp-Source: AGHT+IHka/VSRNwTxPRhvn12wqo+rSUTEfRn9KWxfvLxmBT10l4zDrCT4ZwwjEroW0eS5yvnqoO5/Q==
X-Received: by 2002:a05:6a00:1f07:b0:81f:42b7:e57a with SMTP id d2e1a72fcca58-81f42b7e780mr3694448b3a.37.1768192491099;
        Sun, 11 Jan 2026 20:34:51 -0800 (PST)
Received: from UbuntuDevVM.. ([103.171.99.41])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81f3909d2cbsm5418655b3a.48.2026.01.11.20.34.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 20:34:50 -0800 (PST)
From: Nayana Mariyappa <nayana.mariyappa@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Nayana Mariyappa <nayana.mariyappa@gmail.com>
Subject: [PATCH v2 2/4] staging: rtl8723bs: remove extra blank lines
Date: Mon, 12 Jan 2026 04:34:27 +0000
Message-ID: <20260112043429.42615-3-nayana.mariyappa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112043429.42615-1-nayana.mariyappa@gmail.com>
References: <20260112043429.42615-1-nayana.mariyappa@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed unnecessary blank lines in osdep_service.c and related files
to follow kernel coding style.
No functional change.

Signed-off-by: Nayana Mariyappa <nayana.mariyappa@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/osdep_service.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/osdep_service.c b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
index 8f6dd3560303..c9be4dc63598 100644
--- a/drivers/staging/rtl8723bs/os_dep/osdep_service.c
+++ b/drivers/staging/rtl8723bs/os_dep/osdep_service.c
@@ -152,7 +152,6 @@ void rtw_buf_update(u8 **buf, u32 *buf_len, u8 *src, u32 src_len)
 		kfree(ori);
 }
 
-
 /**
  * rtw_cbuf_full - test if cbuf is full
  * @cbuf: pointer of struct rtw_cbuf
-- 
2.43.0

