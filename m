Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com [209.85.167.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E43C1363;
	Sat,  2 Apr 2022 08:51:11 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id 12so5034704oix.12;
        Sat, 02 Apr 2022 01:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9I03BMhkhj8iUIyy6XKaip4rxh8dASQlWGBFPFtcJdU=;
        b=FTQnQB4RlP3zZc8B3BA+1eM/3K0wyc2lKQ8spNFzXfOuhkw+LPAo3EenZqAm3VsLNG
         O6MYIFrLuWy/9kEp8Fx5FPl4IJyWLlWRnaRJIR4xYrBPv21tH9G8DR6tIYqxLf5ohudb
         4VOxLKrfGtiCogxWe5huTcVVtFWVLWJ9gWyxAbPm0Hvb6Cc1JA2BzYyv1GDxzTgN6cR5
         snTCDBmZN1gTH9c9pkUFjpWEJNg6Qj0R2FK8XjwXQN7wb4l1gES6PkoQhqWpJq92rSK8
         eWJdudwWL3Bvpsx33/QU0sW6fLMdy+3SUGV8C0jJGZ1ROd/nYZiLdBCHHu+FhkdZdg3R
         pm8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9I03BMhkhj8iUIyy6XKaip4rxh8dASQlWGBFPFtcJdU=;
        b=VIvrUSOdUTZc/h3fdT8RPAZjWw+i4lFPd4gXUrbXfLg3YZL73uo7AR/rq1twhbNdh8
         gzQoXuAkagjbTE+CM+8nXGKIyh7WQHlpa8684UNVmf8VZWNMOFbO/TKL/npX3f/CetTu
         rzMCmNPGxsNTbZXp34FJuarT6tQRM+SVIekLv6b9Xvtn2+y1MNxC9wqXprdjIzpkMyPt
         9HRkiXBobYzxbvla+vbqwE1NpaniOjT5JwreYXhIgJoTIoaHQlvn/n9smHGl075jS5ri
         kkTEkSHyQWwBJficxnLGmUdvbKrVyMiDZXJvgADN4naR1GsxLNUtkH9MYuORfrX0FuT1
         T8Qg==
X-Gm-Message-State: AOAM531Ak8VPyJpQaeo9IX/bn29HIYixMCMYuKehPZZ7is8TR0ihndnC
	WVotrlWAPyqpaUN+RRw0vrk=
X-Google-Smtp-Source: ABdhPJxcoDXIsrCQCP2NXq0IjEK+agNI7HeBDOb9L7IomsnximUZErN4osvarEdwaze5cYmP7ka5bw==
X-Received: by 2002:a05:6808:9ae:b0:2d9:a01a:4bf4 with SMTP id e14-20020a05680809ae00b002d9a01a4bf4mr6201939oig.283.1648889470205;
        Sat, 02 Apr 2022 01:51:10 -0700 (PDT)
Received: from bertie (072-190-140-117.res.spectrum.com. [72.190.140.117])
        by smtp.gmail.com with ESMTPSA id o18-20020a9d7652000000b005cbf6f5d7c5sm2146637otl.21.2022.04.02.01.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 01:51:09 -0700 (PDT)
From: Rebecca Mckeever <remckee0@gmail.com>
To: outreachy@lists.linux.dev
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rebecca Mckeever <remckee0@gmail.com>
Subject: [PATCH 1/6] staging: r8188eu: place constants on the right side of tests
Date: Sat,  2 Apr 2022 03:50:43 -0500
Message-Id: <0f3db3586b3668d6d784e075bc52ffd88b0920d2.1648888461.git.remckee0@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1648888461.git.remckee0@gmail.com>
References: <cover.1648888461.git.remckee0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Conform to Linux kernel coding style.

Reported by checkpatch:

WARNING: Comparisons should place the constant on the right side of the test

Signed-off-by: Rebecca Mckeever <remckee0@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 4fda2fe07ecc..3b282c387282 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -189,7 +189,7 @@ u32 rtw_enqueue_cmd(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
 	cmd_obj->padapter = padapter;
 
 	res = rtw_cmd_filter(pcmdpriv, cmd_obj);
-	if (_FAIL == res) {
+	if (res == _FAIL) {
 		rtw_free_cmd_obj(cmd_obj);
 		goto exit;
 	}
@@ -260,7 +260,7 @@ int rtw_cmd_thread(void *context)
 		if (!pcmd)
 			continue;
 
-		if (_FAIL == rtw_cmd_filter(pcmdpriv, pcmd)) {
+		if (rtw_cmd_filter(pcmdpriv, pcmd) == _FAIL) {
 			pcmd->res = H2C_DROPPED;
 			goto post_process;
 		}
@@ -613,7 +613,7 @@ u8 rtw_disassoc_cmd(struct adapter *padapter, u32 deauth_timeout_ms, bool enqueu
 		res = rtw_enqueue_cmd(cmdpriv, cmdobj);
 	} else {
 		/* no need to enqueue, do the cmd hdl directly and free cmd parameter */
-		if (H2C_SUCCESS != disconnect_hdl(padapter, (u8 *)param))
+		if (disconnect_hdl(padapter, (u8 *)param) != H2C_SUCCESS)
 			res = _FAIL;
 		kfree(param);
 	}
-- 
2.32.0

