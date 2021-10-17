Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC272C81
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 16:21:13 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id q19so12839427pfl.4
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 09:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cXleAOz5sUQbG5Eded1WlMxLpubBbVfEG6e8M7J8b5M=;
        b=qdJ72r3up7WkSea+cx4dHI6KxMSNGvsc1QiylhVVwNJnwQ607EMeVxo8a05ScfJfSX
         MBKDjkF1Bz1ACnjA+1fC9WMu4UFYQlS2pOua2GalepIo8Wim8Q1Ttk/fksELsRTZRRXX
         8UexZUV5qrDmkEWiMpYsDKUxDoe/bQo30e/BlXagVoe1orgaIQs/kr9cAl8b3HxPBitM
         nr5SrcrRVzO7QHr/V9EPM7Nwi5KvdpYTxe8A4GwWcl1ABqI7r/Mco1WrZ5uMHYUEfkAU
         89mJAuxkG+FNx8bql3hge35gqNL96dN1FlOkx1DlMLaRyradURxV3uocGtmhWjirEmJM
         3VVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cXleAOz5sUQbG5Eded1WlMxLpubBbVfEG6e8M7J8b5M=;
        b=VRk1qgtUjcoJZK1lxxOfbc+tYrPDAODfa/HIgGzGBvhoY260EsiH5j0ky5unUwuSYD
         2jH7yOZgDM6TUHZWDPjWy50UzXFjXv0QH9u0JpdNQqLLMxrGKonbZ7G0pvQDCASddC39
         vA8B2f4j1Uysr5Ldza+6AIQxHgWyuqr1bgGiOXpkAsWScsg9BG/xeDyG5YqW10NcQO26
         v7c2y+VA7ZufGxiKiQymgrNN/JXGb60x6MDafkaZm3U6mupTm7HViWi8Ba4iViwETXWv
         1lsqBmqLrv8Z5N6/6H9bgctjEDLfN+0xoyueB5KJjjqQ9W8a7hv7IepWBODf+mUbktOr
         FSRQ==
X-Gm-Message-State: AOAM532W/2LV2/ZIr59jmtUWYjhWPuZBoVcomGK9lVewiaJgNr1X/qCt
	3jXIM5Wsyig0sctmDINkxkA=
X-Google-Smtp-Source: ABdhPJxnKsNhivIZnicj1Gu+//OI/m1M2aSSmLdUGGJPhjw5hn3pVHMqRGmF430kExMT+S/HiQoTHw==
X-Received: by 2002:a63:368a:: with SMTP id d132mr18604894pga.342.1634487672790;
        Sun, 17 Oct 2021 09:21:12 -0700 (PDT)
Received: from sbwpb-arch.flets-east.jp ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id mu11sm5155444pjb.20.2021.10.17.09.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:21:12 -0700 (PDT)
From: Tsuchiya Yuto <kitakar@gmail.com>
To: 
Cc: Hans de Goede <hdegoede@redhat.com>,
	Patrik Gfeller <patrik.gfeller@gmail.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Alan <alan@linux.intel.com>,
	Dinghao Liu <dinghao.liu@zju.edu.cn>,
	Deepak R Varma <drv@mailo.com>,
	Alex Dewar <alex.dewar90@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/17] media: atomisp: pci: use IA_CSS_ERROR() for error messages in sh_css_mipi.c
Date: Mon, 18 Oct 2021 01:19:46 +0900
Message-Id: <20211017161958.44351-7-kitakar@gmail.com>
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

Some debug messages for error cases (messages contain "error: ") use
IA_CSS_DEBUG_TRACE_PRIVATE debug level. This causes these error messages
not to appear unless users raise debug output level to 7 or higher (using
module parameter, dbg_level=7).

So, use IA_CSS_DEBUG_ERROR debug level (dbg_level=1) instead considering
that these are error messages. There is already a macro IA_CSS_ERROR()
for this use case. Let's use it. It automatically appends "error: " at
the beginning and a newline to a message. Therefore, we can remove them
from these messages.

While here, remove the unnecessary newline from one IA_CSS_ERROR()
occurrence in the same file.

Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
---
 .../staging/media/atomisp/pci/sh_css_mipi.c   | 32 ++++++++-----------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index c1f2f6151c5f..de56a1da754d 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -434,9 +434,8 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
 
 	if ((!IS_ISP2401 && port >= N_CSI_PORTS) ||
 	    (IS_ISP2401 && err)) {
-		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-				    "allocate_mipi_frames(%p) exit: error: port is not correct (port=%d).\n",
-				    pipe, port);
+		IA_CSS_ERROR("allocate_mipi_frames(%p) exit: port is not correct (port=%d).",
+			     pipe, port);
 		return -EINVAL;
 	}
 
@@ -497,9 +496,8 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
 							my_css.mipi_frames[port][j] = NULL;
 						}
 					}
-					ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-							    "allocate_mipi_frames(%p, %d) exit: error: allocation failed.\n",
-							    pipe, port);
+					IA_CSS_ERROR("allocate_mipi_frames(%p, %d) exit: allocation failed.",
+						     pipe, port);
 					return err;
 				}
 			}
@@ -542,16 +540,14 @@ free_mipi_frames(struct ia_css_pipe *pipe)
 	if (pipe) {
 		assert(pipe->stream);
 		if ((!pipe) || (!pipe->stream)) {
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-					    "free_mipi_frames(%p) exit: error: pipe or stream is null.\n",
-					    pipe);
+			IA_CSS_ERROR("free_mipi_frames(%p) exit: pipe or stream is null.",
+				     pipe);
 			return -EINVAL;
 		}
 
 		if (!buffers_needed(pipe)) {
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-					    "free_mipi_frames(%p) exit: error: wrong mode.\n",
-					    pipe);
+			IA_CSS_ERROR("free_mipi_frames(%p) exit: wrong mode.",
+				     pipe);
 			return err;
 		}
 
@@ -566,9 +562,8 @@ free_mipi_frames(struct ia_css_pipe *pipe)
 
 		if ((!IS_ISP2401 && port >= N_CSI_PORTS) ||
 		    (IS_ISP2401 && err)) {
-			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-					    "free_mipi_frames(%p, %d) exit: error: pipe port is not correct.\n",
-					    pipe, port);
+			IA_CSS_ERROR("free_mipi_frames(%p, %d) exit: pipe port is not correct.",
+				     pipe, port);
 			return err;
 		}
 
@@ -576,9 +571,8 @@ free_mipi_frames(struct ia_css_pipe *pipe)
 #if !defined(ISP2401)
 			assert(ref_count_mipi_allocation[port] == 1);
 			if (ref_count_mipi_allocation[port] != 1) {
-				ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
-						    "free_mipi_frames(%p) exit: error: wrong ref_count (ref_count=%d).\n",
-						    pipe, ref_count_mipi_allocation[port]);
+				IA_CSS_ERROR("free_mipi_frames(%p) exit: wrong ref_count (ref_count=%d).",
+					     pipe, ref_count_mipi_allocation[port]);
 				return err;
 			}
 #endif
@@ -680,7 +674,7 @@ send_mipi_frames(struct ia_css_pipe *pipe)
 
 	if ((!IS_ISP2401 && port >= N_CSI_PORTS) ||
 	    (IS_ISP2401 && err)) {
-		IA_CSS_ERROR("send_mipi_frames(%p) exit: invalid port specified (port=%d).\n",
+		IA_CSS_ERROR("send_mipi_frames(%p) exit: invalid port specified (port=%d).",
 			     pipe, port);
 		return err;
 	}
-- 
2.33.1

