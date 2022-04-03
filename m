Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C717C;
	Sun,  3 Apr 2022 19:17:22 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id y3-20020a056830070300b005cd9c4d03feso5899957ots.3;
        Sun, 03 Apr 2022 12:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7Gd2y7AVWs28ptZSwQ3MW03jeLKh2Yn3UJWNjnhCBkQ=;
        b=YgrvFGuqMar6kg3zLV4k+VqjMG6i6EycoQA/RYbGd3gM4mXvQyL8XIIW0SZfxnI/rO
         p9bi2Nci3azhNOjylJ6gtg30uFSDQBBqpZ8IdCNJMcqTOCqUwXzqeaKw5pmQQMXR33Xf
         VMANVxSrNJAfEWwrxPz+T7dSvTf0PB6UPZNlntgL5nQ3PEfdcO8e39m0TBoVNrIupn49
         nauj1SPH3OZ7D7l/85kycHTimQ2WKW7Eyzi8SoUMdDJoBWCYYIvnPvDm6e/x48JiQA+m
         mKOXOh+/ZUJW8eEKHeKdsaAJOKa2fnL05jMEe+fsC5+QgBOOEotUBF1e4jDmhmm9OA3e
         TBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7Gd2y7AVWs28ptZSwQ3MW03jeLKh2Yn3UJWNjnhCBkQ=;
        b=dvVSVTYVA0uQhdz7ei00fZGTL2JHDXo4bpCqKHMeJvsXWRrZkxpTtzNZaeTKQrH4lr
         nplLCddD8HIYE+H1PHsbfusnXryUCXzghTB1TIo41eltKlYh9W4kvgViTwntx5L5ZHmB
         uOX3E2x0THBCRD3ISjFk/IHxZsnD4rtIsx81p6WOAWWQ3O6KujfedCUTbpQd/3N6kAcR
         tg22V32nzP9JJSCPiJMIiuHOF8LuTm0QmXA0oubTdk6kxLM7dpZyyrS6x+SBLQPtT1X1
         I0D3xlNl81zzhlwv8Mju/TgjRNCVylZ1GhJeaTmHlw040D9izEej0YTSAmezXeACDQSE
         Jq3w==
X-Gm-Message-State: AOAM532eJVHXUCIi1YA07qWJmcLSFk8vSjDgG35LHAwWjPWH7GAm55Q4
	yopnrEZ2P1GaOP279S3ko1g=
X-Google-Smtp-Source: ABdhPJwJtsq53S3z9z1uQyzjBZ6vcJ80DYbL2VyzbQ+bH5n5YfFTu2BQDNp/2klJ9ja8D7aLJAYsIA==
X-Received: by 2002:a05:6830:61b:b0:5cc:e44:7dc3 with SMTP id w27-20020a056830061b00b005cc0e447dc3mr10688999oti.159.1649013442167;
        Sun, 03 Apr 2022 12:17:22 -0700 (PDT)
Received: from bertie (072-190-140-117.res.spectrum.com. [72.190.140.117])
        by smtp.gmail.com with ESMTPSA id i28-20020a9d4a9c000000b005ce06a77de2sm3920329otf.48.2022.04.03.12.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 12:17:21 -0700 (PDT)
From: Rebecca Mckeever <remckee0@gmail.com>
To: outreachy@lists.linux.dev
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rebecca Mckeever <remckee0@gmail.com>
Subject: [PATCH 3/3] staging: r8188eu: add blank line between functions
Date: Sun,  3 Apr 2022 14:17:06 -0500
Message-Id: <ccacca6f679a879ad2032dc0aeb0b0156e3a847b.1649011311.git.remckee0@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1649011311.git.remckee0@gmail.com>
References: <cover.1649011311.git.remckee0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Conform to Linux kernel coding style.
Noticed when completing a different patch.

Signed-off-by: Rebecca Mckeever <remckee0@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 2d316a6c8294..ecd0488c439b 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -1420,6 +1420,7 @@ void rtw_survey_cmd_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
 	rtw_free_cmd_obj(pcmd);
 
 }
+
 void rtw_disassoc_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
 {
 	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
-- 
2.32.0

