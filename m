Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 731563FC0
	for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 13:03:48 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id a25so6115232ejv.6
        for <linux-staging@lists.linux.dev>; Thu, 26 Aug 2021 06:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PWlNAP4uAjjXML5Q2n9AQSabtDy+TUTfzJ5X6D2qTQc=;
        b=nmLJwMIYb4+Bxqi41+nhIFsTT8OfKCjsrxsuKBPjVvE0r28f8wmaDuF/H1cWJpSUxD
         KPqkwQShQ0qb4sWeOkWCvgdLrspjL1Q3iJKAd9tFn9RYF8TZ+quNwn9z9K5ixuK8H5nR
         kphe5xc9zrD5/RgOOiOcpV4wgmfEjGfrHgQN0PWwkpNc4MM5uNyhktKPZFfkNTYqfVJA
         zuIoOujUlxKin8PPHycwP6eYunPmF17/l/OHJJOTNgEKd5jppzFFzj9UTFgvqlxV6NP0
         X+HizFIB5i1tCp26TZkZiMAMmDZv4gEJyEOkgZ9iH1yTYMKsRepouujmrKetwrvc6TPw
         tr0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PWlNAP4uAjjXML5Q2n9AQSabtDy+TUTfzJ5X6D2qTQc=;
        b=MnK/WLojJjnVPnyLjxchYCvzuyOhixly21ycxVT7gUq1rPF7ZugjM1G8VRrvT9mt0E
         92oOayV0ud4dkcZi8NJUJBE0v9SudDx7Oqrak9NDsfAfSi7L0mRXhoBhm4Fc2nRCIdVI
         YAlG18Tc8Vvh+OpJLDxcc1mP2EyfuAcygp80g7OA53Py/sbPjSQsiPv2oMRbgebiMJQe
         7s9tr0mqG2yEbww6Mi57rlU08uPeeEsI6dheywcncfERgjh+uijAo9a0ZEDU97gXWxpJ
         70T7qPYJoJbX70Jn97tY0qQXh9LPpja5uT9/LeCmCuPpRJaGqbO4a/KBEXD7RkqoFCym
         uKaA==
X-Gm-Message-State: AOAM533wLVLhX2tLTm+FNano7HKaIjWHrBIoEHkf4Xu2i3u4n+DD+4+o
	B20/2toy388qeWBRAnDaiec=
X-Google-Smtp-Source: ABdhPJzN1S9CVoUuQAghjzLVbmPpJgODWnrSK+IyXEQsd/Gxq5BfSF2lcGux3i8vomMNAUfn2egR6g==
X-Received: by 2002:a17:906:3497:: with SMTP id g23mr4217118ejb.85.1629983026651;
        Thu, 26 Aug 2021 06:03:46 -0700 (PDT)
Received: from localhost.localdomain (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
        by smtp.gmail.com with ESMTPSA id o26sm1399916eje.24.2021.08.26.06.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Aug 2021 06:03:45 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: gregkh@linuxfoundation.org,
	Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v2] staging: r8188eu: Provide a TODO file for this driver
Date: Thu, 26 Aug 2021 15:03:42 +0200
Message-Id: <20210826130342.9552-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide a TODO file that lists the tasks that should be carried out in
order to move this driver off drivers/staging.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

v1->v2: According to reviews by Fabio Aiuto <fabioaiuto83@gmail.com> and Greg K-H
	<gregkh@linuxfoundation.org>, remove "[] is currently in development...",
	indent and properly wrap the lines, remove the unnecessary last paragraph.

Thanks to Phillip Potter <phil@philpotter.co.uk> for for providing the first draft.

 drivers/staging/r8188eu/TODO | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 drivers/staging/r8188eu/TODO

diff --git a/drivers/staging/r8188eu/TODO b/drivers/staging/r8188eu/TODO
new file mode 100644
index 000000000000..d2f21b35fbcb
--- /dev/null
+++ b/drivers/staging/r8188eu/TODO
@@ -0,0 +1,12 @@
+To-do list:
+
+* Correct the coding style according to Linux guidelines; please read the document
+  at https://www.kernel.org/doc/html/latest/process/coding-style.html.
+* Remove unnecessary debugging/printing macros; for those that are still needed
+  use the proper kernel API (pr_debug(), dev_dbg(), netdev_dbg()).
+* Remove dead code such as unusued functions, variables, fields, etc..
+* Use in-kernel API and remove unnecessary wrappers where possible.
+* Remove the HAL layer and migrate its functionality into the relevant parts of
+  the driver.
+* Switch to use LIB80211.
+* Switch to use MAC80211.
-- 
2.32.0

