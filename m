Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD208F58
	for <linux-staging@lists.linux.dev>; Wed, 22 Mar 2023 17:15:04 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id o12so75849522edb.9
        for <linux-staging@lists.linux.dev>; Wed, 22 Mar 2023 10:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679505303; x=1682097303;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TXfJ+2b55JPGSMz5Q3HBnYgsDGuPhWyRh26ofAF5NYc=;
        b=TqoEOhVG/jqyArt9PpQt5UJgpgtofFHKrtBvtcXu/guu+XTExQebbY3kIoeqza0pcc
         eIzK/l88oHE2OTA0Bn1zUDtFtUZ9uf8REaBko3OWuV8ARFteJlIW/vBQU2PuphFvKxOO
         kqCJ4QmI8khz2Th92+/bHl+T8HfU4QEkPo/aT6oZFaJelwCStgaw5lcd5//x2pp74UPm
         zySxJMwI3afiGtMdfhEQMwwtD42WxUMKDEuSJ0BgvQDCGafaYLZZITBtTj97xZyvvwOC
         BxDFCrlHdkjKCdIZ1m5zZmCtBQmkHP1g1ejegCYtREP1/JfzOVt+2DB5kqTfvnlXsv9j
         IQbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679505303; x=1682097303;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TXfJ+2b55JPGSMz5Q3HBnYgsDGuPhWyRh26ofAF5NYc=;
        b=rDG6+GWINWupzTg2hKJiTNqjj4GVKwGB2wyviV2lhRdtHmVc0s7KM8qsY1Lnq6T0Sc
         O7UUMMNd49oHi/i14Lk3KYIux51IjqOKrDS+REOxyqHuCjY+r5hh7AHoLKQSsuGt7pwf
         E32quJnOfzDXFXkYhwyiQvOUFZo+3o/W/ptnm1dhTwgBLv5z3ZEkjXelMPNR666c2cR4
         YGNR9sYHv7yi95CUxdc63vZH0s/lpyqcTHEqf3RGYeCEGiU74bg6PfoficOd8h1GGqep
         me4YCOyHS9PrK7nsX1EWiIQI31IvfI+eLgbApGlT39fwPJcbIDVHiZSY7h55QlmieGvG
         SgOg==
X-Gm-Message-State: AO0yUKXrxaObWqRxNi0sbOYwHX4IGdgbpo6YKala8IT9oZsLTubxGhGz
	L2545ghH8bnSZov9ARzHLWU=
X-Google-Smtp-Source: AK7set+O97i1N28jdHjPDOelpFeYC4L6ZjRG3cBvgKFZHHZA1m3wOHPIpafA3QfcepZQB6Yqd48xwA==
X-Received: by 2002:a17:906:105c:b0:92f:ceed:ab35 with SMTP id j28-20020a170906105c00b0092fceedab35mr6321485ejj.5.1679505302611;
        Wed, 22 Mar 2023 10:15:02 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935146.dip0.t-ipconnect.de. [87.147.81.70])
        by smtp.gmail.com with ESMTPSA id c2-20020a170906694200b0092b546b57casm7471706ejs.195.2023.03.22.10.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 10:15:02 -0700 (PDT)
Date: Wed, 22 Mar 2023 18:15:00 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/8] staging: rtl8192e: Remove unused macro
 queue_delayed_work_rsl and more
Message-ID: <3ed738a5d67a999ad42454fcb0d6668bfa706205.1679504314.git.philipp.g.hortmann@gmail.com>
References: <cover.1679504314.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cover.1679504314.git.philipp.g.hortmann@gmail.com>

Remove unused macro queue_delayed_work_rsl and queue_work_rsl to increase
readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
V1->V2: Changed subject line to be without “..”
---
 drivers/staging/rtl8192e/rtllib.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index cb904fc4f574..8965bb605eaa 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -62,10 +62,8 @@
 #define IW_CUSTOM_MAX	256	/* In bytes */
 #endif
 
-#define queue_delayed_work_rsl(x, y, z) queue_delayed_work(x, y, z)
 #define INIT_DELAYED_WORK_RSL(x, y, z) INIT_DELAYED_WORK(x, y)
 
-#define queue_work_rsl(x, y) queue_work(x, y)
 #define INIT_WORK_RSL(x, y, z) INIT_WORK(x, y)
 
 #define container_of_work_rsl(x, y, z) container_of(x, y, z)
-- 
2.39.2

