Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4BB257423
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 06:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774765375; cv=none; b=dUAFkgh5IdISEu5V+U8pD3xywYpdIHp5Gx+1893dHgzeP9GRGnj+t8pAXPe4LuYkgH6735YcfUTp/M3tW7Rs1d8B2bghCuxoqx8UW835jLKvU32nVdD1AKQb7ntqtGQha3HHtkex326dahHlkKSkDipqt86WaLZEwY1dVaak6Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774765375; c=relaxed/simple;
	bh=nZ9iNNLIBbB0DNymhq8u3hdSEPwUBris9T08vDyL8sw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=APCHMrBo+zqh3zQ8xgO4UsxRcLfaNM4DckP40CLxi63isfh1wP/W1MbQt6/XimlvfiU1jpkm8My4N2yy3WV1mm8OLZKKJTTAIYS7H0JOj3aQK6zl/D6bQ5/D8KckTqvOBsY9cnGlz14tiD69ROQzg99dXfVJrYyLIv0B4n5cEcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mwxes3n4; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mwxes3n4"
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-953b7d2c820so37105241.3
        for <linux-staging@lists.linux.dev>; Sat, 28 Mar 2026 23:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774765373; x=1775370173; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q3f6eUM79ksch5To8yF3aZNTvb+jZ0PY04rz5fX+u7k=;
        b=mwxes3n4ev0oDJR59d9smBXYfla8O6/IzJqCDw10vM7iweAlutF6QduRwNdZfhCQCE
         sBq9SLnCArEOH5Urc4K0OXLaeBjeihFo09Cz32A1t4Ol0xvND8DhKaCMI0QwKfun06Q6
         vs1dy9kiztRSFqyARsYYn59bGngyOb8JTUyXpy1aX4pcHtz8bvn6Z1T0xRRYuR8j00vi
         JJKz3/vUBROscB0E1RwZn8PAWdxWuMwZEmpcMOH7AdqjojZxw0bv/c6/GWgdzWCWskdm
         zchCQ4L8ijXcPy32ZrwPBcf1y4bqq9WFwvPuBQn98JD/yJJvejlkgFCVTPUnorrpsUol
         gqcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774765373; x=1775370173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q3f6eUM79ksch5To8yF3aZNTvb+jZ0PY04rz5fX+u7k=;
        b=XBxXRJBngLorL5QlzOXeikJgoQPC4eTJiP4egqDBWWtgaKHk4GMxGrNQqVNsd7IPKw
         gP9V9rl4KvEv7i+GIt1/rULr1QUOzqiCo4xLC7G3c0uet4qpgRr1HaLNu9eIQW8Bt+Pl
         r4/cNFSsroV2NZnppntptrqQ+7JUBvcBMs7ruQTJ5IIxqPkJMwwo6u/pftRlq8pw1ceA
         u3ohftNsSH3KX4BItslKYxgfvRnyE4ays2QrQ/HHeOOFotioDqCVhA+2Q1stEWmwfTcO
         h1xtjxcSmao3OqIcXh6aNRCKPf27W0FFfnwkernOAawD/vI4/HQ8pXi/ZI59oiePO4v1
         icZw==
X-Forwarded-Encrypted: i=1; AJvYcCWRdW9JWz2SQiscJew0O3wNTddmQ5N40E9IvDm1Z4lwLKG7thblfLVZfgs06ZWkgScPjNN+yLI2snh6+Z6e@lists.linux.dev
X-Gm-Message-State: AOJu0Ywq3bIJD5FyJ8zk5rCrIlwlg4jg7GvpDnX9tzjM9SORlpr7h9b2
	CveNSifeCtkgA3TrHLcmb7zOBXZhLEuHcmjsqacYp4qen9ao54Hrzl2w
X-Gm-Gg: ATEYQzwPqyNOV+Vswf415VDjX7rtUsaZOR3xVRf/qSImXUioCHf4uxmFbrciPCXEmfl
	W1IpgOwjaPfs09TEIwbNSS6iI6uZi6mqmnUvHYXHKZU7Iy4JYqgefNTezX/+ApdITM+8Jvt84eo
	ZlM190lwwg8nhh6+VP2xpCki6xSiDrLHLNWOb5vcLTBPDtPW68GPks496Xij8UIcEgybHW092MT
	P50499VP+bV8IIpekM7x0v+IPxqHHk7BPe74EOcW3oz3SKyDjf4Ph0i6fPYJ4OAHSN1kSfnUZKK
	N8LnPD75d8ZeritAWA3JY84fRs6tVYQP/cOmDB3swWl6xYB+80rEM99u1dniADbXa+y8l7XCn89
	2YS3lIWtlnGc9zbU6MrPQ2uIu5Fp2/tAtFmI8778uCLBme1Itc/JO9KXWqsSt4tuN8DFUDSXL33
	/5ApMfm1783oo3WseNA3qmKTWI
X-Received: by 2002:a05:6102:6a93:b0:5ff:f446:c010 with SMTP id ada2fe7eead31-604f90587f2mr2976603137.7.1774765372862;
        Sat, 28 Mar 2026 23:22:52 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac6:d6db:aa::11:19a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512d3a037sm4475072137.9.2026.03.28.23.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 23:22:52 -0700 (PDT)
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
Subject: [PATCH 3/4] staging: vc04_services: vchiq-mmal: prevent stack overflow in port_parameter_set()
Date: Sun, 29 Mar 2026 00:21:13 -0600
Message-ID: <20260329062229.493430-4-sebasjosue84@gmail.com>
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

port_parameter_set() copies value_size bytes from the caller-supplied
value buffer into the stack-allocated struct mmal_msg's
port_parameter_set.value field, which is u32[96] (384 bytes). There is
no bounds check on value_size before the memcpy.

While current in-tree callers pass small fixed-size structures, the
function is exported via EXPORT_SYMBOL_GPL and accessible to any GPL
kernel module. A caller passing value_size > 384 would overflow the
stack-allocated mmal_msg structure, potentially leading to stack
corruption and code execution.

Add a bounds check rejecting value_size larger than the value field.

Fixes: b18ee53ad297 ("staging: bcm2835: Break MMAL support out from camera")
Signed-off-by: Sebastián Alba Vives <sebasjosue84@gmail.com>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index e18471930..11af71309 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -1361,6 +1361,14 @@ static int port_parameter_set(struct vchiq_mmal_instance *instance,
 	struct mmal_msg *rmsg;
 	struct vchiq_header *rmsg_handle;
 
+	if (value_size >
+	    sizeof(m.u.port_parameter_set.value)) {
+		pr_err("port_parameter_set: value_size %u exceeds max %zu\n",
+		       value_size,
+		       sizeof(m.u.port_parameter_set.value));
+		return -EINVAL;
+	}
+
 	m.h.type = MMAL_MSG_TYPE_PORT_PARAMETER_SET;
 
 	m.u.port_parameter_set.component_handle = port->component->handle;
-- 
2.43.0

