Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BCB6AC2;
	Mon, 24 Oct 2022 20:15:32 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id d26so7573639eje.10;
        Mon, 24 Oct 2022 13:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cnqNra0lgbLAKch8eagvznAxGId4NWgXejGlEDMRG8I=;
        b=lwrCsYSnWfTQh15cwQ7ueF8f2lHMOTa+mOmouTY1ExaPRtPNGsHigtjtgstssCXaYm
         ancy3xk6f/FVT7y7wCLjlA6BsuUUXeHs4ZHkH4SuIUD7KjjDO3846Vc1R0rPTSumc61v
         LalmebgrfMGEjsqMPtBCY00khGcDmd7uTUYZNzbsyXfw6011zIQHliWjCMom/eIGcTUU
         ldtE2WbEj0OpKk06UYAkVBBhrUbOw1UONE7L3m1ucx1O9OA076r1vNBjPrjoUCV+wnK3
         h//Ppkdlb5BCIptz5p+PM7yzrUGr+GOnMtaSUNN3xM3L67L+KB7CKZvV0Su+62ggUxKo
         0ZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cnqNra0lgbLAKch8eagvznAxGId4NWgXejGlEDMRG8I=;
        b=TxWRcqaXar6Axhm6agFUyz9QNR/ybtgT1z1huE02zpefCgi/ck5LPIkPTYmjNI7oIH
         vfNfkxBOBlALdCKM7KRWoHYLecofbGGpaj1pv/tSJe/GDYGK4dOeNRW1ckwwuI4QuOGJ
         7Gpzq8teYK54Cz2Mdmj6mLZdnJeHIHuBzp0Uz0cV216VKEhS6E0bAy1AjouVy7qTkkU0
         miOAa3A+ikCEJDv0HS19K9fv6TF4OXRDZFmaDuKQYJB6+ERjGF8voOs0ZG5K5OG7TA9/
         +ig0aKdonQWPBncmXz/QQnX2AjRLFvzuR8HJtvnhs9b0L4U3C1KErnf+lRGCfpPr6qXw
         bcQg==
X-Gm-Message-State: ACrzQf0vQPJAH9m4P7YS6nCaakTmJ5h5GuE/bkc5YAZwBNzoBHDW9UUx
	lG/jDPm7bQn5eanLyA0PK+Y=
X-Google-Smtp-Source: AMsMyM4Ycr2oU2oWv7YasBF3FD7v1Z17AUdjCIvRaf87Sh6hZnQbyMESFWwCBG86hp9Bd3BVL2ydTg==
X-Received: by 2002:a17:907:c03:b0:781:fd5a:c093 with SMTP id ga3-20020a1709070c0300b00781fd5ac093mr29229259ejc.89.1666642530469;
        Mon, 24 Oct 2022 13:15:30 -0700 (PDT)
Received: from kista.localdomain (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id op7-20020a170906bce700b0073d638a7a89sm332023ejb.99.2022.10.24.13.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 13:15:30 -0700 (PDT)
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
Subject: [PATCH 01/11] media: cedrus: remove superfluous call
Date: Mon, 24 Oct 2022 22:15:05 +0200
Message-Id: <20221024201515.34129-2-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221024201515.34129-1-jernej.skrabec@gmail.com>
References: <20221024201515.34129-1-jernej.skrabec@gmail.com>
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

