Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FF223BD06
	for <linux-staging@lists.linux.dev>; Sun, 22 Mar 2026 07:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774163186; cv=none; b=P+mMy/35zM3LBMb5yE43Wr6fHM7QD7H1G8mjsJra6GabQTkR65xRZ4mrCJG2B3BptpDUS2zQ2kqrNsDWXBDl8Bve/++LuLbScj6qXK/SfmlptcZIgwk4v5nhT9Rul5oNHWUqyU+2w4n4jHEy+0c9y3PAfNasBJNHgeTNETr1n3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774163186; c=relaxed/simple;
	bh=kL4O5B+ynNZ2gkdeDFcZBX6xhj7D655y8QcoId7ibzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MUnKYRVutx0LY0+e/eUE7bPZ6hQ0CY85xaN3CdxhtmKdHHmXGqn4bug25Jn3m+MFCwlADB3I2bXa3enjiksbr5iIzD6Tdf/EgccbYvKhrSfNsDSrZ/GMndPdVRejhn9wKFVPXEjX76M0vDd2oaumrl0AQjlJQlc1RgZYp0GORGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5AQBq1h; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5AQBq1h"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35a09e0dd63so2443306a91.3
        for <linux-staging@lists.linux.dev>; Sun, 22 Mar 2026 00:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774163184; x=1774767984; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pSC7ropIK/vP88asTdrbl36/LNFhuDhnabpvB85e4WY=;
        b=a5AQBq1h37sAyFC/rKn649vCnVWg4AeIATQlH7sR38sK525WsL8yJIKlJ1liCc5btV
         4eqLpUXYNT3M+2I0tejNygz1yUjlE6uKLY0hRrvffmCzeLHx3uSVdcfccUn+B41Qsbh+
         gDlTq45YaZ2M5jgRF+jPnJh4oN6uQtrBbT5Qdb6SzVmenob1QUSVpfrI8KVY4E8pFuIR
         fzdzd2aKna5RhSKHnHZFhJcOUH8K5yc+klBElGvtydYNBMDfpCl51XGAGth9lR6BQ4iK
         rz5E+mTLRCbrfLhMnV4gFpWurxTKlvc1YklSbSQrl2TaR2zlxU3Sl+ZtTyeh8NY9keF2
         +PXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774163184; x=1774767984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pSC7ropIK/vP88asTdrbl36/LNFhuDhnabpvB85e4WY=;
        b=gpd1Cpz3L2uD5C3w2Dif9OsInJR7Ki11zIdX0pRXhQUokKrKng4CsvU2ncY/C4amut
         nbTJqR6DG66wQP0QJa4rEQsQTcra70H9LCjbyABD0tztxzK0lXrzvKFl7W3GNU5dtBN4
         EGlWsmSTt8FiA0+N6nl3v7qeLfojzGdIx1p84qooIjum7lcH12RspZdmT8Jm6/qrhKxD
         N1xhAM91WcBZHo1pwB/ZTUDTQB3qvdn9BtslaYH1q9sorZM6FUAoq0L+t72PCgfdMLn3
         mmFF9Xxlenf942LuB94vgsZunJqAVCWSKT1YhqVv1qOiAwoYBvdgknaO+uFgsSCzReQV
         NL9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZTYuYbLZKLXVklxoRsxu7jgag+g/w1YDcj5DKCi5xKadezPwPC65RvY+sGS3WZAaR1cyrG0KQcDJrmJhg@lists.linux.dev
X-Gm-Message-State: AOJu0YwCNdDgLidEPqhQLXBxWTv9sJLURBeFMbxDcn/AAQr7EMlTeIN9
	fq3R4ve/soIfYrFBaud3bmJfcOb+JEWg5ZDaV/pArspaJHJXhCu1CTJd
X-Gm-Gg: ATEYQzwMYYTlTlTrmhVJInRncbn9fUWt8XujrEIkYxCU75eAtcpHBE0/MHKE+9VVxwT
	8gMmIE37s/xREb/gT//JNkflnxWXSQCI5Q/uabkp1ckdPhD8MTI94CeBNEPqGFb9DoO/GZtdQ9w
	Jf+r0QmvMsaXSBIN+hmRWSjWsiCQePONRvpqNCBl3bp+7tMxTRgLjiMdDSZ6usPybrDPQV0hoGX
	E681++via7nfsmdlzucLfcSMO1ea1cuwX9f0hr/FU7OUszSWoWgjBIcMejx7C93UEbuxYYYSRPt
	KkNwUNHEygWcvItBIHidibwU20RZMgPpSU9qlJ0WccEjM3V0nxEabOPaLIpCXIVxH0HS/NQ8qV6
	YsxAvZt9ti4SS0Agb7h/f8g6us5Bx5W/ahZ9UIFaDFkA5lWc2/eLaKOcKbTNIH9TqodSQQ6RUOS
	B8niJ+7Pp0SOkIc6UZVrGWuJ7dfWqxxf4LRrp3hUa39hVzsRtr020dO4+BC9j3CQ==
X-Received: by 2002:a17:90b:35d0:b0:343:7714:4ca8 with SMTP id 98e67ed59e1d1-35bd2c69ef3mr8011764a91.15.1774163184289;
        Sun, 22 Mar 2026 00:06:24 -0700 (PDT)
Received: from avinash-INBOOK-Y2-PLUS.bbrouter ([60.243.255.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc5ff7090sm9471192a91.3.2026.03.22.00.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 00:06:23 -0700 (PDT)
From: Abinash Singh <abinashsinghlalotra@gmail.com>
To: abinashsinghlalotra@gmail.com
Cc: d-gole@ti.com,
	daniel.baluta@nxp.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	m-chawdhry@ti.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	simona.toaca@nxp.com
Subject: [PATCH v2] staging: media: atomisp: replace uint32_t with u32
Date: Sun, 22 Mar 2026 12:36:14 +0530
Message-ID: <20260322070614.8419-1-abinashsinghlalotra@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260321184224.36322-1-abinashsinghlalotra@gmail.com>
References: <20260321184224.36322-1-abinashsinghlalotra@gmail.com>
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

v2:
- Fix subject prefix to include 'media'

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

