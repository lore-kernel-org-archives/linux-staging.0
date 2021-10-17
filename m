Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8E72C81
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 16:22:06 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id f21so9623345plb.3
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 09:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RDW1qPcMGAawLXHmgm47THBGVsh6BGW4tVw5OGbgQzw=;
        b=RA5UgqeMGTQqGE4ruXYKtsCSlgdXXh/ujrF1Ehe+txdjqx/bbKJ/u+TMmTnjO6V0/v
         o0zkRTPAh5VPRTLaG6VtYfUkxjkh8ARa5JVdAcyDGZ2Hmgblo7Kn6vlUCDZJSqar/fh1
         HTXgwpeGOrueE0iYcrJXtdUEuXxCmHL/Zr0VB/i0ZLVOxfhkrHHdigxjv5hE0iHVd2ah
         3Bc0XynN7qWoaEySzBwE8nT7G1ShRyE7ByJFCR1rRU4rOCZ4q/I/4a2cenQyMehEACWQ
         zISp/jcG2OrCLHgAM8tFazprO/mtqfZ93UL37qB0oqoLrdS0aNPXu+lbgVe2jehiOKil
         6l0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RDW1qPcMGAawLXHmgm47THBGVsh6BGW4tVw5OGbgQzw=;
        b=WOdFcHHsByyv3yKoPElCePNHk6cQ2LPuWrI8M0FXtb4qd2DZDKDGW3pr9nGqhsjwGd
         Xq96pR7EiutyHq8uV4PCS6/PimtQm1aQgILf9b2wZWcNtozw3IzfR8yJzM7g4rRo0UOB
         6btte3XhcRhvUg3O5ZfOFUnJ3t7w8nSlQ3vuXr9KuwwGfHx4oT9Ke8IhR6aqZ0McGteA
         1n63XpN6eUK+K54R+ToGKVyxeW2RdGHruS5pBRdzKnDcNxQn9gGx5UgXLOKjqPWMewuV
         XCdD5i5ZkxeX/wSiEXyDLPut50wZeKnT7b2uRZjpJoBjP9i8R78qGEH9jQ43ahdGSFp2
         ZpvQ==
X-Gm-Message-State: AOAM532KcA1XPW/gxuUsmp3Y38u6lDg3UpbrXtX2/8Oc7zNxIQwUYj5n
	GuGcBCdQz/Mqk7K123CKB2M=
X-Google-Smtp-Source: ABdhPJzRqiG5mLXwiAbDEtxsYZI4Qydocucua6z0Dib7/APOAQWQZ0Rt8E7j7OA9PLn3LUQOwBsZMw==
X-Received: by 2002:a17:90b:e07:: with SMTP id ge7mr42525003pjb.75.1634487726433;
        Sun, 17 Oct 2021 09:22:06 -0700 (PDT)
Received: from sbwpb-arch.flets-east.jp ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id mu11sm5155444pjb.20.2021.10.17.09.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:22:06 -0700 (PDT)
From: Tsuchiya Yuto <kitakar@gmail.com>
To: 
Cc: Hans de Goede <hdegoede@redhat.com>,
	Patrik Gfeller <patrik.gfeller@gmail.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Alan <alan@linux.intel.com>,
	Dinghao Liu <dinghao.liu@zju.edu.cn>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Deepak R Varma <drv@mailo.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/17] media: atomisp: pci: make fw ver irci_stable_candrpv_0415_20150521_0458 work - 5/5
Date: Mon, 18 Oct 2021 01:19:52 +0900
Message-Id: <20211017161958.44351-13-kitakar@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211017161958.44351-1-kitakar@gmail.com>
References: <20211017161958.44351-1-kitakar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is one of the patches which partially revert incompatible changes
in the current css version for ISP2401 (irci_ecr-master_20150911_0724)
back to irci_stable_candrpv_0415_20150521_0458.

Some `struct`s are `sizeof()`ed in sh_css_firmware.c file. So, I guess
issues will happen if these sizes are changed. Therefore, keep them the
same as css version irci_stable_candrpv_0415_20150521_0458 to make atomisp
work for firmware made for such css version since we don't have firmware
made for the current css version.

This patch removes the unnamed struct `shading` from
`struct sh_css_sp_pipeline` as well as its usage [1].

[1] added on updating css version to irci_master_20150701_0213
    https://raw.githubusercontent.com/intel/ProductionKernelQuilts/cht-m1stable-2016_ww31/uefi/cht-m1stable/patches/cam-0439-atomisp2-css2401-and-2401_legacy-irci_master_2015070.patch
    ("atomisp2: css2401 and 2401_legacy-irci_master_20150701_0213")

Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
---
 .../media/atomisp/pci/sh_css_internal.h        |  8 --------
 drivers/staging/media/atomisp/pci/sh_css_sp.c  | 18 ------------------
 2 files changed, 26 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_internal.h b/drivers/staging/media/atomisp/pci/sh_css_internal.h
index 496faa7297a5..92fb7e67610c 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_internal.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_internal.h
@@ -551,14 +551,6 @@ struct sh_css_sp_pipeline {
 			u32	raw_bit_depth;
 		} raw;
 	} copy;
-
-/* ISP2401 */
-
-	/* Parameters passed to Shading Correction kernel. */
-	struct {
-		u32 internal_frame_origin_x_bqs_on_sctbl; /* Origin X (bqs) of internal frame on shading table */
-		u32 internal_frame_origin_y_bqs_on_sctbl; /* Origin Y (bqs) of internal frame on shading table */
-	} shading;
 };
 
 /*
diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index 13b15a5a33bc..fa74ac172f94 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -1308,24 +1308,6 @@ sh_css_sp_init_pipeline(struct ia_css_pipeline *me,
 	}
 #endif
 
-	if (IS_ISP2401) {
-		/* For the shading correction type 1 (the legacy shading table conversion in css is not used),
-		* the parameters are passed to the isp for the shading table centering.
-		*/
-		if (internal_frame_origin_bqs_on_sctbl &&
-		    params && params->shading_settings.enable_shading_table_conversion == 0) {
-			sh_css_sp_group.pipe[thread_id].shading.internal_frame_origin_x_bqs_on_sctbl
-			= (uint32_t)internal_frame_origin_bqs_on_sctbl->x;
-			sh_css_sp_group.pipe[thread_id].shading.internal_frame_origin_y_bqs_on_sctbl
-			= (uint32_t)internal_frame_origin_bqs_on_sctbl->y;
-		} else {
-			sh_css_sp_group.pipe[thread_id].shading.internal_frame_origin_x_bqs_on_sctbl =
-			0;
-			sh_css_sp_group.pipe[thread_id].shading.internal_frame_origin_y_bqs_on_sctbl =
-			0;
-		}
-	}
-
 	IA_CSS_LOG("pipe_id %d port_config %08x",
 		   pipe_id, sh_css_sp_group.pipe[thread_id].inout_port_config);
 
-- 
2.33.1

