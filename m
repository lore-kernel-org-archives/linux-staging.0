Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622AD33D50F
	for <linux-staging@lists.linux.dev>; Wed,  7 Jan 2026 15:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767798576; cv=none; b=KholPmvqc4mjk7ddyHlVgFYhZk2uLKOqOZA97QhBRU7ZC2Nb/GhZ0vrasKHgni/D5IY3BAFj2oqeiTOayvctNRf6LA73QsvwkekDpL/T6zwbWd7VHB/3MjaL8YNTN7lUc51aQw68cIRFUDp+oay0z9FQrIPK+3VCn3LLWjnNrsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767798576; c=relaxed/simple;
	bh=iGThI7AMvpXUH2QvGeoBUTMOmlzpo8uINvbPcxu0oHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=vFvggd7G1FaajPG8Fi4FLRlbe34wl2hHQn6ofBmA+vB2iEPMGnMw0+bQAIaN6ocIaV+qdK3fNbcpEN7Qx0ThaoXd8s/lbdcYDvCxqcBL9T/rm2rxQdDT/ggbZbNGNkxXHFT/0Rg21bo5sS1/al4tKL3C2hOGG2tKQqO6+3VNxAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bCDBDJot; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCDBDJot"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7b9387df58cso2565203b3a.3
        for <linux-staging@lists.linux.dev>; Wed, 07 Jan 2026 07:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767798574; x=1768403374; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=839scXuIahBjk14ZPBwF1ot2Ofseckln89nJ0huuhEU=;
        b=bCDBDJotZf8buL797LGPdmcC+FwHo1jqexyDENcHxC8o84wF99fl1KjayRwbGGpk8e
         zt0lIVenc+Zk/xJjMLeSAbnt/WhtwvlVqH4C61Dfl+ldIwO/LdaFNTSAiGmcExe6HdXh
         2c5nYYLay/FxDwxqFJaFp/gyNkDaK6G40ttCJI47Hg9AV9CHrDDsBZ4XAtaFmKAevgnH
         1SmxYtDEMC5nxGMywy9UTo2uK2f4Y4I+rtP+KccblqRXOAjpPeFvEyUjPU2GhU4tmcw0
         zkJokSDuH8OyVOX+ByPdXfT6nVMPvXOfv/zZLWfpiCmUaTaMyEYSu63DrzsWFbde+P/D
         4NVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767798574; x=1768403374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=839scXuIahBjk14ZPBwF1ot2Ofseckln89nJ0huuhEU=;
        b=kdsswHjLzggWaeI16ugyNG1A9v3BjkHFDH7xqhIiDUqNPW13IIgdhvpwk7G8MB9W79
         Pe90Io3GHmKNNlwpXG1PTXiLDgXVyNLfpl0kyiteScDR69GmlNOcumZKUgqk1EztDpyQ
         DawQi4xnTytaEzGgvuGH0b780vBq2kmuzkqupklVtC923Wyvli9Hr/coRMRNPF4Iatj5
         G+NDfA8hoU9LsURyLEyqpgcniSeimL+qnxw9xC5SP4IVEwYpF5AqdheXJyqh0LzHfq7Z
         7EpMnvbASUFkzbxjIK+tvjblWaLUmgaYwd5B7N08XskHM23Lq5KF5OEEdQZ+V9xr5Al5
         9ZRA==
X-Forwarded-Encrypted: i=1; AJvYcCVK6KSkh+XMY62E38BsxtL4XLkD7UjuUv+5Y00kjsCmACFd594w9BLnAYn3ZLgCGlFdXJjxcK79Wubt9AQi@lists.linux.dev
X-Gm-Message-State: AOJu0YxMZMl3Xkik5znAoU3093WCc+j5PZvyS9Mt59uQ+876lmC1OFgs
	LKv4R2ej5KeSAwg/mihYdC71vbZu4hOPPVPkDbszfMbey7PJLkjwgEEN
