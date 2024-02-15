Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E170D13A86F
	for <linux-staging@lists.linux.dev>; Thu, 15 Feb 2024 22:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708037593; cv=none; b=m8zWmjtON9QnqpRz9H3936TT0ku/MPkCRn+MJcFLFjJYUn445tZZByjx+QvauNArBn2rsECQgfMcLUUEORQfimmEsxabBINrjN/zJ+FAbwzsxqVf9VGOr8vQcAvnzZDGSg4SNjsWqwZuMvEu12QVnDrse/r0Y9F1yxooTeIfR8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708037593; c=relaxed/simple;
	bh=2FVu6yXE7U52ivGAjAAmrkoj6QOniMtDTmis6EZTPqk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WDLRDDuLRaTi6gx3B1QxC/6NDqkK7Yjqxc0go8RQpJoxYi5U1b9x+TmxnpywwfQkGa4sRdxEoMjlQylL7oCMWmbU6Y/JtiwXGFx59Zdj+ch9nRYxLynVdto8Qb7jdreUIrJc3Jo3nlM7yJmUdSI317w3eOsScAjMabA6CYv4epQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LbKxOErD; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LbKxOErD"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a3d5e77cfbeso260490466b.0
        for <linux-staging@lists.linux.dev>; Thu, 15 Feb 2024 14:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708037590; x=1708642390; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dM/iULill3Uj1lqLW3ClBj2hmpKY1OGRqTHuq9SM0pI=;
        b=LbKxOErDk1ZLXrn9fAxUmOnOVdVOYBP4sUQekmdmvNAAMgBdc9X8jQ2wPGdMI7/3Uf
         K2L1pcHkD+M0GuuRfWSXNWIOTauAcCycGJpwF/oFlJ0TA+17I8odzMl47xD5gWOwxfeH
         P/CQ6I3iNM/LcQoAdpsz/YiEEvNnYLfftZg6lWYJLZKZ5By6bfD4hGYYSJlzQkIrTVTy
         VvUHxWOktQ36wgaGD8hvKewf9EmXp0/2l/cxZn0dVJjqTB3iaRbp9O61i21cs27hA86y
         YHj7Jhkne/uUdpiwD+1Q5SR6elsyPgILhOm+mvVm85D5CMYwbe2GjCiBd5GCbYeD+qH1
         71AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708037590; x=1708642390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dM/iULill3Uj1lqLW3ClBj2hmpKY1OGRqTHuq9SM0pI=;
        b=YQTKLg85Aik6HnftbOz0ZGmH9UP4/64uQqiamhCkrI0d0gDtQ0So2QnKqYU1dhD+Ur
         g9QcWWBBoskkIoGM2UDsKiPCjPPe0NP522rjqHFF2ShatqcC+RrPJ+3VnyhyS+HMprv5
         M4tlwY6/7sEZtsVxRc1/a1oW3mdTlBgpnTcEtvvoNv6o8FofZnGRxq53TYD1QcHxNIXr
         ME/mrM207c8WC3Zd7JNvuXbetMfJVUMyYDmhAelw/9TIbeV7odSTg/nbD2l0xXlCn+vV
         oSvrPJx45u7opQvRXJY0PSy0U5ZrFon43xh89xIIXDci2C4RbHO1vLguuapcn0UIslLy
         bY4g==
X-Gm-Message-State: AOJu0YwQrpWk+OpEQoNYTLXBLOY0hzz6iUazgLnEjD8nE5KzUllGrXK9
	Piab9mcEcy0v4WMTrxqBK78rJjlnPyiZdkhAPdWYo0FQagh4k2Jw
X-Google-Smtp-Source: AGHT+IHhX9TEWUB84SFRhuZNXr7KhVPFBUH31IMkj66V/NmQ7Seh5e4nlfDjHV17LK9b77QMCKR7cQ==
X-Received: by 2002:a17:907:86a4:b0:a3b:ad02:98b1 with SMTP id qa36-20020a17090786a400b00a3bad0298b1mr6506310ejc.10.1708037590040;
        Thu, 15 Feb 2024 14:53:10 -0800 (PST)
Received: from pinguine.lan (ip-176-198-146-182.um43.pools.vodafone-ip.de. [176.198.146.182])
        by smtp.gmail.com with ESMTPSA id s6-20020a17090699c600b00a3d88bdf5aasm966467ejn.103.2024.02.15.14.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 14:53:09 -0800 (PST)
From: "Moritz C. Weber" <mo.c.weber@gmail.com>
To: florian.fainelli@broadcom.com
Cc: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Moritz C. Weber" <mo.c.weber@gmail.com>
Subject: [PATCH 2/3] Staging: vc04_services: bcm2835-camera: fixed several brace coding style checks
Date: Thu, 15 Feb 2024 23:52:49 +0100
Message-Id: <20240215225249.11010-1-mo.c.weber@gmail.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed coding style checks raised by checkpatch

Signed-off-by: Moritz C. Weber <mo.c.weber@gmail.com>
---
 .../vc04_services/bcm2835-camera/controls.c        | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/controls.c b/drivers/staging/vc04_services/bcm2835-camera/controls.c
index 6bce45925..e670226f1 100644
--- a/drivers/staging/vc04_services/bcm2835-camera/controls.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/controls.c
@@ -533,17 +533,15 @@ static int ctrl_set_image_effect(struct bcm2835_mmal_dev *dev,
 
 		control = &dev->component[COMP_CAMERA]->control;
 
-		ret = vchiq_mmal_port_parameter_set(
-				dev->instance, control,
-				MMAL_PARAMETER_IMAGE_EFFECT_PARAMETERS,
-				&imagefx, sizeof(imagefx));
+		ret = vchiq_mmal_port_parameter_set(dev->instance, control,
+						    MMAL_PARAMETER_IMAGE_EFFECT_PARAMETERS,
+						    &imagefx, sizeof(imagefx));
 		if (ret)
 			goto exit;
 
-		ret = vchiq_mmal_port_parameter_set(
-				dev->instance, control,
-				MMAL_PARAMETER_COLOUR_EFFECT,
-				&dev->colourfx, sizeof(dev->colourfx));
+		ret = vchiq_mmal_port_parameter_set(dev->instance, control,
+						    MMAL_PARAMETER_COLOUR_EFFECT,
+						    &dev->colourfx, sizeof(dev->colourfx));
 	}
 
 exit:
-- 
2.30.2

