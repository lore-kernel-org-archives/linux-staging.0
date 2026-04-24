Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896AF314A73
	for <linux-staging@lists.linux.dev>; Fri, 24 Apr 2026 08:15:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777018547; cv=none; b=hnBHebQ6VKuhmscB1K4busAZVehaSPH14G63I54uOKlrhPoRUdWmOGuMCoKjq1RI28D/d847WeXnTYmakHQdETSg/3pJ6qp7REotE2whMtKLuMeZad6HezqEFZ8RK/5SVZeR/+znDe56zOXS9GbmUA/lLzlLYJo9aP1/qGXxloM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777018547; c=relaxed/simple;
	bh=undu5dkCTUgwl1M8+79fnIw1tnD/iD/mxZTBPxvLUMo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TjlgC+APwoSua4r7ebZPkytU0mrvYXPnbLTdMZi9zGNVPBAFIr486AzxCZNcpXPFvOd5ovL+5v5isq5PR85pC/OlhS9sxfE3wtWeKuXFj48whb0wSkPfSdRAAjMuZ3tOttb47qkQSDL8sqiCACpa/MNNu/S6w8OO9PvhokFfA9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nuS8aFlL; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nuS8aFlL"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82f1bfc9b8fso3486592b3a.1
        for <linux-staging@lists.linux.dev>; Fri, 24 Apr 2026 01:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777018545; x=1777623345; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Qcv3yPzsXnW5c+HXfigOkDMAbuRYnw8S8vUv2u2wfwA=;
        b=nuS8aFlLylnzGgjDwFEMCL64AJFhF27axbBSCmTh4SbLGOJlGohFemX1enCESPF9KQ
         Rra0YpJPDN5Vh5d5FD8wiiYN0xwS3L85qf3Tw0cX75ov4tYN9F66OeF0w8nxrzmvJN0y
         H6sbBQlcBImDnZ8j5jhON9L8OtGmkOd9fY0pP0hyoAfCM9J21Oy2qmywRUdP3Cu0wGoz
         6DDLFLaYoVW4Ub3CRBkqPNBmw6ySCRuSvqY0aaHrHy8v5LFL4wix4OrAv1qtvyrbkpWC
         rpoKTc7QWeR8h5BjP3QH+IpnOKFKod5lJwMlLXMZQ6CudNcW4eKJgSxkY1BcQg1sJTc1
         lv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777018545; x=1777623345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qcv3yPzsXnW5c+HXfigOkDMAbuRYnw8S8vUv2u2wfwA=;
        b=K74PqlUD9TgLv1fHcEnLmidI3y5Q6Htps05IdqRyb4qAGoPuLxxqop1SNT7sII6ISD
         p6+uxMXxCUGje6y0cW77rZkvd8Dp1SCeT04klQSGuDysy5x7EO1HgFACg1htgQyKXuCp
         qqGpsV3Dj1nR3viVKZp6HVrvcowfHru/bKwuK+13bq7cZZ2oxlAWS59wEJCEN6oYuS5T
         9jGtehv/2KQ1WkL9DxCLjus4jjckTaZ8L44r0MzwSZPR71KaYOcNKWkgtA04sMYMdXKW
         lSzJUt7HVWg8uWu2uNFQKO8v7PzXaAN9zVnsEo0vYGYPOfYR/JGZ1xyzCtYXHlJv9HOo
         vo3Q==
X-Forwarded-Encrypted: i=1; AFNElJ8meeBrrnN0r2kUwiIG8suP/ZVAcpGxuwzy2GdcwOwbuJ7IpnZ8LDOmuQqC15lXLBFskxkgcnBk6i7CGIYM@lists.linux.dev
X-Gm-Message-State: AOJu0YyKrdynVESpkbneJVm4HNPYQdhQ/XKugLrCLjE8hqXPBKacKzDZ
	NtG1nQARKpib3cQgoyC1kNTIv62fk8Vp5LZ+6a56Q25b8bDR55UyG6ZO
X-Gm-Gg: AeBDievgGG/0pXgywcXwbiM9UjTwOKUQqPAtAGgqwYPBzFRCaWOxdnC/J5x+jkPFR7F
	tAniLG1mJrrOKAenogov54v8GekM4/GzPGOAl3uCGRNxEOwXPSxsio1h+UoILBuLzUiIv0iIBRC
	PFy/GYHvDjMXN9bdCTGxAaV3eGGCBHO3C+BBJV2VwqRKfGdWvoE4/HdkDiafiKEsK0R0OnOn33p
	hoAx9QkLoNSGxdkYkmi5qm1AVDbz+2X8ni37QPGXYC4iCjFKwvHnziHRJoWdoCszynp/CS+RlsQ
	7jKC+L0fHAKX5IDw9z4pf2bGJmvYdNyCoErUuavTipaUhnkp+7BSWvmuhWgtATleuW1OVcRmap9
	8wuAudePBKuXLSVH01AYWyxYRB9lEHRXQ2zi9Q5M+7r00ZnypWhZuEVSiJXJP2b7gO0i39liOO9
	xUVdJS5AsEwxTLBkVqPZq/CR0BIZP+aVzRNZlc
X-Received: by 2002:a05:6a21:6d9f:b0:398:b95c:51ed with SMTP id adf61e73a8af0-3a08d8a3490mr34780945637.35.1777018544653;
        Fri, 24 Apr 2026 01:15:44 -0700 (PDT)
Received: from soyboi ([2402:8780:1073:993:9321:304a:9347:5e0e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797702fbfcsm17347848a12.22.2026.04.24.01.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 01:15:44 -0700 (PDT)
From: Robertus Diawan Chris <robertusdchris@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com
Subject: [PATCH RFT v2] media: atomisp: Add error check in create_host_regular_capture_pipeline()
Date: Fri, 24 Apr 2026 15:15:38 +0700
Message-ID: <20260424081538.459564-1-robertusdchris@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When calling ia_css_pipeline_create_and_add_stage() function, there's no
condition to check whether ia_css_pipeline_create_and_add_stage() throw
an error or not. So add conditional check for the return value of
ia_css_pipeline_create_and_add_stage() function.

This is reported by Coverity Scan with CID 1408952 as UNUSED_VALUE.

Fixes: a49d25364dfb ("staging/atomisp: Add support for the Intel IPU v2")
Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
---
v1 -> v2: Add Fixes tag (suggested by Dan Carpenter).

v1:
https://lore.kernel.org/all/20260423060246.296986-1-robertusdchris@gmail.com/

I am not sure if omitting the error check is intentional or not, but from
what I see from another ia_css_pipeline_create_and_add_stage() usage
in the same function, we check the return value after the call and return
the error code if it's non-zero.

I also don't have the device to test this change.

 drivers/staging/media/atomisp/pci/sh_css.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/sh_css.c b/drivers/staging/media/atomisp/pci/sh_css.c
index 6cda5925fa45..6aa8a883cc76 100644
--- a/drivers/staging/media/atomisp/pci/sh_css.c
+++ b/drivers/staging/media/atomisp/pci/sh_css.c
@@ -7041,6 +7041,10 @@ create_host_regular_capture_pipeline(struct ia_css_pipe *pipe)
 			err = ia_css_pipeline_create_and_add_stage(me,
 								   &stage_desc,
 								   &current_stage);
+			if (err) {
+				IA_CSS_LEAVE_ERR_PRIVATE(err);
+				return err;
+			}
 			local_in_frame = current_stage->args.out_frame[0];
 		}
 		err = add_capture_pp_stage(pipe, me, local_in_frame,

base-commit: 028ef9c96e96197026887c0f092424679298aae8
-- 
2.53.0

