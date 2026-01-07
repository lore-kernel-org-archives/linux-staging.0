Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103D13321D7
	for <linux-staging@lists.linux.dev>; Wed,  7 Jan 2026 13:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767793758; cv=none; b=fKbzkKh+9d3ET/0fOmqKUK62ATWF2D1jw0ZbJhF433B0rZHdV5kFc2IFBlf2IoUOnEBt0vU6Fsn1N+pDdcXEZ5YGKUm0GiMT4QAmrtCPHVJd/RWrghAS1mIc1D8t2tcgYnPRqRL8v0t52b9eo11bJwY4pBvdjlRYFWqgitIZguM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767793758; c=relaxed/simple;
	bh=7aFJtkTCn/RUyXBqDN5A8Rl1FrpL/MQORLd7fWn3cOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gSB1QCAN/cPi5M05xUqrf0eymLc6AaeNdS9p2g9vu+t3S9XbIjrC0dZ9sZkRk/bT5uWinMLZq973hiDXSiKP/fkoKYN+AoONxNMqCDvoOzf1/zBLL6S73QsFnVpqvxlisIgQzyR87b96/8m9e9ffWsAgOwe9Vrtrf0Jpxw8ETsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gQNBqFL6; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gQNBqFL6"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a0a95200e8so13839255ad.0
        for <linux-staging@lists.linux.dev>; Wed, 07 Jan 2026 05:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767793755; x=1768398555; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0L8w8zzA7n7ZIE7wj1Nj7dJ97iLU993N1NE76Z8Jakg=;
        b=gQNBqFL6mTe1H1m7hex27UT35DRoGOREcxCTpd6407I/V3yvW+HHQ4NWZyJJWtcfhY
         WQ3HPEJ2s5XF6JmPA+A8Vz4ULmY1v85He8NEc6tG51PgV0O4N4z+kw/fyAjTn7au9F0O
         LXy/sBSnfkt4Mm3Mj6Izbni8NLrTGeYIMSYSsOp0TPu7HQi0Ta3JQ/rPMu38mkKH7tcm
         Lt8jjRjQX1ExmmQcjq+pA3GiAaLbJ9374b8g/MRty5JtDBosEbjDGFwPE5I7fYMjgQnO
         Gal5ViIX1s7yOlaJv06iOrXqhPDXD94kBd1RPYBBLAMBQN694r/34if6g+ZHRqgfZwN0
         5U9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767793755; x=1768398555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0L8w8zzA7n7ZIE7wj1Nj7dJ97iLU993N1NE76Z8Jakg=;
        b=S7YtlbBcFdGqjt1nl/rbioSFan0x7vPrm+ddjVJsi8kyz01cc3K1/jdH3UJJ1/y/AZ
         4BoKXR5nAvLqOWPUWTVuCenaVMISFjDgWo3g22t0DdK6PrG+1JfaPJVUmtchlM8efinZ
         BSuFebANViaBCd6o3IrHQqwYWIlc6rq5aOO9XoDzIrHDIs9lPLs8phQROrGF4UDPhrpG
         n4KGqbFoV34SeIZALTAKuQxV4xYHceeYHBlVDxw6tf9wJ3o2zaV77EuFQlInhQoDCsAI
         s+Lu9/fY3oJgCeOHXjg4CngT/vGvfgPwXn7nj7nVtwHB6h59MVHLxlCkSPAWiY8+4pPg
         OSGw==
X-Forwarded-Encrypted: i=1; AJvYcCVZW3tyDVd31pHpgXpGwxfXAktpfI6viSGfbE2wjD9I6hGCk7a5CjETdHgvpK6zbpac8KzNHiOJkLdT3bVW@lists.linux.dev
X-Gm-Message-State: AOJu0Ywhg54+ej22oM7IBFk7yV7bFELOfkGH59AW41AVA/31d7+4UyJU
	ww2Oo78AtnC67h10xgJkbO2pGehGql1vGTMMO2vU81GjPj+37715kN7l
X-Gm-Gg: AY/fxX7jO49mmvEl6hq5t9BSJ2LqFAIDNRYBHR1hzhFL1dk90r7PGEiIqMtSLgSfSe1
	eWPHA8GgzwHIIHQrXwfovzUzDwbntCZPq4cWi7vSqminZ9rskyyzxEX2zycDltM6CSyyvEnB33M
	XAc7zImOdOSJyB5xfuqwXLv6AgqxsV8u7uoK4kxTdwYHr14+GZkp6pbgR7UEnKAxGLHmQdDo+lg
	mHYdLe24OE5lKz3vT0CK9d0k3rW4bN5LL6pE3JVP1l1PbF+xUNGDvQyysDnMQT29x/OC0WEwIo5
	pbZx/mUlmUQcpHdqiemS70bpTUiH0em0rb3erxNfvve0yzsWqMhkJGt7ko0CKQ8Kyc0BLstyx84
	knFiCVmwCYalZ6n69plkPVk3z58CFZUS6onyCPSvUSJWCZ3lxG6JGq3koOluw18AeHvj/cNeUo0
	hlBwj8YTk9dMMcndGzStm7fQ==
X-Google-Smtp-Source: AGHT+IE7J+DUw5Iqs5C2fpYR9e3jAQUDZORywRhmTE7GqrIw5ManxpPFTH52JMOGUB9mdhbFJlJkqQ==
X-Received: by 2002:a17:90b:2251:b0:33e:30e8:81cb with SMTP id 98e67ed59e1d1-34f68b65ff0mr2290395a91.13.1767793755014;
        Wed, 07 Jan 2026 05:49:15 -0800 (PST)
Received: from karthik.. ([43.247.159.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c5302c61sm5109577b3a.42.2026.01.07.05.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 05:49:14 -0800 (PST)
From: Karthikey D Kadati <karthikey3608@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey D Kadati <karthikey3608@gmail.com>
Subject: [PATCH v2 RESEND v2 2/3] media: atomisp: consolidate statistics buffer allocation
Date: Wed,  7 Jan 2026 19:18:43 +0530
Message-ID: <20260107134844.68074-3-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107134844.68074-1-karthikey3608@gmail.com>
References: <81e2d12c-342b-4b88-88a0-3e24115541aa@kernel.org>
 <20260107134844.68074-1-karthikey3608@gmail.com>
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

