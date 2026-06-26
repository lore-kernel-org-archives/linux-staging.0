Received: from sender-pp-o91.zoho.in (sender-pp-o91.zoho.in [103.117.158.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADE03BBFC0
	for <linux-staging@lists.linux.dev>; Fri, 26 Jun 2026 09:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=103.117.158.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782466646; cv=pass; b=LbxcRDSHLrHHZEVHI6iwRFQlnFrpVoI0Zkgu7d3b5gB37rdYEN0yr6yN053XoWi49qIOZvDMiAaggUvv0vaMnjo4qKCjhJ0IsnE97uF5apttciIb+chsfNWisLrA2yaEuowI7IlTU9NdkKmwrl5YIFA8RKePTQrha5qsV1o92e8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782466646; c=relaxed/simple;
	bh=EDzyPLRNwyJeW7mdnTxJcalEamSkaYScLQQ+Db6Uhm8=;
	h=Date:From:To:Cc:Message-ID:Subject:MIME-Version:Content-Type; b=sPRVWaTe9hcKlKmapxkO70erZUc1vig503mQh2UKsn08lIPD0dD8vCc1kkqDJzwPqd5nL48tB3H7ny/V1cK/wA2HVL0YtOC0bdvDgJme7d188AaXTzEsLOPL+QDbyMijC3dZmqUcQOO3+k1oY8D3Z2rqqG/DRYpdoZ+0zQ8C1dI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in; spf=pass smtp.mailfrom=zohomail.in; dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b=C77dd1RG; arc=pass smtp.client-ip=103.117.158.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.in header.i=linuxuser509@zohomail.in header.b="C77dd1RG"
ARC-Seal: i=1; a=rsa-sha256; t=1782466601; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=EMX57tMG0xSV0sUrBpeZ9DTPj9XgGrqc52wMfCKsIDUGaHGs1+YhXmVpJoMWnMAZ6uJ1VTB+zRrzOeOXT3i9+M170eRS5hphumA0IaxFzDutNHtkanexyD5q5XdH0Kkob60w/kSiOzoqipdjSWEHeoiDVDFJcIS8av/nLe44/N8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1782466601; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4hUCXwwR0GhzT6BTdD3aW83uRHVDmDa0eavLns7JV2g=; 
	b=AUpbdVma9jGc5C94sVfpQxzmdMrs9kfCu9NZS0GrSVMRP4XfB575zfdjJPKME8qHH2UES+T9Lef1PsOOiKktVqWUlgl6kjfJQXvGMCCB94SzDtV3+jERpyufdZu+cRCwbJXlhq8o/9ZIikDb7I5HbtJa/I+n4+WBCImQgWq8L8c=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=zohomail.in;
	spf=pass  smtp.mailfrom=linuxuser509@zohomail.in;
	dmarc=pass header.from=<linuxuser509@zohomail.in>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1782466601;
	s=zoho; d=zohomail.in; i=linuxuser509@zohomail.in;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=4hUCXwwR0GhzT6BTdD3aW83uRHVDmDa0eavLns7JV2g=;
	b=C77dd1RGUE51fSaiqloZY/ZEhwUYLk5WwtOdf1fOYJRI6iyUWDMxct9NN6ZcCxzK
	mfnrtvLLuyQOF3pHXxL8Rsn88xG7MfWfoN9DltqcEcH0zL2l0mhnx2LmvCwIJdQbeXY
	o6LA9mK2G8/6s7kAWVltwmmSUJDB6TS2SbZ4foK8=
Received: from mail.zoho.in by mx.zoho.in
	with SMTP id 1782466600282251.0316451282996; Fri, 26 Jun 2026 15:06:40 +0530 (IST)
Received: from  [152.57.239.37] by mail.zoho.in
	with HTTP;Fri, 26 Jun 2026 15:06:40 +0530 (IST)
Date: Fri, 26 Jun 2026 15:06:40 +0530
From: Ashwin Gundarapu <linuxuser509@zohomail.in>
To: "gregkh" <gregkh@linuxfoundation.org>
Cc: "linux-staging" <linux-staging@lists.linux.dev>,
	"linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <19f0349dd14.1bc6649d56096.1569442698771761840@zohomail.in>
Subject: [PATCH v2] staging: greybus: camera: remove broken camera driver
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

From 7ca271ef0862b0ca24fb50fb1823699fd67ef318 Mon Sep 17 00:00:00 2001
From: Ashwin Gundarapu <linuxuser509@outlook.com>
Date: Fri, 26 Jun 2026 15:03:18 +0530
Subject: [PATCH] staging: greybus: camera: remove broken camera driver
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

The Greybus camera driver has been non-functional since its inclusion
due to a missing greybus_protocols.h header and reliance on deprecated
v4l2_mbus_pixelcode enum.

The Project Ara hardware this driver was written for never shipped,
and the driver has seen no real fixes in over 8 years=E2=80=94only treewide
cleanups such as GFP_KERNEL conversions and debugfs error handling
changes.

Remove the entire camera driver (~1,174 lines), along with its
Makefile and Kconfig entries.

Signed-off-by: Ashwin Gundarapu <linuxuser509@zohomail.in>
Signed-off-by: Ashwin Gundarapu <linuxuser509@outlook.com>
---
 drivers/staging/greybus/Kconfig     |   10 -
 drivers/staging/greybus/Makefile    |    1 -
 drivers/staging/greybus/camera.c    | 1367 ---------------------------
 drivers/staging/greybus/gb-camera.h |  127 ---
 4 files changed, 1505 deletions(-)
 delete mode 100644 drivers/staging/greybus/camera.c
 delete mode 100644 drivers/staging/greybus/gb-camera.h

diff --git a/drivers/staging/greybus/Kconfig b/drivers/staging/greybus/Kcon=
fig
index 7635f3e850fa..ed4f36e9de99 100644
--- a/drivers/staging/greybus/Kconfig
+++ b/drivers/staging/greybus/Kconfig
@@ -32,16 +32,6 @@ config GREYBUS_BOOTROM
 =09  To compile this code as a module, chose M here: the module
 =09  will be called gb-bootrom.ko
=20
-config GREYBUS_CAMERA
-=09tristate "Greybus Camera Class driver"
-=09depends on MEDIA_SUPPORT && LEDS_CLASS_FLASH && BROKEN
-=09help
-=09  Select this option if you have a device that follows the
-=09  Greybus Camera Class specification.
-
-=09  To compile this code as a module, chose M here: the module
-=09  will be called gb-camera.ko
-
 config GREYBUS_FIRMWARE
 =09tristate "Greybus Firmware Download Class driver"
 =09depends on SPI
diff --git a/drivers/staging/greybus/Makefile b/drivers/staging/greybus/Mak=
efile
index 7c5e89622334..c903362f47f9 100644
--- a/drivers/staging/greybus/Makefile
+++ b/drivers/staging/greybus/Makefile
@@ -16,7 +16,6 @@ gb-raw-y=09=09:=3D raw.o
 gb-vibrator-y=09=09:=3D vibrator.o
=20
 obj-$(CONFIG_GREYBUS_BOOTROM)=09+=3D gb-bootrom.o
-obj-$(CONFIG_GREYBUS_CAMERA)=09+=3D gb-camera.o
 obj-$(CONFIG_GREYBUS_FIRMWARE)=09+=3D gb-firmware.o gb-spilib.o
 obj-$(CONFIG_GREYBUS_HID)=09+=3D gb-hid.o
 obj-$(CONFIG_GREYBUS_LIGHT)=09+=3D gb-light.o
diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/cam=
era.c
deleted file mode 100644
index 62b55bb28408..000000000000
--- a/drivers/staging/greybus/camera.c
+++ /dev/null
@@ -1,1367 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Greybus Camera protocol driver.
- *
- * Copyright 2015 Google Inc.
- * Copyright 2015 Linaro Ltd.
- */
-
-#include <linux/debugfs.h>
-#include <linux/fs.h>
-#include <linux/kernel.h>
-#include <linux/module.h>
-#include <linux/slab.h>
-#include <linux/string.h>
-#include <linux/uaccess.h>
-#include <linux/vmalloc.h>
-#include <linux/greybus.h>
-
-#include "gb-camera.h"
-#include "greybus_protocols.h"
-
-enum gb_camera_debugs_buffer_id {
-=09GB_CAMERA_DEBUGFS_BUFFER_CAPABILITIES,
-=09GB_CAMERA_DEBUGFS_BUFFER_STREAMS,
-=09GB_CAMERA_DEBUGFS_BUFFER_CAPTURE,
-=09GB_CAMERA_DEBUGFS_BUFFER_FLUSH,
-=09GB_CAMERA_DEBUGFS_BUFFER_MAX,
-};
-
-struct gb_camera_debugfs_buffer {
-=09char data[PAGE_SIZE];
-=09size_t length;
-};
-
-enum gb_camera_state {
-=09GB_CAMERA_STATE_UNCONFIGURED,
-=09GB_CAMERA_STATE_CONFIGURED,
-};
-
-/**
- * struct gb_camera - A Greybus Camera Device
- * @connection: the greybus connection for camera management
- * @data_connection: the greybus connection for camera data
- * @data_cport_id: the data CPort ID on the module side
- * @mutex: protects the connection and state fields
- * @state: the current module state
- * @debugfs: debugfs entries for camera protocol operations testing
- * @module: Greybus camera module registered to HOST processor.
- */
-struct gb_camera {
-=09struct gb_bundle *bundle;
-=09struct gb_connection *connection;
-=09struct gb_connection *data_connection;
-=09u16 data_cport_id;
-
-=09struct mutex mutex;
-=09enum gb_camera_state state;
-
-=09struct {
-=09=09struct dentry *root;
-=09=09struct gb_camera_debugfs_buffer *buffers;
-=09} debugfs;
-
-=09struct gb_camera_module module;
-};
-
-struct gb_camera_stream_config {
-=09unsigned int width;
-=09unsigned int height;
-=09unsigned int format;
-=09unsigned int vc;
-=09unsigned int dt[2];
-=09unsigned int max_size;
-};
-
-struct gb_camera_fmt_info {
-=09enum v4l2_mbus_pixelcode mbus_code;
-=09unsigned int gb_format;
-=09unsigned int bpp;
-};
-
-/* GB format to media code map */
-static const struct gb_camera_fmt_info gb_fmt_info[] =3D {
-=09{
-=09=09.mbus_code =3D V4L2_MBUS_FMT_UYVY8_1X16,
-=09=09.gb_format =3D 0x01,
-=09=09.bpp=09   =3D 16,
-=09},
-=09{
-=09=09.mbus_code =3D V4L2_MBUS_FMT_NV12_1x8,
-=09=09.gb_format =3D 0x12,
-=09=09.bpp=09   =3D 12,
-=09},
-=09{
-=09=09.mbus_code =3D V4L2_MBUS_FMT_NV21_1x8,
-=09=09.gb_format =3D 0x13,
-=09=09.bpp=09   =3D 12,
-=09},
-=09{
-=09=09.mbus_code =3D V4L2_MBUS_FMT_YU12_1x8,
-=09=09.gb_format =3D 0x16,
-=09=09.bpp=09   =3D 12,
-=09},
-=09{
-=09=09.mbus_code =3D V4L2_MBUS_FMT_YV12_1x8,
-=09=09.gb_format =3D 0x17,
-=09=09.bpp=09   =3D 12,
-=09},
-=09{
-=09=09.mbus_code =3D V4L2_MBUS_FMT_JPEG_1X8,
-=09=09.gb_format =3D 0x40,
-=09=09.bpp=09   =3D 0,
-=09},
-=09{
-=09=09.mbus_code =3D V4L2_MBUS_FMT_GB_CAM_METADATA_1X8,
-=09=09.gb_format =3D 0x41,
-=09=09.bpp=09   =3D 0,
-=09},
-=09{
-=09=09.mbus_code =3D V4L2_MBUS_FMT_GB_CAM_DEBUG_DATA_1X8,
-=09=09.gb_format =3D 0x42,
-=09=09.bpp=09   =3D 0,
-=09},
-=09{
-=09=09.mbus_code =3D V4L2_MBUS_FMT_SBGGR10_1X10,
-=09=09.gb_format =3D 0x80,
-=09=09.bpp=09   =3D 10,
-=09},
-=09{
-=09=09.mbus_code =3D V4L2_MBUS_FMT_SGBRG10_1X10,
-=09=09.gb_format =3D 0x81,
-=09=09.bpp=09   =3D 10,
-=09},
-=09{
-=09=09.mbus_code =3D V4L2_MBUS_FMT_SGRBG10_1X10,
-=09=09.gb_format =3D 0x82,
-=09=09.bpp=09   =3D 10,
-=09},
-=09{
-=09=09.mbus_code =3D V4L2_MBUS_FMT_SRGGB10_1X10,
-=09=09.gb_format =3D 0x83,
-=09=09.bpp=09   =3D 10,
-=09},
-=09{
-=09=09.mbus_code =3D V4L2_MBUS_FMT_SBGGR12_1X12,
-=09=09.gb_format =3D 0x84,
-=09=09.bpp=09   =3D 12,
-=09},
-=09{
-=09=09.mbus_code =3D V4L2_MBUS_FMT_SGBRG12_1X12,
-=09=09.gb_format =3D 0x85,
-=09=09.bpp=09   =3D 12,
-=09},
-=09{
-=09=09.mbus_code =3D V4L2_MBUS_FMT_SGRBG12_1X12,
-=09=09.gb_format =3D 0x86,
-=09=09.bpp=09   =3D 12,
-=09},
-=09{
-=09=09.mbus_code =3D V4L2_MBUS_FMT_SRGGB12_1X12,
-=09=09.gb_format =3D 0x87,
-=09=09.bpp=09   =3D 12,
-=09},
-};
-
-static const struct gb_camera_fmt_info *gb_camera_get_format_info(u16 gb_f=
mt)
-{
-=09unsigned int i;
-
-=09for (i =3D 0; i < ARRAY_SIZE(gb_fmt_info); i++) {
-=09=09if (gb_fmt_info[i].gb_format =3D=3D gb_fmt)
-=09=09=09return &gb_fmt_info[i];
-=09}
-
-=09return NULL;
-}
-
-#define ES2_APB_CDSI0_CPORT=09=0916
-#define ES2_APB_CDSI1_CPORT=09=0917
-
-#define GB_CAMERA_MAX_SETTINGS_SIZE=098192
-
-static int gb_camera_operation_sync_flags(struct gb_connection *connection=
,
-=09=09=09=09=09  int type, unsigned int flags,
-=09=09=09=09=09  void *request, size_t request_size,
-=09=09=09=09=09  void *response, size_t *response_size)
-{
-=09struct gb_operation *operation;
-=09int ret;
-
-=09operation =3D gb_operation_create_flags(connection, type, request_size,
-=09=09=09=09=09      *response_size, flags,
-=09=09=09=09=09      GFP_KERNEL);
-=09if (!operation)
-=09=09return  -ENOMEM;
-
-=09if (request_size)
-=09=09memcpy(operation->request->payload, request, request_size);
-
-=09ret =3D gb_operation_request_send_sync(operation);
-=09if (ret) {
-=09=09dev_err(&connection->hd->dev,
-=09=09=09"%s: synchronous operation of type 0x%02x failed: %d\n",
-=09=09=09connection->name, type, ret);
-=09} else {
-=09=09*response_size =3D operation->response->payload_size;
-
-=09=09if (operation->response->payload_size)
-=09=09=09memcpy(response, operation->response->payload,
-=09=09=09       operation->response->payload_size);
-=09}
-
-=09gb_operation_put(operation);
-
-=09return ret;
-}
-
-static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
-=09=09=09=09      struct gb_camera_configure_streams_response *resp)
-{
-=09unsigned int max_pkt_size =3D 0;
-=09unsigned int i;
-
-=09for (i =3D 0; i < resp->num_streams; i++) {
-=09=09struct gb_camera_stream_config_response *cfg =3D &resp->config[i];
-=09=09const struct gb_camera_fmt_info *fmt_info;
-=09=09unsigned int pkt_size;
-
-=09=09fmt_info =3D gb_camera_get_format_info(cfg->format);
-=09=09if (!fmt_info) {
-=09=09=09dev_err(&gcam->bundle->dev, "unsupported greybus image format: %d=
\n",
-=09=09=09=09cfg->format);
-=09=09=09return -EIO;
-=09=09}
-
-=09=09if (fmt_info->bpp =3D=3D 0) {
-=09=09=09pkt_size =3D le32_to_cpu(cfg->max_pkt_size);
-
-=09=09=09if (pkt_size =3D=3D 0) {
-=09=09=09=09dev_err(&gcam->bundle->dev,
-=09=09=09=09=09"Stream %u: invalid zero maximum packet size\n",
-=09=09=09=09=09i);
-=09=09=09=09return -EIO;
-=09=09=09}
-=09=09} else {
-=09=09=09pkt_size =3D le16_to_cpu(cfg->width) * fmt_info->bpp / 8;
-
-=09=09=09if (pkt_size !=3D le32_to_cpu(cfg->max_pkt_size)) {
-=09=09=09=09dev_err(&gcam->bundle->dev,
-=09=09=09=09=09"Stream %u: maximum packet size mismatch (%u/%u)\n",
-=09=09=09=09=09i, pkt_size, cfg->max_pkt_size);
-=09=09=09=09return -EIO;
-=09=09=09}
-=09=09}
-
-=09=09max_pkt_size =3D max(pkt_size, max_pkt_size);
-=09}
-
-=09return max_pkt_size;
-}
-
-/*
- * Validate the stream configuration response verifying padding is correct=
ly
- * set and the returned number of streams is supported
- */
-static const int gb_camera_configure_streams_validate_response(struct gb_c=
amera *gcam,
-=09=09struct gb_camera_configure_streams_response *resp,
-=09=09unsigned int nstreams)
-{
-=09unsigned int i;
-
-=09/* Validate the returned response structure */
-=09if (resp->padding[0] || resp->padding[1]) {
-=09=09dev_err(&gcam->bundle->dev, "response padding !=3D 0\n");
-=09=09return -EIO;
-=09}
-
-=09if (resp->num_streams > nstreams) {
-=09=09dev_err(&gcam->bundle->dev, "got #streams %u > request %u\n",
-=09=09=09resp->num_streams, nstreams);
-=09=09return -EIO;
-=09}
-
-=09for (i =3D 0; i < resp->num_streams; i++) {
-=09=09struct gb_camera_stream_config_response *cfg =3D &resp->config[i];
-
-=09=09if (cfg->padding) {
-=09=09=09dev_err(&gcam->bundle->dev, "stream #%u padding !=3D 0\n", i);
-=09=09=09return -EIO;
-=09=09}
-=09}
-
-=09return 0;
-}
-
-/* -----------------------------------------------------------------------=
------
- * Hardware Configuration
- */
-
-static int gb_camera_set_intf_power_mode(struct gb_camera *gcam, u8 intf_i=
d,
-=09=09=09=09=09 bool hs)
-{
-=09struct gb_svc *svc =3D gcam->connection->hd->svc;
-=09int ret;
-
-=09if (hs)
-=09=09ret =3D gb_svc_intf_set_power_mode(svc, intf_id,
-=09=09=09=09=09=09 GB_SVC_UNIPRO_HS_SERIES_A,
-=09=09=09=09=09=09 GB_SVC_UNIPRO_FAST_MODE, 2, 2,
-=09=09=09=09=09=09 GB_SVC_SMALL_AMPLITUDE,
-=09=09=09=09=09=09 GB_SVC_NO_DE_EMPHASIS,
-=09=09=09=09=09=09 GB_SVC_UNIPRO_FAST_MODE, 2, 2,
-=09=09=09=09=09=09 GB_SVC_PWRM_RXTERMINATION |
-=09=09=09=09=09=09 GB_SVC_PWRM_TXTERMINATION, 0,
-=09=09=09=09=09=09 NULL, NULL);
-=09else
-=09=09ret =3D gb_svc_intf_set_power_mode(svc, intf_id,
-=09=09=09=09=09=09 GB_SVC_UNIPRO_HS_SERIES_A,
-=09=09=09=09=09=09 GB_SVC_UNIPRO_SLOW_AUTO_MODE,
-=09=09=09=09=09=09 2, 1,
-=09=09=09=09=09=09 GB_SVC_SMALL_AMPLITUDE,
-=09=09=09=09=09=09 GB_SVC_NO_DE_EMPHASIS,
-=09=09=09=09=09=09 GB_SVC_UNIPRO_SLOW_AUTO_MODE,
-=09=09=09=09=09=09 2, 1,
-=09=09=09=09=09=09 0, 0,
-=09=09=09=09=09=09 NULL, NULL);
-
-=09return ret;
-}
-
-static int gb_camera_set_power_mode(struct gb_camera *gcam, bool hs)
-{
-=09struct gb_interface *intf =3D gcam->connection->intf;
-=09struct gb_svc *svc =3D gcam->connection->hd->svc;
-=09int ret;
-
-=09ret =3D gb_camera_set_intf_power_mode(gcam, intf->interface_id, hs);
-=09if (ret < 0) {
-=09=09dev_err(&gcam->bundle->dev, "failed to set module interface to %s (%=
d)\n",
-=09=09=09hs ? "HS" : "PWM", ret);
-=09=09return ret;
-=09}
-
-=09ret =3D gb_camera_set_intf_power_mode(gcam, svc->ap_intf_id, hs);
-=09if (ret < 0) {
-=09=09gb_camera_set_intf_power_mode(gcam, intf->interface_id, !hs);
-=09=09dev_err(&gcam->bundle->dev, "failed to set AP interface to %s (%d)\n=
",
-=09=09=09hs ? "HS" : "PWM", ret);
-=09=09return ret;
-=09}
-
-=09return 0;
-}
-
-struct ap_csi_config_request {
-=09__u8 csi_id;
-=09__u8 flags;
-#define GB_CAMERA_CSI_FLAG_CLOCK_CONTINUOUS 0x01
-=09__u8 num_lanes;
-=09__u8 padding;
-=09__le32 csi_clk_freq;
-=09__le32 max_pkt_size;
-} __packed;
-
-/*
- * TODO: Compute the number of lanes dynamically based on bandwidth
- * requirements.
- */
-#define GB_CAMERA_CSI_NUM_DATA_LANES=09=094
-
-#define GB_CAMERA_CSI_CLK_FREQ_MAX=09=09999000000U
-#define GB_CAMERA_CSI_CLK_FREQ_MIN=09=09100000000U
-#define GB_CAMERA_CSI_CLK_FREQ_MARGIN=09=09150000000U
-
-static int gb_camera_setup_data_connection(struct gb_camera *gcam,
-=09=09=09=09=09   struct gb_camera_configure_streams_response *resp,
-=09=09=09=09=09   struct gb_camera_csi_params *csi_params)
-{
-=09struct ap_csi_config_request csi_cfg;
-=09struct gb_connection *conn;
-=09unsigned int clk_freq;
-=09int ret;
-
-=09/*
-=09 * Create the data connection between the camera module data CPort and
-=09 * APB CDSI1. The CDSI1 CPort ID is hardcoded by the ES2 bridge.
-=09 */
-=09conn =3D gb_connection_create_offloaded(gcam->bundle, gcam->data_cport_=
id,
-=09=09=09=09=09      GB_CONNECTION_FLAG_NO_FLOWCTRL |
-=09=09=09=09=09      GB_CONNECTION_FLAG_CDSI1);
-=09if (IS_ERR(conn))
-=09=09return PTR_ERR(conn);
-
-=09gcam->data_connection =3D conn;
-=09gb_connection_set_data(conn, gcam);
-
-=09ret =3D gb_connection_enable(conn);
-=09if (ret)
-=09=09goto error_conn_destroy;
-
-=09/* Set the UniPro link to high speed mode. */
-=09ret =3D gb_camera_set_power_mode(gcam, true);
-=09if (ret < 0)
-=09=09goto error_conn_disable;
-
-=09/*
-=09 * Configure the APB-A CSI-2 transmitter.
-=09 *
-=09 * Hardcode the number of lanes to 4 and compute the bus clock frequenc=
y
-=09 * based on the module bandwidth requirements with a safety margin.
-=09 */
-=09memset(&csi_cfg, 0, sizeof(csi_cfg));
-=09csi_cfg.csi_id =3D 1;
-=09csi_cfg.flags =3D 0;
-=09csi_cfg.num_lanes =3D GB_CAMERA_CSI_NUM_DATA_LANES;
-
-=09clk_freq =3D resp->data_rate / 2 / GB_CAMERA_CSI_NUM_DATA_LANES;
-=09clk_freq =3D clamp(clk_freq + GB_CAMERA_CSI_CLK_FREQ_MARGIN,
-=09=09=09 GB_CAMERA_CSI_CLK_FREQ_MIN,
-=09=09=09 GB_CAMERA_CSI_CLK_FREQ_MAX);
-=09csi_cfg.csi_clk_freq =3D clk_freq;
-
-=09ret =3D gb_camera_get_max_pkt_size(gcam, resp);
-=09if (ret < 0) {
-=09=09ret =3D -EIO;
-=09=09goto error_power;
-=09}
-=09csi_cfg.max_pkt_size =3D ret;
-
-=09ret =3D gb_hd_output(gcam->connection->hd, &csi_cfg,
-=09=09=09   sizeof(csi_cfg),
-=09=09=09   GB_APB_REQUEST_CSI_TX_CONTROL, false);
-=09if (ret < 0) {
-=09=09dev_err(&gcam->bundle->dev, "failed to start the CSI transmitter\n")=
;
-=09=09goto error_power;
-=09}
-
-=09if (csi_params) {
-=09=09csi_params->clk_freq =3D csi_cfg.csi_clk_freq;
-=09=09csi_params->num_lanes =3D csi_cfg.num_lanes;
-=09}
-
-=09return 0;
-
-error_power:
-=09gb_camera_set_power_mode(gcam, false);
-error_conn_disable:
-=09gb_connection_disable(gcam->data_connection);
-error_conn_destroy:
-=09gb_connection_destroy(gcam->data_connection);
-=09gcam->data_connection =3D NULL;
-=09return ret;
-}
-
-static void gb_camera_teardown_data_connection(struct gb_camera *gcam)
-{
-=09struct ap_csi_config_request csi_cfg;
-=09int ret;
-
-=09/* Stop the APB1 CSI transmitter. */
-=09memset(&csi_cfg, 0, sizeof(csi_cfg));
-=09csi_cfg.csi_id =3D 1;
-
-=09ret =3D gb_hd_output(gcam->connection->hd, &csi_cfg,
-=09=09=09   sizeof(csi_cfg),
-=09=09=09   GB_APB_REQUEST_CSI_TX_CONTROL, false);
-
-=09if (ret < 0)
-=09=09dev_err(&gcam->bundle->dev, "failed to stop the CSI transmitter\n");
-
-=09/* Set the UniPro link to low speed mode. */
-=09gb_camera_set_power_mode(gcam, false);
-
-=09/* Destroy the data connection. */
-=09gb_connection_disable(gcam->data_connection);
-=09gb_connection_destroy(gcam->data_connection);
-=09gcam->data_connection =3D NULL;
-}
-
-/* -----------------------------------------------------------------------=
------
- * Camera Protocol Operations
- */
-
-static int gb_camera_capabilities(struct gb_camera *gcam,
-=09=09=09=09  u8 *capabilities, size_t *size)
-{
-=09int ret;
-
-=09ret =3D gb_pm_runtime_get_sync(gcam->bundle);
-=09if (ret)
-=09=09return ret;
-
-=09mutex_lock(&gcam->mutex);
-
-=09if (!gcam->connection) {
-=09=09ret =3D -EINVAL;
-=09=09goto done;
-=09}
-
-=09ret =3D gb_camera_operation_sync_flags(gcam->connection,
-=09=09=09=09=09     GB_CAMERA_TYPE_CAPABILITIES,
-=09=09=09=09=09     GB_OPERATION_FLAG_SHORT_RESPONSE,
-=09=09=09=09=09     NULL, 0,
-=09=09=09=09=09     (void *)capabilities, size);
-=09if (ret)
-=09=09dev_err(&gcam->bundle->dev, "failed to retrieve capabilities: %d\n",=
 ret);
-
-done:
-=09mutex_unlock(&gcam->mutex);
-
-=09gb_pm_runtime_put_autosuspend(gcam->bundle);
-
-=09return ret;
-}
-
-static int gb_camera_configure_streams(struct gb_camera *gcam,
-=09=09=09=09       unsigned int *num_streams,
-=09=09=09=09       unsigned int *flags,
-=09=09=09=09       struct gb_camera_stream_config *streams,
-=09=09=09=09       struct gb_camera_csi_params *csi_params)
-{
-=09struct gb_camera_configure_streams_request *req;
-=09struct gb_camera_configure_streams_response *resp;
-=09unsigned int nstreams =3D *num_streams;
-=09unsigned int i;
-=09size_t req_size;
-=09size_t resp_size;
-=09int ret;
-
-=09if (nstreams > GB_CAMERA_MAX_STREAMS)
-=09=09return -EINVAL;
-
-=09req_size =3D sizeof(*req) + nstreams * sizeof(req->config[0]);
-=09resp_size =3D sizeof(*resp) + nstreams * sizeof(resp->config[0]);
-
-=09req =3D kmalloc(req_size, GFP_KERNEL);
-=09resp =3D kmalloc(resp_size, GFP_KERNEL);
-=09if (!req || !resp) {
-=09=09kfree(req);
-=09=09kfree(resp);
-=09=09return -ENOMEM;
-=09}
-
-=09req->num_streams =3D nstreams;
-=09req->flags =3D *flags;
-=09req->padding =3D 0;
-
-=09for (i =3D 0; i < nstreams; ++i) {
-=09=09struct gb_camera_stream_config_request *cfg =3D &req->config[i];
-
-=09=09cfg->width =3D cpu_to_le16(streams[i].width);
-=09=09cfg->height =3D cpu_to_le16(streams[i].height);
-=09=09cfg->format =3D cpu_to_le16(streams[i].format);
-=09=09cfg->padding =3D 0;
-=09}
-
-=09mutex_lock(&gcam->mutex);
-
-=09ret =3D gb_pm_runtime_get_sync(gcam->bundle);
-=09if (ret)
-=09=09goto done_skip_pm_put;
-
-=09if (!gcam->connection) {
-=09=09ret =3D -EINVAL;
-=09=09goto done;
-=09}
-
-=09ret =3D gb_camera_operation_sync_flags(gcam->connection,
-=09=09=09=09=09     GB_CAMERA_TYPE_CONFIGURE_STREAMS,
-=09=09=09=09=09     GB_OPERATION_FLAG_SHORT_RESPONSE,
-=09=09=09=09=09     req, req_size,
-=09=09=09=09=09     resp, &resp_size);
-=09if (ret < 0)
-=09=09goto done;
-
-=09ret =3D gb_camera_configure_streams_validate_response(gcam, resp,
-=09=09=09=09=09=09=09    nstreams);
-=09if (ret < 0)
-=09=09goto done;
-
-=09*flags =3D resp->flags;
-=09*num_streams =3D resp->num_streams;
-
-=09for (i =3D 0; i < resp->num_streams; ++i) {
-=09=09struct gb_camera_stream_config_response *cfg =3D &resp->config[i];
-
-=09=09streams[i].width =3D le16_to_cpu(cfg->width);
-=09=09streams[i].height =3D le16_to_cpu(cfg->height);
-=09=09streams[i].format =3D le16_to_cpu(cfg->format);
-=09=09streams[i].vc =3D cfg->virtual_channel;
-=09=09streams[i].dt[0] =3D cfg->data_type[0];
-=09=09streams[i].dt[1] =3D cfg->data_type[1];
-=09=09streams[i].max_size =3D le32_to_cpu(cfg->max_size);
-=09}
-
-=09if ((resp->flags & GB_CAMERA_CONFIGURE_STREAMS_ADJUSTED) ||
-=09    (req->flags & GB_CAMERA_CONFIGURE_STREAMS_TEST_ONLY))
-=09=09goto done;
-
-=09if (gcam->state =3D=3D GB_CAMERA_STATE_CONFIGURED) {
-=09=09gb_camera_teardown_data_connection(gcam);
-=09=09gcam->state =3D GB_CAMERA_STATE_UNCONFIGURED;
-
-=09=09/*
-=09=09 * When unconfiguring streams release the PM runtime reference
-=09=09 * that was acquired when streams were configured. The bundle
-=09=09 * won't be suspended until the PM runtime reference acquired at
-=09=09 * the beginning of this function gets released right before
-=09=09 * returning.
-=09=09 */
-=09=09gb_pm_runtime_put_noidle(gcam->bundle);
-=09}
-
-=09if (resp->num_streams =3D=3D 0)
-=09=09goto done;
-
-=09/*
-=09 * Make sure the bundle won't be suspended until streams get
-=09 * unconfigured after the stream is configured successfully
-=09 */
-=09gb_pm_runtime_get_noresume(gcam->bundle);
-
-=09/* Setup CSI-2 connection from APB-A to AP */
-=09ret =3D gb_camera_setup_data_connection(gcam, resp, csi_params);
-=09if (ret < 0) {
-=09=09memset(req, 0, sizeof(*req));
-=09=09gb_operation_sync(gcam->connection,
-=09=09=09=09  GB_CAMERA_TYPE_CONFIGURE_STREAMS,
-=09=09=09=09  req, sizeof(*req),
-=09=09=09=09  resp, sizeof(*resp));
-=09=09*flags =3D 0;
-=09=09*num_streams =3D 0;
-=09=09gb_pm_runtime_put_noidle(gcam->bundle);
-=09=09goto done;
-=09}
-
-=09gcam->state =3D GB_CAMERA_STATE_CONFIGURED;
-
-done:
-=09gb_pm_runtime_put_autosuspend(gcam->bundle);
-
-done_skip_pm_put:
-=09mutex_unlock(&gcam->mutex);
-=09kfree(req);
-=09kfree(resp);
-=09return ret;
-}
-
-static int gb_camera_capture(struct gb_camera *gcam, u32 request_id,
-=09=09=09     unsigned int streams, unsigned int num_frames,
-=09=09=09     size_t settings_size, const void *settings)
-{
-=09struct gb_camera_capture_request *req;
-=09size_t req_size;
-=09int ret;
-
-=09if (settings_size > GB_CAMERA_MAX_SETTINGS_SIZE)
-=09=09return -EINVAL;
-
-=09req_size =3D sizeof(*req) + settings_size;
-=09req =3D kmalloc(req_size, GFP_KERNEL);
-=09if (!req)
-=09=09return -ENOMEM;
-
-=09req->request_id =3D cpu_to_le32(request_id);
-=09req->streams =3D streams;
-=09req->padding =3D 0;
-=09req->num_frames =3D cpu_to_le16(num_frames);
-=09memcpy(req->settings, settings, settings_size);
-
-=09mutex_lock(&gcam->mutex);
-
-=09if (!gcam->connection) {
-=09=09ret =3D -EINVAL;
-=09=09goto done;
-=09}
-
-=09ret =3D gb_operation_sync(gcam->connection, GB_CAMERA_TYPE_CAPTURE,
-=09=09=09=09req, req_size, NULL, 0);
-done:
-=09mutex_unlock(&gcam->mutex);
-
-=09kfree(req);
-
-=09return ret;
-}
-
-static int gb_camera_flush(struct gb_camera *gcam, u32 *request_id)
-{
-=09struct gb_camera_flush_response resp;
-=09int ret;
-
-=09mutex_lock(&gcam->mutex);
-
-=09if (!gcam->connection) {
-=09=09ret =3D -EINVAL;
-=09=09goto done;
-=09}
-
-=09ret =3D gb_operation_sync(gcam->connection, GB_CAMERA_TYPE_FLUSH, NULL,=
 0,
-=09=09=09=09&resp, sizeof(resp));
-
-=09if (ret < 0)
-=09=09goto done;
-
-=09if (request_id)
-=09=09*request_id =3D le32_to_cpu(resp.request_id);
-
-done:
-=09mutex_unlock(&gcam->mutex);
-
-=09return ret;
-}
-
-static int gb_camera_request_handler(struct gb_operation *op)
-{
-=09struct gb_camera *gcam =3D gb_connection_get_data(op->connection);
-=09struct gb_camera_metadata_request *payload;
-=09struct gb_message *request;
-
-=09if (op->type !=3D GB_CAMERA_TYPE_METADATA) {
-=09=09dev_err(&gcam->bundle->dev, "Unsupported unsolicited event: %u\n", o=
p->type);
-=09=09return -EINVAL;
-=09}
-
-=09request =3D op->request;
-
-=09if (request->payload_size < sizeof(*payload)) {
-=09=09dev_err(&gcam->bundle->dev, "Wrong event size received (%zu < %zu)\n=
",
-=09=09=09request->payload_size, sizeof(*payload));
-=09=09return -EINVAL;
-=09}
-
-=09payload =3D request->payload;
-
-=09dev_dbg(&gcam->bundle->dev, "received metadata for request %u, frame %u=
, stream %u\n",
-=09=09payload->request_id, payload->frame_number, payload->stream);
-
-=09return 0;
-}
-
-/* -----------------------------------------------------------------------=
------
- * Interface with HOST gmp camera.
- */
-static unsigned int gb_camera_mbus_to_gb(enum v4l2_mbus_pixelcode mbus_cod=
e)
-{
-=09unsigned int i;
-
-=09for (i =3D 0; i < ARRAY_SIZE(gb_fmt_info); i++) {
-=09=09if (gb_fmt_info[i].mbus_code =3D=3D mbus_code)
-=09=09=09return gb_fmt_info[i].gb_format;
-=09}
-=09return gb_fmt_info[0].gb_format;
-}
-
-static enum v4l2_mbus_pixelcode gb_camera_gb_to_mbus(u16 gb_fmt)
-{
-=09unsigned int i;
-
-=09for (i =3D 0; i < ARRAY_SIZE(gb_fmt_info); i++) {
-=09=09if (gb_fmt_info[i].gb_format =3D=3D gb_fmt)
-=09=09=09return gb_fmt_info[i].mbus_code;
-=09}
-=09return gb_fmt_info[0].mbus_code;
-}
-
-static ssize_t gb_camera_op_capabilities(void *priv, char *data, size_t le=
n)
-{
-=09struct gb_camera *gcam =3D priv;
-=09size_t capabilities_len =3D len;
-=09int ret;
-
-=09ret =3D gb_camera_capabilities(gcam, data, &capabilities_len);
-=09if (ret)
-=09=09return ret;
-
-=09return capabilities_len;
-}
-
-static int gb_camera_op_configure_streams(void *priv, unsigned int *nstrea=
ms,
-=09=09=09=09=09  unsigned int *flags, struct gb_camera_stream *streams,
-=09=09=09=09=09  struct gb_camera_csi_params *csi_params)
-{
-=09struct gb_camera *gcam =3D priv;
-=09struct gb_camera_stream_config *gb_streams;
-=09unsigned int gb_flags =3D 0;
-=09unsigned int gb_nstreams =3D *nstreams;
-=09unsigned int i;
-=09int ret;
-
-=09if (gb_nstreams > GB_CAMERA_MAX_STREAMS)
-=09=09return -EINVAL;
-
-=09gb_streams =3D kzalloc_objs(*gb_streams, gb_nstreams);
-=09if (!gb_streams)
-=09=09return -ENOMEM;
-
-=09for (i =3D 0; i < gb_nstreams; i++) {
-=09=09gb_streams[i].width =3D streams[i].width;
-=09=09gb_streams[i].height =3D streams[i].height;
-=09=09gb_streams[i].format =3D
-=09=09=09gb_camera_mbus_to_gb(streams[i].pixel_code);
-=09}
-
-=09if (*flags & GB_CAMERA_IN_FLAG_TEST)
-=09=09gb_flags |=3D GB_CAMERA_CONFIGURE_STREAMS_TEST_ONLY;
-
-=09ret =3D gb_camera_configure_streams(gcam, &gb_nstreams,
-=09=09=09=09=09  &gb_flags, gb_streams, csi_params);
-=09if (ret < 0)
-=09=09goto done;
-=09if (gb_nstreams > *nstreams) {
-=09=09ret =3D -EINVAL;
-=09=09goto done;
-=09}
-
-=09*flags =3D 0;
-=09if (gb_flags & GB_CAMERA_CONFIGURE_STREAMS_ADJUSTED)
-=09=09*flags |=3D GB_CAMERA_OUT_FLAG_ADJUSTED;
-
-=09for (i =3D 0; i < gb_nstreams; i++) {
-=09=09streams[i].width =3D gb_streams[i].width;
-=09=09streams[i].height =3D gb_streams[i].height;
-=09=09streams[i].vc =3D gb_streams[i].vc;
-=09=09streams[i].dt[0] =3D gb_streams[i].dt[0];
-=09=09streams[i].dt[1] =3D gb_streams[i].dt[1];
-=09=09streams[i].max_size =3D gb_streams[i].max_size;
-=09=09streams[i].pixel_code =3D
-=09=09=09gb_camera_gb_to_mbus(gb_streams[i].format);
-=09}
-=09*nstreams =3D gb_nstreams;
-
-done:
-=09kfree(gb_streams);
-=09return ret;
-}
-
-static int gb_camera_op_capture(void *priv, u32 request_id,
-=09=09=09=09unsigned int streams, unsigned int num_frames,
-=09=09=09=09size_t settings_size, const void *settings)
-{
-=09struct gb_camera *gcam =3D priv;
-
-=09return gb_camera_capture(gcam, request_id, streams, num_frames,
-=09=09=09=09 settings_size, settings);
-}
-
-static int gb_camera_op_flush(void *priv, u32 *request_id)
-{
-=09struct gb_camera *gcam =3D priv;
-
-=09return gb_camera_flush(gcam, request_id);
-}
-
-static const struct gb_camera_ops gb_cam_ops =3D {
-=09.capabilities =3D gb_camera_op_capabilities,
-=09.configure_streams =3D gb_camera_op_configure_streams,
-=09.capture =3D gb_camera_op_capture,
-=09.flush =3D gb_camera_op_flush,
-};
-
-/* -----------------------------------------------------------------------=
------
- * DebugFS
- */
-
-static ssize_t gb_camera_debugfs_capabilities(struct gb_camera *gcam,
-=09=09=09=09=09      char *buf, size_t len)
-{
-=09struct gb_camera_debugfs_buffer *buffer =3D
-=09=09&gcam->debugfs.buffers[GB_CAMERA_DEBUGFS_BUFFER_CAPABILITIES];
-=09size_t size =3D 1024;
-=09unsigned int i;
-=09u8 *caps;
-=09int ret;
-
-=09caps =3D kmalloc(size, GFP_KERNEL);
-=09if (!caps)
-=09=09return -ENOMEM;
-
-=09ret =3D gb_camera_capabilities(gcam, caps, &size);
-=09if (ret < 0)
-=09=09goto done;
-
-=09/*
-=09 * hex_dump_to_buffer() doesn't return the number of bytes dumped prior
-=09 * to v4.0, we need our own implementation :-(
-=09 */
-=09buffer->length =3D 0;
-
-=09for (i =3D 0; i < size; i +=3D 16) {
-=09=09unsigned int nbytes =3D min_t(unsigned int, size - i, 16);
-
-=09=09buffer->length +=3D sprintf(buffer->data + buffer->length,
-=09=09=09=09=09  "%*ph\n", nbytes, caps + i);
-=09}
-
-done:
-=09kfree(caps);
-=09return ret;
-}
-
-static ssize_t gb_camera_debugfs_configure_streams(struct gb_camera *gcam,
-=09=09=09=09=09=09   char *buf, size_t len)
-{
-=09struct gb_camera_debugfs_buffer *buffer =3D
-=09=09&gcam->debugfs.buffers[GB_CAMERA_DEBUGFS_BUFFER_STREAMS];
-=09struct gb_camera_stream_config *streams;
-=09unsigned int nstreams;
-=09unsigned int flags;
-=09unsigned int i;
-=09char *token;
-=09int ret;
-
-=09/* Retrieve number of streams to configure */
-=09token =3D strsep(&buf, ";");
-=09if (!token)
-=09=09return -EINVAL;
-
-=09ret =3D kstrtouint(token, 10, &nstreams);
-=09if (ret < 0)
-=09=09return ret;
-
-=09if (nstreams > GB_CAMERA_MAX_STREAMS)
-=09=09return -EINVAL;
-
-=09token =3D strsep(&buf, ";");
-=09if (!token)
-=09=09return -EINVAL;
-
-=09ret =3D kstrtouint(token, 10, &flags);
-=09if (ret < 0)
-=09=09return ret;
-
-=09/* For each stream to configure parse width, height and format */
-=09streams =3D kzalloc_objs(*streams, nstreams);
-=09if (!streams)
-=09=09return -ENOMEM;
-
-=09for (i =3D 0; i < nstreams; ++i) {
-=09=09struct gb_camera_stream_config *stream =3D &streams[i];
-
-=09=09/* width */
-=09=09token =3D strsep(&buf, ";");
-=09=09if (!token) {
-=09=09=09ret =3D -EINVAL;
-=09=09=09goto done;
-=09=09}
-=09=09ret =3D kstrtouint(token, 10, &stream->width);
-=09=09if (ret < 0)
-=09=09=09goto done;
-
-=09=09/* height */
-=09=09token =3D strsep(&buf, ";");
-=09=09if (!token)
-=09=09=09goto done;
-
-=09=09ret =3D kstrtouint(token, 10, &stream->height);
-=09=09if (ret < 0)
-=09=09=09goto done;
-
-=09=09/* Image format code */
-=09=09token =3D strsep(&buf, ";");
-=09=09if (!token)
-=09=09=09goto done;
-
-=09=09ret =3D kstrtouint(token, 16, &stream->format);
-=09=09if (ret < 0)
-=09=09=09goto done;
-=09}
-
-=09ret =3D gb_camera_configure_streams(gcam, &nstreams, &flags, streams,
-=09=09=09=09=09  NULL);
-=09if (ret < 0)
-=09=09goto done;
-
-=09buffer->length =3D sprintf(buffer->data, "%u;%u;", nstreams, flags);
-
-=09for (i =3D 0; i < nstreams; ++i) {
-=09=09struct gb_camera_stream_config *stream =3D &streams[i];
-
-=09=09buffer->length +=3D sprintf(buffer->data + buffer->length,
-=09=09=09=09=09  "%u;%u;%u;%u;%u;%u;%u;",
-=09=09=09=09=09  stream->width, stream->height,
-=09=09=09=09=09  stream->format, stream->vc,
-=09=09=09=09=09  stream->dt[0], stream->dt[1],
-=09=09=09=09=09  stream->max_size);
-=09}
-
-=09ret =3D len;
-
-done:
-=09kfree(streams);
-=09return ret;
-};
-
-static ssize_t gb_camera_debugfs_capture(struct gb_camera *gcam,
-=09=09=09=09=09 char *buf, size_t len)
-{
-=09unsigned int request_id;
-=09unsigned int streams_mask;
-=09unsigned int num_frames;
-=09char *token;
-=09int ret;
-
-=09/* Request id */
-=09token =3D strsep(&buf, ";");
-=09if (!token)
-=09=09return -EINVAL;
-=09ret =3D kstrtouint(token, 10, &request_id);
-=09if (ret < 0)
-=09=09return ret;
-
-=09/* Stream mask */
-=09token =3D strsep(&buf, ";");
-=09if (!token)
-=09=09return -EINVAL;
-=09ret =3D kstrtouint(token, 16, &streams_mask);
-=09if (ret < 0)
-=09=09return ret;
-
-=09/* number of frames */
-=09token =3D strsep(&buf, ";");
-=09if (!token)
-=09=09return -EINVAL;
-=09ret =3D kstrtouint(token, 10, &num_frames);
-=09if (ret < 0)
-=09=09return ret;
-
-=09ret =3D gb_camera_capture(gcam, request_id, streams_mask, num_frames, 0=
,
-=09=09=09=09NULL);
-=09if (ret < 0)
-=09=09return ret;
-
-=09return len;
-}
-
-static ssize_t gb_camera_debugfs_flush(struct gb_camera *gcam,
-=09=09=09=09       char *buf, size_t len)
-{
-=09struct gb_camera_debugfs_buffer *buffer =3D
-=09=09&gcam->debugfs.buffers[GB_CAMERA_DEBUGFS_BUFFER_FLUSH];
-=09unsigned int req_id;
-=09int ret;
-
-=09ret =3D gb_camera_flush(gcam, &req_id);
-=09if (ret < 0)
-=09=09return ret;
-
-=09buffer->length =3D sprintf(buffer->data, "%u", req_id);
-
-=09return len;
-}
-
-struct gb_camera_debugfs_entry {
-=09const char *name;
-=09unsigned int mask;
-=09unsigned int buffer;
-=09ssize_t (*execute)(struct gb_camera *gcam, char *buf, size_t len);
-};
-
-static const struct gb_camera_debugfs_entry gb_camera_debugfs_entries[] =
=3D {
-=09{
-=09=09.name =3D "capabilities",
-=09=09.mask =3D S_IFREG | 0444,
-=09=09.buffer =3D GB_CAMERA_DEBUGFS_BUFFER_CAPABILITIES,
-=09=09.execute =3D gb_camera_debugfs_capabilities,
-=09}, {
-=09=09.name =3D "configure_streams",
-=09=09.mask =3D S_IFREG | 0666,
-=09=09.buffer =3D GB_CAMERA_DEBUGFS_BUFFER_STREAMS,
-=09=09.execute =3D gb_camera_debugfs_configure_streams,
-=09}, {
-=09=09.name =3D "capture",
-=09=09.mask =3D S_IFREG | 0666,
-=09=09.buffer =3D GB_CAMERA_DEBUGFS_BUFFER_CAPTURE,
-=09=09.execute =3D gb_camera_debugfs_capture,
-=09}, {
-=09=09.name =3D "flush",
-=09=09.mask =3D S_IFREG | 0666,
-=09=09.buffer =3D GB_CAMERA_DEBUGFS_BUFFER_FLUSH,
-=09=09.execute =3D gb_camera_debugfs_flush,
-=09},
-};
-
-static ssize_t gb_camera_debugfs_read(struct file *file, char __user *buf,
-=09=09=09=09      size_t len, loff_t *offset)
-{
-=09const struct gb_camera_debugfs_entry *op =3D file->private_data;
-=09struct gb_camera *gcam =3D file_inode(file)->i_private;
-=09struct gb_camera_debugfs_buffer *buffer;
-=09ssize_t ret;
-
-=09/* For read-only entries the operation is triggered by a read. */
-=09if (!(op->mask & 0222)) {
-=09=09ret =3D op->execute(gcam, NULL, 0);
-=09=09if (ret < 0)
-=09=09=09return ret;
-=09}
-
-=09buffer =3D &gcam->debugfs.buffers[op->buffer];
-
-=09return simple_read_from_buffer(buf, len, offset, buffer->data,
-=09=09=09=09       buffer->length);
-}
-
-static ssize_t gb_camera_debugfs_write(struct file *file,
-=09=09=09=09       const char __user *buf, size_t len,
-=09=09=09=09       loff_t *offset)
-{
-=09const struct gb_camera_debugfs_entry *op =3D file->private_data;
-=09struct gb_camera *gcam =3D file_inode(file)->i_private;
-=09ssize_t ret;
-=09char *kbuf;
-
-=09if (len > 1024)
-=09=09return -EINVAL;
-
-=09kbuf =3D memdup_user_nul(buf, len);
-=09if (IS_ERR(kbuf))
-=09=09return PTR_ERR(kbuf);
-
-=09ret =3D op->execute(gcam, kbuf, len);
-
-done:
-=09kfree(kbuf);
-=09return ret;
-}
-
-static int gb_camera_debugfs_open(struct inode *inode, struct file *file)
-{
-=09file->private_data =3D debugfs_get_aux(file);
-=09return 0;
-}
-
-static const struct file_operations gb_camera_debugfs_ops =3D {
-=09.open =3D gb_camera_debugfs_open,
-=09.read =3D gb_camera_debugfs_read,
-=09.write =3D gb_camera_debugfs_write,
-};
-
-static int gb_camera_debugfs_init(struct gb_camera *gcam)
-{
-=09struct gb_connection *connection =3D gcam->connection;
-=09char dirname[27];
-=09unsigned int i;
-
-=09/*
-=09 * Create root debugfs entry and a file entry for each camera operation=
.
-=09 */
-=09snprintf(dirname, 27, "camera-%u.%u", connection->intf->interface_id,
-=09=09 gcam->bundle->id);
-
-=09gcam->debugfs.root =3D debugfs_create_dir(dirname, gb_debugfs_get());
-
-=09gcam->debugfs.buffers =3D
-=09=09vmalloc(array_size(GB_CAMERA_DEBUGFS_BUFFER_MAX,
-=09=09=09=09   sizeof(*gcam->debugfs.buffers)));
-=09if (!gcam->debugfs.buffers)
-=09=09return -ENOMEM;
-
-=09for (i =3D 0; i < ARRAY_SIZE(gb_camera_debugfs_entries); ++i) {
-=09=09const struct gb_camera_debugfs_entry *entry =3D
-=09=09=09&gb_camera_debugfs_entries[i];
-
-=09=09gcam->debugfs.buffers[i].length =3D 0;
-
-=09=09debugfs_create_file_aux(entry->name, entry->mask,
-=09=09=09=09=09gcam->debugfs.root, gcam, entry,
-=09=09=09=09=09&gb_camera_debugfs_ops);
-=09}
-
-=09return 0;
-}
-
-static void gb_camera_debugfs_cleanup(struct gb_camera *gcam)
-{
-=09debugfs_remove_recursive(gcam->debugfs.root);
-
-=09vfree(gcam->debugfs.buffers);
-}
-
-/* -----------------------------------------------------------------------=
------
- * Init & Cleanup
- */
-
-static void gb_camera_cleanup(struct gb_camera *gcam)
-{
-=09gb_camera_debugfs_cleanup(gcam);
-
-=09mutex_lock(&gcam->mutex);
-=09if (gcam->data_connection) {
-=09=09gb_connection_disable(gcam->data_connection);
-=09=09gb_connection_destroy(gcam->data_connection);
-=09=09gcam->data_connection =3D NULL;
-=09}
-
-=09if (gcam->connection) {
-=09=09gb_connection_disable(gcam->connection);
-=09=09gb_connection_destroy(gcam->connection);
-=09=09gcam->connection =3D NULL;
-=09}
-=09mutex_unlock(&gcam->mutex);
-}
-
-static void gb_camera_release_module(struct kref *ref)
-{
-=09struct gb_camera_module *cam_mod =3D
-=09=09container_of(ref, struct gb_camera_module, refcount);
-=09kfree(cam_mod->priv);
-}
-
-static int gb_camera_probe(struct gb_bundle *bundle,
-=09=09=09   const struct greybus_bundle_id *id)
-{
-=09struct gb_connection *conn;
-=09struct gb_camera *gcam;
-=09u16 mgmt_cport_id =3D 0;
-=09u16 data_cport_id =3D 0;
-=09unsigned int i;
-=09int ret;
-
-=09/*
-=09 * The camera bundle must contain exactly two CPorts, one for the
-=09 * camera management protocol and one for the camera data protocol.
-=09 */
-=09if (bundle->num_cports !=3D 2)
-=09=09return -ENODEV;
-
-=09for (i =3D 0; i < bundle->num_cports; ++i) {
-=09=09struct greybus_descriptor_cport *desc =3D &bundle->cport_desc[i];
-
-=09=09switch (desc->protocol_id) {
-=09=09case GREYBUS_PROTOCOL_CAMERA_MGMT:
-=09=09=09mgmt_cport_id =3D le16_to_cpu(desc->id);
-=09=09=09break;
-=09=09case GREYBUS_PROTOCOL_CAMERA_DATA:
-=09=09=09data_cport_id =3D le16_to_cpu(desc->id);
-=09=09=09break;
-=09=09default:
-=09=09=09return -ENODEV;
-=09=09}
-=09}
-
-=09if (!mgmt_cport_id || !data_cport_id)
-=09=09return -ENODEV;
-
-=09gcam =3D kzalloc_obj(*gcam);
-=09if (!gcam)
-=09=09return -ENOMEM;
-
-=09mutex_init(&gcam->mutex);
-
-=09gcam->bundle =3D bundle;
-=09gcam->state =3D GB_CAMERA_STATE_UNCONFIGURED;
-=09gcam->data_cport_id =3D data_cport_id;
-
-=09conn =3D gb_connection_create(bundle, mgmt_cport_id,
-=09=09=09=09    gb_camera_request_handler);
-=09if (IS_ERR(conn)) {
-=09=09ret =3D PTR_ERR(conn);
-=09=09goto error;
-=09}
-
-=09gcam->connection =3D conn;
-=09gb_connection_set_data(conn, gcam);
-
-=09ret =3D gb_connection_enable(conn);
-=09if (ret)
-=09=09goto error;
-
-=09ret =3D gb_camera_debugfs_init(gcam);
-=09if (ret < 0)
-=09=09goto error;
-
-=09gcam->module.priv =3D gcam;
-=09gcam->module.ops =3D &gb_cam_ops;
-=09gcam->module.interface_id =3D gcam->connection->intf->interface_id;
-=09gcam->module.release =3D gb_camera_release_module;
-=09ret =3D gb_camera_register(&gcam->module);
-=09if (ret < 0)
-=09=09goto error;
-
-=09greybus_set_drvdata(bundle, gcam);
-
-=09gb_pm_runtime_put_autosuspend(gcam->bundle);
-
-=09return 0;
-
-error:
-=09gb_camera_cleanup(gcam);
-=09kfree(gcam);
-=09return ret;
-}
-
-static void gb_camera_disconnect(struct gb_bundle *bundle)
-{
-=09struct gb_camera *gcam =3D greybus_get_drvdata(bundle);
-=09int ret;
-
-=09ret =3D gb_pm_runtime_get_sync(bundle);
-=09if (ret)
-=09=09gb_pm_runtime_get_noresume(bundle);
-
-=09gb_camera_cleanup(gcam);
-=09gb_camera_unregister(&gcam->module);
-}
-
-static const struct greybus_bundle_id gb_camera_id_table[] =3D {
-=09{ GREYBUS_DEVICE_CLASS(GREYBUS_CLASS_CAMERA) },
-=09{ },
-};
-
-#ifdef CONFIG_PM
-static int gb_camera_suspend(struct device *dev)
-{
-=09struct gb_bundle *bundle =3D to_gb_bundle(dev);
-=09struct gb_camera *gcam =3D greybus_get_drvdata(bundle);
-
-=09if (gcam->data_connection)
-=09=09gb_connection_disable(gcam->data_connection);
-
-=09gb_connection_disable(gcam->connection);
-
-=09return 0;
-}
-
-static int gb_camera_resume(struct device *dev)
-{
-=09struct gb_bundle *bundle =3D to_gb_bundle(dev);
-=09struct gb_camera *gcam =3D greybus_get_drvdata(bundle);
-=09int ret;
-
-=09ret =3D gb_connection_enable(gcam->connection);
-=09if (ret) {
-=09=09dev_err(&gcam->bundle->dev, "failed to enable connection: %d\n", ret=
);
-=09=09return ret;
-=09}
-
-=09if (gcam->data_connection) {
-=09=09ret =3D gb_connection_enable(gcam->data_connection);
-=09=09if (ret) {
-=09=09=09dev_err(&gcam->bundle->dev,
-=09=09=09=09"failed to enable data connection: %d\n", ret);
-=09=09=09return ret;
-=09=09}
-=09}
-
-=09return 0;
-}
-#endif
-
-static const struct dev_pm_ops gb_camera_pm_ops =3D {
-=09SET_RUNTIME_PM_OPS(gb_camera_suspend, gb_camera_resume, NULL)
-};
-
-static struct greybus_driver gb_camera_driver =3D {
-=09.name=09=09=3D "camera",
-=09.probe=09=09=3D gb_camera_probe,
-=09.disconnect=09=3D gb_camera_disconnect,
-=09.id_table=09=3D gb_camera_id_table,
-=09.driver.pm=09=3D &gb_camera_pm_ops,
-};
-
-module_greybus_driver(gb_camera_driver);
-
-MODULE_DESCRIPTION("Greybus Camera protocol driver.");
-MODULE_LICENSE("GPL v2");
diff --git a/drivers/staging/greybus/gb-camera.h b/drivers/staging/greybus/=
gb-camera.h
deleted file mode 100644
index d5a33a13f2a4..000000000000
--- a/drivers/staging/greybus/gb-camera.h
+++ /dev/null
@@ -1,127 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Greybus Camera protocol driver.
- *
- * Copyright 2015 Google Inc.
- */
-#ifndef __GB_CAMERA_H
-#define __GB_CAMERA_H
-
-#include <linux/v4l2-mediabus.h>
-
-/* Input flags need to be set from the caller */
-#define GB_CAMERA_IN_FLAG_TEST=09=09BIT(0)
-/* Output flags returned */
-#define GB_CAMERA_OUT_FLAG_ADJUSTED=09BIT(0)
-
-/**
- * struct gb_camera_stream - Represents greybus camera stream.
- * @width: Stream width in pixels.
- * @height: Stream height in pixels.
- * @pixel_code: Media bus pixel code.
- * @vc: MIPI CSI virtual channel.
- * @dt: MIPI CSI data types. Most formats use a single data type, in which=
 case
- *      the second element will be ignored.
- * @max_size: Maximum size of a frame in bytes. The camera module guarante=
es
- *            that all data between the Frame Start and Frame End packet f=
or
- *            the associated virtual channel and data type(s) will not exc=
eed
- *            this size.
- */
-struct gb_camera_stream {
-=09unsigned int width;
-=09unsigned int height;
-=09enum v4l2_mbus_pixelcode pixel_code;
-=09unsigned int vc;
-=09unsigned int dt[2];
-=09unsigned int max_size;
-};
-
-/**
- * struct gb_camera_csi_params - CSI configuration parameters
- * @num_lanes: number of CSI data lanes
- * @clk_freq: CSI clock frequency in Hz
- */
-struct gb_camera_csi_params {
-=09unsigned int num_lanes;
-=09unsigned int clk_freq;
-};
-
-/**
- * struct gb_camera_ops - Greybus camera operations, used by the Greybus c=
amera
- *                        driver to expose operations to the host camera d=
river.
- * @capabilities: Retrieve camera capabilities and store them in the buffe=
r
- *                'buf' capabilities. The buffer maximum size is specified=
 by
- *                the caller in the 'size' parameter, and the effective
- *                capabilities size is returned from the function. If the =
buffer
- *                size is too small to hold the capabilities an error is
- *                returned and the buffer is left untouched.
- *
- * @configure_streams: Negotiate configuration and prepare the module for =
video
- *                     capture. The caller specifies the number of streams=
 it
- *                     requests in the 'nstreams' argument and the associa=
ted
- *                     streams configurations in the 'streams' argument. T=
he
- *                     GB_CAMERA_IN_FLAG_TEST 'flag' can be set to test a
- *                     configuration without applying it, otherwise the
- *                     configuration is applied by the module. The module =
can
- *                     decide to modify the requested configuration, inclu=
ding
- *                     using a different number of streams. In that case t=
he
- *                     modified configuration won't be applied, the
- *                     GB_CAMERA_OUT_FLAG_ADJUSTED 'flag' will be set upon
- *                     return, and the modified configuration and number o=
f
- *                     streams stored in 'streams' and 'array'. The module
- *                     returns its CSI-2 bus parameters in the 'csi_params=
'
- *                     structure in all cases.
- *
- * @capture: Submit a capture request. The supplied 'request_id' must be u=
nique
- *           and higher than the IDs of all the previously submitted reque=
sts.
- *           The 'streams' argument specifies which streams are affected b=
y the
- *           request in the form of a bitmask, with bits corresponding to =
the
- *           configured streams indexes. If the request contains settings,=
 the
- *           'settings' argument points to the settings buffer and its siz=
e is
- *           specified by the 'settings_size' argument. Otherwise the 'set=
tings'
- *           argument should be set to NULL and 'settings_size' to 0.
- *
- * @flush: Flush the capture requests queue. Return the ID of the last req=
uest
- *         that will processed by the device before it stops transmitting =
video
- *         frames. All queued capture requests with IDs higher than the re=
turned
- *         ID will be dropped without being processed.
- */
-struct gb_camera_ops {
-=09ssize_t (*capabilities)(void *priv, char *buf, size_t len);
-=09int (*configure_streams)(void *priv, unsigned int *nstreams,
-=09=09=09=09 unsigned int *flags,
-=09=09=09=09 struct gb_camera_stream *streams,
-=09=09=09=09 struct gb_camera_csi_params *csi_params);
-=09int (*capture)(void *priv, u32 request_id,
-=09=09       unsigned int streams, unsigned int num_frames,
-=09=09       size_t settings_size, const void *settings);
-=09int (*flush)(void *priv, u32 *request_id);
-};
-
-/**
- * struct gb_camera_module - Represents greybus camera module.
- * @priv: Module private data, passed to all camera operations.
- * @ops: Greybus camera operation callbacks.
- * @interface_id: Interface id of the module.
- * @refcount: Reference counting object.
- * @release: Module release function.
- * @list: List entry in the camera modules list.
- */
-struct gb_camera_module {
-=09void *priv;
-=09const struct gb_camera_ops *ops;
-
-=09unsigned int interface_id;
-=09struct kref refcount;
-=09void (*release)(struct kref *kref);
-=09struct list_head list; /* Global list */
-};
-
-#define gb_camera_call(f, op, args...)      \
-=09(!(f) ? -ENODEV : (((f)->ops->op) ?  \
-=09(f)->ops->op((f)->priv, ##args) : -ENOIOCTLCMD))
-
-int gb_camera_register(struct gb_camera_module *module);
-int gb_camera_unregister(struct gb_camera_module *module);
-
-#endif /* __GB_CAMERA_H */
--=20
2.47.3



