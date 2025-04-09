Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDDC1E32B9
	for <linux-staging@lists.linux.dev>; Wed,  9 Apr 2025 05:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744178359; cv=none; b=h7N+Rv8VIi82aUriHIJfLgib031wQFSGRv5/gx/CdAwe94n4gfRZo5efAclBeG3cNpJfFYQAnbQldCUI5RflUZABmgHrJphMOe5W/XdLyJIhipXyropRnJu0VEFaayR5DXo3IC3PgZptkL7mdmiAyxqBFTcN2YZQqcuwX8MgXRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744178359; c=relaxed/simple;
	bh=G//LPV9b621xoonNk0r3Ck2b0Kc5aACTPzI1fI5q8So=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=atClGnTBI0zXUPuLKFlPwt0MPFZ50SxXloUHgt1qK6Y7NqI2dvuNip/Tc+KzyIlfIVmE9K0uMbDVE1lbyCkAK3jJo2ZgquszIR9Igxg86wbQMTw4n4Jj3jyD3IGOt95dGsm6PV6aBNJnwZxfYbYBtVNNrQws7OQe4yoDYKC4op8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=huFJaOFJ; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="huFJaOFJ"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22548a28d0cso90543085ad.3
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 22:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744178357; x=1744783157; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P60THtcSeaGNumoR/WgRt7uMK8QmiNv+dXppLkYeWAw=;
        b=huFJaOFJopqAFwyrEi1y7tQFaHA5ODVdw65FzpDuqapSbLD4vNR/aenbBSlEjl+kVi
         GE8QWMPm6wb0yY/QZtg/U7tIN5w+X9/YNBKAb59poopnbNDqlETdyjknX4tuHcTo1g9F
         yCm4SByk684EIgSB91dGD88KxnsywHw0ADKQLKEawMjpJEkeF87mp1BfJlaP9u12wJ8i
         uIoum8AklcIVtJUE76Ki7GrBJnMwUi9nkvm6xYwvOEkR5scxQCMNDj8EFcQ7wybjDqEx
         bjRH131UjGzwxHj4rchEf2PTiee7s7GDQOhzBNNCKYGRp1+qw27pw/yAkJ16qvj1LKkp
         mtNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744178357; x=1744783157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P60THtcSeaGNumoR/WgRt7uMK8QmiNv+dXppLkYeWAw=;
        b=CLr/0vBTx9kHzeCdkRe2kUP2J27cSaedZWdIiuXMAKQGnmu3ijzx2/lIdCNdtPxAFG
         LcsIC3J6hWzgABkCGwYAEB2tID7l+vEZzCUOBiqu/yNorC1h5C4P3lBK6Jg4A4Im8mjY
         TQlPHCKf+HxpmnjxN+LFlNScUMGS+K5b279cca64EauQOPzyxbgRKeeQCem/Npby1yJi
         vNNiGcpNVOaUChpL78xCO4IN3rxLU1WsMhoZv/cNdNZHopPagtgxtPNpTxOLQT7rqdeb
         qfVFa/GWnt8MxGhUehiSmm1JJU2or/PqZvqTUDdLo3l/34GYVTTTpdnXMJkJ+w1qOKOP
         UKiA==
X-Gm-Message-State: AOJu0Yy7ohs6ms6z9SoAF6XHJd3ATagTZCFKbkQVBZy0FHOVSfPf591T
	na4IyaMNgop94ycxP9NVI7cJHusnSIyIhmHVyLl1nvYQOzAdKhpKjzzqtvsk9R8JaBmO4tM07Pc
	=
X-Gm-Gg: ASbGncuwmTScO1rset88LJO1TVjqW24qdA6IrqVP2ct7R1hs53a5MwzE2h9+7xJWgoH
	k/aKdMNZoZo3o0HkRItpqxkA+ytF/MUaOh86SCgUAc5dEVujns1b6jFRmu3ULAYAOmYgtlPk+Mh
	EDLGSflRu2P7Zr7j+/M3s338DDqPe2cTiJMZZX0lYRUpTsvsJHa5aTKsMZPgJqeGxR90COPCLbV
	Xbz/KmlgCVnD1BgiRfDyx3M9kWXQNGDgF16a/Kg5Hyeg575pYT0u2nF4jUBljcIZkTTJu3ue4sS
	0G292FutTxGH8Ip73eLscwehc/Y2zMaEINsJFsS/YdqeLeq015OXhd7vKvGXM1tsUUF3X2xPzsQ
	UB6GNPQ==
X-Google-Smtp-Source: AGHT+IEF/2kPq1wv9EJxYW7WVhtKcroqWFkghJEsnel/AwtMyAxBLF4pJtI9onzFXLY+6m8dyuZG2w==
X-Received: by 2002:a17:903:2310:b0:227:e709:f71 with SMTP id d9443c01a7336-22ac29b41d7mr30253455ad.29.1744178357023;
        Tue, 08 Apr 2025 22:59:17 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bb1d2b951sm431735b3a.33.2025.04.08.22.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 22:59:16 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [Patch v1 09/21] staging: gpib: Using struct gpib_spoll_bytes_ioctl
Date: Wed,  9 Apr 2025 05:58:51 +0000
Message-ID: <20250409055903.321438-10-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250409055903.321438-1-matchstick@neverthere.org>
References: <20250409055903.321438-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for 'struct gpib_spoll_bytes_ioctl' to remove typedef.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/common/gpib_os.c  | 2 +-
 drivers/staging/gpib/uapi/gpib_ioctl.h | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/common/gpib_os.c b/drivers/staging/gpib/common/gpib_os.c
index b215521d0ee5..79806cc51749 100644
--- a/drivers/staging/gpib/common/gpib_os.c
+++ b/drivers/staging/gpib/common/gpib_os.c
@@ -1095,7 +1095,7 @@ static int write_ioctl(struct gpib_file_private *file_priv, struct gpib_board *b
 static int status_bytes_ioctl(struct gpib_board *board, unsigned long arg)
 {
 	struct gpib_status_queue *device;
-	spoll_bytes_ioctl_t cmd;
+	struct gpib_spoll_bytes_ioctl cmd;
 	int retval;
 
 	retval = copy_from_user(&cmd, (void __user *)arg, sizeof(cmd));
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
index dab170b09764..e3d167edfd69 100644
--- a/drivers/staging/gpib/uapi/gpib_ioctl.h
+++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
@@ -64,11 +64,11 @@ struct gpib_online_ioctl {
 	int online;
 };
 
-typedef struct {
+struct gpib_spoll_bytes_ioctl {
 	unsigned int num_bytes;
 	unsigned int pad;
 	int sad;
-} spoll_bytes_ioctl_t;
+};
 
 typedef struct {
 	unsigned int pad;
@@ -146,7 +146,7 @@ enum gpib_ioctl {
 	CFCBOARDTYPE = _IOW(GPIB_CODE, 24, struct gpib_board_type_ioctl),
 
 	IBMUTEX = _IOW(GPIB_CODE, 26, int),
-	IBSPOLL_BYTES = _IOWR(GPIB_CODE, 27, spoll_bytes_ioctl_t),
+	IBSPOLL_BYTES = _IOWR(GPIB_CODE, 27, struct gpib_spoll_bytes_ioctl),
 	IBPPC = _IOW(GPIB_CODE, 28, ppoll_config_ioctl_t),
 	IBBOARD_INFO = _IOR(GPIB_CODE, 29, board_info_ioctl_t),
 
-- 
2.43.0

