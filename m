Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0167C1171B;
	Wed, 18 Oct 2023 07:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJ1WNZmu"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-32d569e73acso5657659f8f.1;
        Wed, 18 Oct 2023 00:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697614194; x=1698218994; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v9a7EhTcnuVErJIJLl6Y1jE7dAmfjsMLP+DUxRdBE+8=;
        b=fJ1WNZmu7kfrWsK0ijclvTqnxAQD4pxz5bPmDqjAKqg99V/lJkL9LsGbLQcLHPU6HM
         6ukf8avta2pyWJgOVThBoaHtiNazwuZQ1chuXwmEKXZoLJPe+xerQtf7jMJjf/xJcVxl
         SbzVZ0Uf7EIE3M6Jrr9+zrhYn0H12He2SDl9K6sNLas11qc0Rqrrjwjn9ymdzjwxeZSe
         VR4aR7tgdiGdhqn2TD4ZgIz2bTvLwh8ZyEdGepGkgJMBeI5UgirD8uadSoP5VFFlUTys
         pX1m7HQkBLn2CEN694WHGqY0pN6tHPLbXKzbI39rOBKfWZ9Z8PQC00YovqfeNYkONgU4
         f7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697614194; x=1698218994;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v9a7EhTcnuVErJIJLl6Y1jE7dAmfjsMLP+DUxRdBE+8=;
        b=oc6JaLl7TvaqeprhhOUNEbE2tMSNHanojbl1blVDpgpIInXhKX20Po9bpfv0ZqxdSk
         3DFeNjxw3QRoXgRm8AT/Xhx2tZnzgZUUbN/9dhMH1YuCu3BiGpkE3RAXOTO7+54oAzZv
         cT+I8M4yYIFTMQBSJSKXGgHQeH6iGqj2s8KQphGtEhzUawWJlJ79BrUVjCy/y8a4LWXu
         KvzLZBC23wKkL0c+UHbNaMp9TKn8sscwkVqogd5N73F239dFGpCJg7rBSGa2apE/P9EJ
         IPjNTk+SGfp3aXaRI8xZ1IXqV8Yf/TFoHwL6+5I7HRC/QA31rnKNyKawDGqxu+LzQTgH
         7+tg==
X-Gm-Message-State: AOJu0YyRvRtLVEzmpcQaY755AFjX34+GNP34XLL4Pmpxwe0gslzVeuHR
	4abilXte6Yr0uKxrtdpWBDPcYNQ3U2OSPQ==
X-Google-Smtp-Source: AGHT+IHIco7uXA0ujhajo5mzcqn0yCAOoYZMKn1q9reSjX91mlhmCR2Fy6h7OFmivNokbx0NI+Z/lg==
X-Received: by 2002:adf:fd10:0:b0:31f:ea18:6f6b with SMTP id e16-20020adffd10000000b0031fea186f6bmr3745788wrr.19.1697614193839;
        Wed, 18 Oct 2023 00:29:53 -0700 (PDT)
Received: from lab-ubuntu ([41.90.71.30])
        by smtp.gmail.com with ESMTPSA id j17-20020a5d5651000000b0032d8f075810sm1441518wrw.10.2023.10.18.00.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 00:29:53 -0700 (PDT)
Date: Wed, 18 Oct 2023 10:29:51 +0300
From: Calvince Otieno <calvncce@gmail.com>
To: gustavo@embeddedor.com, outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Julia Lawall <julia.lawall@inria.fr>, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: vme_user: replace strcpy with strscpy
Message-ID: <ZS+Jb2rQWbOIIQ42@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Checkpatch suggests using strscpy() instead of strncpy().

The advantages of strscpy() are that it always adds a NUL terminator
and prevents read overflows if the source string is not properly
terminated. One potential disadvantage is that it doesn't zero pad the
string like strncpy() does.

In this code, strscpy() and strncpy() are equivalent and do not affect
runtime behavior. strscpy() simply copies the known string value of the
variable driver_name into the fake_bridge->name variable, which also
has a fixed size.

While using strscpy() does not address any bugs, it is considered a better
practice and aligns with checkpatch recommendations.

Signed-off-by: Calvince Otieno <calvncce@gmail.com>
---
 drivers/staging/vme_user/vme_fake.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index 0e02c194298d..09b05861017a 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -67,6 +67,7 @@ struct fake_driver {
 	unsigned long long lm_base;
 	u32 lm_aspace;
 	u32 lm_cycle;
+
 	void (*lm_callback[4])(void *);
 	void *lm_data[4];
 	struct tasklet_struct int_tasklet;
@@ -1091,7 +1092,7 @@ static int __init fake_init(void)
 	tasklet_init(&fake_device->int_tasklet, fake_VIRQ_tasklet,
 		     (unsigned long)fake_bridge);
 
-	strcpy(fake_bridge->name, driver_name);
+	strscpy(fake_bridge->name, driver_name, sizeof(fake_bridge->name))
 
 	/* Add master windows to list */
 	INIT_LIST_HEAD(&fake_bridge->master_resources);
-- 
2.34.1

