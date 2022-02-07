Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA94F2F26
	for <linux-staging@lists.linux.dev>; Mon,  7 Feb 2022 04:42:48 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id 4so15689999oil.11
        for <linux-staging@lists.linux.dev>; Sun, 06 Feb 2022 20:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9B7hEs0KWcQeTdm4T9H3BJwl4p0pXjpU9Q2BlklK5nw=;
        b=ogHtHZj5pYia9KG+9lnOx+hJUMVnASvfP2FaPZEG2F1hARL0ApwxjQ9fYXzFhdXe+w
         34eaBy8AGjbXUWPk7izMMi5b6gTWfr4/dJxp5rzqd/3maLLnmDXsUoEtgi/Bv67F3/E4
         qA68/1GFCvE5S9vQNq+E+noZH8k3MDZLsn+nXeprmVzS0tXxi3Ft1zSb/GRJa/SiYMyX
         BlEqtHX7AbkvcmLfkvrliCn039B9Q4pXQ+FAzMiDWx8TLD5H7rPZ3f3b6PlHcj6CctNP
         gQbUbYO8QNa+VUU2ar6zZrlQ0R3tcFTG1z8P7IkYaHPoGSn52swUTZCKEr/MSGEOVG7Q
         9OEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9B7hEs0KWcQeTdm4T9H3BJwl4p0pXjpU9Q2BlklK5nw=;
        b=aoj1ex6xzx5S6gYu/4oKh/SqgJQO9EQ2S6/u5h/QSYKboOmnYavjIKCrIMuRvDpZ92
         pBlqk+iVMCWOL9gnOZG5c+ODV5HEbGJf/jqGp0StDEyuzZxpX53FWOOY28yDt1GFBYvc
         ASWgAoPWI04AusBpvfz2Y4HWezXkApRQZK3/KvZnrhqMzzwjaFf1uPO+tK2HzNtE5nKH
         vM1MItSIgyzQf6ZJ1WHzm+fC3ZYrC1jsb4Cfqi8s+yCSg2dfobzg5HVUPAVoL92UpcJX
         YIipzm8aTSO+EleVA6BViAfKkxbs9qvxgVkT6FDwIvvk5IMTZMe6ZbRR/M3jM+PgDo3/
         48pA==
X-Gm-Message-State: AOAM532exOl1qSmzDyAJKdF8uyfrQ97zIWZcK8jpCsahHZM6SoAYDU7+
	qftHFM9xO8d62/UEjGZ8/D0=
X-Google-Smtp-Source: ABdhPJxu2M2k7b/YsVOzH6NSYTjv7KOW6x56V4qPUAjyREt2tF9FM+ULRbOweDMT/chJW/bYqeQsiA==
X-Received: by 2002:a05:6808:2188:: with SMTP id be8mr4597474oib.63.1644208967876;
        Sun, 06 Feb 2022 20:42:47 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:4cd8:12bf:4134:806a:5a4a:2a88])
        by smtp.gmail.com with ESMTPSA id f21sm3515752otq.4.2022.02.06.20.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 20:42:47 -0800 (PST)
From: Leonardo Araujo <leonardo.aa88@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	sparmaintainer@unisys.com,
	Leonardo Araujo <leonardo.aa88@gmail.com>
Subject: [PATCH] Staging: unisys: visorhba: alignment should match open parenthesis
Date: Mon,  7 Feb 2022 01:42:30 -0300
Message-Id: <20220207044230.19918-1-leonardo.aa88@gmail.com>
X-Mailer: git-send-email 2.29.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed a coding style issue.

Signed-off-by: Leonardo Araujo <leonardo.aa88@gmail.com>
---
 drivers/staging/unisys/visorhba/visorhba_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/unisys/visorhba/visorhba_main.c b/drivers/staging/unisys/visorhba/visorhba_main.c
index 8eee131e834d..48aa18f8b984 100644
--- a/drivers/staging/unisys/visorhba/visorhba_main.c
+++ b/drivers/staging/unisys/visorhba/visorhba_main.c
@@ -192,7 +192,7 @@ static struct uiscmdrsp *get_scsipending_cmdrsp(struct visorhba_devdata *ddata,
  * @result:   The location to place the result of the event handle into
  */
 static int setup_scsitaskmgmt_handles(struct xarray *xa, struct uiscmdrsp *cmdrsp,
-				       wait_queue_head_t *event, int *result)
+				      wait_queue_head_t *event, int *result)
 {
 	int ret;
 	u32 id;
-- 
2.29.0

