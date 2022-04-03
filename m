Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E5C7C;
	Sun,  3 Apr 2022 19:17:16 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id a17-20020a9d3e11000000b005cb483c500dso5888145otd.6;
        Sun, 03 Apr 2022 12:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zZOpoW+EgxvMAo7hvmBoOUeiQEc5COuYjcGcZDOKzLc=;
        b=JQK1FwAb9d8bTgZVd7v9+TEI8+adbyUbMJ5BEuAaJsT0lGtcNpU2uyNrENyCyfk1hC
         081WHP4dXs60RAGaLrweRKW2n2Lx2/vmpjO7aWMwBRln654nYBlMBYGocuuA+eEZn75V
         HZuhkr8Yche0813E2nDbH//ZXW2MV+tCQITD9syD5I2l2wE27vCQ+YYyHzGUcRvHLx91
         L0wLk1lkbWLV8gqPU7ooFUebiAcwQBwKGNxg0v5RRmQLwCWcA9J/aDYefl2n9rpR/4FX
         JP0xBTuXJ9w1hUA5KTQXRjt75oFCHRg0yLstvgxasV4KQbWdcOS6k0/T1Fd5ulGq1qE5
         FZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zZOpoW+EgxvMAo7hvmBoOUeiQEc5COuYjcGcZDOKzLc=;
        b=Sro2EW+rAsemi/rgVbl/baP7eVR2+gp12+7HErnDRAjnQ7njh/pvC3+Ggfg/XwAbIL
         Nj3bvXd83OXox0Ov2//QWfcey/Eo4uwA/wc52M6fNiBcT4g3A8lGZjZdEgrPno3jWrvf
         ofXy4OvTNVB36nDl47dIgap+QGF/B0kahwG5+7BeNW4moThGcGSY27/NuVSltQ9jktHN
         WXYcTp6ELBddTI/z01IrLdnzE9aGvGNMOWS1rayWatipjfkNnlIs/1EDKFSM1nuFTYGx
         uqmwUciQusMTUzDSaQxXxILOICM9kRjwfSrCR2rqwr9Oo5JHoWI6F5QAAkhL9JECSPJM
         yaRA==
X-Gm-Message-State: AOAM533LhKhdBmcZbZd+AaIL3IJc1cdpDhId6TdQjx1MBfB/h55hwFM6
	vyFzy50W71tUYjW0pzD0Epo=
X-Google-Smtp-Source: ABdhPJyjmxClNgj0VKMCSAgVoFaHxPSSnWmsCRFSbROZnjNlk493xlFpDF25J2s1BXfg5F1yQiWMLQ==
X-Received: by 2002:a05:6830:907:b0:5c9:54e8:8e0a with SMTP id v7-20020a056830090700b005c954e88e0amr10711310ott.103.1649013436199;
        Sun, 03 Apr 2022 12:17:16 -0700 (PDT)
Received: from bertie (072-190-140-117.res.spectrum.com. [72.190.140.117])
        by smtp.gmail.com with ESMTPSA id r23-20020a056830237700b005b2610517c8sm3808634oth.56.2022.04.03.12.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 12:17:15 -0700 (PDT)
From: Rebecca Mckeever <remckee0@gmail.com>
To: outreachy@lists.linux.dev
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rebecca Mckeever <remckee0@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 1/3] staging: r8188eu: remove handlerOS independent comment
Date: Sun,  3 Apr 2022 14:17:04 -0500
Message-Id: <7d0d2253d86f46bc0def0447de424727d70f03a7.1649011311.git.remckee0@gmail.com>
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

The "need to make timeout handlerOS independent" comment is incorrect.
Remove the comment to avoid misleading developers.
Additional instance found with git grep.

Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Rebecca Mckeever <remckee0@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 8b24330e97c1..da455eb4d8cb 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -1447,7 +1447,6 @@ void rtw_joinbss_cmd_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
 
 	if (pcmd->res == H2C_DROPPED) {
 		/* TODO: cancel timer and do timeout handler directly... */
-		/* need to make timeout handlerOS independent */
 		_set_timer(&pmlmepriv->assoc_timer, 1);
 	} else if (pcmd->res != H2C_SUCCESS) {
 		_set_timer(&pmlmepriv->assoc_timer, 1);
-- 
2.32.0

