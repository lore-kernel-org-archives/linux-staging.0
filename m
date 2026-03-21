Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D479734753C
	for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 18:42:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774118569; cv=none; b=lNBuVoxOSNmU1oYMijsLzXwh65r51SVLlQZcZevZynHKGUdG6BQ6fFT+FZZQjLoikQku6vN7aj5+Mid4HkYOCO1wfJH7gkJT103YsvnfAPyTUO5bNT13csbFGMrkGWlkhsIfs4aDCgaz/J+QKs2qVzC1Nlm9Q4m5QpBC2UTtAyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774118569; c=relaxed/simple;
	bh=Z031qvX0Lh8Kw5PlpbhT3p3CAkirxht5YbFEJHKb6xw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rtzEMfTAPXAOpMsjbzl/kbELgE1xGGZ6mIq0zsK9uP5gd/31J9CbFdedTyvk0b9cXw+ABfftW9qCqiyzmqeGTHiQwdiaQYEBllG+nzQ38qJnJ0mtcPdcNYEnZHnhOBkUgR3oYPylL9CprekhvDPjV80jUwTdQeuq4g3eH2GhbQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WGmAclf0; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WGmAclf0"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c6dd5b01e14so1070274a12.0
        for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 11:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774118567; x=1774723367; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tX5Pt10T82xTjhI6u1k3ryf9SskZVWpfzWj29gwwrMQ=;
        b=WGmAclf0euzPAxd/h+7EHd5tUEPmw4YR8DrwaZjGSFpGx/5P87WySPKI+hSZdHHmUT
         jWY0nd6WTixwOPUUm3G5OoiZLba9Xiyk2yRyXmyHUqKX3qoKmPuWWG7F6C/SKrVEHC3E
         Gt2m0I6AgqULjZNdiFEiCmjWatBySSTPyFlefYkICIzcr1E7NbKXMJ6Zq+1jWVRKOUjx
         2EUSnZw9BSNJ7rkrYIyQHeOnm1wR6aTNcV0shhzepJGa2k3dmYErz8qe4ULiKHlCWhm3
         QoYKKOR2hql4TGAp1669jqFkAPBq0i1nRoSIF5FukqvbwQWRwQeUZdE29iPH5KVxOEWl
         7ZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774118567; x=1774723367;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tX5Pt10T82xTjhI6u1k3ryf9SskZVWpfzWj29gwwrMQ=;
        b=diw/roXuQqtQI4xhRviJV/u4hBt5Fqk40nmfoXa+Jw4yqk5UeS09M+TN+veTHV0Wzl
         GFrU/dq6ZL0Q3hYQYJMxturhQ+rXj1KY6l2C0h/SxgM8NTWusSZPPiy2f8D66FuKdZ/d
         W4BTivwjipx97Eb77OWSuE4HoowpzCEK/BkZrcXFckXQDbINSAIKSYCAydlyVrGkMfnn
         pOFLjhIoI6kdb+novGsvoRoXqncHEq/4Zg459iqIoEySwYYy7e/4ShMjUsTI3qUJpf21
         v8CzDVNYwjt3oHnyq19CIyppLdXV3sx9LHFD4mlcYuVcIb8k46D0YExMo+LdpwsVvbvm
         sApw==
X-Forwarded-Encrypted: i=1; AJvYcCWHuG3Ma2F9YtUFYmUe8PFR7r4LmFT8NVX8s7bhF5MiTjzfNC1kMJK4k88MbbFthKWbfbzQpkmsjDTSNu0/@lists.linux.dev
X-Gm-Message-State: AOJu0Yzd3vR3LL/IXvXVKpUDKaPk2M7l/R9NqXiuZ0EpCrKTuNsmvgOY
	Cj1qk9jPhZqPkKWolLmLTjwuZdhQkaucKWxrvbaueq15xcI92ZzLBOK6
X-Gm-Gg: ATEYQzwSNzSlMjS9fxQynMCEjGFt0RzbVgnJnLizlvjYwvZj5yPphDb3Mq5JoVDQ7HA
	ZPxX9NN/4ADIaroij4TbOx3CuZEChqtczVYPOyQUozt2DxkWegreBvbEHKriw7lQS6soxuJVlms
	jjZoNJlbfep4PmLGixLJ+lALT5EoB1LRufsS/aI+fIVv4lGu+uOyATKVDYsA6Dh+ZmYTzYgpevU
	dEhztmnMW0g1WvRwF9GnoiMyMxvI+TKdScnDtYav/IrZVXcxv4izlFrMUMG1j02imyv5qGXm3rY
	X/CchbKBnPksNZvWxlNB//bsypklyPOIOKa53P7XFA7RA4fq2EHbz9LW/UT7SBYl6caPgHFItOx
	/+yXN5F2UOHUfztHxZ720PEJ9vxkuD0OGi3efosTrFbJqfFQcfOTdLnspt/rVypHBIucXoO/1Wt
	so8v0M3VYb3PB8hnMIO9XBBZ9tjOZuvM97XTmfAKzUUEGi18GVIX6fvpPT6NmZew==
X-Received: by 2002:a17:90b:5103:b0:35b:a418:6990 with SMTP id 98e67ed59e1d1-35bd2985674mr6424847a91.0.1774118567168;
        Sat, 21 Mar 2026 11:42:47 -0700 (PDT)
