Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7A72E7394
	for <linux-staging@lists.linux.dev>; Sat, 11 Jul 2026 08:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783757865; cv=none; b=h4OpH47zctLgZd4zjzEZHW72ACypxLdfCe6sLlmlNagIUBHtIj/R0syeprH/hXahX1GRWvk+ggldqFA76FVzeZ8lROL0ohIYyEKQ46uHEDCKVXl9W4Hdj+sKQ2MMlDvGWasScXtukEWRJMpKyR2i3lA47UTFj7PG3PobOqJmgb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783757865; c=relaxed/simple;
	bh=FwZ7bPbTTmBPzsRAYQ2XsXdqwWS6rU2eFtjqpVlPBds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=siKfk6C6vMwukhGBzfSKXbcL8CTSCBDbWXYdaioYQHKrwdyy0Nyndngu/oWQ16IdBDu53EXxg/TanHAzOTvs9lDLNREF2zRC58asBnXqcl+VGwWQfnfivgyhe/ocw10u7QNbbsrr2PXsgYbFX+FStzUEb5BBluPZt/AvMOgmww8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M/khGQ+E; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M/khGQ+E"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39b51882d71so12932091fa.2
        for <linux-staging@lists.linux.dev>; Sat, 11 Jul 2026 01:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783757862; x=1784362662; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uYhcW1SCR6GHSegIq0BbrmPvOxPcseFc94iedjclU6A=;
        b=M/khGQ+ElTaXp15uHnbBvz7hb4wA4sMCM+cK/dYRxjlrXowVJh19MqWaKAXZp2b+z5
         Kf9vR5VBO9q2WLtquDfdaY2mwcNeacEOt8GU4FUSR14nrsEbFhT075zN6HDMzz1KH6Bz
         ZyHRNradhzTOhbK1eKHKBOlyn1UcQEVwpYeeNpcVj/t4AQx4ny2IQgjwwTCtla1EpNOu
         iparKkFR5MgtlJeTK+ROl+CE2WgjjEwOZ7QCF4f70UqPmCbTx+/Sgxddn1xRv0zl6566
         OwDsaW/vtp5xAGzk18YivEsaqf1bWsOFXGkeBQ01uIblyr5gDttjH7ZRl7CJXt1NO4nA
         5dhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783757862; x=1784362662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uYhcW1SCR6GHSegIq0BbrmPvOxPcseFc94iedjclU6A=;
        b=FOfmiqALLR+3xh07Us370dhQ/7XAsYz1vM19BdVYSbnJVTrDBfDZNYC1ZM+VfOAmUG
         AX2hCRcKgUOP+tHBiUxE6A3L06TGy53m5ws2RWzKdV0WgbGNUOCWDadQpMbIy2bGmemW
         eyhEaAD4rT1IdCMoraDQr3z0eJKKcxq45Yxx2NiYQ6ARJlMV8SUbHIcmgGYq9Twajs7s
         27Q2jb54CsaP7xh2kdasg3a/+KaOkD9hNAjGUN7ttRuqqjhU1iHB1tGnjlQRwYWFyqsX
         gy2pJ6OQCBO2h3GFMHomkYmnF8PP8tlzUOJJPzNWRLrfLa1NtFXlNqWZjRlr9ROflbFo
         PNJQ==
X-Forwarded-Encrypted: i=1; AHgh+RqMMruK9HuVpe7ms1IaUY17bI2eFB+uR1FdWTBHJXUwtHcPW7hlRjnStOWSUV8agE3JP37XuYLp1l0alaH5@lists.linux.dev
X-Gm-Message-State: AOJu0YytvFxI2XMA/PLGzTtez5EsEeHHuUcgsD6J9ZLIMUjyDDeUIiqO
	fl21P8Vhec4afQAh2LbqJKzeSes9wHXHYDrvg2XW/l6kWgzMpW13uU2D
