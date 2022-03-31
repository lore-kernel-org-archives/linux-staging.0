Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E449EA2D;
	Thu, 31 Mar 2022 18:19:48 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id 12so341758oix.12;
        Thu, 31 Mar 2022 11:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=UmEy4y9PjTmQL29BGmVnPhGoeFVJB6ew1tM59ape4EU=;
        b=iRkJYB5sjDYwHA6hDkF9Xn57bLOePpOECuGzyJ+2TzWQ88nfVA2l34qVNpjVy26MCI
         FTmOslALSnpQ2O9p/MwmR3A0ReB3xZEZKLHBQoH+vzpkCwnN9LzyBqQlM6AHuqEJ8WpF
         xpHpNjKq9+JuDriODTgPFCRNoQSVNFQKjbolmoHS+A9UrPKgeC06BxT12WMhW6jVKSVv
         JVERzi9tHHJBx1kok3RflAlTGSUfSIr8kY5fGHmbTMM/Hd1ccX00Cl1cbDI3v/0wZJDW
         hRIgWOj8DuzVx19jNQ+87BgdHzWzc3cEKL0IBYfjPAJZwaF5dplyj+EL6rx1lwV0VzqP
         8mZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=UmEy4y9PjTmQL29BGmVnPhGoeFVJB6ew1tM59ape4EU=;
        b=lWf8I16m5mPC1SOz1X0jzgbEpG+scedR69T6H2dtmkojmA0kVnWSYB9ZnoEpXsI6cC
         Ml0EF/j4FqoGXPcROrRwhg1tl+a1hw7ptrVoajb5KDO4hqmWAg5Ve/NEVFy8NMygt7/G
         aXRFQFT1GXLeXrtOaIgbKKb+wCOzgglC0g/r6SQBGHt01JNy9WrLYDuQYM8XIw/Sc6By
         9ZmOzIATyl9r1wH7qHkyPXX2Vcpq5VXX16gjjnIUl41cEC1LwPNxSeOBk4xo26Wzv9d6
         Wxk/jBdqLXmFXy7yAaHZxreQ/9YwFWAO6CeDCsYKZn7vitSDBmnmVZostXQe+HM3ZmXL
         jNmw==
X-Gm-Message-State: AOAM5318B0bQ50gqd2/xc3+G+wvQ55cV6FeU9amaTf0aBSvEP5gWZJ2J
	eWfujYXPKcqDPh+EftYVDAypgfO0tfkNVA==
X-Google-Smtp-Source: ABdhPJxyXhBs2gU+7i9d2VhmYjMpJbu6B2GokWYmLoczSMphjcpITchlQGMyXmK5b+yJ2XjytKTZPw==
X-Received: by 2002:a54:4593:0:b0:2ec:d27f:eec1 with SMTP id z19-20020a544593000000b002ecd27feec1mr3173830oib.257.1648750787760;
        Thu, 31 Mar 2022 11:19:47 -0700 (PDT)
Received: from bertie (072-190-140-117.res.spectrum.com. [72.190.140.117])
        by smtp.gmail.com with ESMTPSA id e8-20020a9d63c8000000b005b235a56831sm112550otl.49.2022.03.31.11.19.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 11:19:47 -0700 (PDT)
Date: Thu, 31 Mar 2022 13:19:45 -0500
From: Rebecca Mckeever <remckee0@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH] staging: r8188eu: remove handlerOS independent comment
Message-ID: <YkXwwfYBE+P0UObq@bertie>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The "need to make timeout handlerOS independent" comment is incorrect.
Remove the comment to avoid misleading developers.

Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Rebecca Mckeever <remckee0@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 859ec8d8ad9e..99fc1904ec52 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -1408,7 +1408,6 @@ void rtw_survey_cmd_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
 
 	if (pcmd->res == H2C_DROPPED) {
 		/* TODO: cancel timer and do timeout handler directly... */
-		/* need to make timeout handlerOS independent */
 		_set_timer(&pmlmepriv->scan_to_timer, 1);
 	} else if (pcmd->res != H2C_SUCCESS) {
 		_set_timer(&pmlmepriv->scan_to_timer, 1);
-- 
2.32.0