Received: from avinash-INBOOK-Y2-PLUS.bbrouter ([60.243.255.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd26cde44sm1898884a91.4.2026.03.21.11.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 11:42:46 -0700 (PDT)
From: Abinash Singh <abinashsinghlalotra@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	Abinash Singh <abinashsinghlalotra@gmail.com>
Subject: [PATCH] staging: atomisp: replace uint32_t with u32
Date: Sun, 22 Mar 2026 00:12:24 +0530
Message-ID: <20260321184224.36322-1-abinashsinghlalotra@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace usage of uint32_t with u32 to comply with kernel coding
style guidelines.

Reported by checkpatch.pl.
CHECK: Prefer kernel type 'u32' over 'uint32_t'

Signed-off-by: Abinash Singh <abinashsinghlalotra@gmail.com>
---
Similar cleanup done in:
d6e1f701c61f ("staging: gpib: tnt4882: u8 over uint8_t")

Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings


 .../staging/media/atomisp/pci/atomisp_subdev.c | 18 +++++++++---------
 .../staging/media/atomisp/pci/atomisp_subdev.h | 12 ++++++------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 3d56ca83ecb7..ff9f08cbf73b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -180,8 +180,8 @@ static int isp_subdev_enum_mbus_code(struct v4l2_subdev *sd,
 	return 0;
 }
 
-static int isp_subdev_validate_rect(struct v4l2_subdev *sd, uint32_t pad,
-				    uint32_t target)
+static int isp_subdev_validate_rect(struct v4l2_subdev *sd, u32 pad,
+				    u32 target)
 {
 	switch (pad) {
 	case ATOMISP_SUBDEV_PAD_SINK:
@@ -203,8 +203,8 @@ static int isp_subdev_validate_rect(struct v4l2_subdev *sd, uint32_t pad,
 
 struct v4l2_rect *atomisp_subdev_get_rect(struct v4l2_subdev *sd,
 	struct v4l2_subdev_state *sd_state,
-	u32 which, uint32_t pad,
-	uint32_t target)
+	u32 which, u32 pad,
+	u32 target)
 {
 	struct atomisp_sub_device *isp_sd = v4l2_get_subdevdata(sd);
 
@@ -229,8 +229,8 @@ struct v4l2_rect *atomisp_subdev_get_rect(struct v4l2_subdev *sd,
 
 struct v4l2_mbus_framefmt
 *atomisp_subdev_get_ffmt(struct v4l2_subdev *sd,
-			 struct v4l2_subdev_state *sd_state, uint32_t which,
-			 uint32_t pad)
+			 struct v4l2_subdev_state *sd_state, u32 which,
+			 u32 pad)
 {
 	struct atomisp_sub_device *isp_sd = v4l2_get_subdevdata(sd);
 
@@ -242,7 +242,7 @@ struct v4l2_mbus_framefmt
 
 static void isp_get_fmt_rect(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *sd_state,
-			     uint32_t which,
+			     u32 which,
 			     struct v4l2_mbus_framefmt **ffmt,
 			     struct v4l2_rect *crop[ATOMISP_SUBDEV_PADS_NUM],
 			     struct v4l2_rect *comp[ATOMISP_SUBDEV_PADS_NUM])
@@ -291,7 +291,7 @@ static const char *atomisp_pad_str(unsigned int pad)
 
 int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
-				 u32 which, uint32_t pad, uint32_t target,
+				 u32 which, u32 pad, u32 target,
 				 u32 flags, struct v4l2_rect *r)
 {
 	struct atomisp_sub_device *isp_sd = v4l2_get_subdevdata(sd);
@@ -467,7 +467,7 @@ static int isp_subdev_set_selection(struct v4l2_subdev *sd,
 
 void atomisp_subdev_set_ffmt(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *sd_state,
-			     uint32_t which,
+			     u32 which,
 			     u32 pad, struct v4l2_mbus_framefmt *ffmt)
 {
 	struct atomisp_sub_device *isp_sd = v4l2_get_subdevdata(sd);
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index e1d0168cb91d..b12bb65be3f2 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -315,20 +315,20 @@ bool atomisp_subdev_format_conversion(struct atomisp_sub_device *asd);
 /* Get pointer to appropriate format */
 struct v4l2_mbus_framefmt
 *atomisp_subdev_get_ffmt(struct v4l2_subdev *sd,
-			 struct v4l2_subdev_state *sd_state, uint32_t which,
-			 uint32_t pad);
+			 struct v4l2_subdev_state *sd_state, u32 which,
+			 u32 pad);
 struct v4l2_rect *atomisp_subdev_get_rect(struct v4l2_subdev *sd,
 	struct v4l2_subdev_state *sd_state,
-	u32 which, uint32_t pad,
-	uint32_t target);
+	u32 which, u32 pad,
+	u32 target);
 int atomisp_subdev_set_selection(struct v4l2_subdev *sd,
 				 struct v4l2_subdev_state *sd_state,
-				 u32 which, uint32_t pad, uint32_t target,
+				 u32 which, u32 pad, u32 target,
 				 u32 flags, struct v4l2_rect *r);
 /* Actually set the format */
 void atomisp_subdev_set_ffmt(struct v4l2_subdev *sd,
 			     struct v4l2_subdev_state *sd_state,
-			     uint32_t which,
+			     u32 which,
 			     u32 pad, struct v4l2_mbus_framefmt *ffmt);
 
 void atomisp_subdev_cleanup_pending_events(struct atomisp_sub_device *asd);
-- 
2.43.0

