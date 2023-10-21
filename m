Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E07D305
	for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 10:15:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hddfMNLW"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-507cd62472dso3098768e87.0
        for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 03:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697883301; x=1698488101; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zu42pQJStzejxYxI5j1H3uBlC7qEy33j9WdXMX2X/AQ=;
        b=hddfMNLWW2REVFSy1p1U23/QvzyvXUNXN0IyxlM2q2DlGJsehdJGMBW7m+QA70dDOR
         irvSOY7QHoNoT8Tcn5AqS59o3mDJQfBT2Zw/SYxnE5nax5dZ3QOMfX4UHhiSofrLGIRT
         0lsNxSqwkuQ3YbLIptoZB2DEJKhVjF7of6pYFV/sgjogDF6CKBhMQsfazRZuytzb5R2N
         fIdOJsEPEr8SdUs4YNhW+roBKglS64GT8i5JIr0jmmpGOoecVV9D9WXyYKYxAbwu1wqf
         oDV8nh+OihZnbuNSLUDJe0ZWKrwO/Y4Hu2oKqqtfqtyPVZCPlSz0PzPvyLDrnPxBxTJW
         vetQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697883301; x=1698488101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zu42pQJStzejxYxI5j1H3uBlC7qEy33j9WdXMX2X/AQ=;
        b=OuuuZzuUQW5N/4HBQAmJIddudiIi4+zNP8YXeXTzcx3Cmg/EvQJ5r8SvUSHr5WMulH
         f17BbCdzyGKuSYhQ+uO1i02hk1qteA2/WKiK4LrAC2rRXjxfF04+WLpoE35oOdT5VR23
         jsXJVKt2iXkQowy2+1WqksIJZKPs5wGeiNMH6Ls3hjMI9jizN3trAhcKOOVevQhNQZ57
         1la8sgJhYWL5Y5zRjq/L4Hx52rK/c2LLWiOSX7la6RsWpDbhbGBPzSyqM0FsgTJpC/L5
         jQygjN+/HQ6JXG1OWfxfXC8f6rlQbuPxAUhDpyvqFR1KE1/q8VyzEfaYHnDZyXkahw3f
         f4OQ==
X-Gm-Message-State: AOJu0Yzy+dENdUKf7PBSy28EwVvgHLyzx0MJd47RY4ulfZg0hR3hHbRO
	WRbno7B4qVgNL6rQrArH6b1bYNqgzLo=
X-Google-Smtp-Source: AGHT+IGEyGTqzXkocVX8/ecMNUuRxdd4+0q8gLRjkZ0gbP18EcvYStdDZo6L4lsZwM58quVnjk+OIg==
X-Received: by 2002:a05:6512:3b9a:b0:507:addb:c7a1 with SMTP id g26-20020a0565123b9a00b00507addbc7a1mr2641881lfv.14.1697883301146;
        Sat, 21 Oct 2023 03:15:01 -0700 (PDT)
Received: from HP-ENVY-Notebook.lan (81-229-94-10-no68.tbcn.telia.com. [81.229.94.10])
        by smtp.googlemail.com with ESMTPSA id d18-20020a056512369200b005007e7211f7sm803114lfs.21.2023.10.21.03.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 03:15:00 -0700 (PDT)
From: Jonathan Bergh <bergh.jonathan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jonathan Bergh <bergh.jonathan@gmail.com>
Subject: [PATCH v3 3/7] staging: octeon: Fix introduction of following new typedef cvmx_pow_wait_t in octeon
Date: Sat, 21 Oct 2023 12:12:34 +0200
Message-Id: <20231021101238.81466-4-bergh.jonathan@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231021101238.81466-1-bergh.jonathan@gmail.com>
References: <20231021101238.81466-1-bergh.jonathan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch removes the introduction of the following new enum typedef
cvmx_pow_wait_t and fixes up the implementations that used it.

Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>
---
Changelog:                                                                 
v1 -> v2: Fix breaking change spread across multiple patches                
v2 -> v3: Break changes up into individual patches for each removed        
          typedef

 drivers/staging/octeon/octeon-stubs.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 40c357c77679..a11cbfec4d35 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -233,10 +233,10 @@ enum cvmx_helper_interface_mode {
 	CVMX_HELPER_INTERFACE_MODE_LOOP,
 };
 
-typedef enum {
+enum cvmx_pow_wait {
 	CVMX_POW_WAIT = 1,
 	CVMX_POW_NO_WAIT = 0,
-} cvmx_pow_wait_t;
+};
 
 typedef enum {
 	CVMX_PKO_LOCK_NONE = 0,
@@ -1342,11 +1342,11 @@ static inline unsigned int cvmx_get_core_num(void)
 }
 
 static inline void cvmx_pow_work_request_async_nocheck(int scr_addr,
-						       cvmx_pow_wait_t wait)
+						       enum cvmx_pow_wait wait)
 { }
 
 static inline void cvmx_pow_work_request_async(int scr_addr,
-					       cvmx_pow_wait_t wait)
+					       enum cvmx_pow_wait wait)
 { }
 
 static inline struct cvmx_wqe *cvmx_pow_work_response_async(int scr_addr)
@@ -1356,7 +1356,7 @@ static inline struct cvmx_wqe *cvmx_pow_work_response_async(int scr_addr)
 	return wqe;
 }
 
-static inline struct cvmx_wqe *cvmx_pow_work_request_sync(cvmx_pow_wait_t wait)
+static inline struct cvmx_wqe *cvmx_pow_work_request_sync(enum cvmx_pow_wait wait)
 {
 	return (void *)(unsigned long)wait;
 }
-- 
2.40.1

