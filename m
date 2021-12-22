Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB12168
	for <linux-staging@lists.linux.dev>; Wed, 22 Dec 2021 07:03:02 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id a23so1316661pgm.4
        for <linux-staging@lists.linux.dev>; Tue, 21 Dec 2021 23:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=3VDOWPcXWhDFPAt9Df/Qo17xw6phBw6+Cx2n5GdYw8I=;
        b=KQEn3RcHLikmtvkAq09i7D8+irGECceKpSEVr09pDFXyO8xdK79Z3J+FSAxdQPfZmK
         6fDhpjfwz/ErFKb5Y84eXlHPyfeMiSQOeYj6qiHfFEuhn+MWlDuYOxdwKfI23GgsFSHe
         +VQv7tZsd/3Zp3lFgIP8LWo6Su6kJX+FA281G9z+iyX2t9Imtu5as0ChygbTECXfoDuu
         4HjadGJM7+Qt9QP1nvVu5qcNii5jqaiiGzkKAoKKuiLrUe22xQEaVyf4jSVsRx0mJLk5
         WXUEbQHaQvlh8gBAdEM3fpV3ZqXjurLJpNAOl3OhIdbuSN8SnKgzc7fhftaMjLYY8lSe
         f8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=3VDOWPcXWhDFPAt9Df/Qo17xw6phBw6+Cx2n5GdYw8I=;
        b=7s//WlHVbRpoGRho+FlNpaxFw8gHKAtif5kXqwOtrgr52cDJW9Iiq8vwvbwXL8w6C8
         W6dfvhhEW9ZfYOw5zIBHf5DLJGhIJhdVbcwtkprMVILVStboQ6O/hvJBJwYZQ540AhGK
         Mm46V/sKb5jWctq0rOoquI1VSbQBWiM4a3lMKt/Xc3k35fvhuAH8TkUSF7qPf3+O8d6w
         4lDYH8RuEpyBgOznSwadwWomHPnKAEIaTt4L+mdv3uT4LidMjVMHvoq9a3IwqMTqpcE9
         zgu5L7QSEbJyC6HwCj8z1uqso4nmAZM33ShrTawfVGXHDiXm6RcjsU20WGS6V2FvoKu7
         u0pQ==
X-Gm-Message-State: AOAM531h5LbPzJDmgvXvDlPAKx0IWdpOmxTOLC6CXl4fxQHwnUdBkzYo
	xtkEf6VVWorqYl+kodCwji4=
X-Google-Smtp-Source: ABdhPJycGG6AFTvNA5CCdWBtS06E4j1qggcF88zMZtOu/rUTQU/wK+IpHwer4hO2GDScPqbJ0V0QYA==
X-Received: by 2002:a05:6a00:248f:b0:4a0:1e25:3155 with SMTP id c15-20020a056a00248f00b004a01e253155mr1650662pfv.21.1640156582285;
        Tue, 21 Dec 2021 23:03:02 -0800 (PST)
Received: from localhost.localdomain (122-58-164-114-fibre.sparkbb.co.nz. [122.58.164.114])
        by smtp.gmail.com with ESMTPSA id z2sm1034777pge.86.2021.12.21.23.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 23:03:01 -0800 (PST)
Date: Wed, 22 Dec 2021 20:02:56 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: gregkh@linuxfoundation.org, realwakka@gmail.com,
	paulo.miguel.almeida.rodenas@gmail.com
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: pi433: remove unnecessary parentheses pointed out
 by checkpatch.pl
Message-ID: <20211222070256.GA7644@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Checkpatch reports 'Unnecessary parentheses around <lines>'.
Fix this by removing extraneous parentheses where applicable.

Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
---
 drivers/staging/pi433/rf69.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
index dc047bcdf44b..e62e61ef4d27 100644
--- a/drivers/staging/pi433/rf69.c
+++ b/drivers/staging/pi433/rf69.c
@@ -470,9 +470,9 @@ static int rf69_set_bandwidth_intern(struct spi_device *spi, u8 reg,
 		return -EINVAL;
 	}
 
-	if ((mantisse != mantisse16) &&
-	    (mantisse != mantisse20) &&
-	    (mantisse != mantisse24)) {
+	if (mantisse != mantisse16 &&
+	    mantisse != mantisse20 &&
+	    mantisse != mantisse24) {
 		dev_dbg(&spi->dev, "set: illegal bandwidth mantisse %u", mantisse);
 		return -EINVAL;
 	}
-- 
2.25.4

