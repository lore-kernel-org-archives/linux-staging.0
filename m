Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C20D52BDC16
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 21:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772399522; cv=none; b=V+ujGhg/AWGFTYsNv8C85oRui90EHji3Dx5VPVG9oE4hn2i35c1qci1z20pPsj0jQedSt8PhVXXYIkk1HK0oh2PEiF3mnPap4i0QDPo/eQqW7m76waRdDeJpIrFKtGyUDrxMys4xC5o1Y/InqjcIjMdXPR5bH1kQN+q5ltCy5zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772399522; c=relaxed/simple;
	bh=RQ+vtHGqIS/AAu8htrEbF8eZ2rf1ifC9yYt5fnDroNY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BJ6DO3QVMi4lvtFOMBGeOEvD/z9lZaP5KV0r4gCmrLSgXLYQXnd1SjzyZ0wpGSAjKyeDotiAJYpvyGfs/S9e26S7lzF5ou2Ahz/4X/8P27ZqNvwvLYotfQ8yOBJ93gsjvcV6ug5UlfXPOJcF5Hwsyz+4NV82SXxzp5MTiAeY1s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZIEvWrL; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZIEvWrL"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38709888abeso53595821fa.1
        for <linux-staging@lists.linux.dev>; Sun, 01 Mar 2026 13:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772399519; x=1773004319; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bNm0amWhLXAMGz/6/V/oPbeTvN0A1hrQArZ+yuuDzPM=;
        b=kZIEvWrLAkS6lk+qYOo8vWIDF4r5fu5IzaX3OhCv+Z8i51L4DM9+ucNkXp5DFjkkTk
         6LyU28G43+ujZJXrwwxLZRAn/fe3QPFG5bz8sy8QPwBcQ3CTuKO2VXHkZkUDfC2exNl/
         VD+EmoZrQqlRLcKZ90/JO4OVb9SDYJQ+KacOESXD4hR/e88OJb1EYWBa7Jdjcrwupeui
         hAntVgUcmTLCZaLzZggwxl8W8vyJ305i034+3WVX6CNkkhQEfSi2dZ4+7Q7EIXfBAjwe
         +owaVVwD+HAruRixUKBjftx9nKa3H1AJC2BNL1RZIph/HUaczbwcWeI9r7OWHJ1OBiiI
         +jkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772399519; x=1773004319;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNm0amWhLXAMGz/6/V/oPbeTvN0A1hrQArZ+yuuDzPM=;
        b=ddHILuhp10fNzl145xkFylN+dcaeBvZZFhwcD2ErLa5u7vL2NueKJZYOWcyEIvECoK
         OGjD7yyOtlNVfbGeqfq0BguU2X3RmuN79lUr+PNlpLiquW4OknX9CFKiVP82AgxMeIiN
         JNTYBgxBshGCX4EanAgBofMMsbDTst5S4UELivPu2OKWsmSJT5SLDb1Fohx9gA347yHg
         SN8on7/uQlSMV/uNRZ+lay0keyI/TW0Rz08CMSyLfsRJUvvkWRLQoCN0zyVoU1//5Qmn
         mbWYltYLssO7bMkYI0qaQusZY/a+kedi+ZEqWqPIOkA3qxDl+ftXndSzB4Vhm/jW1OBp
         m+3w==
X-Gm-Message-State: AOJu0YzCPAESZ7g10vWLyas9TGLwIjeJ5afEG+9U/T67LU+rpQ4+8NL0
	V0gI3OcWDFaMdcyKpDIRZnk3Y33EB4JRN7rKQwGWh2HuepxiiGcIp6eMxhtVLQ==
X-Gm-Gg: ATEYQzw26iq5HM3gD5mvVeNg8uSxvc5H5JxZy916QTgMwnv5KQJOBFtlgh+uKo/PCeR
	poN2bUtEzT5X1ZhK8r9dxcxkA+VmXuZLqjAVAOrWHa/DumBzlu13UHdfxjDqd8zyqd+dM6j9pjt
	DkBUedmsyzLopNObkHuJcjlEbNoPw3SyYb2ODe1Ocqk/RiESEUDM6tyzw4xIQ6wQQMJtyZwSSfR
	zZLQb3dcQ4Z5dxD091Q58KB7sG/gpVFIDoLX0ncxBEiUseJQ1zcZwM3/I2KQiiLK0I9Ejjoh3pQ
	p3qMJK1SF54KvNhq4PkOdR+1MTy9MiI8mZGiTg0ntj01XbgxqSOW0PZTndJlzWJzbeXT1N1+MP/
	vNarREg5Cm/PFY6Iavf2nbXUwfh3PKC1pexvWK1vTMSBHSs3NSdogWQTGf6vwhcEAmHzmrICWFy
	H9Edrrzqg3v96YfhQTRN/bxn/ENU5vrvdhwqI4jXWUBaCd8noa9FX8vs0sENLd7s1sscpoMbaH3
	g==
X-Received: by 2002:a05:651c:41dc:b0:386:1ce2:11a6 with SMTP id 38308e7fff4ca-389ff34d081mr73317951fa.24.1772399518863;
        Sun, 01 Mar 2026 13:11:58 -0800 (PST)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a11a12923dsm659839e87.64.2026.03.01.13.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 13:11:58 -0800 (PST)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: hansg@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH] staging: atomisp: fix indentation in atomisp_cmd.c
Date: Sun,  1 Mar 2026 22:11:42 +0100
Message-ID: <20260301211142.3479-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix incorrect spaces at the start of lines in function
parameter lists, replacing them with proper tab indentation.

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 5bc1541b1e40..9d22ec27ea76 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1888,8 +1888,8 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
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
@@ -1923,8 +1923,8 @@ static bool atomisp_check_zoom_region(
 }
 
 void atomisp_apply_css_parameters(
-    struct atomisp_sub_device *asd,
-    struct atomisp_css_params *css_param)
+	struct atomisp_sub_device *asd,
+	struct atomisp_css_params *css_param)
 {
 	if (css_param->update_flag.wb_config)
 		asd->params.config.wb_config = &css_param->wb_config;
@@ -3897,9 +3897,9 @@ enum mipi_port_id atomisp_port_to_mipi_port(struct atomisp_device *isp,
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
2.43.0

