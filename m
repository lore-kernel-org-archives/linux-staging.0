Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EEC72F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:44:35 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id n2so105628552ejy.7
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rmk90qSfuSLmAzINt8x7JaHcuQoCwpmT2qAtZaxL5BQ=;
        b=s3aSTG0QCXhLUQnIvPffbrLJw63VFz7pA7qDtBTSJhEaf1oLeFyGHHoojFQvaRMyvN
         EuaTDjOQn+MSoHH22IhwMV+NaohGXq8nPYo6ZFSBxgLtR8GiDeuq8ZF8K4waFLus3u2f
         lx8bzP118kIXBN0hI5CMTOkNpw1N52vgY9o4Ke/sUYZJVfWJ9RUSwNmL+pyifojng5jd
         GaqC8hNiTrhl2c7bhEqbF9tIA4QOi4SkiYHvzrMzYMicL9oSA0AvrnO1e32blduZPdMb
         k96furf3xoYw8TPQSvWfXeHIcH1Srcp0iu7J8v0dKrjPpuaEb+GLcd4YeT7n/AdL58NH
         o5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rmk90qSfuSLmAzINt8x7JaHcuQoCwpmT2qAtZaxL5BQ=;
        b=cps7Kjoi/0KfB/Jih7SCEpd0zRMrNcFS3aCEuohMEfJJ+os9YA35jvHj4MEHgbeoRQ
         c7btduYRMC+kZdez9EYKTGsHoc2mWtze+rFN8C9qFnpZuwVQp4giplW321xZml9mY2MX
         2xUOUAcTUFJK78UGSL7kxsbxyAykwgSvFdXa8jSInnmOtFma3BnlaMeeG9frJ6ouex6R
         kLG54A3jvXJFKHlUgA2ZTEWvdn3nFFo8hANUsiKQN9KfY2pQ1Z7GwuCYbsCqX4tVNrsf
         0A3SXLOnvEt+mxvbfi0XAuejomn5HUYH23KD6CfOGu2WG3Pm3YwBTeksKPlTTfA6bWMs
         UTLg==
X-Gm-Message-State: AOAM532PS8gMV4Ynga+0E+eOq6Gk9Tl+T82Gmk5hyhQzXTDefXrRfLUW
	bvNCkLJOoWYdIh6+g+59JHg=
X-Google-Smtp-Source: ABdhPJxP2uzEyrMyryvwcFoCOVH3SZ2waILD9TL0WuyEqtvtj0H3mnyYgBT4N/cTptAzFIaI4BtYXA==
X-Received: by 2002:a17:906:5855:: with SMTP id h21mr4844697ejs.522.1619793874161;
        Fri, 30 Apr 2021 07:44:34 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id bh14sm2065976ejb.104.2021.04.30.07.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:44:33 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/43] staging: rtl8723bs: remove unused ODM_dbg_enter
Date: Fri, 30 Apr 2021 16:43:43 +0200
Message-Id: <9e3c2dc5d9f4005ca44d20e12c8278874c1c9e91.1619793405.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619793405.git.fabioaiuto83@gmail.com>
References: <cover.1619793405.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused ODM_dbg_enter macro definition.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_debug.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_debug.h b/drivers/staging/rtl8723bs/hal/odm_debug.h
index cd68c583699a..7c9a87fb8e51 100644
--- a/drivers/staging/rtl8723bs/hal/odm_debug.h
+++ b/drivers/staging/rtl8723bs/hal/odm_debug.h
@@ -97,7 +97,6 @@
 
 #if DBG
 #else
-#define ODM_dbg_enter()					do {} while (0)
 #define ODM_dbg_exit()					do {} while (0)
 #endif
 
-- 
2.20.1

