Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C869030BB9D
	for <linux-staging@lists.linux.dev>; Mon,  5 Jan 2026 14:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767625108; cv=none; b=eULOq3lF6Tfi9Vearc+XmJOiG4nfOuYqplD+AzKV8ZAKG2nmEsOH0JHDMS/LN+8c+QgT38FxXU7pbmFIX4rHPTfnxeCJ5dCW4hY42WMZZXfWYasgZ9L7J8qFex1IRUHXfYTIvY3VZo3tBHSFZtSVZqddXrT2LJTzfDrCLu91Fa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767625108; c=relaxed/simple;
	bh=7aFJtkTCn/RUyXBqDN5A8Rl1FrpL/MQORLd7fWn3cOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fAxNeAi/M94DYjQVUUTKUdT29trplTRLK915zIQ1oXhAS8PbiOZsT1gulkZPFose5qrBotRHpIt6JxSaK5A3GiuFeRntdYNfbEW1K5oV3EXqUAQg+LFy4g3uu5gRJhTW2igcqodg3NrfHY5ExcQJyURItquvJiV7Hav1Tm5WiBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KnFVAxfo; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KnFVAxfo"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-29efd139227so186036295ad.1
        for <linux-staging@lists.linux.dev>; Mon, 05 Jan 2026 06:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767625106; x=1768229906; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0L8w8zzA7n7ZIE7wj1Nj7dJ97iLU993N1NE76Z8Jakg=;
        b=KnFVAxfoIDgnGe1v4z7Og0VShs9DTklwm62xOnzpUOKf2GjLjUIbYNGEeCljmL1n39
         fyARRbZ58+Qxj7mFvWWUZnXdNzEOGyChmH1HWpTK9chT5KIkdkYY5C1gfDexIv9auxa5
         wwGGBSLQD3ctZBZdZHZFbmxW/94TYfR5CFr4I5zK+MUKByCIR9AadxurougA+ODW1lNb
         tVuzEq+e+9oW2QN96tWU7kXiU1W5frdO6eGMuffDEOQUJG4xyMnUXXCX3JHPYvGpkYCg
         J+MblnBAtVi9Kea8z0CoICDFIjiDM/8PsqDeLfSoL4qTSmnh/QCkMDLOgg8hP7j6H9BN
         SGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767625106; x=1768229906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0L8w8zzA7n7ZIE7wj1Nj7dJ97iLU993N1NE76Z8Jakg=;
        b=ZSCGj+v6aAtVy+HreobUUjJ4GMAg6ndXswmAb1Yag/ZNbCZCwhcSo/3kX/KOX6zKH1
         lfDXnJkiqYbiv4tboOx1SFtHur157iYE5NjeN/kLM1VRiGfN1i8rV1SwWLmhiroNXlMZ
         IJFS2cy/DIk+IAs3L0XE1r2Y3R38vtMGRbFLgZ7QPqJZhGWVbqMUABytW+KTC2iXdWNl
         fbE7+1AEOCxs5UP/EW6jo4VACcodJt9X+gq02CJtqY7TVo2TmRjLDI4VAorf4EgJy78l
         32e04Wqrm29kbRkATXd6M4zrkVQxn76eXCgCd5NXN4/I5qIVcbY7/sZ66mEm6ajPkrNl
         iP4A==
X-Forwarded-Encrypted: i=1; AJvYcCWJvkNB+kj3ik3rvukc3Qb2aMWh/eZ+md13K3WOGFN2h4y6/KQ2YLJGe48av9YZzQ1NPKJz0vk4vWMcNIVA@lists.linux.dev
X-Gm-Message-State: AOJu0Yzh0MSTnSXIMJ2mtK+nRd4yhi499wVILUEbIgVqZDU4krTJ/6pA
	JiS18gMk9LMT/wgNjGI56YfTj8bs2rKqW8TOS30bapgicYmGr6cGZ0Tp
