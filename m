Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53C12C81
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 16:21:06 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id q19so12839290pfl.4
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 09:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kPQMaAl18vlXvtzY3u2mFwVBriklZfpAQgwXY9rKh7o=;
        b=nMgftG/DJnSH7FCQYuApWdUYV+mxq1ZnJSRJjmHhsiR1b/igSdXAML30k1n/UfRUx7
         P/Cxy1p3Kl5tx2kDt6hrTthg0WnjWP6YykTL9HvhPkp2adma+BPr9W1zS5Y1sfXaGKLy
         jBdOdtDMKDC8x7fWcqQ+t9prMgAyQwOtpnEblfAPyVENuPdZObTboG2xnRG6BX5Ldb6J
         wvxbEmthg3ey5k+sX4MJQ+y/DTpd9IsYZZihsvf8wO97Y13FcsgnVc8i9iaAu8HzB/8g
         5U+C7Gf4UGvQPSOcyeYLpx40dGvyBZdPXGyq2/1ldP+EUlOBWUwj7a6nMTfdxhpeSnl3
         iQyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kPQMaAl18vlXvtzY3u2mFwVBriklZfpAQgwXY9rKh7o=;
        b=1DeyF3yPLE16fB1s9nuQmFvZY5DKNFqT9RZP4iOGm8nd6kxOpCYZv83Rt1JqlG1UQ1
         2SXb9EWGeQLwQiw1lMGtnOoWpUQMmnjzOZpvIfRW0zErwa0/B1Zz8K7GwHVWHs4vMrVG
         R3tOoMEHEouNGdSzZfh1d4y/i2sQcJ6Zve2GkYDh1reuQJ2O0Ep6jlAEr3TneamktJjG
         BZR3ruLqg3POD34jIrVwb14MTyj4S6fj8RLPr57mCePnxx2YSbETzZ+U4uGp5WhP6j02
         DVraiT+m6xVexXkpeQgv87KeZ1fvlNqYSVm1kRj77VfqZL1n4BtKkzmTMZ1H0YxfLtKZ
         DViA==
X-Gm-Message-State: AOAM532f+35Uw9kkjfVe6jk8YUP3OJmrzOm83jo2oLPECVALNuRkCcj9
	W1yGDs3W0H6RwW54SArzDWQ=
X-Google-Smtp-Source: ABdhPJwylO8lupxyYn8xSrX8xDfdHl+dQQeZXlCuVVmcKZ/ex48H0ClPY3krGCeMRZNLTxdK7A5Sng==
X-Received: by 2002:a62:1c4e:0:b0:44d:76b:de98 with SMTP id c75-20020a621c4e000000b0044d076bde98mr24413785pfc.16.1634487666153;
        Sun, 17 Oct 2021 09:21:06 -0700 (PDT)
Received: from sbwpb-arch.flets-east.jp ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id mu11sm5155444pjb.20.2021.10.17.09.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:21:05 -0700 (PDT)
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
	Alan <alan@linux.intel.com>,
	Dinghao Liu <dinghao.liu@zju.edu.cn>,
	Deepak R Varma <drv@mailo.com>,
	Alex Dewar <alex.dewar90@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/17] media: atomisp: pci: fix inverted error check for ia_css_mipi_is_source_port_valid()
Date: Mon, 18 Oct 2021 01:19:45 +0900
Message-Id: <20211017161958.44351-6-kitakar@gmail.com>
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

The function ia_css_mipi_is_source_port_valid() returns true if the port
is valid. So, we can't use the existing err variable as is.

To fix this issue while reusing that variable, invert the return value
when assigning it to the variable.

Fixes: 3c0538fbad9f ("media: atomisp: get rid of most checks for ISP2401 version")
Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
---
 .../staging/media/atomisp/pci/sh_css_mipi.c   | 24 ++++++++++++-------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index 65fc93c5d56b..c1f2f6151c5f 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -423,10 +423,12 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
 		return 0; /* AM TODO: Check  */
 	}
 
-	if (!IS_ISP2401)
+	if (!IS_ISP2401) {
 		port = (unsigned int)pipe->stream->config.source.port.port;
-	else
-		err = ia_css_mipi_is_source_port_valid(pipe, &port);
+	} else {
+		/* Returns true if port is valid. So, invert it */
+		err = !ia_css_mipi_is_source_port_valid(pipe, &port);
+	}
 
 	assert(port < N_CSI_PORTS);
 
@@ -553,10 +555,12 @@ free_mipi_frames(struct ia_css_pipe *pipe)
 			return err;
 		}
 
-		if (!IS_ISP2401)
+		if (!IS_ISP2401) {
 			port = (unsigned int)pipe->stream->config.source.port.port;
-		else
-			err = ia_css_mipi_is_source_port_valid(pipe, &port);
+		} else {
+			/* Returns true if port is valid. So, invert it */
+			err = !ia_css_mipi_is_source_port_valid(pipe, &port);
+		}
 
 		assert(port < N_CSI_PORTS);
 
@@ -665,10 +669,12 @@ send_mipi_frames(struct ia_css_pipe *pipe)
 		/* TODO: AM: maybe this should be returning an error. */
 	}
 
-	if (!IS_ISP2401)
+	if (!IS_ISP2401) {
 		port = (unsigned int)pipe->stream->config.source.port.port;
-	else
-		err = ia_css_mipi_is_source_port_valid(pipe, &port);
+	} else {
+		/* Returns true if port is valid. So, invert it */
+		err = !ia_css_mipi_is_source_port_valid(pipe, &port);
+	}
 
 	assert(port < N_CSI_PORTS);
 
-- 
2.33.1

