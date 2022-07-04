Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF7F7E
	for <linux-staging@lists.linux.dev>; Mon,  4 Jul 2022 18:20:55 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id fw3so17949640ejc.10
        for <linux-staging@lists.linux.dev>; Mon, 04 Jul 2022 11:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5OTZ4uw8lP1p7LG9iv9MKnQLM3+c/cw5QVC+6xGSWr4=;
        b=EIwG31iT5+PmN9mt3edUWdfHdIL8NOAEM9Jo8GBzW5+Qv1+JKSdy/RVkI8thiRKHiJ
         YaXj/xCRlKnuov+wII/GE8lqaDm9iG7cKVYwQ0dDtHyPcWq5zmP4H5IgmHAZZXomtKkx
         whHobIw+uw2NzS8Wo94LklNq+PbYwkg9Domn8Y8hgdhYrCX1VMna7SMhoEMqth0YnxgY
         OD6m7Y5rreO3jc4F21SfiaW9aHdjeJFDYojEfGsMqswEGUh9YvC+ocpu4nLqBVJQN2FG
         aW2Jv15+LBe4RvBjNcDVFYBkI9rSRAhnY4y8klCK8ek0KNjtv5FypKo3A5sKapGT4Xsg
         B/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5OTZ4uw8lP1p7LG9iv9MKnQLM3+c/cw5QVC+6xGSWr4=;
        b=Ls3b0VqjtN94DeF8RcvWC//Dv95xcNuVJdYWxS39SNLehapkTdXe2fvNnextn4JSKr
         +FoPErz2wbjI/9zxeVZi0NSS0BZszEzGDQgr0NWFzSvHUS8xMiEHNtKkykBRbDm8jArd
         Vz3+CvfJp3hfh4BBDnQkEuOZI5BXhJ9QKl2KqfooJ+SZYnNI2Gflqbey1p6JQytk+ibE
         lNI9y1oCSpmLSiUFYutxiFJ+P3O8rzkJxECbO7q8U5LQ9QEoMAVtWNdATMw1dRhztqIY
         ZAP2Y0FWONp3KiNGVCkTBe1skmwGdMCFjwjaSA/uRtimkhrDcn/w+XGcTtU0kjzPZCO7
         8Q3w==
X-Gm-Message-State: AJIora9YG4jMeZT+pCgtad/1rk8S3ZkEtpGR72FQ+RGK5hqNL0YbT0OQ
	th6gLMr7WlK0JQ6ZRlnz+3c=
X-Google-Smtp-Source: AGRyM1vSz8ftxEJHINMk3Wvu4/jLLDTv0l1zjbed1KO0VeWSNlIshc/w0z7KavBSQBTnugLblvj5jg==
X-Received: by 2002:a17:906:7790:b0:722:e6cf:126 with SMTP id s16-20020a170906779000b00722e6cf0126mr29245525ejm.244.1656958854768;
        Mon, 04 Jul 2022 11:20:54 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id zj4-20020a170907338400b00726ef422b80sm8428296ejb.177.2022.07.04.11.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jul 2022 11:20:54 -0700 (PDT)
Date: Mon, 4 Jul 2022 20:20:52 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] staging: vt6655: Move two macros to file where those are
 used
Message-ID: <b4a04608b3900186d4941b3bfe9463bb79e261e8.1656835310.git.philipp.g.hortmann@gmail.com>
References: <cover.1656835310.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1656835310.git.philipp.g.hortmann@gmail.com>

Move two multiline macros to file of only useage to
convert them later to static functions.
checkpatch.pl does not accept multiline macros.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/device_main.c | 24 ++++++++++++++++++++++++
 drivers/staging/vt6655/mac.h         | 24 ------------------------
 2 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index b9c57c661729..fdb653071918 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -186,6 +186,30 @@ device_set_options(struct vnt_private *priv)
 	pr_debug(" byBBType= %d\n", (int)priv->byBBType);
 }
 
