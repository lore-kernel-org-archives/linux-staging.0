Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D066384252
	for <linux-staging@lists.linux.dev>; Wed,  4 Mar 2026 08:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772613961; cv=none; b=JMQ6IDotb5VqgMaPcxXQLymo8LyaB2DpcT2jyHds0Int8Jw4OgPiWZ6IftV/Ysl3NI1r59pIET09O/3PR6ATSMsokXLkzkXBGSg6lXNJgLm0Dr3uCtZ46cDxd6VDIgc7q+WICGyY514NxEREp4V/bnp+Pe+yOjJ8jVMw59OCbqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772613961; c=relaxed/simple;
	bh=/mgLq6MyipgAXakM35FmxxzZYKnWCLgWV+pnzFPnrtE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CcK1ywgoP1Ehp8k6hIBUPNavFL6462feRd6XybMKYn69JTDj29ACZbcGO9ChbJiWuxjmMDsjL9D3yVST60JMbu6J16dvf9fk2AMeD/kGwi46GFnfyAnx8w/nXtIai1cImKRjKFvRf6yjnm6fRlO0FPoPXbK1DHJ29b97Pqo6ULA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oc/TcBiY; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oc/TcBiY"
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-2a8720818aeso4680225ad.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Mar 2026 00:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772613957; x=1773218757; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtmuCRd6e+N3D2PnsalDY4juU7geywSEbJtG8JH60jw=;
        b=Oc/TcBiYHY4Xy9plJGuW24vEnBlv0bilJ5BzStIincia66Cnf+GKrKC+H1A/HVcMxv
         43r+Fnng2Ziv+RwMyoRMQX4oZwYFMnro+sshr9jcNrGBojCE6BYeVGKOaz510x46ImPL
         WyivJ9ZPrno/Sj+Ncv5D735gAi4ev9rZAJNOIBNr/3HT7tUvsDjZWDFxVuf4gnHkPC9x
         X22QJulgKz6eZjoavjmO+4URsvQGN16+iQstdaSNHJan5r9fJ1dsa9e8Srz4PsSLiHfb
         BcZGwtQ08ko4V7Yr2cwtITJt6IkNOClqs+ly28tXrtxV344jmpHSSxKY5eNdw43CkBeP
         lRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772613957; x=1773218757;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GtmuCRd6e+N3D2PnsalDY4juU7geywSEbJtG8JH60jw=;
        b=WvxwRntaTkI3toU0LuySUFYHBIGCmtbkzWEIUkM/N4FM5GaBEBUy51jedwhIcYF9tu
         5ku721I2f/Jdml/mgGE6uVBT48FBOv/uw6O23UKr5+li7AYNPdDKb1jsXlOUv9AKI2+7
         P2pvA44x4an4f1Dex9cxYAjieYXI0j3NNTovsPQGW/glK7TGkWekzVhW/M99tCyW4HOw
         T+2pONi7qPl8uNdjcac3KtFeVHvGMJMVRbSrg1LpnjFlv/k5plTjjKqo1lXpYPnRN7gg
         6gSturYNqdZF0tm8YjSSW9SBf6crkXzmEevdJ/TJ3DzOXzB7Q+Y6jnebiU7NApCVNp5g
         ftoQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7bCE/w6LJ4skjdHI1aF0ObPUDRZc87vAfL0sz2Qzl/j/oMsaAMteYOQ9tmX3WILe+1k426AOimBAOpgql@lists.linux.dev
X-Gm-Message-State: AOJu0YxVetJPLceJBV0fR3EuQDj9Ius2hgYdiOrFZr/ueRVsTm+Cv6+k
	8pEmJvbGodpcSkqzxPXXZ1nIf5z2tLKk9DuxhAuvxkFSrghjWTnQYThG
X-Gm-Gg: ATEYQzyeaxEQQHbkbIvTKQfoCpUyozavUeUm6Ui8qq+R30oJCkoZHPY2RAHEEmmZwHP
	PHQFjpW4zikCNBShoc4YJpQBqfhTB6+qLb0mUqmirjmqljWZLTuTlbhQfA43hKT4WU9oXWvvODy
	xz68DmUKhz1sc9AhnQxzqo1fIWjxcugRt/6C9F6GrSEJv0h713uOG+fUbOawcgqKXmDf/Kr4Nlw
	xW4iQxcwDT2j7ovZrbnNriUW7eUP2gpdTh4fuGY404/O+dtmdYhJfYU9/1BwNn2+XVwFpv2GXB5
	VBmrPeA0A0g5N7vMzYS7nWFwyEzQPBIy4KykmC2BzEjzZjGgcEmgpS/nzGHsy6RnvZa7zWdwwcT
	fVJ5RaZuBHPSUVnsce54C4X7oZkPoildytz40Mh1uMcxl6RooA7yQU88BTakQAER4jCFEtHnbaK
	CvPy9Oe6iqUO9BbM+ADMO8C//wEh9bmmbvmY1TZtUht4eKP8JNcKAg5YBgD//QlhutMnJiSDJCE
	Tr9LBS+K4xl2y4=
X-Received: by 2002:a17:903:2443:b0:2ae:5127:3d55 with SMTP id d9443c01a7336-2ae6ab18e06mr9614875ad.5.1772613957289;
        Wed, 04 Mar 2026 00:45:57 -0800 (PST)
Received: from cute.. ([2405:201:31:d01f:950d:ab7d:5e5c:5244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae3d1b2c5esm122010285ad.6.2026.03.04.00.45.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 00:45:57 -0800 (PST)
From: Soham Kute <officialsohamkute@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	Soham Kute <officialsohamkute@gmail.com>
Subject: [PATCH 1/6] staging: sm750fb: hw_sm750le_de_wait: return -ETIMEDOUT on timeout
Date: Wed,  4 Mar 2026 14:15:40 +0530
Message-Id: <20260304084545.156170-2-officialsohamkute@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260304084545.156170-1-officialsohamkute@gmail.com>
References: <aaVT1mSeKrSSlrha@stanley.mountain>
 <20260304084545.156170-1-officialsohamkute@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Return -ETIMEDOUT instead of -1 when the DE engine poll loop
times out. The callers check for non-zero return value and
propagate the error code back to their callers.

Signed-off-by: Soham Kute <officialsohamkute@gmail.com>
---
 drivers/staging/sm750fb/sm750_hw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_hw.c b/drivers/staging/sm750fb/sm750_hw.c
index ce46f240cbaf..e4b6b254335e 100644
--- a/drivers/staging/sm750fb/sm750_hw.c
+++ b/drivers/staging/sm750fb/sm750_hw.c
@@ -518,7 +518,7 @@ int hw_sm750le_de_wait(void)
 			return 0;
 	}
 	/* timeout error */
-	return -1;
+	return -ETIMEDOUT;
 }
 
 int hw_sm750_de_wait(void)
@@ -536,7 +536,7 @@ int hw_sm750_de_wait(void)
 			return 0;
 	}
 	/* timeout error */
-	return -1;
+	return -ETIMEDOUT;
 }
 
 int hw_sm750_pan_display(struct lynxfb_crtc *crtc,
-- 
2.34.1

