Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1B82C81
	for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 21:57:18 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id oa4so9674866pjb.2
        for <linux-staging@lists.linux.dev>; Sat, 16 Oct 2021 14:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lR7v2SeiI/rPTDpitBfRCXahGE0ZCHzarZSpq+/okuQ=;
        b=O/rj1uASFAU7AVI7upqHkb/IgntAN0O5+JJqCM+1f7zJqD5BfrRhNWYIW77zzwENlr
         CKiPr/inPoD1hARjNIKkZBzNsT7DJ7Yg91HSAMfVDXgLdGDoEzSTZ7XQ8qfWKZzCg18Y
         5LEONqJDaVEjTjKN02SJJn/7D+kDM99lU5UbAAeiFazUSi7fNC3ZrDz4lCFRn0/VCvs1
         XTi4uT9Q29IENgEH+dmyU/FlGv4aQcTUfSUIoBslMqW6NoOEWOQP7vUULDiF1m7ph5MH
         /uGAzmXg08Yn94H5zB9TdELb3OwHrYSEXBlLkMMpoJeh36nbgvCEtIWDjbF/dtH6DxvN
         RHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lR7v2SeiI/rPTDpitBfRCXahGE0ZCHzarZSpq+/okuQ=;
        b=1mtiEGIKfz0juQRyGhNZ83lk/qxA+qiaJV4OsEByj3pKx2+V17zAcforvTsDjfPZjP
         3dxwtQLoU4G8B73KZhcqnB2LTVfQKowQYcINA5rOeYM8Z2OblAfsoSrnc2bDAfnwV1GE
         C05BeRPZrA5j1terjRlDXIXzazosqpYq4zUXnLRobTMhH1zxqqFz7dwa5bEBphzd73U1
         QYia9x+l8LvSZGHohT3wBFZN06w1HAzxaT/R/NnyLBXqqYxn92/Ay1VJ5721n7yTfRpW
         kSz+YAjmOSC6O3sA8aFLS8yZQCyjji5FjhuRlCZ2iV5Z+iIKLUlkZvJlrGIRtdUybqJc
         pQww==
X-Gm-Message-State: AOAM531P9Y8gDzqlqFxuHomviefGYPHC5jf3N5RzL5LcfhiFUQ2lUV33
	S48NLwoWKzjHXg5wFVkQau4=
X-Google-Smtp-Source: ABdhPJxLq4+FJHPQaRNEEuI8Y2uczN276b3TXoygp2NtPHHqEResNravQTmRhPjApKGg3CtJgkT82Q==
X-Received: by 2002:a17:90a:71c5:: with SMTP id m5mr37000621pjs.105.1634421437722;
        Sat, 16 Oct 2021 14:57:17 -0700 (PDT)
Received: from localhost.localdomain ([115.96.219.100])
        by smtp.googlemail.com with ESMTPSA id y3sm8630080pjg.7.2021.10.16.14.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Oct 2021 14:57:17 -0700 (PDT)
From: Kushal-kothari <kushalkothari285@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	mike.rapoport@gmail.com,
	kushalkothari2850@gmail.com,
	kushalkothari285@gmail.com,
	outreachy-kernel@googlegroups.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	nsaenz@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH] staging: vc04_services: Fixed checkpatch warning: MSLEEP: msleep < 20ms can sleep for up to 20ms.
Date: Sun, 17 Oct 2021 03:25:27 +0530
Message-Id: <20211016215527.119189-1-kushalkothari285@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Kushal-kothari <kushalkothari285@gmail.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 6fbafdfe340f..80a7898c5331 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -857,7 +857,7 @@ vchiq_bulk_transmit(unsigned int handle, const void *data, unsigned int size,
 		if (status != VCHIQ_RETRY)
 			break;
 
-		msleep(1);
+		usleep_range(1000, 2000);
 	}
 
 	return status;
@@ -894,7 +894,7 @@ enum vchiq_status vchiq_bulk_receive(unsigned int handle, void *data,
 		if (status != VCHIQ_RETRY)
 			break;
 
-		msleep(1);
+		usleep_range(1000, 2000);
 	}
 
 	return status;
-- 
2.25.1

