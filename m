Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680302F25
	for <linux-staging@lists.linux.dev>; Sun,  6 Feb 2022 07:46:23 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id b1so244543pfi.9
        for <linux-staging@lists.linux.dev>; Sat, 05 Feb 2022 23:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JfNa77FHoLegWMiGAXFL+Tu9PZ+tk17TjCdFCf2r/90=;
        b=BwlP/N3BSptV3rohiHx1sSRLuPz5PHJAMh5eVkSv++a3F9oJ+qXtJrIoSvBT8NiIql
         /20XuTTkFcVGAahsoKrTd58ABo/Df+QVgvOf30g13kD+31TKg0+HvvNPHgAwAasxcROO
         3TjFrvs+4mGhkecDPn2LJN4m669CclNCQl3U1wbLwRv5pXiHXvv0PlYwApYPw4NUGnbK
         4dik41D46xeC2x4IscupMUni3o9WdEsGpAy7Wqh05oP5Sp0Y8b2d/vyKrTrn8JUQfgI6
         TDj/aDkMy1z6G39vUJHoJsfChh4ARVQHvLbDi7lJWsgq8eps5yrFXmo+u848gNhMf2lh
         uHSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=JfNa77FHoLegWMiGAXFL+Tu9PZ+tk17TjCdFCf2r/90=;
        b=S2xbmC4xKGt9ioUjQ0vmP5aJE2G8rNruHECdk7LDkJfGxd599JGPuUifcGELyvh6cm
         T2hMNmuO4Cfbr8SIPy4QH4s3sl1DtKqFoIWy8B3ibSTibcVAeKZyZ/qemsg/rweR4WdJ
         9cZnKsRMcJI3L5n2lybye5YRhkix0llvucYt9VH8rEGARRcJ+Clfhey0iv7qxynwHsbh
         CgZLaU+B3AlXvywMHFSgMveAwnEaBCqbNfI9JtTBN2Vo/pOUBO0OVlOvyX4rp1iSzXTT
         AQO8yzaSRYIR2pUGNX8znuKesDfHb9oxQTVz+HCjsxPG4psDk7DJPgeEZLrdYRxpB83m
         /Skw==
X-Gm-Message-State: AOAM533XNRC3rylhoEANePNQ+H9myX7REvN1CFpFXCbVjnQK+ViHnDHg
	AAMH0PR6yGoGDOCzf3HvIXWT702Kw58El+by
X-Google-Smtp-Source: ABdhPJzSbyLpXEwkAp6UoCpEVfFg5g9kYmRiY+WpwOJkwYlLlNlEmJvcC+DG9lF2O/Wkf/CckM+/Ug==
X-Received: by 2002:a63:185c:: with SMTP id 28mr5195709pgy.238.1644133582647;
        Sat, 05 Feb 2022 23:46:22 -0800 (PST)
Received: from mlpln-zenbook.hitronhub.home (123-194-202-33.dynamic.kbronet.com.tw. [123.194.202.33])
        by smtp.gmail.com with ESMTPSA id on14sm1264755pjb.34.2022.02.05.23.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Feb 2022 23:46:22 -0800 (PST)
