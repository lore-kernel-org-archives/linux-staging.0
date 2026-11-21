Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795267983;
	b=CkhBhW8u5sIJ+XWhW2lklphR68V4t2t37c0CrYyTfoaFNgP3dvee8BQ2X3I2u139qllK
	 yKzsmBhYt9vbyWzMCn8ZDkM3TdAgWZmYJacotNFjqoiry1WvN1nhEQ7Zvk52OopbEFUVW
	 qwZbuaVmof/wbompNvSdDcpBgVh9ooYXmAAIeC68+W4xVAHR/pvFvORSKlyP8DoefHWCm
	 uP2pbHry2KvSkDL3D05k3AKSWOcZuZs0i8t5NAdBfvrnRQMWMR8yzBhtMwv6s3yaM7Hf+
	 YIlSxAMGXzmp3MLs4XqSZAFNrhbfyEXvd2hgnvtMmzPtvWMaM6CqTVDA7FvQ34q0jIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795267983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=54HoHtyBCmpZ6kkP9mnsCMJlZYb74fsAgesBBR9Cid0=;
	b=rz1uvmCZCHCrPboquBxmAnayCq9T0kopvpgNnGWBwW1PptDqFYifXrn8xOOWXOvd9lr0
	 0/V+qyDbNvbJ/lDGUqAieg/qe0GIy+fiWXYEFNHpb20J4OOHfWy9U+1FwrR/ArNnsmCUO
	 wWyzILTD4dYLQQ9gUiYNcmqePQepkFTnZ2XmrweyRKvOX1XWZaKOv8yUWYJVk92mxoBjq
	 B9Ba4RRUQpASw8+xoCYeR9pjUiCcK7KzqK4HyOb4fxMHA/TA9nunBH3G4I0XRlmziBEU3
	 jZfNjZEBt7+JCy7LimkKh/4BENqf+SCqKQpFycKVo+fIupRwkm8LDshbvEgHDKs/Omw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Olxj0/ft";
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5814606A32C
	for <linux-staging@lists.linux.dev>; Sat, 21 Nov 2026 13:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5814606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Olxj0/ft
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb606491faso10024285e9.3
        for <linux-staging@lists.linux.dev>; Sat, 21 Nov 2026 05:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795267981; x=1795872781; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=54HoHtyBCmpZ6kkP9mnsCMJlZYb74fsAgesBBR9Cid0=;
        b=Olxj0/ftaLQO/Ng4JOIAlV7IirJ4PbRR2Pv/MivagyUXdipMZQrfVigJ7nTDLvYYfm
         vgipyyhdWwQkL0xFUzA5nnheOSWFi+uA3cHCE1OaWx11oOM5XayCnsHNfIaqpg9hYIDF
         UWG5VHP8ePxPzeBIoA7oNFeFBZQWYDXxB62bTS6GilyWrZ6BBox/VlZ5I5irpjuJol23
         hGAp3qb1PRpN4aWuv8xTf4JQ9C7dWCzHRcyYHYPSWr3XSLZb9ksaXHJVJVf0hKk+7I++
         B41+rqWGgGdMUYJPGCfgagFN2rEf1chyalsPLesuh5/gQ4OYXFQSzE1RXv9KywJWdK4u
         TXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795267981; x=1795872781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=54HoHtyBCmpZ6kkP9mnsCMJlZYb74fsAgesBBR9Cid0=;
        b=IAROp8wlYcCRbZ5Hcoju3I9do2jmamFDevREdFwmtkCduDkw7cfORd0W/HY01RAQAe
         3xdIXpc6t94xIjKUkbPURk3knukKGX1HRJ1QeyWxE9B8Y2lsiYSxytfLna/wjERFGm1q
         PYcMl77715r+dh5NFzeOdkTn+hfFtl3UUJm+G6tLE+Obv1fcTW9TF9B3B16Q+ia9P4ln
         9gvxdMWuLtfAecafD7+BP6fqltsHiN45wCc5fU7177g8wLWVhs3owk5zQhGP4/L7P5p7
         1fr4eNMj62btCp1EaAHimWhi4ZsZkpoQ4sZG3Jx8BqiM3wBFP52Z7BBch74sMMcCKC6+
         l/lQ==
