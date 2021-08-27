Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE6372
	for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 10:08:20 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id u14so12596043ejf.13
        for <linux-staging@lists.linux.dev>; Fri, 27 Aug 2021 03:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jnI6ejb/F595rwEWHsmajcOOd4gHWgyU2jky3IJ0C30=;
        b=TLdSSv+5B4Hy/ngmtJnmRScp7DT3LJWmh73I41q4LoYLyyv2j7qH3lFwpQCM277/RY
         p9R/hiVUyn+Fj0nJf7zrhgFQzUfaFymQXCTmxG2l4tJxC3xTYunw8qr0OzNhkCLTfzSd
         PvJ+5m/NASO2pPNq2yyJHjzY1cPKEgD0hUMW9qDIa5abidHP/DXS4dOoOFSxJQS5k4sx
         GbElzgeZXx7jcVevBVPX9O0NKavCTQQUIm4gZ8dIbDw3EAYMa1t+UOS3PXQrPhDbEjP7
         XyZNvYNQ52q3FKkt29Ga2tqdqcuwjhoKoGCxSrc73WPAJ4YN7YrqlGPAu+O/ZaTmPHzo
         lWag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jnI6ejb/F595rwEWHsmajcOOd4gHWgyU2jky3IJ0C30=;
        b=aaoFiXeIa2Yu4d9ZSaBGyzsDbbC1NzheDSy5w61awW0n/ClEO1lCjlO9LpQo1yOB31
         dPvKNlF/YGdivEEukh/rIx0v8Eaz2K4Sw0qmuSats4VnW+KHvDl/HHEJF/yfmZqv5n7i
         PYl7NZKSY++KrnSTFXQauH9jdbzxvGsFjarDajpBLEEjrztbxy+pvjOxqEUMi3xH3MGY
         cpqBO2dK5E+rS+ce9cWeTYedugWTEZKVWeHzoUkZTHG1A0BJMHhDpP1Rirl2hwcU9oAR
         R48eJRgoLV7qkkhFBHRV6scpZizc1OoZa5XvNuvdeEiuXscJV09X+CxrEcN1G8sjtu6H
         e6kA==
X-Gm-Message-State: AOAM532S7BckMuPfUkaJTuD5y9bAGYzYTB0XaFlVc9zX8e7o7pSkkltT
	KjU+LLTKVP3Rgdzo+ve2MrA=
X-Google-Smtp-Source: ABdhPJwLTi+C6z42Pg1PbWLJak2wemc2Gm2Jjj66jUN1q4ZjVZbNw7bikUw+G5Y3o4yCpp731CdFUg==
X-Received: by 2002:a17:906:22da:: with SMTP id q26mr9146073eja.473.1630058897742;
        Fri, 27 Aug 2021 03:08:17 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id x9sm2939159edj.95.2021.08.27.03.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Aug 2021 03:08:17 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org,
	Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v3] staging: r8188eu: Provide a TODO file for this driver
Date: Fri, 27 Aug 2021 12:08:13 +0200
Message-Id: <20210827100813.18610-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide a TODO file that lists the tasks that should be carried out in
order to move this driver off drivers/staging.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

v2->v3: Added a task suggested by Dan Carpenter
<dan.carpenter@oracle.com>.
v1->v2: According to reviews by Fabio Aiuto <fabioaiuto83@gmail.com> and Greg K-H
        <gregkh@linuxfoundation.org>, remove "[] is currently in development...",
        indent and properly wrap the lines, remove the unnecessary last paragraph.

 drivers/staging/r8188eu/TODO | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 drivers/staging/r8188eu/TODO

diff --git a/drivers/staging/r8188eu/TODO b/drivers/staging/r8188eu/TODO
new file mode 100644
index 000000000000..98f918480990
--- /dev/null
+++ b/drivers/staging/r8188eu/TODO
@@ -0,0 +1,13 @@
+To-do list:
+
+* Correct the coding style according to Linux guidelines; please read the document
+  at https://www.kernel.org/doc/html/latest/process/coding-style.html.
+* Remove unnecessary debugging/printing macros; for those that are still needed
+  use the proper kernel API (pr_debug(), dev_dbg(), netdev_dbg()).
+* Remove dead code such as unusued functions, variables, fields, etc..
+* Use in-kernel API and remove unnecessary wrappers where possible.
+* Fix bugs due to code that sleeps in atomic context.
+* Remove the HAL layer and migrate its functionality into the relevant parts of
+  the driver.
+* Switch to use LIB80211.
+* Switch to use MAC80211.
-- 
2.32.0

