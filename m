Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F60E70
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 12:24:25 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id q3so5506509qkq.12
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 05:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=jyczLaaY0sNtj0e3TtnM4UT/9174zU+EdBPCktijCsc=;
        b=j5jCXHvdsR1dteY87/+g0UH9fhghNuLew4SUu5z4F6sFpuzDFvptdCQpIU5c+KJX2Z
         qz5j9KB1mWjOUdmD94iF0YNnvm27HsS96Xw1zm4ZhEyqBQXBqo1Ia0K2XImX6uwK/tf6
         THbpTjVdybP32fy6WU7ZhCIR1crEFcsW9oH8iXwSempQK127T6M17XwaUbwbMn/zdHAg
         Nsdoyus5WHesDPHiZ+ikmIqvJdmnpAih8wluIGB+R9iuR2UlWZ4CTS9rW9XbevQ03DYd
         GSbWWaLxehaFXPFnr+LMiDB3ziIvaes6doson4vO38jZ13TPCTvGcM57JRonbh4Q9x/V
         Bikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=jyczLaaY0sNtj0e3TtnM4UT/9174zU+EdBPCktijCsc=;
        b=SjXUN2Q52y1m/ecXOh+KLNTfwpDa+QHux58lTPliskTYwlI8hEvUKKf5y90ROLH3VU
         yX3IGILVacB20kNV/qy+tRHg/D09kwstZh46oAXN/49caY6NYrS+uCac/WFOcKMj6vKp
         8JTLBl/sVnFLlutR1muQC6d1ajatkuhZIxWPDe5K9cr4TjUwt3TKZvWU+bsxELGyuJVy
         U06ZPJXFfDKSeI/N6ZTjiOfTyAgIk0SqSfvxULVYfDFo3Pkzv/x4jQmOntCzpRebGZH5
         0oSA7y+RzOuk4jecC6sDrugnfpDHsC/Gn+ORZMyqu7Rb1p6s27PxxYGtkPQfFztgcIGz
         r2eQ==
X-Gm-Message-State: AOAM531HHsCCEvwLEtR5R26Dz6oxV6uCxXYmSSS4MqOoBNpH0PdE3Saz
	wZNRS6DifELQaaC16udW3fc=
X-Google-Smtp-Source: ABdhPJwJ36OigBAETDHN9/NWW7ajp0B5U0PqbIPQ3QUSqAAr9bYSTDaU/cLvvVHs7IakYpm2E5/E3w==
X-Received: by 2002:a37:a58f:: with SMTP id o137mr13175093qke.482.1617971064712;
        Fri, 09 Apr 2021 05:24:24 -0700 (PDT)
Received: from focaruja ([2001:1284:f013:b099:8056:1dc0:5a27:acd7])
        by smtp.gmail.com with ESMTPSA id x24sm1657962qtm.95.2021.04.09.05.24.23
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Fri, 09 Apr 2021 05:24:24 -0700 (PDT)
Date: Fri, 9 Apr 2021 09:24:21 -0300
From: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To: Ezequiel Garcia <ezequiel@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	alinesantanacordeiro@gmail.com
Subject: [Outreachy kernel][PATCH 1/2 v3] staging: media: hantro: Align line
 break to the open parenthesis in file hantro_hw.h
Message-ID: <03fb1d7b8066fd6fb6086fff18cf29b9afd9ac17.1617970550.git.alinesantanacordeiro@gmail.com>
References: <cover.1617970550.git.alinesantanacordeiro@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617970550.git.alinesantanacordeiro@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)

Aligns line break with the remaining function arguments
to the open parenthesis. Issue found by checkpatch.

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---
Changes since v2:
 - Rename the commit messages properly

Changes since v1:
 - Send patchset without the cover-letter
 - Rename the commit messages wrongly in the email subject only
 
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

