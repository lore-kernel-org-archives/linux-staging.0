Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159613A83AC
	for <linux-staging@lists.linux.dev>; Fri, 28 Aug 2026 16:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787933720; cv=none; b=fOczF/RdnJn6yoYGzWSdmi0Z12E2E6HrGZuDenGumQxPiCNeptIRntCdHziTdagvgdEtJ7XZG6YPzjt3gf8+oFpeBb+U1YHCC3knppja7ajjOFsD0bhof3FfeQgnJ4404oNclNoTuDhmoT/WYgMZhdiq3Uuk87uTJY4Nzen3toI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787933720; c=relaxed/simple;
	bh=Wq5pAafYhnlX+730hO8eGZFTr6gc1skehnTfelhN2Oo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bhsvm3t/8h8/UR5F5jvgw7Bs7W+XYFXDVVDBp+WVUzdtv6JHudYhM7UxN6VMc0pMljb+s+PZ11e5V3MSu3nU+NPPH1tp7K8KEQhbi0WflF/2FDQXBsiMTCEINC0AOXryPqJEZ5yuxGn6Yb+LRjGh6g1y/xd9c+BNLZPwNL9m7k8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S2MDiEpc; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S2MDiEpc"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47fecbb7000so421483f8f.2
        for <linux-staging@lists.linux.dev>; Fri, 28 Aug 2026 09:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787933717; x=1788538517; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cnTmJHQexdV5oBlAiHI8qAl8iNKOtPsWh1YaKqj289g=;
        b=S2MDiEpcIoARb+f0astab6AwuvjJTHZZw9o9pRMhqrlyUmGgVHlRiYYNrQr+E/mcET
         PbDhJD4Lj/N4XMM+GFv31TE3ZRQtOh2J0oJFy9ZzwNhEnnY5i0/VenkPeadajluw+kXp
         GRZLEum4d9ECA01bzIlAx1U94kiM+1Cu+gJTvF1S1LidbET0YgEYXoBqnBXU1oyNqjCs
         yiZK/y7DEGazTarujYMw8afyfnGjAUeXXreOj46VVrDb0ZBZhVJoCXyAwMyXNzPTVoOj
         6a7SIqVgO49oAS40gLW1wSBz5x5lyw6BL/u7uD4kGb0oO6kcdwQi+YQ3E5yobDD1/rdK
         Uauw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787933717; x=1788538517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cnTmJHQexdV5oBlAiHI8qAl8iNKOtPsWh1YaKqj289g=;
        b=f3BCM4auCDq0W96f4n88u2OTC08tRafVOgIvuw5Cu5Y0nB4/PduH8QcHoTn+rxGos4
         s2cVOuTZyay5qkO7uAwjNIPLZZUg6BasHrYPvUKU49ZjGkQ+a4ExLDjUiyJelaUEsAQP
         UX19/vSp8ezdYnnfmhNabv1u/905aucHnwTxQpmWU1ys+sLMurEWKQsy1/5QORmR0i75
         mojakRYb7RoiOvVrgtedtvEId69i7Hp+NkgrQ9CvQ18ZNoeabzgyCS7XMia0KOVNguZR
         Sz5qPgpCOS6CFCwtJDP3rnw32cU8HkzLxg9HyQlg/sai4HmE+hdfdyM/PxSzBksIysJn
         vrdQ==
X-Forwarded-Encrypted: i=1; AHgh+RrUXBkX3JUb7KhdQ2Dst440rMGkyL60+cTjkYf8mETjvLgV99ciUcqGpA5C7f+cISL3RPDdi4nmSkSKRPU3@lists.linux.dev
X-Gm-Message-State: AFuF++lZQb6ViqQP5EN3ElZlHWXilqRLh/Cugsl6cM8Bew3PWBigugOI
	g5fubHRbtfGZlqWddkoLdPPLjF1wd1QUIGvcMvfKZCQi51KoKXInZASy
