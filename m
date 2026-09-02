Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3AD4A49BE
	for <linux-staging@lists.linux.dev>; Wed,  2 Sep 2026 14:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360840; cv=none; b=etA4ewT9dGu9ukCEMhTE+bsWUCALp6YCEd6cAmd1j9cWHiFu4sOQUIpZoGfQe1FZ9rr72qCpvisJj8zWcuqJcLWi06gDZDcvRS2ECe9YioaxXkDEyiJiFBvwHH+Gg/B9YYX4ZxOOhbJ6GvoLF8eL8TInblJ0z1LYdNJOq//S1K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360840; c=relaxed/simple;
	bh=GY/0GwAYKkdGCB2mGjNb9iNJ3uZoj4B7s9rKLLBlD0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U+GWvAoI1on2GMa3lTFexAoXqFr7VesUIl6rnqnJVZPyyJM2p4Nt+sVgdMcFkHZRVhinExQB0vq0V2zg986GKGHOGdnPbCt4YbhfTpS0jjXhUsbfTa4zhFWhUy1y8NZFbpqOvB4xmHRzLtWbFCiP9qZiV8p351K2Iz0Fk2xWntg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EYpvyqpv; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EYpvyqpv"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-484415c8bf2so922731f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 02 Sep 2026 07:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360836; x=1788965636; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DOqePx/fvAb2uUxt/VBHwZXtTfO5bd6bJUnU0qX6xfA=;
        b=EYpvyqpv5CYO2QJUDJrqeVcvhBf+PLxrNiGsC7p6kVXfxjVpi+jjJ3N0ygMZPhfrE9
         +VR+BCnmJK4YtGhICgZgRM3tbONAhVbwHxY85yu71DMVvxCuXB+RvVORJxO1TRaJfKox
         fVjxTGqfFg7rTm+CxKlj2j5qhMD8nj8SLconLV/Da9GVIBGh9vQzO4LztKp7RZxLRLZz
         GWbzI0dFd/z3/fz8JXOjDPlRJVSjrMofdURvc26oCEE/F0C/pjB4C84YnFhmbmP5kzNW
         wYQrKq7xh9W2HbzQeyEFLxzma3jqJ7k5gYdShNinmuJPve4qp+CkKFmP9c/gcN2NCIoy
         E1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360836; x=1788965636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DOqePx/fvAb2uUxt/VBHwZXtTfO5bd6bJUnU0qX6xfA=;
        b=gWqYGj4ku7AqWvpSsyHbZf+gxsnJIHDOBVjv4HE8FgcV1Z/7+gnXyPhcF1dfvvasf/
         VVz0EaQpCcZn4Irxtj2msUka72itMSZUFZUko0sFVrRYSW4Ws6kg3tprjUDHllC/78cb
         ZrJbgzZNF8bznTTW/l+qW4BMk6po866EYOvFL5jAdYDI1xybgKCpMpvPddsv0x+Zyi9E
         wSWA0pAJ8gGWcrsHINW75Kalma6CQaNKZyjwnJqPHIDxP8+Pr4HtfNf10zyg7mn35ThO
         6RyjBup1odKGR47+j/Xo1sLUfH1qUfnbfJj/lV88whn1F/6iTMCKqt5Gk+/VcuiO8qYW
         WZPg==
X-Forwarded-Encrypted: i=1; AKwUvBzoJdl01G4YqKRQJ+k8D+muircooFZDGhm2jUHvFQF5iEv8AQDqI9NxAD0ALk+Xsp0wbQktdTErhmqT+pf1@lists.linux.dev
X-Gm-Message-State: AFuF++nmPQDTUCZxKkASHEiTjpc4VuQQm4y5RSdhxV/0k6CQXDIA8TI5
	kKedXmwZn6QI89LP9UoLz9HAbVa21RcUl8UBElYWbJX0UrYCjCMeAiuq
X-Gm-Gg: AYBFou0qLX+qM4DqDGPqw+O62X7p0bHoMONdR/JS+Hr1bukAg1OD6Vtr/7ud+waoGQF
	n6Ds0c4Onc58YulqniqzL5R/E3iefP2LKvRm0cviiBu1ezs8E1jPcUWtqoKSVsO4VJq6MwNuVX8
	ht5S2u7Pe3NhJjy9bSXzeVEgyKpSJGWUYPXF9/GqfSr2hdlnuHc5RecRPP6rMcrZCYusbbG4ZOn
	EArUpu6YL+rpk+KiCoVSkiUX/9zZYvMf/mX10inHB9dEOoA9OYZ9olh/iBni9MY/cRuh5uuJwVf
	2rl1imLdMaOJInzXlnEfImKtfuuMiB9NTps8m2M2imZTEUI6N/QuQpXS8p1N40XJfv5GHt+mvUE
	MZXr+c1gp0hUv3TVRbILRhkirDhtMVgM/ScwMSl9M01L65QHPwG9J25Im/Y+q2K7s8lwYFlYc5X
	6ikDNWXlgwVswcig5Hc7ypKbCcA6I1UfW2gGtyrV462QbQ17YiNrRHvC15Uq2B9wpGMP8InL+k3
	7mdkRckKW7g5MFyMJJu1dWfKSgbesP0GEeDmhOTFKns
X-Received: by 2002:a05:6000:40cc:b0:484:4880:449d with SMTP id ffacd0b85a97d-48488dee57bmr8598775f8f.3.1788360836348;
        Wed, 02 Sep 2026 07:53:56 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:53:55 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 04/16] media: ov2740: Add OVTI2740 ACPI ID
Date: Wed,  2 Sep 2026 16:53:33 +0200
Message-ID: <38149ff00ebb24aca8089ca2e3aed3fb8bf8a06e.1788360629.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788360629.git.mauriziocasciano7@gmail.com>
References: <cover.1788360629.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Firmware may enumerate OV2740 image sensors using the OVTI2740 ACPI ID.
Add it to the existing ACPI match table.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 drivers/media/i2c/ov2740.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
index 8f0ad5dbb245..18bb3ac9701f 100644
--- a/drivers/media/i2c/ov2740.c
+++ b/drivers/media/i2c/ov2740.c
@@ -1462,6 +1462,7 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ov2740_pm_ops, ov2740_suspend, ov2740_resume,
 
 static const struct acpi_device_id ov2740_acpi_ids[] = {
 	{ .id = "INT3474" },
+	{ .id = "OVTI2740" },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, ov2740_acpi_ids);
-- 
2.53.0

