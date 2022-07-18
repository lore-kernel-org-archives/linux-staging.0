Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010F8320D;
	Mon, 18 Jul 2022 16:56:59 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id g1so16131822edb.12;
        Mon, 18 Jul 2022 09:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y3DicpiZDzzyLvsd6Ksc1jxotvvS3SoBDIYH96KWNtg=;
        b=KUKKHyYWEJQbW9ke9Rw1YIZJaiFxXnCj4yr4QmqifDHu6S1SMb6SIZE5A21R2HhbZ0
         2gPuEGxA3VkBSG5aEF5bDSx00RMurXvxMRSIv8MEiFxhF0iKD9YHGVkYTvOinpxKmIQ+
         Nv6jaPHBJ2gJx22z5fzAzcVI6X2PESSspw5ui+uRmlCMGo16JQBEwjVaN0EXtibBKJDG
         qQ6JwWEKnDD8o/tnyaEEfWawuHJt09qBUeH2a4+mzdGmT51ClBuZsDhppFJv3ORp4DCp
         EFq8lWr0u2wLMuFZCx59OaP/eI9XSdqO/djQobEM//RngBYiGpHJQU8zUIildGJ9GWR4
         7iwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y3DicpiZDzzyLvsd6Ksc1jxotvvS3SoBDIYH96KWNtg=;
        b=pPJYAB3qRy5nDSuJb8uOBOdg30KTAgf+RTZgb0tzgY35/fopo4nbbL5invfFL1lxfa
         LPdPAR6GZvQ7AnF4QTOqlnNJwwvjQv1QCxtTLNhYo9H3RcewEwESkQbLeBy3tClunHRW
         lsG+womn7kcNt9klieSot22cFrxSsdCypSjDbHknKj6e8OPyYtvFY7pkL//G8JE8DH7R
         Nto9Wm9Mwruf/2oJM9KA4XVipu10ENLJDZTmYznj9w5m56jBUyNIIeF2Q8N+ZWrtNIcP
         zI/SdMRRTaphzQBLooOrv7mMrhlXEp4fpHYp6Vk0XQcgaUhPZ4BR66XEizqa09RqU4UW
         WRyA==
X-Gm-Message-State: AJIora+1em5xAZ6RxgRs4+xusEsyyFIwL0hzEoNGd5qh7rJFLU9M/qiC
	RHg1GyONs8cgnkejolWjBao=
X-Google-Smtp-Source: AGRyM1syIdVOZlV95OE9SRKoINorbj9ZvFSagj4n4pG8X5leSXmfWy+OX9VV0dqUJVDUD4hGdnhwtw==
X-Received: by 2002:a05:6402:46:b0:43a:f611:5992 with SMTP id f6-20020a056402004600b0043af6115992mr38917400edu.18.1658163418196;
        Mon, 18 Jul 2022 09:56:58 -0700 (PDT)
Received: from kista.localdomain (213-161-3-76.dynamic.telemach.net. [213.161.3.76])
        by smtp.gmail.com with ESMTPSA id gr19-20020a170906e2d300b0070abf371274sm5661292ejb.136.2022.07.18.09.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 09:56:57 -0700 (PDT)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: mripard@kernel.org,
	paul.kocialkowski@bootlin.com
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	wens@csie.org,
	samuel@sholland.org,
	hverkuil-cisco@xs4all.nl,
	ezequiel@vanguardiasur.com.ar,
	nicolas.dufresne@collabora.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH] media: cedrus: hevc: Add check for invalid timestamp
Date: Mon, 18 Jul 2022 18:56:49 +0200
Message-Id: <20220718165649.16407-1-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.37.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Not all DPB entries will be used most of the time. Unused entries will
thus have invalid timestamps. They will produce negative buffer index
which is not specifically handled. This works just by chance in current
code. It will even produce bogus pointer, but since it's not used, it
won't do any harm.

Let's fix that brittle design by skipping writing DPB entry altogether
if timestamp is invalid.

Fixes: 86caab29da78 ("media: cedrus: Add HEVC/H.265 decoding support")
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/staging/media/sunxi/cedrus/cedrus_h265.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
index 1afc6797d806..687f87598f78 100644
--- a/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
+++ b/drivers/staging/media/sunxi/cedrus/cedrus_h265.c
@@ -147,6 +147,9 @@ static void cedrus_h265_frame_info_write_dpb(struct cedrus_ctx *ctx,
 			dpb[i].pic_order_cnt_val
 		};
 
+		if (buffer_index < 0)
+			continue;
+
 		cedrus_h265_frame_info_write_single(ctx, i, dpb[i].field_pic,
 						    pic_order_cnt,
 						    buffer_index);
-- 
2.37.1

