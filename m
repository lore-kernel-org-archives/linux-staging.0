Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C4D3FC7
	for <linux-staging@lists.linux.dev>; Sat,  2 Oct 2021 23:18:22 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id r2so12921421pgl.10
        for <linux-staging@lists.linux.dev>; Sat, 02 Oct 2021 16:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amikom.ac.id; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+wqFw2hPWBzL/6wM3Yf8mXadq/oh65HiCzw31MXRMl8=;
        b=OfAOnhIwRrNibniln0v2IJlgQDSmjKkJSNE9x8mt3I93ywrs5vpLKcof0GwnZN7NQ2
         MumgkJSj8/MPnuCF2xzGVpnhb8LEvyrZ1kUg97YKK9nGyblOamZy5JnnhXjJPHUzD7P1
         TXSASkuramWlAl4at48FmI5RyhARXm8qMlnifYqMGUFwxrQ06Iwuyl7WPfbtfqIruSSI
         nznkN1r3hm6siDl3Us4TX4aGhCOaEeWuL5Ea1vyj0DcrJQSZuy7NJdJ/OccaDawELS55
         yljQkHuhkYEn/2a5nbsOBvjdo5Asuq1TQUsquwoqTef6t1y4vrssbRdyKMrEyFOKN+yz
         cGYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+wqFw2hPWBzL/6wM3Yf8mXadq/oh65HiCzw31MXRMl8=;
        b=7qq1nmUCvxTu6CRQYR5QtfCw6SFaVJdAorzAdQHJyFjjHqJm67Tbes8xmKH2rrJh/d
         jzqqCZ/yx14aotfOpwT5wMLBcNfr5Hi7v2FFwROCcldrZslRXoFP3d6vu/s1ixErpTnW
         eOn1sn/8V9f7I20nDIWkUE0Z2G/+3SghaOvSYyYVKfNWDatdP79OoN/JlTnLzMutzpkl
         F3rlhpcgS48xIg/W00wXtKb31DOAI51fKSGE/ukCFv+02k8wrQeS87dc5wxtdvcLgQBJ
         C7emhk8AOJrnXa6XB3aN7X59yZtk9Z31YGkCE9mGO0F4vj6O+8E4DN29jN9nypnqRcNw
         52HQ==
X-Gm-Message-State: AOAM532KhjtbmPStxnV19PvqE+viBkt8JBEJI80FdRo0LVUQoMEF7fHz
	tFcHN7UePZVioP+UISvtGUpWSg==
X-Google-Smtp-Source: ABdhPJyfQC43Mwjmccd3TpJmj5a3tTym10SC7M5P7R8+ogHeLCSWZ45GTq0SHoyTXDhRrO44jZKARA==
X-Received: by 2002:a05:6a00:98b:b0:44b:df34:c17b with SMTP id u11-20020a056a00098b00b0044bdf34c17bmr17470228pfg.34.1633216702038;
        Sat, 02 Oct 2021 16:18:22 -0700 (PDT)
Received: from integral.. ([182.2.37.211])
        by smtp.gmail.com with ESMTPSA id k17sm5928989pfk.16.2021.10.02.16.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Oct 2021 16:18:21 -0700 (PDT)
From: Ammar Faizi <ammar.faizi@students.amikom.ac.id>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Ammar Faizi <ammar.faizi@students.amikom.ac.id>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bedirhan KURT <windowz414@gnuweeb.org>
Subject: [PATCH] media: atomisp: fix `-Werror=return-type`
Date: Sun,  3 Oct 2021 06:17:23 +0700
Message-Id: <20211002231723.29019-1-ammar.faizi@students.amikom.ac.id>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Bedirhan reported build error:
```
  drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c: In function ‘input_system_configure_channel_sensor’:
  drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:1649:1: error: control reaches end of non-void function [-Werror=return-type]
   1649 | }
        | ^
  cc1: some warnings being treated as errors
  make[4]: *** [scripts/Makefile.build:277: drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.o] Error 1
  make[3]: *** [scripts/Makefile.build:540: drivers/staging/media/atomisp] Error 2
  make[2]: *** [scripts/Makefile.build:540: drivers/staging/media] Error 2
  make[1]: *** [scripts/Makefile.build:540: drivers/staging] Error 2
  make: *** [Makefile:1868: drivers] Error 2
```

Commit 264f590899146baa19e0ab5689e55fadbc292333 ("media: atomisp:
remove useless returns") incorrectly removed a required return results
in the above build error. Reinstate it.

Cc: Pavel Skripkin <paskripkin@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org
Cc: linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Reported-by: Bedirhan KURT <windowz414@gnuweeb.org>
Fixes: 264f590899146baa19e0ab5689e55fadbc292333 ("media: atomisp: remove useless returns")
Signed-off-by: Ammar Faizi <ammar.faizi@students.amikom.ac.id>
---
 .../media/atomisp/pci/hive_isp_css_common/host/input_system.c    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index 8e085dda0c18..1bd917e81743 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -1646,6 +1646,7 @@ static input_system_err_t input_system_configure_channel_sensor(
 	default:
 		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
 	}
+	return INPUT_SYSTEM_ERR_NO_ERROR;
 }
 
 // Test flags and set structure.
-- 
2.30.2

