Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02F410F6
	for <linux-staging@lists.linux.dev>; Thu, 28 Jul 2022 05:59:44 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id z23so1334030eju.8
        for <linux-staging@lists.linux.dev>; Wed, 27 Jul 2022 22:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=AzWlzFFjiYhYrqkBOngT976stfAH8dV8/kbLU3f5dKs=;
        b=XBTiP9LC5GDyHScB6fSY3kyVPnAT+KjTRYurPZLhD0QwH6XOAcBE+wozo2Onkn65Bd
         wFv5IBNuQ322FmMicmKTAocoEJI1WTOHpc8QQsehC+8peZVDT3vUt8mlRgLrIK/4uM4h
         KVeaucobiPqrnw6SEScuH4Dzx5/8vJCML4JyeTDPA5+S9dgIbKMU+rZ5iDO4X/FN1rP+
         k6BMmre1ERr0RC/m+8BtWcpg/lC6k+F9olUuQHZ3UuCCX+zkseTnKzKLZKhglpAgROoA
         NrOPS+TnIj8VSb8COFradZ2QC0VxHWXrv0zM5pQCkWePrHxmQ/9/WfBo32YjA/aYDEW4
         B3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AzWlzFFjiYhYrqkBOngT976stfAH8dV8/kbLU3f5dKs=;
        b=UaVewm9x0pz5IJZuBJfJNywfMIoQVojB6ro2aFK0hRuN1Zk3f0XKYQ+X8IJSak4uRx
         OJuVarr8/Ab2xP3viZJxOaxL+qLaDkgyQlVYX2uhcG+74HO7JlvBOHZStcHgqFtA77QT
         3nzlsr/WinC7/L2iDdXWaDCYWVKhE6tRYof2W1lIlO49y9GnKa2qBhRNOQixJ5gh2aVB
         LRv4Z/+2Supv/343pR7bcwVKzlEEJ45EdBP2KPOhkCsF1MR33YjTlL5rpkhZehUgZ08A
         fUpubXgDpHRROZszzkofMwq1kzkXNqJ5RCjzVFCsLyx+6Gy46FOMBS1nz+ueais0R8yT
         iREA==
X-Gm-Message-State: AJIora/hxRTn20+SNtb8Q7HL56Rv02jMXOdvjdZfajN06mNezj5HIEoL
	k3+dRttwQAA1gqpSVe06bwA=
X-Google-Smtp-Source: AGRyM1uuK3bPwzKC+qGvohNd9HuVZ4SBgQQmJBB8uqhJOK2JVG1GudjsEC042YhCSFfY8OXB/zRkKQ==
X-Received: by 2002:a17:906:5a51:b0:72b:5cdf:ed77 with SMTP id my17-20020a1709065a5100b0072b5cdfed77mr19739852ejc.505.1658987982876;
        Wed, 27 Jul 2022 22:59:42 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id x25-20020aa7d6d9000000b0043bc4b28464sm82403edr.34.2022.07.27.22.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 22:59:42 -0700 (PDT)
Date: Thu, 28 Jul 2022 07:59:32 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] staging: vt6655: Rename MACvClearStckDS
Message-ID: <8ba4413d52e95406393755f48da065511b891f03.1658986804.git.philipp.g.hortmann@gmail.com>
References: <cover.1658986804.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1658986804.git.philipp.g.hortmann@gmail.com>

Rename MACvClearStckDS macro to vt6655_mac_clear_stck_ds to avoid
CamelCase which is not accepted by checkpatch.pl and to clean up
namespace.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
V1 -> v2: Improved to early line breaks in description
          Improved description
---
 drivers/staging/vt6655/mac.c | 2 +-
 drivers/staging/vt6655/mac.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vt6655/mac.c b/drivers/staging/vt6655/mac.c
index a7f645f9ccf8..d7ee42df7062 100644
--- a/drivers/staging/vt6655/mac.c
+++ b/drivers/staging/vt6655/mac.c
@@ -518,7 +518,7 @@ void MACvInitialize(struct vnt_private *priv)
 {
 	void __iomem *io_base = priv->port_offset;
 	/* clear sticky bits */
-	MACvClearStckDS(io_base);
+	vt6655_mac_clear_stck_ds(io_base);
 	/* disable force PME-enable */
 	iowrite8(PME_OVR, io_base + MAC_REG_PMC1);
 	/* only 3253 A */
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index e2ef8c6ef7b7..3d6d53d5b383 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -537,7 +537,7 @@
 
 /*---------------------  Export Macros ------------------------------*/
 
-#define MACvClearStckDS(iobase)					\
+#define vt6655_mac_clear_stck_ds(iobase)				\
 do {									\
 	unsigned char byOrgValue;					\
 	byOrgValue = ioread8(iobase + MAC_REG_STICKHW);			\
-- 
2.37.1

