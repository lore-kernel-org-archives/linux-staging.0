Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 015117E
	for <linux-staging@lists.linux.dev>; Fri,  9 Dec 2022 02:18:46 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id y17so3423864plp.3
        for <linux-staging@lists.linux.dev>; Thu, 08 Dec 2022 18:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NYhgDtLT1/+lNjUBnC/Tj1FN4K09VPMmhd3xjWRLpKw=;
        b=INBjSokBRTZXwnjY8FPZjRqY1Z1YHJju1JFvVAqCrHYCJqo5uwBh4QvbRcLhqigpJ6
         Cqp4y3WZVTtFFczyzzCpHbUbX0I3sne9HmblMvLECuo3k3YXi25ujSP9J1cjaoHVHCtt
         fv8gvqKzPYRPL0C6VKiO75du2I0nAcRV5tsRKmayyVrDCRvvp9fJU5Ro6IvgyCuJQu9h
         zrfbxKkgW3nBDQB+j1IlaqNGBHUk4p+S50JvsiDo0Etj/289PWo69PFBabIYPdqG4w7B
         p2QVmE9xBv4T5tgoc0CiB949I2nhlhPpSJi8R//IknlR01jM8CFXxALDWsX8ZPYaUpwq
         ifdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NYhgDtLT1/+lNjUBnC/Tj1FN4K09VPMmhd3xjWRLpKw=;
        b=RX2y8In1RmLwPWoNnFYtqWYDfFmZD3wfQkSnXEgrlBC5jTIDFBJN1ro3gr/Ewm2/dT
         3SPXw4kVdkceToQGtKGUEwIHBZ7qysVnaBI8gu+ZbePRMiHsB4S3oN9BaNv51u4WpJgM
         mOXcjbdmQhWtNAf1vjbyysTQRHBc2mbYyqTeIINLSeQV+6v9Md5Meg1yEW7w3aBbo8KD
         2jAz5WVJ2OFeGPooHBEWHmu1UlfkLcrzbdj7y2LWoXGNpj1p7QazPsQ0WEdIiKNQGY3B
         jFyd3DciFrnz+wxVctMwyG8wAiZASaYb7SHGLXM1eTUjnFUp6vSuN79dFjdY0Rfj4rEN
         rfnw==
X-Gm-Message-State: ANoB5pkKBXy0H8//WIClIxAAUMoa8/guSgnD7sxEnTNPxzragjH0omKt
	QZRo6fRFFgc8DcJbbQmow6k=
X-Google-Smtp-Source: AA0mqf7XtpDQyJSsGJrWNXVf4Jt7ySISaZ5hMQJMkCyjLXHGMnGhzg+b6MJRFh29YYFJCZ8jRuFCEA==
X-Received: by 2002:a17:902:e8d8:b0:188:d405:63c0 with SMTP id v24-20020a170902e8d800b00188d40563c0mr4022098plg.6.1670552326276;
        Thu, 08 Dec 2022 18:18:46 -0800 (PST)
Received: from localhost.localdomain (2001-b400-e283-776d-8739-aa48-f251-9f2f.emome-ip6.hinet.net. [2001:b400:e283:776d:8739:aa48:f251:9f2f])
        by smtp.gmail.com with ESMTPSA id o16-20020a170902779000b0017f5ad327casm116249pll.103.2022.12.08.18.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 18:18:45 -0800 (PST)
From: Matt Jan <zoo868e@gmail.com>
To: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Matt Jan <zoo868e@gmail.com>
Subject: [PATCH v3 1/3] staging: vme_user: add the spaces around the "*"
Date: Fri,  9 Dec 2022 10:17:54 +0800
Message-Id: <20221209021756.5597-1-zoo868e@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a space around the "*" at vme_bridge.h to clear up a checkpatch
check.

Signed-off-by: Matt Jan <zoo868e@gmail.com>
---

Changelog
v2->v3: Resend the patch set in properly threaded and move the patch
		changelog to correct position, noted by Greg Kroah-Hartman
		<gregkh@linuxfoundation.org>
v1->v2: Resend the correct patch set, noted by Greg Kroah-Hartman
		<gregkh@linuxfoundation.org>

 drivers/staging/vme_user/vme_bridge.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vme_user/vme_bridge.h b/drivers/staging/vme_user/vme_bridge.h
index 0bbefe9851d7..e17a8f7de165 100644
--- a/drivers/staging/vme_user/vme_bridge.h
+++ b/drivers/staging/vme_user/vme_bridge.h
@@ -4,7 +4,7 @@
 
 #include "vme.h"
 
-#define VME_CRCSR_BUF_SIZE (508*1024)
+#define VME_CRCSR_BUF_SIZE (508 * 1024)
 /*
  * Resource structures
  */
-- 
2.25.1

