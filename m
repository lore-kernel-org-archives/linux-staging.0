Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6ADA17DB
	for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 10:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h3OQzQ9D"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1e9d3cc6e7aso1699312fac.2
        for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 03:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697971262; x=1698576062; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ULEzVLtQ2S1zar/fvv2bvXuBMfVambqe7uOvKdP1z6k=;
        b=h3OQzQ9DxrEqk2ViBgqs+5dInwqx5P9NSg6+i3ZahaQVbKDpRfdiyJPj35GW+gwUSs
         yP41cVsh3vZisfpDr+WEdYlJTNNN4MBIYW4LceQZPfFIitGZcz+wMueNcI5psfmB0QOo
         WiDgozQIcKMi0iwt8kIwTeAw0u7XaVo94kL89qGyG89sAwenliLQqWoRL7k6YhI8wfC0
         9GpFtErNenBrtokIgkqag5vP8TRejL7/ANlsXfOf0fCDez1xgm0mvmKaUXKPuvfG3tTE
         re06XYIGGvsbNpHcQ+8k2TKzPXz++PfIgdCmCP8K0JXOBmQJSzkjzWvnVusnImSkpkxd
         p3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697971262; x=1698576062;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ULEzVLtQ2S1zar/fvv2bvXuBMfVambqe7uOvKdP1z6k=;
        b=gjxobdm5uO3AePC4iwBc3apND1TycZ6kS10O5R72WjB0FzrXpBAM5thRqYoWQjvZrV
         RhGWP19p0+M5ZO87B2kQ9wNmAbJCgud0b5B2DzwuO7XcYt420vEvMGZa0K9N2bHoRW2K
         /bgReJUuqlD80hR0+eMrNwbHn3Wn4wLSx3pNxGLR0ECQmm2HxNT08O+oj8WuNFOEqO69
         dSgW2JLtsGwwXE2UGZ1xizT1L2fjLViqS1b+8aQL3zJwcptd1J5EQWCSWAGmXZ4/Wgy8
         EQyuRzaq1AFRmz2QLzFn7/kzPMbeawAjiYCUSbZbgUhILQObvNA21WtwYWhs7CgrtxLA
         h0VA==
X-Gm-Message-State: AOJu0YyS2IM7zE53zXM46I4EWQiUeKiwC78VwCH1gANe2gSPzmbIhWip
	LrA6ljfMS7A3RwqFIDSccSM=
X-Google-Smtp-Source: AGHT+IFgN6/PaswmdUmoqw2OMJKkJCHNeJYp4Hh9ngYJEtLETOtJL7TF5JNX82LpM4SpUYilirG8Tw==
X-Received: by 2002:a05:6871:800a:b0:1e9:f69a:1302 with SMTP id sk10-20020a056871800a00b001e9f69a1302mr6764712oab.48.1697971262607;
        Sun, 22 Oct 2023 03:41:02 -0700 (PDT)
Received: from ubuntu ([122.171.143.200])
        by smtp.gmail.com with ESMTPSA id o21-20020a17090aac1500b00277246e857esm5781338pjq.23.2023.10.22.03.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 03:41:02 -0700 (PDT)
Date: Sun, 22 Oct 2023 03:40:57 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: kumaran.4353@gmail.com
Subject: [PATCH 2/3] staging: greybus: Alignment should match open parenthesis
Message-ID: <57d7aa177d58384bcc178f6722a8f7f6af78a536.1697969950.git.nandhakumar.singaram@gmail.com>
References: <cover.1697969950.git.nandhakumar.singaram@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1697969950.git.nandhakumar.singaram@gmail.com>

Adhere to linux coding style. Reported by checkpatch.pl:
CHECK: Alignment should match open parenthesis

Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
---
 drivers/staging/greybus/camera.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
index feddceddffbb..40d3b8aca8f0 100644
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
@@ -377,8 +377,8 @@ struct ap_csi_config_request {
 #define GB_CAMERA_CSI_CLK_FREQ_MARGIN		150000000U
 
 static int gb_camera_setup_data_connection(struct gb_camera *gcam,
-		struct gb_camera_configure_streams_response *resp,
-		struct gb_camera_csi_params *csi_params)
+					   struct gb_camera_configure_streams_response *resp,
+					   struct gb_camera_csi_params *csi_params)
 {
 	struct ap_csi_config_request csi_cfg;
 	struct gb_connection *conn;
@@ -782,8 +782,8 @@ static ssize_t gb_camera_op_capabilities(void *priv, char *data, size_t len)
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

