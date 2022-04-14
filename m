Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A69717D4
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 10:43:51 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id u18so5819687eda.3
        for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 03:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/gsZkfzMYeP6pd9u0lclNFF+p8O0+cqjChmSOXbRt/s=;
        b=IewDFGHfG/ljKouP909yUMkKnfqkQGLCtZ1vhKDaWpkKh+VVEliNxHU0c5L8V2ErxN
         TRn3nGEC1Q9WAtYW/uGXjuoScxaqRDA+GhxMuk1UJOoTQpkPYdtO4nAGNaVzDQwquJM5
         XeSMg9kM7lwxMvv+RNtvVaySj/9CmphfwB8tajknVt13Z4/w8zU1pAJo4z+cbZctGCWZ
         nfpdTZrurFFZ6N5uSMNX/IIA78hlc4FO26vPlaN+PSfjwA9mP7TYJuAsxza3wqfdddq6
         3wU4Uh1NlWdDmjQckButG3ucZS57D4e/uDZdBegOZKF+D3u93ViHW5Du/+0XvT8vfnZR
         6AYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/gsZkfzMYeP6pd9u0lclNFF+p8O0+cqjChmSOXbRt/s=;
        b=t7Gd3oQQoVqGRGwaMIM6Sdefvl/APfm5woLK0CGGh0bkOAYTsTetZ03YSkC87aWmyc
         +cNuOTp3ENz+QSJF1lmEKLPyS597SzUkblZ9dMmvn1pDbI8KYdxAexod5aDag3dwgIKm
         E+pI9uNCKF87eO93o+FFbfALWPYYXJZTaMi3WAT1MYOWrHo7vGr9XA1xU8XlYOl5ujvf
         mB5kTja7S/b0mAtio3AdYN+RC+fuMBJOxK7CzD+BjtEQ18qCT9qGOONPqXCmmfiyxi2Y
         5tCykNjgC3edp/IZuVm1MahHA094JtD7k6l4TcYabSvqljMfhtZxF48fk4UaJlfW0Cbf
         qUVg==
X-Gm-Message-State: AOAM532WcHbQX1RcN+YSx2cCAitXyzIyzanvvWz0Dk2s3KIgHzzqiD92
	TwngHgSO+7osrfnuFWHyc8g=
X-Google-Smtp-Source: ABdhPJzo72aDyiS8Zt0ChKhuI/D5Raosh8XxvW6NynlopdOy/tC2lH2pCJ99HTMvZDPhweq46RjxWg==
X-Received: by 2002:a05:6402:e96:b0:41d:1a0f:e70a with SMTP id h22-20020a0564020e9600b0041d1a0fe70amr2251748eda.411.1649933029957;
        Thu, 14 Apr 2022 03:43:49 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6b.dynamic.kabel-deutschland.de. [95.90.187.107])
        by smtp.gmail.com with ESMTPSA id h9-20020aa7c949000000b0041b4d8ae50csm821318edt.34.2022.04.14.03.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 03:43:49 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 4/8] staging: r8188eu: use sizeof instead of hardcoded firmware header size
Date: Thu, 14 Apr 2022 12:43:19 +0200
Message-Id: <20220414104323.6152-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414104323.6152-1-straube.linux@gmail.com>
References: <20220414104323.6152-1-straube.linux@gmail.com>
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

