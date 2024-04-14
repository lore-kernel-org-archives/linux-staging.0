Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D2837707
	for <linux-staging@lists.linux.dev>; Sun, 14 Apr 2024 11:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713095478; cv=none; b=jWcvjrq7FzVkQjQ6mHB23VFcRYJL7+hl2w6s6wrIOV3s/Eqd+39EVanv9z9CHcP9Grfyu4Q1DsU5enV5+FV6lE0tCOHntDHopHRZNweA/OtdWbqxcJvICXMSxUVYbhx0EAd8dULHQCEzcR56WKb+U85QygodMDGPcw+6Ij7HROA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713095478; c=relaxed/simple;
	bh=rXTOdsaRIzRbNgVlIBMIj0vO3iGBtzcD6lZjA2B5V1Q=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ENbGlccTXnakkRYtd+tHjbJIG/H0J0S3I4JHK8Hu3HgbfkFDEc7GO3r3lFULLQqlqgC5N/hjXSc8lfKogVKb/VajycZYKRzveydPx8mYEZbtMs4EvsYsa+FpkoP+Ur4NLnGor/mFt2L9TkLHIpLCNFRbeya7G0eHgmVLNk9qUaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GVtvEdKW; arc=none smtp.client-ip=209.85.216.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVtvEdKW"
Received: by mail-pj1-f67.google.com with SMTP id 98e67ed59e1d1-2a2dd2221d3so1519037a91.0
        for <linux-staging@lists.linux.dev>; Sun, 14 Apr 2024 04:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713095475; x=1713700275; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qs2idsBX3ZZ5E4aZueQ/SYBDJyQHjsxqMHTtPG/8MaQ=;
        b=GVtvEdKWNnLyaxO8hggRF1rWoHAH2IivihvbloIwI/BCmfL7Nja2hbSFS2Snw0z9r0
         DBAVST1kD/P1d/gDXOmZSpDGvzYtdghWOMfilvGK6hNJPLdb610mthi12UbYuYUqQrEP
         rcrYeVjjBlQ4Z8nvVtUoQQXNSMlXOaTGFn8uCeKBwWqdPQsuqkznWgOYNLbxtm/lBFJM
         pma0g8OxZmIMlwTGPmNlwBTUk+o8gWLsd8FcNn6JldFA9lXsKc6lq3MUKdu/DRoYHyI2
         b32v00Xb46WeG/r6snNVhWefS5aqw7wKEAyuYUD0DrF48Al1ZDcTCcITFrycDOZxw8dU
         rVkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713095475; x=1713700275;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qs2idsBX3ZZ5E4aZueQ/SYBDJyQHjsxqMHTtPG/8MaQ=;
        b=nTglXKyXnw7aMqnH02MtIst0+/1zxLktXczhBotuYv8pvMoCPt0b94L1nXQFHcbIY2
         KXaf3j87gyPEDkwv+/Oqy9jdZnKbQ+GsFp16K5I2xKVfkpkeINbYwwgq+wctwGLEtmos
         XRRiVQgVKupb+wqwIqZqz9o9A4oJdbAIDnnuEcfVB/ud5j0ErnVHeC6ZQo0yo4jdvHfo
         j4cUu5bz5c4sfhZqc1DyqbbNL16fQbAjNb8mHjz/wvXl5hkQoJIAn0THmx2P0uUIXEA/
         KLVWWzulLwk/VoQupOJuPjDlET9LhyJmyUUmWp17hDXTZLKpHzi4QMZlKFJja7/mdOVL
         cF0A==
X-Forwarded-Encrypted: i=1; AJvYcCVbqOW8uqHeT/MSdeQT4eKVLW1eTvJ1Bx5d9/z2wHfPCpa5eTm0gtiEDiVrVFcjfhIp06EEKmv0Jh1LldqIBqCSUDH9abT+WhxABaxB9g==
X-Gm-Message-State: AOJu0YyRSxFVxEcl69UKLTmg7j4igzL5mSoGS7VigVDfEwMxZGkEQXqb
	yg+DZnhYtfT7H5C0c3dCTQfJL5J05LSPCsoa/xe+Ye0GDwYKjYhr
