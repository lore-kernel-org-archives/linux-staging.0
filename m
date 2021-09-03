Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5276F3FD5
	for <linux-staging@lists.linux.dev>; Fri,  3 Sep 2021 20:07:01 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id u11-20020a17090adb4b00b00181668a56d6so297300pjx.5
        for <linux-staging@lists.linux.dev>; Fri, 03 Sep 2021 13:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=7SKmff0zrrH1w49z5jJaIN6IY4jJPGhaALSgqxYy2W8=;
        b=GhOo0mI6+aIftk1kdtC9L9hRp9VGV9ngkX8L7KZCmXvM8Ik0zwIRHShuiVEbJSWyBN
         KGC9cYvWrT3iy6qsvsawu4mxxscqTQqKZ3ZYRnyFklJrIE5Q+ITQJpHA9yeOaUO/0/kM
         qpEerGanmaieNCbxOevKQuCBU8fvJPnFgIar/Cy+g/R/Gx1llDx2+uqncS+s2M0cp3oA
         3CWP+4KtI91RuxASC806HuzTU5jEBuBFX5IzXXvIYYrGYGwC7Uz25rykszb+dP06vxlX
         yE5lhQHS/uWRt5MJ4z0JuhX4BEXDnHzn1sEB2sPhVvbvPD0a+sOudYo8Vo1hNOlyfoDM
         d7Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=7SKmff0zrrH1w49z5jJaIN6IY4jJPGhaALSgqxYy2W8=;
        b=jujKkuV7As8uWHUr+q8XhZmxQIaOKvrZWpyaq8roBmDgZgO+l4UyeMY8UmKep/WD2f
         UpvQ7E3FhQI2Ifa3tGIPn7bPba68NDDmVPEL99usDArG3gflAuGoWKNcjSRYCjcfMvdP
         LeJ/JIUYDxY/CFJhaVD/S7fz+mVpFahTISvjqG1EGsUmcrgIaYSX4XRId+hyByPA57oE
         rwQYIwgCefFkUKCquQnho3fFQ0vi0Rqozw3M50+crqFrWIMRWrDp0efQ272kLQXh61/0
         sfGscZYAJJX9O1Zt1R489dbhzCJME9dJ5OZh+sm77Yrs/F0uFqQYsWWYfonqQdwuj1pq
         dOjQ==
X-Gm-Message-State: AOAM532mojrh2eOE/e3zTkF/n1EyT8op5FprqHcLcxqN1iyopnPRKVS9
	X8w75fVbf6sAdQ6hPenynwQ=
X-Google-Smtp-Source: ABdhPJxdP3BhrYU5mYB8C0xEj7WZ7NjtPgFTcQBAfduPgBrOo1qOE0A6WfrTqKRyUWKWL0iDePFb4A==
X-Received: by 2002:a17:902:7e4d:b0:13a:8f:42d4 with SMTP id a13-20020a1709027e4d00b0013a008f42d4mr535689pln.62.1630699620704;
        Fri, 03 Sep 2021 13:07:00 -0700 (PDT)
Received: from ip-172-31-53-182.us-west-2.compute.internal (ec2-44-242-40-232.us-west-2.compute.amazonaws.com. [44.242.40.232])
        by smtp.gmail.com with ESMTPSA id b69sm209965pfb.64.2021.09.03.13.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 13:07:00 -0700 (PDT)
Date: Fri, 3 Sep 2021 20:06:58 +0000
From: Alakesh Haloi <alakesh.haloi@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Pavel Skripkin <paskripkin@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] media: staging: media: atomisp: fix return value
Message-ID: <20210903200658.GA552296@ip-172-31-53-182.us-west-2.compute.internal>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This fixes following error seen during module build
error: control reaches end of non-void function [-Werror=return-type]

Signed-off-by: Alakesh Haloi <alakesh.haloi@gmail.com>
---
 .../media/atomisp/pci/hive_isp_css_common/host/input_system.c    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index 8e085dda0c18..5d088d6fb01f 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -1646,6 +1646,7 @@ static input_system_err_t input_system_configure_channel_sensor(
 	default:
 		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
 	}
+	return status;
 }
 
 // Test flags and set structure.
-- 
2.25.1

