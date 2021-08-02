Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA3272
	for <linux-staging@lists.linux.dev>; Mon,  2 Aug 2021 20:30:26 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id gn26so32896128ejc.3
        for <linux-staging@lists.linux.dev>; Mon, 02 Aug 2021 13:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O5BlHIa31SmedtibzYHCu1kx34K4cgvKod6SsEyx6lc=;
        b=m9S6AwU68KLQmBFYoqGAkkV0gVEIQaFJEsFBwoDZUp/1Vcrt2mdJgOsuSQOCjXoN7T
         m6r9UmRfSEa5TV6Fa0NpltqNSO7LgvTYYL1XFk8grpFS96VAVmGD7pITYUCZSjsDfoFR
         A3KKW8Kk1MXg5hWD8lojuGgScbQoRP9so0p3TS1F8AAXmOwsYdEcC1xnhQbBDSX/vAJ2
         k/OQGZuHX30YQl2xhozVu9df47Bt4NSMBOWKczuzFeoBN9Rpfur4NBIYgbacUwtENBUP
         YurTKXMYxOdT63kxFGZ09r/SobF6q8FncsokwjIHDoCfs1CQB779TFLZhm/A+p0gDPtB
         m/Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O5BlHIa31SmedtibzYHCu1kx34K4cgvKod6SsEyx6lc=;
        b=qGlnyG4BSFWfjkl7on3KNwksLlXhr7yEYlC7O0srU45Bx8DgfClJedozNKG2E0wu6T
         Vz8e8JpTy+issJ4GNieSfPsvdnvp/jq2j8WkwMlcJUUa/6i2aGagsrrfIYzBru8rve5b
         kS2WgIW5eHcdbpL9GLPuYP4bBjX0lDzqKG2iJWRdJN3tEAxrMA0xtOBKdus1jY7RVR9N
         MGJqHPfk1LyI7AzL1SxqoaKMHJ/v4KKdUM9FpAvGrJ4CYlRnGrwCuPBJMn6iN7tOsfiY
         /5+m1MArN4+NCU7TwLjnJ8g1WtCTMYEDnaSGo0Ur2Zu4vYwx0vTtZ+80ScxpGTXnXH+7
         bFUQ==
X-Gm-Message-State: AOAM530KdIBOX0w2NgPnaqEkBunCeaZp7qrrULu3CPmp6bXrbEyWzB3Q
	4Ax2MUbY3MWRktTZ2VzS9Yo=
X-Google-Smtp-Source: ABdhPJzWWRtbvVQqxkcS4L/I+iXUA9t4k3WnRWMmyU/nohuJu1cVJkOM67UFVMimQSgFXiSWv+GnlQ==
X-Received: by 2002:a17:906:8cd:: with SMTP id o13mr8274709eje.341.1627936224458;
        Mon, 02 Aug 2021 13:30:24 -0700 (PDT)
Received: from localhost.localdomain (host-82-51-42-96.retail.telecomitalia.it. [82.51.42.96])
        by smtp.gmail.com with ESMTPSA id n13sm5099084ejk.97.2021.08.02.13.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 13:30:24 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v2] staging: r8188eu: core: Change the length of an array
Date: Mon,  2 Aug 2021 22:30:20 +0200
Message-Id: <20210802203020.9679-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IPX_NODE_LEN == 6, while addr.f1 should only have 4 elements.
Replace IPX_NODE_LEN with 4. In the while, remove the excess spaces
before the fields of the union.

Fixes: 56febcc2595e ("staging: r8188eu: Fix different base types in assignments and parameters")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

Changes in v2:
	Add a "Fixes:" tag.

 drivers/staging/r8188eu/core/rtw_br_ext.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index 8f434768dd15..c585224080c6 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -137,9 +137,9 @@ static inline void __nat25_generate_ipx_network_addr_with_node(unsigned char *ne
 				__be32 *ipxNetAddr, unsigned char *ipxNodeAddr)
 {
 	union {
-                unsigned int f0;
-                unsigned char f1[IPX_NODE_LEN];
-        } addr;
+		unsigned int f0;
+		unsigned char f1[4];
+	} addr;
 
 	memset(networkAddr, 0, MAX_NETWORK_ADDR_LEN);
 
-- 
2.32.0