X-Gm-Gg: AY/fxX4FGGNJp/trrsyNqgUvfE6sYC2eTOKx2xgmSwn3NhIepQYViARrMUK6hGGR0Ad
	RQiwQ75vHx5D/rMB8BTu5Ygqkpfuv1J6zxLl2UK6vjoBZv2+Jq3Mv7qcG1/Room+ydflfCCKSUH
	qp3+VNYfwuTf74vjCJ2iCMSFSGTSdNF3dDSzS+3XHLjcaSllcIftUA9z3kyHapsWSi5fFIk4s/z
	g6BJg9XOU4X4OQwVjtCn27gP4vzHIaOq18BmuKarfloXS5bOf3NaEydb5CNr24JV6mE8FuqRMQO
	P0pXqry0Lt07IYklkCh7kW6vJH4yjTrnqWfOKwypCSmXUD1HNlG3IGVMEaTaMDPNYc9f7RAR9oZ
	nt8krFP68LVcTrsKQiP/A8CKbGHzkKrvrr5JC1LnpkaZTiOSnjLjk1LlJ2hB+4lV11aY2Y3/rel
	ZZX7nUvXm1qeM=
X-Google-Smtp-Source: AGHT+IHBpXqkh/7RGbwjPDPLci2dCtXCz7QKcOwf/IAx50TXMsFMeoxMZ4/+sP8T0Bj6SQUlodTgPg==
X-Received: by 2002:a05:6a00:f04:b0:7a9:c21a:559a with SMTP id d2e1a72fcca58-81b7d86249cmr2486687b3a.8.1767798574470;
        Wed, 07 Jan 2026 07:09:34 -0800 (PST)
