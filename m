Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2677529CA
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 16:20:47 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id g5so9630835plg.1
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 09:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=U00ruTBIXRJgbnte4h6umYs04Hf2Jn1ltdCVoHTbMog=;
        b=j8t9n4DTolVN2UjTZru9R8vl6ztjRFfSczDy0L8gN4I/QfGrR+79kKppwfOlQJVQBL
         I3nNBBw/I0/Ra82gWazQQKcrZUT9qqiQFNnOUmmfM/+EE8IzkOwzT1td3LjeoqqR/6sy
         ks+yDJ90WY4+To7A24+Zp8eRfqTb0AxxGnHvsMCRIVrNYpTWCfF6PUqa2z0NnWvB3UQi
         IzNPS3sMFr2SugSQZm/a6fhW7OpNBKncmhhesi67hj8EGIshmf1DbNUSuzKFx0eOyikA
         XdqLwRAQUnyloYh92bHj40c1P1TWq6cA5IITw1K05PWZfzoiJvA4bIyiNF6DLM4WyGPV
         dNuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=U00ruTBIXRJgbnte4h6umYs04Hf2Jn1ltdCVoHTbMog=;
        b=kaFGqWeN2KujP46TpscLvq3Avkam8N5G7XiamneXCajYbErXwY3Qw5JH/K+SE6l8Kg
         ZMI8KzcfFwZVnM6h4N++b+4pVlnNTDnZYsvOnatz96Y5S7yzeH3ZAZZyUpNi7pcjn7pc
         VRnx/KDSqyuG4L1zSiYbYNdhlkzoxDr+haz2msCHTkPYe03IO0y0OU62MCeTmr8uTuZQ
         cOj8qITTvrWp8C3liEpMUI+CoiyP5n0xKeKghjDz7G2Dg2knMDtRkHSezoFilP0+FsK6
         uQN5j1X2DNq1ltqTBGAhdUE8MamuAm94785H/m8QkOgqhdzyiyCtQNGjGB27N48S2VTs
         pXcw==
X-Gm-Message-State: AOAM530UUduDI8RCntNf6iPAe9G+YxD4QBoengJ1IS908Oly4qvvZFwz
	g0xnLkfUX+y4CVObQplXPts=
X-Google-Smtp-Source: ABdhPJw9hheYwIYL5WJPaGEsn6dIeE1Ivg3cE1fIj8Pf+5a/ylyGzvit1kHMgVyAXgbYp+d90G+m6g==
X-Received: by 2002:a17:902:c942:b0:13f:d1c:819a with SMTP id i2-20020a170902c94200b0013f0d1c819amr22616523pla.64.1634487646654;
        Sun, 17 Oct 2021 09:20:46 -0700 (PDT)
Received: from sbwpb-arch.flets-east.jp ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id mu11sm5155444pjb.20.2021.10.17.09.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:20:46 -0700 (PDT)
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
	Dinghao Liu <dinghao.liu@zju.edu.cn>,
	Alan <alan@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/17] media: atomisp: pci: fix punit_ddr_dvfs_enable() argument for mrfld_power up case
Date: Mon, 18 Oct 2021 01:19:42 +0900
Message-Id: <20211017161958.44351-3-kitakar@gmail.com>
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

When comparing with intel-aero atomisp [1], it looks like
punit_ddr_dvfs_enable() should take `false` as an argument on mrfld_power
up case.

Code from the intel-aero kernel [1]:

        int atomisp_mrfld_power_down(struct atomisp_device *isp)
        {
        [...]
        	/*WA:Enable DVFS*/
        	if (IS_CHT)
        		punit_ddr_dvfs_enable(true);

        int atomisp_mrfld_power_up(struct atomisp_device *isp)
        {
        [...]
        	/*WA for PUNIT, if DVFS enabled, ISP timeout observed*/
        	if (IS_CHT)
        		punit_ddr_dvfs_enable(false);

This patch fixes the inverted argument as per the intel-aero code, as
well as its comment. While here, fix space issues for comments in
atomisp_mrfld_power().

Note that it does not seem to be possible to unify the up/down cases for
punit_ddr_dvfs_enable(), i.e., we can't do something like the following:

        if (IS_CHT)
        	punit_ddr_dvfs_enable(!enable);

because according to the intel-aero code [1], the DVFS is disabled
before "writing 0x0 to ISPSSPM0 bit[1:0]" and the DVFS is enabled after
"writing 0x3 to ISPSSPM0 bit[1:0]".

[1] https://github.com/intel-aero/linux-kernel/blob/a1b673258feb915268377275130c5c5df0eafc82/drivers/media/pci/atomisp/atomisp_driver/atomisp_v4l2.c#L431-L514

Fixes: 0f441fd70b1e ("media: atomisp: simplify the power down/up code")
Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 0511c454e769..f5362554638e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -711,15 +711,15 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
 
 	dev_dbg(isp->dev, "IUNIT power-%s.\n", enable ? "on" : "off");
 
-	/*WA:Enable DVFS*/
+	/* WA for PUNIT, if DVFS enabled, ISP timeout observed */
 	if (IS_CHT && enable)
-		punit_ddr_dvfs_enable(true);
+		punit_ddr_dvfs_enable(false);
 
 	/*
 	 * FIXME:WA for ECS28A, with this sleep, CTS
 	 * android.hardware.camera2.cts.CameraDeviceTest#testCameraDeviceAbort
 	 * PASS, no impact on other platforms
-	*/
+	 */
 	if (IS_BYT && enable)
 		msleep(10);
 
@@ -727,7 +727,7 @@ static int atomisp_mrfld_power(struct atomisp_device *isp, bool enable)
 	iosf_mbi_modify(BT_MBI_UNIT_PMC, MBI_REG_READ, MRFLD_ISPSSPM0,
 			val, MRFLD_ISPSSPM0_ISPSSC_MASK);
 
-	/*WA:Enable DVFS*/
+	/* WA:Enable DVFS */
 	if (IS_CHT && !enable)
 		punit_ddr_dvfs_enable(true);
 
-- 
2.33.1

