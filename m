Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90ABC4A5C42
	for <linux-staging@lists.linux.dev>; Wed,  2 Sep 2026 14:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360851; cv=none; b=rsjgk/2FpwrPs8/erPi/gIWq8A/fpNTYRqp+CLS9tKFkLaPx4gD6x3G0XuOblBnN0tFqarXZ9kOPszX2ThJyyhIdQvVSOl+HkKtUKwUo2ZtqBkqxYDQI/PVuI5t3oUre4y7v7Mtrs0MsCOHly3llsC03M3kgHxDtI3CVyFtKcYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360851; c=relaxed/simple;
	bh=Bc5RyoPyL8jsNo0TXqrSYlmk5vjAHujKpDa9NlkLa3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZkjvNCz9EUpXFmJ6dkcgfVVvDgXnmdMeRV3aoGKod0vnPOgLXPxvzIXiDBiXjDoSg5x4V7deTT1yFwPs/siQ8mCdhPmty0Yn7HVs23ndxsBTx8BEZe8rC6zp5TaNR/MWadB37xLwumbyKHnpm1b+uLhMtulggF2qTyUyWK+Djdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lrsO9hGh; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lrsO9hGh"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48444eff835so307368f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 02 Sep 2026 07:54:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788360846; x=1788965646; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z6E5NgofUMoTlxAp6O0bNxVMULKG1XOVZoONL4mrJbw=;
        b=lrsO9hGh5VudLC1biW/GlbO6/4iY+Be9bky3XsUOS2T6av20tw88omeWwSV2rmDV0Q
         opHHlRYtdDL3qbhVK8nfgleaBxlANbdO4fbStfSoN/fHStU7O4aVwxtr9WNVdtnS7AVc
         oLEFnnnsrX8BwxrnZpU280ALZ2DvWXl2x3vJzcd7iqUztkVVPVewgLtYm+4y5VnwFJ9n
         Z8SM/GBz/q4IlS53VQZQmHgvUoYDzhU2G5+aBIIuWxDsOhVYBOjT4cEmy+Cn2WRNLDKK
         DHU7bYs2t91IUDxCfSfQjRYw+vd6hQAR1CthUhcft9942AeRLV7fnp5WRtaXkPK5Hrfx
         iYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788360846; x=1788965646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z6E5NgofUMoTlxAp6O0bNxVMULKG1XOVZoONL4mrJbw=;
        b=Szt2hvw758I/SEfxCEbO1AB3e+byNswkQLofHHo7yLIOM4S80LY/d+GQQksnBV+sXL
         jeM5D28/NlBWLAyKN7Aw0lXjISA2O1QrbiV7P3S99M97eo+MV6BUrLuRmJscI3Zyu61v
         4J4psuw/Ao1Mi3GsPKFP6ZxSlIxZqYhFR4gaqFGh9NL+bEndwAbdnuTM0tAR6QrEM+dd
         qNp3Jc9FsQoD0PDIODh00bCFvwX/7gcMfOsJPlLlIoCPPG4pT2qA1tqzbiFihczdDHMr
         +M5HTBN8kWDet6uLwMbSgeCz4Ihzrc0Cu1C99MwOeUrZCY2i08HRIREC8Tfzo7XCCY4S
         wkJQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9J/cL5vNGD9nAvs11YOtFH1OAU3nk3d9NrcsO1y4UucpxwgnGz13yp4Zu2jRX1DH9FjanwZQ2vPyQzJ4T@lists.linux.dev
X-Gm-Message-State: AFuF++mRXyqIu5BxRYtkVjJTRDl2H/t91hneOnWRkfpy38Lcm4+85Agd
	XkL33H+aUHrd76FClpL/ktXhRBAZm1w1hTcPqs2ygS/63DCWooJjAska