+#define vt6655_mac_write_bssid_addr(iobase, mac_addr)		\
+do {								\
+	iowrite8(1, iobase + MAC_REG_PAGE1SEL);			\
+	iowrite8(mac_addr[0], iobase + MAC_REG_BSSID0);		\
+	iowrite8(mac_addr[1], iobase + MAC_REG_BSSID0 + 1);	\
+	iowrite8(mac_addr[2], iobase + MAC_REG_BSSID0 + 2);	\
+	iowrite8(mac_addr[3], iobase + MAC_REG_BSSID0 + 3);	\
+	iowrite8(mac_addr[4], iobase + MAC_REG_BSSID0 + 4);	\
+	iowrite8(mac_addr[5], iobase + MAC_REG_BSSID0 + 5);	\
+	iowrite8(0, iobase + MAC_REG_PAGE1SEL);			\
+} while (0)
+
+#define vt6655_mac_read_ether_addr(iobase, mac_addr)		\
+do {								\
+	iowrite8(1, iobase + MAC_REG_PAGE1SEL);			\
+	mac_addr[0] = ioread8(iobase + MAC_REG_PAR0);		\
+	mac_addr[1] = ioread8(iobase + MAC_REG_PAR0 + 1);	\
+	mac_addr[2] = ioread8(iobase + MAC_REG_PAR0 + 2);	\
+	mac_addr[3] = ioread8(iobase + MAC_REG_PAR0 + 3);	\
+	mac_addr[4] = ioread8(iobase + MAC_REG_PAR0 + 4);	\
+	mac_addr[5] = ioread8(iobase + MAC_REG_PAR0 + 5);	\
+	iowrite8(0, iobase + MAC_REG_PAGE1SEL);			\
+} while (0)
+
 /*
  * Initialisation of MAC & BBP registers
  */
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index ba5575d63db0..5c14a76ed799 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -565,30 +565,6 @@ do {									\
 	iowrite16(wData & ~(wBits), iobase + byRegOfs);			\
 } while (0)
 
-#define vt6655_mac_write_bssid_addr(iobase, mac_addr)		\
-do {								\
-	iowrite8(1, iobase + MAC_REG_PAGE1SEL);			\
-	iowrite8(mac_addr[0], iobase + MAC_REG_BSSID0);		\
-	iowrite8(mac_addr[1], iobase + MAC_REG_BSSID0 + 1);	\
-	iowrite8(mac_addr[2], iobase + MAC_REG_BSSID0 + 2);	\
-	iowrite8(mac_addr[3], iobase + MAC_REG_BSSID0 + 3);	\
-	iowrite8(mac_addr[4], iobase + MAC_REG_BSSID0 + 4);	\
-	iowrite8(mac_addr[5], iobase + MAC_REG_BSSID0 + 5);	\
-	iowrite8(0, iobase + MAC_REG_PAGE1SEL);			\
-} while (0)
-
-#define vt6655_mac_read_ether_addr(iobase, mac_addr)		\
-do {								\
-	iowrite8(1, iobase + MAC_REG_PAGE1SEL);			\
-	mac_addr[0] = ioread8(iobase + MAC_REG_PAR0);		\
-	mac_addr[1] = ioread8(iobase + MAC_REG_PAR0 + 1);	\
-	mac_addr[2] = ioread8(iobase + MAC_REG_PAR0 + 2);	\
-	mac_addr[3] = ioread8(iobase + MAC_REG_PAR0 + 3);	\
-	mac_addr[4] = ioread8(iobase + MAC_REG_PAR0 + 4);	\
-	mac_addr[5] = ioread8(iobase + MAC_REG_PAR0 + 5);	\
-	iowrite8(0, iobase + MAC_REG_PAGE1SEL);			\
-} while (0)
-
 #define MACvReceive0(iobase)						\
 do {									\
 	unsigned long dwData;						\
-- 
2.36.1