From: joelcchangg@gmail.com
To: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.com
Cc: Joel Camilo Chang Gonzalez <joelcchangg@gmail.com>
Subject: [PATCH] staging: octeon-usb: Fix 'should not end with '(''
Date: Sun,  6 Feb 2022 15:46:15 +0800
Message-Id: <20220206074615.3527-1-joelcchangg@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joel Camilo Chang Gonzalez <joelcchangg@gmail.com>

This patch fixes the checkpatch.pl check:

CHECK: Line should not end with '('

at lines 1802, 1807 and at some function headers.

Signed-off-by: Joel Camilo Chang Gonzalez <joelcchangg@gmail.com>
---
 drivers/staging/octeon-usb/octeon-hcd.c | 67 +++++++++++--------------
 1 file changed, 29 insertions(+), 38 deletions(-)

diff --git a/drivers/staging/octeon-usb/octeon-hcd.c b/drivers/staging/octeon-usb/octeon-hcd.c
index a1cd81d4a114..60e8354104e6 100644
--- a/drivers/staging/octeon-usb/octeon-hcd.c
+++ b/drivers/staging/octeon-usb/octeon-hcd.c
@@ -1792,23 +1792,18 @@ static void cvmx_usb_start_channel(struct octeon_hcd *usb, int channel,
 	case CVMX_USB_TRANSFER_INTERRUPT:
 		break;
 	case CVMX_USB_TRANSFER_ISOCHRONOUS:
-		if (!cvmx_usb_pipe_needs_split(usb, pipe)) {
+		if (!cvmx_usb_pipe_needs_split(usb, pipe) &&
+		    pipe->transfer_dir == CVMX_USB_DIRECTION_OUT) {
 			/*
 			 * ISO transactions require different PIDs depending on
 			 * direction and how many packets are needed
 			 */
-			if (pipe->transfer_dir == CVMX_USB_DIRECTION_OUT) {
-				if (pipe->multi_count < 2) /* Need DATA0 */
-					USB_SET_FIELD32(
-						CVMX_USBCX_HCTSIZX(channel,
-								   usb->index),
+			if (pipe->multi_count < 2) /* Need DATA0 */
+				USB_SET_FIELD32(CVMX_USBCX_HCTSIZX(channel, usb->index),
 						cvmx_usbcx_hctsizx, pid, 0);
-				else /* Need MDATA */
-					USB_SET_FIELD32(
-						CVMX_USBCX_HCTSIZX(channel,
-								   usb->index),
+			else /* Need MDATA */
+				USB_SET_FIELD32(CVMX_USBCX_HCTSIZX(channel, usb->index),
 						cvmx_usbcx_hctsizx, pid, 3);
-			}
 		}
 		break;
 	}
@@ -2121,17 +2116,17 @@ static void cvmx_usb_complete(struct octeon_hcd *usb,
  *
  * Returns: Transaction or NULL on failure.
  */
-static struct cvmx_usb_transaction *cvmx_usb_submit_transaction(
-				struct octeon_hcd *usb,
-				struct cvmx_usb_pipe *pipe,
-				enum cvmx_usb_transfer type,
-				u64 buffer,
-				int buffer_length,
-				u64 control_header,
-				int iso_start_frame,
-				int iso_number_packets,
-				struct cvmx_usb_iso_packet *iso_packets,
-				struct urb *urb)
+static struct cvmx_usb_transaction *cvmx_usb_submit_transaction(struct octeon_hcd *usb,
+								struct cvmx_usb_pipe *pipe,
+								enum cvmx_usb_transfer type,
+								u64 buffer,
+								int buffer_length,
+								u64 control_header,
+								int iso_start_frame,
+								int iso_number_packets,
+								struct cvmx_usb_iso_packet
+									*iso_packets,
+								struct urb *urb)
 {
 	struct cvmx_usb_transaction *transaction;
 
@@ -2182,10 +2177,9 @@ static struct cvmx_usb_transaction *cvmx_usb_submit_transaction(
  *
  * Returns: A submitted transaction or NULL on failure.
  */
-static struct cvmx_usb_transaction *cvmx_usb_submit_bulk(
-						struct octeon_hcd *usb,
-						struct cvmx_usb_pipe *pipe,
-						struct urb *urb)
+static struct cvmx_usb_transaction *cvmx_usb_submit_bulk(struct octeon_hcd *usb,
+							 struct cvmx_usb_pipe *pipe,
+							 struct urb *urb)
 {
 	return cvmx_usb_submit_transaction(usb, pipe, CVMX_USB_TRANSFER_BULK,
 					   urb->transfer_dma,
@@ -2206,10 +2200,9 @@ static struct cvmx_usb_transaction *cvmx_usb_submit_bulk(
  *
  * Returns: A submitted transaction or NULL on failure.
  */
-static struct cvmx_usb_transaction *cvmx_usb_submit_interrupt(
-						struct octeon_hcd *usb,
-						struct cvmx_usb_pipe *pipe,
-						struct urb *urb)
+static struct cvmx_usb_transaction *cvmx_usb_submit_interrupt(struct octeon_hcd *usb,
+							      struct cvmx_usb_pipe *pipe,
+							      struct urb *urb)
 {
 	return cvmx_usb_submit_transaction(usb, pipe,
 					   CVMX_USB_TRANSFER_INTERRUPT,
@@ -2231,10 +2224,9 @@ static struct cvmx_usb_transaction *cvmx_usb_submit_interrupt(
  *
  * Returns: A submitted transaction or NULL on failure.
  */
-static struct cvmx_usb_transaction *cvmx_usb_submit_control(
-						struct octeon_hcd *usb,
-						struct cvmx_usb_pipe *pipe,
-						struct urb *urb)
+static struct cvmx_usb_transaction *cvmx_usb_submit_control(struct octeon_hcd *usb,
+							    struct cvmx_usb_pipe *pipe,
+							    struct urb *urb)
 {
 	int buffer_length = urb->transfer_buffer_length;
 	u64 control_header = urb->setup_dma;
@@ -2262,10 +2254,9 @@ static struct cvmx_usb_transaction *cvmx_usb_submit_control(
  *
  * Returns: A submitted transaction or NULL on failure.
  */
-static struct cvmx_usb_transaction *cvmx_usb_submit_isochronous(
-						struct octeon_hcd *usb,
-						struct cvmx_usb_pipe *pipe,
-						struct urb *urb)
+static struct cvmx_usb_transaction *cvmx_usb_submit_isochronous(struct octeon_hcd *usb,
+								struct cvmx_usb_pipe *pipe,
+								struct urb *urb)
 {
 	struct cvmx_usb_iso_packet *packets;
 
-- 
2.25.1

