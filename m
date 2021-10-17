Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3942C81
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 16:20:53 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d5so2687pfu.1
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 09:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RZvAniSv0/MLHUecBSIvKMrmoz6usDwoGMxlWRtqF5A=;
        b=hifpVpT0bgGGW6BmmZDDJUbjAa6LEZGGiqzjSmU+G/KA2d0SLyzT7kx/421gnTRQTm
         laSuGz8ATwzmRUoaJohyIfHwq2rTtebsydHTV+kUCUVrs+SBX+dJaSiVkf+eW5sYCJsb
         VuwmUVXDymYfLjhNw+wCaZQPxLm5K6/Net8bWY8xAHPdiuzUdYftfIfuK3Ya6jobCLII
         Kgv7vucadi9Jpt2l9IMd0XcVxhTnOPcuyV/SI7pQzQJ5JF2BHRPhJsqfQJHeLFivhb23
         BSqASHYfBUO1k58cc8eqjkjQRrqzqDdud9EtXIAHBzCAfL7cBeIYhkjHjQnIBkKDLE7H
         x/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RZvAniSv0/MLHUecBSIvKMrmoz6usDwoGMxlWRtqF5A=;
        b=MS2gBUVSTVq/5CS0/NKGVtsEHwhiKmfRcoxfg2BdJOEstStTp3vUVuAxd1s0fSbQQT
         8mu6FWXlCq2q8U5b+ABAQvxHE75y3n5OVFbaua40nE8YENd6EXlr2HnqoJNQ0MjtNWK6
         Ai2kBRbrsITzI0aEYxXI3Vh8Rx47+PAZYoV/gYMWoKcYk3bQMuTl9SOsGhEZje65YeYF
         5XKmX7XoDeNTSsAr/TIz1CTq4dMOs88H3bvBRRckpKIkCdq+vinBpRojFMTgBagykHJs
         Y+3ax4hqEplgdyGoOs2w1yXToSyYQ99bs3EeLE3G2TKI0xtIV2islrd38l6Efojw5/ro
         IZPA==
X-Gm-Message-State: AOAM530MRLwyOqu34Eit1mGz23m9JrQJ1B6+Rm8twcy7iHW3iJNAEFyM
	L8Ada7wbcxT2WJXK8nCONuo=
X-Google-Smtp-Source: ABdhPJzMotrPhQBXOH0NGjUXfGd5uHbE0KjOORaEY60ADI2/NYp8asnwfqP4CEsJOW0neaU22vqg2Q==
X-Received: by 2002:a63:f410:: with SMTP id g16mr18634164pgi.201.1634487652994;
        Sun, 17 Oct 2021 09:20:52 -0700 (PDT)
Received: from sbwpb-arch.flets-east.jp ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id mu11sm5155444pjb.20.2021.10.17.09.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:20:52 -0700 (PDT)
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
	Deepak R Varma <drv@mailo.com>,
	Alex Dewar <alex.dewar90@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/17] media: atomisp: pci: fix inverted logic in buffers_needed()
Date: Mon, 18 Oct 2021 01:19:43 +0900
Message-Id: <20211017161958.44351-4-kitakar@gmail.com>
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

When config.mode is IA_CSS_INPUT_MODE_BUFFERED_SENSOR, it rather needs
buffers. Fix it by inverting the return value.

Fixes: 3c0538fbad9f ("media: atomisp: get rid of most checks for ISP2401 version")
Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_mipi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index 75489f7d75ee..483d40a467c7 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -374,17 +374,17 @@ static bool buffers_needed(struct ia_css_pipe *pipe)
 {
 	if (!IS_ISP2401) {
 		if (pipe->stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR)
-			return false;
-		else
 			return true;
+		else
+			return false;
 	}
 
 	if (pipe->stream->config.mode == IA_CSS_INPUT_MODE_BUFFERED_SENSOR ||
 	    pipe->stream->config.mode == IA_CSS_INPUT_MODE_TPG ||
 	    pipe->stream->config.mode == IA_CSS_INPUT_MODE_PRBS)
-		return false;
+		return true;
 
-	return true;
+	return false;
 }
 
 int
-- 
2.33.1

