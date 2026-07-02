Received: from mail-lr2-f1.google.com (mail-lr2-f1.google.com [74.125.230.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AEA4ADDB4
	for <linux-staging@lists.linux.dev>; Thu,  2 Jul 2026 13:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783000580; cv=none; b=oMZbYXFRyKxlJtf6PstLUTZJm8ABDgX8DXS0T1ujoOFaNpdt31AaLnG105OezCK5mCa0cxEz7/VLQ0Kw26naYvtB1T0j9TuHSyqyUWasBpueUMBqNH0g+yBgkoye0eAfIFW36EMT2AIN7Yc/n4g2UZ8P4UYQqfXNaoZpNkMuNK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783000580; c=relaxed/simple;
	bh=CQ0bp6OhR5tg/MytInxf6VKRq4vmyqKV76VIK1Ch3B8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S7W8V8crZKaAGxSvvPlUx1aK7lyv2UgGO8zXUNzzlfDX7l402FM1ZgZh5KFk/hwCcGxjQWWH6xtsXjZBIQNTM1pb4FxLLyFhts1aRB2qRnW0f7px7oaujsHEpFVwiWmYbluLGyQTqnxO3S7DEnhafCK4U4oqyW/jZIiXbtbrLH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rjZFQ6Bn; arc=none smtp.client-ip=74.125.230.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rjZFQ6Bn"
Received: by mail-lr2-f1.google.com with SMTP id 38308e7fff4ca-39ad562e5baso9753501fa.1
        for <linux-staging@lists.linux.dev>; Thu, 02 Jul 2026 06:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783000577; x=1783605377; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3affFkiTwyTVm9batdmWSlqrtZKDQ29P9VlvW5c4Ecw=;
        b=rjZFQ6BnnErt9MY8FmgBeLggtQoNa0yc+lcf75zrwPNUzPTlUqg5zuho9BmuxLR+MT
         e1i3XQl6yP3oWrMSUaeIk4jUtti9ZBHMf1O+pfD4llytag+CYtMP/4GcxluKPkdg5F3H
         oUA8MvMwwbGvhDqA7YFy3CCKGsraSfuDvzxWoT5+y8dJWCjKBrAA/iUdvOP4qc43o69g
         aqxiZmlba/ZxLg/dbKhSmsmWCqWyKJP+q6tFVxPNNJ2vOV/5HhSrvovhzlrmjQ42WwEp
         vM4TPm7boNjoDri5VKP1rcy9FQfz/fufQrvPO28ceR5+JKcVkiV/mijMhHzgY6c/iABi
         u8rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783000577; x=1783605377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3affFkiTwyTVm9batdmWSlqrtZKDQ29P9VlvW5c4Ecw=;
        b=omjYPrjnpyw13+fJ3fp7HpA6kamvYBbK73EYYbeR3Sq14EVwBtGzeoKqY+W5iZuemg
         BHyyKbhqq4h8aOL+cW/cPG4b35USAQqlkEm5I7LHchIyF+LOYBLuy2CDosEJLYYs4PtI
         Rex/qAlyU0VhBhctn4Dzrg2h2V8Cmll1gdWLk79Vs3GtCWjSeIT0BbtT2utKs3FxIziR
         louUkg7P6iF2RBWOFYKP+yka4eq3Z9rIXEweXfbtAjyUM1S6b8j6eoqq6RQW6wyKKd48
         Et9ynDLiPwKldMQHg5v08fTCRQ37B03jVZdxKuhK15uTpMSXbEVlCcI7sOU7gEQIvkrU
         Ei8w==
X-Forwarded-Encrypted: i=1; AHgh+RpHoQzuMToTbs9Z30fA3HopT4wfMtnnNDw+G47MEIYjbO+AGe4l48CvqH/8KZRvx8V/Pu2nDombLyfIZLbq@lists.linux.dev
X-Gm-Message-State: AOJu0YxvX/bIexfqMhAoDdZaJeSAqa6VSDH1G64d2lnsztn0lh6314ZW
	2cAm/7oTqpV+WUiP6ioBBTMTaPK+N9Rf7uAg6HdzGY6GiDmdkZRP2hWWq4P9zsk0o4w=
X-Gm-Gg: AfdE7clanX8q3XyF5Q9mRKFXDgD+LBpbii+Kn7KFOHLVjDtv/VvDq5iZLxnU5Pbby9k
	Cog/htPLaOAzAmeIRw9apVPsuqHsFNVOo/PoKuYr+UfUaHqODMctheAMAhP7mUzduLEGd1mtSam
	fHYyEA+lr1GhaOF5PJoD14XaAFlKcwEJkYVeUDSWLLlAJjYkSNdZb4uIKs8X4kMTcqHst04NR/w
	KD96gOjJLDmOoD8p8P08lPbwciRb7oSpEtVgAWBh7I0YdWHZKFDpOEfEYXMA7lcTqZdhAZAZA3D
	0JIjPzFhBeuLVYZ3SBIu2oieROkKFVanAFSLPBNT8mIuRCUn/Al7dCQl3GGCGtg48hIh7YziqML
	5d0t9UolY7BjGizRdtwdiJklEJeTfjw/6tRgnaioGPdbSDQV4KMefJtuO6tSg1WqeW32Lc60pPE
	zOXUwNx/g5
X-Received: by 2002:a05:6512:138e:b0:5ae:bcf6:b07c with SMTP id 2adb3069b0e04-5aec6795a7fmr1431877e87.4.1783000576377;
        Thu, 02 Jul 2026 06:56:16 -0700 (PDT)
Received: from arch ([93.177.236.219])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89919bcsm720820e87.11.2026.07.02.06.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 06:56:15 -0700 (PDT)
From: "Bohdan D. Marcus" <bohdandmarcus@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Bohdan D. Marcus" <bohdandmarcus@gmail.com>
Subject: [PATCH 1/3] media: atomisp: fix block comment formatting in atomisp_internal.h
Date: Thu,  2 Jul 2026 16:52:28 +0300
Message-ID: <20260702135230.19030-2-bohdandmarcus@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260702135230.19030-1-bohdandmarcus@gmail.com>
References: <20260702135230.19030-1-bohdandmarcus@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a block comment formatting issue reported by checkpatch.pl
in atomisp_internal.h by moving the opening '/*' and closing '*/'
lines to conform to the Linux kernel coding style guidelines.

Signed-off-by: Bohdan D. Marcus <bohdandmarcus@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_internal.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_internal.h b/drivers/staging/media/atomisp/pci/atomisp_internal.h
index 5a69580b8251..6c4aae4e9b7c 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_internal.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_internal.h
@@ -182,7 +182,8 @@ struct atomisp_device {
 	struct atomisp_mipi_csi2_device csi2_port[ATOMISP_CAMERA_NR_PORTS];
 
 	/* Purpose of mutex is to protect and serialize use of isp data
-	 * structures and css API calls. */
+	 * structures and css API calls.
+	 */
 	struct mutex mutex;
 
 	/*
-- 
2.55.0