Received: from karthik.. ([43.247.159.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59df961sm5246114b3a.47.2026.01.07.07.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 07:09:34 -0800 (PST)
From: Karthikey D Kadati <karthikey3608@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey D Kadati <karthikey3608@gmail.com>
Subject: [PATCH v4 2/3] media: atomisp: consolidate statistics buffer allocation
Date: Wed,  7 Jan 2026 20:38:57 +0530
Message-ID: <20260107150858.79818-3-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107150858.79818-1-karthikey3608@gmail.com>
References: <20260107150858.79818-1-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor atomisp_alloc_css_stat_bufs() to use a new helper

function atomisp_alloc_stat_bufs_list().

This reduces code duplication for allocating 3A, DIS, and

metadata buffers and centralizes the allocation loop logic.

The helper returns the actual error code on failure (instead of

hardcoded -ENOMEM), triggering the existing cleanup path in the

caller which correctly frees any partially allocated lists.

Signed-off-by: Karthikey D Kadati <karthikey3608@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 127 ++++++++++++------
 1 file changed, 85 insertions(+), 42 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 5c0a1d92b..c81773a75 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -678,13 +678,82 @@ static int atomisp_g_fmt_cap(struct file *file, void *fh,
 	return atomisp_try_fmt_cap(file, fh, f);
 }
 
+static int atomisp_alloc_stat_bufs_list(struct atomisp_sub_device *asd,
+					u16 stream_id,
+					struct list_head *buf_list,
+					int count,
+					enum ia_css_buffer_type type)
+{
+	struct atomisp_s3a_buf *s3a_buf;
+	struct atomisp_dis_buf *dis_buf;
+	struct atomisp_metadata_buf *md_buf;
+	int ret;
+
+	while (count--) {
+		switch (type) {
+		case IA_CSS_BUFFER_TYPE_3A_STATISTICS:
+			s3a_buf = kzalloc(sizeof(*s3a_buf), GFP_KERNEL);
+			if (!s3a_buf)
+				return -ENOMEM;
+
+			ret = atomisp_css_allocate_stat_buffers(asd,
+								stream_id,
+								s3a_buf,
+								NULL,
+								NULL);
+			if (ret) {
+				kfree(s3a_buf);
+				return ret;
+			}
+			list_add_tail(&s3a_buf->list, buf_list);
+			break;
+		case IA_CSS_BUFFER_TYPE_DIS_STATISTICS:
+			dis_buf = kzalloc(sizeof(*dis_buf), GFP_KERNEL);
+			if (!dis_buf)
+				return -ENOMEM;
+
+			ret = atomisp_css_allocate_stat_buffers(asd,
+								stream_id,
+								NULL,
+								dis_buf,
+								NULL);
+			if (ret) {
+				kfree(dis_buf);
+				return ret;
+			}
+			list_add_tail(&dis_buf->list, buf_list);
+			break;
+		case IA_CSS_BUFFER_TYPE_METADATA:
+			md_buf = kzalloc(sizeof(*md_buf), GFP_KERNEL);
+			if (!md_buf)
+				return -ENOMEM;
+
+			ret = atomisp_css_allocate_stat_buffers(asd,
+								stream_id,
+								NULL,
+								NULL,
+								md_buf);
+			if (ret) {
+				kfree(md_buf);
+				return ret;
+			}
+			list_add_tail(&md_buf->list, buf_list);
+			break;
+		default:
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
 int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
-				uint16_t stream_id)
+				u16 stream_id)
 {
 	struct atomisp_device *isp = asd->isp;
-	struct atomisp_s3a_buf *s3a_buf = NULL, *_s3a_buf;
-	struct atomisp_dis_buf *dis_buf = NULL, *_dis_buf;
-	struct atomisp_metadata_buf *md_buf = NULL, *_md_buf;
+	struct atomisp_dis_buf *dis_buf, *_dis_buf;
+	struct atomisp_s3a_buf *s3a_buf, *_s3a_buf;
+	struct atomisp_metadata_buf *md_buf, *_md_buf;
 	int count;
 	struct ia_css_dvs_grid_info *dvs_grid_info =
 	    atomisp_css_get_dvs_grid_info(&asd->params.curr_grid_info);
@@ -695,37 +764,20 @@ int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
 		count = ATOMISP_CSS_Q_DEPTH +
 			ATOMISP_S3A_BUF_QUEUE_DEPTH_FOR_HAL;
 		dev_dbg(isp->dev, "allocating %d 3a buffers\n", count);
-		while (count--) {
-			s3a_buf = kzalloc(sizeof(struct atomisp_s3a_buf), GFP_KERNEL);
-			if (!s3a_buf)
-				goto error;
-
-			if (atomisp_css_allocate_stat_buffers(
-				asd, stream_id, s3a_buf, NULL, NULL)) {
-				kfree(s3a_buf);
-				goto error;
-			}
-
-			list_add_tail(&s3a_buf->list, &asd->s3a_stats);
-		}
+		if (atomisp_alloc_stat_bufs_list(asd, stream_id,
+						 &asd->s3a_stats, count,
+						 IA_CSS_BUFFER_TYPE_3A_STATISTICS))
+			goto error;
 	}
 
 	if (list_empty(&asd->dis_stats) && dvs_grid_info &&
 	    dvs_grid_info->enable) {
 		count = ATOMISP_CSS_Q_DEPTH + 1;
 		dev_dbg(isp->dev, "allocating %d dis buffers\n", count);
-		while (count--) {
-			dis_buf = kzalloc(sizeof(struct atomisp_dis_buf), GFP_KERNEL);
-			if (!dis_buf)
-				goto error;
-			if (atomisp_css_allocate_stat_buffers(
-				asd, stream_id, NULL, dis_buf, NULL)) {
-				kfree(dis_buf);
-				goto error;
-			}
-
-			list_add_tail(&dis_buf->list, &asd->dis_stats);
-		}
+		if (atomisp_alloc_stat_bufs_list(asd, stream_id,
+						 &asd->dis_stats, count,
+						 IA_CSS_BUFFER_TYPE_DIS_STATISTICS))
+			goto error;
 	}
 
 	for (i = 0; i < ATOMISP_METADATA_TYPE_NUM; i++) {
@@ -736,19 +788,10 @@ int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
 				ATOMISP_METADATA_QUEUE_DEPTH_FOR_HAL;
 			dev_dbg(isp->dev, "allocating %d metadata buffers for type %d\n",
 				count, i);
-			while (count--) {
-				md_buf = kzalloc(sizeof(struct atomisp_metadata_buf),
-						 GFP_KERNEL);
-				if (!md_buf)
-					goto error;
-
-				if (atomisp_css_allocate_stat_buffers(
-					asd, stream_id, NULL, NULL, md_buf)) {
-					kfree(md_buf);
-					goto error;
-				}
-				list_add_tail(&md_buf->list, &asd->metadata[i]);
-			}
+			if (atomisp_alloc_stat_bufs_list(asd, stream_id,
+							 &asd->metadata[i], count,
+							 IA_CSS_BUFFER_TYPE_METADATA))
+				goto error;
 		}
 	}
 	return 0;
-- 
2.43.0

