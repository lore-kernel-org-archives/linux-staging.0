Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72214823B5
	for <linux-staging@lists.linux.dev>; Mon, 15 Apr 2024 17:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713201135; cv=none; b=Fjt2ne9nTpL1MTa7lhPGi0+29IPYWpvnWA2jH6iFVNGifTO4iaURjfh0M4d59tObhzabfnCmQXdmITILlj+gBqMf+4nJamBUK78XOqFRMrUPF9DgDQK8/4xn43IoSoQC2216KgyG/4Ld4UOURbJrZKC3SLr/gGl77S9jE0V1NeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713201135; c=relaxed/simple;
	bh=r+GwkVwnqEAEA+xTUwJ+9bNmEWwrcN4rCWKgahGYD9U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HzO8/qaq/bTRf1uYaWmtY2s7GuYB3l+DViY5q2wtd/ExF0xxLQEz0+hNwC/u8aVX5FTEX24Sq14Grg8aiT+d+6DItqTsoGzw9vF8zHX40NZ+Ygg5qQXwKpgUuG4Vnr2Hc5dLPNkIPh7le/CA7eXYV0gqZarBB2HLX2OGYnIE5Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJ2Tn3gT; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJ2Tn3gT"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6ed691fb83eso2833031b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 15 Apr 2024 10:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713201134; x=1713805934; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CvwdBBuZlWCCCSofEdCkvt7eAMHgf9aarWbclnob5NQ=;
        b=UJ2Tn3gTM6qY2ryl/kjv46y+xE/AVUgQPxCN6QnHQiifrfmJgVm61UR23GqucdQTy8
         k/4XfafZXma24yycOAjnFMpN6URGMM0nEFQHLQru6+QOs10NpmjIYh/pihpKGzLVoKzh
         HS+xUtabGi1FNNR0CjqK0/D3GA5A8Ma6KkVrEnE3NwrmeVzb18L5LcMZym5Avk9YOeJN
         q+mJ7mzl/ySYdCkOHHAKaKJ7rwFnOwRVyVfdt5LdeH9iSt4kc6uliiIQ7BueS2DYJ+gD
         1qKfKY7nrT62fNydyw9lZQ06LjaptumZ2iucVP5stwAZQWuv5w8htQ5RKS4UDZdYWwHS
         upwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713201134; x=1713805934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CvwdBBuZlWCCCSofEdCkvt7eAMHgf9aarWbclnob5NQ=;
        b=XR/SW7MuhubDUFz8+Exwet4mjleS2aEH2ODGLgimPxR3uWQBA5iUvvu+QauIhz4HyE
         lKHU5mR2hoC1o30MejpqXnmel5Ftj3TrmMPp1vCms+3QAnGCPBrP7R51kYWKbBwckcd4
         VYlsZgd2KriQNBpoe+XV53xLRJz+ymcRvNT1BUEZOBMbf2o5ycQl8yyB7gbj3sA/oQw3
         12mDBOOKX0koIj/jbeSPLWs8bcj15JvJeSilyd6LL0o3CD9OYQdVon8FuERTjXbGIF3b
         HbUIw3ZpX0Bj8uhw3Uq3LrAl1Y+NLi92PpiTKNVu3pRfLbv7enjqdgJ9Z9Bup8MhQ6R1
         z3Cw==
X-Forwarded-Encrypted: i=1; AJvYcCVNzMyX61N7Sp5PuYCX+ri6EgxGGk0NcjNiUojlb1nmZWViBvc9hDAnznP+eknuSvaXv9fuBprk3i5wYdgGIBQ+qUFXTVd1YMloNd1qUQ==
X-Gm-Message-State: AOJu0Yzlqf/9dYCRQ86aOk/TPoJYgxHY7EA+yd1+qBCDL4OZ3z79s6sZ
	kXMY8lhD2jJUd1j814F+b0Q1ic1pRcQnyWEuebjrwmpk1fieUTTj
X-Google-Smtp-Source: AGHT+IE7IZU2/0040JDE8A9eO4n2gqnQpnPo+QJy1LEsOG5qn+YdoFSORy+XVRZed49zlffpB7jPnA==
X-Received: by 2002:a05:6a21:3707:b0:1a9:5e63:501b with SMTP id yl7-20020a056a21370700b001a95e63501bmr7294111pzb.44.1713201133804;
        Mon, 15 Apr 2024 10:12:13 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1cb8:5ab4:cff:f60:1176:9dd3])
        by smtp.gmail.com with ESMTPSA id v11-20020a63150b000000b005f769b41a58sm376599pgl.4.2024.04.15.10.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 10:12:12 -0700 (PDT)
From: Sumadhura Kalyan <opensourcecond@gmail.com>
To: florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	gregkh@linuxfoundation.org
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sumadhura Kalyan <opensourcecond@gmail.com>
Subject: [PATCH V4] staging: vc04_services: Re-align function parameters
Date: Mon, 15 Apr 2024 22:41:38 +0530
Message-Id: <20240415171138.5849-1-opensourcecond@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Checkpatch complains that:

CHECK: Lines should not end with a '('
+typedef void (*vchiq_mmal_buffer_cb)(

Re-align the function parameters to make checkpatch happy.

Signed-off-by: Sumadhura Kalyan <opensourcecond@gmail.com>
---
v3 -> v4: Repharse the subject line.

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

