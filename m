Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826D2612F;
	Thu, 16 Mar 2023 17:16:19 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id d8so1352476pgm.3;
        Thu, 16 Mar 2023 10:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678986979;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DYPQx63WJi0KpetmQ8FlsJ8XrcldXEPSpXZsd4T9ZoE=;
        b=TrfEuZbiz0Mx/8TvVIKDtsms7CUjPnceK8gmFafRKXUtlPSTF7kfOPXh5tU7esXj9T
         QDAnK+slrI3dM8wSyqGZNStOBP3uO3NWg4fV8Or3wN6cVRhaQ9d08deRBG3gOHclObz9
         tw5hjbqOqnG5b32Khk4mZipASBKRDBAyriAz/Cojw81tiLR3zWeulniCFIQAVB1qPLhM
         i/IDHN8TdFk0e0BDQPPkU4hCVrh7U+YXn2V4ktUzIeyWxCtkLkT7O2V0aPD/3xjFZb4b
         0U7j7m1sa6+rPKL2s/0C1gZ/D8hied0I+hipo7oSZR8L1RjC4xj7aQ3YBaO4JS5ylKMw
         8nBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678986979;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DYPQx63WJi0KpetmQ8FlsJ8XrcldXEPSpXZsd4T9ZoE=;
        b=DHTWaRCBkwgYL3VuCbcSU9xs/2N/r0kZ+CR3RbG6I2FvCBqm18y2ri1ozfz7FGlsy/
         cXcskFGiasES48w6vmco6k0dL2npqkDKhPzk6jBgTaDTJa/li8wuiy5nzTYZj+jQr2Jh
         VM1nD9WwxpQ09QhQ+nrdvn4qTmCeZRX09Ix2tFGgV+nKOtQsnYgg2AU7BwHo5YLfq89+
         HO6x/3vtqs305XcWpO0f3ze+nfAiIlLX1+dB7VwQ71RQZbZ5RQKcuMGnJp++WM9jfta4
         G0VaZT8zYACoFY+VPSTkL3Kf8jx5eA4nmidVPGL+vWDVaiOC3722qzbqu4rNvd3MM/4L
         iu+Q==
X-Gm-Message-State: AO0yUKUKeRo82wS+dCSCnILThApFOIV8WRP8CNrHXkPziJaEsZdrY7v6
	+373kdIiWBhIyb6u6B1gn3ZyG/tmm71lag==
X-Google-Smtp-Source: AK7set+jVJLXx5I+/yDk5/+NL00FhN05AtgOVbNz29+5ohXHfy2vxLtPj0+O0nusRGww+u3pdgFWWg==
X-Received: by 2002:a05:6a00:1989:b0:625:8d3e:34ff with SMTP id d9-20020a056a00198900b006258d3e34ffmr108856pfl.12.1678986978854;
        Thu, 16 Mar 2023 10:16:18 -0700 (PDT)
Received: from sumitra.com ([117.245.254.247])
        by smtp.gmail.com with ESMTPSA id j2-20020aa78002000000b005d61829db4fsm5697987pfi.168.2023.03.16.10.16.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 10:16:18 -0700 (PDT)
Date: Thu, 16 Mar 2023 10:16:14 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: drv@mailo.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: [PATCH v3] Staging: octeon: Fix line ending with '('
Message-ID: <20230316171614.GA82631@sumitra.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Since, the coding-style limit the code within 80 columns per line. This
causes splitting the function header into two lines and results the
first line ending with a '('. This causes the checkpatch error.

Place the function parameters immediately after '(' in a single
line to align the function header.

Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
---
v2: Change patch subject and description

v3: Change patch description, noted by Deepak R Varma <drv@mailo.com>


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

