Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267997;
	b=lDOjAwkNgHyOq7e3YEPGNLvICcJYL//VnAjQM2qYF7Z8j6ua/PQH6pCO1NSMRYFfQZn3
	 VXxt5Byn5W0cceR45mMC4WxwqWY+UoD/sRM5SIyU5cZflHFzuHsgjwO9l8f9CBWnO50RP
	 Jf9PW2z3bSweAC/DJCsFrSBy/fyPMWQxNvfd0XMR5HyDRtq8/2usQcUEYj4iMD58CIC9T
	 F1dkgl7bzgC6pnO/lOUN0Q++DkTTNmwUWnINEMu45qDrZbI/731hG7MSF0OoTEEIxl1gU
	 W89y2a9I4i13l3CzPGIK9QTULyrjRHNH9n+mLPLaMMUn5YD5fqzDb42sXlfP0J9m6AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267997;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=G24TDvgLhTj0CrN+9xXORB5nAQ7ODFaFZ6vvRCICW3U=;
	b=sLjqq/C6LBWHufgrnWhgtzM+wjSI734V4XWUp/uZ0pedYloWLQRA1Gbjxzv5CJGq68KR
	 /DU7T9Krki3qoOMqPcjZge3PBW1gZJYBtSxj/yJUNQHZ0cleTjHottSxVZAQuFPHFbL35
	 SBUqCT4WYeDrO9u6Q3p6NkdtvtULSsZrO3EASDMWBqicnb7BzYe8O0gFJrTPqdQr9sCPD
	 RaRN2QGwkoDTgjQ6UwaL1HwNGFCQ+RdXidW8lNTZuvZ3Upok/8vdFXEy6Zd+SUwjWyB/7
	 gVOw59co0kmq1ZC5ilD0LBdO9vXwZmaB21uZpq+W3JSP0/hYhEx4wmxYKvN9rGTK2pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YVKovQxq;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C5A0606A68B
	for <linux-staging@lists.linux.dev>; Sat, 21 Nov 2026 13:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C5A0606A68B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YVKovQxq
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so15744285e9.0
        for <linux-staging@lists.linux.dev>; Sat, 21 Nov 2026 05:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267995; x=1795872795; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G24TDvgLhTj0CrN+9xXORB5nAQ7ODFaFZ6vvRCICW3U=;
        b=YVKovQxqSCPQq3zCjyR/7YQRNBZdzHHDnA22/HM8l/oqpRKsC1fKo3mvas0CNYhFpM
         xxMQkWToxbL0w3YqZ34VODuRPJ5lj3MLPmSgdE9WQTjMFpvRhwyIIvfIMXtiscjJbLQU
         IlKri49fC3FzqOmBXscVJXBqJabU5HsPIwFz9C3ucQmcesd5mG1C6UvJq17YpbB4tkGg
         542FNkuW5KbCcHCZ8pgD+iBXkYh3ki93ss8GfT41SExTGEcxTS2UiGU083PykgukvMUw
         13Exz6FAyIQ3EvH4bUeL3ihL/Z4eFOh5oNMRGDm2DkGp4GuJSYanzS2sLQDBgGAPZeqU
         eUVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267995; x=1795872795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G24TDvgLhTj0CrN+9xXORB5nAQ7ODFaFZ6vvRCICW3U=;
        b=eruaRAKbOz4dkLfBVML+7gvboNX253lMU5iWq+49W+i/Gw6j6jMjN3fv9XCGSJ+qeg
         kSyMC84CWZjHN1kYOTx4IRjUWfK1Hx6vyu69apVGf7hrbrojvy5D5rJFzA8inete2f82
         lAEDrnZDXGwqsgfE2xuNB35cRGwwcePZcWAwYnu6E54O8uO+o060k34A9QLZ7oKbDMAo
         6IEmjW1Vzb3OvtU/tbPSGp9H8NTVg6AP+IY+UBZCm45QyV2WcRvecpfddbNllNlNGA0i
         x1mC82LCm5BhlZSDYENwrgR2Ua8McXxSaxsrmqQyMDLePY9WUmYDnrsE7cGwF6vJx4P6
         +FLg==
X-Forwarded-Encrypted: i=1; AL+hErHL3qTamGKMzvSkReSm+O4tYDEixUSCnUYNFgsdWjsLTCXTdTuyd+j02drXD+rRf2YlWnexW9gs09meEVg2@lists.linux.dev
X-Gm-Message-State: APuU4Z8ZZ6gNTZLrxGQ6q7QAuLDmk3XHWjvK2/xMrhe3rOpQwft5/NUq
	sFYyRuDSkEi8ZRJ6JGBdcBAG+0eUtG0AFeQDgBlvOXD+wlHLBwDX9GNv
