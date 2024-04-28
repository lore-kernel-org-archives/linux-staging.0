Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47A828DB7
	for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 23:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714345276; cv=none; b=uegTFMc3qiAvCtpmlnVSbLB1AieRXtYXGnpdRootgGlPDZ3hWuQktjBd37oMYdFnNZl02Oci5YTnN4FB+ElRXzfY5cnhc9aNdT74xOkV/I7ZUynU6LTXc9r8C6fd9VR2xzI1l6Kyv0cZIEuJwCK+U5assLuuE9oiJ3JS8kmDlew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714345276; c=relaxed/simple;
	bh=/+LFbaLuLifNnhOqFevNNN8UaYVAANs6mc+rNTS3Wqg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h21RtmD5qh0k5y0+S7NJar1HQHp3EgYZkeHybkTk9ybTd6Ye+rzMrjCtf9pOikZMaFHgQhnfH/YOu3hUgcVzv/GB/NntQ9gF4Q/N3JYcdEea/14eEV6HoFEhBjHa7raGgS2kBVjlYgWOg7h5qMGyR3P5pIz5S/M5YZ/ziMLDayg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=br9AyFJi; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="br9AyFJi"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-5f807d941c4so3034667a12.0
        for <linux-staging@lists.linux.dev>; Sun, 28 Apr 2024 16:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1714345274; x=1714950074; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bMzdjpSY3aU2xO0etNilr8pDifs6x6rV56OohU4rWeE=;
        b=br9AyFJimeknRPO0eqmyOC1WER/NojuRrGco+OKcsuQh33u4+xOelU5gG6Xkufyx3b
         ujxRwJLg4YkvFAFZ5wTrH7enq+pZ39vA2VRkfViTQuWxiww/rbcrwWboqxzj+RpvbvUl
         cxZf6fHgGwb4k8dL3SVkgTN/Gvgqi/jW6nCtqvrU1DwBhnWY+jrnuCmVUlyyDBmh+gY8
         liZzIBG8RurT335AJru4gqICBrh1Dy61arXfSFNvtuSHGdP8Vz8NWoMy4Hni79ab2aQg
         QsvtaNyLz8YtU7wh5pC61b8z0h2PzXu+qYvbI4cX8rDlEhjgTB7Eb53+QQWZTjOiWF1q
         xCYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714345274; x=1714950074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bMzdjpSY3aU2xO0etNilr8pDifs6x6rV56OohU4rWeE=;
        b=nFCC5BrSKGNJfZZx2+SSJpv3F5p240HqMrWHjN+WUHWS5YLesZrNPrKqLFrP2rGZW8
         oT+oBRRer1IKZwVBhniMfzux1ukJQjJoUoYGmC4rR7hYh6uToxopkxgAEL5QzjeYvKer
         7Vb4pnSF3pOt+es7ZTZsNAa2WwwbFcLK2AhI0CwD5nXNj8HGoT1Cy3wE0xCNfrzzPMEw
         fhAmY93EZedqHwfGx5EFvUJYwz2h2f3wbLRkVWz0ERU5rkZA1XgFbNpWc/h8yD4lIm+q
         X1+XKETO+h/cua7emSq9mQk4GEUVEx9SKPUdd0SuA7gXgD+oCsHWkorRdx0FvX7AnzKA
         83VQ==
X-Gm-Message-State: AOJu0YwFol/3kqppS2WyvfCUAXSwSD+9rk0/3v16miwqutdQrnLtEh1h
	ngxliDxfQKXSvx+E3XzgcbIaCLsZ+iX+M7Zqc8ZT2hiZ0lT8GFa9xEzCXh1q/io=
X-Google-Smtp-Source: AGHT+IHUlmA1CEMYubfRTFna8pS70R5qtp4cOQDU6qPWbeln+BwJZzgbSv8m3NBuwIhLfxrEjlvQXQ==
X-Received: by 2002:a17:90a:fe8e:b0:2ab:e09e:fdf6 with SMTP id co14-20020a17090afe8e00b002abe09efdf6mr8718594pjb.47.1714345274388;
        Sun, 28 Apr 2024 16:01:14 -0700 (PDT)
Received: from lunchbox.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id o16-20020a17090aac1000b002a27132ac02sm17860864pjq.2.2024.04.28.16.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 16:01:14 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 07/18] Staging: rtl8192e: Rename variable MimoPwrSave
Date: Sun, 28 Apr 2024 16:00:55 -0700
Message-Id: <20240428230106.6548-8-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240428230106.6548-1-tdavies@darkphysics.net>
References: <20240428230106.6548-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable MimoPwrSave to mimo_pwr_save
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_HT.h     | 2 +-
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HT.h b/drivers/staging/rtl8192e/rtl819x_HT.h
index fb3c0dba9d16..25cdfdf85991 100644
--- a/drivers/staging/rtl8192e/rtl819x_HT.h
+++ b/drivers/staging/rtl8192e/rtl819x_HT.h
@@ -26,7 +26,7 @@ enum ht_extchnl_offset {
 struct ht_capab_ele {
 	u8	adv_coding:1;
 	u8	chl_width:1;
-	u8	MimoPwrSave:2;
+	u8	mimo_pwr_save:2;
 	u8	GreenField:1;
 	u8	ShortGI20Mhz:1;
 	u8	ShortGI40Mhz:1;
diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 6eb708ba80ae..73d1e19a59ba 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -257,7 +257,7 @@ void ht_construct_capability_element(struct rtllib_device *ieee, u8 *pos_ht_cap,
 	else
 		cap_ele->chl_width = 1;
 
-	cap_ele->MimoPwrSave		= 3;
+	cap_ele->mimo_pwr_save		= 3;
 	cap_ele->GreenField		= 0;
 	cap_ele->ShortGI20Mhz		= 1;
 	cap_ele->ShortGI40Mhz		= 1;
-- 
2.30.2

