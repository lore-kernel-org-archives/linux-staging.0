Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B677A3A782D
	for <linux-staging@lists.linux.dev>; Thu, 24 Sep 2026 17:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790270368; cv=none; b=HiOcawDanhDHGImcMYVp4hpYPDtrJ4f2FzNAnog4Ykz8YC1Tei74OLxFbedh/5uO8cCgDXzvydM0zvDQ7jY474y7lL1qluc5Ula2kibL+Hj5/J5TH+/eApc4pLUIValbFlAX2r9PCDbZluUqe/ajefkVQ3fEppsIrqrQkcKcDuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790270368; c=relaxed/simple;
	bh=EyBcA/Tev/w21v3ps54k1u/khzZboHd8p90RlqkDXVQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Nwg09MXy+RbVylI7p3m/2hVj+0EQhvqulY/2BDV3S4QdspLuhZ8l1xK2Zqdtc0g9yNAH4hcvoB3cXIQ/7AdPNRPoUAlE4XSKcTaCRFTc5EgNxuCKiKkuZV6UpBNd9jtLtSuY9EmWk64pvXZAE8zug1ElJmRz26/aKyDZC0DIGxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bCewveJ6; arc=none smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCewveJ6"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a60e33d456so20328411fa.1
        for <linux-staging@lists.linux.dev>; Thu, 24 Sep 2026 10:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790270364; x=1790875164; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c3E0X8b6Xsqtylg83ebF8p2MOGz7r4MjOPY7FVP1I+Q=;
        b=bCewveJ6boySEqiJHRHzkG11FD5lhJs++G5kDctRmnAUUymR2BBObRS3ERd2c8JKC2
         HPQBgbQyLGx/QwVGxiDXOqxVXHR6zVtO7+An9PIhjXRPiLGxfGZa1OnTlsBUBZez1neB
         Jja9woC46IZnH4H6AxQv+ykfuj0p3CNwbFdNIPwRVUsK+qc96jqpA9Z5yoHLJu98BedK
         CMDvGYk2hnkC57dCF+4KKPkzkDWIXYV64i1ItoR6Xv1iN4ZYLlxU9vdAi8yBRWMUOZvS
         s9F+BOOsOuOuVCwlfijqTFOgvQW/fkitJqdpqtp4Q1Oum3FC3ZaddwKjbO4fXdo0/mFV
         p28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790270364; x=1790875164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c3E0X8b6Xsqtylg83ebF8p2MOGz7r4MjOPY7FVP1I+Q=;
        b=lETlXOwzJXPx35+69dj85XgVREaAiSx5KhGXH+zDGOMcvGwAaDwmkP8swcQv07HYG0
         xyM742xvGNag0Ro9DBD2LphpCHZ4eqI3XfWXxElrjOfuFNmObMNWBg7FLrgdY6XqHJmy
         zPdlTmBfNQKOBSrahqdMHVjpTSZORao343FEjcQlQf0LpIPysnxTYh5wUR6PrKq+YFvz
         zk12iJbhDNaaZ2quQESTLehOUS0yA/tgkhcmNu3NWxHAzkUavBXpi8VqQmIjdfe/BBDY
         bkidzdLSiwgmIiznAaHhnenyBSfel6+7EgqAgfm4RLbB1QziRPnW3gsI+zgb5JBYH576
         E26Q==
X-Forwarded-Encrypted: i=1; AKwUvBxoae0B7lhOsDFZ+IlE6lswfHPuWVZXtlVBb7r9jwS+iqGmbIx3XOXqD4JB662UxbkUaOhmqD0yibtrnxQr@lists.linux.dev
X-Gm-Message-State: AFuF++mipS2rJClKJHdZf/dABal/S9YCViU5iAw8yJbqCvJ8tVDCEuOO
	UKk4Gn2rmEPqqyER9ixvoKDTJbBRmR57vrONgRAk59qkT679a8IxQJxH
