Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB1C2D1F44
	for <linux-staging@lists.linux.dev>; Tue, 24 Jun 2025 14:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750774226; cv=none; b=uFhgamxBN5WXGoWAWs1UB4Bg0joMrIIWKjc46bO1CjgcUWFpJZajyJaXZx+qGLJdJtK+1LUFc2UVJ8+xDPM8iPumLBwO5yuIX2mE3AQlxhbOihH0DmAOyFMm8kukXgR6nNaEw1xW/IzzeX0O825/6f9cVw6t8z6/L8CN+W50WA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750774226; c=relaxed/simple;
	bh=hu5D2yG7YDF3qT6VuNJ7QELnHxz0FGP6x8nWUeh6yOw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DaeIXKI4shGeYzStitvY/ZJTsCR53Vs50FyjyO82jNq8kXwJjwDgDZcN2+xuzM9NdgQ1PoiHPyFsxdOAw5BqynshaZoSVQ2A65DhYBXI3D3BxoG4j/3op8dbxPBfH1X38MCnV+CChfGYg9bm0aNO79wvz5ABVdEeGjtjFYUzydc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BCRLAhhg; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BCRLAhhg"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b2c4331c50eso540999a12.3
        for <linux-staging@lists.linux.dev>; Tue, 24 Jun 2025 07:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750774224; x=1751379024; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vILkg8ZEGzs8nDPWad0XYNa3F/qA85actTxUYvIR0gc=;
        b=BCRLAhhg/vggIrR9bQ5kEGVG7IZvmdFDijpf8ER77GmPUUN1NuzcQr2d/ayJfK0KKu
         7hnhMNFUPRjNAj5Xu3x6E5nIfzv9v+JPt/jU/JvMXmMP2PopNqA1J7M203qOQ6z57MKU
         MXLl8bovtaJ9SwZUoSbgXnbL1lgrRdKty5/3oKj8ZlEcKICd+0ZBLZabSRZn4+/RP20Y
         bT9FWu3ZRa0UXW5KY/V8xcEHIMlBMT2Dqrtju5aQQmvwcO9fftFzYhWq2zADgrPMO2Nb
         bFL4krRIeoNTDogf7wW3GADoY26yh3xaIi94B69je90nXq3QXRTlSK77ZW20zEMqG6iZ
         B6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750774224; x=1751379024;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vILkg8ZEGzs8nDPWad0XYNa3F/qA85actTxUYvIR0gc=;
        b=NeEqnUJiYE/NdcaROACysiSCAbL3IhGApRdc44hYyfA/eQcK7xgZZkDn2eL9HvRZjk
         3zghdl1Y3UY0V28JAbRnq2ZF5X2jl66GulTIpIhhlHosaD1frKijVhuXJoaQAWxomRY1
         eh7x/P9DBN9nZm6kmz45Rj+ZeQrMCQR1aUqigU8wTLE6iplN8soHZAo9sE34XLoDCBam
         tWqbfmfJo5cJ8ZpmCcJTzzLrMkyXepsdY/Nk02579u4DJDtwNp5za62pBydYZvJKNUVq
         sjGEqZRswNma74W1wFuEgfxs2Ba5r0MXIlT65SZAAfvGgNWEV+sK/uw2E04kkIesIj6/
         yfVg==
X-Forwarded-Encrypted: i=1; AJvYcCXJuhjjDQJCRchOobtdW+dSI3RnmbfDhptJHmLJRkFdLEbMY68Nhpdbz7yOnsuFZ2r+b/IDpnEENi8F28R7@lists.linux.dev
X-Gm-Message-State: AOJu0YzdDMtecEGVFSk4bRktLzYd7IzPx5fzxGhEnF7wDdXmNuONMO+W
	znIcGTjdCbQfefTkYaIe37WApQWt/CoukBpBeoawaT/m/3N84WYkLfLo
X-Gm-Gg: ASbGnctQ+jW8/jaJ2sFa9UZ6SLyJ4pdbOAXFHJi/hAcRsXSLwU8oLK/6oAC7u5IIXIa
	eNiIm9ATt1+XWELNW4zsiGKt6u9LVBiotsFHlEwQaUfXNrG0UI3cCtHZC0WAy4OkBXzd2pkuMIr
	55F/wHJkIFmEBm3bwqrhrXJYdwtOjv0rO8TkygEu6VUI4CI5NUVeOna8oInwVvCeS4p2D/JcrXo
	jhEXOh9YuYSGurn0QkSvTSml2DN+/b1AACieO0l4L2kE0ssau4wUOn0nqXis6Y/p/PRZ9Ilqas9
	cVcyq2JY/bgtbGc6XYf4UzryXKA3KioblSfdsRKctLlnNJhYt542saQ3EjygJX75LWLo5KSkt8+
	xtXV1jDB67BmAUnQq7+80fE1CX1sF5blr8g899BT2qpmKI7Y8tw==
