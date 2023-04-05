Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460AB7470
	for <linux-staging@lists.linux.dev>; Wed,  5 Apr 2023 18:18:46 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id w9so143303233edc.3
        for <linux-staging@lists.linux.dev>; Wed, 05 Apr 2023 11:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680718724;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LbPoISbRHHbgx/EIizLjiaK4a2+6FCKivzxh5KJKvX4=;
        b=Lj/8r+Ls2RV3REtyjYQ+5sXQz9P56r8nQJkhObC/47JPCQx0EWgDyYzOeRCjWWRTNi
         rrqhKJ9TBOzhCub4MpOmg82OmGMtxMlnS0XQVt9AL74yYaiE0APwebn6yLDP4F6w2RNe
         sXZDJzQTcGYyPBBb4JOtGiWRpIA7uRLJkEMcAv16YSCpz9IBLexYdy0TLZuG0E2JzA6T
         1Os0NyBJzDGwF7XkdiNYEw7fXWkZz8qpVNZlseeLA3a49xYpHiRPA5KtDyTFMM4Dzran
         XPtHEjtooP/RAyzrPQCs7mwts6pgAAV5TExop2m0g3jNW8XraeI8y79OaU2s53/rT/6F
         yx5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680718724;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LbPoISbRHHbgx/EIizLjiaK4a2+6FCKivzxh5KJKvX4=;
        b=2C9FYBG+5vsWH9MQZuG5eMuEmeTEEkasGeRch9mec+I5iyPKH9SalKdkyPM2NuMBHv
         W+kNQE+xWWfZtfPVuFxD8jL0JIGPkzoLF6X4yyN9YC9pzSLk3vdaD3Ul9DvGFUudMqxi
         4YXPGm946qPCDXWu3SoG7WVQ1fr3ZFjVMgX9Ticm0e/4+kHR0tIlrtBjo3hwbn6HVz0t
         HYu1tmr7hHQb+O+ctfpkGmB3EooaiWh7ElayPX6URHI+s3mYgL0ulde0fUV34OwNy38Q
         lCWZ0065XXc+urp6scn8kpSPJnIugS28mrgJoV6gwAscgJo1jR6aBw69Ymi4mbO5apwK
         WIpQ==
X-Gm-Message-State: AAQBX9d4sQJ3kzOf2E+0w0WS8YIdHL1wLsNozGkQE/bNJTO/HYR1w4eq
	AAueSyYAgljQZSg+9HJSmw==
X-Google-Smtp-Source: AKy350YCNMvymqNqKy5WInMMa5oFPLUY5LNygeL9fColk5yKXlmxQMUOFvy+jvvLnBmzhOQoqImERQ==
X-Received: by 2002:a17:906:3d71:b0:8b1:820a:7b60 with SMTP id r17-20020a1709063d7100b008b1820a7b60mr3383770ejf.6.1680718724381;
        Wed, 05 Apr 2023 11:18:44 -0700 (PDT)
Received: from koolguy (dslb-002-205-192-117.002.205.pools.vodafone-ip.de. [2.205.192.117])
        by smtp.gmail.com with ESMTPSA id v13-20020a170906b00d00b009373f1b5c4esm7641255ejy.161.2023.04.05.11.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 11:18:43 -0700 (PDT)
Date: Wed, 5 Apr 2023 20:18:41 +0200
From: Dalvin-Ehinoma Noah Aiguobas <pharcodra@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: octeon: remove typedef declaration for
 cvmx_fau_op_size
Message-ID: <20230405181841.GA6820@koolguy>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix checkpatch.pl warning: do not add new typedefs in
drivers/staging/octeon/octeon-stubs.h:216

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <pharcodra@gmail.com>
---
 drivers/staging/octeon/octeon-stubs.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 3e7b92cd2e35..9f269626b862 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -213,12 +213,12 @@ enum cvmx_fau_op_size {
 	CVMX_FAU_OP_SIZE_64 = 3
 };
 
-typedef enum {
+enum cvmx_spi_mode {
 	CVMX_SPI_MODE_UNKNOWN = 0,
 	CVMX_SPI_MODE_TX_HALFPLEX = 1,
 	CVMX_SPI_MODE_RX_HALFPLEX = 2,
 	CVMX_SPI_MODE_DUPLEX = 3
-} cvmx_spi_mode_t;
+};
 
 typedef enum {
 	CVMX_HELPER_INTERFACE_MODE_DISABLED,
@@ -1362,7 +1362,7 @@ static inline struct cvmx_wqe *cvmx_pow_work_request_sync(cvmx_pow_wait_t wait)
 }
 
 static inline int cvmx_spi_restart_interface(int interface,
-					cvmx_spi_mode_t mode, int timeout)
+					enum cvmx_spi_mode mode, int timeout)
 {
 	return 0;
 }
-- 
2.25.1

