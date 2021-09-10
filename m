Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51FA3FC3
	for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 22:37:03 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id g9so4263132ioq.11
        for <linux-staging@lists.linux.dev>; Fri, 10 Sep 2021 15:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IFaDdxqmF/T13hXPY+icTVWA4xnaWqbUGckikX+9UCU=;
        b=KApiJDO81GVjSe/Z5tZbiWT7xBq6x+evwNXRfNs5RxZEPC2ify4IT0CqzG77T4ST0Q
         X6scXMZl6SsRESo/jZKRhAjsAtrYu3UdNdWj6DxiySx8DrSs2E+wmVvV0gMTCVP4gbDd
         AQGB/Mp3fziOhTu8BRTusYT07k4kOvvMt0+JY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IFaDdxqmF/T13hXPY+icTVWA4xnaWqbUGckikX+9UCU=;
        b=C4uWFJSqEXcK8ayfW5kZh6wyRSrP/ToEVNXoXPx14Gv/vj4yS2NeoRCwT/B33TP9h6
         REEOgdrU/ZAJqTS7x7QFhg5shziBnXY1GuUYx561fedmi72VNlcnwNdrhaDI7Oe6zUTg
         98DgLAFJ8ta4+X9JTngijKqbs9ZfOGcBhKiTxGulPGY8uHunmq3AjlTAAvUzphkYDWKD
         ddCuO+ztaQ/fBaPFbLJXm/0qurHpGm9I8LsLaxDJBoZFgxNfu1Y48l+PDY2hOEWdFXjP
         HrADun2ADxUcXsTa2Q4qCfLVRaHWXOP+zdoaj0A5jN1wMnXyCBRP3gL2Ger7Mf+wpEzK
         NuTQ==
X-Gm-Message-State: AOAM5305BXRwa16i+yGIlYtFmdpeneMZhJD/61VPx8PnrA85AQnk+NB3
	WJrnn5kyQHIbc7HzL/zDSNBzHQ==
X-Google-Smtp-Source: ABdhPJyo1Zzq8WZa3h6TAc80j+2p7KisrmCeonOgHtXV/Hhm9GdGRLW7KTmjd6/XBPFJGcOPMU6sWg==
X-Received: by 2002:a05:6638:d1:: with SMTP id w17mr46388jao.33.1631313422678;
        Fri, 10 Sep 2021 15:37:02 -0700 (PDT)
Received: from shuah-t480s.internal (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id c23sm21623ioi.31.2021.09.10.15.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 15:37:02 -0700 (PDT)
From: Shuah Khan <skhan@linuxfoundation.org>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	paskripkin@gmail.com
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: atomisp: fix control reaches end of non-void function error
Date: Fri, 10 Sep 2021 16:37:00 -0600
Message-Id: <20210910223700.32494-1-skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix the following build error with -Werror=return-type enabled. Fix
input_system_configure_channel_sensor() to return status when control
reaches the end.

drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.o
drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c: In function ‘input_system_configure_channel_sensor’:
drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c:1649:1: error: control reaches end of non-void function [-Werror=return-type]
 1649 | }

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 .../media/atomisp/pci/hive_isp_css_common/host/input_system.c    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index 8e085dda0c18..5d088d6fb01f 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -1646,6 +1646,7 @@ static input_system_err_t input_system_configure_channel_sensor(
 	default:
 		return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
 	}
+	return status;
 }
 
 // Test flags and set structure.
-- 
2.30.2

