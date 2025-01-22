Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A417D211488
	for <linux-staging@lists.linux.dev>; Wed, 22 Jan 2025 10:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737542350; cv=none; b=iMoUjw0Cc+SO6NDWHPNWVlQzhrC0/TF/lg5VnPFK6TDvl5se6AkEZ9HEYnaDvT5Sbj5nDDUPW6bQe29yWdygsMyQdwSLC6T4SyhCj6+4AHo9yK4QIBWqC90Mm+PtyBTk+SPWJa39hIx+F35t6pVFLehK4LaR1SSbTeiRBwHRJjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737542350; c=relaxed/simple;
	bh=BLIfcndQ+asWR3QeLZ7VXUk5iqpsB9HZDfbPIaDHH00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V8QGu1op+EtFyyIODHOvpGZDGZnwTXNWJolRuL1frO76xJh9YgJHkUz5lao3/aH/g6hCHtsoUd8mEJNsvCx3TiadvUm0OPmWuZfcxpNabOXrWd+zNVt3SRWqSW3LggdH4+1SaU5RnIiGQNZYlr/HS1XdxatD0WrjuPt2//dwE3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SrIxqNWv; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SrIxqNWv"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436249df846so45992005e9.3
        for <linux-staging@lists.linux.dev>; Wed, 22 Jan 2025 02:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737542347; x=1738147147; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oGJ/K3S5rHCMeeYmkGcZhAdpRXhS20OufPOK4CZHVe8=;
        b=SrIxqNWvKSeo9Xuc2aPMdv0hSWctZcIR4J7/O4v4soHffpOfeGP5gPQQWLSHyX8urV
         oDK0PjJD1iYrfgWhlWh6oweFnctMEXcOriiNkv3pH0AJZq2nCfCxg+VYbcGfrWfbA8pz
         qs+zkaBYAaQRgayOmlqLGONnwMtpgcdJ6mMyq8D9xr3FTGaZk9HzGTfrxWirSz+i/zAC
         5WTBNmKBiQqLmy/2GlAI/806a//PJWGpyHmakWXx3NORoLRgyFxZHLpFuJxs2w+TnDdv
         qrKbIxb3LMHJt1VZk7/TyC4/PJZItzDPrElIF/U6VrBoW27sT6SAG/mbdaJKmoJKkErf
         fqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737542347; x=1738147147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oGJ/K3S5rHCMeeYmkGcZhAdpRXhS20OufPOK4CZHVe8=;
        b=HtsvTlXurGl/6U/9Vk3ZvIQYD+abiuplV/NBnDcpPjR9c5RN/folNXGXEguWQ7uqo3
         6WCs79l7KL6L7WQwe/aPATz1vxFCO51l2lrS0ywNZoFz2xgLceZqsHjLWYGt85ylGlir
         C8appfHURmJaSxok1YvbVvQOz8ieU6c0Fd2zeKAUinfwCwvKMusZKE2/zZhEVFfS7JLq
         GSdRpeI2xeNJjpNowHwaX/JmquQN+X3FWGJRGZlFfjr5L9gpGh7xjb1hEeQ9CkiMG4Be
         qXbSlAELwc0j780RO06Ap9avci7Jays8tfG+xla/DFXVBTi13JtjnJyczzp5FiDtaLkm
         SKNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWgEhnsC+uaalblSUURA2xHHdJc1GoA/2avxhneRKgVFoeGsCX1bdi8I96jAC/nrqTSjHXaMZ5vaSMhKnW@lists.linux.dev
X-Gm-Message-State: AOJu0YxiL7JRDc3sO+HtERu70CE6ZpVroktvcDOZVOS2bI4X9yhRPSU3
	072+SXiEVOvd4+/eDxUnn1mJ+qTpEPjyNkt7NC/xcCbsDIqqzFxPAMRlCm7G
X-Gm-Gg: ASbGncuUwD9O2Fv8mTI9XIeu6MHeDIQz2iKPFAcztkHvOKzMd4ZUcuMnV4kKi8qWq0i
	dz78+NPd18QylbTCtBd/wCSnH6gGpEEAXmyUpWba6WktonzvMh1kyyKvoo7fXMelUx1a166RgkV
	/Q6WJTkBL9V1cYQ4XmKOaDbxnx6xmN2WBI4GQgd0k50N/eJ29B/0pAcOMDTLTuLasifYaNfhuZ7
	lARgsMF6/Cr4s6CQB5CNX4a6JuFyKAuN9C9DNsKsiY+IJItWjakQ4AEHFPFSBj/mC15bT2tFBss
	6v9oQmNQoFh5AjdoRoLZZzwwZMyGHw==
X-Google-Smtp-Source: AGHT+IF6F2HmkG3ZBUNFW2DLyck7GyyJIM5KccouicDLOnCZl04EYNbdDoEbcszKY0txWwowWmIk2w==
X-Received: by 2002:a05:6000:e4a:b0:385:ed16:c91 with SMTP id ffacd0b85a97d-38bf566f3bemr15321496f8f.24.1737542346823;
        Wed, 22 Jan 2025 02:39:06 -0800 (PST)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf327ded8sm15661328f8f.89.2025.01.22.02.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 02:39:06 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: dan.carpenter@linaro.org,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 1/2] staging: gpib: Add missing interface entry point
Date: Wed, 22 Jan 2025 11:38:58 +0100
Message-ID: <20250122103859.25499-2-dpenkler@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250122103859.25499-1-dpenkler@gmail.com>
References: <20250122103859.25499-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Declaring the driver entry points as static caused a warning
that the serial_poll_status function of the agilent_82350b driver
was unused.

Add the entry point to the corresponding interface structure
initializations where it was missing.

Fixes: 09a4655ee1eb ("staging: gpib: Add HP/Agilent/Keysight 8235xx PCI GPIB driver")
Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/agilent_82350b/agilent_82350b.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
index 0ba592dc9849..cd7fe7d814ce 100644
--- a/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
+++ b/drivers/staging/gpib/agilent_82350b/agilent_82350b.c
@@ -842,6 +842,7 @@ static gpib_interface_t agilent_82350b_unaccel_interface = {
 	.primary_address = agilent_82350b_primary_address,
 	.secondary_address = agilent_82350b_secondary_address,
 	.serial_poll_response = agilent_82350b_serial_poll_response,
+	.serial_poll_status = agilent_82350b_serial_poll_status,
 	.t1_delay = agilent_82350b_t1_delay,
 	.return_to_local = agilent_82350b_return_to_local,
 };
@@ -869,6 +870,7 @@ static gpib_interface_t agilent_82350b_interface = {
 	.primary_address = agilent_82350b_primary_address,
 	.secondary_address = agilent_82350b_secondary_address,
 	.serial_poll_response = agilent_82350b_serial_poll_response,
+	.serial_poll_status = agilent_82350b_serial_poll_status,
 	.t1_delay = agilent_82350b_t1_delay,
 	.return_to_local = agilent_82350b_return_to_local,
 };
-- 
2.47.1

