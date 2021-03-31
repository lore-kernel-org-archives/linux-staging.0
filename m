Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AFD36F
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 09:40:48 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id l18so21536281edc.9
        for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 02:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WC93Jj91nT0yHUtoR6XD1Ph0OiGFSURlPEL1KdaqINI=;
        b=jwE4Bumc/4JCW5XYmdIE82e0POJpxlMwT6Dvl8Q9TD5SFWsnpdLXTX1+RZKDYR+/7Z
         d7CiKIoW08jWJ8kolU2dpDg+IV8cbVY+m5G/MLqmfkFXc3wMz6wptEqlEOcVFxxcSAZS
         gSL0o5zXq8ZEoWeElTYUzN7GIE+SIqSM5NUUDcgimzcW+aJkqYCIQ9syUKyXCE9/VkIK
         snRTC85TVd4v9n9m0P+y8XKKAErUcsHETCCAajJO94XuxjZ/UyNUBZ5uiTexjVjHG8Dy
         gxDW2IBNuS+RKh9DwVHVgN8BW3rzWnis7CvUD4EmH7gvPODRmPmwtF8v42YqavISdHI3
         Q+dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WC93Jj91nT0yHUtoR6XD1Ph0OiGFSURlPEL1KdaqINI=;
        b=j5i5ZftPEgaGgQrXqGghkGaam623+Mu+Cy6jeIoa4VlILsAW4JMv2qoOa0ukOT533G
         Mt/0MBAHiRNeAL0jNwTEGee2U3ghzu+22TbvK0MrXo0Bf4fKhY5AReXIn1MnPRB3d1aH
         /Y7qassbXkEos7/lY8hzPYWqO2xRcSqNNA8L9F5w904UBwHNUaUyYpDuy9po0mytSRMQ
         XLwPtupAv2YRagwTgX4K2Q/N17WmkptkQIQN1kn2JUo8MyMHUBeqeJe8/smRnu9iY/l0
         Jnu/GGceic2NpM6sS2CX9U7UuBAPTh8cCyav2eYefq43BKJTQDn9uzDIr0wBxP2Ix4/6
         fT8w==
X-Gm-Message-State: AOAM530brMlgbo5AArm2lLiZcMkN3KfFyopJJ7veYK5uXIaI8MC1Ovfa
	RCfc7c6Fs25xLh9y32X9qpg=
X-Google-Smtp-Source: ABdhPJyhHs+E37K7WkRjfykrsPqBFemi7Q1L8zEdGOSdXgfuPSp9puVT3haRJq3aalGfRUht2DXEoQ==
X-Received: by 2002:a05:6402:3115:: with SMTP id dc21mr2601112edb.173.1617183647086;
        Wed, 31 Mar 2021 02:40:47 -0700 (PDT)
Received: from agape ([5.171.73.44])
        by smtp.gmail.com with ESMTPSA id z9sm1147155edr.75.2021.03.31.02.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 02:40:46 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 18/40] staging: rtl8723bs: added driver prefix in log messages
Date: Wed, 31 Mar 2021 11:39:46 +0200
Message-Id: <a6cf9cf83491f4dc0ea17d4aa084945d2e57fcef.1617183374.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617183374.git.fabioaiuto83@gmail.com>
References: <cover.1617183374.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

added driver prefix in log messages in hal/rtl8723b_hal_init.c

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 0f7da8dbd80c..7b92bc5ed1c7 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -396,13 +396,14 @@ s32 rtl8723b_FirmwareDownload(struct adapter *padapter, bool  bUsedWoWLANFw)
 
 	rtStatus = request_firmware(&fw, fwfilepath, device);
 	if (rtStatus) {
-		pr_err("Request firmware failed with error 0x%x\n", rtStatus);
+		pr_err("%s Request firmware failed with error 0x%x\n",
+		       DRIVER_PREFIX, rtStatus);
 		rtStatus = _FAIL;
 		goto exit;
 	}
 
 	if (!fw) {
-		pr_err("Firmware %s not available\n", fwfilepath);
+		pr_err("%s Firmware %s not available\n", DRIVER_PREFIX, fwfilepath);
 		rtStatus = _FAIL;
 		goto exit;
 	}
-- 
2.20.1

