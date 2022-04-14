Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C587B
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 08:39:13 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id u15so8620014ejf.11
        for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 01:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/gsZkfzMYeP6pd9u0lclNFF+p8O0+cqjChmSOXbRt/s=;
        b=a6JNmB/1Y+0744TawNZF7bHnULrgn0WJoR9vfTcNGTJQOStR5EnKZmlkcsHvICtUb3
         Dc/FcQcL9QW7r4HEYNO6vWtDunogH09b/LARrvb0VjRrONenywo9QLYDcRrjxG4q+H+Z
         wSBTZ1cfW7NAjgSq4w+6yblSTTG9FzaxDAd49U4ljUeBmx4qI88gvnFZ8/g99O3L3m/O
         4qBxCv1xAD4Zs+H4yV+sqY/9HFvEhLOMxVDQXAi9O5hobFNICMt4SOrNB+zSkat6XuOj
         X13VVLVTKtdz10i4MQ02n9a6q+mOxlS9vGF4lShaaK0pk37ckV8P0Bb10ZtegPkReaAw
         Svrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/gsZkfzMYeP6pd9u0lclNFF+p8O0+cqjChmSOXbRt/s=;
        b=P9iDHQwjrQH+qyX4Miqtu9JmG+IoSgGZOrpYXrZ6XEDQwmqmR8LGtpA1dz3B44KxPa
         1nPbpkBP4f7yz+Fpc/cnEz5B5fbCkzh9cMsA9dppt6oM2T3+rb6aUrsTveogPOkTQDSJ
         lz3n/Yv4FqtcMZmfnot2W0dJkngJ4MOhSLhui6mlApNzPEsN2cdjX3WKZ5z8nbtnjuq2
         jHByRaFRWSx/Ar7B3o3L+aYAFKIUNxiC/FnG7OHbXtz7b+/UT6MmcBIGjPjDlvTyFuMO
         NeT6ZL7Jh+d8AwNkNKesQBjbDvbYRQprhpSNeH+KokhlSJFzpzO4hH2+NzTLbvrm4Qyw
         aV+w==
X-Gm-Message-State: AOAM530YwvIo1WX64M3iO3wBHdt7ykT8/UxdUbwf468ETJqsoyTrEZs7
	mL785BfhCICN9oThFdD1KuSuWDfPNdw=
X-Google-Smtp-Source: ABdhPJwDrsDJJ3+KXOfLLIl/Cc68yJARYtkYEORg3Cdb6DIX9ZWWzFyfC4dqP7JkhkyTVTAAxtapvQ==
X-Received: by 2002:a17:907:6ea7:b0:6df:c5a2:89ca with SMTP id sh39-20020a1709076ea700b006dfc5a289camr1395445ejc.18.1649925551946;
        Thu, 14 Apr 2022 01:39:11 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6b.dynamic.kabel-deutschland.de. [95.90.187.107])
        by smtp.gmail.com with ESMTPSA id ah13-20020a1709069acd00b006e8a0b3e071sm418138ejc.110.2022.04.14.01.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 01:39:11 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 4/7] staging: r8188eu: use sizeof instead of hardcoded firmware header size
Date: Thu, 14 Apr 2022 10:38:50 +0200
Message-Id: <20220414083853.3422-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414083853.3422-1-straube.linux@gmail.com>
References: <20220414083853.3422-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use sizeof() instead of hardcoding the firmware header size.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_fw.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_fw.c b/drivers/staging/r8188eu/core/rtw_fw.c
index 3da52a1ba23c..94526064f29b 100644
--- a/drivers/staging/r8188eu/core/rtw_fw.c
+++ b/drivers/staging/r8188eu/core/rtw_fw.c
@@ -263,9 +263,8 @@ int rtl8188e_firmware_download(struct adapter *padapter)
 			DRIVER_PREFIX, fw_version, fw_subversion, fw_signature);
 
 	if (IS_FW_HEADER_EXIST(fwhdr)) {
-		/*  Shift 32 bytes for FW header */
-		fw_data = fw_data + 32;
-		fw_size = fw_size - 32;
+		fw_data = fw_data + sizeof(struct rt_firmware_hdr);
+		fw_size = fw_size - sizeof(struct rt_firmware_hdr);
 	}
 
 	/*  Suggested by Filen. If 8051 is running in RAM code, driver should inform Fw to reset by itself, */
-- 
2.35.1

