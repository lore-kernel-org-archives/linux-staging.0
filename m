Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586731;
	b=iCe0xGMXWD/bNUchLf9c7LjyU6x8Ey27qcKAM5PbwqxGiK7p++E8vLe0AV+TpdP6w7ih
	 uRmOoQx0X7gsxx/gwJmR4BepMLb3eqXyooZUAfCSrnKk8dGICvn45JxDU7ej2qlNc6a4Y
	 U8/bPQVzDF3/ohDO4jy+LUgi2U5yAZig2IiiPqrdJrkdDI3foMelngRwc+QwUIg/HeZDk
	 encvk1M+VL5AJ6O8p/xfawhVUf9G+URhPUFa739SC+NB5RVJG0H1jxpwmq/j4Rz+cZFz9
	 unxwIQW0t/SB8KL7Rv/j33eVfS/wXZYHGdmOIyX7XvKWI4VjOTyiYR/LEn+wV1ERgVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586731;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=HR+1DPCwhbHFYST4j7neRHEcgr2daXj0B9N2zzcfMUo=;
	b=Ej8uB8iXqFyVRt8s4LoEw80HNgamjYGUKpatwMmKqItgTstq2kpRwA6L4Ag3JeenOKjs
	 WfiRoE7ExY6jElmbtrcpRag+on4JROnY1sOFjUTsG+UjSOrxh03sr9th1XYGpgORQc6l4
	 ilnopTwYQkw2mhA6cy4bkTPtgEN87inHPfrXfd3wvHwA3kjD50+3Z9phAc4ZaMTJW9y6K
	 bWdt6tJlh+o0YdB1Iqrt2YlimjzcDS9BTIdPSNRejerRxMIu24lRkhfl9xCB/xEMSGI+C
	 VbvcdSn+7fI73vMuUYApm9zkUgVKOcbx52RbT16qeDEjqtZamg61axUtvcnKqDmW9cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JAllkoYS;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0DA606EBA9
	for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 16:18:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B0DA606EBA9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JAllkoYS
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so216135066b.2
        for <linux-staging@lists.linux.dev>; Fri, 13 Nov 2026 08:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586730; x=1795191530; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HR+1DPCwhbHFYST4j7neRHEcgr2daXj0B9N2zzcfMUo=;
        b=JAllkoYSoxTSzHI8twxISeXTfl9W3m97HIBOco0vzVigCt7I/s/ytfP2gtNpLJF33p
         AF4wSeGeLfjBmOfwxHkloFHQ75K4f+NwL2A7HKHOtcu+vsAEc9hvZ+Z55AjEpPH887T2
         /4gxsGveyTzeutkRxE2Y2etlF/u8rsHfGaHDm430RqR/EHmUJouRgSXupPmbg3DT93IY
         ptw0EkGPequPQ9S313/Nk6bHRJxaxsekbbvUetJnGv1jXuMxpGTMQGtGbNBiLf9FsogX
         l+BfwvN47cD0Oupou771BGW42ySpihqY3vEi/SdEUKUj1Fud0yMbinGxvZeyV0W0p0tc
         HMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586730; x=1795191530;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HR+1DPCwhbHFYST4j7neRHEcgr2daXj0B9N2zzcfMUo=;
        b=0nw6+ZZYKorGFaWsYvcCdhP1jXWRPAv1laMKzw1xNLXG0mmRLsjGkpaFyJ+Ex46xl9
         kBfrBPcIrQC4iwKboaBSJWrddeJXE73Jko/8W3vYwXMe3rrJwJD1nQfii7Z6ZtZ0GXD7
         0OCJYSxxwHV2IUDVx6e/9s/pVLpHp/1yAkT3YfZvVThLANXyUmXRCa07mW9uGMYN5oe+
         KRvNg1/6xo6y4yW6K3ndmo8X+/kLdom0UFXXWhBdHhbr8NXtK4JbHmrfZy3xKbe4dmSB
         eDqr1D5kdhYcEZZYuXgfahRaa7vxtXKOZQ7sFIk9mqGg3IN5dwzEj3tK1j3MtPHOAEfT
         gi1Q==
