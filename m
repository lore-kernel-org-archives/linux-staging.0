Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B79486336
	for <linux-staging@lists.linux.dev>; Sat, 28 Dec 2024 06:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735367157; cv=none; b=Eq8gp+9Yx6BFVe3wlgOxGDFwffJri/tUcwv0X8MNqn96O5If7YwBTwzmTKc0MdC98tWzf7T9NflXwBRdQvRj+zcTMfluQ2zqMv3/QI7R6cYpLwhOe5LFK5t7nZZmR8Jsj9XjegTCr6SDUO5zBVGWRHo1nvLJK3sG3rC9rijfsac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735367157; c=relaxed/simple;
	bh=DiRa9ccQiQCl1NUp1iOeJ2P/1FNzMtrAQ1t/b/E9lew=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qifd4b6ZGXG1uA+ymutEX8FNgyNwqPoHPs/tz8XC3LkncsVCSPj6YgXnK2JBqJVm+FPfVvtzykrjBmAlp3613M3ZrSOKuq5UsUNI547nOkBSrbIreKhojK/hZR9nfJ9FBHyzETA1r3YiA+TllzFUmo8K/oXszjA6o2QYeH2bme8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RtcqsprV; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RtcqsprV"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21634417587so12503185ad.3
        for <linux-staging@lists.linux.dev>; Fri, 27 Dec 2024 22:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735367155; x=1735971955; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U1VfslPjbzPmT9c9bSTxnlZCAB7dXV/7Mr2zyjVr3jQ=;
        b=RtcqsprVJn77GWXU24zDKVb9KFDH2Gg9/QToRyk7dikDd0vdYTlT3TNcrdUMISPDIU
         7Zha2q5sd8qu2j9hEJCZGqvFq0jWmvRMtauKOLec6g2qcHkHTpEVLpplA6eHixmfnAuJ
         5Ca5J+9E2pIhe3wDV8mT1w6UrX7V0+6paipaFsczZORJd6lgEis+bnSuPr4ZSsRE2jKc
         8FA+xboiVS2VhtmcpTosGyQCDY1nDrp5XB9OhaYHnJY9+fMeVcJM1UMMZQ00DP9/15hP
         RAzw07d44p3E7IuhaZbZJIhMKbHlYeKIvhFesVOLHUGd0BQJgKjZsyhrhcixh3VJ1BJm
         U0JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735367155; x=1735971955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U1VfslPjbzPmT9c9bSTxnlZCAB7dXV/7Mr2zyjVr3jQ=;
        b=JtAwfmUzXk+ZFA6RejYmPI1GCE4tAk4PdKuYw8Qcz4AaUSJbTphGKXUFTDz6NY4prS
         TO1sADEc/w9DiwMuAwHhSfq09HBWIzccJFUqVBii2uIVQt2EOQWsoybM/azsPcs5sHTC
         PAkquFGUNtR5BO6JLEYbs3d292d0uz5U5pOdsKLq3j6g4eVhfJxrwk2PdZGDUxiXASyn
         7zVgO78b+QDpYAi4H5sshZDmxoRMQS+b0CS+9KLw/VTYfY4N9at1u1ba7nANaj4zTuPJ
         OHFxa9QNLUfCMdK5RpA+ZG60ipNNIBGZsY6AB7lR04V0fkzHanNxtWUpNpBX3eOiifOe
         FypA==
X-Forwarded-Encrypted: i=1; AJvYcCUEqNp5/8AYcUiyemLZR2mejeQIhSJXvP5ROI1VzXyWMDCh+QXT77275ICE+FLym73Pni4WCz7qDP/A1/J0@lists.linux.dev
X-Gm-Message-State: AOJu0Yzt8EeetgMqyF4xmFY+FU9n2XHpvhAKuJzf6UsbZUVuJfJdHntd
	kfFlrKBbNWyNg//jkFd/M4L2LcO8FvT+65IcTfFdROBCT9ja7NrC
X-Gm-Gg: ASbGncux4z8BGAoi6SPBLWZyJTZUJm8lHehgXaFAx/pjf3g/vmVDCc10euVjLqqYV4z
	1wimXUm8ezPRZ9apwrHiuMgyXa63YO9JgfN6EkhjKk9GG8CWIENA8HMwK/x+GgRwVDqq6p44GT8
	rToLx/qKA0mE7bmwqeUpemOXwLm9iyhm1EajtDc+8hZqoE2ki1EsSqhy9msoQTbGHGYLblOaBmj
	OxdTXj22lsskmY/CjSiS1W04xzKxRhbl4+36FgHUxxddEuMxs/kvRg=
X-Google-Smtp-Source: AGHT+IEpBsBBwXgjpkbchPZlyJwMH+ROmQ94Asfaj950k2A6CiGmu5Q0PWz52PGm4iQlubWSeDxc6Q==
X-Received: by 2002:a17:902:c408:b0:216:526a:5403 with SMTP id d9443c01a7336-219e6e887dbmr154779935ad.3.1735367155451;
        Fri, 27 Dec 2024 22:25:55 -0800 (PST)
Received: from ice.. ([171.76.83.141])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f73f6sm144479455ad.222.2024.12.27.22.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 22:25:55 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v5 05/15] staging: gpib: cec: Handle gpib_register_driver() errors
Date: Sat, 28 Dec 2024 11:37:53 +0530
Message-Id: <20241228060800.107653-6-niharchaithanya@gmail.com>
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

The function gpib_register_driver() can fail and result in a
semi-registered module and does not return an error value if it
fails.

Unregister the pci registering function in case gpib_register_driver()
fails and return the error value.

Signed-off-by: Nihar Chaithanya <niharchaithanya@gmail.com>
---
 drivers/staging/gpib/cec/cec_gpib.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/cec/cec_gpib.c b/drivers/staging/gpib/cec/cec_gpib.c
index 3dc933deb401..5e887c649ddb 100644
--- a/drivers/staging/gpib/cec/cec_gpib.c
+++ b/drivers/staging/gpib/cec/cec_gpib.c
@@ -365,12 +365,17 @@ static int __init cec_init_module(void)
 
 	result = pci_register_driver(&cec_pci_driver);
 	if (result) {
-		pr_err("cec_gpib: pci_driver_register failed!\n");
+		pr_err("cec_gpib: pci_driver_register failed: error = %d\n", result);
 		return result;
 	}
 
-	gpib_register_driver(&cec_pci_interface, THIS_MODULE);
+	result = gpib_register_driver(&cec_pci_interface, THIS_MODULE);
+	if (result) {
+		pr_err("cec_gpib: gpib_register_driver failed!\n");
+		return result;
+	}
 
+	pr_info("cec_gpib: module init is complete\n");
 	return 0;
 }
 
-- 
2.34.1

