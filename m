Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8E22F37
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 12:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1674478437;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kEeT3L/F0Yehwuo7pXQXWePKjAVsttnSb2QGyFQ4YtM=;
	b=M2qCWfIJ7XEAIgTlwyIpTohQ6fe88asYAsU/rE3TYwpb20cgm/c0TWAMj2VU4Hikk34eIL
	NBHIh18HQF9VN7iRbPVmZ3liqp4DCZXMB36Wbwi/xDF0vdOAcXgacuodZVFxyXOQZ2aXQ1
	Tg3wPODwkx14elowAKpeyMXAFdUAPOE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-BdEk483FOZWBXRQm962Zag-1; Mon, 23 Jan 2023 07:53:53 -0500
X-MC-Unique: BdEk483FOZWBXRQm962Zag-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 571893814941;
	Mon, 23 Jan 2023 12:53:53 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E08DFC15BA0;
	Mon, 23 Jan 2023 12:53:50 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>,
	andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 34/57] media: atomisp: ov2680: Fix window settings and enable window for all resolutions
Date: Mon, 23 Jan 2023 13:51:42 +0100
Message-Id: <20230123125205.622152-35-hdegoede@redhat.com>
In-Reply-To: <20230123125205.622152-1-hdegoede@redhat.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8

By default the ov2680 automatically sets the window to match the outputsize
and automatically adjusts it to keep the bayer pattern stable when enabling
hflip/vflip.

This does not work for the 1616x1216 mode because there is no room to
adjust the window there. To make flipping work in the 1616 wide modes the
register lists for those modes set bit 0 of 0x5708 (manual_win_en) to 1 and
ov2680_set_bayer_order() updates the bayer-order on the pad to match.

But ov2680_set_bayer_order() is always called, so when enabling flipping
on modes with a width of less then 1616 now results in the wrong bayer
order being reported on the pad since the sensor is auto-adjusting
the window in this case.