X-Gm-Gg: AfdE7cnnjnncbkoMKaX9Ze0yXkR8AbkiDKLisA44zfS0UtnmPaAo7hNomXW0TwVWl33
	3+QeCzvCVwdRVd/rh+ElUmc/dOd1hKOTra4f1DyyO9ZO+HR97wVVWtqDC6qCong+7fE5StcvDDs
	WtxwTlTGHICuObk02FOP36g4+ASik0nrrewqwxNkgPTQxvA3AF7I/+mig27sjD/bCUr9qVYbhAo
	AFgZDkqFYusssbvDrDqw3bEtXSAFM/FEQR19KcC/+opbozjkScNqv11ZYGFEoRGNUKVyc/8Trlr
	cIw+9T2W5yvVE1jv34JdZ9xYqcHTRr7/MwCfwx9XYw9NBw0idmDQYdIyIsDtNZrfCdDdUhi4H/J
	NqduOmydp8D4tPwNpxaVDMN6HMdRwCiEA/sTmwZWSP7bQoWgO5nyAxDx+MlXxSde0hqhePPJo
X-Received: by 2002:ac2:5d2b:0:b0:5ae:ba27:ee63 with SMTP id 2adb3069b0e04-5b023566499mr289194e87.7.1783757862104;
        Sat, 11 Jul 2026 01:17:42 -0700 (PDT)
Received: from linux ([195.54.40.37])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01caa5bbbsm1183891e87.58.2026.07.11.01.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 01:17:41 -0700 (PDT)
From: erqeons <erqeon@gmail.com>
To: gregkh@linuxfoundation.org,
	hansg@kernel.org,
	andy@kernel.org
Cc: mchehab@kernel.org,
	sakari.ailus@intel.com,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	erqeons <erqeon@gmail.com>
Subject: [PATCH] staging: media: atomisp: fix indentation and remove dead return
Date: Sat, 11 Jul 2026 12:16:57 +0400
Message-ID: <20260711081657.37117-1-erqeon@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix style issues reported by checkpatch.pl:
- Remove unnecessary return statement in void function.
- Convert spaces to tabs for function arguments indentation.

Signed-off-by: erqeons <erqeon@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 6cd500d9f..fb1ae146b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1419,7 +1419,6 @@ static void atomisp_update_grid_info(struct atomisp_sub_device *asd,
 
 err:
 	atomisp_css_free_stat_buffers(asd);
-	return;
 }
 
 static void atomisp_curr_user_grid_info(struct atomisp_sub_device *asd,
@@ -1885,8 +1884,8 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
  * Function to check the zoom region whether is effective
  */
 static bool atomisp_check_zoom_region(
-    struct atomisp_sub_device *asd,
-    struct ia_css_dz_config *dz_config)
+	struct atomisp_sub_device *asd,
+	struct ia_css_dz_config *dz_config)
 {
 	struct atomisp_resolution  config;
 	bool flag = false;
@@ -1920,8 +1919,8 @@ static bool atomisp_check_zoom_region(
 }
 
 void atomisp_apply_css_parameters(
-    struct atomisp_sub_device *asd,
-    struct atomisp_css_params *css_param)
+	struct atomisp_sub_device *asd,
+	struct atomisp_css_params *css_param)
 {
 	if (css_param->update_flag.wb_config)
 		asd->params.config.wb_config = &css_param->wb_config;
@@ -3895,9 +3894,9 @@ enum mipi_port_id atomisp_port_to_mipi_port(struct atomisp_device *isp,
 }
 
 static inline int atomisp_set_sensor_mipi_to_isp(
-    struct atomisp_sub_device *asd,
-    enum atomisp_input_stream_id stream_id,
-    struct camera_mipi_info *mipi_info)
+	struct atomisp_sub_device *asd,
+	enum atomisp_input_stream_id stream_id,
+	struct camera_mipi_info *mipi_info)
 {
 	struct v4l2_control ctrl;
 	struct atomisp_device *isp = asd->isp;
-- 
2.53.0