X-Gm-Gg: AR+sD13eewQt+asJtHNZs0nO0ZN0XjIb4RI+vJp2yExWCdNGorGMbStbtZze4sVENtJ
	kR/ZJAeqiuW07RNKX4N1yl/2RSk1QX49lzexAkaVHH7138sE1OjcRkvHCCLEmHisIjSJzbj890N
	Uji9RDQ3QgjVP/vhxGrJqUYVOVpPRngNCL6+97JfUK+vHFWlNaAXVlN2LuSXJqUv85ieIOvKvBP
	yw6KWQRrXyAMLnaOb2tbpBjMKwQBEqhdr8SrLKbix8Y+N/1k4v09yT8GVUIU61+ORg7BMa2CAi1
	U3ku4s+MiihIb05C8t5qrErEN9LE/QoPX4Wi1QVvwkpCE9u5xkDF5w1KRHVgfB21ZzkRa2r49cq
	gOlcyC7lTCOToldpdQkEFUPmZRPTe0YERuPBW7lj8UO9cAOM7RHJfcK+bXWOUqe5UQSudSetnqT
	eZB0I+qFNL1Tuosiw4tn+U1IwxzsnRGHgYiwfJpjwg5us46DAJ79qGVYJLcCT4RPjdP36eBtBt1
	hzyNGZmc7IQkwkMPzcK3RNT/UKD+40NUdMP98sZGQ==
X-Received: by 2002:a05:6000:653:b0:482:fa3b:fab2 with SMTP id ffacd0b85a97d-482fa3bfcd5mr10965461f8f.19.1787933717144;
        Fri, 28 Aug 2026 09:15:17 -0700 (PDT)
Received: from 1Z10 ([78.213.5.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbab3f45sm7629739f8f.7.2026.08.28.09.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 09:15:16 -0700 (PDT)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jose Maria Martin <jmmartinf@hotmail.com>,
	Uwe Kleine-Koenig <ukleinek@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maurizio Casciano <mauriziocasciano7@gmail.com>
Subject: [PATCH v4 07/15] media: atomisp: Add Yoga Book camera configuration
Date: Fri, 28 Aug 2026 18:14:49 +0200
Message-ID: <445158bc6dd99ea11806d68b6d1873a2d0bfdd92.1787933456.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1787933456.git.mauriziocasciano7@gmail.com>
References: <cover.1787933456.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Yoga Book YB1-X91 firmware lacks usable AtomISP configuration for
both cameras. Rear INT3477 OV8858 uses four CSI-2 lanes and a WV517S
actuator, while the front OVTI2740 firmware reports the wrong lane
count.

Add the rear sensor configuration and a DMI-scoped two-lane override
for OVTI2740:00. Add the front sensor configuration separately once
its link frequency can be supplied at the same time.

Link: https://lore.kernel.org/linux-media/apFzAc5XfV9gQpXS@kekkonen.localdomain/
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Assisted-by: Codex:gpt-5.6-sol sparse
---
 .../media/atomisp/pci/atomisp_csi2_bridge.c   | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index cca91c6d71a5..56da454f0d9e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -74,6 +74,12 @@ static struct gmin_cfg_var lenovo_ideapad_miix_310_vars[] = {
 	{}
 };
 
+static struct gmin_cfg_var lenovo_yogabook_x91_vars[] = {
+	/* The vendor driver and sensor modes use two CSI data lanes. */
+	{ "OVTI2740:00", "CsiLanes", "2" },
+	{}
+};
+
 static struct gmin_cfg_var xiaomi_mipad2_vars[] = {
 	/* _DSM contains the wrong CsiPort for the front facing OV5693 sensor */
 	{ "INT33BE:00", "CsiPort", "0" },
@@ -83,6 +89,14 @@ static struct gmin_cfg_var xiaomi_mipad2_vars[] = {
 };
 
 static const struct dmi_system_id gmin_cfg_dmi_overrides[] = {
+	{
+		/* Lenovo Yoga Book X91L */
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X91L"),
+		},
+		.driver_data = lenovo_yogabook_x91_vars,
+	},
 	{
 		/* Lenovo Ideapad Miix 310 */
 		.matches = {
@@ -359,7 +373,10 @@ static const struct acpi_device_id atomisp_sensor_configs[] = {
 	 * the sensor fails to start streaming when instantiating
 	 * an i2c-client for the VCM, so it is disabled for now.
 	 */
-	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),	/* OV5693 */
+	/* OV5693 */
+	ATOMISP_SENSOR_CONFIG("INT33BE", 2, false),
+	/* OV8858 */
+	ATOMISP_SENSOR_CONFIG("INT3477", 4, true),
 	{}
 };
 
-- 
2.53.0

