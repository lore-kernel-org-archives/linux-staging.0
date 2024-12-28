Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB42158A09
	for <linux-staging@lists.linux.dev>; Sat, 28 Dec 2024 06:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735367180; cv=none; b=JDdpGAOkY5fRWXzFVc5gbDjme2F5mfIJLDfVyqS/J9ieQVfATJqPSt+AybiIXRVtkgaXibHM+AEW1a9XjRILsN2I7ZnTAoF6Nx0LbdyZB25BztoctfETtip97u9NVwxgPaGjKYMumz0+QMCGTuGjiX8NEWrQ5azeuWAnBf0Od1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735367180; c=relaxed/simple;
	bh=XgIP7ydbSSF1qKIvGtwIuD4MnhazIW69u73z/eHeulw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eKTMPmRRjncDAsGQ/vGfE+/yKJIpB9tHAQ/4POJoYx/oavvoRX5fwesvNjUIDo2hzW/tBsua+e95d85IpNRgFUZH/NW0yYIwf2WO1abXjIn5MzEUUb50SupfWVQywkTzkEmcTthbF/hpTcTQoMGvfzVUK2RDra25Eaa1dYQPUOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7TvIRew; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7TvIRew"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ef6edddf70so1327889a91.2
        for <linux-staging@lists.linux.dev>; Fri, 27 Dec 2024 22:26:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735367178; x=1735971978; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RV2xfTJdjm2bzq9KK7gXgoeX/vt6XGKV0XWnfw/XSUg=;
        b=Q7TvIRewa5T1sdMN+bhXvrnLYIzTCrZc6r1BB/ARcRcQm9bHRYkjG6WaCLlW+bQOnZ
         CkmPTNcOOSM1VAS/uadX9zwNFATKhoslCeonIE3iNhM6fhdPHyJnoNwWfwto+4gHE5M6
         Ma35cT/0xS3SzL3XOZyrVjnDmoMf/WWjGnH4v4IgqUZRESYSvPmuovmJ6oFav8f93aF2
         rgLrhECqzlanpPa4N0SMXkz1dttPSfVTf3RD4IhsIVCD/GljEWesmeZR5RSvmCmYBWzS
         mw0lR8quVDzSWzXEVZ94FfRJmAKWJl2LpKTvKVMdaOQD36ZTddasbLPO+HZGXFrN8pR4
         XfEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735367178; x=1735971978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RV2xfTJdjm2bzq9KK7gXgoeX/vt6XGKV0XWnfw/XSUg=;
        b=cJGUP4PoOp5TM/0j9I3BWiPXebHd3TYEck7DSe1vgD8IFQ2MR0z+eD7CPy20WaxMqe
         3cgK1n5GDOZ7tM1VHlmR152RvH5O+hmvB6LFoDlly/yk1utwVnNOfEtbyiU9kCdz5CyS
         igkWvC+a7S7TD16v/FpIaayIfXxCwqIc4YnqQlouZRIWbpGKqcck71lTNxH8MSK1+qjf
         CQtzUmMPLZRVPKCsefF0l8e6ny5d4W8AdZiqKyAVr9awctQgCbpU0FUkSolwCM4JvJj9
         aUhTq1qTTsnccV4qevQd1w/f1cEO4NSwm5j7xHBeKExDB+rqa1QtkTFy2TWmH7J1svEc
         l9ag==
X-Forwarded-Encrypted: i=1; AJvYcCVoSlNqoGo0taaprpgBzawyi9bkYjoOk7xwvmUGeMaj3/C264lS2CpDxbgi9eMIRiDolme55RGEagDQM627@lists.linux.dev
X-Gm-Message-State: AOJu0YxyMl71HY9stGheVNrD6Q27KuMRoD1ay1difYHiO3DMq67IZD9S
	FJoii7E0wOm9OcIAihllYHbmlaz2wEOPkoDcwl0vd9rRKbGzrvrT
