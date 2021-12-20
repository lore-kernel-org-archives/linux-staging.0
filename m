Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC1129CA
	for <linux-staging@lists.linux.dev>; Mon, 20 Dec 2021 20:25:29 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id x15so43289428edv.1
        for <linux-staging@lists.linux.dev>; Mon, 20 Dec 2021 12:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2AYLI7JdI7TbMwlaYryTUxSOZm+WGuEnbMb6+8ROGO4=;
        b=Fnvq83+DsdfkVRSWhjEyhen1P7OhEyRFkwlKmJG3NrTis1dNBb6to4Sfn8+1TUPXzU
         Dz6FGj43pmiLx3wO9RgIijSOto5BUFBq6W5Te9HIBgQIsdd1A495IAeC57RayheM65y4
         cBzGxP1tEJxXhpKzFmlr6dcr6ErN5qkEaFhIUOXAyRDXFTN3yyuTh2gBJ5+JghBJO/6U
         mxF0HF6MIF5QB/TOYJtRdD4Imdmwhh/XqenKfTejRLMQpM3H7TqQQ16KMKNoTQlE+2pz
         14fcbQGRf6lY7ZeVUmippQ5kjB4eGH1d8Utt528KmWqLKH9XUYJTslI+DNvHxCdP/yCm
         Hhig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2AYLI7JdI7TbMwlaYryTUxSOZm+WGuEnbMb6+8ROGO4=;
        b=gB1G0q6BZpqs2EbnMLLvuW3dgSDzyM4IXoRKWn4yFm3bYNMnczWwXsDJUcA55vo+uk
         Gfbln/sxjYWJ29XsG+dH8vYbyUYkrjf4i4ELXCu3zNC5rmG/M/rViXaltJK+9F8rXpRW
         hwAtwg1sy5X+FxXXlW0Vyld2eb3OjNhaqKAK7kcFwoMK5OXJx59VCxp1Gxy+3P58nBJn
         Dq6w7pvsMberdjd7H6I1Pl6TzV+Z0NTxDfLxkZ4/m68DEMA4pwX8iHkGw4ZRSYJBP1b3
         PSw2TKv3EeKIv8HNHar2PGlL6NqRtf5M9LRXoiS2ldjhuogw2W3xuiyqEauh7AxSuhay
         vGDA==
X-Gm-Message-State: AOAM531wK9upeCmIECie8sVCw1rmLlF49jv+gJlJv+mv1rjC2bCGQuq6
	z8K4I0B1F3dwkOtsIJQQ+kA=
X-Google-Smtp-Source: ABdhPJzDmYaOTUfFDV/rudT38TnvrnSN7mvowKXpxM4hKADww7K7BbIp+GIEo/E7ZI9cn0hSlEgGDA==
X-Received: by 2002:a17:907:60c9:: with SMTP id hv9mr5154325ejc.681.1640031928052;
        Mon, 20 Dec 2021 12:25:28 -0800 (PST)
Received: from tom-desktop.station (net-93-151-129-173.cust.dsl.teletu.it. [93.151.129.173])
        by smtp.gmail.com with ESMTPSA id ji16sm135681ejc.114.2021.12.20.12.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 12:25:27 -0800 (PST)
From: Tommaso Merciai <tomm.merciai@gmail.com>
To: 
Cc: tomm.merciai@gmail.com,
	linuxfancy@googlegroups.com,
	Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Karolina Drobnik <karolinadrobnik@gmail.com>,
	=?UTF-8?q?Aldas=20Tara=C5=A1kevi=C4=8Dius?= <aldas60@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: vt6655: drop off byRxMode var in device.h
Date: Mon, 20 Dec 2021 21:25:20 +0100
Message-Id: <20211220202523.21805-1-tomm.merciai@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop off unused variable byRxMode in device.h, this fix following
checkpatch.pl check:
CHECK: Avoid CamelCase: <byRxMode>
131: FILE: drivers/staging/vt6655/device.h:131:
unsigned char byRxMode

Signed-off-by: Tommaso Merciai <tomm.merciai@gmail.com>
---
Changes since v1:
 - Remove trailing whitespace in changelog as suggested by gregkh

 drivers/staging/vt6655/device.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/vt6655/device.h b/drivers/staging/vt6655/device.h
index 4706bde1ec1d..84b1dcf80e47 100644
--- a/drivers/staging/vt6655/device.h
+++ b/drivers/staging/vt6655/device.h
@@ -128,8 +128,6 @@ struct vnt_private {
 	u32                         memaddr;
 	u32                         ioaddr;
 
-	unsigned char byRxMode;
-
 	spinlock_t                  lock;
 
 	volatile int                iTDUsed[TYPE_MAXTD];
-- 
2.25.1

