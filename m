Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EDC01CD23
	for <linux-staging@lists.linux.dev>; Sun, 14 Apr 2024 14:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713105993; cv=none; b=UUsnjlozPT57vWRmuV6ctAMwcD94sR62P0p8hkQxbUR4CtNRUcFSIwZoVMMpyloaY4UQCTSHi4qVy/sbhHHxJmMPtq4uOG8k9RidrYhLhziJ9jgWrob8SvYO87GfvBtBtBZ2QcJJuecAfqxqjhIMP9iPhwHmyTta7RBf31gt73g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713105993; c=relaxed/simple;
	bh=Pnm5uzyLFqokE6i2gRypdZYPe78cFXqpMW9vYEyg+PI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NsQoiZSld3BXmxABLbQga+qGQB76t/AHH/JiUtFb+5bDh0DzsKOJ5+quTtigaQIwSDIUORc89+VuC+bpEO6Pp/aTcl/W4N2pSnGgZsRag7yoSK3m0HFR4w3jn+hbfd2+TIZSWabey9wFLfO2OP4EKTLSgd0d96A56hx4+BYgrMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fZFV6dxi; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fZFV6dxi"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2a2dd2221d3so1590398a91.0
        for <linux-staging@lists.linux.dev>; Sun, 14 Apr 2024 07:46:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713105990; x=1713710790; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B3tViLkTicsEqeEJWOwiTN/e7BHPxS/OI+grJULG3HM=;
        b=fZFV6dxiNEo6iO39mIbVmqLXsL7ovPAQXDWpnx9LdbVeshEdmwA+7qtR6euCdNmJIA
         GBXp1g2OG6aKOPs2IbiaAYa7AXoONZFWAHX9UTT5Pa1x9Xq0VdHWh340cwkNYIXQHG3v
         d7+Hb/gXtnBb56/YJ5QQxwW5vkTqVbiI7d1+aONVVuV+CHslB7GiniPpptRAcUI5T34I
         US/cQdbhVN3mWCvwTrsChnrRFbCBxFamzGXYjeQPK0OeO5UCHTSFzzKKLJypjJVDSJfC
         /sCxzHJs2oT1hAHg98YQXU3kvgpn8FF20FuVShCOwunoror9aBZff2hhDxlLWbF2gCmV
         YgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713105990; x=1713710790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B3tViLkTicsEqeEJWOwiTN/e7BHPxS/OI+grJULG3HM=;
        b=JuorPS5KY+SOuZ8llIZODypLZqLaxkDhQukNLux1U7/XEkA1dnnixSussfoOCf9hFN
         LKjJa9j0is3MexWMGzwrWlgfNlQB5AjHENGXrVlGtpkh3xLb1zFEbFOTKluZ3K3/iSGn
         WBvGHQQmN1pCzpX98OfzRL3MtxF92pi9lD0KXxRhsaHsuYz/xH4w6uGsQ6zEbZeSNaVj
         fI7mFtd20SOoYToj1usEVQQYehfbFswqXtXst6QM61TaTYYGIlHYHf3ORFrSWGw3HvEa
         Kbd3CEptXkE14+IgUz2QfMteEhN7ObtyxMpTfgYsgiH4Ko+HhkQtvdxW2u3Dwy9Ff25N
         +/IA==
X-Forwarded-Encrypted: i=1; AJvYcCUMeRJ3ly3FU/MFN0Jme9eLMxfYcLlkLHS0kNenSt1FQhVuj82JelZbwcsam6k3sWbywvmNCGZFm2UQlLAzI65BksVdhOP4F52afwMuTA==
X-Gm-Message-State: AOJu0YytlyhDxtSBfQKQmmy5KGlaYsycaEMddB9hNQVSTnidFaEbCvXG
	oEgb2JyfXmmPZQW70Zhc9j+46SgtlcTlt2Nf1h2ClsM1rdpdLBPs
X-Google-Smtp-Source: AGHT+IFZq/s/lmveYTlCBXK+H1HNANw04Kjky+33wlLezYN9D6uBCi2pfeFOVwDbLR348xK5M/fbwQ==
X-Received: by 2002:a17:902:eb81:b0:1e4:7cc5:2292 with SMTP id q1-20020a170902eb8100b001e47cc52292mr8096811plg.49.1713105990200;
        Sun, 14 Apr 2024 07:46:30 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1cb8:5ab4:8eca:a8e7:b24c:7514])
        by smtp.gmail.com with ESMTPSA id d15-20020a170902654f00b001e41ffb9de7sm6196325pln.28.2024.04.14.07.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Apr 2024 07:46:29 -0700 (PDT)
From: Sumadhura Kalyan <opensourcecond@gmail.com>
To: florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	gregkh@linuxfoundation.org
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	sumadhura kalyan <opensourcecond@gmail.com>
Subject: [PATCH V3] staging: vc04_services: Re-align function parameters
Date: Sun, 14 Apr 2024 20:16:14 +0530
Message-Id: <20240414144614.125672-1-opensourcecond@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: sumadhura kalyan <opensourcecond@gmail.com>

Checkpatch complains that:

CHECK: Lines should not end with a '('
+typedef void (*vchiq_mmal_buffer_cb)(

Re-align the function parameters to make checkpatch happy.

Signed-off-by: Sumadhura Kalyan <opensourcecond@gmail.com>
---

v1 -> v2: Repharse the subject line.

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

