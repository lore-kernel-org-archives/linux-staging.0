Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C0572
	for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 08:47:35 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id ec8so8599488edb.6
        for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 01:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JmAB8n7UaBcqYspnUH1iQzfV3fA+SByJ94PZYXKecgY=;
        b=gyorI5vGrD9IhuHFhU/KkDM1nFaqujFinq+t+bGAHtXot0dwkxhgJSDcxw1mFMZ7OQ
         Ov/Gfysm5u6WJ0BMc7wZv4YbrBq8G6OFNCJEthw+kQ5ayX483OGVkvPW272MrmNOzhMh
         MrP/DzsE1HNWCtBrimo8RzqgtqlMk0qHvcnouR2+AOL8PN3viQVp6Ld83RUD5MrrGngG
         9h3DTIc79we8YhPAZBZ465ed+VvFzulpM6qS+uLffcsz1DXHnJxLO/ElEYvU9QlcYR6S
         VPrK4U1xHb9cd2Z5jL0dhLfbhMGzpFKRV6AWO2WSiAUk5JgKsiC20uV41Okcr43QdezR
         XUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JmAB8n7UaBcqYspnUH1iQzfV3fA+SByJ94PZYXKecgY=;
        b=zcT/FabbjNVi+pJNZLe9sbhUdsjIR0jdIYgydq45pamHBucrwI+e4tVY0V5IFnpzYS
         yyMGqenMBr+YhqVpHyTBe+Ni9scLgX/ojbfHcEVYgX33g2c0CXnH+cHm89ckW2D7mqIu
         7mTfs7Wla4IaZSQCC0ii8deVzytKD68N0uN6F6+OlaNp/Iq2uWsBZn4KBYhhmzG6ib2Q
         Pw10mjtU7L3WLGaYjVQPJk0Rqq2ZwpRgWRvEshWSOUVfPNGuAcL5vgrSzS8hDHiiFYty
         58fjOmyMjH7BgqAAVNrCWX2l4XNSljtV5013dTwRfkmX8XpTVeDMzghUn7KHm98IYgRe
         TRtQ==
X-Gm-Message-State: AOAM532Ana7Qz/4Yzw8vKj4jbmd5Sgk8XGb111tpTqiBSb5VJFaNlu6g
	09wWct/2g6v7OQLSqAiR4tOTl/edVoc=
X-Google-Smtp-Source: ABdhPJzNNb49pqZzRrAeDU6m19bn2YnCFz9HODjYgSAi54fRKRrKEk06vLI7brgsQVCbNgoEMIYVVQ==
X-Received: by 2002:a17:907:72d0:: with SMTP id du16mr9615355ejc.226.1634892453809;
        Fri, 22 Oct 2021 01:47:33 -0700 (PDT)
Received: from localhost.localdomain (host-80-181-148-119.pool80181.interbusiness.it. [80.181.148.119])
        by smtp.gmail.com with ESMTPSA id au26sm3446979ejc.53.2021.10.22.01.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 01:47:33 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH 2/2] staging: r8188eu: Remove unused semaphore "io_retevt"
Date: Fri, 22 Oct 2021 10:47:27 +0200
Message-Id: <20211022084727.28035-3-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211022084727.28035-1-fmdefrancesco@gmail.com>
References: <20211022084727.28035-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove semaphore "io_retevt" because it is never used.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/include/osdep_intf.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/osdep_intf.h b/drivers/staging/r8188eu/include/osdep_intf.h
index 90b37655e9e0..0d7009269aab 100644
--- a/drivers/staging/r8188eu/include/osdep_intf.h
+++ b/drivers/staging/r8188eu/include/osdep_intf.h
@@ -34,7 +34,6 @@ The protection mechanism is through the pending queue.
 	struct urb *piorw_urb;
 	u8 io_irp_cnt;
 	u8 bio_irp_pending;
-	struct semaphore  io_retevt;
 	struct timer_list io_timer;
 	u8 bio_irp_timeout;
 	u8 bio_timer_cancel;
-- 
2.33.1

