Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585416D0E
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 19:01:08 +0000 (UTC)
Received: by mail-qv1-f47.google.com with SMTP id es6so3223425qvb.0
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 12:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=x9RZ29lxXI2EMOo8VcDY6H7j93lSk5LdfLmzVMobZAc=;
        b=ggNdrJEtMe70DykOxl7JcGyB3Cy/Ge1LmuWHtH9bwpy8qtDes7cEIVI+ecqqts83VO
         cib4ulPzT6RrN6sAahwPETkUvs+1TGiRulb959tlz34IwhgWCWRh8kDWY6ZtBGJGwMc+
         Gqxu6toWZtKZKEWVWbj9Xfe9zzh58ua/qgn97n/qtz6X53Ql3n5AAI3UtaDNT24qjs5o
         XsoQvq2FSKLNfMhrTLZDZ/NtvBw/KCvjM9kZ1+yII4LSLJwiDSPnE70I66/q8ytg9Q+Q
         7uXU3gZ9q+gFrrE1spr+LKrUWFoNaxBxTpcOprA0xBKKAVX1JCC5gtjnC2MvOX+oUSut
         FHlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=x9RZ29lxXI2EMOo8VcDY6H7j93lSk5LdfLmzVMobZAc=;
        b=ubWoLOTumSoBMCCovJm7eXov/ItMgy9ayaL1W8UQ9Rn6d3Jo0W/5oEvxYeLoMLd+gX
         EdsHnt/XGaZwQMfiG+yKq+3zOnelwXbUbIC1Q4C7qFQvN2Ar4wEc6HxG2UBagRegXVll
         qW9Q6VR00ZPPPOFrYj9nBmq3PAB7sJ4LiWPhyK3tUIhPrxnXpb54BlCpPCVYERb+pIyQ
         Nk8+NqkB6D2yVZuw90KGeo+QQppV2ywNb96N+MLjy50bGTJEawKaL/bJN+C5RNs0bH8u
         HonhLxdOGkIgipOZvmiu5CHwfV09lBYschb/e3bjuFNfhEXN595N+v/NF786VFbtqjPv
         RiKg==
X-Gm-Message-State: AOAM532rukkVLvXToUK8XQp5N3x0dRYN4T8/KO/sOWh2T4aaeujzCec4
	1BQUyvGXGOar9hS6AVqchGQ=
X-Google-Smtp-Source: ABdhPJxTNKtMxFdbac6tnjQtMoRd9lbflE2c8t8Fy5DVo1my0b2QLYO4wxYi3J//gjzj3WVJe+a1/Q==
X-Received: by 2002:a0c:c488:: with SMTP id u8mr15234090qvi.47.1617994867308;
        Fri, 09 Apr 2021 12:01:07 -0700 (PDT)
Received: from focaruja ([177.220.174.147])
        by smtp.gmail.com with ESMTPSA id d14sm2519392qkg.33.2021.04.09.12.01.06
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Fri, 09 Apr 2021 12:01:06 -0700 (PDT)
Date: Fri, 9 Apr 2021 16:01:04 -0300
From: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	alinesantanacordeiro@gmail.com
Subject: [Outreachy kernel][PATCH 1/2] staging: media: omap4iss: Align line
 break to the open parenthesis in file iss.c
Message-ID: <aed4449f7f054eee329a808527c2a08d79076c78.1617994571.git.alinesantanacordeiro@gmail.com>
References: <cover.1617994571.git.alinesantanacordeiro@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1617994571.git.alinesantanacordeiro@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)

Aligns line break with the remaining function arguments
to the open parenthesis. Issue found by checkpatch.

Signed-off-by: Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>
---
 drivers/staging/media/omap4iss/iss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/omap4iss/iss.c b/drivers/staging/media/omap4iss/iss.c
index dae9073..c89f268a 100644
--- a/drivers/staging/media/omap4iss/iss.c
+++ b/drivers/staging/media/omap4iss/iss.c
@@ -960,7 +960,7 @@ iss_register_subdev_group(struct iss_device *iss,
 		}
 
 		subdev = v4l2_i2c_new_subdev_board(&iss->v4l2_dev, adapter,
-				board_info->board_info, NULL);
+						   board_info->board_info, NULL);
 		if (!subdev) {
 			dev_err(iss->dev, "Unable to register subdev %s\n",
 				board_info->board_info->type);
-- 
2.7.4

