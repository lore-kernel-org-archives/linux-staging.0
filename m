Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BB33DFE5
	for <linux-staging@lists.linux.dev>; Thu, 19 Oct 2023 21:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dCbdqtk2"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1c9e072472bso1049145ad.2
        for <linux-staging@lists.linux.dev>; Thu, 19 Oct 2023 14:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697751595; x=1698356395; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bzd/mX+G6RAAmLpCVFwycoQWQ7+3hjDN3n5S0L3+DGw=;
        b=dCbdqtk2u18ros0UKWtkTHe3dIiEkDrSZ+if8yNgZkj+zlMYho5QEbzjH7OBgrK4Am
         GPTkR4NpOo10/SJB0WSZU/A6Bb195Di6FF8fhGv0AfDBHrJzV9pu6BoZmJQAKYdblc2/
         Mna111C6A3K5PvS6aY8R5GvcPRbMBxvDLXedVwlI3j9Cl6nomyrHN0VCMGq50rHbAZ8f
         To2NBjvKsAgtUQ7tnReMxkrDs4mJQMv+/i8ld5TC+47YFTfHrRy33kcP805alDnoqe3E
         jjvgk3Jrirr/msVqjdrvtSAi+jVvYJkqlHs17pJOLYjk5zQCFkPnNE4NjqrQsq1s8RjE
         bWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697751595; x=1698356395;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bzd/mX+G6RAAmLpCVFwycoQWQ7+3hjDN3n5S0L3+DGw=;
        b=InIgcOpaxCqlE0cK7xe8edJxA3AY1e0Smv/fz8FBuGDIo7xoKLSXmnYxW1A/paK8ix
         GAQU1L1Px9wAZZPbQCkvdPXI0yG8Q3iX8O1vws70j/mOmZ0xGK/0TeBwIhZOcih63qPq
         ZLtkjLow1mMYukPPGBTDDtR5ACp13DqehaGeiigKhuAz5ZoJN76HRlLe7I4eOxB6mnzA
         Y+sKVUPEklGIcG8D3WJ+qkCaJiYaiyeonQg3FWcWDD7HSjQpXstiwAjANKlkfCd0oOXN
         CcaGCaESxSyMrU220WkoitHKrJw7eAu2ZvJdmc/h6ysB8B+88caNHmf1PAWNYubaf6rF
         m/pw==
X-Gm-Message-State: AOJu0YzvFBl1inAn1rA0lt88cyoKkOBGVcC+CmMgKDDvWmOooylV6G2N
	JiO2LR5qnnmH88fF2phEdkI=
X-Google-Smtp-Source: AGHT+IEew7sjFWHoyX6Y6D3tw3dxh1tKP/k/G09xg9iUhwupWSCDOHHKl3pt+RSE+yOl7VXPtuGVCg==
X-Received: by 2002:a17:902:eb84:b0:1c3:62c4:7f12 with SMTP id q4-20020a170902eb8400b001c362c47f12mr176220plg.5.1697751594598;
        Thu, 19 Oct 2023 14:39:54 -0700 (PDT)
Received: from ubuntu ([122.167.60.51])
        by smtp.gmail.com with ESMTPSA id jh4-20020a170903328400b001bb9bc8d232sm182694plb.61.2023.10.19.14.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 14:39:54 -0700 (PDT)
Date: Thu, 19 Oct 2023 14:39:49 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: greybus: Alignment should match open parenthesis
Message-ID: <20231019213949.GA2922@ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Adhere to linux coding style. Reported by checkpatch.pl:
CHECK: Alignment should match open parenthesis

Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
---
 drivers/staging/greybus/camera.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
index cdbb42cd413b..405c8e78aa72 100644
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
@@ -267,8 +267,7 @@ static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
  * Validate the stream configuration response verifying padding is correctly
  * set and the returned number of streams is supported
  */
-static const int gb_camera_configure_streams_validate_response(
-		struct gb_camera *gcam,
+static const int gb_camera_configure_streams_validate_response(struct gb_camera *gcam,
 		struct gb_camera_configure_streams_response *resp,
 		unsigned int nstreams)
 {
@@ -378,8 +377,8 @@ struct ap_csi_config_request {
 #define GB_CAMERA_CSI_CLK_FREQ_MARGIN		150000000U
 
 static int gb_camera_setup_data_connection(struct gb_camera *gcam,
-		struct gb_camera_configure_streams_response *resp,
-		struct gb_camera_csi_params *csi_params)
+					   struct gb_camera_configure_streams_response *resp,
+					   struct gb_camera_csi_params *csi_params)
 {
 	struct ap_csi_config_request csi_cfg;
 	struct gb_connection *conn;
@@ -783,8 +782,9 @@ static ssize_t gb_camera_op_capabilities(void *priv, char *data, size_t len)
 }
 
 static int gb_camera_op_configure_streams(void *priv, unsigned int *nstreams,
-		unsigned int *flags, struct gb_camera_stream *streams,
-		struct gb_camera_csi_params *csi_params)
+					  unsigned int *flags,
+					  struct gb_camera_stream *streams,
+					  struct gb_camera_csi_params *csi_params)
 {
 	struct gb_camera *gcam = priv;
 	struct gb_camera_stream_config *gb_streams;
-- 
2.25.1