X-Google-Smtp-Source: AGHT+IHM7fdzhWlDDyjVNuz0muzjzy/ZJKs0jZVCPWYYP+Dw22irw4/etAo34nrjJNxnORqI9Z5zew==
X-Received: by 2002:a17:90b:4cd1:b0:312:639:a06a with SMTP id 98e67ed59e1d1-3159d8fce9bmr21905357a91.31.1750774223961;
        Tue, 24 Jun 2025 07:10:23 -0700 (PDT)
Received: from DESKTOP-RD0GVCL.localdomain (124-218-195-161.cm.dynamic.apol.com.tw. [124.218.195.161])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159e07d7c0sm10871747a91.46.2025.06.24.07.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 07:10:22 -0700 (PDT)
From: LiangCheng Wang <zaq14760@gmail.com>
Date: Tue, 24 Jun 2025 22:10:00 +0800
Subject: [PATCH v4] staging: media: atomisp: fix coding style in
 ia_css_output.host.c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-bar-v4-1-9f9f9ae9f868@gmail.com>
X-B4-Tracking: v=1; b=H4sIALexWmgC/23MTQ7CIBCG4asY1mL4K7SuvIdxAePQktjWgCGap
 neX1k01Lt/JPN9EEsaAiRx3E4mYQwrjUELtdwQ6O7RIw7U0EUxUTAtOnY20MtLVTjHvakbK5z2
 iD8915Xwp3YX0GONrHc18uX77zCmnlZVoGFNKCzi1vQ23A4w9WXwWf4woRqEGD8Y0mqtfI7dGf
 IxcDEDD0TMO0m7NPM9vx1x5Z/4AAAA=
X-Change-ID: 20250621-bar-573b8b40fb80
To: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, LiangCheng Wang <zaq14760@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750774217; l=6451;
 i=zaq14760@gmail.com; h=from:subject:message-id;
 bh=hu5D2yG7YDF3qT6VuNJ7QELnHxz0FGP6x8nWUeh6yOw=;
 b=qRIAQRDbJ/R5qEE9RO9CF7rAymxmlNHm+GMk++kWB6uFkP3xYY9fQMACVzxUNHnYUigaVFXCo
 IMGhdAyH8r2Bl4zLlZxdOZWZo/SlqzRed6LuZ4sF+eEn4VOrvaaDcry
X-Developer-Key: i=zaq14760@gmail.com; a=ed25519;
 pk=/x4391DbJ19fFQI7t33HWt3lsHfYPl2I2ax8C+Vxr+M=

Fix multiple checkpatch.pl ERRORs and coding style issues:

- Use tabs instead of spaces for indentation
- Move trailing `if` statements to multiline format
- Remove excessive space between type and asterisk in function
  arguments
- Move assignment operator '=' to the same line for static struct
  definitions
- Remove unnecessary line breaks in function definitions

This cleanup improves code readability and follows Linux kernel
coding standards.

Signed-off-by: LiangCheng Wang <zaq14760@gmail.com>
---
This patch fixes coding style violations detected by checkpatch.pl in the atomisp driver under staging.

- Use tabs instead of spaces for indentation
- Move trailing `if` statements to multiline format
- Remove excessive spaces between type and asterisk in function
  arguments
- Move assignment operator '=' to the same line for static struct
  definitions
- Remove unnecessary line breaks in function definitions

This cleanup improves code readability and follows Linux kernel coding standards.
---
Changes in v4:
- Moved assignment operator '=' to the same line for static struct definitions
- Remove unnecessary line breaks in function definitions
- Update commit message to reflect all the coding style fixes
- Link to v3: https://lore.kernel.org/r/20250622-bar-v3-1-4cc91ef01c3a@gmail.com

Changes in v3:
- Removed extra spaces between type and asterisk (e.g., `*to`) in function
  declarations, as pointed out by Andy Shevchenko
- Update commit message to reflect all the coding style fixes
- Link to v2: https://lore.kernel.org/r/20250621-bar-v2-1-4e6cfc779614@gmail.com

Changes in v2:
- Fix patch subject prefix to "staging: media: atomisp:" to comply with media CI style.
- No other functional changes.

Link to v1: https://lore.kernel.org/r/20250621-bar-v1-1-5a3e7004462c@gmail.com
---
 .../kernels/output/output_1.0/ia_css_output.host.c | 42 ++++++++++------------
 1 file changed, 19 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
