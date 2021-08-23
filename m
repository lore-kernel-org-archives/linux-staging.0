Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D69972
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 17:00:48 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id q17so5343248edv.2
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 10:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VrVKmrMNGmYrnLOt8MnaYQpufc6zYgpvwecmFAsExMo=;
        b=RPHCxu+3v+zW1cMEza2jd7MbvinIgr5YZo0byGiWrZSwbEXeoQg2pleKosJt7ceO9t
         cIn5+0RLOJYgVDN99uSrLzeFB0xJcsNN4gcMwjBlkx6YRZhXllaFAmIVsI4BCgN8Y08N
         vbzj6Dc436GlWEoI+HBShoo9wxnsM/RHXiZ5nopyUVjQT5+dGYMWNk94O1BkrovzqfFp
         kIzcVw0ww1fCQ92xcFO4/lkKUtngVn08S6UQLP6DKldVR3Y4dtedvYza8KoqcKitmYsO
         uIOZMhKaUuUTYwjK2E9EL/mG4hp2jISXjglwBpdHZynv8o+Px4xt4WTusFSQkdyHGaFS
         6KWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VrVKmrMNGmYrnLOt8MnaYQpufc6zYgpvwecmFAsExMo=;
        b=uiJtk80xp2IWsbLto8yiZq78PipiU+ysVI3iEXKJQM3mlKoYz+ylsGJzyYgUVFae4V
         YylniIJ3LyGFXId4cpaPW2OJq54GU2el6fveXuo7kyzYm8NLXb5t2Q8lsehpFnuhLZo+
         8/gxPvWznZeFItq5f7GA0/6CWkNP0HRziB4Mk+1Vht6AEXHrV9JGPCXL/L5OnLCvZD1y
         CWjTtVzeldjt91VJUZfCc68vKwX8O6PMFSWuUgvAysBgbNKOPgFmpD1zdrmIiv44dtEn
         XRybvxAdKiyQZ/tL4bfsp9/raZlRkBaxBrsy3FWnu3yeAw/hsnqroVRbCNUdTn4t/CAD
         90Jw==
X-Gm-Message-State: AOAM531HmBtk4Zw8X8AoLB3fjBhoDsoLlD24JrTcpe1aPAjjVxaxCka3
	lu3slZou9LKkeXogE0vTxfE=
X-Google-Smtp-Source: ABdhPJyIQCCUlf6o4J1leGtiYdyQX+qMZ9xUa9sAGVlNdl+Ur7XKnVPDUrlGshAQF4gJ9z35a0XV4w==
X-Received: by 2002:a05:6402:51c7:: with SMTP id r7mr38085232edd.65.1629738047034;
        Mon, 23 Aug 2021 10:00:47 -0700 (PDT)
Received: from xps.yggdrasil ([49.207.137.16])
        by smtp.gmail.com with ESMTPSA id b18sm1633188ejl.90.2021.08.23.10.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 10:00:46 -0700 (PDT)
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/5] staging: r8188eu: cast to restricted __be32
Date: Mon, 23 Aug 2021 22:30:27 +0530
Message-Id: <50439a81aca7ce8c3c97ec1c7247f4cd03f645a5.1629563318.git.aakashhemadri123@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1629563318.git.aakashhemadri123@gmail.com>
References: <cover.1629563318.git.aakashhemadri123@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix sparse warning:
> rtw_br_ext.c:836:54: warning: cast to restricted __be32

dhpch->cookie is be32, change it's type.

Suggested-by: Larry Finger <Larry.Finger@lwfinger.net>
Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
---

I had incorrectly removed bytsewapping without considering the hardware
runs in big endian rather change type to __be32 as sugessted by Larry.

 drivers/staging/r8188eu/core/rtw_br_ext.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index f6d1f6029ec3..f65d94bfa286 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -649,7 +649,7 @@ struct dhcpMessage {
 	u_int8_t chaddr[16];
 	u_int8_t sname[64];
 	u_int8_t file[128];
-	u_int32_t cookie;
+	__be32 cookie;
 	u_int8_t options[308]; /* 312 - cookie */
 };
 
@@ -671,7 +671,7 @@ void dhcp_flag_bcast(struct adapter *priv, struct sk_buff *skb)
 				    (udph->dest == __constant_htons(SERVER_PORT))) { /*  DHCP request */
 					struct dhcpMessage *dhcph =
 						(struct dhcpMessage *)((size_t)udph + sizeof(struct udphdr));
-					u32 cookie = be32_to_cpu((__be32)dhcph->cookie);
+					u32 cookie = be32_to_cpu(dhcph->cookie);
 
 					if (cookie == DHCP_MAGIC) { /*  match magic word */
 						if (!(dhcph->flags & htons(BROADCAST_FLAG))) {
-- 
2.32.0

