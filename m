Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB22D536
	for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 10:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PrCvg+QQ"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-507adc3381cso2368862e87.3
        for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 03:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697883303; x=1698488103; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDD9F7uN2VF2x8OMQSha4YCHZj7a+MjcYdmT4MBIiD8=;
        b=PrCvg+QQxuA3JP1xJ2JP9J27sWuz4+pwvzOXNYuWEEJTYzzgMJyfk7Mj1egci9IyW2
         A/iLurwmr2F6g2nvH1zE6P0jw9O4h+wHVZgdvvqWx+hIxp3LH9a5wfzmCwu7pf6vi/Js
         4BkEm8L4cyWwP0AD8YlQFqE5qaEOfohrRf2w9mnxvHr6Eb8aVNWJLH27gU/wP3AzUI1Q
         nijj6OaGwxcKbMmwfTyKzzrFYOIbrXslps6mogan0WUnd6O2pH6fr25/JHryhxi+GkOf
         VWTOrGjZQpYCvnp9QTJr9AX+EAJwQgC97vPKcjpHPb9ZFzys4VVLHDPlOuyHMiXgxFxo
         EN4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697883303; x=1698488103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tDD9F7uN2VF2x8OMQSha4YCHZj7a+MjcYdmT4MBIiD8=;
        b=NBYxxNGKh8aue1vFSP23m8GznIsupNCeaA9V9rzI8kj6Np7ZbPWsLOwailiQZ6wgzb
         IByKkA40INU7XUEswWdQSdaaPBMwKbC0Nv9oR8Tmz0owKOk8atGpQtC/YTdG+4xWloRe
         QzikJm2l6iqWxKlS6h23ra4RBN8BVXulor7OY5SIg/T+flSy6QOZT+Aw4sBu+M3HXgCk
         8NY5FcfmHn8VvbH6kJA34If+whjkJx2FUw/iyS+GpqLjpwSujLdrTp7RRzb4l1MAylGf
         f7gsxx8/g/a+5Uv7QI5uzXtN3OCWHZEtf42Vf7zpi2uXO/gaeGRdg7TjcTlBjgsIhAt3
         9TCA==
X-Gm-Message-State: AOJu0YzfOzSEe6ObjOZJrmbL+2icW6tlKLj+RLbswZr/xL2iZ4hsm+w4
	tBPp2mzlIHiPI9WaX6Nh+tAfyrbetWg=
X-Google-Smtp-Source: AGHT+IHX/Zvu0tJGvGX4KDIKit63ur6XFlLYyXpV8M0aVj608kZOXGkZi/aD1tKjQy5Ej7fNm+7NpQ==
X-Received: by 2002:ac2:4a66:0:b0:507:9f69:e8d9 with SMTP id q6-20020ac24a66000000b005079f69e8d9mr2877890lfp.49.1697883303127;
        Sat, 21 Oct 2023 03:15:03 -0700 (PDT)
Received: from HP-ENVY-Notebook.lan (81-229-94-10-no68.tbcn.telia.com. [81.229.94.10])
        by smtp.googlemail.com with ESMTPSA id d18-20020a056512369200b005007e7211f7sm803114lfs.21.2023.10.21.03.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 03:15:02 -0700 (PDT)
From: Jonathan Bergh <bergh.jonathan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jonathan Bergh <bergh.jonathan@gmail.com>
Subject: [PATCH v3 4/7] staging: octeon: Fix up introduction of new typedef cvmx_pko_lock_t in octeon
Date: Sat, 21 Oct 2023 12:12:35 +0200
Message-Id: <20231021101238.81466-5-bergh.jonathan@gmail.com>
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

This patch removes the new enum typedef cvmx_pko_lock_t and then fixes
implementations that used it.

Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>
---
Changelog:                                                                 
v1 -> v2: Fix breaking change spread across multiple patches                
v2 -> v3: Break changes up into individual patches for each removed        
          typedef

 drivers/staging/octeon/octeon-stubs.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index a11cbfec4d35..6c0196c1a9f6 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -238,11 +238,11 @@ enum cvmx_pow_wait {
 	CVMX_POW_NO_WAIT = 0,
 };
 
-typedef enum {
+enum cvmx_pko_lock {
 	CVMX_PKO_LOCK_NONE = 0,
 	CVMX_PKO_LOCK_ATOMIC_TAG = 1,
 	CVMX_PKO_LOCK_CMD_QUEUE = 2,
-} cvmx_pko_lock_t;
+};
 
 typedef enum {
 	CVMX_PKO_SUCCESS,
@@ -1381,12 +1381,12 @@ static inline union cvmx_gmxx_rxx_rx_inbnd cvmx_spi4000_check_speed(int interfac
 }
 
 static inline void cvmx_pko_send_packet_prepare(uint64_t port, uint64_t queue,
-						cvmx_pko_lock_t use_locking)
+						enum cvmx_pko_lock use_locking)
 { }
 
 static inline cvmx_pko_status_t cvmx_pko_send_packet_finish(uint64_t port,
 		uint64_t queue, union cvmx_pko_command_word0 pko_command,
-		union cvmx_buf_ptr packet, cvmx_pko_lock_t use_locking)
+		union cvmx_buf_ptr packet, enum cvmx_pko_lock use_locking)
 {
 	return 0;
 }
-- 
2.40.1

