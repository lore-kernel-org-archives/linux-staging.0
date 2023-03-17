Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48932641;
	Fri, 17 Mar 2023 05:25:01 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id 6-20020a17090a190600b00237c5b6ecd7so7861364pjg.4;
        Thu, 16 Mar 2023 22:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679030700;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5OsTv5mWSZFVE+t+Dyd8RSnvy3cQsZjJUc/om6AkPA0=;
        b=NUWyGYTVEEzFBCnAk9Y1gR61+or/NIRmsqXPVcsOJWE5dlw5IdeK8me71AnxHF5VWf
         wqNbQaDkQXl0H4/UYLLgPcHWQjTmgrLDCGh1uixA2Yi6BkJBQmva4yHHDNiw7f9q8xT4
         zWfaBe1jXf6ZK1xNd6Vy4int361bUlC6aUN0oyuVtTX6YfF2x/428WeeHUDbPAB9BJ/m
         2W1X6WUWXNf8bYn7C1sCXX5C8EUZiaYaSBMGENfyb80EtIpecITTbMkNwarazOtUfv7M
         ApDA43Iw5+0eSf16PSnfBzUsqv1LT/7Y3QeYy3y5GJr7PMOM6zLr/Y3rY4LtMmt/EQW8
         OmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679030700;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5OsTv5mWSZFVE+t+Dyd8RSnvy3cQsZjJUc/om6AkPA0=;
        b=FMtHs9FZqZa8jr3WJIX1i3Ajbiw6eZ9nc0XlD9eHtl8t+6fU8+H2iwXh/2jQDhy0hr
         CryvK766I6XETmsEhbsPI53im3q0pwLzstC2j8QgNun3TUd6Do1ZNBKzyBWRYr6oFImL
         YjkLbd0/iL5kM3b8ZSVXhHXngaAgJIMLxM5WRO22eOrSqeGtRqmB8g4dQoi4AxpJzy6P
         /Slup8ACw1Yq8yivc5MtNUYKhrLyDjKR4qkvj9d3bgA0PDqY0Magy8unxB8FRLpLMsWq
         NcXr4+1cCzpuyQExX7+OD8HI5Rdd8mT1Jcd3ceWHm0HFpzyluOhS8vW7YVeExow6vTUI
         b7cQ==
X-Gm-Message-State: AO0yUKUaA0r2YCwIaYe90NfUPULnQ6RuM9ED2RICizHkq+4akkxiwmYQ
	INGVIJiVmkJGanvvAL8bOlg=
X-Google-Smtp-Source: AK7set9Im1IFpX88ON4gzwTNyE+UVHwYPAYwvbo5KfrpPnrVF0jOFpzHNbtctISclL//JRZN4ysV3A==
X-Received: by 2002:a17:902:c451:b0:19a:a9d8:e48a with SMTP id m17-20020a170902c45100b0019aa9d8e48amr4983489plm.22.1679030700573;
        Thu, 16 Mar 2023 22:25:00 -0700 (PDT)
Received: from sumitra.com ([14.139.226.12])
        by smtp.gmail.com with ESMTPSA id p6-20020a1709026b8600b0019a97f180fcsm610512plk.37.2023.03.16.22.24.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 22:24:59 -0700 (PDT)
Date: Thu, 16 Mar 2023 22:24:55 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: drv@mailo.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, outreachy@lists.linux.dev
Subject: [PATCH v4] Staging: octeon: Fix line ending with '('
Message-ID: <20230317052455.GA83442@sumitra.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Since the coding style limited the code to 80 columns per line which caused
splitting the function header into two lines resulted in the first line
ending with a '('. This caused the checkpatch error.

Place the function parameters immediately after '(' in a single
line to align the function header.

Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
---
v2: Change patch subject and description

v3: Change patch description, noted by Deepak R Varma 
<drv@mailo.com>

v4: Correct grammartical mistakes, noted by Julia Lawall
<julia.lawall@inria.fr>



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

