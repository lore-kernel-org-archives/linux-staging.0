Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6780D8472
	for <linux-staging@lists.linux.dev>; Tue, 22 Aug 2023 08:02:27 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1bf5c314a57so12907425ad.1
        for <linux-staging@lists.linux.dev>; Tue, 22 Aug 2023 01:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692691346; x=1693296146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GHuVqZQ6eWzWGlZ3K43xXY3+GR5axkEe+E8WbhwDchs=;
        b=aNpu76vCZhA/BQGp5D9JvSshleIwRjcI0bMuCHgAKG+hB2+6j9iuUEQ8IOrqQ7UGXH
         mR7HYX3NOcBmt+JvV6JwS4OkqezRJoeLi78y/SIKUTuyz3l+e0BewAaA01aIRgMhYNY0
         +w0jj7a2ilWT2KdIXqCivGboFkul7STHaQfDAjPgjmv8CxeGolCmeYVi31bYWoK1wz2n
         awxKIRn6vsGZ0rcOjtmBGVkIV/mmeRdKQyRZvzMXxj69bWzyQQw8b/NxzwocJi7IXdTy
         kio/MXFC5O//lHnNIbpn4DMeWmXLvuOJV4aT7iqW9UO0EtM4qwN+BZs8RjBY7p2WwDiZ
         JeIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692691346; x=1693296146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GHuVqZQ6eWzWGlZ3K43xXY3+GR5axkEe+E8WbhwDchs=;
        b=HFNnb9Tb+iTqUPFQo7lQd0zjnK7qg1t7t5PnqO+NgrbMeSo2+lyenvVMQBbIX9ccSz
         NndKCG3rcMaWY2u+dvSnGopp5x+YvGTqANI9UhUUvmIixvOU6ZHwyxz4VOJ0jM2vLX6K
         bbJ6PW4UfRMtd7hMVfyxQeVKR7ZLuVNYTAe35poi+pnL87zkat9C6i3pDYLrFJ8HGbnm
         9LEWtQIfmcFh36LthwDO5mx966gVLYk5PPCr6/NQMLm/2M05BfE5YhI8W4PKEZFJKfMN
         ROvaxbW5EllwYSNVvhFABValewCfHSduAwQvQt3uRzjaNZYjA/GBWbBr68rTYCevJYdQ
         69ww==
X-Gm-Message-State: AOJu0Yx8Z+BaOKs3l4Xyaq7QEEtQghjmAAKhUeAGKmI0wpMjOSB2sIg5
	LxJ6fOiBdaFdZevurnFqhY8=
X-Google-Smtp-Source: AGHT+IF1C0krg/CMZNxa0h4RWEEaL/o1F/F9Blg+aKZTbZ19HcNAA0bakcIF1eMWrK16YWy+ksG//Q==
X-Received: by 2002:a17:902:7890:b0:1bd:d14a:7e14 with SMTP id q16-20020a170902789000b001bdd14a7e14mr6195774pll.65.1692691346525;
        Tue, 22 Aug 2023 01:02:26 -0700 (PDT)
Received: from XHD-CHAVAN-L1.amd.com ([149.199.50.128])
        by smtp.gmail.com with ESMTPSA id g9-20020a170902c38900b001a1b66af22fsm8418789plg.62.2023.08.22.01.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 01:02:26 -0700 (PDT)
From: Rohit Chavan <roheetchavan@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Rohit Chavan <roheetchavan@gmail.com>
Subject: [PATCH] staging: greybus: fix alignment of open parenthesis
Date: Tue, 22 Aug 2023 13:32:13 +0530
Message-Id: <20230822080213.6757-1-roheetchavan@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed all CHECK: Alignment should match open parenthesis
as reported by checkpatch to adhere to the Linux kernel
coding-style guidelines.

Signed-off-by: Rohit Chavan <roheetchavan@gmail.com>
---
 drivers/staging/greybus/fw-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/fw-core.c b/drivers/staging/greybus/fw-core.c
index 57bebf24636b..0fb15a60412f 100644
--- a/drivers/staging/greybus/fw-core.c
+++ b/drivers/staging/greybus/fw-core.c
@@ -89,7 +89,7 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
 			}

 			connection = gb_connection_create(bundle, cport_id,
-						gb_fw_mgmt_request_handler);
+							  gb_fw_mgmt_request_handler);
 			if (IS_ERR(connection)) {
 				ret = PTR_ERR(connection);
 				dev_err(&bundle->dev,
@@ -110,7 +110,7 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
 			}

 			connection = gb_connection_create(bundle, cport_id,
-						gb_fw_download_request_handler);
+							  gb_fw_download_request_handler);
 			if (IS_ERR(connection)) {
 				dev_err(&bundle->dev, "failed to create download connection (%ld)\n",
 					PTR_ERR(connection));
--
2.30.2

