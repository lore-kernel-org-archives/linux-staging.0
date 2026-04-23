Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB632282F16
	for <linux-staging@lists.linux.dev>; Thu, 23 Apr 2026 06:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776924178; cv=none; b=LAkHqYa0Fg26GDyAjVVnNbwH7BO2GAQcW5aTm+uSV54UZY5er+DtpCGbHLzHQtDiRIuAIHnXyrAvzowBs451uwQ8cPVXKtuPT1uwrcdkSo8H0GFgTL6GNR2EZ75cJ8/Yl6iS4cMSLBE69mknpLoKd4cXfAfYNkI98b1sH1NHT+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776924178; c=relaxed/simple;
	bh=ceEokkRv7J/gIQScaEcq2PSqrKrV/4PD5eqMMtVhjDw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d3BD74V0eTScDuXR97BBnW2uvpEYoG+B55hFZi1KEsl9Z4gBbca1lYZJf0TIcdwL928f/I1guVmGOD9E8BEhnFJqomu7ymWTrN4bWxvC6F6bvdjcmPBNl1XjUTXmjQ6CzC/b7n7ShcdpcV+XRMJuolFCcumAAaDq/mvNx06UZyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CS1khSc2; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CS1khSc2"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35fb166b0c6so3651374a91.0
        for <linux-staging@lists.linux.dev>; Wed, 22 Apr 2026 23:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776924176; x=1777528976; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7TbfsvgaTL4tZwAILAQQupP5ysgI2o47XYAQ59piLtY=;
        b=CS1khSc2rV+XMYs5PiqeEyzDaqM9SLAY0O38QBGRRfNJtKY2t3rhDfK7XW7FJTcgTg
         9EV6cQzGl6Kgv1qyt0RF6nsdFkIAmNlIbZ2N2Hqo/lhwcTKfqoAtyw5W10h7gukujuqZ
         XSnupkGS1HU3U27tI0O6g7tYPBaMtBNZ629/VaYdoSingxklOgBjS5yFNAmxXp8hU2i6
         LsbR82BI5uMiwgP0xZZRilw/EEk9O4vW7dIJzdS7XINd7qbBTXrYw49lqHTyhfl10ql9
         PAGFWOcKNteI/OyLoMj0IaKIgTZ+/vV/Wk1aXPsWavUcQTnvXk18th1DzLJwG97INsl6
         5q4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776924176; x=1777528976;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TbfsvgaTL4tZwAILAQQupP5ysgI2o47XYAQ59piLtY=;
        b=LlyBNcbyq2oHAtc4YdZIjH0t7KxgOsVATz7Tx7xnSZNGNOritlX8zV4TdR0sWw6jYU
         ESsCKlUM4sssYP8f6V1GRO3txjKsg+LibCZuI3WFHMfoBC/PXVkplT+ZBHiRyY+pwEEm
         MdRAmPQrK6V4gKYsGP+bKLS567uF0aNwH1DOF01gujbhu/3co1rypxEn7QRVGkp3Inzp
         VlO9CpDBrDoikFrMJXVOH19CeilUndNjoKKXtvb+o4VEAboqC9fgTe2BaQuKyn+dgOz7
         WZHDCyjmWjS6gWCA65uf6lMcInujBMdDDFBwUZL6KndMpu2aWykaBXewaMbHJbKbNhyS
         +lnA==
X-Forwarded-Encrypted: i=1; AFNElJ96T0YqGtioxKNxkCuR5S10wDSAaX4esqe04tyV4RURP5daJbGgoI/f58wOgIis28O5wpmi/kIbO+vgFj53@lists.linux.dev
X-Gm-Message-State: AOJu0YyRBVN8qKITn6m5Ecyu9EkvX6zIOlppQouiqRX3Fpx6GkUdGrQx
	lJA1D7wNSHJGp+qbx5yJiKSq2BjeU5Y7WVu0s/ThLpTxyhvp4m6BZoDn
X-Gm-Gg: AeBDieuGEFzMOX29uxjKXaxe0Z2fycNZjtZuxv9CXa9Y1rPStZDKZMwfop5kaJzfm25
	NMJw6eUpjVYXzvaiubI3QfLONlIUVAtgNBoUtRpNwGM6FwqHTyVdkABykG7YFL26iV58rE2JOZH
	TnYNeuN4fHghiQmFeIzRbfYUNy3lLYvh9zTXMRijh7kxRjL99xgRrCJC9Qc4oFej3V/kpaH9R8u
	kMGcKeZ8nKJSWxb3FbpceccCyUXMnbMJiFzXQSZ55rghK179CS/gcZtbqdsKNBbkkBWkOQRmvAE
	i+XPzcxMkxi/I3E1OyI2cq8FEjNbbBv4yPZxtiUd3oc5TbB1oKZJCjCg0bFcvFmGJ/VxSE+R0eg
	DOHVAHkwegnQDSRtrtDWKC/Y4p5VcITA6VoD8WQF3NL1cfHDZKy70IDKqaN5/UdfOYmOqfXvrsL
	IzdeVFArn2KryvJnzixMINUEIFiQ4Kd87PlA==
X-Received: by 2002:a17:90b:3d02:b0:35b:d795:cf5d with SMTP id 98e67ed59e1d1-361401ec4b4mr20061094a91.5.1776924176225;
        Wed, 22 Apr 2026 23:02:56 -0700 (PDT)
Received: from soyboi ([158.140.171.92])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614195a9fbsm24479325a91.11.2026.04.22.23.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 23:02:55 -0700 (PDT)
From: Robertus Diawan Chris <robertusdchris@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com
Subject: [PATCH RFT] media: atomisp: Add error check in create_host_regular_capture_pipeline()
Date: Thu, 23 Apr 2026 13:02:46 +0700
Message-ID: <20260423060246.296986-1-robertusdchris@gmail.com>
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

Signed-off-by: Robertus Diawan Chris <robertusdchris@gmail.com>
---
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

base-commit: 2e68039281932e6dc37718a1ea7cbb8e2cda42e6
-- 
2.53.0

