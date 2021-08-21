Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169E23FC2
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 16:18:47 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id 28-20020a17090a031cb0290178dcd8a4d1so11009317pje.0
        for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 09:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WzRDVj8kh2b1JZfWSLoz1YXoIow59eKZovHPJUZMpVE=;
        b=QpGloXqfJhiLxmJuJZD9iPEr6+Xkuzp3hLhDOIc0m1UsFeZYBhYqmX0Oegg8gP+Ccs
         zea4M6Az7ZKcB2LmZTb0VLTsIz4DZpKNzuptK7EzrycPfimZveOIsISO1bROJ3PlzBC3
         DAkJeMFRtHLXHANnyjXJ+P138lasIEnuhL9upnzCo2ugtvakByO4aXF/520kmD18pL2v
         7CxVINMxfkNS+tc4nKdEVKIVz3adyt1I3rRnSPrz6/Lht+D7LoB09M7cKdGlgCOwjiv6
         iAwEW1uz66FmAs2SuCNt9RsdjuBTXmyIDTcUbjrE7B5E7y7CcOZr9QCuepxKF7iPv7KM
         yz0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WzRDVj8kh2b1JZfWSLoz1YXoIow59eKZovHPJUZMpVE=;
        b=r6oEwgWAYhzx5NpxHA1rFTrViShbwJmlCWkmd5YyP982Kdu15k/iMvW2cGcwkO/mF/
         urwY3HHNit3UVRm/wU5ly0s7vwXn9CuPv2it5IsQCxVavXx6crjPOPCSTcfVtwYGU8Ul
         wTm4YT9GEiAVIN4TNXnfXRxnRBREQsxi0aTJx7EnQQXxAcB4xyxz4YJVGE2/L2clWkH9
         NHNXGM3EhSBlaJIjMc8wR0J1axSYxMHz/Y19bRTma9fRfFnI8Rw3WBGT0Akb2ZFEJKmL
         ga+DV1p3h/twwHUk5kYKjsn1fQvNgZEMrLqdl70W0dAI3o5TtxfFmKjVEEaQbf+Lst7T
         qVVA==
X-Gm-Message-State: AOAM530IQ98yUNQ57lJSNxAq+ROryY59NVkjG0qCvYgYoJl1DWzhKDz3
	1a6bJFHVJ1EDyCtRprDXohE=
X-Google-Smtp-Source: ABdhPJwpfIwVWwbBYn5nj+I+o2rKEr2X6F8u0SHnkDbSyTU0VnawOYQZTJNnMvGWySIuas01o72adA==
X-Received: by 2002:a17:90a:44:: with SMTP id 4mr10392350pjb.130.1629562726785;
        Sat, 21 Aug 2021 09:18:46 -0700 (PDT)
Received: from xps.yggdrasil ([49.207.137.16])
        by smtp.gmail.com with ESMTPSA id y27sm4227011pfa.29.2021.08.21.09.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Aug 2021 09:18:46 -0700 (PDT)
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] staging: r8188eu: restricted __be16 degrades to int
Date: Sat, 21 Aug 2021 21:48:31 +0530
Message-Id: <464cbdb48b238d6b3aca435ef4f0bd05d48e01c6.1629562355.git.aakashhemadri123@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1629562355.git.aakashhemadri123@gmail.com>
References: <cover.1629562355.git.aakashhemadri123@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix sparse warning:
> rtw_br_ext.c:839:70: warning: restricted __be16 degrades to integer
> rtw_br_ext.c:845:70: warning: invalid assignment: |=
> rtw_br_ext.c:845:70:    left side has type unsigned short
> rtw_br_ext.c:845:70:    right side has type restricted __be16

dhcp->flags is be16, so change its type to that.
Change htons() to cpu_to_be16() for clarity.

Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_br_ext.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index 26606093a3c3..83a4594a4214 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -641,7 +641,7 @@ struct dhcpMessage {
 	u_int8_t hops;
 	u_int32_t xid;
 	u_int16_t secs;
-	u_int16_t flags;
+	__be16 flags;
 	u_int32_t ciaddr;
 	u_int32_t yiaddr;
 	u_int32_t siaddr;
@@ -674,13 +674,13 @@ void dhcp_flag_bcast(struct adapter *priv, struct sk_buff *skb)
 					u32 cookie = be32_to_cpu(dhcph->cookie);
 
 					if (cookie == DHCP_MAGIC) { /*  match magic word */
-						if (!(dhcph->flags & htons(BROADCAST_FLAG))) {
+						if (!(dhcph->flags & cpu_to_be16(BROADCAST_FLAG))) {
 							/*  if not broadcast */
 							register int sum = 0;
 
 							DEBUG_INFO("DHCP: change flag of DHCP request to broadcast.\n");
 							/*  or BROADCAST flag */
-							dhcph->flags |= htons(BROADCAST_FLAG);
+							dhcph->flags |= cpu_to_be16(BROADCAST_FLAG);
 							/*  recalculate checksum */
 							sum = ~(udph->check) & 0xffff;
 							sum += be16_to_cpu(dhcph->flags);
-- 
2.32.0

