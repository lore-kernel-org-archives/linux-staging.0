Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7602149C69
	for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 15:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718291865; cv=none; b=PCywIYZSM7Q14s5Kig5lMfJwLBGZKk0+6+HvVwa2LqlRda8t+L7WtBA89XhztEd7+YnAWxyjJTHqMdWTwh43QMTEsAV8jtNiQHnMW2c/MmwbvCE/H8+8ISsl5X3LSrOT1z89HD7Bs5pu8v83d2l989GiqD7Ka410jWQswyo12jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718291865; c=relaxed/simple;
	bh=jdW7r0DvMXZ+6bD8HOFgHdxMq3SFo3mD1pj8POZ4qAw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oxewb+4rh14zISJ1dX/1wEiCTiLOObn1B614ml8gEkp5KB7yCDuzZK42YSVK0zAr1LJrYvYC+2/PiK/GXCdKXrIe47hT2OcUu5niA0JfW3uiuMDiZ3JIDv1DHnInRybehk2eIflyd8padAO5hYjDg6JjNiikjXuJUigUcRfC1bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N+ed2qpt; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N+ed2qpt"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-57c7ec8f1fcso1269506a12.0
        for <linux-staging@lists.linux.dev>; Thu, 13 Jun 2024 08:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718291862; x=1718896662; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/u+4y22eKBX5WD/mmlsZLnRYhcILJ7Rc9DRw3I8loPM=;
        b=N+ed2qptG5KsZHudFUG3oxkZUIP+cNSQpziNKdeIKSBCro6nJIpezz42ggF7jX6ggO
         ckBHuyov57fQNWCQqkZ6RuRNaaZ4T+/h/PJHdcBWKYq6MBnMgVIJRJIFBC10UBMjK5tL
         TH4jBkSBewaiixVgnYeflk2nsPiMOc5zqQDzPcbhTR3Q7+rW3KMNPCev3xoSQz0QwuWm
         OMH/SLKdXq7RxISIPaloiJoZGAt4OiDWlF2EBilex6h6OJn+GGJWsREGoFtp0Hwn56og
         CVEoNsrGvMAlg5kO034JE9izegHjP6bXpOi0ALMM4s4ULBprYR2cLoT0XYIZJUSJv4zU
         294w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718291862; x=1718896662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/u+4y22eKBX5WD/mmlsZLnRYhcILJ7Rc9DRw3I8loPM=;
        b=GM7jwoClAphJME1LVCIObr6P76LmBmd7MOYSIRrt1l4o7XBNcDdCfJ7dV7EdxyI+w9
         e+dyzt0h7tq7zUOKs4HZk8HzFx9C1roPYYcPCByoozyMzGtll4vRB26n5c/pDE+m2O4y
         eh9TuttgtiwNG0P06HCRZcRRGF1uzRSHMCJ3AetS5xr84754nKBz2wj/neL5Fc2AD2xN
         la3tqt3O/7kWvoGKt01m6936qRzTrkGaiyAv7gdkORsdcJ+/G4ZP1yr8uMqaT5cM33IO
         spF7vu6C6GQmPz585myhUYeuKgCA4fC8+5sEwdQB0rGbkjBCPU3lYpqq3ubYsmK8XqQZ
         4y3g==
X-Forwarded-Encrypted: i=1; AJvYcCXdbCaClNrJ1c7fHlmB5W5vojTKcMQEN4ddjmzHyFK9X5/zn6wuLGhKuHdQXIACJY8hBMZXLIa4A4QsDfUqvzwr69+LFohF7TbDV8tBew==
X-Gm-Message-State: AOJu0YyNREAhIRH7LgDKvUAT6ljgroi8NHDRen08lmhSoba+6Y6nAem9
	E1E2GNMPjEOYZoi8ucypRlbqjlCrJEjuZUCQ3E2iRZZuHySvU9cwtj9hamgZR3k=
X-Google-Smtp-Source: AGHT+IEepVCor/QDkO/5TMDgOqVVUt7KvHUZp/gpcRZ5qehhECfUzrLx8B92fl9Owj0ID6fAZFsSnQ==
X-Received: by 2002:a17:906:605:b0:a6e:fe30:5c78 with SMTP id a640c23a62f3a-a6f60d1e040mr5811466b.19.1718291862052;
        Thu, 13 Jun 2024 08:17:42 -0700 (PDT)
Received: from localhost.localdomain ([31.120.167.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36076515a80sm1856978f8f.76.2024.06.13.08.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 08:17:41 -0700 (PDT)
From: Teddy Engel <engel.teddy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Teddy Engel <engel.teddy@gmail.com>
Subject: [PATCH 3/6] staging: rtl8192e: Remove unused constant WA_IOT_TH_VAL
Date: Thu, 13 Jun 2024 16:16:34 +0100
Message-Id: <435144fee61f0432af269e3cf386d984a2f218c4.1718291024.git.engel.teddy@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1718291024.git.engel.teddy@gmail.com>
References: <cover.1718291024.git.engel.teddy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused constant.

Signed-off-by: Teddy Engel <engel.teddy@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
index 84e673452be4..863af8ef9f94 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.h
@@ -33,8 +33,6 @@
 #define		RATE_ADAPTIVE_TH_LOW_40M		10
 #define		VERY_LOW_RSSI				15
 
-#define		WA_IOT_TH_VAL				25
-
 #define		E_FOR_TX_POWER_TRACK	       300
 #define		TX_POWER_NEAR_FIELD_THRESH_HIGH		68
 #define		TX_POWER_NEAR_FIELD_THRESH_LOW		62
-- 
2.39.2

