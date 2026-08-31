Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9801638D407
	for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 18:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788202258; cv=none; b=f1vqvH5z2gqBrbkxUIOHAE2PdNNlLbj2FuAPdlEvFvHbvDHHqbNzjYEujS4VUGmXxjZbjwFRXEKUySgZUc+Y/ns1Fb+bFRJkCNTIf6eO2c0OjyA8qgWO1nWo6DImTS7zFwNeSTEq+6tqPzEnfbUAMWEUQ7ryIA+iKkUbLNJy8Tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788202258; c=relaxed/simple;
	bh=6hryHCIPCjgEQiYN3dv2fRXZ1WHHrAlyZRiHDL/ExVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OVQyNsCArkbC+bdAnSI63Ez54M0Lp3UQmwFxILmqYZ/G0GIP2Kh7d9TUTyKH9jYyhKPu/wYff5n9yAK/iJRXcdhJhe7KhnDV3mW8Vn8v3lVz1lDUqY/Q0DkaifuP19PVsLJCzvgf+q9H0VKMKmVHMHft558+a8tyovrhPvf506c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kG0wrsBP; arc=none smtp.client-ip=74.125.227.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kG0wrsBP"
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-38fd9408220so994332a91.1
        for <linux-staging@lists.linux.dev>; Mon, 31 Aug 2026 11:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788202256; x=1788807056; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SU8TMnAJdFKhQ7rwVc1XtCTGG3xuVljaOpUMOXRsDlQ=;
        b=kG0wrsBPoMHFYru4Y+//KJR2wU8ueU3s/GWs3CL9Sc7qg8/727ybHh3XHzgVM2IhQT
         brznYNll6J4sxSs+zopPzhGOkN4rFACWfk/MWtX1fwQZxFHaI/aF8tc9/34tnNkc9Ef2
         Hny1C+Q+PtF/Sj1J9Ib1oqvlsCMx28WhfBmrW+4vdpPwpGByq6OydPPouMtF2X4F36BU
         BaxK5F6/LmkcWbmHAweTxNcgBw5drC4Uvu2rhZYkZDsPV6dvmTIkswQBl5UZ8U6QgQDo
         2ZBqscvptZ5AQ/Zw9mDrXc0X/XXr01E7yGftUGatdfNRo+3injNAjQYNyl2CqLeIMjfq
         Dm3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788202256; x=1788807056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SU8TMnAJdFKhQ7rwVc1XtCTGG3xuVljaOpUMOXRsDlQ=;
        b=Zn+Xsr8Ih7Z5++dZEd25JDRaMC8AHCsWwHmJNvSbUGkijsXfjw1q3WRv536QKRWwht
         SOanRNIdqPFySMo++oMVPsekwj75DwSUTcFAMPLTgSj0wezdy5nACy21mBX2idRMydSo
         7onkfRqPJ7OxfidL7WgIIR4mR14k8bWpYAzZf6E213awzlWhzY5HMUvdnrbdqVmyEqzZ
         kuQ8bUdfGECf2oU6ij9AWlteE+UJ4lz5PvYT5TcP0695Lr8AOaV0FAmuH9KJ8V/BQKiO
         KoxtaRYGchkSRvbC7vnMc6OqOpSvjKiNcc2LaXdsPAlxCK/hqFvu/6iyOyJwtrk36IDm
         Tokg==
X-Forwarded-Encrypted: i=1; AKwUvByTYHxgdCJzuxYYAX8Qm3m7DfrtRNaoWWkROwkwa6TFThz6DqeuS5noWqGWhA+lCO01Sa3vgLtkkyABrMEQ@lists.linux.dev
X-Gm-Message-State: AFuF++naKAu6CoKuAkmhOJI2x0FBAUHlwOSP97Ya8HeAv1X8NV0B0lPA
	MvcMt/cpINQ10KlEWs5y57M8r9dc3toekWmNFd2XvLW/pq5nVrU3sZOa
