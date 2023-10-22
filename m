Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894802116
	for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 12:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DzPemMdi"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1c9d3a21f7aso19313215ad.2
        for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 05:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697976972; x=1698581772; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0+S2mdckSSp2Nfs5ye+ND5i2vKp9m6YBgPQvt8jtLlY=;
        b=DzPemMdiztvaZI6NpnqDXNGnYCmWwIITtP6L6Xz0iJDsDDZ155RdZEDwZ9hSpkxss+
         KCXiT7KuoJjeKacQeN5+zOYv68cT5f9ErlRYW1pJnzVBZrUJOXs2mVWzleAa+BoyLu7K
         AlWqecrOm6uZRsKcQ5Ie3YUOHu5YkTmpW1kCjzIuCG4pFiAYoqj42JIe+aFyA9avQ7BC
         5tLSGArLOTdiex41J1ukvPq23ZEB+9duKSDDOtKFdz+mjtNFN6PiRpbO3MAavVE8wce/
         qV+d88oJ5oVW/8b3iEmOP0MUd1rSsEzgLCmlCGnfUpvdl89cAlHqqGj5+5aOM/8wykNK
         9/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697976972; x=1698581772;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0+S2mdckSSp2Nfs5ye+ND5i2vKp9m6YBgPQvt8jtLlY=;
        b=Mxt+xKhgu1+DbAiWhPlnbtoW0F6sKiFZ7R1xZYOxEj6wa50/ad9j4wd8Qc8Ikq1Tni
         SW7WcKOdCu5t8vI3eGADeF4uvxOX9GgL7WCd8v9u0ZAK+4dMXdy2PLCNVBEosREgpWSg
         A88kz23iYJX+wLq35gDlIqvZhrdj+dQJIHm2iHqX4lYlsxayzbyKfRVOsY6wdxdubPPm
         G8WeHOBFYiKGFnM1a39H+PklEbEPxg8sfsfhfYkpM9J4sxVTS1nyWLC98oux1Gi9kkt0
         oAsVAWiQ1v4ZmC0Vva/SQwwt5zquiV9lpeAlt9V3DcxRErAcQ9GcZzO8vKWAFb0rXFV0
         C7jg==
X-Gm-Message-State: AOJu0YzgwB8xaJyEpHbWqzXHs2ntK1wuTMesvk4UImm/nd6ARdeELAun
	gIhAZs5tdxas/NRYylvIHEc=
X-Google-Smtp-Source: AGHT+IGjoR0YMcAj2F7zAWRDZOhI9k2JNW4ERSe30aG0pfFa024ofCeya2M+RkiNweOChf+FSqQW2w==
X-Received: by 2002:a17:902:e88f:b0:1c7:23c9:a7db with SMTP id w15-20020a170902e88f00b001c723c9a7dbmr6767428plg.26.1697976971794;
        Sun, 22 Oct 2023 05:16:11 -0700 (PDT)
Received: from ubuntu ([122.171.143.200])
        by smtp.gmail.com with ESMTPSA id n8-20020a170902e54800b001c9c879ee4asm4366495plf.17.2023.10.22.05.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 05:16:11 -0700 (PDT)
Date: Sun, 22 Oct 2023 05:15:57 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: kumaran.4353@gmail.com
Subject: [PATCH v2 1/3] staging: greybus: camera: Alignment should match open
 parenthesis
Message-ID: <d2630a16ff9eca40b03dcade63c197fdd5e5b78f.1697976302.git.nandhakumar.singaram@gmail.com>
References: <cover.1697976302.git.nandhakumar.singaram@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1697976302.git.nandhakumar.singaram@gmail.com>

Adhere to linux coding style. Reported by checkpatch.pl:
CHECK: Alignment should match open parenthesis

Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
---
 drivers/staging/greybus/camera.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
index ae49e37a87e9..6516e7efaab9 100644
--- a/drivers/staging/greybus/camera.c
+++ b/drivers/staging/greybus/camera.c
@@ -220,7 +220,7 @@ static int gb_camera_operation_sync_flags(struct gb_connection *connection,
 }
 
 static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
-		struct gb_camera_configure_streams_response *resp)
+				      struct gb_camera_configure_streams_response *resp)
 {
 	unsigned int max_pkt_size = 0;
 	unsigned int i;
@@ -378,8 +378,8 @@ struct ap_csi_config_request {
 #define GB_CAMERA_CSI_CLK_FREQ_MARGIN		150000000U
 
 static int gb_camera_setup_data_connection(struct gb_camera *gcam,
-		struct gb_camera_configure_streams_response *resp,
-		struct gb_camera_csi_params *csi_params)
+					   struct gb_camera_configure_streams_response *resp,
+					   struct gb_camera_csi_params *csi_params)
 {
 	struct ap_csi_config_request csi_cfg;
 	struct gb_connection *conn;
@@ -783,8 +783,8 @@ static ssize_t gb_camera_op_capabilities(void *priv, char *data, size_t len)
 }
 
 static int gb_camera_op_configure_streams(void *priv, unsigned int *nstreams,
-		unsigned int *flags, struct gb_camera_stream *streams,
-		struct gb_camera_csi_params *csi_params)
+					  unsigned int *flags, struct gb_camera_stream *streams,
+					  struct gb_camera_csi_params *csi_params)
 {
 	struct gb_camera *gcam = priv;
 	struct gb_camera_stream_config *gb_streams;
-- 
2.25.1

