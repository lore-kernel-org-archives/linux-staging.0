Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64DF6117
	for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 10:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hk9hdRjZ"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-507be298d2aso2376579e87.1
        for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 03:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697883299; x=1698488099; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mA8KD11qpf6KZqgPVgnRyUQoU2OH4Y/VAnk/+JUKr/8=;
        b=Hk9hdRjZ7+BlffMmvpXQfyWcz6/JAEDqffsvX75Lkut7WtilNnR922hvMFfhM/8gig
         v3pzmSuA2A0njZ8vKjqKcHhBvqalq5ODmeXvLHJlCNVB1y9rqdvVmKyHeeqLiZa/t8gA
         GrWgTmyGkerSKG0rLNcncgFYyAsvSuDOqaACbZEHUiVBhHZoEmy0MwEu/HE5NYJUhD8i
         QzwWbZk+GUtUiLmkrIwm5aiBE08DEUtdsJUusO5dCUmsMVT/qYBzQnSxGHJk/gLdOOnt
         UQKgG+MrVY47mk0eIp1mMTKCj83qLbRCnrlxXO9Ez32JhQsOwGPVEJwRe3v5vcrllxHc
         9BFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697883299; x=1698488099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mA8KD11qpf6KZqgPVgnRyUQoU2OH4Y/VAnk/+JUKr/8=;
        b=AiYNE8PUJL66+xeUOvj9WMuSc495wrDk/ISbkWWnzPgYtYfvzJU8TocQfcdyPiLmjD
         z/CGMXVhWVSKTWMRX0n0vrQF3kPLTcxwpcZ+OT5Pmtt3GxsRyPnHA5hNoas+7V35Q0Vq
         Gi96HqhF+5uQEfFFBoKBAhn07p5zLmNUO6u1Yssaz4+xBvz74xvaAP4u7Gwz4EJYimJI
         TiCSNpBTxAuUXVGMA0yZRb8y15t5wcRIfp9blIjJriQ68WzPfPDbN2WbJ23ApmXoDDvN
         sizEpEoF394HX23Cl+OnGioGcc6yfPkqz/HURzwUGBnUwdoUqJmazntJ/FKqveuyEsds
         YRSA==
X-Gm-Message-State: AOJu0YwwMLTTjLiB5UgEEwwLvS+tVreaymb4jSk2JjaUxs1ZmFypxAqP
	H8YyVMqDaB/JUZEA3uJITeA=
X-Google-Smtp-Source: AGHT+IFM9q6B8BGG10D4rtMe62hsk9wFcq8PPcVo8+WwGVZgFK5S/Oh8j2EyEzMsFep/6Xk+a7Kqnw==
X-Received: by 2002:a19:645c:0:b0:505:6c99:bd7c with SMTP id b28-20020a19645c000000b005056c99bd7cmr2539883lfj.57.1697883298782;
        Sat, 21 Oct 2023 03:14:58 -0700 (PDT)
Received: from HP-ENVY-Notebook.lan (81-229-94-10-no68.tbcn.telia.com. [81.229.94.10])
        by smtp.googlemail.com with ESMTPSA id d18-20020a056512369200b005007e7211f7sm803114lfs.21.2023.10.21.03.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 03:14:57 -0700 (PDT)
From: Jonathan Bergh <bergh.jonathan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jonathan Bergh <bergh.jonathan@gmail.com>
Subject: [PATCH v3 2/7] staging: octeon: Fix up introduction of new typedef cvmx_helper_interface_mode_t  in octeon
Date: Sat, 21 Oct 2023 12:12:33 +0200
Message-Id: <20231021101238.81466-3-bergh.jonathan@gmail.com>
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

This patch removes the typedef for the following enum
cvmx_helper_interface_mode_t and then fixes up implementations that used
it.

Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>
---
Changelog:                                                                 
v1 -> v2: Fix breaking change spread across multiple patches                
v2 -> v3: Break changes up into individual patches for each removed        
          typedef

 drivers/staging/octeon/ethernet.c     | 2 +-
 drivers/staging/octeon/octeon-stubs.h | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 9eee28f2940c..023b107e077a 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -798,7 +798,7 @@ static int cvm_oct_probe(struct platform_device *pdev)
 
 	num_interfaces = cvmx_helper_get_number_of_interfaces();
 	for (interface = 0; interface < num_interfaces; interface++) {
-		cvmx_helper_interface_mode_t imode =
+		enum cvmx_helper_interface_mode imode =
 		    cvmx_helper_interface_get_mode(interface);
 		int num_ports = cvmx_helper_ports_on_interface(interface);
 		int port;
diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 9f269626b862..40c357c77679 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -220,7 +220,7 @@ enum cvmx_spi_mode {
 	CVMX_SPI_MODE_DUPLEX = 3
 };
 
-typedef enum {
+enum cvmx_helper_interface_mode {
 	CVMX_HELPER_INTERFACE_MODE_DISABLED,
 	CVMX_HELPER_INTERFACE_MODE_RGMII,
 	CVMX_HELPER_INTERFACE_MODE_GMII,
@@ -231,7 +231,7 @@ typedef enum {
 	CVMX_HELPER_INTERFACE_MODE_PICMG,
 	CVMX_HELPER_INTERFACE_MODE_NPI,
 	CVMX_HELPER_INTERFACE_MODE_LOOP,
-} cvmx_helper_interface_mode_t;
+};
 
 typedef enum {
 	CVMX_POW_WAIT = 1,
@@ -1265,7 +1265,7 @@ static inline void cvmx_pko_get_port_status(uint64_t port_num, uint64_t clear,
 					    cvmx_pko_port_status_t *status)
 { }
 
-static inline cvmx_helper_interface_mode_t cvmx_helper_interface_get_mode(int
+static inline enum cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int
 								   interface)
 {
 	return 0;
-- 
2.40.1

