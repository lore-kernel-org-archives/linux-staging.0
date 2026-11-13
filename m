Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586729;
	b=RUi4hOlDNUHoQTjQ+/IaHZ3zglnkfZbp3YhCEDyb860mevTu+KEznAokQjpzxI5ht5O+
	 qfRLy6g1F+4kyeVFLfPY2pyiTSQ1l3OD1tKUu7DHk3nv3ZGtX0dmj7l4bWaoVbwJjYMUo
	 DyMPBfJLLzgWBHwJjEcrzr8X5BtKErsXfeKf/zBJN8dWvmYJnBt/Z/Eo72sD8ywzFIl5p
	 flbfz9+iIY725VBsoQKcJojoGd1N2HOaI1QQOk+ipXHXkjY4sIxVBslvupuWb1c+8sV/P
	 qRUFwetffC6k9kO1mYVDQeddh75kdffAtirHP3nzmFF/4huVsszwmnAoH9R46BSTvSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586729;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=wB38b6je5TukLZG4QeKQmlwzA/Ycxh9nT5Bea008608=;
	b=fBYo9TLemi66WVqbvhTCKtKv2wsIkjROAtIPbRzjJZPGNplbrPLGfIDzlVBjrBbw3BK3
	 40qmBSLe+tyGTAJY5In8wEfxDlCYpdguuJmTQqVVCKgowrZsSHLMV8Jg4cDggMp2TkdAp
	 UmchBT4elIE5wUvxHs3dLMVf7t8QH+NwoMgR0YAWtLINnbV3pEXVgMqDW+jCJEixit2F+
	 eqz9RQxDn8Q+0FlN+x2OQtZRF2t1CQx/DYGPwo3uFMnHsRrnNvHKEc2ek75o0ABhxiUAz
	 qZsplFk1ldARd/39sUjESdUa32GkypBUci7GXcNzac7/IKQw982/hq/sk+chyY99Eng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=USAM2SbN;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE3E606C54C
	for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 16:18:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FE3E606C54C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=USAM2SbN
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c40f29667e6so273645166b.0
        for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 08:18:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586728; x=1795191528; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wB38b6je5TukLZG4QeKQmlwzA/Ycxh9nT5Bea008608=;
        b=USAM2SbN/KxuOopWyIX237kimRQTkEodLDnaeffNiodMANUb9GMuComwNgzkSBS0Ta
         lV1OAB9Veeqg5qF2BTWuVFyjeYiWRpu7e1+vPAS0IPrLceHEt97OWlBFn95tHXzfluDT
         1RI+OLKGVtPzZYUDbcjoBKe7Z6miwDHArpVHP/g6lsK+hZOLC+zj+hWUCFJeDiwfiak7
         UPHSJE8e2ydDCGCfETg0e8VL+77cBGLVaL7vEUBDk1o/KSQWqFurIv7q3yHZm2pQ1PHH
         dqUUbBwIDofA1Hae+aFsvL2/XCF0pdhwlrAlWDXqKocww+r8eOSMPNqdEhc2Kh90XIrj
         W3fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586728; x=1795191528;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wB38b6je5TukLZG4QeKQmlwzA/Ycxh9nT5Bea008608=;
        b=yXoLde9JVRHaRq1t0+cNpucuUElh3IXY6qoHPRkcXiVvOJrApEbJFBpaSw3/X+x+FR
         w1WGKKkwSgNPG28tejb11wQuzePPSIZgUx9GP7h73Fk1T4NqZLUkpCsnR5+DaZ9N1GoC
         +ebgfsI0/ZmGo6eLJtpshyQkKPbKTKjxP3PTbqBnWRWKPMCr/3Z0/x3TcahxRRnj9dI8
         kC7z2rSJYAvZGmlU5yX5HSRzmN3hiphvMaaAIviem2M9czwL0DYCRdDpj54nphipDQoQ
         17SYu+W/W28G4lskG9Er7afdEsNQPYynWb32mM6QWYvm+iqMT6GbJL9u/x9AxpRJp/RT
         xZvg==
