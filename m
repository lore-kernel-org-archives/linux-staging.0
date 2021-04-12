Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB77C70
	for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 12:57:17 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id x11so13072925qkp.11
        for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 05:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/U/PfNnIacHN6/B+3pGZEPy3lv6e1Ed7uOyTxH72DkA=;
        b=bw/sEW0qGhzcmGaiOFtncmE1g+YPNHIpnr9u5Z425d5XKLGrKJpzIlcuWqu7yjjNcS
         L878OxiHnUV5TUGOODcRV571J/Himk2gMB8iVhbSh7opcZ8DUmX8BnY/F/AkG1aNUGwA
         nTloeAxdExDAnbC5jQLqIHSRWTgBQEg4wm71wj7V976c6k1o2YV9vofWTu0N9W+QhjZC
         YhAjARvHdvbPhiXRZpJGYGSy93O3KJ+aZ5cAH1GLANZroSMprUo574ngEfXMMrBK6IfK
         AdrM8sBnLZvnYZ9SpIKptUpJu2H0GzHP8QdpIAdJ4KGQfA30I/qDPAHiPK4Nke/5VQXS
         GTKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/U/PfNnIacHN6/B+3pGZEPy3lv6e1Ed7uOyTxH72DkA=;
        b=U/y6QPKEUFlDdGmgWFZVnF3rcfrEhNCtFI+BxNJW1WvJr905+InROxNYeSMmMAFZel
         LDmNZpqf9CdU6+4ylChdZ9FO4Z+27qU3qeKScEphtq/JgmRLdzhd9tkvUcYltfdlhKbg
         +DRyNiUi3VBeyl+hjHeZ2ckMQAd03EaUQ+bXPI4sOC1M80el8fN+PdJl1Y/s8C8eqlI9
         mAQcj0wMSJbFWFh9ivIIBu+XKpLRekzzf0dzof1roKLa3Gkl7PtSlJ2Sui4+Xv7Z8N2G
         ABylCONVoCgrEPW97kC3VkLstgoKEgFB00R8aRYSyYI2dkPGfWI9opQBnND8NgGm7Imq
         0THQ==
X-Gm-Message-State: AOAM532/up1KYlnX6cZTd/H39KuXL7CxTDQuKM93V2Z/3zzAfJ4V33pK
	M+H6yQSVKIe1R27GDTTGct1PaewrFJ49+Gr3
X-Google-Smtp-Source: ABdhPJyNvSltvpQEMt3poQvp/nizkUIggjZx0AHSdfGNr2QlJDdV6lwNp0TbWekvmaqLeAnWALmZrQ==
X-Received: by 2002:a05:620a:1592:: with SMTP id d18mr4864123qkk.329.1618232236956;
        Mon, 12 Apr 2021 05:57:16 -0700 (PDT)
Received: from focaruja ([2001:1284:f016:a037:476a:dfcd:f18f:9ad5])
        by smtp.gmail.com with ESMTPSA id y29sm7745488qtm.13.2021.04.12.05.57.16
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Mon, 12 Apr 2021 05:57:16 -0700 (PDT)
Date: Mon, 12 Apr 2021 09:57:14 -0300
From: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com
Subject: [Outreachy kernel][PATCH 2/4 v2] staging: media: omap4iss: Replace
 macro function by static inline function in file iss_ipipe.c
Message-ID: <d55b486bf3778576d1ecbec4ede5c992140eb0e9.1618231618.git.alinesantanacordeiro@gmail.com>
References: <cover.1618231618.git.alinesantanacordeiro@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618231618.git.alinesantanacordeiro@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)

Replace macro function by static inline function.
Issue suggested by Julia.

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---

Changes since v1:
 - Insert file path in commit message
 
 drivers/staging/media/omap4iss/iss_ipipe.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/omap4iss/iss_ipipe.c b/drivers/staging/media/omap4iss/iss_ipipe.c
index 26be078..09c941c 100644
--- a/drivers/staging/media/omap4iss/iss_ipipe.c
+++ b/drivers/staging/media/omap4iss/iss_ipipe.c
@@ -38,9 +38,11 @@ static const unsigned int ipipe_fmts[] = {
  *
  * Also prints other debug information stored in the IPIPE module.
  */
-#define IPIPE_PRINT_REGISTER(iss, name)\
-	dev_dbg(iss->dev, "###IPIPE " #name "=0x%08x\n", \
-		iss_reg_read(iss, OMAP4_ISS_MEM_ISP_IPIPE, IPIPE_##name))
+static inline ipipe_print_register(iss, name)
+{
+	dev_dbg(iss->dev, "###IPIPE " #name "=0x%08x\n",
+		iss_reg_read(iss, OMAP4_ISS_MEM_ISP_IPIPE, IPIPE_##name));
+}
 
 static void ipipe_print_status(struct iss_ipipe_device *ipipe)
 {
@@ -48,16 +50,16 @@ static void ipipe_print_status(struct iss_ipipe_device *ipipe)
 
 	dev_dbg(iss->dev, "-------------IPIPE Register dump-------------\n");
 
-	IPIPE_PRINT_REGISTER(iss, SRC_EN);
-	IPIPE_PRINT_REGISTER(iss, SRC_MODE);
-	IPIPE_PRINT_REGISTER(iss, SRC_FMT);
-	IPIPE_PRINT_REGISTER(iss, SRC_COL);
-	IPIPE_PRINT_REGISTER(iss, SRC_VPS);
-	IPIPE_PRINT_REGISTER(iss, SRC_VSZ);
-	IPIPE_PRINT_REGISTER(iss, SRC_HPS);
-	IPIPE_PRINT_REGISTER(iss, SRC_HSZ);
-	IPIPE_PRINT_REGISTER(iss, GCK_MMR);
-	IPIPE_PRINT_REGISTER(iss, YUV_PHS);
+	ipipe_print_register(iss, SRC_EN);
+	ipipe_print_register(iss, SRC_MODE);
+	ipipe_print_register(iss, SRC_FMT);
+	ipipe_print_register(iss, SRC_COL);
+	ipipe_print_register(iss, SRC_VPS);
+	ipipe_print_register(iss, SRC_VSZ);
+	ipipe_print_register(iss, SRC_HPS);
+	ipipe_print_register(iss, SRC_HSZ);
+	ipipe_print_register(iss, GCK_MMR);
+	ipipe_print_register(iss, YUV_PHS);
 
 	dev_dbg(iss->dev, "-----------------------------------------------\n");
 }
-- 
2.7.4