index d09365e0c47104dbffbd455bfd649b9079f88c9c..560102e81aed7a56125a97f0fff8c46de440e74d 100644
--- a/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
+++ b/drivers/staging/media/atomisp/pci/isp/kernels/output/output_1.0/ia_css_output.host.c
@@ -22,21 +22,18 @@ static const struct ia_css_output_configuration default_output_configuration = {
 	.info = (struct ia_css_frame_info *)NULL,
 };
 
-static const struct ia_css_output0_configuration default_output0_configuration
-	= {
+static const struct ia_css_output0_configuration default_output0_configuration = {
 	.info = (struct ia_css_frame_info *)NULL,
 };
 
-static const struct ia_css_output1_configuration default_output1_configuration
-	= {
+static const struct ia_css_output1_configuration default_output1_configuration = {
 	.info = (struct ia_css_frame_info *)NULL,
 };
 
 void
-ia_css_output_encode(
-    struct sh_css_isp_output_params *to,
-    const struct ia_css_output_config *from,
-    unsigned int size)
+ia_css_output_encode(struct sh_css_isp_output_params *to,
+		     const struct ia_css_output_config *from,
+		     unsigned int size)
 {
 	(void)size;
 	to->enable_hflip = from->enable_hflip;
@@ -44,7 +41,7 @@ ia_css_output_encode(
 }
 
 int ia_css_output_config(struct sh_css_isp_output_isp_config *to,
-			 const struct ia_css_output_configuration  *from,
+			 const struct ia_css_output_configuration *from,
 			 unsigned int size)
 {
 	unsigned int elems_a = ISP_VEC_NELEMS;
@@ -66,21 +63,21 @@ int ia_css_output_config(struct sh_css_isp_output_isp_config *to,
 	return 0;
 }
 
-int ia_css_output0_config(struct sh_css_isp_output_isp_config       *to,
+int ia_css_output0_config(struct sh_css_isp_output_isp_config *to,
 			  const struct ia_css_output0_configuration *from,
 			  unsigned int size)
 {
 	return ia_css_output_config(to, (const struct ia_css_output_configuration *)from, size);
 }
 
-int ia_css_output1_config(struct sh_css_isp_output_isp_config       *to,
-		          const struct ia_css_output1_configuration *from,
+int ia_css_output1_config(struct sh_css_isp_output_isp_config *to,
+			  const struct ia_css_output1_configuration *from,
 			  unsigned int size)
 {
 	return ia_css_output_config(to, (const struct ia_css_output_configuration *)from, size);
 }
 
-int ia_css_output_configure(const struct ia_css_binary     *binary,
+int ia_css_output_configure(const struct ia_css_binary *binary,
 			    const struct ia_css_frame_info *info)
 {
 	if (info) {
@@ -94,8 +91,8 @@ int ia_css_output_configure(const struct ia_css_binary     *binary,
 	return 0;
 }
 
-int ia_css_output0_configure(const struct ia_css_binary    *binary,
-			    const struct ia_css_frame_info *info)
+int ia_css_output0_configure(const struct ia_css_binary *binary,
+			     const struct ia_css_frame_info *info)
 {
 	if (info) {
 		struct ia_css_output0_configuration config =
@@ -108,7 +105,7 @@ int ia_css_output0_configure(const struct ia_css_binary    *binary,
 	return 0;
 }
 
-int ia_css_output1_configure(const struct ia_css_binary     *binary,
+int ia_css_output1_configure(const struct ia_css_binary *binary,
 			     const struct ia_css_frame_info *info)
 {
 	if (info) {
@@ -123,11 +120,11 @@ int ia_css_output1_configure(const struct ia_css_binary     *binary,
 }
 
 void
-ia_css_output_dump(
-    const struct sh_css_isp_output_params *output,
-    unsigned int level)
+ia_css_output_dump(const struct sh_css_isp_output_params *output,
+		   unsigned int level)
 {
-	if (!output) return;
+	if (!output)
+		return;
 	ia_css_debug_dtrace(level, "Horizontal Output Flip:\n");
 	ia_css_debug_dtrace(level, "\t%-32s = %d\n",
 			    "enable", output->enable_hflip);
@@ -137,9 +134,8 @@ ia_css_output_dump(
 }
 
 void
-ia_css_output_debug_dtrace(
-    const struct ia_css_output_config *config,
-    unsigned int level)
+ia_css_output_debug_dtrace(const struct ia_css_output_config *config,
+			   unsigned int level)
 {
 	ia_css_debug_dtrace(level,
 			    "config.enable_hflip=%d",

---
base-commit: 3f75bfff44be0646580fe4efda45d646f9c1693b
change-id: 20250621-bar-573b8b40fb80

Best regards,
-- 
LiangCheng Wang <zaq14760@gmail.com>

