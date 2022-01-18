Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 238EA2C82
	for <linux-staging@lists.linux.dev>; Tue, 18 Jan 2022 02:33:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BF99C36AF5;
	Tue, 18 Jan 2022 02:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1642473184;
	bh=oXLBzOz/hkAg5gBd5Fy/0nL79/vChLwPGP35T3oMc8g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PCHbYUi+kHXgcOwAeocUgjgWt3OH26V6oqAIy+KWIK6jtLUcegEC1DlXjrO/JkO/F
	 D5mV1npOaXC6O09ZsXxzREe6F3emuGUqiNe6EiK5krVYIg5o31nfm+tOjJFI8ZB5/+
	 fD5miAxF9N0hW45IowEpw+k+F+THnjBz7cl4UyWPKPxlrzwd1IluIgHPxpBgOUjYcF
	 9ZM4SPxWwOJ1fI1sbeByAxScuzykx4k9+X1pA3kAJNAlKsf9AvI9aG66dokf1HcutB
	 q0qWcbHoLOUFrEQ2nPTH4zVUf/+vklRtuRpDpFQfmhSUIB7jG2EiBVk4j7Zv0d2K7/
	 AgTVdicfdOZTw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	rdunlap@infradead.org,
	unixbhaskar@gmail.com,
	drv@mailo.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH AUTOSEL 5.15 017/188] media: atomisp-ov2680: Fix ov2680_set_fmt() clobbering the exposure
Date: Mon, 17 Jan 2022 21:29:01 -0500
Message-Id: <20220118023152.1948105-17-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118023152.1948105-1-sashal@kernel.org>
References: <20220118023152.1948105-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 4492289c31364d28c2680b43b18883385a5d216c ]

Now that we restore the default or last user set exposure setting on
power_up() there is no need for the registers written by ov2680_set_fmt()
to write to the exposure register.

Not doing so fixes the exposure always being reset to the value from
the res->regs array after a set_fmt().

Link: https://lore.kernel.org/linux-media/20211107171549.267583-11-hdegoede@redhat.com
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/staging/media/atomisp/i2c/ov2680.h | 24 ----------------------
 1 file changed, 24 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index 874115f35fcad..798b28e134b64 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -289,8 +289,6 @@ static struct ov2680_reg const ov2680_global_setting[] = {
  */
 static struct ov2680_reg const ov2680_QCIF_30fps[] = {
 	{0x3086, 0x01},
-	{0x3501, 0x24},
-	{0x3502, 0x40},
 	{0x370a, 0x23},
 	{0x3801, 0xa0},
 	{0x3802, 0x00},
@@ -334,8 +332,6 @@ static struct ov2680_reg const ov2680_QCIF_30fps[] = {
  */
 static struct ov2680_reg const ov2680_CIF_30fps[] = {
 	{0x3086, 0x01},
-	{0x3501, 0x24},
-	{0x3502, 0x40},
 	{0x370a, 0x23},
 	{0x3801, 0xa0},
 	{0x3802, 0x00},
@@ -377,8 +373,6 @@ static struct ov2680_reg const ov2680_CIF_30fps[] = {
  */
 static struct ov2680_reg const ov2680_QVGA_30fps[] = {
 	{0x3086, 0x01},
-	{0x3501, 0x24},
-	{0x3502, 0x40},
 	{0x370a, 0x23},
 	{0x3801, 0xa0},
 	{0x3802, 0x00},
@@ -420,8 +414,6 @@ static struct ov2680_reg const ov2680_QVGA_30fps[] = {
  */
 static struct ov2680_reg const ov2680_656x496_30fps[] = {
 	{0x3086, 0x01},
-	{0x3501, 0x24},
-	{0x3502, 0x40},
 	{0x370a, 0x23},
 	{0x3801, 0xa0},
 	{0x3802, 0x00},
@@ -463,8 +455,6 @@ static struct ov2680_reg const ov2680_656x496_30fps[] = {
  */
 static struct ov2680_reg const ov2680_720x592_30fps[] = {
 	{0x3086, 0x01},
-	{0x3501, 0x26},
-	{0x3502, 0x40},
 	{0x370a, 0x23},
 	{0x3801, 0x00}, // X_ADDR_START;
 	{0x3802, 0x00},
@@ -508,8 +498,6 @@ static struct ov2680_reg const ov2680_720x592_30fps[] = {
  */
 static struct ov2680_reg const ov2680_800x600_30fps[] = {
 	{0x3086, 0x01},
-	{0x3501, 0x26},
-	{0x3502, 0x40},
 	{0x370a, 0x23},
 	{0x3801, 0x00},
 	{0x3802, 0x00},
@@ -551,8 +539,6 @@ static struct ov2680_reg const ov2680_800x600_30fps[] = {
  */
 static struct ov2680_reg const ov2680_720p_30fps[] = {
 	{0x3086, 0x00},
-	{0x3501, 0x48},
-	{0x3502, 0xe0},
 	{0x370a, 0x21},
 	{0x3801, 0xa0},
 	{0x3802, 0x00},
@@ -594,8 +580,6 @@ static struct ov2680_reg const ov2680_720p_30fps[] = {
  */
 static struct ov2680_reg const ov2680_1296x976_30fps[] = {
 	{0x3086, 0x00},
-	{0x3501, 0x48},
-	{0x3502, 0xe0},
 	{0x370a, 0x21},
 	{0x3801, 0xa0},
 	{0x3802, 0x00},
@@ -637,8 +621,6 @@ static struct ov2680_reg const ov2680_1296x976_30fps[] = {
  */
 static struct ov2680_reg const ov2680_1456x1096_30fps[] = {
 	{0x3086, 0x00},
-	{0x3501, 0x48},
-	{0x3502, 0xe0},
 	{0x370a, 0x21},
 	{0x3801, 0x90},
 	{0x3802, 0x00},
@@ -682,8 +664,6 @@ static struct ov2680_reg const ov2680_1456x1096_30fps[] = {
 
 static struct ov2680_reg const ov2680_1616x916_30fps[] = {
 	{0x3086, 0x00},
-	{0x3501, 0x48},
-	{0x3502, 0xe0},
 	{0x370a, 0x21},
 	{0x3801, 0x00},
 	{0x3802, 0x00},
@@ -726,8 +706,6 @@ static struct ov2680_reg const ov2680_1616x916_30fps[] = {
 #if 0
 static struct ov2680_reg const ov2680_1616x1082_30fps[] = {
 	{0x3086, 0x00},
-	{0x3501, 0x48},
-	{0x3502, 0xe0},
 	{0x370a, 0x21},
 	{0x3801, 0x00},
 	{0x3802, 0x00},
@@ -769,8 +747,6 @@ static struct ov2680_reg const ov2680_1616x1082_30fps[] = {
  */
 static struct ov2680_reg const ov2680_1616x1216_30fps[] = {
 	{0x3086, 0x00},
-	{0x3501, 0x48},
-	{0x3502, 0xe0},
 	{0x370a, 0x21},
 	{0x3801, 0x00},
 	{0x3802, 0x00},
-- 
2.34.1

