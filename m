Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE47772
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 17:00:55 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id d6so27262280edt.7
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 10:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/qg8qpnRJ2gnKGXR4jQSIOwX6UI8f5uDF9GA6xG5tCY=;
        b=JoTyfJi4J3CuVXJ+atWqubfCbKEcc+MzVVaHI51WJdv5F/7FEXQtUUubpuCkbHrssk
         DyXVDLazzXXnGiOs+DyejUb1ZFgwrKMFyKi+rfVJY6+4V0aglwhcPNFTUKxcZeaTqodT
         T8O1vZT0vjB4mk7oywXtgH3gnR/9LXtQRPuZNnMHZO8iRugPoy8CKRD2RIRCrloik2UW
         o7QBw1BAUqsOe+A9UCjyCcL+ZYQkHFppQFuED1cXgh9+anG38SAbbd5f9BXZHKkl+jvy
         GcydrFv3IphoPOPajOXWXqG8fAJiWXfS64Gm0lrzItydJqby+L03ERD3Up/bnWbVFUfm
         fSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/qg8qpnRJ2gnKGXR4jQSIOwX6UI8f5uDF9GA6xG5tCY=;
        b=gISnM9NXIquIk65knKSwzxJG24QRSvQOKAzBm9EZ1vRSknEtGUrD3GjGfAEQQRmVnT
         LAIAPkRMX16LDHU5t95KQv174veZQFSXvxl9LjGBAm/jz5Y3dtSxUGAPLNiUM6I5IgQw
         uO4zulNn3Cpj9SxGM6v2+u6Ucm5/3L1mIPkUSO+nXoyFJuBQwUNEEE06zJdZpRID84ld
         ESnuwGySiKN8Z/QRIG5gID++5Hmn5p2c8eZ5SAatyBMehYJcSoCHHvE+6o0eF+m5WuZw
         8KI+oa2QeGgJPM05nzy2iNpp8Pp2FJeE8yf12FEJyr5bx4F63mDFqo9oZmeaX4PGyyAH
         iDvQ==
X-Gm-Message-State: AOAM533xbgCJZ9x4OEYViaKGN5CBslKktzCAdzaMFFX1U6LteAD1/dq3
	Eva/HVi0U9JMPNiLlG3wpKE=
X-Google-Smtp-Source: ABdhPJwgUSmjOM/vBcLZTcjto01IsVJi2DsK+gt0z9DNKER6g4/FCcTp90BfqLFWo3eRFCTgfXK+OA==
X-Received: by 2002:a05:6402:520f:: with SMTP id s15mr31874245edd.139.1629738054337;
        Mon, 23 Aug 2021 10:00:54 -0700 (PDT)
Received: from xps.yggdrasil ([49.207.137.16])
        by smtp.gmail.com with ESMTPSA id b18sm1633188ejl.90.2021.08.23.10.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 10:00:53 -0700 (PDT)
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/5] staging: r8188eu: restricted __be16 degrades to int
Date: Mon, 23 Aug 2021 22:30:29 +0530
Message-Id: <464cbdb48b238d6b3aca435ef4f0bd05d48e01c6.1629563318.git.aakashhemadri123@gmail.com>
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
> rtw_br_ext.c:839:70: warning: restricted __be16 degrades to integer
> rtw_br_ext.c:845:70: warning: invalid assignment: |=
> rtw_br_ext.c:845:70:    left side has type unsigned short
> rtw_br_ext.c:845:70:    right side has type restricted __be16

dhcp->flag is be16. Change htons() to cpu_to_be16() for clarity.

Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
---

Incorrectly removed htons() to satisfy sparse warning. Instead changed to
appropriate type and changed htons to cpu_to_be16 for clarity.

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

