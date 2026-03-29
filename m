Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EEE1F4611
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 06:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774765366; cv=none; b=oIPJxl7906i6Sd1sT7ptDlsBSPMlUtocK3DSGKa8sX0NsTClMwE293IsFV3DyhU9R27IRZVY1xiCArv4bLvACM112H3qxqYEYZEiCYN3Shy8EOyi+uE9fxnO5LMA9YibYGHY8KglFfKEBQRSKp4l1mX3qzM5klEiKVvVeAAxa5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774765366; c=relaxed/simple;
	bh=1NJ9txRS/sn2VYWeK0X022VlU7VuWTesL6jGa1e4M0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EIurMdKEyX3M//Xpac1QMNqnAsUQB6FhAhCIAqaxsa26IaFrVSKa+LEx5SoADQvFGea9BD9Lpot+3ecJt1t9WMoc9X9dTSEmnVxesi/RoLC9Lm9PhEEunLf+k7BLtrC5NqfhlSiV/ore2MV4gHtv2ASItVwdd061VvC9eK5adjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S9Rl5fQg; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S9Rl5fQg"
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-953ad5a55b7so342367241.3
        for <linux-staging@lists.linux.dev>; Sat, 28 Mar 2026 23:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774765364; x=1775370164; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eTmuafzjN7+tejhsrhvW0OEJHSa9Jt6WQaBKlOmOs9M=;
        b=S9Rl5fQgUrlDyrLHr7ETClvDlSBioUwY7Gojp5uWqiVOHsoj7w4W8RO9pDcdZ8HLBh
         tEcpo33CmbPwcJ/JN0100yot+ielsusA4/mjThFPY6/MSdVQp1XBriQH8Oj9zygCwVpr
         Uofnrwb+xGR1sJa/Be+Le3b0Ln2nsXtCOvG6RVv4/shfVD3IKjZiRy7G1MtExNuAgy4N
         IdYPwBUnXx9rtji1KUxM69KrJbDsB2b6blMfd81lsos4vo0VNOhZqc1QLLqQIG5ZGy+B
         Lt7F1gO9Yj6vKJJP4zAQsv/nXk0kSpjLJ8OdHsOReNsGURlGa7yR9BrytdggAY1iZSHS
         nffQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774765364; x=1775370164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eTmuafzjN7+tejhsrhvW0OEJHSa9Jt6WQaBKlOmOs9M=;
        b=e1/MgF/eV7yf1tlNm+z3wMOQqF7ezyJ+HzgdNgiIoKaE17tBdK5CEbk58IE7EZHtrn
         klFZiIymmNPbDeplLZuMm0OMyOQUiPLOqAEvl7h7cdnaNLi+AXz6iparVjGJxM9iWYOU
         3GFoUEn+nD7Hdo2r3ChyDBlnmNm5YmCqWOkFUyn79AX7sivBXYkd4aHVBDsRsJo8eR3I
         F9+Yj8N9NIuFKkhf2gnatg0vuWWiRMKGgvb3IG1EpD17SeDLt3ZUZz3OxuE2D1oY2aLl
         8eiWMxc9eBEvs22NbAMrQYlnOsUcwDAPGBaZ5UMiwQ+vLKp1gc+7p/nsFY5QmKxPR+P/
         822w==
X-Forwarded-Encrypted: i=1; AJvYcCVdPMv54X8AGvJaW/N8HLt6tNcLoJI7RBeCTdWf1HHSJ69hWfIYdhw6NGOQeNh6SjJKsXSRccNyTcq1Uei2@lists.linux.dev
X-Gm-Message-State: AOJu0Ywcl61mc7FdiaAkSfeBaBIhZjL0pVUj3ZcT13EpnyXo+Jp6rGqM
	zpjG6nqpsnpBjxutVCex7bZwWdZoH7eGEBdqbcFdHrPoGIBJqJkEvhNZ
