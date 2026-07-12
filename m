Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE313A640C
	for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 12:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783857717; cv=none; b=dBKr4LLZ3y4uIBSXRWrJK3h/Ez+cCz1THL6+ZO10UxxtaMXu03yPz0xKGt8M2HQgfWaJ+Om48olg8J5p8KrdVwq6I8vY33aQn9CRZRNyzkKha7cXsKZcRC16l7Zieu1vryhFqGjpnlspw+y9GJjWYin7bchtQD0DY8Lsi59zrq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783857717; c=relaxed/simple;
	bh=Kjr5ogbbV4n039dsRnrCxc7VLP1owCEvcYUwwS8haF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bYEtMLCEIxbU3lex4xVtUhd4PtYictYgBGg8zzJm8oC0y1ztaO//aa5AKG96NQHphfHQ0Ec2xVO/FXgbNLZqk7aA16YigmtG9MW7QMxerol9SULTZGktLj/n+5O033Uiid/1BBI3FVtveJVt7sQBoJ43yCCoZdz87ziP8v4hoFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O0kwiPTK; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O0kwiPTK"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-39c83acb86eso21948261fa.1
        for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 05:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783857714; x=1784462514; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aYdGlbgDa+zSvwlcX7ZI2NcK0ly4NmG0VALpN7JdJFc=;
        b=O0kwiPTKNR7KZ8QYtpnAZbgdQfNEQBoAvxTzPtn/YNDuKHAQFguNtFj7EOki3t4p9x
         CttIosOWmKe92vilbGaoT7WLygpoAAAORRj0DWohC0cPrJ/IbkNs9jg2yDGRzmvMvw4c
         A6S/NohIq3F9Zn3Kppb5BAR6okbiHq30s/TEkFFE2jvf9z2kyPLK8qHTeWBMoL+fh2Z+
         18vG+zWR6uExijducu7IFYiNjuZ4pAzrGyZjOI5c9FNzO6s7u8E6URqcTMk+fAj0V10F
         EiXceX3qRM5nxv6z/EXIn+1jbFhOVGJhVnh2ubrjl501kXsNUI4VU2rcv82m5y8CdCoc
         icEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783857714; x=1784462514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aYdGlbgDa+zSvwlcX7ZI2NcK0ly4NmG0VALpN7JdJFc=;
        b=QEavQ2S88J6/+x87nxgUL/ZzZtICpU/CVjpSj9ORKCxPNO2uJzx6c5r7h8cO1wDcSM
         ymmwEFUL5aZMlO20iiaqQ5MvtW3FTqMxDiCMN7rjseuy5yYrtetjEfYsM/pYycl21kNq
         KAEV6wiDYRw2CWzBUeeHiSmUjG20saXUjft08KCtTMgK2HihiOME0aCq2213OcVi95RP
         FCvgfV1cZIfC5hJgsyTtEwWrv8wcOzuVEB2gLj5pnz4U1X6B/MeBp5odSYFd3cka9nFx
         8/cWU0mAKWTFEf3LrWkwpJuYzcBlklVsusLhng7PG5esj3y73NkkU4CaF6r4ANd2/aUD
         vkxQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrt8OGMU0ZjFiFxQnrGDdhQ2gtFwfhgJr2F0AMc4i79UZYBP9LI9gOO+32K7UfrPKq9vUPrbY2934iaWga/@lists.linux.dev
X-Gm-Message-State: AOJu0YwFvfU5ntaDfEmbqs7F9lIEBoZ0x2RWEc2fCfmbYBL+V+wUmpxl
	G1Ff5V/k4/Ge+YW6+D8Ciwmk/PrdYT4OlJVdqUxf3T68G4PUnNKJEsCG
X-Gm-Gg: AfdE7cnBwV3HR+uZrfy4dtRq6XZukUWeuNPlybcUpaHv/6IvZjSmaeey2ZqORhFtsWF
	K/6La+LqQWk1eN3eGJ1a3Kv2G0pSApDO/oTUA+K/8kpklGlJ3s64SpnJZ0a5FRlRNTyxRHwDJGn
	HpUlztoNFV7o2+s1gifkZZwGZwOxTI2U5dvK2IZ/QAoQ0lpd2du/uAkN/3EEHBmiUs7KQr7zfi+
	5oHRoPJYDEn708GOSZ/uZO//Js5NZREu+gU1N7nsYTuN39hxrElOsUd8TbRmzDBgm5o55t5ZGVz
	WDuTcnuiz5gw9IncGZlYaOQLkuBxCS9JImrtTyzne5y8VaGVeSbY05nYeTx9flG0E2yTOos00ue
	EuaKiIyQ1AtNmo1yo+7QZGMw/ugJCuQtobr6ccYyIzxrL+aNOgDu0SzhAj7ODwZW132okCGVVsL
	JyQa1iXsw=
X-Received: by 2002:a05:651c:1687:b0:39b:53f:bf61 with SMTP id 38308e7fff4ca-39caa872522mr7335221fa.20.1783857714514;
        Sun, 12 Jul 2026 05:01:54 -0700 (PDT)
Received: from linux ([195.54.40.37])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84ba1b9dsm21339001fa.35.2026.07.12.05.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 05:01:53 -0700 (PDT)
From: "A. Kalimov" <erqeon@gmail.com>
To: error27@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	andy@kernel.org
Cc: mchehab@kernel.org,
	sakari.ailus@intel.com,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"A. Kalimov" <erqeon@gmail.com>
Subject: [PATCH v3 2/2] staging: media: atomisp: fix function arguments indentation
Date: Sun, 12 Jul 2026 15:59:25 +0400
Message-ID: <20260712115925.79047-3-erqeon@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260712115925.79047-1-erqeon@gmail.com>
References: <20260712115925.79047-1-erqeon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix standard checkpatch indentation warning in atomisp_cmd.c by properly
aligning function arguments with the open parenthesis.

Signed-off-by: A. Kalimov <erqeon@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 81d0afae8..d741f4f04 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1883,9 +1883,8 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
 /*
  * Function to check the zoom region whether is effective
  */
-static bool atomisp_check_zoom_region(
-    struct atomisp_sub_device *asd,
-    struct ia_css_dz_config *dz_config)
+static bool atomisp_check_zoom_region(struct atomisp_sub_device *asd,
+				      struct ia_css_dz_config *dz_config)
 {
 	struct atomisp_resolution  config;
 	bool flag = false;
@@ -1918,9 +1917,8 @@ static bool atomisp_check_zoom_region(
 	return flag;
 }
 
-void atomisp_apply_css_parameters(
-    struct atomisp_sub_device *asd,
-    struct atomisp_css_params *css_param)
+void atomisp_apply_css_parameters(struct atomisp_sub_device *asd,
+				  struct atomisp_css_params *css_param)
 {
 	if (css_param->update_flag.wb_config)
 		asd->params.config.wb_config = &css_param->wb_config;
@@ -3893,10 +3891,9 @@ enum mipi_port_id atomisp_port_to_mipi_port(struct atomisp_device *isp,
 	}
 }
 
-static inline int atomisp_set_sensor_mipi_to_isp(
-    struct atomisp_sub_device *asd,
-    enum atomisp_input_stream_id stream_id,
-    struct camera_mipi_info *mipi_info)
+static inline int atomisp_set_sensor_mipi_to_isp(struct atomisp_sub_device *asd,
+						 enum atomisp_input_stream_id stream_id,
+						 struct camera_mipi_info *mipi_info)
 {
 	struct v4l2_control ctrl;
 	struct atomisp_device *isp = asd->isp;
-- 
2.53.0

