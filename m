Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E3B6D0E
	for <linux-staging@lists.linux.dev>; Thu,  8 Apr 2021 14:07:46 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id v70so2249502qkb.8
        for <linux-staging@lists.linux.dev>; Thu, 08 Apr 2021 07:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rBvCDlUD9+QrMvuUFtxmfpbAHHnvTaccTwMtx3DApDw=;
        b=Oozl2fPn+qxC9SB8PVO+Mmcec6ecQ1nNUJL+42GibZJFjhqkkoVh16IIMtAKdo5NWB
         nHJCyci2Sg8pq/uDnihvClvSIADUJd21eq0YcZX7m63GilZuaa0JlqzXTZdFSBwnl0Iy
         1S/QxYArGZrXgaVSD+XGpekzl2n5+HO9/UKLhw8j71hoULuRDDzqR5sGSa/LrV8UDuJM
         LGaUoFznTQjnMWtiNNwWxBUfu7mvH/5IZ4zn1nKnahtx3/Wt4PEY/DqbgIQEEXC9kTK6
         l9sg6JHdMSOFeqqw2nVOtNMPf4Xsr5puzYtyfQhM5CMoEyU5KkH7fqQvIjzCPf1nwfDQ
         Ch0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rBvCDlUD9+QrMvuUFtxmfpbAHHnvTaccTwMtx3DApDw=;
        b=W0xm/sKvrdFazN84J05BkGmLdwKbtuERcsNr0n459P4PByTir8H+KxwPorZvFpF7jA
         n8PEaFKGjLCiI/04HXBRKkEiMjTbGBCzrva/95HRCbNiOI8REN6iANvKLpIF26kux8AD
         vxfd4CataoYilErgF+a+/9PFA3EXrmY6z3NqCjHwBsvWGigxJaBId9FWEfJvya42aZfW
         4NE9EmN0XGiEE3H+xMv9iURAD+nlZEREvhFXXsT98Cp97/JH0JlpAvH08oA0ZofMbC5j
         8asj2n+JKSODuHfWjTJzYDipo4zDNK0IZ9ShbTUavWcOgw4JfXOO6CitJcC8QE2FSz9a
         dRQw==
X-Gm-Message-State: AOAM533U5dq0BGqqs7sOs3QKy+b3Ctb74X7NkqEjkEbNqhw6rTjpxZaz
	wMYCE3Jz2IhrEdgua+vpOfo=
X-Google-Smtp-Source: ABdhPJwotZWtb7+KCPZTivBDHuiJkoTNviXwcKLjpzrfIppVm10NHQ6NnqoyrVSO8paIZpiNqu2jVg==
X-Received: by 2002:a37:b8b:: with SMTP id 133mr8407502qkl.401.1617890865340;
        Thu, 08 Apr 2021 07:07:45 -0700 (PDT)
Received: from focaruja ([2001:1284:f013:b099:175e:8b29:c386:d20e])
        by smtp.gmail.com with ESMTPSA id l6sm19069760qkk.28.2021.04.08.07.07.44
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 08 Apr 2021 07:07:45 -0700 (PDT)
Date: Thu, 8 Apr 2021 11:07:42 -0300
From: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To: Ezequiel Garcia <ezequiel@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH 1/2 v2] staging: media: hantro: Align line break to the open
 parenthesis in file hantro_hw.h
Message-ID: <1e6d73432d60dfb8bb3f7f2bd6bf3084091a2a39.1617890467.git.alinesantanacordeiro@gmail.com>
References: <cover.1617890467.git.alinesantanacordeiro@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617890467.git.alinesantanacordeiro@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)

Aligns line break with the remaining function arguments
to the open parenthesis. Issue found by checkpatch.

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---
 drivers/staging/media/hantro/hantro_hw.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index 34c9e46..a650b9c 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -207,7 +207,7 @@ hantro_h264_mv_size(unsigned int width, unsigned int height)
 void hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx);
 void rk3399_vpu_mpeg2_dec_run(struct hantro_ctx *ctx);
 void hantro_mpeg2_dec_copy_qtable(u8 *qtable,
-	const struct v4l2_ctrl_mpeg2_quantization *ctrl);
+				  const struct v4l2_ctrl_mpeg2_quantization *ctrl);
 int hantro_mpeg2_dec_init(struct hantro_ctx *ctx);
 void hantro_mpeg2_dec_exit(struct hantro_ctx *ctx);
 
-- 
2.7.4

