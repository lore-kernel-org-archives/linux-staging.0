Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9FA2C81
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 16:22:25 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id q5so13533498pgr.7
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 09:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LF01EYAfQlQ9A212iuObd6nlomq8Vqrehwo7xoax5fI=;
        b=aSGcy++sObLMyyEeXAUtsLHBZrl7tTdxSwa2fHaZLQjMAXE6zl6phOU/hpxOhKlxEM
         bdwji5vTHDbt/k2Y4DuQwLNlkxc1wz3EA9l410ctVxvgL5ncebWLkvSegSX9id7IfA26
         9LqtLU5N12yg/Kf/5ElVvkKDLdm5DUyhpCg1o0qpp/9HMbRtjzzyoyBuAEzX1/Eg8J3z
         A4fg4tMHLLGWBDtG53U90GuvOJVqM0UFmQD0TgndRFv7h4ivzybgaBr/cpqsguU9OrlT
         mDCVU5hE86IOtkzJkth/IC4COFuCp92N4ZPVcxB0mVviajV2kh6g9wIHSGECvCKkFSn+
         fijA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LF01EYAfQlQ9A212iuObd6nlomq8Vqrehwo7xoax5fI=;
        b=KeCSK23p/U2n/lH0h4KdpC6gczkl6okyoT8FVHnz6TSzfDcdXkU/TmzR5Fa71+BzRk
         qIwRI5XB2YiRgj14df9v5MO7PuX6XaxtMvPjlVxn1lXSdJnAo+IUtmoX3iVU6PiC724R
         KN2gDlovXQWz99npW6wtUomONsxBINt7LKSNrjqCxPQcUgpeXeK/sHTeCJ3ItiJqmxVP
         19c87Zmde/ftCGXYgSv8yNW8vvr9UwMCBk2ktDraMyaqQGYHj0/k+XtQOofTQXrn7Use
         QBzvhPNQPvs7EhKD1uhHyIL5c6RU8cuR81Yt17pl4WbBIwnYdB20KNYEkCsSBoi3T7Xs
         IxEA==
X-Gm-Message-State: AOAM530ShNVSoPbQVT0V1TfIrcgj3LpRgISP/W+MV6FqlYToDmgAcQtt
	9BLlyeNKtoFnqX01nYH0eX4=
X-Google-Smtp-Source: ABdhPJyb3mjSvz4Zg7cVCazraJbrmriYpk15grovOcf11UCBGUS2HaoBFgw9MvuvF7yyBuIVyyoM5Q==
X-Received: by 2002:a05:6a00:731:b0:44c:7c1b:fe6a with SMTP id 17-20020a056a00073100b0044c7c1bfe6amr23728440pfm.44.1634487744957;
        Sun, 17 Oct 2021 09:22:24 -0700 (PDT)
Received: from sbwpb-arch.flets-east.jp ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id mu11sm5155444pjb.20.2021.10.17.09.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:22:24 -0700 (PDT)
From: Tsuchiya Yuto <kitakar@gmail.com>
To: 
Cc: Hans de Goede <hdegoede@redhat.com>,
	Patrik Gfeller <patrik.gfeller@gmail.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kaixu Xia <kaixuxia@tencent.com>,
	Baokun Li <libaokun1@huawei.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Aditya Srivastava <yashsri421@gmail.com>,
	Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Alan <alan@linux.intel.com>,
	Dinghao Liu <dinghao.liu@zju.edu.cn>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/17] media: atomisp: pci: Remove remaining instance of call to trace_printk
Date: Mon, 18 Oct 2021 01:19:54 +0900
Message-Id: <20211017161958.44351-15-kitakar@gmail.com>
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

(patch based on intel-aero kernel patch:
 https://github.com/intel-aero/meta-intel-aero-base/commit/26fc9fe5030b63bc9dcf0b5f32981948911ca272)

Here is the original commit message from the aforementioned patch:

	From 26fc9fe5030b63bc9dcf0b5f32981948911ca272 Mon Sep 17 00:00:00 2001
	From: Lucas De Marchi <lucas.demarchi@intel.com>
	Date: Fri, 7 Jul 2017 14:23:53 -0700
	Subject: [PATCH] linux-yocto: Remove remaining instance of call to
	 trace_printk

	It's not sufficient to leave trace_printk() out of "normal call chains" since
	the way trace infrastructure works is that it will allocate the trace_printk
	buffers if the symbol is there (by using a separate section for the function
	and checking if __start_* and __stop_* symbols are different.

	Therefore, even if the default value for the param tells the module to use
	printk(), just the fact that it can be changed to trace_printk() means the
	initialization code will be called.

The trace_printk() was replaced by pr_info() on commit 3d81099c75a6
("media: atomisp: Replace trace_printk by pr_info") for the upstreamed
atomisp, too. However, as the aforementioned commit message says, there
is still a remaining instance. This causes the "trace_printk() being
used" kernel warning message to still appear on the first driver load.

Based on the aforementioned patch, this patch removes the call to
ftrace_vprintk(). This removes that kernel warning.

In addition to this, this patch also removes the following now unused
things:

    - now empty atomisp_css2_dbg_ftrace_print()
    - trace_printk option from dbg_func kernel parameter

Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_compat_css20.c   | 10 ----------
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c       |  4 ++--
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 99a632f33d2d..d81d55c6f1fa 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -159,13 +159,6 @@ static void atomisp_css2_hw_load(hrt_address addr, void *to, uint32_t n)
 	spin_unlock_irqrestore(&mmio_lock, flags);
 }
 
-static int  __printf(1, 0) atomisp_css2_dbg_ftrace_print(const char *fmt,
-							 va_list args)
-{
-	ftrace_vprintk(fmt, args);
-	return 0;
-}
-
 static int  __printf(1, 0) atomisp_vprintk(const char *fmt, va_list args)
 {
 	vprintk(fmt, args);
@@ -860,9 +853,6 @@ static inline int __set_css_print_env(struct atomisp_device *isp, int opt)
 	if (opt == 0)
 		isp->css_env.isp_css_env.print_env.debug_print = NULL;
 	else if (opt == 1)
-		isp->css_env.isp_css_env.print_env.debug_print =
-		    atomisp_css2_dbg_ftrace_print;
-	else if (opt == 2)
 		isp->css_env.isp_css_env.print_env.debug_print = atomisp_vprintk;
 	else
 		ret = -EINVAL;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index f5362554638e..720963156d24 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -87,10 +87,10 @@ module_param(dbg_level, int, 0644);
 MODULE_PARM_DESC(dbg_level, "debug message level (default:0)");
 
 /* log function switch */
-int dbg_func = 2;
+int dbg_func = 1;
 module_param(dbg_func, int, 0644);
 MODULE_PARM_DESC(dbg_func,
-		 "log function switch non/trace_printk/printk (default:printk)");
+		 "log function switch non/printk (default:printk)");
 
 int mipicsi_flag;
 module_param(mipicsi_flag, int, 0644);
-- 
2.33.1

