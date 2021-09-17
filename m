Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B242FB6
	for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 23:31:04 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id u19-20020a7bc053000000b002f8d045b2caso7909508wmc.1
        for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 16:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ytz3TTUDyfzI8gNQwgvUtpk8fGA2obQJcsvCizPAUI0=;
        b=SlufOYExlj4aZRxm2EmVcnoekJOhvXGIiWFEw/AhjCCi+Asg6qjcKCY/9RvWSp7OMs
         ajrExtLazBb37tIw71lQvZx65YfJs2QSeTvZOLLIT8FrlI/umyztBPjbi8F5WVmlVj9y
         u/J0zM/97ZIK3YA/mY0wc4Dfy2hz90NmBsyBGu0PDvItCMrWoGgUYs0O1DBBMOhVu2uT
         gfEX8RVXOqsEiKoLAcMdiQjfRleZaQrmRY/46XNj6Waxs+vais8aojJIa8ufWb1H/nuN
         WnyY6qkAm9ubfDggvuqdkJJxt06n70q1nZo8PP0AYKTw1jnk0M1x7IfPHBbT/Sig7iVT
         NvZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ytz3TTUDyfzI8gNQwgvUtpk8fGA2obQJcsvCizPAUI0=;
        b=P/vyhEDXHewsbwbY6+vb3vVFIlSi1D7f7ezP7iH6aUji+KGW4sipz4pm0xb4N80ERK
         jN5XvDzvDRCcfkCPyLe5AoqNxRlZSJ8vqMbP3TR7FbShNz3avxTyelPWPk4MIqKcUdC6
         yg4lJp7VLK5RBbcRtY9qumuyV1u3X6/3bEnskd2uEwpq7bCSf7dRdul5KxK9d1nxYB2Y
         k0Hb3NuwmtvxfJEQxqQP82xd0ogQPvGb6MqbCIxTNmn9dtg+EUg3Z1vjUzMNiVtsOhj7
         96MGk0GVrY5Ov6/ckRMcNJkA3vuk+p7vNhgU7LWxPNedxL2MiHodDunaiifsSxqmjkfz
         o9Sg==
X-Gm-Message-State: AOAM532OMwaihBR48p2zKlzQSQJnN5Hs0WBdQZRqU9bNL/3m3wF+rWyF
	jvtPbbx5bD8OBl1xXEATBBg=
X-Google-Smtp-Source: ABdhPJxa3r+BxkjaWLhEHS+aBJft4ZYR2bF/xhlw3KgQspNUhQu6UnERBA/5oNirTaR6yBglcuf7mg==
X-Received: by 2002:a05:600c:17d0:: with SMTP id y16mr18055721wmo.41.1631921463144;
        Fri, 17 Sep 2021 16:31:03 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id w9sm7523148wmc.19.2021.09.17.16.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 16:31:02 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 02/12] staging: r8188eu: remove unused macros from odm_interface.h
Date: Sat, 18 Sep 2021 01:30:38 +0200
Message-Id: <20210917233048.31677-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210917233048.31677-1-straube.linux@gmail.com>
References: <20210917233048.31677-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused macros from odm_interface.h.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/odm_interface.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/r8188eu/include/odm_interface.h b/drivers/staging/r8188eu/include/odm_interface.h
index efc2ca069a3d..d3e46b2a4cea 100644
--- a/drivers/staging/r8188eu/include/odm_interface.h
+++ b/drivers/staging/r8188eu/include/odm_interface.h
@@ -4,11 +4,6 @@
 #ifndef	__ODM_INTERFACE_H__
 #define __ODM_INTERFACE_H__
 
-#define _reg_all(_name)			ODM_##_name
-#define _reg_ic(_name, _ic)		ODM_##_name##_ic
-#define _bit_all(_name)			BIT_##_name
-#define _bit_ic(_name, _ic)		BIT_##_name##_ic
-
 #define _reg_11N(_name)			ODM_REG_##_name##_11N
 #define _reg_11AC(_name)		ODM_REG_##_name##_11AC
 #define _bit_11N(_name)			ODM_BIT_##_name##_11N
-- 
2.33.0

