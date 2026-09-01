Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7BF4A0142
	for <linux-staging@lists.linux.dev>; Tue,  1 Sep 2026 19:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788289502; cv=none; b=JX+ymbknUHU6PhFXInDTUYUrXmy9Du+08e58ttJvlCh5tBRQZuGjrXzlfCyrHRGb4CIQUeKqDNcugrv2X5k/1lIe1wHr6XQ13htLfovP0IGW405Ryg/PP7Z4qxrHO/2pg05aGjWGq7wqaTiIh8N16Vy913DzFA07TkTx04tGw/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788289502; c=relaxed/simple;
	bh=Bc5RyoPyL8jsNo0TXqrSYlmk5vjAHujKpDa9NlkLa3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ILjWgC7UcW6QCQdk5Mg+TpoKZlYREAS7Cx3//Ru3EVvJNs9nP3055O4wy/xRnCrs0J9xznd6JRV7mOd+FIklLVjzzZi5UWMTvpO+eo2eRxkxpREAEl/hazJRr3OPS6ztH5lasZgE+tcQChSDr54C6Ijt8w0RcF6LLhLEd3oj/5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IY6hef9T; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IY6hef9T"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so1243015e9.2
        for <linux-staging@lists.linux.dev>; Tue, 01 Sep 2026 12:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788289498; x=1788894298; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z6E5NgofUMoTlxAp6O0bNxVMULKG1XOVZoONL4mrJbw=;
        b=IY6hef9TUjoWKNzkkfx7HVtJLx0RB36DOXQK6RgG1d1jnrhNCDG/Erq9j6lP/PVZ3G
         FCRptLBJPgb9kcLE/mvV8DIbjZgGy19w8sun5j+kJnfEOm9rcUkodtVSWo6hEYza2MX/
         QUwqyp4RDblsnuqvJfH0n18k4zh9BL2efY+y5w6CxzEmz8zEO4iVbB7N6Cb/Xav70zPa
         /l+q8Kml/hp6fIwVGEE8RthMZ+QnqJDdcF2Nzdyfdn1NPenlzOEE3mWniJ1TkMhzIIrC
         o0C93pKZ+fxZQ229jQj8W4y05v9+8oGJl5smT7Vou98HmQ21TKcYmqh6jYtCUzNIda+6
         MucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788289498; x=1788894298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z6E5NgofUMoTlxAp6O0bNxVMULKG1XOVZoONL4mrJbw=;
        b=YPT6JxRREi7txPUvVcDyUNLUIrNHbzfuowyZyBA7ZIY5UkLqwI5LLiKLoKSP7uZGJe
         TWNX0EpBCFi09Bdm+XYFnyKHIUQREsm3pMg86BmxB6p2nuidscpSDOkD/eh3wy5Jd0kd
         HS5bTMCdhuWePjlNZW1JEasJ7pPwM8o+S4Zs2ifghIdTwKoz3nLZ+iW+FYCzSVbuoCq1
         78K+xCkH2RXdpyTys5BbjtMXJyKaMCE7QoVeo+HaMvPlGHZItjLtBL067eMMO7pWUqIC
         ScNrk2socIuza9SYh5FpfBl3HmjbCszMkYRiAjf/bi7GRp6jMj3kdIFufvQJI7LlAYYB
         ctqA==
X-Forwarded-Encrypted: i=1; AHgh+RqP0FOSPiuHNjvIrqyy0N8Y+6+nsGu43t8dKi5umNkNVfBRC+yhLW+lCmpc6hrYNTwC03xhkoERdtf5XwWO@lists.linux.dev
X-Gm-Message-State: AFuF++l4lx4rHnLQPd+eKLAT2t6puboeTRNvsp/jJPAdz0rq6CvccXCA
	C3BnKwQMwKJoAdkWCq3Vew/FE8lO/YfqNC8A9c2eJBTHSYCKi2zStqVO
X-Gm-Gg: AR+sD13x/3DwrN1vUcE2jrYVSiD+fKy2a2I3HeLdI4YJgg7d25kYLL53Q9KiJJbFlF/
	oSpJfFO/8jiE+jKI6OJKfjoAikzjw6772qwBgQ5Ums3zGwtJRzkE4qjNLcKLamHE4sUaGtO4qoK
	X5t2t3HjzBMYtcucIy5TkdEHCnapGug1esq0aAdfwcNYt5KW9VDpRJqRb5plSvINPDb2Ia77mti
	AbiU/0cn1BeR6414WVA8WB8I0IVtc9R5P+KuEm7XNoEU81ci8v7896JUL8UDoIZoTtapVgPDuUo
	BuLsyEi7Xz/5EkePcovolVvigBUfsm/czzp71HSJ/E98OaBs0OkT5B/QJ7nMVVlBr1lP8AlxVcd
	eAPpIA51wEVN+JXQ9rbv3KyXppuSxF1HjwWePKuCa06Hgllwky7doLb4i1/f/J4TNOjwsJwQGMK
	RzQxwEZwkg0WMT5ku+88uQLvj3QbzzPt1wpD286GKf5v0OOWO3EAPZiMETBezfjRgHr17fjv3TK
	HD+a3wf5VLWfux+n2TVUqWcHBs5aOhY/1HXyYTApVE=
X-Received: by 2002:a05:600c:3155:b0:49b:910c:7703 with SMTP id 5b1f17b1804b1-49b91c3dcb4mr544509945e9.9.1788289498025;
        Tue, 01 Sep 2026 12:04:58 -0700 (PDT)
Received: from 1Z10 ([78.213.73.56])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce10148sm85481985e9.5.2026.09.01.12.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:04:57 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: mchehab@kernel.org,
	linux-media@vger.kernel.org
Cc: sakari.ailus@linux.intel.com,
	bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com,
	nicholas@rothemail.net,
	andy@kernel.org,
	andriy.shevchenko@intel.com,
	hansg@kernel.org,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 09/16] media: intel: ipu-bridge: allow sensor-specific link frequencies
Date: Tue,  1 Sep 2026 21:04:31 +0200
Message-ID: <932eafc6726b4e5d062a0166dc4b5e1594025fd1.1788286339.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788286339.git.mauriziocasciano7@gmail.com>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com>
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