X-Google-Smtp-Source: AGHT+IGRTsogyptL6qX2/64x1lRw3gvt/9KI3ggg0T6r4jcoCUp2JbHXPZtGdmBTqD7gB6JwUFGuKA==
X-Received: by 2002:a17:902:e809:b0:1e5:9da5:a799 with SMTP id u9-20020a170902e80900b001e59da5a799mr5635241plg.6.1713095475264;
        Sun, 14 Apr 2024 04:51:15 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1cb8:5ab4:8eca:a8e7:b24c:7514])
        by smtp.gmail.com with ESMTPSA id w13-20020a170902a70d00b001db66f3748fsm5913165plq.182.2024.04.14.04.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Apr 2024 04:51:14 -0700 (PDT)
From: sumadhura kalyan <opensourcecond@gmail.com>
To: florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	gregkh@linuxfoundation.org
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sumadhura kalyan <opensourcecond@gmail.com>
Subject: [PATCH v2] staging: vc04_services: Reformatted code according to Kernel Documents.
Date: Sun, 14 Apr 2024 17:21:06 +0530
Message-Id: <20240414115106.105946-1-opensourcecond@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Issue found by checkpatch

Signed-off-by: sumadhura kalyan <opensourcecond@gmail.com>
---
v1 -> v2: Updated subject line as per standards

 .../vc04_services/vchiq-mmal/mmal-vchiq.h     | 29 +++++++------------
 1 file changed, 11 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
index 09f030919d4e..98909fde978e 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.h
@@ -42,8 +42,7 @@ struct vchiq_mmal_port_buffer {
 
 struct vchiq_mmal_port;
 
-typedef void (*vchiq_mmal_buffer_cb)(
-		struct vchiq_mmal_instance  *instance,
+typedef void (*vchiq_mmal_buffer_cb)(struct vchiq_mmal_instance  *instance,
 		struct vchiq_mmal_port *port,
 		int status, struct mmal_buffer *buffer);
 
@@ -101,31 +100,25 @@ int vchiq_mmal_finalise(struct vchiq_mmal_instance *instance);
 /* Initialise a mmal component and its ports
  *
  */
-int vchiq_mmal_component_init(
-		struct vchiq_mmal_instance *instance,
-		const char *name,
-		struct vchiq_mmal_component **component_out);
+int vchiq_mmal_component_init(struct vchiq_mmal_instance *instance,
+			      const char *name, struct vchiq_mmal_component **component_out);
 
-int vchiq_mmal_component_finalise(
-		struct vchiq_mmal_instance *instance,
-		struct vchiq_mmal_component *component);
+int vchiq_mmal_component_finalise(struct vchiq_mmal_instance *instance,
+				  struct vchiq_mmal_component *component);
 
-int vchiq_mmal_component_enable(
-		struct vchiq_mmal_instance *instance,
-		struct vchiq_mmal_component *component);
+int vchiq_mmal_component_enable(struct vchiq_mmal_instance *instance,
+				struct vchiq_mmal_component *component);
 
-int vchiq_mmal_component_disable(
-		struct vchiq_mmal_instance *instance,
-		struct vchiq_mmal_component *component);
+int vchiq_mmal_component_disable(struct vchiq_mmal_instance *instance,
+				 struct vchiq_mmal_component *component);
 
 /* enable a mmal port
  *
  * enables a port and if a buffer callback provided enque buffer
  * headers as appropriate for the port.
  */
-int vchiq_mmal_port_enable(
-		struct vchiq_mmal_instance *instance,
-		struct vchiq_mmal_port *port,
+int vchiq_mmal_port_enable(struct vchiq_mmal_instance *instance,
+			   struct vchiq_mmal_port *port,
 		vchiq_mmal_buffer_cb buffer_cb);
 
 /* disable a port
-- 
2.25.1

