Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB8D2C11E1
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 07:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774768599; cv=none; b=pnXOh9jXzHiUC1CpJzqUiLgVtB2coAhurIZpZuRGW3+t7ejuL3GJG4ncuhMiynqTA/8Lgk/n2GUCFp7FUyxShLnAP+4w/ZvAlHPY3gvX2O1VGCrVdM4jgQOppbwnlMjGgh7tpTxcZXcH/48+pSGZ2fP5PFens++Fd6vNHB8/Oog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774768599; c=relaxed/simple;
	bh=libs/QDv9jb4avhsuouWTEl+BcQZS4aPoB0znhCSDhk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g99NqsTuQ7351AieOWHnHUMDnpXkGPCuRAblxsK8kFU0qlqUjqtAdv/Tg4m82kWzkowY/rP7y4VRpdse64Pbey/8yBa3vfXnorcHzqXKjE+dRVa99aCZLidpIQLvnfUz660/Km6kzsdj0CaLTJq8m2+TyJM8FaPuEKWuLvo71Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bpB86E9R; arc=none smtp.client-ip=209.85.217.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bpB86E9R"
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-604de452750so2012709137.0
        for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 00:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774768597; x=1775373397; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=veDKQhNg9NBvP46wNZP/JDlqedS7FBlQQuLF0X7HADw=;
        b=bpB86E9RP3H0GoU6JcUrkRmPbzkjEcTnDDiytm3zhWYXgef+7dkV9ZiSOvT6dxCSti
         CF2qHELqXX4ku85TmFDT0b5TJH39T1wxYeMqms2y2Xogsc/l4YrYOxroetxq/+aMxLrr
         CMeFxcWg5Yqy1qE7T0foYs8rWRQxqc69P0YaZ20OHKub76InErGCXLVjPPaGHVwBL/bS
         TLWgRAKAQebmRI8K/k/KbG6ofUKf8xF1Bnd/uvSTyjPJj2aODDKZcd0xmXpCoprgaRe2
         wElDV2jTbJo1dl5t1uGubQ1AqiJxu76Zw8J8UV5QWGOedF08TiRa0EfcWKzrvjcFIDkX
         9icQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774768597; x=1775373397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=veDKQhNg9NBvP46wNZP/JDlqedS7FBlQQuLF0X7HADw=;
        b=LNBYt8X57kAEJPLxDiuLS9R5OJ2IkY+0X7gAhYWwU7SriB8h/gEPk4MALtaLcBdy88
         XPlHPJToTpbLx4EiunegyQhxuOSobjmUlaxMTA45NDXXz9jn681H3K847q6PVxsL27Un
         Fb2DWU5+oOa6+org2nY72qUxAlHnYCV8QTsR4OVRuYa5NOsDO6K3Vg5/EbcQ+hpeJh5M
         p4dskmUaly+BG1eOrvrqCq89/1qWezi+N4VEw7o4ZY8YS9/0pyyrbY3l1FSRu5hEWP5p
         OBHWh6+r2ihQhG772WkG15qU8HDujcYoGvYBG2fBiWU2CVb2P5B0YhKRAw5cfDYDMJTe
         UwpA==
X-Forwarded-Encrypted: i=1; AJvYcCVsIbPoFARArQfftpvFDfU8qhnee1GQhbdbbEvpzNOkdKKB1k8qhrbm5XU2Ea+2ZuXrycC7LYhqIOZlT/Sh@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8LVXrswBg9FLNUoNdr3gcDR+8RRa3H2X25w6OQvXsfBawYjJh
	lu+jB2iIJT0GyMoDNsUPQOL+C3nCj7jfNUJErBtsHgf6rIGNZjw+ef4N
X-Gm-Gg: ATEYQzx13uCYb1KkurqsYlECOKZUdtCOR2A0Y6cTOZM+/CP7WGLG9japel7sPGhdeBx
	fPrs7yOg8RT9nI+0HuThdVLaKuMjbqJGMhx5ET6ACJgku2xuMX0KEjp38STa3Mt+gZe2MwYzawr
	3GZpUYAFICcG3etY6mi2SFC8OQ6/+vpv6iTygU6je/pb2cxIoiqJazJ03KjkTi8q7TuiAsPKA9/
	NH9G+vLMJg1JCmiFLxpcRzOT4+eyHmgtDQGE2QLgWzyDwxFgpHkNSSHj8gLSlAbNJefqiZnfMT8
	zbrpU9uob3YCnN1rXS3evICXaIF6AvQQKdiuwIRZ9asZxEabsGmdhFuZ2IDbrEUlKzXSfjC8g1j
	L3JrQqupuV/r1vy4UF7SWzyIIDt9u56zsAjrAy6d9rSLg77mD1qQwGXQ9cUy6DdHdUZazx8j3kq
	XzY/ZyRms6flR0fy5Ig3Qwa8CYDRDDLdShxH8=
X-Received: by 2002:a05:6102:6cb:b0:602:9977:a4f5 with SMTP id ada2fe7eead31-604f926f2d3mr3395247137.27.1774768597337;
        Sun, 29 Mar 2026 00:16:37 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac6:d6df:aa::11:19a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512a5afa9sm4390638137.6.2026.03.29.00.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 00:16:36 -0700 (PDT)
From: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	=?UTF-8?q?Sebasti=C3=A1n=20Alba=20Vives?= <sebasjosue84@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v2 3/4] staging: vc04_services: vchiq-mmal: prevent stack overflow in port_parameter_set()
Date: Sun, 29 Mar 2026 01:15:41 -0600
Message-ID: <20260329071616.507876-4-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329071616.507876-1-sebasjosue84@gmail.com>
References: <20260329062229.493430-1-sebasjosue84@gmail.com>
 <20260329071616.507876-1-sebasjosue84@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Sebastián Alba Vives <sebasjosue84@gmail.com>

port_parameter_set() copies value_size bytes from the caller-supplied
value buffer into the stack-allocated struct mmal_msg's
port_parameter_set.value field, which is u32[96] (384 bytes). There is
no bounds check on value_size before the memcpy.

While current in-tree callers pass small fixed-size structures, the
function is exported via EXPORT_SYMBOL_GPL and accessible to any GPL
kernel module. A caller passing value_size > 384 would overflow the
stack-allocated mmal_msg structure.

Add a bounds check rejecting value_size larger than the value field.

Cc: stable@vger.kernel.org
Fixes: b18ee53ad297 ("staging: bcm2835: Break MMAL support out from camera")
Signed-off-by: Sebastián Alba Vives <sebasjosue84@gmail.com>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 44e5246f1..18e805b92 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -1361,6 +1361,14 @@ static int port_parameter_set(struct vchiq_mmal_instance *instance,
 	struct mmal_msg *rmsg;
 	struct vchiq_header *rmsg_handle;
 
+	if (value_size >
+	    sizeof(m.u.port_parameter_set.value)) {
+		pr_err_ratelimited("port_parameter_set: value_size %u exceeds max %zu\n",
+				   value_size,
+				   sizeof(m.u.port_parameter_set.value));
+		return -EINVAL;
+	}
+
 	m.h.type = MMAL_MSG_TYPE_PORT_PARAMETER_SET;
 
 	m.u.port_parameter_set.component_handle = port->component->handle;
-- 
2.43.0

