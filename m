Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD1E7EC;
	Mon, 18 Apr 2022 16:31:42 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id k14so19799929pga.0;
        Mon, 18 Apr 2022 09:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=J5XRVN0rYoKShdUkWHsZOX7pTFc2v1hH6PY/aOGhz2o=;
        b=opDlbbLXpfliyT0hxegO0lHHNJUhKN18viHaTHcXInOVtr00j2D8OJFj2gl2cJlr82
         f29Iyvsxr7+Q9zFvxuyMO9eQsR30Xr7MVxSFP6w3KA9acvyoS+j3brCpMYzkTI2x1lKQ
         VtEloOT+ljzj32WU7UF+mVHgUTggpIEl9WhX6gBQqLyTCBW5PFTKDwJv53+zsuWPc9Ot
         Wl2fCmF04oy43KKL6oGBP0xwv7LM1xKPJmKHDrWnNsXnyC4WSeWN3+WMBmUJc+HyV9s6
         wqtDbUp6BzP6OG0jFXWUEjZa/mgfOw7FBLEeSj0PoaqgIKC38IOmzaIR8fzRjP7v8Vbl
         cSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J5XRVN0rYoKShdUkWHsZOX7pTFc2v1hH6PY/aOGhz2o=;
        b=cyJdAe8h+C1N7RpTJNksNafv4r6bsbSRdtZoCENbUags5QcSalNYb2sl/58UruCvNk
         cqdYhfsspQCPJQoC2WymJK1yw+CmYRKFTzHGfJCg2RUYAmydX2N37slqmF/pT+9TthrU
         vU7mkdTMcbLxV8Aad0AtHXm+8o72iOsJHJrUJdxK2QbnKl+QP7d14aD9rlSp+0kwXyGL
         fUpHz8+o1wqbTX0Uc2x9izwjMzZASfUFDqe3gYfKZQcPYIIyiawzli/y2aN/hW5BdHVx
         4L8jUcYOE2e6C5uzIrdWUDrVg308Ws+rzlnN3GF5xZ/uZNAhYZqKlLL4PBlvE3cNlpO/
         YYnw==
X-Gm-Message-State: AOAM532RpU6QJKbsU0JQXlb/ydOfLN5ruKOTr6m2diu8+/rDK9egpouD
	eg0jldO0xPKgDTPD0lF4tYE=
X-Google-Smtp-Source: ABdhPJxpEjB37dv3sT9B386rQBREHhLwteTv4M1Ps9RbqbppqC2G/I/1zlBh9L5z4QcXHZeRHi4kWA==
X-Received: by 2002:a65:4c4e:0:b0:39d:21c4:2381 with SMTP id l14-20020a654c4e000000b0039d21c42381mr10912664pgr.566.1650299502320;
        Mon, 18 Apr 2022 09:31:42 -0700 (PDT)
Received: from aliyar-HP-Laptop-15-da1xxx.domain.name ([14.139.241.88])
        by smtp.gmail.com with ESMTPSA id h18-20020a63c012000000b0039cc3c323f7sm13295602pgg.33.2022.04.18.09.31.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 09:31:41 -0700 (PDT)
From: Aliya Rahmani <aliyarahmani786@gmail.com>
To: clabbe@baylibre.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aliya Rahmani <aliyarahmani786@gmail.com>
Subject: [PATCH v2 3/3] staging: media: zoran: add parentheses on macro parameter
Date: Mon, 18 Apr 2022 21:52:50 +0530
Message-Id: <20220418162244.15346-4-aliyarahmani786@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418162244.15346-1-aliyarahmani786@gmail.com>
References: <20220418162244.15346-1-aliyarahmani786@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes checkpatch warnings of precedence issues. Add parentheses
around macro argument 'num'.

Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>
---
 drivers/staging/media/zoran/videocodec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/zoran/videocodec.c b/drivers/staging/media/zoran/videocodec.c
index 19732a47c8bd..925f90fd5885 100644
--- a/drivers/staging/media/zoran/videocodec.c
+++ b/drivers/staging/media/zoran/videocodec.c
@@ -22,7 +22,7 @@ MODULE_PARM_DESC(videocodec_debug, "Debug level (0-4)");
 
 #define dprintk(num, format, args...) \
 	do { \
-		if (videocodec_debug >= num) \
+		if (videocodec_debug >= (num)) \
 			printk(format, ##args); \
 	} while (0)
 
-- 
2.25.1

