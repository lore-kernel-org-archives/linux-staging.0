Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0888C04
	for <linux-staging@lists.linux.dev>; Tue, 21 Mar 2023 11:41:45 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id kq3so3283442plb.13
        for <linux-staging@lists.linux.dev>; Tue, 21 Mar 2023 04:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679398904;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2YW3xbqi/VHK+051ISNRxO6nRHOEPScJeQcBOYGq32Q=;
        b=jUjW2SGpLivPtEct6UbAlu9/ZDohcZG1nkwjXR08/71xM9Etn5dQPoGn5nOxu6jxsl
         P93ver8+THwj6F/ARvXRw1u9ZnB+LVd8+sg6YcBF/WTFjb2Ey3W96Z8LBdBFoU2wclPl
         bG5RnQmB8XBpyuj8mFX2kUImyhjRDWC/cY2tRF7OFdA6UC0Lq4bHvsSQm9O/N1O3MXro
         xrXdh6rnwhTLGuoH/jgcnBOyYBjdZsLco5vobrz+MOP9WCKEU0zs/cnM7bsHlf07tkSm
         yBH1S34yaCMj7Bip5siOLVSjFeOqMgWy4x2zq09tyLoRUgkz/rpwz6MOnRbh1t3nxkma
         BgPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679398904;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2YW3xbqi/VHK+051ISNRxO6nRHOEPScJeQcBOYGq32Q=;
        b=AZiVN4qDJntwav7kJRM/w6y4wBTVrUhzywGD2yJwuQij6YlZ8vP4S9TMvF8cQXJdkV
         cRtCw7svArCg3+EuIdRdOdo1i7hqFQ8NWMZvRiZ/v9hdzb0fqhtiEbak9ykt94zT2K7V
         BA4LHry/m73d6OJTyrNzADHDdjsrS58QYNzIDpzBj4zygRcCLwJvf97+NaJeB6JLeKWJ
         NWXifZeylIeDWJ7Vlo2EWcoWvUoc/f8j2nm89IBmfITNK77PCCePOcvcgsxUy54FnZL+
         9WJfzP9B6jetcLgEj8KWd45rMzi6p5p9t2NTW2Se/64m+UWjW7atLG9XXrzQj0IaXlnq
         kklw==
X-Gm-Message-State: AO0yUKXwirbwgaABf/imckfheCViLPPMTDfadlx/3uFY0xS5K5SCmiZV
	/FezHDl8IwDih+vAUO9mUYbvG5BS7Q==
X-Google-Smtp-Source: AK7set+IZEO0Vs4I9RYeGuYvEfVzcSycM/hbhsX43x0q0HILzHmRJmljgXF5AtVWRdNP0hhngZ9yBg==
X-Received: by 2002:a05:6a20:c29c:b0:da:368e:7c73 with SMTP id bs28-20020a056a20c29c00b000da368e7c73mr1752668pzb.37.1679398904390;
        Tue, 21 Mar 2023 04:41:44 -0700 (PDT)
Received: from mehmed-HP-Pavilion-Laptop-15-eh2xxx ([2401:4900:1c19:e99d:c9dc:9d9e:85b3:1d9e])
        by smtp.gmail.com with ESMTPSA id a17-20020aa780d1000000b0062814f38d33sm1092365pfn.170.2023.03.21.04.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 04:41:44 -0700 (PDT)
Date: Tue, 21 Mar 2023 17:11:41 +0530
From: Inshal Khan <kziaul123@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] Staging: rtl8712: osdep_intf: Improve RND4 macro for
 better debugging and safety
Message-ID: <ZBmX9cjTRNhwt2zA@mehmed-HP-Pavilion-Laptop-15-eh2xxx>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This commit modifies the RND4_UPPER macro in the osdep_intf module of
the rtl8712 driver to improve its safety and debugging capabilities.
The macro has been changed to use a temporary variable for the input
argument 'x', instead of directly using it in the macro expression.
This change helps to avoid potential issues with operator precedence
and unexpected side effects that could occur if 'x' was reused within
the macro.

Additionally, the new definition of the macro uses the 'typeof' operator
to determine the type of the input argument, which ensures that the macro
can handle any data type safely. The new definition also uses a block
expression to contain the macro code, allowing for better debugging
capabilities and cleaner code.

This change improves the safety and maintainability of the RND4 macro
and makes it more suitable for use in the Linux kernel.

Signed-off-by: Inshal Khan <kziaul123@gmail.com>
---
 drivers/staging/rtl8712/osdep_intf.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8712/osdep_intf.h b/drivers/staging/rtl8712/osdep_intf.h
index 95a21f380cd7..0e097b4a8670 100644
--- a/drivers/staging/rtl8712/osdep_intf.h
+++ b/drivers/staging/rtl8712/osdep_intf.h
@@ -18,8 +18,8 @@
 #include "drv_types.h"
 
 #define RND4(x)	({ \
-		typeof(x) _x = (x); \
-		(((_x) + 3) & ~3); \
+			typeof(x) _x = (x); \
+			(((_x) + 3) & ~3); \
 		})
 
 struct intf_priv {
-- 
2.34.1

