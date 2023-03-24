Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643A52771F;
	Fri, 24 Mar 2023 22:31:40 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id l27so3195029wrb.2;
        Fri, 24 Mar 2023 15:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679697098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Mi0Pc446/hNZjoA2whb7pVis3I9iPt8Xg8w3eBefMA=;
        b=mobA70mS99HIO8GofxD3z9FKdGusnjzAI/gAeFjArElMNCo5NfQvSbk6Sxh9NWZScu
         0N3K/5Nlr4AEYpeglA53RuQWLjPblzOoua5gBnGIjpKeQdRGMwV4Y3Xi1roA0YeP3fYe
         6y1uJSGwfYYJCE6aM+fLGdYKjKk5mtpAbfSVU5HamqNnX5bmAliBHKoH7PAd2XHwuGYT
         Tm+w+2Pu0J/2Kn4/NFPJgl2ZPwGJUyO6RvDEPGLGI/tCErRBTyIpxX36f++YbYHDliwv
         OWdw7przsj+4A5pXd+4LM9h0baNua+tUR9xjetbcjHgqvl1Wtm6IazNHd+3bV4ccALaz
         BG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679697098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3Mi0Pc446/hNZjoA2whb7pVis3I9iPt8Xg8w3eBefMA=;
        b=cp6GdjmdTOXxYJUPpG8fl7VleimUEUqxCXcOeXNYqXrZqan+0wClM90x7OUUM4bzWn
         Yjab+t94CbkQPauNfKnooxEqolBfaxx3WM4h4QZXVeUPUz/iSNzS7V//MauO+H3WGwj3
         uWQN5r0TRARIoKpWixgw8wvv3IX7d9daKKztWtvBBMzuf/vVTpUkEsdAQsnH1Koft2he
         gSHB+wZRUKBqy9OVazZAvwI4wFYdD3CAhQ4n/o+Zz4PphsEz5Fv3UXc7ZoTQ9MbXZIdF
         ydyzR7J+QbFLpLUl00y2wA4jwSZe/BPEWmPxOZBXAWLA4o6mLm73bPDmZl2ppmJ78QmF
         Mr8Q==
X-Gm-Message-State: AAQBX9fl9z8DQqcPsgQHhXl15ZU0prIVTCZ5p8ZcvxcMb10WDPuC9KCQ
	Ar7zFoUuxk2IKAztDnTSjmISkvP92Lftzw==
X-Google-Smtp-Source: AKy350aF8hqqUeU5omOOYaYRzd2NcGnM1I0RRzkrA4T9gmjTQPoPECgS8HaiMJrnyj1W0t3wJb377g==
X-Received: by 2002:a5d:4b44:0:b0:2d8:47c7:7b50 with SMTP id w4-20020a5d4b44000000b002d847c77b50mr3464652wrs.1.1679697098358;
        Fri, 24 Mar 2023 15:31:38 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id d7-20020adffbc7000000b002d5a8d8442asm14984138wrs.37.2023.03.24.15.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 15:31:38 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/4] staging: rtl8192e: add blank lines after declarations
Date: Sat, 25 Mar 2023 03:31:29 +0500
Message-Id: <d8a5e738046ffdc1b257e1935eacb8e16af34d5e.1679696777.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679696777.git.kamrankhadijadj@gmail.com>
References: <cover.1679696777.git.kamrankhadijadj@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add blank lines after declarations to adhere to the Linux kernel
coding-style guidelines. These issues are reported by checkpatch.pl

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

