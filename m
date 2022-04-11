Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7165F1363
	for <linux-staging@lists.linux.dev>; Mon, 11 Apr 2022 10:21:59 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id w7so14172194pfu.11
        for <linux-staging@lists.linux.dev>; Mon, 11 Apr 2022 03:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ioOLOPRMwxuocGQiKn3ZypvnZg8gicvD1hlKV7CC/G0=;
        b=WScTtEoPg8rfuBUuUvYtHKVp0wwTmhBMdvNJ3OF1NaBNKpunV+yblivfIzRpwSEYLO
         TC41U82zJnuLIx/l60Ou+clbet6SWmkwv3PDiX46bnipEQ588owetbfOSiDDxftyt+zd
         Dbp+0eWhV54Hs1gwrQ6aOFn9aZAmpjAt9ek/qzC66ynoDPt+YF31lN5hMsIcIbygMizh
         DBrDu4qbfylwp04MCHBSXuZK4yy+DLfI+TNGr4sOzl+OK3qfFz/3yXzICxlLCYA0Mqs9
         1k40WYjdwGckv3bWdF8GvCp3GX2bK/0muGVGJC3KYH8i9v/gQ5BFRvigKCscFqmTuaFD
         oUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ioOLOPRMwxuocGQiKn3ZypvnZg8gicvD1hlKV7CC/G0=;
        b=Z5bFEel3KjnClCYShFYo7MFtFgqbTxeFhhlD7061jYdC5XvxyAZjG8pa2PKFmh3xqW
         fBRR11T444b8FbhzQb2u8mq2SAjzwa33lGSNUYbv2CyBCWsNFuhIgJwirCUBggtc1TKv
         aEv8h6PA8Z8udUUWSWYEqsPGC4En3+ay9dfqtrub1SU80LybVdFpcpFP7GQLD/m3NFlr
         04nq72fwXI6qPQFOZO+Bv10jM7KP4AUPU89gmUy9mXWZyrIr5d7lFVo5a7146/VTWtpY
         0sR7zXDEPhcodjuSLvGrceaftC4oECsHmgvDWGL15lJSJhUE1uYLs5GD99ZK90VGgrd0
         m9rA==
X-Gm-Message-State: AOAM530q6HUygPF6N0Mgx55hlnJPOZatJOAtqFkQ0pu8T3HGMVxTewgK
	3/NijMtdtJXBfoZhJj3HqCo=
X-Google-Smtp-Source: ABdhPJxWW43ktUsUtlSzuScY28viShh0aFgK9c2HjNrjsN6GhUbKT3q7NqL0ND9Nn5oRS3U56JX9yQ==
X-Received: by 2002:a65:47c4:0:b0:39d:4f85:40e0 with SMTP id f4-20020a6547c4000000b0039d4f8540e0mr4041654pgs.309.1649672518843;
        Mon, 11 Apr 2022 03:21:58 -0700 (PDT)
Received: from makvihas.localhost.com ([2405:201:202b:15:4376:c658:ae1e:1781])
        by smtp.gmail.com with ESMTPSA id z14-20020a17090a170e00b001cb7e69ee5csm4886318pjd.54.2022.04.11.03.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 03:21:58 -0700 (PDT)
From: Vihas Makwana <makvihas@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Vihas Makwana <makvihas@gmail.com>
Subject: [PATCH v2 1/7] staging: r8188eu: drop unnecessary wrapper _rtw_free_cmd_priv
Date: Mon, 11 Apr 2022 15:51:30 +0530
Message-Id: <20220411102136.14937-2-makvihas@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220411102136.14937-1-makvihas@gmail.com>
References: <20220411102136.14937-1-makvihas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop unnecessary wrapper _rtw_free_cmd_priv and move its logic to
rtw_free_cmd_priv.

Signed-off-by: Vihas Makwana <makvihas@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index f036a980e..d53217900 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -87,14 +87,6 @@ void rtw_free_evt_priv(struct	evt_priv *pevtpriv)
 	}
 }
 
-static void _rtw_free_cmd_priv(struct cmd_priv *pcmdpriv)
-{
-	if (pcmdpriv) {
-		kfree(pcmdpriv->cmd_allocated_buf);
-		kfree(pcmdpriv->rsp_allocated_buf);
-	}
-}
-
 /* Calling Context:
  *
  * rtw_enqueue_cmd can only be called between kernel thread,
@@ -159,7 +151,10 @@ u32 rtw_init_evt_priv(struct evt_priv *pevtpriv)
 
 void rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv)
 {
-	_rtw_free_cmd_priv(pcmdpriv);
+	if (pcmdpriv) {
+		kfree(pcmdpriv->cmd_allocated_buf);
+		kfree(pcmdpriv->rsp_allocated_buf);
+	}
 }
 
 static int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
-- 
2.30.2

