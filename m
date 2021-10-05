Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB6B2C8E
	for <linux-staging@lists.linux.dev>; Tue,  5 Oct 2021 21:45:09 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id m3so1820085lfu.2
        for <linux-staging@lists.linux.dev>; Tue, 05 Oct 2021 14:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7rbxU13hCRR7VNtMghpdfjVdrshNjD4ry7dhfbLByAY=;
        b=Q07ixe2MgbpweeYDtyXyEgv+dP3TG4SAB2MVNy3uKo6iAMn45i0rJ2u0KfHq4jQjz8
         uWXEAcovrKFjfsscARzCjN519xmJBcGIsjmB7z2qB5H4Bo64DoKbZC2ZsDUcyBvA09WZ
         RoGEvtWEQIyKYXllb8FDo7EJTw6ZJkxOv0DNkh3Pui5BLs0OEJ9Nx2cyyrCsL3I9SkA9
         UrvCkjUp/we0WCusUniFj+PmkrWfaPyN3Et0riar2OQJASlbqb6glkoOkfIMbMQWK+dU
         FlQCplymi/p/jOKB2DmQaeeEvk3+iKVaoyhCs7SIYKngdWdVwqGLydZ5ebvPDLlW834C
         E6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7rbxU13hCRR7VNtMghpdfjVdrshNjD4ry7dhfbLByAY=;
        b=51nF9ylkjnNewBMMf3qyPHKHaSOfH3pplWmDI34WSjiIKY8iNX9ysrsBkmjcylQwf6
         oHPe1ikwwAIn5iIs8ajtCaA2IS7MoZLITaoWwMPlTWlhcEGGo5E25vcj9/8vB/kyZKId
         e/qU+ZGgi9eRTcZsBcuSinfBgI6dQsZGv+P5VV8xaPkaEXedgMgjmViTecuP9CQpnwA8
         1xHut1COy+uemJDewrVmfGgGef8eyMVHxrxkgr9Q4IVA0YDGs0pAQ1CZtZ442e33Mue5
         J/qUrV45C/2WNn1v4Sz5SWqqw2OKtXqXG/Wer212fCdoTOiz4DAhRKudOXETYjMTAxqW
         /Ufw==
X-Gm-Message-State: AOAM531w6fTDxoCWDqGFZeJSeKR4Srz0Qf27PSlDJUHLMjbh0ZfoV83n
	NXpEoeAIIcJGefQKljBjl64=
X-Google-Smtp-Source: ABdhPJxQJgy3ahinA6WXe6sRnhSDKJuz6wSeiHzxPvCpY95PBROuNKZOmtWb6XrZSoh0MaoAvOTPwQ==
X-Received: by 2002:a05:6512:6c9:: with SMTP id u9mr5582410lff.319.1633470307383;
        Tue, 05 Oct 2021 14:45:07 -0700 (PDT)
Received: from localhost.localdomain (h-155-4-129-96.NA.cust.bahnhof.se. [155.4.129.96])
        by smtp.gmail.com with ESMTPSA id h10sm1054046lfp.7.2021.10.05.14.45.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 14:45:07 -0700 (PDT)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] media: staging/intel-ipu3: Constify static struct v4l2_subdev_internal_ops
Date: Tue,  5 Oct 2021 23:45:01 +0200
Message-Id: <20211005214501.15453-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The only usage of imgu_subdev_internal_ops is to assign its address to
the internal_ops field in the v4l2_subdev struct, which is a pointer to
const v4l2_subdev_internal_ops. Make it const to allow the compiler to
put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/staging/media/ipu3/ipu3-v4l2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/ipu3-v4l2.c b/drivers/staging/media/ipu3/ipu3-v4l2.c
index 38a240764509..b723186d2134 100644
--- a/drivers/staging/media/ipu3/ipu3-v4l2.c
+++ b/drivers/staging/media/ipu3/ipu3-v4l2.c
@@ -864,7 +864,7 @@ static int imgu_vidioc_g_meta_fmt(struct file *file, void *fh,
 
 /******************** function pointers ********************/
 
-static struct v4l2_subdev_internal_ops imgu_subdev_internal_ops = {
+static const struct v4l2_subdev_internal_ops imgu_subdev_internal_ops = {
 	.open = imgu_subdev_open,
 };
 
-- 
2.33.0

