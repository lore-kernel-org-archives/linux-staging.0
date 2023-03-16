Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DCC33C1;
	Thu, 16 Mar 2023 13:06:54 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id ix20so1675408plb.3;
        Thu, 16 Mar 2023 06:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678972013;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B3jNhyipEJNd1RcWn3fkcuOoTx5a36p3R6zN6vOVqKQ=;
        b=Evo9R0ySjqFSsO0Q1wkSnr5TIDObQf1nYFzYGrG8hfk8Ut9e6+llwzTtyvFb04mlok
         XFv7nZqfqldR1WqAGOtPPg/hwblRHyi0eG+DWps1uut/R7qgpOHGfycS08Thnj/TwgJJ
         F5dwXMAg/SyTCmtL9rFVdleHNyDoqf49VNge1iMsjGbD7RSgZNAXArFe0m1JUkM0Z6Mz
         EUJG6R/CO+L2yuVfVhCcAkUF/t5CyuecTq7q+buBpKGk70EzLlN0jPT2tbXVuqSHO36k
         EB1/+2fRpwxdkXmK8znmbSgve//4xT0Jnd2UqK/Jxpbxh0fCNgA7QQ+Ls+Q4ns+5wYx2
         VxVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678972013;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B3jNhyipEJNd1RcWn3fkcuOoTx5a36p3R6zN6vOVqKQ=;
        b=2Ni2LpSJzXSzDIWCLo2qWKiJSGZd4QejZAvWvVUUJIy4YJbUFjmGCzPr7veoSqihI5
         5lW5jNVSvR3sSUFb6u+GnSBVKSFr9KteYU1zvrn7zsQb93PR1spZ7+F66PO0lOWkCy3g
         H8R89bY9xLPtOrcpilphV+k1+HzY1ZwQfYxHRl6RnipHwr4YJ2B/NhVcrz5/moZZ/Wqe
         9YbGUM1pyaiaDHKtWMojlehm3j2aD7C6jSS5l1fu/ffyI0UJqmpon0hjXUlZLxQvstwx
         sgD81QUpjbnRXhrhujIf8SSTB0WC/bBUVLBjQns/8OB7ZFDc6WXXAB5bH7tOt6pejFzD
         QJEw==
X-Gm-Message-State: AO0yUKXRnpv7YXQwVZNaJeE+mVk7QbCcupXU1E++bbF/4rQZ4LrnKT/g
	xV548cv7mLBXyMI+kAvJk6PrOjtcbqNMHw==
X-Google-Smtp-Source: AK7set9ffK4oj3vlyvp+fsYfFTZLfEjsp7v8S2ow5emHdiAPvAlPzOLxxmcwjNzpY84hXqt9t9geyg==
X-Received: by 2002:a17:902:e551:b0:1a0:65d3:bae4 with SMTP id n17-20020a170902e55100b001a065d3bae4mr3658192plf.38.1678972013303;
        Thu, 16 Mar 2023 06:06:53 -0700 (PDT)
Received: from sumitra.com ([117.245.254.247])
        by smtp.gmail.com with ESMTPSA id j12-20020a170903028c00b0019f3cc3fc99sm5580221plr.16.2023.03.16.06.06.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 06:06:52 -0700 (PDT)
Date: Thu, 16 Mar 2023 06:06:47 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: outreachy@lists.linux.dev
Subject: [PATCH] Staging: octeon: Fix Lines should not end with a '('
Message-ID: <20230316130647.GA81281@sumitra.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

checkpatch.pl CHECK: Lines should not end with a '('

Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
---
 drivers/staging/octeon/octeon-stubs.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 7a02e59e283f..3e7b92cd2e35 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -1372,9 +1372,7 @@ static inline void cvmx_fau_async_fetch_and_add32(uint64_t scraddr,
 						  int32_t value)
 { }
 
-static inline union cvmx_gmxx_rxx_rx_inbnd cvmx_spi4000_check_speed(
-	int interface,
-	int port)
+static inline union cvmx_gmxx_rxx_rx_inbnd cvmx_spi4000_check_speed(int interface, int port)
 {
 	union cvmx_gmxx_rxx_rx_inbnd r;
 
-- 
2.25.1