X-Gm-Gg: ATEYQzzeC9sF01ciIaHJ7pNQ7ccqZ5ecCvXtrDhQ0EYdtk2+vZpscDDKseXVpcxI8Vb
	TzvWBYOqnjObls1hb/Feh4LVPRn7G1MHGQDsfmvmALBn6qp2M/ZJ8WEFH7Cb8BKJR53lUZFDn3M
	JILTIe8TQ/JTb+P3rzSg2wD+NvsYPSWSHDIesVbnGe4S43/IbOa6D8FMHAWorwZrWDnZFdl1GO4
	etp1o+3Oli2Rq29PlgEcrahaw5qem8/dKyBuO8RUVU9/aNFDyi37cnb/JEvoz2xgvB0pmJTyQ4W
	Prt99F0f0iGjyR3DPCZBx7Ref8wAYEHbOTDIrc3/C2VcVhzP9z0kKO0M97tsBvSPg+4xQ5Ayk1l
	z05V0tyiZsjxmu3s5k7TJaTvnx9KH94CpyZtCGy/A2ok3srxJQJDuE0XvEzSvm9s8tk99Vm5wKN
	WC0WHQkxBuM6HcMnNgvAKVLgup
X-Received: by 2002:a05:6102:26c3:b0:602:8de3:8df4 with SMTP id ada2fe7eead31-604f92c4d39mr3130236137.20.1774765364018;
        Sat, 28 Mar 2026 23:22:44 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac6:d6db:aa::11:19a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512d3a037sm4475072137.9.2026.03.28.23.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 23:22:43 -0700 (PDT)
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
	=?UTF-8?q?Sebasti=C3=A1n=20Alba=20Vives?= <sebasjosue84@gmail.com>
Subject: [PATCH 1/4] staging: vc04_services: vchiq-mmal: fix OOB array access in event_to_host_cb()
Date: Sun, 29 Mar 2026 00:21:11 -0600
Message-ID: <20260329062229.493430-2-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329062229.493430-1-sebasjosue84@gmail.com>
References: <20260329062229.493430-1-sebasjosue84@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Sebastián Alba Vives <sebasjosue84@gmail.com>

event_to_host_cb() uses msg->u.event_to_host.client_component as an
index into the instance->component[] array (size VCHIQ_MMAL_MAX_COMPONENTS
= 64) without any bounds validation. The client_component value comes
from the VideoCore GPU firmware via VCHIQ message passing.

A malicious or buggy GPU firmware could send a crafted
MMAL_MSG_TYPE_EVENT_TO_HOST message with client_component >= 64 (or
negative), causing an out-of-bounds array access in kernel memory. This
results in reading/dereferencing a bogus vchiq_mmal_component structure
from memory beyond the array, which can lead to kernel crashes or
potentially arbitrary kernel memory access.

Add a bounds check on comp_idx before using it as an array index.
Move the component pointer assignment after the validation.

Fixes: b18ee53ad297 ("staging: bcm2835: Break MMAL support out from camera")
Signed-off-by: Sebastián Alba Vives <sebasjosue84@gmail.com>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index d36ad71cc..4772126d7 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -477,12 +477,19 @@ static void event_to_host_cb(struct vchiq_mmal_instance *instance,
 			     struct mmal_msg *msg, u32 msg_len)
 {
 	int comp_idx = msg->u.event_to_host.client_component;
-	struct vchiq_mmal_component *component =
-					&instance->component[comp_idx];
+	struct vchiq_mmal_component *component;
 	struct vchiq_mmal_port *port = NULL;
 	struct mmal_msg_context *msg_context;
 	u32 port_num = msg->u.event_to_host.port_num;
 
+	if (comp_idx < 0 || comp_idx >= VCHIQ_MMAL_MAX_COMPONENTS) {
+		pr_err("%s: component index %d out of range\n",
+		       __func__, comp_idx);
+		return;
+	}
+
+	component = &instance->component[comp_idx];
+
 	if (msg->u.buffer_from_host.drvbuf.magic == MMAL_MAGIC) {
 		pr_err("%s: MMAL_MSG_TYPE_BUFFER_TO_HOST with bad magic\n",
 		       __func__);
-- 
2.43.0

