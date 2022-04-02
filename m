Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3E31363;
	Sat,  2 Apr 2022 08:51:14 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id k10so5121036oia.0;
        Sat, 02 Apr 2022 01:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MnmEBkloSHxQt/4YP7PohGytgpfueUHdKvsK8QotGQ0=;
        b=bSUF+T6m6TZymW/6Wb3e8wkKFvcZMEkZvwlXT+EzejOuvoApmEaDlLRib5EjIP5xBp
         LHZjSri2RAUbsK0VbAujyS5fmXDRCCSxqgs2FzLzkVXnsKMHpeg6pdGdOIFlGEgmI4Ju
         /OihV5mpOOlvMAPKev2s7vQTIOAakWpFrk40DXNLPrT6H2HSREZ4orVymdr/n4zjXxth
         IQgRWyzFBVFrHZjAt2AsaSnbEJuLjCidXcEFk8JTWvlIxyeP6xAEVqe1/p0HmnP30U/B
         1yy+NbCsSXOX9MWaX+fpUzhlnkvMInsRpeDg8WWeqnnaVdRoQewnQFG1rehzWpbljkKj
         8M2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MnmEBkloSHxQt/4YP7PohGytgpfueUHdKvsK8QotGQ0=;
        b=oZ2RbltE1yUQbdsgBtSc2pLkHS4xSqlOByI38IKfzwRmRhg99Y5tWoXdD5ku9et99F
         pQY80uHNi2hi0O7EMsM4WK1f9zhkC7wvSSYL1U91Lxw8IQTrqKW6rFwKSqbsbsCP5tnS
         cZL6W4BOb7zVKIBp88zZvF7XlMZBALHOu1ymUSm12LcOe+dM5wOy39YGvvAf5LHnmk4x
         USA4Yf0Pwg30ijCqFRUMFneEQa9rLH9FjZP9tOVZ6PObIU1WL775ewloo7mtiZSqJRvW
         jQa5m8E+6aQJOwUjkyy+bTCpDI0WQNzgpsGRd2UI5sMQlIza8lp++Xk4XfonYcA3IplG
         P6Rw==
X-Gm-Message-State: AOAM533d6sBB+IYdOCyLdZRom+OyIwRhhVTSIkM3SdERpSnYEH26c0gD
	4elXznbyQJ2ZnZXrR3DuWVBT883UkBbnXA==
X-Google-Smtp-Source: ABdhPJx9yj1rO/Fdh8dSjci4ZXIejhpZSiiX374O4S5O1esXJBrQRrMtoB1jCwL7nKArO6F3UoeXHg==
X-Received: by 2002:a05:6808:ec3:b0:2ef:895e:752a with SMTP id q3-20020a0568080ec300b002ef895e752amr6373419oiv.12.1648889473986;
        Sat, 02 Apr 2022 01:51:13 -0700 (PDT)
Received: from bertie (072-190-140-117.res.spectrum.com. [72.190.140.117])
        by smtp.gmail.com with ESMTPSA id x18-20020a056830245200b005ce01c28c77sm2108550otr.1.2022.04.02.01.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 01:51:13 -0700 (PDT)
From: Rebecca Mckeever <remckee0@gmail.com>
To: outreachy@lists.linux.dev
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Rebecca Mckeever <remckee0@gmail.com>
Subject: [PATCH 2/6] staging: r8188eu: remove else after return
Date: Sat,  2 Apr 2022 03:50:44 -0500
Message-Id: <84db0348481b54f58cb0b6200fa9ae471ee06b3b.1648888461.git.remckee0@gmail.com>
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

WARNING: else is not generally useful after a break or return

Signed-off-by: Rebecca Mckeever <remckee0@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 3b282c387282..09fde5b23ce2 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -1427,8 +1427,10 @@ void rtw_disassoc_cmd_callback(struct adapter *padapter, struct cmd_obj *pcmd)
 		spin_unlock_bh(&pmlmepriv->lock);
 
 		return;
-	} else /* clear bridge database */
-		nat25_db_cleanup(padapter);
+	}
+
+	/* clear bridge database */
+	nat25_db_cleanup(padapter);
 
 	/*  free cmd */
 	rtw_free_cmd_obj(pcmd);
-- 
2.32.0

