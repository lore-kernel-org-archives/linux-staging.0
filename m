Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6F16D13
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 12:54:01 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id o5so21265259qkb.0
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 05:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=jlBCNsKvfBi7veyM4BL9NZbwtWHgYxGRX4dSVfblSNo=;
        b=fN+hxWgj8eADtHckIAH/XYZ20ZkcHUgU1+yAZgE+OGm2N/fNjOiEoJIq34+61XH/D4
         eOJD+z/oNqotFpnmZtqg19Z99TF3XL1L/QH9efTnQ1y8e2YmMHqKIQaWjD8XmCzpFcNO
         Pyg6rHgrjecDHNM3a3dLiE3IVEo8+H98ccPDUZCr2HAtdOcpd2HaQ20Q6zk2mfdPnoJM
         9qZZqpW6DJb4mWTmOV1cDc9mE4sYy3QsQNgFAgWSctUGMGoageKBvUDMaTAXTjiz/U7b
         38ugvwu7xDr5bQVNCIBLlm0NL+opyipJ8iH9eQ+SEt1BELiO40cdM2YL3fYdwVw11vd8
         UYEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=jlBCNsKvfBi7veyM4BL9NZbwtWHgYxGRX4dSVfblSNo=;
        b=mvtd8NLB0I4PTBbqhhxIEkNGLZB+yrMJ0TNIVKuYCCkE5Vec00J3GmpN4W4uLJKxJH
         qhFdxQRYZjk21mAmYqHpfp136SxLc0DVVtQmQOZVCrGeCA3u4+JTTZbsrTK5qfDZjAhN
         hmTHZLyAXbU+tBG7oUjZ/MesD/7X/LqN6mecGPrX9clyIQQrZGXrETcfeagcKJOYlOef
         AK6WD8zHiirDnftsK98LSJ09XMlt7P96E7PQuutn6zV+IIrOA/6Mb0ZtmTdTVwBoySdC
         OgF+hOrmoq698fDZs4WhaZ1786yIEwCVy2DzwMrrIhhm/KSys0wkQGYtM0ISGUNmxsAW
         MXtQ==
X-Gm-Message-State: AOAM533T8Btw5TqWQoBMLuLbSlm/FSH+eA14DPSiQf+QsZQ5Ras/ldZP
	+BxsmoDyN4lPNolLtNpt5lc=
X-Google-Smtp-Source: ABdhPJyIpRsaj7QJwaR7PwS3OIeRH8EVgZEPlm8/xomg8OoXYkF7JxrzqzZmH7vFYHgNi+7dqT/naQ==
X-Received: by 2002:a37:4389:: with SMTP id q131mr24259247qka.255.1618404840937;
        Wed, 14 Apr 2021 05:54:00 -0700 (PDT)
Received: from focaruja ([2001:1284:f016:a037:7038:c088:ae60:452d])
        by smtp.gmail.com with ESMTPSA id j129sm12197652qkf.110.2021.04.14.05.53.59
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Wed, 14 Apr 2021 05:54:00 -0700 (PDT)
Date: Wed, 14 Apr 2021 09:53:57 -0300
From: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH v2] staging: media: omap4iss: Remove unused macro function
Message-ID: <20210414125357.GA13767@focaruja>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)

Remove unused macro function "v4l2_dev_to_iss_device(dev)".

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---
 drivers/staging/media/omap4iss/iss.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/media/omap4iss/iss.h b/drivers/staging/media/omap4iss/iss.h
index b88f952..3f587e0 100644
--- a/drivers/staging/media/omap4iss/iss.h
+++ b/drivers/staging/media/omap4iss/iss.h
@@ -119,9 +119,6 @@ struct iss_device {
 	unsigned int isp_subclk_resources;
 };
 
-#define v4l2_dev_to_iss_device(dev) \
-	container_of(dev, struct iss_device, v4l2_dev)
-
 int omap4iss_get_external_info(struct iss_pipeline *pipe,
 			       struct media_link *link);
 
-- 
2.7.4