X-Gm-Gg: AYBFou1B7dPyBfFVWG+XdcSRDC+owmRrEILwDq19HGGkmKV6pRJXqcD8QPfZdyJqZi7
	M2uIqugczKCdUscWpOKMLz4TVjjEO2PqGWA/lNv9BHLV+TSy5gFlm93zM5/vmJQnjYBSZXv3IjH
	SqFzu2IltpBjnH0Ext4dozohQL3cek+2OX0ZbEcGemVvXd1McfMdUzA1WJ0VCsz6oRSPC+gGgnp
	fnQcUx+KGj1xTG06Vt4rjx7IYmH8NeqfpVu2KZRYArFtxEYy75S2cz+2GexZmNFufBdFe4yp3YO
	+5mXyPv4rceXP8QTtxMt6Aa/qKrW8EpUZPYAmKQVHqXlqX8iox/bQiODshWduVgKRSxLzpMWxhK
	zdcgXe2MiSdRPJcIZBhDsSG64iv1VWNrBY7lDQI7er4m2E6RVHdzUxGZ1+rriAwVLSW8vwm9mnd
	vy4N1nUJXGvOZxsjjfdHJxdS99i4NG92rD1asJGkKoa7QCaJg2gIBUhUR5P+VMkuVI/rJ89pUBi
	/Ks+CdBFWjN7Bo=
X-Received: by 2002:a2e:bc16:0:b0:3a4:9b64:9811 with SMTP id 38308e7fff4ca-3a63c0de06amr8123461fa.15.1790270363193;
        Thu, 24 Sep 2026 10:19:23 -0700 (PDT)
Received: from quietus.tail91f8a6.ts.net ([104.194.144.188])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a63bf2c4aesm9450601fa.8.2026.09.24.10.19.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 10:19:22 -0700 (PDT)
From: Ruslan Koreev <koreev.r@gmail.com>
To: sakari.ailus@linux.intel.com,
	benjamin.mugnier@foss.st.com,
	sylvain.petinot@foss.st.com,
	dan.scally@ideasonboard.com
Cc: mchehab@kernel.org,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Peter Marshall <pm@petermarshall.ca>,
	Ruslan Koreev <koreev.r@gmail.com>
Subject: [PATCH 2/4] media: ipu-bridge: Add the ST VD55G1 (TBE20A1)
Date: Thu, 24 Sep 2026 20:18:18 +0300
Message-ID: <20260924171820.1179823-3-koreev.r@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260924171820.1179823-1-koreev.r@gmail.com>
References: <20260924171820.1179823-1-koreev.r@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the ACPI HID Lenovo uses for the ST VD55G1 IR camera of the ThinkPad
X1 Carbon Gen 14. The firmware describes one CSI-2 data lane and, as
usual, no link frequency, so the value has to come from this table; the
vd55g1 driver requires exactly one.

Use 402 MHz (804 Mbps). The sensor derives its MIPI rate and clock tree
from this value and the IPU7 CSI-2 receiver reads the same value back
through V4L2_CID_LINK_FREQ, so both ends agree by construction. At
804 Mbps a full-width 10-bit line takes about 11 us on the link, which
allows well over 100 fps at full resolution; lower rates lengthen every
line proportionally. The rate is in the lower half of the 250 to
1200 Mbps range the sensor supports and is the one validated on the
hardware, where 804x704 streams at 58 fps.

Signed-off-by: Ruslan Koreev <koreev.r@gmail.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index bd64c0400..5941428ed 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -101,6 +101,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("SONY471A", 1, 200000000),
 	/* Sony IMX471 (found on Lenovo X1 Carbon G14) */
 	IPU_SENSOR_CONFIG("TBE20A0", 1, 200000000),
+	/* STMicroelectronics VD55G1 (found on Lenovo X1 Carbon G14) */
+	IPU_SENSOR_CONFIG("TBE20A1", 1, 402000000),
 	/* Toshiba T4KA3 */
 	IPU_SENSOR_CONFIG("XMCC0003", 1, 321468000),
 };
-- 
2.55.0

