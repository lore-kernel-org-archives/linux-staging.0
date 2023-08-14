Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FA34CA46
	for <linux-staging@lists.linux.dev>; Mon, 14 Aug 2023 21:22:29 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6bd0c953fd9so3307882a34.3
        for <linux-staging@lists.linux.dev>; Mon, 14 Aug 2023 14:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692048148; x=1692652948;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ETq6NHQzE5uYgQSsvIEmQ3cUO0JE3BC558iMTdYIco=;
        b=KKDCAMKrj4HWX4q8djHjfs8r1N4vuq0/bASY8fNi1pTur2ev2H1LAq8Rsp5/Ns0MW6
         CT/ZQOdZMU4t3TKUH/cKWwBKezPjuGVtV+6D0unEryohggYSLhYlQ2nanj+GdRuvFT9i
         WLrFt/lZifQC+1NwbE8xn8ZcNqZkl4Twe/Hy2iroGrSQIiqBMDbjPkwvZQyCU481K2Ko
         EGLg26Nse8Q6Ll/MeV3T4JZvm7nP5NWPL0hfODuNiYab9zDdHaeM17IZF0zMhpXhDzfS
         CKqLgPvDMTo1ZKmpG7Jydut9ZsT0uJ8LKpSn4TNEfU3qeMVeWH2o+lrWdGa6pJo6wGFK
         IUhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692048148; x=1692652948;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ETq6NHQzE5uYgQSsvIEmQ3cUO0JE3BC558iMTdYIco=;
        b=TlxuIf/E9fd3r87Qn0Jvh0F0T4vuJNTSVuOPwIspXoljb2C/ZpxouJdK31ArciQWkA
         O9ncqRu/EemtgqR/IusgobvyLmIi/Mga5wr1LhAYthX0wQev1ObQb+RnkXx5Wu3wt8tf
         7GJFbETWbceEAsh+Yd3Oa3ry+ANhfslRZCd9UsrhD0qwyrzgXyEU7hyCPq5a+XLSwpsZ
         fVZyV0BVaiDmjBgaugFkskVJYdphAtpqnQ0lptOVvwUf9kTQ4gAJc8phlyzwqYWvATFt
         bHzT23dljZyvfWLv2DqV7QQyLuoUD22HvcLroN/PA/TX7OxKzq5oomnUi4L0Zy+iELHc
         aIMg==
X-Gm-Message-State: AOJu0YzKOX085R7w8oLxXi5fWNNNY9BUxVALB5AtfHwuqWpUYwfW2ufG
	HundAepVE68zTrpEdFoYnb65FOKQa9E=
X-Google-Smtp-Source: AGHT+IHXuYthpQCDDePJ4+6LTcXnA+JZBl7rvir5Z2KZuy1pxO46fKlsTyaSzptXfQW3gP9gwpW2WQ==
X-Received: by 2002:a9d:6ac2:0:b0:6b9:6276:c64c with SMTP id m2-20020a9d6ac2000000b006b96276c64cmr8493872otq.12.1692048148149;
        Mon, 14 Aug 2023 14:22:28 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:86d6:7871:f7e9:8a15:865a])
        by smtp.gmail.com with ESMTPSA id t16-20020a9d7750000000b006b9cc007e87sm4696143otl.20.2023.08.14.14.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 14:22:27 -0700 (PDT)
Date: Mon, 14 Aug 2023 18:22:22 -0300
From: Alexon Oliveira <alexondunkan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH] staging: vme_user: fix check lines should not end with a '('
Message-ID: <ZNqbDtRjGWq67lDJ@alolivei-thinkpadt480s.gru.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed all CHECK: Lines should not end with a '('
as reported by checkpatch to adhere to the Linux kernel
coding-style guidelines.

Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>
---
 drivers/staging/vme_user/vme.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index bbf82b1be9f1..d0366dd3f2b1 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -1267,9 +1267,8 @@ void vme_bus_error_handler(struct vme_bridge *bridge,
 }
 EXPORT_SYMBOL(vme_bus_error_handler);
 
-struct vme_error_handler *vme_register_error_handler(
-	struct vme_bridge *bridge, u32 aspace,
-	unsigned long long address, size_t len)
+struct vme_error_handler *vme_register_error_handler(struct vme_bridge *bridge, u32 aspace,
+						     unsigned long long address, size_t len)
 {
 	struct vme_error_handler *handler;
 
-- 
2.41.0