X-Gm-Gg: AYBFou2lUe90jendPwbL1WPYyBkG0zUQo7SBwa3iHb9un/Rf1fTyPzScbgdqe1JisNX
	s7dDwNvYLmgiWmygz/XcAINWy8gAXkmJNz8W2gDso+T3OWH6hFyqWMMPqJF9rPIzPlpAcPoTbuM
	prwTdlZViWWsi7FF60my9CnlE3DBH82NirKbh/BBlwPR4J8CiPWnjNTm/MoHdZ7n2cO52boknPM
	84Usvk3tG2hkHGFxDb+l+H6bLGFAywC9TNXLUmb6Mi9BULgx2N0jtW5VAtkfz+O6m1WRtxP0inJ
	S+nsn12xojb48hrReyAGHSyo5B74b+SUck2u0O7WbSSr7Aa3cmuFCdsNxFxln97QLpfKZ0ba+5Y
	YzXU2+YlasApApME4mV5j3noYtLieyUORAtpHmgAkOBmjm9JrjgbAJhw1BLQaq7ZdO6sVaRgI2b
	icZX9mqY1ZVEtzid8ReNdaOGQ/TuC/mQIXkGkWuhUtUGCjfrm5SbCHO68XXgJW1TvK1yH3BIW9F
	bH5XaRn
X-Received: by 2002:a17:90b:2884:b0:398:c3c9:d0ae with SMTP id 98e67ed59e1d1-398c3c9d103mr19100460a91.0.1788202255729;
        Mon, 31 Aug 2026 11:50:55 -0700 (PDT)
Received: from DESKTOP-M0MLFVC.localdomain ([165.99.41.159])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0dc854dsm29459223c88.10.2026.08.31.11.50.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 11:50:55 -0700 (PDT)
From: Shehryar Ahmad <shehryar.amd@gmail.com>
To: jic23@kernel.org
Cc: nuno.sa@analog.com,
	Michael.Hennerich@analog.com,
	dlechner@baylibre.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	devicetree@vger.kernel.org,
	marcelo.schmitt1@gmail.com,
	danascape@gmail.com,
	Shehryar Ahmad <shehryar.amd@gmail.com>
Subject: [PATCH 3/3] dt-bindings: iio: accel: adi,adis16201: add adis16203 compatible
Date: Mon, 31 Aug 2026 23:42:01 +0500
Message-ID: <20260831184201.34416-4-shehryar.amd@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831184201.34416-1-shehryar.amd@gmail.com>
References: <20260831184201.34416-1-shehryar.amd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ADIS16203 has the same external interface as the already documented
ADIS16201/ADIS16209, for the properties covered by this binding
(compatible/reg, the DIO-based interrupt pin, and VDD supply), verified
by datasheets Table 5, Pin Function Descriptions, in the respective
Analog Devices datasheets. Some Auxiliary pins differ (e.g. adis16209
marks a few pins DNC where adis16201/adis16203 use them as AUX COM), but
these are not represented in this binding.  Add adis16203 to the
existing enum rather than creating a separate file.

Signed-off-by: Shehryar Ahmad <shehryar.amd@gmail.com>
---
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Previously reviewed at:
https://lore.kernel.org/all/20260812043506.456ced6d@jic23-huawei/

 .../devicetree/bindings/iio/accel/adi,adis16201.yaml        | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/iio/accel/adi,adis16201.yaml b/Documentation/devicetree/bindings/iio/accel/adi,adis16201.yaml
index b6ba7ad1a..3ce5fb1be 100644
--- a/Documentation/devicetree/bindings/iio/accel/adi,adis16201.yaml
+++ b/Documentation/devicetree/bindings/iio/accel/adi,adis16201.yaml
@@ -4,21 +4,23 @@
 $id: http://devicetree.org/schemas/iio/accel/adi,adis16201.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: ADIS16201 Dual Axis Inclinometer and similar
+title: ADIS16201 Inclinometer and similar
 
 maintainers:
   - Jonathan Cameron <Jonathan.Cameron@huawei.com>
 
 description: |
-  Two similar parts from external interface point of view.
+  Three similar parts from external interface point of view.
   SPI interface.
     https://www.analog.com/en/products/adis16201.html
+    https://www.analog.com/en/products/adis16203.html
     https://www.analog.com/en/products/adis16209.html
 
 properties:
   compatible:
     enum:
       - adi,adis16201
+      - adi,adis16203
       - adi,adis16209
 
   reg:
-- 
2.43.0

