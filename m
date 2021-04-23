Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA4C2FA1
	for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 14:59:49 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id c4so9803172wrt.8
        for <linux-staging@lists.linux.dev>; Fri, 23 Apr 2021 07:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QwuVZ4DerzLqtKGB6gfK45URd5Glj/AwHPmshqzuvhg=;
        b=FuP3OWHVV1DneN7hb4YOknJaPgA9ztx3r+mAPwQCIxaRdzx3BEaS23NZIQj6Ux49Fx
         3gF6luN1Wm0GuNCdhnc/SQL0Kk8mJ3d3PCn3IDQnwKUvEbBQA0gVRenuPn1A5EVUSjN/
         ITy0JrDme6fE25DGW2QFNzhkSglFiWGcqEQV9gQzQrNqB+eoiUPWTu25G2r5gh7A8W/N
         3xWdeA199K2CJbBTG+4M6xreJfnHdZb7kiCQFJFA5sBWDqYfY4aAf+Dn+tN9kjoav6DM
         uKr6tbN1GgKOxEVzAYkaSA7Zt2bBHaxbkpEL6xohsyes0jRy3GpJr9mRMVLmD8sZ9yg4
         762Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QwuVZ4DerzLqtKGB6gfK45URd5Glj/AwHPmshqzuvhg=;
        b=iClSQvmupix0J5aUj8+FxB8PKiGxIjF9VTyZ31R6wCclCLBreHHIVlmwLc8FzSn0gx
         1LRmaaovU6ZG90E+pQ4q/1KFWr/nb7NTqZj7VNO8ms4eA8xU1MkIvhp+a17wGBaTvtPm
         O6OwhLuOA3auYthMmagHzETHdfL1gD8k+2PrgUTHKiumc5NEtSBjcGBN0d+LIT1KaZSr
         14Yvs0KzTQz/JCaNv1B0lCfWZc59Sq3SGkjKG4iFJEphgJRq2g6AxGeiRfXarUCAoDJb
         Tvbwjf3ZmafWpHSbeH09nMrhJplKmv5IWGtblHPaL1WZdVLQICsF3CmQMCIUMy8dKuf/
         ejcA==
X-Gm-Message-State: AOAM533n1nl2aH5cvlRIP+Ki+rHsdR6WQnUh4wQNixh4FTPQIuAxzBUN
	S0cPGYwugCpPHY7WlRhzVP6xKDmfdgw=
X-Google-Smtp-Source: ABdhPJw7m5Uk7QuZr6gJaIZZxkfeuoWmffpzdFt4MaAEMS0Q89CxWh//Jx3jXgUU/VP/GSYbK6Qd0w==
X-Received: by 2002:adf:f0cc:: with SMTP id x12mr5403580wro.16.1619189988138;
        Fri, 23 Apr 2021 07:59:48 -0700 (PDT)
Received: from agape ([5.171.72.99])
        by smtp.gmail.com with ESMTPSA id l5sm8062466wmh.0.2021.04.23.07.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:59:47 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 40/49] staging: rtl8723bs: remove unused _module_mp_ def
Date: Fri, 23 Apr 2021 16:58:31 +0200
Message-Id: <c090a96bade97cde0dbcae6aadfa46b21acecf36.1619189489.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619189489.git.fabioaiuto83@gmail.com>
References: <cover.1619189489.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused _module_mp_ def.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_debug.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_debug.h b/drivers/staging/rtl8723bs/include/rtw_debug.h
index 3e391a23ac8f..261317b07635 100644
--- a/drivers/staging/rtl8723bs/include/rtw_debug.h
+++ b/drivers/staging/rtl8723bs/include/rtw_debug.h
@@ -7,7 +7,6 @@
 #ifndef __RTW_DEBUG_H__
 #define __RTW_DEBUG_H__
 
-#define _module_mp_			BIT(23)
 #define _module_hci_ops_os_c_			BIT(24)
 #define _module_rtl871x_ioctl_os_c		BIT(25)
 #define _module_rtl8712_cmd_c_		BIT(26)
-- 
2.20.1

