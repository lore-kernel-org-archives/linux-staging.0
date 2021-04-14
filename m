Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172AD6D13
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 13:09:43 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id t11so6769309qtr.8
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 06:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=elncytFW+zb3qUFxfSlLsAeQiq/hOBit9WYqXcP+TbM=;
        b=qQkv9kwMDgVjNDgE8+1XHzGKiVU3D7+1BMbay98l8IO5vpr6gzVdPUqBxyUoufZwpR
         64BnoOrEnoaJOZLB4/0K3A76+ytyVltzkGa5UPoz+DVmqCtVO4UnmEVeP0yXTTAeDvYk
         oouF7MpHMsDTJOgsjmKne0JciOMZmKPsfTj9PSg3E4Awjj3UeMP0+nSmAcm8c0Y/Nbeg
         kPL9C2NyFEmy1ZFHaaol+R8vZg1PRgdtdyedrWz4nvoZxGmirTsltCKRGQWQ9N9e35aa
         waPCIyNOBn3zZ5vFwQzzxehxjmG1PQYpSml3ygnIh4AHDRHayPc/Cg2xdlauZUT7iJnH
         x8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=elncytFW+zb3qUFxfSlLsAeQiq/hOBit9WYqXcP+TbM=;
        b=gD1s7dUWBDoQeRcOkL402x1zFEjo2LTDABdQ4+qF3ZOrccSayvJkDjopml47NK+aHT
         ULg1yQmcGVxBBdOT6ngb/PV4sLUDjef6eMI1Kpp1cTE7uHHucsMQzXqQVSD72bO2Reir
         75Lo/xsJ6QS1hciA44ZoezOgAA2aC9ihb9cL/tTmm+IJ2yKG9SIBdqDE9n8eypKbpifk
         EdqElmdMEUyGd8aPorZzBKlbw5N872fuodGXS6rOYmhBTp01c3Kk/D+DuWQZE1lGiBJC
         VcJGDNULQbwX5hUuZW7mtlrVI8RJtnp4rGkJ9K7JTqj587slVrOHSxf9oHgumkab/Mna
         zR2g==
X-Gm-Message-State: AOAM532Bh2zVcG/cSnOPCxf5BvmcAu25SaAf/edN/oexXRDFjHOr8bCY
	HRq1wylEjZKapsD6ezbopCA=
X-Google-Smtp-Source: ABdhPJzFIH2icLx/tD0Vzvjk7b2K2kFlcws0XDy0/f2uGTsedCe1BJf79qi72vxRofLpC3ks19U0YA==
X-Received: by 2002:ac8:5c0b:: with SMTP id i11mr18904800qti.368.1618405782136;
        Wed, 14 Apr 2021 06:09:42 -0700 (PDT)
Received: from focaruja ([2001:1284:f016:a037:7038:c088:ae60:452d])
        by smtp.gmail.com with ESMTPSA id b83sm6523257qkc.97.2021.04.14.06.09.41
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Wed, 14 Apr 2021 06:09:41 -0700 (PDT)
Date: Wed, 14 Apr 2021 10:09:39 -0300
From: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [PATCH] staging: media: tegra-video: Align line break to match with
 the open parenthesis in file vi.c
Message-ID: <20210414130939.GA15290@focaruja>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)

Align line break to match with the open parenthesis.
Issue detected by checkpatch.pl.

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 7a09061c..9878d1e 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -1813,7 +1813,8 @@ static int tegra_vi_graph_parse_one(struct tegra_vi_channel *chan,
 		}
 
 		tvge = v4l2_async_notifier_add_fwnode_subdev(&chan->notifier,
-				remote, struct tegra_vi_graph_entity);
+							     remote,
+							     struct tegra_vi_graph_entity);
 		if (IS_ERR(tvge)) {
 			ret = PTR_ERR(tvge);
 			dev_err(vi->dev,
-- 
2.7.4

