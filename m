Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604905;
	b=q2K8FYbw3XCAl0/DFIoX/SvAOhucQ3jhBMMCKzRKA3nfqfP/FvtaV73kNvk84j2Bndnr
	 aZC77xcxRxzcqg2dQFZWYRq05/Ip/LAAVhaXbxQyiH+l5bB3Rt+U2VvZewoGLKTC1hjoD
	 U5uCUCSlwS5bG2xj8QY71slplqe2Xg42JVjePPPvq52bXazRqzZOUt7tBigLcX+UUzO33
	 8yKog37qnsTjRnnRsunVlPL/H0hpRtx1zriZhlmJ5NSSwuiumJAxq/yYUpxSkUrywjIaF
	 WluxJU158qZOo4li5f9QyLhlETMHFrwNWbE/498awD8k+Tdd3mZtOuxYIOp0Hxy+EMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XXRJcpTU9QjIzfFe4B7wSxdmLX/xKKkJafzMNhCePhM=;
	b=szy3eYKHymwLxG1Dmi5KtCIIvGhV4syCFAlmXcCuKtmDL2DkXsNxT8D001sjaKk1DEZH
	 gMsESWw/KtRmmn78qvGt4CjYq6HJUZUYVjVzsJBe+8IfQkF1zibjbTOGkKdPRqoU0EH2B
	 Bmxts6mZqbY5CGwLcNU2eYhb/75AxVN5u0Pk/1RLpC8aiRlDAk+biFrmHC0tm43yzexWs
	 +ZNutUWP3gGCxOtPuKScYY1CX12OwL4Gb4G8yJYocGR88+zkBP8G7A/7g2OdQ1Cu7qEiV
	 JO42xvOAnPkcMBK+QZPqEhKlr8K7SBF+PbuAE3TmMCCjrI3s+gtAu133CypVVHxe1mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zikrsxeV;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531EC606A686
	for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 11:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 531EC606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zikrsxeV
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c5133831027so800283066b.2
        for <linux-staging@lists.linux.dev>; Wed, 25 Nov 2026 03:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604903; x=1796209703; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XXRJcpTU9QjIzfFe4B7wSxdmLX/xKKkJafzMNhCePhM=;
        b=zikrsxeVucWyLhFoemlmQUmVK+oTImmvuceNxkLZ4tBofg8/Sgk9BLcZ/f2NwsV0Xw
         GC7S3+Jc1zfxMFw52rAnJAJEYMX8ybcopU8aqkbOAuysAOM30ZwQsqxkLZfup14W4k/U
         z9eDygC6qaY6Tdz5Yv0D36hfGGrSpAqvT/tkQs4zj9pjWbasdOipeRd6BeBCxp27W+qX
         VRsyst2hYk/WnG8X7/qwn7PMB7ScEvlOaPaD0gNGXp+uNibixe3dnTIwEyUocVkhD/+u
         A+Qh+LyDua0sn4ku6ig8UUQScpiKQpQeNbUea/m7h8NNeduil8ayahhYhBwMyBolKUZf
         jplg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604903; x=1796209703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XXRJcpTU9QjIzfFe4B7wSxdmLX/xKKkJafzMNhCePhM=;
        b=ZonqAYAt0M/yjd3gKi4Y3Y+btwE7lbmmHhlrBVnkP2HgTm1xGZmDtHei8Z8A40SNh+
         VoSp2SWZ9XagUy/qKPTRci5dAK4ZarVi4eA2ff4AZzvRXQkyOUHRl6/GeqWwzUK078HV
         ThhUH2hY54HjwY4pVxX7dO2Qm5osC6T2BeyTbo2hKUYAShQvtpvWdqU0Z3uWyYGoqKnm
         b0234i5Bv4xEFJhkvB4kVabl7+xaIYBksDLvtMAPXn2lWp3Hczdeta0tg8yY8O0K0IgU
         LelnOoUgzM2YtqSqs+3KtHReixiiyFljGCoTO97I69yhGxLls9S6rxLYFMQY2jSh6D5C
         znSg==
X-Forwarded-Encrypted: i=1; AL+hErGXbR6hlLzIW1lFK+Us6WZr83PYhCVimb1/dxBpjWe5CGafybaW/FQV414WlsgFNf8+esrKz/AKHvyRBJbY@lists.linux.dev
X-Gm-Message-State: APuU4Z8Er944NC13a7X8gCBuS6BDS9i69ckkU8iEeLFDOsVV9B5QZl09
	qEEaip5jovS/BTP3QeAxOF7SoS84OKeQEk3joxCzeSQ6qQ3zHrFMswTs
