Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C7833E3
	for <linux-staging@lists.linux.dev>; Sun, 22 May 2022 19:49:08 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id j4so12290693edq.6
        for <linux-staging@lists.linux.dev>; Sun, 22 May 2022 12:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=FNWznZkulIMYNowiLsOOq4crWOkzIZB3zkl1x+nxEYk=;
        b=WjfcoATzt3hNYeH2AHh5TRL31O/Pn4F3cCp7tIewhnfIL+eCkqU6mbHZWHaxMOPgfr
         hStaViL+j2cL7s6pdjV8aI+MmZfmDZyDWXGkLW9J2FgrBCoERywPYB6uZ0wtYZP2vjip
         Ylmexkqu+TudiI+GOOy+Q90SXY5fBY2+HEKoIijsvClrat6DN2JYeQHl64oCAUZrhtF5
         4HrO58Uz5YVmHHE3c86jbJSqVK1nLHyp/4ukH2xeyiJ17s4gQG1ADeVwXBwI0dqJJ+Vi
         qQLNsqrF97hLJYMyAK9v9KCAjZBjwnyul/0OFq6cQ094ToCWqTOnkfTVAe37RO/D4zjT
         p0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FNWznZkulIMYNowiLsOOq4crWOkzIZB3zkl1x+nxEYk=;
        b=dz32qsu31o/QgkUFwXfiS+9Xx8HH7S9YuFaLNW+nzcPtE6qqoPoBZJiwAMv5pS71oF
         AtjpjFrnwROqpttz1dJOckmNib6jSmLn8EFbBAGu3CdQ/ZRxqsC8+dcSbrsI4T+EHvJL
         yuqMR6p9KVSI+EvyyDETUugbh6SCd/4nvYRPMDQu0NCJzhjXSeRixRFDJAHnuYc2EcmN
         BTINUJsyfGxd9CNOeJFzADYUKwPd8rdi4TCUJc2TkH51NJNYlDuP3+h5duIKtnFViLrw
         w1oGHUT1fpMKK0kXpVtvSOFQ2WgfwPpLgdP6kt3GOZNUpM8uSJoFD4zotl0EjKAypkh5
         AlrQ==
X-Gm-Message-State: AOAM5306gZwzapBHnJngRxPHOzGu2dAjkZkKNObMDyMGtI0DPrFBk5gT
	Rzcs4N8LaU6fGXyEFpOxNV4=
X-Google-Smtp-Source: ABdhPJw49jVp8vhlPLRd/5b8v3ikWX8mLZ2slVCuAe3WOVgQ8nHlWHY2U1ehczaTsyM5srHyGLKKcQ==
X-Received: by 2002:a05:6402:4026:b0:42a:d1cb:34c4 with SMTP id d38-20020a056402402600b0042ad1cb34c4mr20836661eda.396.1653248947430;
        Sun, 22 May 2022 12:49:07 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935774.dip0.t-ipconnect.de. [87.147.87.116])
        by smtp.gmail.com with ESMTPSA id d24-20020a056402145800b0042aa5a74598sm7318262edx.52.2022.05.22.12.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 May 2022 12:49:07 -0700 (PDT)
Date: Sun, 22 May 2022 21:49:05 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 05/11] staging: vt6655: Replace MACvIntDisable with
 VNSvOutPortD
Message-ID: <937422bb879d8f1f58978bedc8d15559d28581c7.1653203927.git.philipp.g.hortmann@gmail.com>
References: <cover.1653203927.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1653203927.git.philipp.g.hortmann@gmail.com>

Replace macro MACvIntDisable with VNSvOutPortD and as it
was only used twice, it can now be removed.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
The name of macro and the arguments use CamelCase which
is not accepted by checkpatch.pl
VNSvOutPortD will be replaced in this patch series.
---
 drivers/staging/vt6655/device_main.c | 2 +-
 drivers/staging/vt6655/mac.c         | 2 +-
 drivers/staging/vt6655/mac.h         | 3 ---
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index d9515eff05c3..29ee0fd893cc 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -1143,7 +1143,7 @@ static irqreturn_t vnt_interrupt(int irq,  void *arg)
 
 	schedule_work(&priv->interrupt_work);
 
-	MACvIntDisable(priv->port_offset);
+	VNSvOutPortD(priv->port_offset + MAC_REG_IMR, 0);
 
 	return IRQ_HANDLED;
 }
diff --git a/drivers/staging/vt6655/mac.c b/drivers/staging/vt6655/mac.c
index 88ddd0676463..24eab18972d2 100644
--- a/drivers/staging/vt6655/mac.c
+++ b/drivers/staging/vt6655/mac.c
@@ -458,7 +458,7 @@ bool MACbShutdown(struct vnt_private *priv)
 {
 	void __iomem *io_base = priv->port_offset;
 	/* disable MAC IMR */
-	MACvIntDisable(io_base);
+	VNSvOutPortD(io_base + MAC_REG_IMR, 0);
 	MACvSetLoopbackMode(priv, MAC_LB_INTERNAL);
 	/* stop the adapter */
 	if (!MACbSafeStop(priv)) {
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 8b3ba94dd02e..a1d5eb52ddc4 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -648,9 +648,6 @@ do {									\
 	iowrite8(byOrgValue, iobase + MAC_REG_STICKHW);			\
 } while (0)
 
-#define MACvIntDisable(iobase)				\
-	VNSvOutPortD(iobase + MAC_REG_IMR, 0)
-
 #define MACvSelectPage0(iobase)				\
 	iowrite8(0, iobase + MAC_REG_PAGE1SEL)
 
-- 
2.25.1