X-Gm-Gg: AZFdTZc+xiU9sd6x1Bjfj7OfkajRVZ4SSTZnyDItv7AUuFWLfIyD8Z60gAoVhUFpqQz
	KBXw5r4bYqqNY9uTivCFK0IFzDQUZdSyEmS4YFR2lGzhh96mlciMDpUA74UNtNOpgEEk5N+OhnL
	9HtQoeWT0rxkmKDRpIvvKsKHAJeM6ijwC5JBq/1RMyFMhXXpU38wOWVjtQahlk9ys0KKFu6TBYG
	T/h2pPkQtNFJEA9nQVUdgTUvOyc+oT8NZIbQLqmHFEVOSxKeQ6+sWSE/sEnf0SbixUyKIJmNz7L
	c4Ge67t/c9cPwaKOZGEfuimPKQscKP/CPNgNVEIVnP2mg+sgwECfgK+MvM1t7mLm2xpvG89J7ER
	um9DSUxqA7m9aLimbuJkgOI97lPAGGRzTTsvBfJErHGVJJ3dgvQvv9ztokm7ciDmJXnRdnix12F
	GFcG8b/eBnR5HA73XrGn7MCxB4i6MfyxSgMy6PEQVgZb4YXR2L/CYiKYiPA3mX3vyXCOFlboTuT
	APvm+2a0PlV34cbuDuIPQjP5Re5Uf5lNoPiPM6O4vPWLwv3DzO4Hne6XY/Alyab9DIoR6UEWYmY
	frB3lXcWks6p76meT+zFZI9os7F5Xhvw+fRnQCnFSBUP90MO+ludLuNuzmGXRd7cy149XxV1Owh
	4qwbqhjAJ90iEvO4FZnJv02wu0NbmdAMvJzE=
X-Received: by 2002:a05:600c:1911:b0:4ba:38a9:85e3 with SMTP id 5b1f17b1804b1-4bb8880eecbmr149002085e9.12.1795267995455;
        Sat, 21 Nov 2026 05:33:15 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:33:15 -0800 (PST)
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
To: linux-media@vger.kernel.org
Cc: Maurizio Casciano <mauriziocasciano7@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Nicholas Roth <nicholas@rothemail.net>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Bingbu Cao <bingbu.cao@amd.com>,
	Dan Scally <dan.scally@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v11 14/14] media: atomisp: Preserve the capture graph when a lens rebinds
Date: Sat, 21 Nov 2026 14:31:44 +0100
Message-ID: <e19d87138eaf283350f85ace17ee9ee4563e9423.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1795267528.git.mauriziocasciano7@gmail.com>
References: <cover.1795267528.git.mauriziocasciano7@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The root notifier completes again when the lens subdevice is rebound.
Rebuilding the entire graph adds the original sensors a second time
and attempts to register the capture video device again.

If the capture node already exists and the sensors are unchanged,
register only missing subdevice nodes. Reject a changed sensor graph until
the driver is reinitialized. The preceding V4L2 rollback fix keeps
existing sensor nodes if new node registration fails. The X91L rebind
trial exposed the original issue. Codex drafted the notifier change.

Link: https://linuxtv.org/mailman3/hyperkitty/list/media-ci@linuxtv.org/message/2PUHZIDBEIGQKGXTJJOUXXJS2EOEMJGD/
Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
---
 .../media/atomisp/pci/atomisp_csi2_bridge.c     | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index 56da454f0..72048de9b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -508,8 +508,23 @@ static void atomisp_notifier_unbind(struct v4l2_async_notifier *notifier,
 static int atomisp_notifier_complete(struct v4l2_async_notifier *notifier)
 {
 	struct atomisp_device *isp = notifier_to_atomisp(notifier);
+	unsigned int i;
 
-	return atomisp_register_device_nodes(isp);
+	if (!video_is_registered(&isp->asd.video_out.vdev))
+		return atomisp_register_device_nodes(isp);
+
+	/*
+	 * Completing the lens notifier again only needs a new lens node.
+	 * The existing graph is valid as long as its sensors are unchanged.
+	 */
+	for (i = 0; i < isp->input_cnt; i++) {
+		const struct atomisp_input_subdev *input = &isp->inputs[i];
+
+		if (input->csi_remote_source != isp->sensor_subdevs[input->port])
+			return -EBUSY;
+	}
+
+	return v4l2_device_register_subdev_nodes(&isp->v4l2_dev);
 }
 
 static const struct v4l2_async_notifier_operations atomisp_async_ops = {
-- 
2.53.0