X-Gm-Gg: AY/fxX5E/fj6CgQKjyN0OwGojLW2PK0eLJJp7E/s6AbIrrRe3zVViAGBkkN5Pr8uSi4
	uWGM2BNdiqigYNN+0sT17ZUgJKtcQup6fyyZZ+ohtw3Yc7iXJkRth6PlCBTdJl9LHtIwEpgoHRh
	LItGMz3ynkR4IT/VhK1C8V3zaQdGRDAJZePWBELXghnCtaz0Xb/CnDrAbvFl1yhViQfDdMhDbBo
	z+3n5VHtEAIm5dKwpbPDAUWQwBFR74Ww5sxVbx3ADlkE+ZGb2bHNcDkwIpcAWe8quAy3oFEGFLM
	6EsqOI5xOwBKV8EIScBTNtB6uD4noTYCX7Bg9o98O8YCsmgwKYQe4Y5kpRvGj8GUl1xBRg7Xm45
	P17cqs+o4eIhd0EhFNRZNVC7ECEGs5QDtPyQMJP2w4foDZxhyWsoGg2D1+tPbSDUL3Ef7AaXr6Z
	tDR/fA++FtjJE=
X-Google-Smtp-Source: AGHT+IEThfma4vyAoTFD9Z1px96n831nFofd6uJzy0WpP50OzQzghORJxsBujiDHnCn4NZgVK1DF1w==
X-Received: by 2002:a17:902:cf0e:b0:297:f09a:51cd with SMTP id d9443c01a7336-2a3e2cbb55fmr472125ad.14.1767625106054;
        Mon, 05 Jan 2026 06:58:26 -0800 (PST)
Received: from karthik.. ([43.247.159.43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e2b81484sm715955ad.78.2026.01.05.06.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 06:58:25 -0800 (PST)
From: Karthikey D Kadati <karthikey3608@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey D Kadati <karthikey3608@gmail.com>
Subject: [PATCH v2 2/3] media: atomisp: consolidate statistics buffer allocation
Date: Mon,  5 Jan 2026 20:27:23 +0530
Message-ID: <20260105145724.37305-3-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260105145724.37305-1-karthikey3608@gmail.com>
References: <81e2d12c-342b-4b88-88a0-3e24115541aa@kernel.org>
 <20260105145724.37305-1-karthikey3608@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor atomisp_alloc_css_stat_bufs() to use a new helper function

atomisp_alloc_stat_bufs_list().

This reduces code duplication for allocating 3A, DIS, and metadata

buffers and centralizes the allocation loop logic.

The helper returns -ENOMEM on failure, triggering the existing

cleanup path in the caller which correctly frees any partially

allocated lists.

Signed-off-by: Karthikey D Kadati <karthikey3608@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 123 ++++++++++++------
 1 file changed, 81 insertions(+), 42 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 5c0a1d92b..9e572b3e6 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -678,13 +678,78 @@ static int atomisp_g_fmt_cap(struct file *file, void *fh,
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
+
+	while (count--) {
+		switch (type) {
+		case IA_CSS_BUFFER_TYPE_3A_STATISTICS:
+			s3a_buf = kzalloc(sizeof(*s3a_buf), GFP_KERNEL);
+			if (!s3a_buf)
+				return -ENOMEM;
+
+			if (atomisp_css_allocate_stat_buffers(asd,
+							      stream_id,
+							      s3a_buf,
+							      NULL,
+							      NULL)) {
+				kfree(s3a_buf);
+				return -ENOMEM;
+			}
+			list_add_tail(&s3a_buf->list, buf_list);
+			break;
+		case IA_CSS_BUFFER_TYPE_DIS_STATISTICS:
+			dis_buf = kzalloc(sizeof(*dis_buf), GFP_KERNEL);
+			if (!dis_buf)
+				return -ENOMEM;
+
+			if (atomisp_css_allocate_stat_buffers(asd,
+							      stream_id,
+							      NULL,
+							      dis_buf,
+							      NULL)) {
+				kfree(dis_buf);
+				return -ENOMEM;
+			}
+			list_add_tail(&dis_buf->list, buf_list);
+			break;
+		case IA_CSS_BUFFER_TYPE_METADATA:
+			md_buf = kzalloc(sizeof(*md_buf), GFP_KERNEL);
+			if (!md_buf)
+				return -ENOMEM;
+
+			if (atomisp_css_allocate_stat_buffers(asd,
+							      stream_id,
+							      NULL,
+							      NULL,
+							      md_buf)) {
+				kfree(md_buf);
+				return -ENOMEM;
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
@@ -695,37 +760,20 @@ int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
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
@@ -736,19 +784,10 @@ int atomisp_alloc_css_stat_bufs(struct atomisp_sub_device *asd,
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

