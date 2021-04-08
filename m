Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B770E29CA
	for <linux-staging@lists.linux.dev>; Thu,  8 Apr 2021 14:07:49 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id x27so918147qvd.2
        for <linux-staging@lists.linux.dev>; Thu, 08 Apr 2021 07:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=6fSIQirtWShuMIqpJMly6hnk0nfAVM8QytarwMk1/LU=;
        b=oHXWP2bGqx/WEx+RNKLuU6bEMQt589jw9z42sIvZwxkecxAYroGAJMwMfzU7F7U+J2
         OuvQR0a5x0SfkcZBOqQoE03rwQK6v/OAFe7ckWiPCodFbKCPxEw9f6wpepmrCq8ehd/A
         4rPN0M7qmkKQ2ZNjSclrlXWkNmXdhRPfdBe3wW4KGdiJGKugG4WWnbmO3Y2QmFEp4thI
         1eHLH8vpeflGx3C3iNw4NBBgwL7yillA29nUnKxktcfXx799Kl5ExVkeEiMblWtucd2B
         h8s7hJPzrmXutsRWj6SkNjafvQujSuKt61zZUE3fhx5R5YWAfC3c+DmilXoO78D0Slrl
         Vk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=6fSIQirtWShuMIqpJMly6hnk0nfAVM8QytarwMk1/LU=;
        b=Sprv1SbsUPGYHZrARz0un0+J1IOwmEHHsCPi6xRwyBryYzmzHe1RhVokSfMy1HbL/1
         tydlKiVnhk+T5YpNOGZevwltB0fHAB1QwakCli6v8HHF4Sf7NJIbT3Lzkvn5KbNgWyDR
         w7nL4O1JLKKi6EYNfANbtM+syLcdktGNHIlAQxVmXF/ENYgcpD2kUHJpfpHviJx+rQtJ
         hkYc9jfJEva2kUjdWCihEE13uqji9eLzEGRO/q6P0Pru2xHPbO4K9NW7KQv0w0SxZg3H
         kbtYqEVjO51Y7F9ssecUug1SWPi61pR9Psok4RRiuB8eVANlK690UmB4wcXirSFZVFJj
         vtWw==
X-Gm-Message-State: AOAM5302AHF5tFsb9fJRM9tW6Dr/YFKiqzGJ0Bfwyejda9nt3K9AGS3r
	ogmZn0BzOHk2h0ZePRYO/hg=
X-Google-Smtp-Source: ABdhPJz68eslT7UjXEATT3L19+JElDT/v5Keuk8rtceg9B2IqGxgBg3KFs5ciq+AkeTgrVZm0Z/URg==
X-Received: by 2002:a0c:bd25:: with SMTP id m37mr5407569qvg.17.1617890868905;
        Thu, 08 Apr 2021 07:07:48 -0700 (PDT)
Received: from focaruja ([2001:1284:f013:b099:175e:8b29:c386:d20e])
        by smtp.gmail.com with ESMTPSA id b9sm17761584qtx.38.2021.04.08.07.07.48
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 08 Apr 2021 07:07:48 -0700 (PDT)
Date: Thu, 8 Apr 2021 11:07:46 -0300
From: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To: Ezequiel Garcia <ezequiel@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH 2/2 v2] staging: media: hantro: Align line break to the open
 parenthesis in file hantro_mpeg2.c
Message-ID: <8209d15ab3a8391b74939cb942daffc556d72942.1617890467.git.alinesantanacordeiro@gmail.com>
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
 drivers/staging/media/hantro/hantro_mpeg2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/hantro/hantro_mpeg2.c b/drivers/staging/media/hantro/hantro_mpeg2.c
index 1d334e6..53a99a9 100644
--- a/drivers/staging/media/hantro/hantro_mpeg2.c
+++ b/drivers/staging/media/hantro/hantro_mpeg2.c
@@ -19,7 +19,7 @@ static const u8 zigzag[64] = {
 };
 
 void hantro_mpeg2_dec_copy_qtable(u8 *qtable,
-	const struct v4l2_ctrl_mpeg2_quantization *ctrl)
+				  const struct v4l2_ctrl_mpeg2_quantization *ctrl)
 {
 	int i, n;
 
-- 
2.7.4

