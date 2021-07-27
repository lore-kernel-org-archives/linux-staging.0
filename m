Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC21C72
	for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 19:20:14 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id l19so1315183pjz.0
        for <linux-staging@lists.linux.dev>; Tue, 27 Jul 2021 12:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HHziLjjqyxefZtcR6RR5sEm7JWKE/3FDMlOkhJ3+ZIE=;
        b=AsAbov8jJTY0LdVJ0IqoUjLzlw5C3IcPG/I6sbaWk+w9qzgN3F4np8CJDSJV+LLxpQ
         w0MhhB7Gsq00qedbp7PrRPgAXg6OFC2uvywphjGl1/haXG/j7dqR/Nv1nSkVvKkdp3mD
         vQO2e59SdJSoKzwVkVaNq2G6aJ2Lk56ruFLMerIlri/KdJEpP8IHpEGq53My0m+2v4Qr
         gzCr/5xcpjtmkSt+kTY+dpA8fp7lLns92x/38RDIFOyf5YWxFqawZ+xCCKvFfv1PdTUn
         ARI2L3imRmsltR7QRL/dM+QQ8uyFPNupVWzP6gsidFe8xGVc+s/RKI7N9Rk8kTaWmZcF
         b74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HHziLjjqyxefZtcR6RR5sEm7JWKE/3FDMlOkhJ3+ZIE=;
        b=NbHULj1qApf1dIK5UM2SXSkmsMqDSJyOd8Qo/fKe42jy9PFhIpw58/PuWJQX0gvN2A
         w+lHzMZatU8Ru2TZauV3r2KP7xmmwIgEhsR/H/tcPm48cXO4H8v1go1Ju9pXqvuNpNM8
         AolNBPVmyj4sOb08ipuwIFBdo4g9WT3t4zTtMs7ZMdpjzvA7BeETrXgpJy2o1C5B6tCx
         UfQVR4MdeyEl3EIooGOPNXUsy5WL9dOniRkpVr7dQFMsKgA5Pj6W9p4ex/qDXPeIaGhM
         WF9ZKbWat/p/Hj/eVTmNK/fV3P0ioYdNzZNsoJhEXAM6VWSlEUOipkTyz1VLLab8UwfK
         DSBQ==
X-Gm-Message-State: AOAM533unWMMv+u5NfjyaeEGc/kQEQtKoLEooX2ZWxnB0G0+c1oNVzcP
	3n6WM/X6UzBYKHBZ5KiW8ZE=
X-Google-Smtp-Source: ABdhPJzedmnDBl+aFoSqdhhSe5Uh+m5JBpXhH4WG7Z/970SgV40K1r31Voq+PQE7Z0DJvsYoA2B12Q==
X-Received: by 2002:a17:902:9a92:b029:127:8aab:6a46 with SMTP id w18-20020a1709029a92b02901278aab6a46mr20556299plp.8.1627413614279;
        Tue, 27 Jul 2021 12:20:14 -0700 (PDT)
Received: from localhost.localdomain ([2402:e280:2130:198:9b25:1cfb:9ff3:2a8f])
        by smtp.gmail.com with ESMTPSA id f7sm4317096pfc.111.2021.07.27.12.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jul 2021 12:20:14 -0700 (PDT)
From: Benjamin Philip <benjamin.philip495@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Benjamin Philip <benjamin.philip495@gmail.com>
Subject: [PATCH 2/4] staging: sm750fb: Rename oCursor to o_cursor in lynxfb_crtc
Date: Wed, 28 Jul 2021 00:49:51 +0530
Message-Id: <aec911b055687892897feb4899644b9463245f1e.1627413010.git.benjamin.philip495@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1627413010.git.benjamin.philip495@gmail.com>
References: <cover.1627413010.git.benjamin.philip495@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The struct lynxfb_crtc has a member named oCursor. This name is
CamelCase and is frowned upon. This commit renames it to o_cursor
and makes the necessary changes for the module to build.

This change also fixes the following checkpatch CHECK:

CHECK: Avoid CamelCase: <oCursor>
137: FILE: sm750.h:137:
+	int oCursor; /* cursor address offset in vidmem */

Signed-off-by: Benjamin Philip <benjamin.philip495@gmail.com>
---
 drivers/staging/sm750fb/sm750.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/sm750.h b/drivers/staging/sm750fb/sm750.h
index 08c1048be541..4093d5e898c6 100644
--- a/drivers/staging/sm750fb/sm750.h
+++ b/drivers/staging/sm750fb/sm750.h
@@ -134,7 +134,7 @@ struct lynx_cursor {
 struct lynxfb_crtc {
 	unsigned char __iomem *vCursor; /* virtual address of cursor */
 	unsigned char __iomem *vScreen; /* virtual address of on_screen */
-	int oCursor; /* cursor address offset in vidmem */
+	int o_cursor; /* cursor address offset in vidmem */
 	int o_screen; /* onscreen address offset in vidmem */
 	int channel;/* which channel this crtc stands for*/
 	resource_size_t vidmem_size;/* this view's video memory max size */
-- 
2.31.1

