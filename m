Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BCB6D22
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 06:14:25 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id w6so1125156plg.9
        for <linux-staging@lists.linux.dev>; Tue, 17 Aug 2021 23:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Hcl1ccbFJs4ud/H3xoT9ZSR2o1n+o5k4Vuh9ApRTkZE=;
        b=X+6d81/MvLfT3RwS/Jq3LliSZFdydCpZduBL+K5p5bTjFlP//w2o7lGFMk764ByK2j
         4XbCrV8JHtasAStK7sUNoD/ilVbmVoDcq6+ER+OvyegySoWauDTXTIy6SbVa851KB7Q1
         KUnRDP7SH/0Kg/x5GtujVKZ0O006edjI9Mme8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Hcl1ccbFJs4ud/H3xoT9ZSR2o1n+o5k4Vuh9ApRTkZE=;
        b=PtRkicSUJLGywdg7vnpmvi1f67DaiqnhNTCwFvz4EktIpoRl39MVFLWIaTk5yE2RQQ
         oGgq5AUWsDQtc0IH5Cxqs1//ICI+q+OUHckPWs1msuwAjOB/4rWbLd/q1Zei22f8MdPj
         vh2eJllb+TfXf3G1Lzlz1lyDYidjaFGfrkp9fEux+VZaQqkMja8HG86Ta/dOQxVmYeKf
         ZX6/FYM59lXAlXCRW3YOPuTkDtpv9AWH73uwGL3G0K70pNuqczm89Y3jzBGdsX2JoFGZ
         oeLj3CPBo8eANQHbkzOCNhrzAAxYCLaeGB7I9tIQ2Bg2ySfKV204xOrPTYfSQbLM10sm
         A/tQ==
X-Gm-Message-State: AOAM5302akndCs3wvORzZm8fMEnbf6yMmaDqwmANJPsYjZcvLp0LqlLO
	PWkRIjc9CfVcCih5AUMdVAUeNA==
X-Google-Smtp-Source: ABdhPJyVdGO+k0ZXLSuBZU6Emb1T8tVPxMBOZys/2ngcwdzE26txO/yjwg2d2fDStsZ38dVCxGAyrA==
X-Received: by 2002:a17:90b:2313:: with SMTP id mt19mr7827471pjb.230.1629267265564;
        Tue, 17 Aug 2021 23:14:25 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id j23sm3858038pjn.12.2021.08.17.23.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 23:14:21 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Kees Cook <keescook@chromium.org>,
	Leon Romanovsky <leon@kernel.org>,
	Doug Ledford <dledford@redhat.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-rdma@vger.kernel.org,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-staging@lists.linux.dev,
	linux-block@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	clang-built-linux@googlegroups.com,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-hardening@vger.kernel.org
Subject: [PATCH v2 56/63] RDMA/mlx5: Use struct_group() to zero struct mlx5_ib_mr
Date: Tue, 17 Aug 2021 23:05:26 -0700
Message-Id: <20210818060533.3569517-57-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210818060533.3569517-1-keescook@chromium.org>
References: <20210818060533.3569517-1-keescook@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1421; h=from:subject; bh=VDjxwOfX2cjaEibL8dkCGTlxM9AleppD3q/+715fBPc=; b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhHKMq8O5UKAKpb/rvp5Y2SurRHZONXPPy2R7JrBHQ 07WmcZaJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYRyjKgAKCRCJcvTf3G3AJqH3D/ 4gNGySY8SCnjrDzEUM7CyrdchqF//a5m2rqxinozby7V9IS5+ycLOFfGvEx1AbtsgpvkKu6IjRZUA5 U67OxhqHOeDoB2W0JrzMD4ZiEf7aeNYRL/FcCw1nfsLjyJUn/7TFORuKQzen2TzINw05zF7xASgg/i xaqv+EuCKtewRoiXcWah1s7jrT1+hp4WtAkQzn/+YaIOVXblb9eHzxMGHhaGDiVNUWryg50fZiOvzo syChMqPaE84IoJx1X3nrdGMbSgJMU0FmsGXcNzY1ouOxqnAlCdt78oxn0N/v+Iddyi/oJlPfrrkCFW zTE3FtjwfhE243hFenyrDn/NEq85myRaQoC3GPPw9uiO1gSwK5OxTciBWBWEY9hT8f55X/K1hRf7Dx z/+mVftkYQIBCPASioBF7UrH+t8vHnUbHcJrYUXmmKNFE8Ki+9oeB0OLJaSo/Yw6PdoabOW4EplCRJ oGAyyzxgxgNTQUYlJOMczrc1z9W3IFlWitdqcPrmsHApkLxRvze0yN1bBp2+BP8kp5Sul0WwUPwAOF gCblqx3UOeJuqqaMUUha9/HfetNzO8oyaLg80znWlEWSXZcMWHgubHnQLVPMv7nqUCEbhdDoN09B46 k0l6F+LB0Ns/6YfKNGhM3NCkF2iuaqgxu0NW66r4tv309D5se4J8ucLMUhmQ==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memset(), avoid intentionally writing across
neighboring fields.

Add struct_group() to mark region of struct mlx5_ib_mr that should be
initialized to zero.

Cc: Leon Romanovsky <leon@kernel.org>
Cc: Doug Ledford <dledford@redhat.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-rdma@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 drivers/infiniband/hw/mlx5/mlx5_ib.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/infiniband/hw/mlx5/mlx5_ib.h b/drivers/infiniband/hw/mlx5/mlx5_ib.h
index bf20a388eabe..f63bf204a7a1 100644
--- a/drivers/infiniband/hw/mlx5/mlx5_ib.h
+++ b/drivers/infiniband/hw/mlx5/mlx5_ib.h
@@ -644,6 +644,7 @@ struct mlx5_ib_mr {
 	struct ib_umem *umem;
 
 	/* This is zero'd when the MR is allocated */
+	struct_group(cleared,
 	union {
 		/* Used only while the MR is in the cache */
 		struct {
@@ -691,12 +692,13 @@ struct mlx5_ib_mr {
 			bool is_odp_implicit;
 		};
 	};
+	);
 };
 
 /* Zero the fields in the mr that are variant depending on usage */
 static inline void mlx5_clear_mr(struct mlx5_ib_mr *mr)
 {
-	memset(mr->out, 0, sizeof(*mr) - offsetof(struct mlx5_ib_mr, out));
+	memset(&mr->cleared, 0, sizeof(mr->cleared));
 }
 
 static inline bool is_odp_mr(struct mlx5_ib_mr *mr)
-- 
2.30.2

