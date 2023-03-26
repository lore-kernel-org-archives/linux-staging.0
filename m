Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F61E7F7;
	Sun, 26 Mar 2023 06:45:26 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id fy10-20020a17090b020a00b0023b4bcf0727so5680851pjb.0;
        Sat, 25 Mar 2023 23:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679813125;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Xa4yXSffm+6bXnmSFV6WRoBiZ42z2spUWYAuMy1+fI=;
        b=l18eSA0MKvgRUHyKdbqLoX1r7mFagcwI9bQBDON0MhvXn5UXSm+uOa8gAXeaLX3d3p
         lSse5Cod8gSnz2u3odGoITwc7z/kWkDkcwGUGduFEvEUp9X4mUZVn5t9S+CU1ZNWy2v6
         0yenqLW/f4HpEeghPCnambVaI40sF0YQMwWSp6WQgT6/UDQF5quH64H4x406vR8awMQU
         naBC+y8R4DPEC4CTSnc9RLfaj+EjOoYamtZ5a4ZbLBW0FIClhpLl3u7sD5kxZXmBWgQZ
         rYZhL7DIa4IAzg6RJACF5ObaT6z9/2154AgvYsiD4V0qhMcoNLeX5mINTRp2aPe/KQsv
         NIrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679813125;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Xa4yXSffm+6bXnmSFV6WRoBiZ42z2spUWYAuMy1+fI=;
        b=HCFJKkD3QQVE4X4Om4UMBGVEaGWvKeEyPIgaGFANZ+saWeSDqAVJLS3t1YlutDltK2
         ZdZ7YrY2xUgv3if326vTFctVTBYiKh2aF3IWHsRViyWFjOTTWi0OCydXIzOF1ScRKY4E
         8A12rsDV/R//+BqXqnHlhHBu+P4ReGnorVRLAefjo92ScAYCukgsBkm+32za+x0sgS8F
         0Ei4PX8Ncpo5K2LzrLVnnV86mQ2Fiyuylu3/pUfpg1up+DnAmw7eCtn6q7ENwT1xQF9t
         6DDKf/x4ydrBKzyKAm1SGFba69Nd5iH7pGU96vcRH38t99zSoQefzseuMqKC3WNN2FeU
         Nldw==
X-Gm-Message-State: AAQBX9ewhhPXL/VSkrCl0xweZZDMOMwAANBPkpl8Nar5vKgEfj4Z3oVz
	sBBeTjbppN5J56QT5L8ICIDR7D/94Pq2OLWF
X-Google-Smtp-Source: AKy350a3ZE7Sc6hR5WDQRxmgubD2rBLmS7hJtJE8YtRyOhZSlxf1M6vcSYgv9JyVenXiaj64sWXWcA==
X-Received: by 2002:a17:902:d4c7:b0:19e:6760:305b with SMTP id o7-20020a170902d4c700b0019e6760305bmr8716559plg.47.1679813125445;
        Sat, 25 Mar 2023 23:45:25 -0700 (PDT)
Received: from sumitra.com ([117.212.89.150])
        by smtp.gmail.com with ESMTPSA id bf11-20020a170902b90b00b00194caf3e975sm4068165plb.208.2023.03.25.23.45.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 23:45:25 -0700 (PDT)
Date: Sat, 25 Mar 2023 23:45:19 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: outreachy@lists.linux.dev
Subject: [PATCH v4] staging: greybus: Inline pwm_chip_to_gb_pwm_chip()
Message-ID: <20230326064519.GA179449@sumitra.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Convert 'pwm_chip_to_gb_pwm_chip' from a macro to a static
inline function, to make the relevant types apparent in the
definition and to benefit from the type checking performed by
the compiler at call sites.

Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
---

Changes in v2: Change patch subjects, noted by Alison Schofield
<alison.schofield@intel.com>

Changes in v3: Change patch subjects to length 80 chars,      
noted by Alison Schofield <alison.schofield@intel.com>

Changes in v4: Apply change to fresh git tree, noted by 
Greg KH <gregkh@linuxfoundation.org>

 drivers/staging/greybus/pwm.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pwm.c
index 26d39e08c3b6..88da1d796f13 100644
--- a/drivers/staging/greybus/pwm.c
+++ b/drivers/staging/greybus/pwm.c
@@ -21,8 +21,11 @@ struct gb_pwm_chip {
 	struct pwm_chip		chip;
 	struct pwm_chip		*pwm;
 };
-#define pwm_chip_to_gb_pwm_chip(chip) \
-	container_of(chip, struct gb_pwm_chip, chip)
+
+static inline struct gb_pwm_chip *pwm_chip_to_gb_pwm_chip(struct pwm_chip *chip)
+{
+	return container_of(chip, struct gb_pwm_chip, chip);
+}
 
 static int gb_pwm_count_operation(struct gb_pwm_chip *pwmc)
 {
-- 
2.25.1