X-Gm-Gg: AYBFou33PNrEgLrVsrswxtymi36jEgU5m6oTKw9iKc1J4PthDW/4K+LTB8STQspbi4U
	rGYb0Ngq7pvQPBP1t0KdFgAlMBIlySYhy2K3RHPyS/xK+NzxPAd+Fb15z3RlwNNl1WCja0Smomb
	eYPg2LBcG87JHo0fRPhtGz7/d/pvE+7OKQ0In9pVWsPXhACCbmG8SF2IKVazxexUoHe08FDNKY9
	qgmEXoIm15WvgHOUSxEF60FNCQrNhVmaqDuQBQYdDWuvdottXxGCRG0ermvY3kQTCz7zuSfp9OT
	vHoJPYyMrp1ilcINZ4lAHiQhx0vOEO8tbhGOI66ESTtdY3Gf5odPtXl3YGy2ZsGCgEbjNqxUlKM
	bx5uhlvxkX4YBPGwK8CTomXG9hpZCv9T91jVG8OVawju4ilRh46/X3wNnXCcnB2vk0p9Sh9N4zg
	2ntamRDzgon98uyMwxYPbjUAr42AxZYRjPrUXBR8p0blONy07DCD/rL+FNKD2HPdwf0y+6KkGQg
	dA2EqWhiHKhI81ZrwW4mH/Bhyf2Mpuz8i+c6kiTHSQQPjMNwxXQRLs=
X-Received: by 2002:a5d:591b:0:b0:47f:8d71:210a with SMTP id ffacd0b85a97d-484913b978amr7666724f8f.15.1788360845742;
        Wed, 02 Sep 2026 07:54:05 -0700 (PDT)
Received: from 1Z10 ([37.163.216.116])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e81718sm6942012f8f.16.2026.09.02.07.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 07:54:05 -0700 (PDT)
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
Subject: [PATCH v7 09/16] media: intel: ipu-bridge: allow sensor-specific link frequencies
Date: Wed,  2 Sep 2026 16:53:38 +0200
Message-ID: <dd8bcb40575bfcb11e92d976bec7f2b26cb95ca5.1788360629.git.mauriziocasciano7@gmail.com>
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

A bridge-specific firmware parser may have more accurate link-frequency
information than the generic ACPI hardware-ID table. Let it store link
frequencies in the per-sensor bridge data and prefer those values when
constructing the endpoint software node.

Existing bridges continue to use the hardware-ID table when no
sensor-specific frequencies are supplied.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: LLM sparse
---
 drivers/media/pci/intel/ipu-bridge.c | 15 ++++++++++-----
 include/media/ipu-bridge.h           |  3 +++
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 47317c423fad..5730a95767a2 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -520,11 +520,16 @@ static void ipu_bridge_create_fwnode_properties(
 					sensor->prop_names.remote_endpoint,
 					sensor->local_ref);
 
-	if (cfg->nr_link_freqs > 0)
-		sensor->ep_properties[3] = PROPERTY_ENTRY_U64_ARRAY_LEN(
-			sensor->prop_names.link_frequencies,
-			cfg->link_freqs,
-			cfg->nr_link_freqs);
+	if (sensor->nr_link_freqs > 0)
+		sensor->ep_properties[3] =
+			PROPERTY_ENTRY_U64_ARRAY_LEN(names->link_frequencies,
+						     sensor->link_freqs,
+						     sensor->nr_link_freqs);
+	else if (cfg->nr_link_freqs > 0)
+		sensor->ep_properties[3] =
+			PROPERTY_ENTRY_U64_ARRAY_LEN(names->link_frequencies,
+						     cfg->link_freqs,
+						     cfg->nr_link_freqs);
 
 	sensor->ipu_properties[0] = PROPERTY_ENTRY_U32_ARRAY_LEN(
 					sensor->prop_names.data_lanes,
diff --git a/include/media/ipu-bridge.h b/include/media/ipu-bridge.h
index 16fac765456e..81645a5f8709 100644
--- a/include/media/ipu-bridge.h
+++ b/include/media/ipu-bridge.h
@@ -133,6 +133,9 @@ struct ipu_sensor {
 	struct software_node swnodes[SWNODE_COUNT];
 	struct ipu_node_names node_names;
 
+	u64 link_freqs[MAX_NUM_LINK_FREQS];
+	u8 nr_link_freqs;
+
 	u8 link;
 	u8 lanes;
 	u32 mclkspeed;
-- 
2.53.0