X-Gm-Gg: AZFdTZfd+g3b/oOHcU/jaeUjY00TGrrhs59HQ+FqEndzrUdOrgcFtvIAHB5/WDPaZK6
	YaMlI4wxRdGl6A1H+0MNYt0svZLCMycFbhc7u1slykrip553Ho4P0Kx6fa/44490L7D5V0UQuDc
	/OmQPe2YrQVdy2g3l8KWOey3WdmT5Yfy/bOBQ1a2QuhXLlw+duad3maZcKwCMP5ACPdDvj9ka+m
	94nB1RS1BHZqYhyQrhJdQC/I8jCnApGj1Q1HPZwP59eTUZeEJWkNVXwns9wgMMdSJg0WUaCe7T+
	s2Y0MF2bQkEpxM2WrVidZRyKkQKUSol/mdi8cv3FtBFfpdA7R7nfGz1/7Wg0UCSm+89ZDLzg7zr
	c+g3W/cRPHUkSxAtk6oxhnlYGNUq5i+8lWOntRCyBcrsi3JJbsa8NnqvgTvcvGeEFqL6hG90NkM
	Y1Jbth/aWRGxXf6rZhpTBSPKbOmNRH2sxJCHVzGDre8zU97X15zp+/4h9CbFkhB2LPbNhzlXIWg
	p41vF/vWtV//gNnkCj8Og5AFp6oDaV5G62w0PTYFq3zHkcyK5f/O2sRycGcWahKmg18mpNklqEs
	z3YX59352Vbc8al1ACYY26gzA4lXZST0EtiJ/zrhhm0hM1WBNpHmpWWzbfZCEn/5ftGLyFVWxa4
	+WkXPmDMpyas=
X-Received: by 2002:a17:906:4fc4:b0:c51:24a3:208 with SMTP id a640c23a62f3a-c513a5da66bmr1367694366b.9.1795604902648;
        Wed, 25 Nov 2026 03:08:22 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513acfeda1sm654562066b.6.2026.11.25.03.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:08:22 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 02/13] media: tegra-video: vi: Drop controls consolidation into VI device
Date: Wed, 25 Nov 2026 13:07:39 +0200
Message-ID: <20261125110750.223628-3-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125110750.223628-1-clamor95@gmail.com>
References: <20261125110750.223628-1-clamor95@gmail.com>
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

Like any video-centric video input pipeline, Tegra VI combines all
controls from linked devices into a /dev/video*. This behavior is no
longer desired, since it causes conflicts when controls are duplicated and
does not allow including controls from auxiliary devices such as a VCM or
flash LEDs. Remove consolidation of all devices in the pipe into the VI
device.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../media/platform/nvidia/tegra-video/vi.c    | 24 ++-----------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/nvidia/tegra-video/vi.c b/drivers/media/platform/nvidia/tegra-video/vi.c
index fa6114f4b9c8b..71921931457be 100644
--- a/drivers/media/platform/nvidia/tegra-video/vi.c
+++ b/drivers/media/platform/nvidia/tegra-video/vi.c
@@ -960,9 +960,6 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 		return chan->ctrl_handler.error;
 	}
 #else
-	struct v4l2_subdev *subdev;
-	struct v4l2_ctrl *hflip, *vflip;
-
 	/* custom control */
 	v4l2_ctrl_new_custom(&chan->ctrl_handler, &syncpt_timeout_ctrl, NULL);
 	if (chan->ctrl_handler.error) {
@@ -973,27 +970,10 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 		return chan->ctrl_handler.error;
 	}
 
-	subdev = tegra_channel_get_remote_source_subdev(chan);
-	if (!subdev)
-		return -ENODEV;
-
-	ret = v4l2_ctrl_add_handler(&chan->ctrl_handler, subdev->ctrl_handler,
-				    NULL, true);
-	if (ret < 0) {
-		dev_err(chan->vi->dev,
-			"failed to add subdev %s ctrl handler: %d\n",
-			subdev->name, ret);
-		v4l2_ctrl_handler_free(&chan->ctrl_handler);
-		return ret;
-	}
-
-	hflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_HFLIP);
-	if (chan->vi->soc->has_h_v_flip && !hflip)
+	if (chan->vi->soc->has_h_v_flip) {
 		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
-
-	vflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_VFLIP);
-	if (chan->vi->soc->has_h_v_flip && !vflip)
 		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
+	}
 #endif
 
 	/* setup the controls */
-- 
2.53.0

