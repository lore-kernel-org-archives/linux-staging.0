Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 701801EA01;
	Wed,  2 Nov 2022 18:08:20 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id k2so47528251ejr.2;
        Wed, 02 Nov 2022 11:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3bJiWx1wliVbcBA4hLVtU2HKADrW2hjL3FgeqkhgWtw=;
        b=MuOr6WgUNRTbGp0fKCLMkl/k7dGETn0MCPk6OvhPg3lmMvlQgmcuBFQ+ABDIQVEfIR
         wFZp5SWC4EFvbN0KmunKKO77/O/BC7U/qywpY2f1LZBtchRftfHVF3XlxDQXgmGoQ3Cu
         HRfmoLIhb4dl4QLwwj8v/orGggqh47FggbluTDhATnJPTKIyLEFUq6U5YhVS+2MCTQVG
         Gk2wEwdsPhpcbyRz3cEpnHhdYsYto1gGKo/qcRpNS7dSxQpynS9SIQ1g/wDHuap9qgst
         EArzOONtTazMJBiM1MR40HcTRdRrPXfFh+vXs2vu6s+5u1L8ble5iN+quusR0rM+WQoX
         JcKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3bJiWx1wliVbcBA4hLVtU2HKADrW2hjL3FgeqkhgWtw=;
        b=ooj6w47tIogJB2Tz38KzJ+bBmjZ+55zCn9xemW5nhQuphzFph1unVgxhxZNiRAIli+
         qYWITKtF02QJ46Qx69RmOKAZkmocoB70cKOyve+dU8icUbu9Ver9WacpQ93wudrEvVYT
         xBzovc2aXqQzxGiAXN0/ardMEAffpzewBcHMuDwddibXpXhPC8dDgdyBRv0GnfbJzROB
         MdTREhsxFCnWCGFYYZjD0tOaK+1CFasb/sSk1RMjg/xVlhBOE+loNR4Tz0K0H+cWC/lT
         A0Zz76z/Eri5FkZvY9U5sA5iYnqANDhdEE6p9iNXO197zqTSZeeJN8e6hLrJiJHVUUJu
         C5Ow==
X-Gm-Message-State: ACrzQf0xYvBjeGDwma9zgNPHqCiE1tSFmuCOxsMI+R2iImiymdISP5Ox
	lyzE01Mw+Cd9iB6j+GXbo0Y=
X-Google-Smtp-Source: AMsMyM4280G5nDkbI8u023cMcU5BlS9r2WOVAAA+6//bk1OD+H9jRtahZ1KPvN75QhuxsNTEmyAj5Q==
X-Received: by 2002:a17:907:b15:b0:7a7:19a3:e9e7 with SMTP id h21-20020a1709070b1500b007a719a3e9e7mr24606410ejl.361.1667412498590;
        Wed, 02 Nov 2022 11:08:18 -0700 (PDT)
Received: from kista.localdomain (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id gy8-20020a170906f24800b007317f017e64sm5677460ejb.134.2022.11.02.11.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Nov 2022 11:08:18 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	paul.kocialkowski@bootlin.com
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	wens@csie.org,
	samuel@sholland.org,
	hverkuil-cisco@xs4all.nl,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 01/11] media: cedrus: remove superfluous call
Date: Wed,  2 Nov 2022 19:08:00 +0100
Message-Id: <20221102180810.267252-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221102180810.267252-1-jernej.skrabec@gmail.com>
References: <20221102180810.267252-1-jernej.skrabec@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cedrus_try_fmt_vid_out() is called two times inside
cedrus_s_fmt_vid_out(), but nothing changes between calls which would
influence output format. Remove first call, which was added later.

Acked-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_video.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_video.c b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
index 33726175d980..1c3c1d080d31 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_video.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_video.c
@@ -309,10 +309,6 @@ static int cedrus_s_fmt_vid_out(struct file *file, void *priv,
 	struct vb2_queue *peer_vq;
 	int ret;
 
-	ret = cedrus_try_fmt_vid_out(file, priv, f);
-	if (ret)
-		return ret;
-
 	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
 	/*
 	 * In order to support dynamic resolution change,
-- 
2.38.1