X-Gm-Gg: ASbGncu6qytZP8W+sEkn7qew+57zJL2zEDDYY4xkY21W7gESWGzdQrKern+WtMhJlff
	z0Ms7qJt91BzYYqi2gvwVa6ImovIeZ5yeIfxgNFfbKtp/Heo8Leh16wEwDn7r/DBkiDWUaeF+3y
	44yCE7/Ok5fKVdIIHa6Mev9s2Udf20ccv8OF/R+Yd5m8DkgqbV3l+OS0DzTooLEMqt9KAG+zDXE
	T0iAH4u/OS7sJ+S8AGwTVX5gdv/bVkJmaRGwv2dgG6CrzCy7V3E2SI=
X-Google-Smtp-Source: AGHT+IG3Y3OdDd1e6JZB0O8cIIzEcIgy1+yiVFKk94rFCnG7GYGL0L5YQpdSR4NKOq1eERWh8aax2w==
X-Received: by 2002:a17:902:e750:b0:216:32b6:cf0f with SMTP id d9443c01a7336-219e6f108ebmr162603095ad.12.1735367177843;
        Fri, 27 Dec 2024 22:26:17 -0800 (PST)
Received: from ice.. ([171.76.83.141])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f73f6sm144479455ad.222.2024.12.27.22.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 22:26:17 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v5 14/15] staging: gpib: pc2: Handle gpib_register_driver() errors
Date: Sat, 28 Dec 2024 11:38:02 +0530
Message-Id: <20241228060800.107653-15-niharchaithanya@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241228060800.107653-1-niharchaithanya@gmail.com>
References: <20241228060800.107653-1-niharchaithanya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function gpib_register_driver() can fail, resulting in a
semi-registered module and does not return an error value if it
fails.

Unregister the previous gpib registering functions if subsequent
gpib_register_driver() fail and return the error value.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 drivers/staging/gpib/pc2/pc2_gpib.c | 34 +++++++++++++++++++++++++----
 1 file changed, 30 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/gpib/pc2/pc2_gpib.c b/drivers/staging/gpib/pc2/pc2_gpib.c
index 7b3b34f47341..4441939265e4 100644
--- a/drivers/staging/gpib/pc2/pc2_gpib.c
+++ b/drivers/staging/gpib/pc2/pc2_gpib.c
@@ -635,12 +635,38 @@ void pc2_2a_detach(gpib_board_t *board)
 
 static int __init pc2_init_module(void)
 {
-	gpib_register_driver(&pc2_interface, THIS_MODULE);
-	gpib_register_driver(&pc2a_interface, THIS_MODULE);
-	gpib_register_driver(&pc2a_cb7210_interface, THIS_MODULE);
-	gpib_register_driver(&pc2_2a_interface, THIS_MODULE);
+	int ret;
 
+	ret = gpib_register_driver(&pc2_interface, THIS_MODULE);
+	if (ret) {
+		pr_err("pc2_gpib: gpib_register_driver failed!\n");
+		return ret;
+	}
+
+	ret = gpib_register_driver(&pc2a_interface, THIS_MODULE);
+	if (ret)
+		goto err_pc2a;
+
+	ret = gpib_register_driver(&pc2a_cb7210_interface, THIS_MODULE);
+	if (ret)
+		goto err_cb7210;
+
+	ret = gpib_register_driver(&pc2_2a_interface, THIS_MODULE);
+	if (ret)
+		goto err_pc2_2a;
+
+	pr_info("pc2_gpib: module init is complete\n");
 	return 0;
+
+err_pc2_2a:
+	gpib_unregister_driver(&pc2a_cb7210_interface);
+err_cb7210:
+	gpib_unregister_driver(&pc2a_interface);
+err_pc2a:
+	gpib_unregister_driver(&pc2_interface);
+
+	pr_err("pc2gpib: gpib_register_driver failed!\n");
+	return ret;
 }
 
 static void __exit pc2_exit_module(void)
-- 
2.34.1

