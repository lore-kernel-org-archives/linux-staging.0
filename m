Received: from mail-lr2-f2.google.com (mail-lr2-f2.google.com [74.125.230.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80DC844B663
	for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 16:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782835567; cv=none; b=M3jozblk/6dG8L6AX7qxEsECT3qLoyEFa+wNmMNlBcEuYvlYM8nqUKEixcFII8dgdDbJCzd23ejhLSF9YveI6jFyHU66aLYL4twlEydy7YWje7791kE5FL/AnpwgOI6Z/N/Y5Ejs8yvw0SpPhY88RvuUoKQBMUtn5I6kORka26E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782835567; c=relaxed/simple;
	bh=m3vAsK5slw0dcrp5GIzrlVJVX/5gpHWYHdhD9DgaINk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IkDDGol6+x+/8CPSnL/vHbZ8zyq2OKWplIrPjzqlmgTNNeT1SQtkmFJBB9HMj5zLN7fHK974FG/M8aOWMhr93PBYmNeaM4BVJbzxtkPuwteGnRLIYeKm27+H/RCJxwhUT/nfyZJZ1SeCai61EaKauGQlSPp5Y0LfSZRp7LvubmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LjNtsrGL; arc=none smtp.client-ip=74.125.230.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LjNtsrGL"
Received: by mail-lr2-f2.google.com with SMTP id 38308e7fff4ca-39ac6d46512so2010661fa.1
        for <linux-staging@lists.linux.dev>; Tue, 30 Jun 2026 09:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782835564; x=1783440364; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GdkkU1grf9UGW9t3296G0fSDCaf7b9DnqBxsaoQmFhc=;
        b=LjNtsrGLS58xsEMKFOQ3MuwcPyzjy6V9mjL94Zrpkekkl1vvdpgK3ZMXk96TovjSnl
         dBYNXR/WE7KhSjSOt5lm+Wh8KGuCiBqnLPH6Zl9yX/pDU2PEP8Y6f9TbfR2MDjfKGEJ7
         y1jY5N2WUb7FMo7CBPJ8YZa0kA8CBrYu9qknKGsll+/uTBSdWH2gwdIOfWMjdTKF641U
         s1aB7ki2XXEsq06QoBhFcsNR3ZzF42dSJwAsxiEYXBqgRshPxzER46dpBgNv4oyHO98S
         9ib3mI6WACEC4jZQ6d+Cp61sjai1X366ghlLgtqkRjRC7X6ht9w7IekKc3he9gKXpVKU
         segw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782835564; x=1783440364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GdkkU1grf9UGW9t3296G0fSDCaf7b9DnqBxsaoQmFhc=;
        b=Z2Iy33X9AELxr+M2ySazh1DfRRpGvDIpCSxXtYwigwE+JTjUShAGujVDR+sWenC8Ga
         Bu0m7KcGz66g5EGURTjJkLdV4iM10YiMCElyf5lfTGm+uXBzOto6GO8hgtBXg0MRc+Rb
         DV4IytnyT05gtbDxU2hOXz49ze6Fy7C/2FoNhUwAoiL4Vir6CKFFBpoHL2o6Vf5JfeLG
         RpBg7gvIzqYB9apKIN/Wp84N9uEJn6+DBGUkLgTqAp6N7+lhMyEx6ukBPzpRt1aqShtU
         XFe8oRf8k1mKbpOYXK9k9BKEh3IKstyDIukYKryFIn+9oR505ATKGQ2WNCA0zP7VYw3T
         nLGQ==
X-Forwarded-Encrypted: i=1; AHgh+RpllzZOnB5clXif+Q4Pp2ozrEdgvq/70K3RA+sp2MAHkGc5FJZdIBFuQ/Q8Pz7RT+dY8Hzfnw1Idk06WSYX@lists.linux.dev
X-Gm-Message-State: AOJu0YwfQyNg46DmWztjRHk3r//erkkDJXdu2QGfRofNj3yN0x9MDX/f
	O1u5bMyCW8qy/JC7CeuZiLcFzHGP82GL/symqq5Y4jAQYkKvpYVZ4DfR
X-Gm-Gg: AfdE7ckZou6c34hAt4mQzwfC1118BszVCUXiTwWGAw6y9sW2hE38tA6d24I+T9zVq1j
	fvFRhM/aGjOIQi5ECtH8tC9UX81wZ/Q5YkLvzQANK9QEnOUweRdqoG+zKGMaOKvdXdxznPv3P65
	213omWGwHjjf7ZpB+3eV9pfawgen7+vFvmu3ylKUQVlf/+Et+JRlHgFWIx0lEMB6t8oxJIRafcS
	TcceDSBqND+7siWf6wIT1tVbQmJX3eifBOqcYCkfp6B4abUAM2JuymJyKgIcog7AwanKZJlKOcH
	6uxAdp2orpMqDpBRIz9MzAfMKDgwKfMqyBuFnJrC5ld6sc0RcI5G9EAOMGA04loQBl/ne2TZZri
	16qaOmszEGMnPoqtX43Pd9+JmTVEakhLkiywHuWAUjxVJIpMtEJgR7DYi/Y6hct+latlOww==
X-Received: by 2002:a05:6512:61d1:20b0:5ae:bf21:22bc with SMTP id 2adb3069b0e04-5aec10c070bmr311853e87.30.1782835563310;
        Tue, 30 Jun 2026 09:06:03 -0700 (PDT)
Received: from arch ([93.177.236.219])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aebe498645sm673045e87.39.2026.06.30.09.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 09:06:02 -0700 (PDT)
From: "Bohdan D. Marcus" <bohdandmarcus@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: andy@kernel.org,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Bohdan D. Marcus" <bohdandmarcus@gmail.com>
Subject: [PATCH v3] media: atomisp: fix block comment formatting style
Date: Tue, 30 Jun 2026 19:04:35 +0300
Message-ID: <20260630160435.3293-1-bohdandmarcus@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a block comment formatting warning reported by
checkpatch.pl in atomisp_cmd.c to conform to the
Linux kernel coding style.

Signed-off-by: Bohdan D. Marcus <bohdandmarcus@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 6cd500d9fd26..20abc2c0de80 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -2520,9 +2520,12 @@ int atomisp_css_cp_dvs2_coefs(struct atomisp_sub_device *asd,
 		if (sizeof(*cur) != sizeof(dvs2_coefs.grid) ||
 		    memcmp(&dvs2_coefs.grid, cur, sizeof(dvs2_coefs.grid))) {
 			dev_err(asd->isp->dev, "dvs grid mismatch!\n");
-			/* If the grid info in the argument differs from the current
-			grid info, we tell the caller to reset the grid size and
-			try again. */
+						/*
+						 * If the grid info in the argument differs
+						 * from the current grid info, we tell the
+						 * caller to reset the grid size and try
+						 * again.
+						 */
 			return -EAGAIN;
 		}
 
-- 
2.55.0