X-Forwarded-Encrypted: i=1; AL+hErEzc1ue42zfqH7Cy8MnWWBMlJrNOrz2T4NJIXEHVc2rEZLlbM0Ecg1VcOwB0WlGWVzvxzEUAMppfBfcXZpo@lists.linux.dev
X-Gm-Message-State: APuU4Z+ZGLbX4ak4SJTgbs6MRI2VlFz2QvRqBqcnB6CW4xDK9NOKvtmU
	9sGSHlH6FoQ7/lHIC5d6E1J5m/7IFr5VjdTpu1WxhEe5RQsCL+IDVMRh
X-Gm-Gg: AYBFou1OaQfd8ij1UB+7n88HpxQCqyeAiCkO5jP+JaXHPcg0BmMaxZOcxM9akH99S4n
	aGU4TWmf6dJDh5eVL0IQklee+uNG4eFif26iWViqr6dtNho5/fPsu5FaYuXCXko72ZGXGc1a8SD
	aRgO2HahdaFHD8gi+XU6klm8uo3zUN1stZALeYbRpKnL1BVLAKSqmWiERV8khX+aHK3glQ2+7Si
	T7DNbkJ1dMF0P5EtYIJVRXsZ92ix29+nR2tzK719I071xNuugVOm9TEwgEWs6qmdb0vul1GjTbz
	4DMKCVrOI9021u/OyZF1IJY5+5i3QprW0trQKv8s6+fBDERggIuUzL2/NDvP7vGix1cgkutWHSx
	lV8EgCUrLBZAGC9Ww6bumRRe2twWL7zrJsigi1Hj2hA2LZdUCHnhKaqDHCOtI6qW1VyhC9MM+Hi
	VSTeh1MS8SQ0EBHJp4YKYvL1SZTCkg1nCXHGoigsLvI71PJIqy5Dj5dnROSb/6T6lAwPrbl9PlU
	IIJCDSvOJW1G0ARnlV52IXgNqGHIcqAZxVDNJC4U0SnbNiFBXDEsl3EIKU0kyfVwSzc7qxdgKnT
	YFVCPUUkkJkwRLibykCxujh5kkFh1DRwpRrVlhC4Z3DZFPNjxPO3Amz99NK1bhJz9Gc7j9f6pSx
	D46FI6zV0uA==
X-Received: by 2002:a17:907:c09:b0:c49:9231:5518 with SMTP id a640c23a62f3a-c50963d4f29mr272520066b.21.1794586727949;
        Fri, 13 Nov 2026 08:18:47 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:47 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cong Nguyen <congnt264@gmail.com>,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 04/10] media: tegra-video: vi: Switch to media_entity_remote_source_pad_unique() helper
Date: Fri, 13 Nov 2026 18:18:13 +0200
Message-ID: <20261113161819.36847-5-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113161819.36847-1-clamor95@gmail.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The tegra_channel_get_remote_source_subdev() helper walks up the chain
to the initial source. It blindly uses pad 0, assuming it will always be
the remote source pad. This may not be the case for more complex multipad
devices — for example, the mt9m114 camera sensor with a built-in IFP,
where the source pad is 1. Switch to
media_entity_remote_source_pad_unique() to specifically retrieve the
remote source pad.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/platform/nvidia/tegra-video/vi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index 12eaa89304e84..a96ef26af89eb 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -187,9 +187,11 @@ tegra_channel_get_remote_source_subdev(struct tegra_vi_channel *chan)
 	if (!subdev)
 		return NULL;
 
+	entity = &subdev->entity;
+
 	pad = &subdev->entity.pads[0];
 	while (!(pad->flags & MEDIA_PAD_FL_SOURCE)) {
-		pad = media_pad_remote_pad_first(pad);
+		pad = media_entity_remote_source_pad_unique(entity);
 		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
 			break;
 		entity = pad->entity;
-- 
2.53.0