X-Forwarded-Encrypted: i=1; AL+hErFzgUBBR2l0EflJkPBrO35SLw7yCJEwaJEGEhH0CjAgIdz4Nrff2kvKthYk4EuQ7S4kq+k5iKxHmtm7YdXT@lists.linux.dev
X-Gm-Message-State: APuU4Z+vn21AfqWqLhdsPpNkwUYvkaY2sjfKiqzfXCOGp13JF2qBpMxH
	1QygA2y1ZsAoN9d37p1gzwGD4wkcHfCFZBg3VAcptXXupIGig05aM1ox
X-Gm-Gg: AYBFou2hlkcE39GCOO3BsfY6rUJ0Wp/wTJB5g3skvpZepdmmNK5h6JVvXs3tArhcuOV
	yMpkWXBbzMF63w14hk6SM/fxYyOgxRoJT8+7yGBbsDajwRYju699013Nx2W30cADa1NjpA2dw9b
	fU+VFEnEYMyH0XwgrnK5Uf3bgYnYpuuY6NfrljUK8RLJA+tfnuytTZQvAQgqVtafLcKJqzxHwcg
	//96UIawUuJ9uw2L4OvZdSo92EfXjlZB4NconVhmKAxizMMVu5n9C+yCD5nswyi502Jpdet+eQJ
	6li93IOhQ3j2NGenxgwzLlKZrx0o+w030ghDjggKmmq9TAGtvxO1az/2Rf/qwgQ75UC5a+u0lOE
	v8Sgq5fkHrkSsFBbKmmjH5yJkO+nqeLiZ4yG1GGA2yzwj9DgGIuyU/9mstpFZnIafQM8Co8dRWg
	eJwjr1GXpNwhB7HTg0maT27Vo/Y9xSWSoXL3y4ZTWd7vg4OZhubjeingWHzfEJn4Xeh65wTyEVN
	SeslDzmBbMc7tnNr2aT97pIRa9KViUKdMvJP9giOzKKS7EYOFq6O321g5LOpqgNpgktKh19gWbM
	YCqMpydf04BpF0FXbvp/9e5GoUbkL7Rszg1Fbezge8JBfPQgsenRByYRwXdi2E4ZsDufjk2Fkn2
	6RfWw8Q9ewA==
X-Received: by 2002:a17:907:2d1e:b0:c4d:28ba:f221 with SMTP id a640c23a62f3a-c50963d46dfmr252539966b.42.1794586729694;
        Fri, 13 Nov 2026 08:18:49 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:49 -0800 (PST)
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
Subject: [PATCH v1 05/10] media: tegra-video: vi: Use entity function to check subdev type
Date: Fri, 13 Nov 2026 18:18:14 +0200
Message-ID: <20261113161819.36847-6-clamor95@gmail.com>
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

The tegra_channel_get_remote_source_subdev() function relies on pad flags
to terminate the search for the initial sensor. This causes it to iterate
through devices that should be bypassed—for example, the pixel array (PA)
of the mt9m114, where the internal image signal processor (IFP) should be
the initial source instead. Switch to checking entity->function for a
sensor or ISP to terminate the search.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/platform/nvidia/tegra-video/vi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index a96ef26af89eb..5c649e3162fe3 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -189,13 +189,12 @@ tegra_channel_get_remote_source_subdev(struct tegra_vi_channel *chan)
 
 	entity = &subdev->entity;
 
-	pad = &subdev->entity.pads[0];
-	while (!(pad->flags & MEDIA_PAD_FL_SOURCE)) {
+	while (entity->function != MEDIA_ENT_F_PROC_VIDEO_ISP &&
+	       entity->function != MEDIA_ENT_F_CAM_SENSOR) {
 		pad = media_entity_remote_source_pad_unique(entity);
 		if (!pad || !is_media_entity_v4l2_subdev(pad->entity))
 			break;
 		entity = pad->entity;
-		pad = &entity->pads[0];
 		subdev = media_entity_to_v4l2_subdev(entity);
 	}
 
-- 
2.53.0

