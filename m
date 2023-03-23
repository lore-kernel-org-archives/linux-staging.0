Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAEBA8F70;
	Thu, 23 Mar 2023 12:41:54 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id ek18so85980865edb.6;
        Thu, 23 Mar 2023 05:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679575312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bNg7iZ+PuRMN0DqLdZrW00PMhOD0f4GRznXTT5Ec9ug=;
        b=c2mdPwifKTGrVqQfBoQq5+0Qbh3+PzLWiTCBTCOI4wPnQmVhzmFPhlk5IcPthraXZ3
         1HXFfgirj+JKFx4BbPzy/P5IF4NUDy3ujgKxJ6Zg8IKS8ikQXsMHfm4Xnx0tYE7R4sTD
         vgQnQCLxPv3GCDiorv5u8pIdElZpye5l8wdwJde09YUNsotqRaoE6vUPDMQZ0MSllAlC
         +13Ez1ev9J65M3fJcugW9nCxTkP+0c76tSy9m093j8yoyhKMFbnaTEYPL5kNxj53v3pa
         QqPaErJgBodvp7zJ3BG3YxxkrPQuCFgiIMy8LhHWvL8tUkkHngN+SAmK6yP4TkjqU9mZ
         4l8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679575312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bNg7iZ+PuRMN0DqLdZrW00PMhOD0f4GRznXTT5Ec9ug=;
        b=ey0t1VDeyp6gPZWnpGVTC/oBIkAyLV/za6U8dX/m+/sqrS8GryvuebaWAzwMnmjgue
         D/8fZM48D70gGll5KeHK3OC2xMIaZ8HzHaM3zkhv+Ir8Vu5aRBSNxRMB6RZbRGid6NpJ
         +fu+NZVEsHCWuI12G0FvzjtUgxe0DAzPmi7RtjSo6vS5Vir6y8wYTFT8vVCTiwqpstV1
         fgg7/wnT+SO03cCkQoyqt0RSvqXZUKY9tgP8nMxlQYXd3DL6PgWoO9SGoj/FwKgXHzU6
         xrjXjghZkROY+geDSYQVTBMkpgV2tya756m88Xw6xBKan464wIff6oR3mt9sQC6kxZYb
         cf/w==
X-Gm-Message-State: AO0yUKXdXMfHZVRGGsUNKcPGZSHlPejIML+fkZ25KY8C7VE1AcvkVlj4
	Y6u2tpAF+6BrA4QzDJKGCqAmaMnrj1ip02Ob
X-Google-Smtp-Source: AK7set/+XEjs58tHkW2iyt4lkh0/495N66AhyWek8O/RYAogGfqhYlkGlfP6yviSN2wtRHgYI8sYMg==
X-Received: by 2002:a17:906:3710:b0:923:812c:a5d3 with SMTP id d16-20020a170906371000b00923812ca5d3mr5550362ejc.25.1679575312825;
        Thu, 23 Mar 2023 05:41:52 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id g1-20020a1709061c8100b0092669fb4ba1sm8597116ejh.130.2023.03.23.05.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 05:41:52 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH 2/4] staging: rtl8192e: add blank lines after declarations
Date: Thu, 23 Mar 2023 17:41:43 +0500
Message-Id: <eae4647540b26afa88ee99209e39f5b461e7132b.1679573474.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679573474.git.kamrankhadijadj@gmail.com>
References: <cover.1679573474.git.kamrankhadijadj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add blank lines after declarations as reported by checkpatch.pl

"CHECK: Please use a blank line after function/struct/union/enum
declarations"

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_rx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/rtl8192e/rtllib_rx.c b/drivers/staging/rtl8192e/rtllib_rx.c
index c6114d99829b..7144a0630ea6 100644
--- a/drivers/staging/rtl8192e/rtllib_rx.c
+++ b/drivers/staging/rtl8192e/rtllib_rx.c
@@ -231,10 +231,12 @@ rtllib_rx_frame_mgmt(struct rtllib_device *ieee, struct sk_buff *skb,
 static unsigned char rfc1042_header[] = {
 	0xaa, 0xaa, 0x03, 0x00, 0x00, 0x00
 };
+
 /* Bridge-Tunnel header (for EtherTypes ETH_P_AARP and ETH_P_IPX) */
 static unsigned char bridge_tunnel_header[] = {
 	0xaa, 0xaa, 0x03, 0x00, 0x00, 0xf8
 };
+
 /* No encapsulation header if EtherType < 0x600 (=length) */

 /* Called by rtllib_rx_frame_decrypt */
--
2.34.1

