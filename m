Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D874F137B
	for <linux-staging@lists.linux.dev>; Sun, 14 May 2023 03:09:52 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1aaf7067647so78223175ad.0
        for <linux-staging@lists.linux.dev>; Sat, 13 May 2023 20:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684033792; x=1686625792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i/y2Q9D0CfiPbFjFqVeY6UhKR07Cv8DHbxpO7JqJ2YI=;
        b=NY3eZzfl62OfyDFlsWmAkeZIOqL8aEQS0lt11umcLuzSUSIOZUtGPpbqwxo1mTLmX2
         AjhBR7CdzjzqqOxACqzuyoF31PL8ljXafbKf4Ra0Zu36F6qPpGjl3+cnt+e4S77tI0Nb
         yuSQFU9+lGLaPxaHLi55jemfG5vvAo254w973pURlMoNMzm5M8Lz0ytpq5PxpJJg5DD4
         iNbX+NtvYPqQrKHkjFVXgCl3OBV3Dvu+0MbnU93qYH6uKBEDhut8InyAzeKAycH6ukPK
         euY+Kv/Y8rY7//drIuXZjNPY5TaHfL8fUrjMJNvNHf3SYvmNeVqeiAilHPZb+HH/rpck
         Qthw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684033792; x=1686625792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i/y2Q9D0CfiPbFjFqVeY6UhKR07Cv8DHbxpO7JqJ2YI=;
        b=NIu5eYOKutOO7FvtuHhJR9vP0pySqA1g5L/p5ham2C4btHAiUq0Kb+6+4I9Jl9pfpz
         +usMb7rtrQ7+91yzEZovveEXJ6aGtX/qJM3NYguKvGqcgqJ7NaqMRO9vkhAlizGe9cYI
         OM8Pj0d+Djn8Jv7p9W0zt6GwM0PEsf2yF+8ny6yJuY3S0VvNA3u+OvOCsEsMKvaGV9Ve
         Qw8QWvVLKdAAdj2caBkYgaH/P/LxaLqiHsTizqbH9EH0TlSWLqjEQHQ1IubexfTil26p
         XxOdgRmU+cDbWQtz2wLk7QwSmZrSU4RmFFEFwh3/VIT+mSHdEtOt8AUo/5qji6V03UEr
         qYnQ==
X-Gm-Message-State: AC+VfDxzklkmEszksZcdnRjmxvgDyYoxbNljGktUNglOqhhOsh5NYo1w
	rFKKma+zlY/fldRi7nCxjiM=
X-Google-Smtp-Source: ACHHUZ4yzDyb3+1MJW6BO1BvzSA+zsUs6/q4VKM8nhZmLQgEwJoUXDmy5/k027R+RymdbL6dhFb3jA==
X-Received: by 2002:a17:902:d486:b0:1ad:d2b1:3faf with SMTP id c6-20020a170902d48600b001add2b13fafmr11320550plg.21.1684033792230;
        Sat, 13 May 2023 20:09:52 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:682f:3808:354c:21fc:fb33:cae9])
        by smtp.gmail.com with ESMTPSA id p15-20020a170902b08f00b001add653dba2sm5095575plr.108.2023.05.13.20.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 May 2023 20:09:51 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>
Subject: [PATCH] Staging: rts5208 :rtsx : fixed  a brace coding style issue
Date: Sun, 14 May 2023 08:39:40 +0530
Message-Id: <20230514030940.4820-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed  a coding style issue

Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/staging/rts5208/rtsx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rts5208/rtsx.c b/drivers/staging/rts5208/rtsx.c
index 2284a96abcff..0ab9355873f7 100644
--- a/drivers/staging/rts5208/rtsx.c
+++ b/drivers/staging/rts5208/rtsx.c
@@ -399,10 +399,8 @@ static int rtsx_control_thread(void *__dev)
 				chip->srb->device->id,
 				(u8)chip->srb->device->lun);
 			chip->srb->result = DID_BAD_TARGET << 16;
-		}
-
-		/* we've got a command, let's do it! */
-		else {
+		} else {
+			//we've got a command, let's do it!
 			scsi_show_command(chip);
 			rtsx_invoke_transport(chip->srb, chip);
 		}
-- 
2.25.1

