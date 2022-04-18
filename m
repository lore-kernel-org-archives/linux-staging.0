Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422F1A29;
	Mon, 18 Apr 2022 17:12:58 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id j8so12815149pll.11;
        Mon, 18 Apr 2022 10:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dTfclv02OOzOcblj7XsN4Ih/CQalStRiqrtD05ZRe5s=;
        b=gSYHgZsHWwk2aKf0awq92l919SNMPCc9mEUPi3Jt7IHtTT9437FEJIF0N9Q5Uh9LP9
         r4y0iVYWEn5oh+o+1so4N6hnjxuY/QrWEQfacIOhvjWPxnbeEY3lCEbbkUpyKRp/3ql4
         VyoMeFjcQ9pO3dLoM2S2nBFkwnirK/Yj6MX8iP9nGvI2lhxk0EjCIqHs0vQQM1pY5/My
         8/0Mg+9A7hnVLGQdt4U1r4VwzBRoE5h9vXc+qxQKRXeU14I/qKZhoCPqixtPRsdBGIqC
         OJ1eUhmG/vLxzP5OJHBZBGdZtr5LBtfJqvSdOfyPKIzgVV+b0ixe5KZKrNW96Fg91rq2
         Eeaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dTfclv02OOzOcblj7XsN4Ih/CQalStRiqrtD05ZRe5s=;
        b=R1oaZTcJViMNuSjdUr8/krSJ3+XBGMlZzMsD7/oyJLqH6J2xox9W+BSAlb/DhRrnOh
         1ezS2Ing6V4HnAsXSiaFkTQDTJFTIN+1d7goFZ4NyJxllWrdGkWUICK/21selj4yWVVx
         yUCWLsmsdzEzay87ReJrz83JzFULBFzHrVis0pe504pQx4Jgx/JLDbFsaPzlsBG0z4QX
         0nRn7tKhGgY30BKk/W6KoLHqpkYMtSRX+G+QgJlKWDR9YINm8fzC0hhOVNasT5NaeDMc
         pZJhfoy+9w4KDIURyQhtFWT86qHKVgr0JtCLDtnqDFKVhoeU5zu6iyKA9OcjwsSDLU8A
         s5Ng==
X-Gm-Message-State: AOAM530ooCraFHAo8E9yuoKWC4pfut9/Un4pzYNG+zSnQMxV6Dya4xbk
	EFIn7ZwYYlezo1pFl9WAnHo=
X-Google-Smtp-Source: ABdhPJz4DC4B6xU9TuyvStBcxOz4sQXJ6bzv+81lnpHQ9IuZsVmEg2TRquLbZXyBq9GzaDDLEPHvyQ==
X-Received: by 2002:a17:903:11c7:b0:154:b936:d1d4 with SMTP id q7-20020a17090311c700b00154b936d1d4mr12090065plh.78.1650301977627;
        Mon, 18 Apr 2022 10:12:57 -0700 (PDT)
Received: from aliyar-HP-Laptop-15-da1xxx.domain.name ([14.139.241.88])
        by smtp.gmail.com with ESMTPSA id t63-20020a625f42000000b0050a7eaff8c9sm3636063pfb.189.2022.04.18.10.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 10:12:57 -0700 (PDT)
From: Aliya Rahmani <aliyarahmani786@gmail.com>
To: mchehab@kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aliya Rahmani <aliyarahmani786@gmail.com>
Subject: [PATCH] staging: media: av7110: remove redundant space after cast
Date: Mon, 18 Apr 2022 22:39:02 +0530
Message-Id: <20220418170900.16725-1-aliyarahmani786@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the unnecessary space immediately after a cast. Identified by
checkpatch: CHECK: No space is necessary after a cast.

Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>
---
 drivers/staging/media/av7110/av7110_av.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/av7110/av7110_av.c b/drivers/staging/media/av7110/av7110_av.c
index 91f4866c7e59..df41d2ce1ed7 100644
--- a/drivers/staging/media/av7110/av7110_av.c
+++ b/drivers/staging/media/av7110/av7110_av.c
@@ -93,7 +93,7 @@ int av7110_record_cb(struct dvb_filter_pes2ts *p2t, u8 *buf, size_t len)
 
 static int dvb_filter_pes2ts_cb(void *priv, unsigned char *data)
 {
-	struct dvb_demux_feed *dvbdmxfeed = (struct dvb_demux_feed *) priv;
+	struct dvb_demux_feed *dvbdmxfeed = (struct dvb_demux_feed *)priv;
 
 	dvbdmxfeed->cb.ts(data, 188, NULL, 0,
 			  &dvbdmxfeed->feed.ts, NULL);
-- 
2.25.1

