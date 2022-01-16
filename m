Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2232CA2
	for <linux-staging@lists.linux.dev>; Sun, 16 Jan 2022 18:56:42 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id br17so49512360lfb.6
        for <linux-staging@lists.linux.dev>; Sun, 16 Jan 2022 10:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E7przyJ74L+AMDtXI8Jcieq0A93wliGwhbvxNvoTD3A=;
        b=JklcGAPkoV7myZdRwAogQa5AhJkzvVQuYb0qTOs5AAhnOotdpB+P+taD/7ataky29+
         gl/IcfW/CW46sx+2xdRXQ/nrRdaPPfpquOgz8D8CxmSghxH+doqGESxgm15n7rdq3LeG
         yMpiKAmvauteFZ9D40y0S24V61WbThsd0pgnIjl/dz0K5M74l1pMxtZ0cEkT4DEd99oG
         7kG6dYl28Ins1Lm+aSTd7p5iRQiM1uykgVXV8FQ2gtEre6PMOZiiQFu6fpGjriyL8SV3
         fJiO+hJN3w9ClN9buv+LbmL34axzeAbNgNb83DHsmArLKVzrrVjx8Iwc229iGXL56SNX
         GY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E7przyJ74L+AMDtXI8Jcieq0A93wliGwhbvxNvoTD3A=;
        b=I7qjPVoSJRaO+7JCNrDBXIeFrVPp34k+iTTgyK9zFXlpgEBYy5LNrpbW/CFJb8kTic
         wfusnoOgqR3ubjvTXmroCpWkJk0CfEFNvgleN6Vdu+T118Mfs+ukVxvtGUlknFKOCmNb
         UkslmxHuWVY8/2K0cfnrNQHKTcyNKYyKPCm/AiQx9XAE0SBUZP9AYiV9CaoXo2K9yTCp
         WBLNiSx2VzM156vT47uIDhyYriYq3jrP4xpR6c/u5ucYnQe+30/oOL9xHEW3rLKzaDSx
         7Fs8d25hQBvrifvsti9yGjIgHoxAizChrttZJNd7kfB+CGlNWamtrDkM76+8g9PqSg/w
         LWCg==
X-Gm-Message-State: AOAM532bnO3rBLLaEGsUQsOh3MYycqSd1f3kb8f55M3yUOu3T3nAiE3V
	GJKbS1UKrZJn5+/Ul1lKokI=
X-Google-Smtp-Source: ABdhPJx7UYqC3EGtAmGSFKE1yE4ONaTrL9rAQW/RZkbm/ERCynn/s/vb0T7QLpblskFLGMLFYUR7gg==
X-Received: by 2002:a05:6512:2521:: with SMTP id be33mr11449331lfb.276.1642359400266;
        Sun, 16 Jan 2022 10:56:40 -0800 (PST)
Received: from localhost.localdomain (46-138-227-157.dynamic.spd-mgts.ru. [46.138.227.157])
        by smtp.gmail.com with ESMTPSA id j2sm1179597lfe.18.2022.01.16.10.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jan 2022 10:56:39 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] media: docs: dev-stateless-decoder: Document frame type flags
Date: Sun, 16 Jan 2022 21:55:56 +0300
Message-Id: <20220116185556.10657-4-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220116185556.10657-1-digetx@gmail.com>
References: <20220116185556.10657-1-digetx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document that frame type flags must be set for the coded buffer.
Decoders, like NVIDIA Tegra h264 decoder for example, won't work
properly without these flags.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../userspace-api/media/v4l/dev-stateless-decoder.rst          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst b/Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst
index 4a26646eeec5..845f4481d34f 100644
--- a/Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst
+++ b/Documentation/userspace-api/media/v4l/dev-stateless-decoder.rst
@@ -271,6 +271,9 @@ A typical frame would thus be decoded using the following sequence:
           we are not sure that the current decode request is the last one needed
           to produce a fully decoded frame, then
           ``V4L2_BUF_FLAG_M2M_HOLD_CAPTURE_BUF`` must also be set.
+          ``V4L2_BUF_FLAG_KEYFRAME``, ``V4L2_BUF_FLAG_PFRAME`` and
+          ``V4L2_BUF_FLAG_BFRAME`` must be set if relevant to the coded
+          format.
 
       ``request_fd``
           must be set to the file descriptor of the decoding request.
-- 
2.33.1

