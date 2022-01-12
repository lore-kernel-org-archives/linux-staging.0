Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237552C82
	for <linux-staging@lists.linux.dev>; Wed, 12 Jan 2022 15:40:19 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id k21so9723090lfu.0
        for <linux-staging@lists.linux.dev>; Wed, 12 Jan 2022 07:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7YzcHELoQHE6lsWBBlYzNlfti5+qLJvr6LQTidmKO20=;
        b=A/K8h4Hb+/kmC14dRYp4GUa5XZrjznZgoK+QJ0/eZYRVzxAZ4YrO7RFViyjOu6tYa+
         NL224hlp/f2CwFEh49nizaxrbPFUPvL6ClidPqYzGLm8J4qOH1PQM6Y2GdGkGZ6R7fzE
         Vxl0Fk2Oz57Pn0WIpYO6iPijYsDktxfEAmNDuEZG02KBB2wv7OJtUaYAx8GJmCgYzYcf
         jsgcLDI+eQwa2CSwDxUl+ccEJVip92Y38PgBpbBYBbxmax7S/2KR6fc16FxhSvXfGEWw
         8kIPbJX1dkqLt2+yN6iG5ABRZCt3fP/CXHpwes6uHzSt87l2zHz4WRO7tG9oYE5SxLua
         i9xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7YzcHELoQHE6lsWBBlYzNlfti5+qLJvr6LQTidmKO20=;
        b=CvU9QdKRmaSGbO6UK+5XtuVKfN7C5wN2bXfi5ANYL3krrU688s5hSnh8Gep/m2Q0wY
         bSw1oAxtwXSaifwQytKnuUkW4efhvE8k5CixlHEftfjAy0m1jJ2jWiHBbEfiKYr1WEiB
         PC2ZEpCXpe4YbwrOky7wnR0noXECizzjKOBUwqQMPx6Vpbmz0x+dFrxOzqupDIQzb5QY
         vjwqmmSd+V/OWnUT58FQjL/WEspQ/g43d3pAOKBeUJsb7ALjFVoHwg+VFrjCRvFbbb+j
         CAliABlpajWVLk379yIbQ8Szo2oxhyKb3PvU/4IZlHAC/gkLpt9/SLoNlZwwynUmG5wW
         iraQ==
X-Gm-Message-State: AOAM531hm92Re7T0wO56RGcgcVsxlHkSnaDWHCi63KX3AHf0JYDofTvX
	bV/gxw2k5yy2xRWxUnEeweE=
X-Google-Smtp-Source: ABdhPJwOEEebyuP7EAEmCPtKjHEQiyeb0fgrZNYFW9s4PnlrOT82YWv562fvSljJ0XzY3hXketcblw==
X-Received: by 2002:a2e:8695:: with SMTP id l21mr76627lji.452.1642002017185;
        Wed, 12 Jan 2022 07:40:17 -0800 (PST)
Received: from localhost.localdomain (94-29-62-108.dynamic.spd-mgts.ru. [94.29.62.108])
        by smtp.gmail.com with ESMTPSA id f27sm20173lfk.266.2022.01.12.07.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jan 2022 07:40:16 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Add V4L stateless video decoder API support to NVIDIA Tegra driver
Date: Wed, 12 Jan 2022 18:39:50 +0300
Message-Id: <20220112153952.1291-1-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support V4L stateless video decoder API by NVIDIA Tegra decoder driver.
Tested using GStreamer [1] and libvdpau-tegra [2].

[1] https://github.com/grate-driver/gstreamer/commit/b8509bdbb69b534e61419ea1798f32f9ad2f3597
[2] https://github.com/grate-driver/libvdpau-tegra/commit/f822e95911e5e0c39f8ba19f843ddc1e0138d5ce

Dmitry Osipenko (2):
  media: staging: tegra-vde: Factor out H.264 code
  media: staging: tegra-vde: Support V4L stateless video decoder API

 drivers/staging/media/tegra-vde/Kconfig       |    7 +
 drivers/staging/media/tegra-vde/Makefile      |    2 +-
 drivers/staging/media/tegra-vde/h264.c        |  988 ++++++++++++++++
 drivers/staging/media/tegra-vde/h264_reader.c |  264 +++++
 drivers/staging/media/tegra-vde/v4l2.c        | 1013 +++++++++++++++++
 drivers/staging/media/tegra-vde/vde.c         |  700 ++----------
 drivers/staging/media/tegra-vde/vde.h         |  129 +++
 7 files changed, 2487 insertions(+), 616 deletions(-)
 create mode 100644 drivers/staging/media/tegra-vde/h264.c
 create mode 100644 drivers/staging/media/tegra-vde/h264_reader.c
 create mode 100644 drivers/staging/media/tegra-vde/v4l2.c

-- 
2.33.1