Specify the correct (== output-size) window-size in all resolutions
register-list and always set the manual_win_en bit, so that the bayer order
is changed on hflip/vflip enable on all resolutions.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/staging/media/atomisp/i2c/ov2680.h | 76 +++++++++++-----------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/staging/media/atomisp/i2c/ov2680.h b/drivers/staging/media/atomisp/i2c/ov2680.h
index 45526477b612..54978ff9348c 100644
--- a/drivers/staging/media/atomisp/i2c/ov2680.h
+++ b/drivers/staging/media/atomisp/i2c/ov2680.h
@@ -316,11 +316,11 @@ static struct ov2680_reg const ov2680_QCIF_30fps[] = {
 	{0x4008, 0x00},
 	{0x4009, 0x03},
 	{0x5081, 0x41},
-	{0x5708, 0x00}, //add for full size flip off and mirror off 2014/09/11
-	{0x5704, 0x10},
-	{0x5705, 0xa0},
-	{0x5706, 0x0c},
-	{0x5707, 0x78},
+	{0x5708, 0x01}, //add for full size flip off and mirror off 2014/09/11
+	{0x5704, 0x00},
+	{0x5705, 0xc0},
+	{0x5706, 0x00},
+	{0x5707, 0xa0},
 	{0x3820, 0xc2},
 	{0x3821, 0x01},
 	// {0x5090, 0x0c},
@@ -355,11 +355,11 @@ static struct ov2680_reg const ov2680_CIF_30fps[] = {
 	{0x4008, 0x00},
 	{0x4009, 0x03},
 	{0x5081, 0x41},
-	{0x5708, 0x00}, //add for full size flip off and mirror off 2014/09/11
-	{0x5704, 0x10},
-	{0x5705, 0xa0},
-	{0x5706, 0x0c},
-	{0x5707, 0x78},
+	{0x5708, 0x01}, //add for full size flip off and mirror off 2014/09/11
+	{0x5704, 0x01},
+	{0x5705, 0x70},
+	{0x5706, 0x01},
+	{0x5707, 0x30},
 	{0x3820, 0xc2},
 	{0x3821, 0x01},
 	// {0x5090, 0x0c},
@@ -394,11 +394,11 @@ static struct ov2680_reg const ov2680_QVGA_30fps[] = {
 	{0x4008, 0x00},
 	{0x4009, 0x03},
 	{0x5081, 0x41},
-	{0x5708, 0x00}, //add for full size flip off and mirror off 2014/09/11
-	{0x5704, 0x10},
-	{0x5705, 0xa0},
-	{0x5706, 0x0c},
-	{0x5707, 0x78},
+	{0x5708, 0x01}, //add for full size flip off and mirror off 2014/09/11
+	{0x5704, 0x01},
+	{0x5705, 0x50},
+	{0x5706, 0x01},
+	{0x5707, 0x00},
 	{0x3820, 0xc2},
 	{0x3821, 0x01},
 	// {0x5090, 0x0c},
@@ -433,11 +433,11 @@ static struct ov2680_reg const ov2680_656x496_30fps[] = {
 	{0x4008, 0x00},
 	{0x4009, 0x03},
 	{0x5081, 0x41},
-	{0x5708, 0x00}, //add for full size flip off and mirror off 2014/09/11
-	{0x5704, 0x10},
-	{0x5705, 0xa0},
-	{0x5706, 0x0c},
-	{0x5707, 0x78},
+	{0x5708, 0x01}, //add for full size flip off and mirror off 2014/09/11
+	{0x5704, 0x02},
+	{0x5705, 0x90},
+	{0x5706, 0x01},
+	{0x5707, 0xf0},
 	{0x3820, 0xc2},
 	{0x3821, 0x01},
 	// {0x5090, 0x0c},
@@ -471,7 +471,7 @@ static struct ov2680_reg const ov2680_720x592_30fps[] = {
 	{0x3815, 0x31},
 	{0x4008, 0x00},
 	{0x4009, 0x03},
-	{0x5708, 0x00},
+	{0x5708, 0x01},
 	{0x5704, 0x02},
 	{0x5705, 0xd0}, // X_WIN;
 	{0x5706, 0x02},
@@ -510,7 +510,7 @@ static struct ov2680_reg const ov2680_800x600_30fps[] = {
 	{0x3813, 0x00},
 	{0x3814, 0x31},
 	{0x3815, 0x31},
-	{0x5708, 0x00},
+	{0x5708, 0x01},
 	{0x5704, 0x03},
 	{0x5705, 0x20},
 	{0x5706, 0x02},
@@ -552,11 +552,11 @@ static struct ov2680_reg const ov2680_720p_30fps[] = {
 	{0x4008, 0x02},
 	{0x4009, 0x09},
 	{0x5081, 0x41},
-	{0x5708, 0x00}, //add for full size flip off and mirror off 2014/09/11
-	{0x5704, 0x10},
-	{0x5705, 0xa0},
-	{0x5706, 0x0c},
-	{0x5707, 0x78},
+	{0x5708, 0x01}, //add for full size flip off and mirror off 2014/09/11
+	{0x5704, 0x05},
+	{0x5705, 0x10},
+	{0x5706, 0x02},
+	{0x5707, 0xe0},
 	{0x3820, 0xc0},
 	{0x3821, 0x00},
 	// {0x5090, 0x0c},
@@ -591,11 +591,11 @@ static struct ov2680_reg const ov2680_1296x976_30fps[] = {
 	{0x4008, 0x02},
 	{0x4009, 0x09},
 	{0x5081, 0x41},
-	{0x5708, 0x00}, //add for full size flip off and mirror off 2014/09/11
-	{0x5704, 0x10},
-	{0x5705, 0xa0},
-	{0x5706, 0x0c},
-	{0x5707, 0x78},
+	{0x5708, 0x01}, //add for full size flip off and mirror off 2014/09/11
+	{0x5704, 0x05},
+	{0x5705, 0x10},
+	{0x5706, 0x03},
+	{0x5707, 0xd0},
 	{0x3820, 0xc0},
 	{0x3821, 0x00}, //mirror/flip
 	// {0x5090, 0x0c},
@@ -630,11 +630,11 @@ static struct ov2680_reg const ov2680_1456x1096_30fps[] = {
 	{0x4008, 0x02},
 	{0x4009, 0x09},
 	{0x5081, 0x41},
-	{0x5708, 0x00}, //add for full size flip off and mirror off 2014/09/11
-	{0x5704, 0x10},
-	{0x5705, 0xa0},
-	{0x5706, 0x0c},
-	{0x5707, 0x78},
+	{0x5708, 0x01}, //add for full size flip off and mirror off 2014/09/11
+	{0x5704, 0x05},
+	{0x5705, 0xb0},
+	{0x5706, 0x04},
+	{0x5707, 0x48},
 	{0x3820, 0xc0},
 	{0x3821, 0x00},
 	// {0x5090, 0x0c},
@@ -752,7 +752,7 @@ static struct ov2680_reg const ov2680_1616x1216_30fps[] = {
 	{0x5704, 0x06},
 	{0x5705, 0x50},
 	{0x5706, 0x04},
-	{0x5707, 0xcc},
+	{0x5707, 0xc0},
 	{0x3820, 0xc0},
 	{0x3821, 0x00},
 	// {0x5090, 0x0C},
-- 
2.39.0

