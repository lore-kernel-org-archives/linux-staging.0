Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1C93FCD
	for <linux-staging@lists.linux.dev>; Mon,  6 Sep 2021 18:54:12 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id ia27so15054829ejc.10
        for <linux-staging@lists.linux.dev>; Mon, 06 Sep 2021 11:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lURT0bL/Ua3DL+p4fVIfhBItarDnpsIG5IN7GeJbB/Q=;
        b=SLYoF45iT9ysDQ4MAC6jMfYqP4mdYmwXYtYuf/+S7RPNq6xtmqAkl/eEmp1DxNOR+s
         R1VU46s/RXz6t7m9OHhuC+eZpJ4zrPdP5Wm2+k2AK1UCQ8IAYOvWy003CEWLZi1g9bry
         +V4iGYhYAhacP9D3TtNPIvXQig2cgS3MAK76aJqBy2R+0a2mAvcpaLSy7D8CZOuaCQFa
         Tco0FMecb2r8gd9m7j9FPNFX+9tWgpP4PNZqQVZdV8iLl7tWqlxUu3km6ys4x6Xi51em
         5TISQrydyYB5oI6tN2khR4sgE7RMVlvUOv5uK7MJdQa22Pj3K1uuc36XStLJsXgBsxWi
         B13A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lURT0bL/Ua3DL+p4fVIfhBItarDnpsIG5IN7GeJbB/Q=;
        b=PD0gI3RmRRG7gLUwkszWglBYirJFZTNVBOCkWFRoV6uUGBW/RzinVjWbg4CL7m55MA
         iiMt/G96W8Iovd1IwG90SGoDEiHjnsmWsUFIN2PzAPTaCt3GAMjjuS+quHMrlnouerfG
         2ek6+N+U/4fnxFH1XitfotqOl64TKYuOhU4bsTpe1cdLAAWNrW9EMpSOQD4XHYeaozsS
         O4kRUOJIaQlSLbKirh6Siv4OEviZ0oSnnar9dfLXQk3dcc86pFoTqU/v5Lje6THswlut
         8qFG4vQpIAuAi9wV6G0HR0SKlqjAf8PIYGvKz8FgNn1PnKD5Xez21obxbjHIJoZtgYAY
         hB4Q==
X-Gm-Message-State: AOAM533LQ/84OW3nKS9hj5SaMIU4Xs0T1pze1ExWPsBGCCEhfpEaJw0+
	LceN6RLQunNSCSsxDq9UJuw=
X-Google-Smtp-Source: ABdhPJymwJz3ufK2fcjPmNJkoieZPDpRmFGsEc2irfHTwkJV6HAdHx4KyLDS4JRq8UkEWCdTbyzvxg==
X-Received: by 2002:a17:907:92c:: with SMTP id au12mr14799225ejc.523.1630954451382;
        Mon, 06 Sep 2021 11:54:11 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::8fe1])
        by smtp.gmail.com with ESMTPSA id kk2sm4329128ejc.114.2021.09.06.11.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 11:54:11 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 12/40] staging: r8188eu: remove unused enum hal_intf_ps_func
Date: Mon,  6 Sep 2021 20:52:59 +0200
Message-Id: <20210906185327.10326-13-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210906185327.10326-1-straube.linux@gmail.com>
References: <20210906185327.10326-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HAL_USB_SELECT_SUSPEND and HAL_MAX_ID are both unused,
so enum hal_intf_ps_func can be removed.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/hal_intf.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index eab0b8576c92..3bf0d18e2ba8 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -121,11 +121,6 @@ enum hal_odm_variable {
 	HAL_ODM_WIFI_DISPLAY_STATE,
 };
 
-enum hal_intf_ps_func {
-	HAL_USB_SELECT_SUSPEND,
-	HAL_MAX_ID,
-};
-
 typedef s32 (*c2h_id_filter)(u8 id);
 
 struct hal_ops {
-- 
2.33.0

