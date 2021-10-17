Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7A52C81
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 16:21:00 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id d9so5628603pfl.6
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 09:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PWlb0PD+hba2ycuIMOZUvqceben2JcBu02wktaRW7mc=;
        b=EBDCf0fZF29xXpEZugdm4yGMSfmfn5/szXiPq4WacUbTkBM14D/mcpud9Mvs2IDNhC
         eV2wZbbnNsIygfC6bWwwLwUgTkSeieVJN5vnk6+FaGlQO7JqboX/GKRpUPyS6SI1XmgD
         hxTfgugiEt6/A7NlmiAJpm8JEpqiM3tRHsY/3dUxZsEjQDk3oclr80kXDt9G/ggZpOWE
         jIqvTdlMeNhCi4QBvfyxZ7pgzGRMCS76sBocn2r9AHFb9anXWXmvGUPyidTqPSpjGXrm
         fWqew3qvRprbG4B0KIKOF7U1qxGZD1gfFF6+gI7rfnSebGMj2F7A7xtr16iclxAjAJB5
         HzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PWlb0PD+hba2ycuIMOZUvqceben2JcBu02wktaRW7mc=;
        b=Cr15oS0jMce2oRATrRByIggypMgol4EoAzQlaq1g46shGXoy2LMKnP+VHTLk1+JZ3N
         rkAqrzlppmZ8j2KiHZ/xnURFPjAKaLjfsnBdNuw/ogm5si2H/193uy8FvRid8+QdIsCa
         zXIUNCScMM85aZkaUqD6IKuw9RCgkcNI3zH6yMOM3qjBQOuP8BJKtJuJLVip72hDC0dz
         NYB67mRXKvuymyB3kBv3BeCS4yveRQr1EHKvDQmTqohMzyT5lXKlTrhvE6mat7EwEuTN
         pj8mRy+u+L6cm7RolDbOMTfnCOOjeJ4OMigP0QJB2UxmZb+1XNDxYlh90xHALNIGCPb5
         I9Mw==
X-Gm-Message-State: AOAM530Pyurp/uT8manZvzM1WDArKrD+V1oLz15VziGaGKfWVavm99Ux
	B2MKZISjiiEsYJJeZuwpLQwsPyitul0R2g==
X-Google-Smtp-Source: ABdhPJz7Ep5jXHXKgfqwbim8dmZm6LG0bMwK1khbWwN818H6jrG/pLiV8HPkejsoJVaMPi42YD19ng==
X-Received: by 2002:a63:bf4a:: with SMTP id i10mr18959256pgo.196.1634487659626;
        Sun, 17 Oct 2021 09:20:59 -0700 (PDT)
Received: from sbwpb-arch.flets-east.jp ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id mu11sm5155444pjb.20.2021.10.17.09.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:20:59 -0700 (PDT)
From: Tsuchiya Yuto <kitakar@gmail.com>
To: 
Cc: Hans de Goede <hdegoede@redhat.com>,
	Patrik Gfeller <patrik.gfeller@gmail.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
	Alan <alan@linux.intel.com>,
	Dinghao Liu <dinghao.liu@zju.edu.cn>,
	Deepak R Varma <drv@mailo.com>,
	Alex Dewar <alex.dewar90@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 04/17] media: atomisp: pci: do not use err var when checking port validity for ISP2400
Date: Mon, 18 Oct 2021 01:19:44 +0900
Message-Id: <20211017161958.44351-5-kitakar@gmail.com>
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

Currently, the `port >= N_CSI_PORTS || err` checks for ISP2400 are always
evaluated as true because the err variable is set to `-EINVAL` on
declaration but the variable is never used until the evaluation.

Looking at the diff of commit 3c0538fbad9f ("media: atomisp: get rid of
most checks for ISP2401 version"), the `port >= N_CSI_PORTS` check is
for ISP2400 and the err variable check is for ISP2401. Fix this issue
by adding ISP version test there accordingly.

Yes, there are other better ways to fix this issue, like adding support
for ISP2400 to ia_css_mipi_is_source_port_valid(). In this way, we can
unify the following test:

	if (!IS_ISP2401)
		port = (unsigned int)pipe->stream->config.source.port.port;
	else
		err = ia_css_mipi_is_source_port_valid(pipe, &port);

However, the IS_ISP2401 test here (formerly `ifdef ISP2401`) is not
a result of real hardware difference, but just a result of the following
two different versions of driver merged by tools [1]:

  - ISP2400: irci_stable_candrpv_0415_20150521_0458
  - ISP2401: irci_ecr-master_20150911_0724

We should eventually remove (not unify) such tests caused by just a
driver version difference and use just one version of driver. So, for
now, let's avoid further unification.

[1] The function ia_css_mipi_is_source_port_valid() and its usage is
    added on updating css version to irci_master_20150701_0213
    https://raw.githubusercontent.com/intel/ProductionKernelQuilts/cht-m1stable-2016_ww31/uefi/cht-m1stable/patches/cam-0439-atomisp2-css2401-and-2401_legacy-irci_master_2015070.patch
    ("atomisp2: css2401 and 2401_legacy-irci_master_20150701_0213")

Fixes: 3c0538fbad9f ("media: atomisp: get rid of most checks for ISP2401 version")
Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_mipi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index 483d40a467c7..65fc93c5d56b 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -430,7 +430,8 @@ allocate_mipi_frames(struct ia_css_pipe *pipe,
 
 	assert(port < N_CSI_PORTS);
 
-	if (port >= N_CSI_PORTS || err) {
+	if ((!IS_ISP2401 && port >= N_CSI_PORTS) ||
+	    (IS_ISP2401 && err)) {
 		ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 				    "allocate_mipi_frames(%p) exit: error: port is not correct (port=%d).\n",
 				    pipe, port);
@@ -559,7 +560,8 @@ free_mipi_frames(struct ia_css_pipe *pipe)
 
 		assert(port < N_CSI_PORTS);
 
-		if (port >= N_CSI_PORTS || err) {
+		if ((!IS_ISP2401 && port >= N_CSI_PORTS) ||
+		    (IS_ISP2401 && err)) {
 			ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE_PRIVATE,
 					    "free_mipi_frames(%p, %d) exit: error: pipe port is not correct.\n",
 					    pipe, port);
@@ -670,7 +672,8 @@ send_mipi_frames(struct ia_css_pipe *pipe)
 
 	assert(port < N_CSI_PORTS);
 
-	if (port >= N_CSI_PORTS || err) {
+	if ((!IS_ISP2401 && port >= N_CSI_PORTS) ||
+	    (IS_ISP2401 && err)) {
 		IA_CSS_ERROR("send_mipi_frames(%p) exit: invalid port specified (port=%d).\n",
 			     pipe, port);
 		return err;
-- 
2.33.1