X-Forwarded-Encrypted: i=1; AL+hErG34jiA0l6CiV06nFMCiUhYGIk/4pwHW7+UXzq8UH+Uek78ebSgnNxNhUmQTVMCgBoMuevTsPyrvtcPt1UU@lists.linux.dev
X-Gm-Message-State: APuU4Z+aTbol5QR+m9uvNBPkAlMk0uMAERUfG14ba4j3EI6FvKHIzUR/
	S7ECjifvuIUi8ql9fx8kqJPS+xWGXa7vqput2Eiz5clvEjN/7JHQHNzA
X-Gm-Gg: AZFdTZf2rkAmd7eUneelqQLzIm22Vl9BdAPEBM/5ryWkdImtkxBt/vvzJ69oG9iUBDs
	T4D8z2jXt+DbowJlsimgRHemegdKHh6wIcch46spmlbWCkF5Op8LcbCMr351AmZ9Kfh2ZZAx741
	pFr3bma4jEMhMdHvuUMjq8tQXzLuJJ9fLmZNdEd03N9/4GVPJgq6qtUvAMj0qjP38iakX0YiZ/7
	BSMyQK9LldMc2SPNFEX96r3tVhcFjK4vqMqfpsjd8pcP01rok1Ts+2Yl0l5l/w/kaVz0A3XIF0/
	DzVTxjBZwsglF/A2AZZm9CC9PqfX00wL/aSiKkDGrJMhGHWTyA8pdWJuKkuLSlLv48nTviOfQ+M
	+LsYKYJ8VT3bGsPCga57Z3935CQ6y/4OB5TPLPpNL+Ip7MQkNobm5spe8HPLpjAn1tQepj7Xg/F
	LMXG+/OnPGimDZpnT81n0uZDeiT4fPLX8T4NJ5K9rOsX/P8wlVNDe8jkSxwOLTTmoBIGl5XE+Of
	3wmiQee2GHv5D6ZA31vkWY4LVPtZQTwcAEWIj9EzVXgYJsVqZ/CfANHLP0leL6XbbPUvEkzWwxX
	BIcu2AJatcVz4dFtEuWZeHcpAIFX5H226FRM+TSGRlL8jZDKtSsLAAZU/OKdU+LOSGYwWvi8Brz
	2RCw+v3GziKjd
X-Received: by 2002:a05:600c:a088:b0:4bb:6473:cde9 with SMTP id 5b1f17b1804b1-4bb8880f2d8mr120065625e9.6.1795267976558;
        Sat, 21 Nov 2026 05:32:56 -0800 (PST)
Received: from 1Z10 ([2a02:b123:8010:295a:cf7a:d53b:95ce:c0e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb90660cb4sm83345955e9.2.2026.11.21.05.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:32:56 -0800 (PST)
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
Subject: [PATCH v11 05/14] media: intel: ipu-bridge: Add the Yoga Book OVTI2740 entry
Date: Sat, 21 Nov 2026 14:31:35 +0100
Message-ID: <48564c62d0c08d66023a40b6cdc175e5af88fbe4.1795267528.git.mauriziocasciano7@gmail.com>
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

The Yoga Book YB1-X91 uses OVTI2740 for its OV2740 front sensor. Add
its default link frequency so the IPU bridge can construct the software
endpoint. The existing INT3477 entry covers the rear sensor.

Signed-off-by: Maurizio Casciano <mauriziocasciano7@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 2a38c4bd8..5f6baac2c 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -115,6 +115,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTIDB10", 1, 560000000),
 	/* Omnivision OV2680 */
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
+	/* Omnivision OV2740 */
+	IPU_SENSOR_CONFIG("OVTI2740", 1, 360000000),
 	/* Omnivision OV5675 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
 	/* Omnivision OV5693 */
-- 
2.53.0


